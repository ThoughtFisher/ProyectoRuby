load "reto5.rb"

#Show initial banner of Reto5
Reto5::show_banner_welcome
loop do
	begin 										# something which might raise an exception
  	Reto5::show_banner_ask_name
  	#Get name from user
  	p "Your name: "
		received_name = gets.chomp
		reto5 = Reto5.new received_name
	rescue NameIsEmpty => e 					# code that deals with some exception
		puts "Error: #{e}"
	rescue QuestionsFileFormat => e
		puts "Error: #{e}"
    exit
	rescue QuestionsFileNoExistOrIsEmpty => e
		puts "Error: #{e}"
    exit
	else
		break;
	end
end


