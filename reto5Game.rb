load "reto5.rb"

loop do
  reto5 = nil;  
  #init Reto5 game
  loop do
  	begin 										
    	received_name = Reto5::ask_name
  		reto5 = Reto5.new received_name
  	rescue NameIsEmpty => e 					
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

  #start game
  loop do
    begin
      reto5.start_game  #try start game  
    rescue NotValidAnswer => e
      puts "Error: #{e}"
    else
      reto5.end_game
      break;
    end
  end

  #Play RETO5 again?
  loop do
    begin
      Reto5::play_again? ? break : exit  
    rescue NotValidAnswer => e
      puts "Error: #{e}"
    else
      break;  #break the principal loop
    end
  end
end



