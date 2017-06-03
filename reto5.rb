load 'custom_errors.rb'

class Reto5
  attr_reader :name

  @@scores_table = []

  def initialize name
  	self.name= name
  	@questions_array = charge_questions "questions.txt"
    print_questions
  end
  private
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
end

