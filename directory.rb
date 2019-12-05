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
      puts "What is this students hobby?"
      hobby = gets.chomp
      puts "In which country were they born?"
      birth_place = gets.chomp
      puts "How tall are they (metres)?"
      height = gets.chomp
      # add the student hash to the array
      students << {name: name, cohort: :november, hobby: hobby,
        birth_place: birth_place, height: height}
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
    item = students[student_index]
    puts "#{student_index+1}. #{students[student_index][:name]}, favourite hobby is
    #{students[student_index][:hobby]}, was born in #{students[student_index][:birth_place]}
    and is #{students[student_index][:height]}m tall (#{students[student_index][:cohort]} cohort)"
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
