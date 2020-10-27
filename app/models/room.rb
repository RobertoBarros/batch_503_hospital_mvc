class Room
  attr_reader :number, :capacity, :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @number = attributes[:number]
    @capacity = attributes[:capacity] || 0
    @patients = []
  end

  def add_patient(patient)
    @patients << patient
    patient.room = self
  end
end

# room42 = Room.new(number: 42, capacity: 3)
# roberto = Patient.new(name: 'Roberto', age: '25')


# room42.add_patient(roberto)