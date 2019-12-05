def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  while true do
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    if !name.empty?
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
      # get another name from the user
    else
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
