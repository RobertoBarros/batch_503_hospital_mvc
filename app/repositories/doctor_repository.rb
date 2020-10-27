require_relative '../models/doctor'

class DoctorRepository
  CSV_OPTIONS = {headers: :first_row, header_converters: :symbol}

  def initialize(csv_file)
    @csv_file = csv_file
    @doctors = []
    load_csv
  end

  def add(doctor)
    @doctors << doctor
    save_csv
  end

  def all
    return @doctors
  end

  def load_csv
    CSV.foreach(@csv_file, CSV_OPTIONS) do |row|
      doctor = Doctor.new(name: row[:name])
      @doctors << doctor
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb', CSV_OPTIONS) do |file|

      file << %i[name] # CSV HEADER

      @doctors.each do |doctor|
        file << [doctor.name]
      end
    end
  end


end