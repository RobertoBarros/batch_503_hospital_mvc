require_relative '../views/rooms_view'

class RoomsController
  def initialize(room_repository, patient_repository)
    @room_repository = room_repository
    @patient_repository = patient_repository
    @view = RoomsView.new
    @patients_view = PatientsView.new
  end

  def create
    number = @view.ask_number
    capacity = @view.ask_capacity
    room = Room.new(number: number, capacity: capacity)
    @room_repository.add(room)
  end

  def assign_patient_to_room
    list
    room_number = @view.ask_room_number
    room = @room_repository.find_by_number(room_number)

    patients = @patient_repository.all
    @patients_view.list(patients)

    patient_index = @patients_view.ask_patient_index
    patient = @patient_repository.find(patient_index)

    room.add_patient(patient)

  end

  def list
    rooms = @room_repository.all
    @view.list(rooms)
  end
end