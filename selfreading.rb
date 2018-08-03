# This a program that reads its own source code
File.open(__FILE__) do |f|
  f.each_line do |line|
    puts line
  end
end