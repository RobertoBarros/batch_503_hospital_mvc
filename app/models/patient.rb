class Patient
  attr_reader :name, :age
  attr_accessor :id, :room

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
  end
end

# attributes = {name: 'Roberto', age: 20 }
# Patient.new(attributes)

# OR

# Patient.new({name: 'Roberto', age: 20})

# OR

# Patient.new(name: 'Roberto', age: 20)

# Patient.new(age: 20, name: 'Roberto')