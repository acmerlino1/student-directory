require 'csv'
@students = []

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students(filename)
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
    name, cohort = row
    add_students(name, cohort)
  end
end

def save_students
  puts "Which file do you want to save the students to?"
  filename = gets.chomp
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def input_students
  while true do
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    if name.empty?
      break
    end
    add_students(name, cohort)
    puts @students.count ==1 ? "Now we have #{@students.count}
    student" : "Now we have #{@students.count} students"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      puts "Option 1 was selected successfully"
      input_students
    when "2"
      puts "Option 2 was selected successfully"
      show_students
    when "3"
      puts "Option 3 was selected successfully"
      save_students
    when "4"
      puts "Option 4 was selected successfully"
      puts "which file do you want to load the students from?"
      filename = gets.chomp
      try_load_students(filename)
    when "9"
      puts "Option 9 was selected successfully"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def cohort
  months = {
    "january" => :january,
    "february" => :february,
    "march" => :march,
    "april" => :april,
    "may" => :may,
    "june" => :june,
    "july" => :july,
    "august" => :august,
    "september" => :september,
    "october" => :october,
    "november" => :november,
    "december" => :december
  }
  puts "Please enter the students cohort"
  while true do
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = "november"
    elsif months[cohort] == nil
      puts "There seems to be a spelling mistake, please re-enter cohort"
      next
    end
    return months[cohort]
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if !@students.empty?
    puts "Overall, we have #{@students.count} great students"
  end
end

if ARGV.empty?
  load_students
else
  try_load_students(ARGV.first)
end
interactive_menu
