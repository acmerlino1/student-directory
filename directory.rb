def input_students
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
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  while true do
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    if !name.empty?
      puts "Please enter the students cohort"
      cohort = gets.chomp
      if cohort.empty?
        cohort = "november"
      elsif months[cohort] == nil
        puts "There seems to be a spelling mistake, please re-enter cohort"
        cohort = gets.chomp
      end
        students << {name: name, cohort: months[cohort]}
        puts "Now we have #{students.count} students"
      # get another name from the user
    elsif name.empty?
      break
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  student_index = 0
  while student_index < students.length
    puts "#{student_index+1}. #{students[student_index][:name]} (#{students[student_index][:cohort]} cohort)".center(100)
    student_index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
