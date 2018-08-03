require 'csv'
@students = []
@filename = "students.csv"
def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end
def print_student_list
  @students.each.map{|person| person[:cohort]}.uniq.each do |month| 
    puts month.upcase
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50) if student[:cohort] == month
    end
  end
end
def check_if_month(month)
  return ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december', ''].include? month.downcase
end
def input_students
  puts "Please enter the names of the students followed by the cohort"
  puts "To finish, just fit return twice"
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
    add_students(name, cohort)
    message_1 = "Now we have #{@students.count} student"
    pluralize(message_1)
  end
  puts "The student list has been updated."
end
def print_footer
  message_2 = "Overall, we have #{@students.count} great student"
  pluralize(message_2)
end
def pluralize(message)
  @students.count == 1 ? suffix = '' : suffix = "s"
  message_out = message + suffix
  puts message_out.center(50)
end
def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end
def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list"
    puts "4. Load the list"
    puts "9. Exit"
end
def show_students
  print_header
  print_student_list
  print_footer
end
def select_process(selection)
  case selection
    when '1'; input_students
    when '2'; show_students
    when '3'; ask_filename(1)
    when '4'; ask_filename(2)
    when '9'; exit
    else    ; puts "I don't know what you meant, try again"
  end
end
def interactive_menu
  loop do
    print_menu
    select_process(STDIN.gets.chomp)
  end
end
def save_students
  CSV.open(@filename, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end
  puts "Save complete."
end
def load_students
  CSV.foreach(@filename) do |line|
      name, cohort = line
      add_students(name, cohort)
    end
  puts "#{@filename} was loaded."
end
def ask_filename(action) 
  loop do
    puts "Which file would you like to use?"
    choice = gets.chomp
    break if choice == ''
    if !File.exists?(choice)
      puts "Sorry, #{choice} doesn't exist." 
    else
      @filename = choice
      break
    end
  end
  case action
    when 1; save_students
    when 2; load_students
  end
end

load_students
interactive_menu
