@students = []

def try_load_students
  filename = ARGV.first # first rgument from the command line
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
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of save_students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def input_students
  while true do
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = STDIN.gets.chomp
    if name.empty?
      break
    end
    c = cohort
    @students << {name: name, cohort: c}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
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
    cohort = STDIN.gets.strip
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
  if @students == nil
    puts "There are no students enrolled."
  end
  sort_by_cohort = {}
  @students.each do |student|
    cohort = student[:cohort]
    name = student[:name]

    if sort_by_cohort[cohort] == nil
      sort_by_cohort[cohort] = []
    end

      sort_by_cohort[cohort].push(name)
  end
  sort_by_cohort.each do |k,v|
    puts "Cohort for #{k}: #{v.join(", ")}"
  end
end

def print_footer
  if !@students.empty?
    puts "Overall, we have #{@students.count} great students"
  end
end

try_load_students
interactive_menu
