class DoctorsView
  def ask_name
    puts 'Enter doctor name:'
    gets.chomp.strip
  end

  def list(doctors)
    system 'clear'  # This don't work in rake specs
    puts 'Doctors List'
    doctors.each do |doctor|
      puts "Doctor: #{doctor.name}"
    end
    puts '-' * 30
    puts "\n\n"
    puts 'Press enter to continue...'
    gets  # This don't work in rake specs
  end
end
