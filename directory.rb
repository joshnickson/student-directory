def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end
def print(students)
  counter = 0
    while counter < students.count
      puts "#{students[counter][:name]} (#{students[counter][:cohort]} cohort)".center(50)
      counter += 1 
    end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

def check_if_month(month)
  return ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december', ''].include? month.downcase
end

def input_students
  puts "Please enter the names of the students followed by the cohort"
  puts "To finish, just fit return twice"
  students = []
  name = ' '
  loop do
    cohort = ' '
    name = gets.chomp
    break if name.empty?
      until check_if_month(cohort)
        cohort = gets.chomp
        puts "Please enter the cohort correctly" if !check_if_month(cohort)
      end
    cohort = "august" if cohort.empty?
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
