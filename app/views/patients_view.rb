class PatientsView
  def ask_name
    puts 'Enter patient name:'
    gets.chomp.strip
  end

  def ask_age
    puts 'Enter patient age:'
    gets.chomp.to_i
  end

  def ask_patient_index
    puts 'Enter patient index'
    gets.chomp.to_i - 1
  end

  def list(patients)
    system 'clear' # This don't work in rake specs
    puts 'Patients List'
    patients.each_with_index do |patient, index|
      puts "#{index + 1} - Name: #{patient.name} | #{patient.age} years | Room: #{ patient.room&.number } "
    end
    puts '-' * 30
    puts "\n\n"
    puts 'Press enter to continue...'
    gets  # This don't work in rake specs
  end
end
