load 'custom_errors.rb'

class Reto5
  #Instance attributes
  attr_reader :name
  attr_accessor :score

  #Class attributes
  @@scores_chart = [{name: 'Thought', score: 1450},{name: 'Fisher', score: 1250},{name: 'Rondon', score: 1000}]

  #Constructor
  def initialize name
  	self.name= name         # Set the user name using the custom setter method
    #charge questions from file
  	@questions_array = charge_questions "questions.txt"
    @score = 0              # init score variable
  end

  def start_game
    Reto5::show_banner_are_you_ready
    puts "ans: "
    ans = gets.chomp
    if ans == 'Y' || ans == 'y'
      @score = 0  #Reset score
      play_reto5  #Play game
    elsif ans == 'N' || ans == 'n'
      #Nothing to do
    else
      raise NotValidAnswer.new "Answer isn't correct"
    end
  end

  def end_game
    @@scores_chart << {name: name, score: score}  #Update scores_chart
    Reto5::show_banner_end_game
    Reto5::show_scores_chart
  end

  private

  #def name setter
  def name= name
    raise NameIsEmpty.new "Name must be different of nil or \"\"" if name == nil || name == "" 
    @name = name
  end

  def charge_questions file_name
    if File.file?(file_name)  && !File.zero?(file_name)     # ask if file exists and file isn't empty
      questions_array = []                                  # create one array to store each question extracted from file
      File.open(file_name, "r") do |f|                      # open file
        f.each_line do |line|                               # Get questions from each line of file
          line = line.gsub!(/[\n"]/,'')                     # https://stackoverflow.com/questions/21446369/deleting-all-special-characters-from-a-string-ruby
          question = line.split(';')                        # Split by ';' to get an array with one definition and one answer  
          if question.length == 2                           # evaluate line format
             questions_array  << {definition: question[0], answer: question[1]}
          else
             raise  QuestionsFileFormat.new "Question file doesn't have the correct format \"definition;answer\""
          end 
        end
      end 
      #print_questions #only in development
      questions_array
    else                                  # code if file doesn't exists
      raise QuestionsFileNoExistOrIsEmpty.new "Question file is empty or not exists"
    end
  end

  def play_reto5
    @questions_array.shuffle!   # Shuffle questions
    exit_flag = false           # flag to indicate that the user want finish the game
    @questions_array.each_with_index do |question,index|
      points = 0;               # Points reached in one question
      3.downto(1) do |attempt|
        puts '*' * 50
        puts "#{index+1}.Definition: #{question[:definition]} (Attempt:#{attempt})"
        puts "Ans: (write \'exit\' to finish)"
        ans = gets.chomp

        if ans == 'exit'
          exit_flag = true      # if user input 'exit'
          break
        elsif ans.downcase == question[:answer] #use downcase to normalize the answer
          points = 50 * attempt;
          break
        elsif attempt != 1 
          puts "Incorrect, please try again!"
        else
          puts "You lose!"
          puts "#{index+1}.Definition: #{question[:definition]} Answer: #{question[:answer]}"
        end
      end
      break if exit_flag == true

      @score += points  #Update score
      #Show score
      puts '*' * 50
      puts "\tYou win:\t#{points} points"
      puts "\tScore:  \t#{@score} points"
      puts '*' * 50
    end
  end

  #Method used in development mode
  def print_questions
    @questions_array.each { |e| puts "d: #{e[:definition]} a: #{e[:answer]}"  }
  end
  #----------------------------------------------------------------------------------------------
  #                                         Static methods
  #----------------------------------------------------------------------------------------------
  def self.ask_name
    #Show initial banner of Reto5
    Reto5::show_banner_welcome
    Reto5::show_banner_ask_name
    #Get name from user
    puts "Your name: "
    gets.chomp
  end

  def self.play_again?
    Reto5::show_banner_play_again
    puts "ans: "
    ans = gets.chomp
    if ans == 'Y' || ans == 'y'
      return true
    elsif ans == 'N' || ans == 'n'
      return false
    else
      raise NotValidAnswer.new "Answer isn't correct"
    end
  end

  def self.show_scores_chart 
    puts "\n"
    puts "*" * 50 + "\n" + "*" * 21  + " SCORES " + "*" * 21 + "\n" +  "*" * 50
    sorted_scores = @@scores_chart.sort_by { |e| e[:score]  }
    sorted_scores.reverse.each_with_index do |player,index|

      puts "#{player[:name]}"+ '-' * (50 - (player[:name].length + player[:score].to_s.length)) +"#{player[:score]}"
    end
    puts '*' * 50
    puts "\n"
  end

  #DRAW BANNERS
  def self.show_banner_welcome 
  	puts "*" * 50 + "\n" + "*" * 16 + " WELCOME TO RETO5 " +  "*" * 16 + "\n" +  "*" * 50
  end

  def self.show_banner_ask_name 
  	puts "*" * 50 + "\n" + "*" * 13 + " PLEASE INPUT YOUR NAME " +  "*" * 13 + "\n" +  "*" * 50
  end

  def self.show_banner_are_you_ready 
    puts "*" * 50 + "\n" + "*" * 10  + " ARE YOU READY TO RETO5?(Y/N) " + "*" * 10 + "\n" +  "*" * 50
  end

  def self.show_banner_end_game
    puts "*" * 50 + "\n" + "*" * 17 + " END RETO5 GAME " +  "*" * 17 + "\n" +  "*" * 50
  end

  def self.show_banner_play_again
    puts "*" * 50 + "\n" + "*" * 13 + " PLAY RETO5 AGAIN ?(Y/N) " +  "*" * 12 + "\n" +  "*" * 50
  end
end

