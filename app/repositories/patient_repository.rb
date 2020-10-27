require_relative '../models/patient'

class PatientRepository
  CSV_OPTIONS = {headers: :first_row, header_converters: :symbol}

  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @room_repository = room_repository
    @patients = []
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    save_csv
    @next_id += 1
  end

  def find(index)
    @patients[index]
  end

  def all
    @patients
  end

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      patient = Patient.new(id: row[:id].to_i, name: row[:name], age: row[:age].to_i)

      room_id = row[:room_id].to_i
      room = @room_repository.find_by_id(room_id)

      room.add_patient(patient)

      @patients << patient
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|

      file << %i[id name age room_id] # CSV HEADER

      @patients.each do |patient|

        file << [patient.id, patient.name, patient.age, patient.room.id]
      end
    end
  end

end