@students = []
def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end
def print_student_list
  cohort_list = @students.each.map{|person| person[:cohort]}.uniq
  cohort_list.each do |month| 
    puts month
    @students.each do |student|
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
  @students = []
  name = ' '
  loop do
    cohort = ' '
    name = STDIN.gets.chomp
    break if name.empty?
      until check_if_month(cohort)
        cohort = STDIN.gets.chomp
        puts "Please enter the cohort correctly" if !check_if_month(cohort)
      end
    cohort = 'august' if cohort.empty?
    @students << {name: name, cohort: cohort.to_sym}
    message_1 = "Now we have #{@students.count} student"
    @students.count == 1 ? message_2 = '' : message_2 = "s"
    message = message_1 + message_2
    puts message.center(50)
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
  print_student_list
  print_footer(@students)
end
def process(selection)
  case selection
    when '1'
      input_students
    when '2'
      show_students
    when '3'
      save_students
    when '4'
      load_students
    when '9'
      exit
    else 
      puts "I don't know what you meant, try again"
  end
end
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line| 
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
def try_load_students 
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

interactive_menu
