def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end
def prints(students)
  cohort_list = students.each.map{|person| person[:cohort]}.uniq
  cohort_list.each do |month| 
    puts month
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:cohort] == month
    end
  end
end

def print_footer(names)
  message_1 = "Overall, we have #{names.count} great student"
  names.count == 1 ? message_2 = '' : message_2 = "s"
  message = message_1 + message_2
  puts message.center(50)
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
    cohort = 'august' if cohort.empty?
    students << {name: name, cohort: cohort.to_sym}
    message_1 = "Now we have #{students.count} student"
    students.count == 1 ? message_2 = '' : message_2 = "s"
    message = message_1 + message_2
    puts message.center(50)
  end
  students
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when '1'
      students = input_students
    when '2'
      print_header
      prints(students)
      print_footer(students)
    when '9'
      exit
    else "I don't know what you meant, try again"
    end
  end
end

interactive_menu
