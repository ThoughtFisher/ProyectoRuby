load 'custom_errors.rb'

class Reto5
  attr_reader :name

  @@scores_table = []

  def initialize name
  	self.name= name
  	@questions_array = charge_questions "questions.txt"
    @score = 0
    #print_questions #only in delopment
  end

  def start_game
    Reto5::show_banner_are_you_ready
    p "ans: "
    ans = gets.chomp
    if ans == 'Y' || ans == 'y'
      @score = 0
      play_reto5
    elsif ans == 'N' || ans == 'n'
      end_game
    else
      raise NotValidAnswer.new "Answer isn't correct"
    end
  end

  private

  def play_reto5
    @questions_array.shuffle!
    @questions_array.each_with_index do |question,index|
      points = 0;
      3.downto(1) do |attempt|
        puts "#{index+1}.Definition: #{question[:definition]} (Attempt:#{attempt})"
        puts "Ans:"
        ans = gets.chomp
        if ans == question[:answer] 
          points = 50 * attempt;
          break
        elsif attempt == 1
          puts "#{index+1}.Definition: #{question[:definition]} Answer: #{question[:answer]}"
        end
      end
      puts "You win: #{points} points"
      @score += points
      puts "Score: #{@score} points"
    end
  end

  def end_game
    puts "Provicional msn of end"
  end

  def charge_questions file_name
  	if File.file?(file_name)	&& !File.zero?(file_name)			# code if file exists and file isn't empty
      questions_array = []  # create one array to store each question extracted from file
  		File.open(file_name, "r") do |f|
  			f.each_line do |line|             #Get questions from each line of file
          line = line.gsub!(/[\n"]/,'')   #https://stackoverflow.com/questions/21446369/deleting-all-special-characters-from-a-string-ruby
          question = line.split(';')      
          if question.length == 2 
    			   questions_array  << {definition: question[0], answer: question[1]}
          else
             raise  QuestionsFileFormat.new "Question file doesn't have the correct format \"definition;answer\""
          end 
        end
  		end 
      questions_array
  	else									                # code if file doesn't exists
      raise QuestionsFileNoExistOrIsEmpty.new "Question file is empty or not exists"
  	end
  end

  def print_questions
    @questions_array.each { |e| puts "d: #{e[:definition]} a: #{e[:answer]}"  }
  end

  #def name setter
  def name= name
  	raise NameIsEmpty.new "Name must be different of nil or \"\"" if name == nil || name == "" 
  	@name = name
  end

  #Static methods
  def self.show_banner_welcome 
  	puts "*" * 50 + "\n" + "*" * 16 + " WELCOME TO RETO5 " +  "*" * 16 + "\n" +  "*" * 50
  end

  def self.show_banner_ask_name 
  	puts "*" * 50 + "\n" + "*" * 13 + " PLEASE INPUT YOUR NAME " +  "*" * 13 + "\n" +  "*" * 50
  end

  def self.show_banner_are_you_ready 
    puts "*" * 50 + "\n" + "*" * 10  + " are you ready to reto5?(Y/N) " + "*" * 10 + "\n" +  "*" * 50
  end
end

