def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
def print(students)
  students.each_with_index do |student, index| 
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].chars.first == 'A'
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just fit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :august}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)