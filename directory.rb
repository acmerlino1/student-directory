def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        # input the input_students
        students = input_students
      when "2"
        # show the input_students
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
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
    cohort = gets.strip
    if cohort.empty?
      cohort = "november"
    elsif months[cohort] == nil
      puts "There seems to be a spelling mistake, please re-enter cohort"
      next
    end
    return months[cohort]
  end
end

def input_students
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  while true do
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = gets.strip
    if name.empty?
      break
    end
    c = cohort
    students << {name: name, cohort: c}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  if students.empty?
    puts "There are no students enrolled."
  end
  sort_by_cohort = {}
  students.each do |student|
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

def print_footer(students)
  if !students.empty?
    puts "Overall, we have #{students.count} great students"
  end
end

interactive_menu
