require 'fileutils'
copy_and_paste = <<~NAMES
1	Community Library	Not completed
2	Animal Kingdom	Not completed
3	Wish You Were Here	Not completed
4	Employee Management	Not completed
5	Files	Not completed
6	Sorting Distances	Not completed
7	Bank Balance	Not completed
8	Task Manager	Not completed
9	You've Got Mail!	Not completed
10	Does it Rock or Not?	Not completed
NAMES
def generate_filenames(heredoc, filetype)
  heredoc
    .split("\n")
    .map do |filename| 
      filename = filename.gsub(/\s+(completed|Not completed)$/, '');
      name_parts = filename.match(/(\d+)\s+(.*)/)
      number = name_parts[1]
      exercise_name = name_parts[2]
      snake_case(number, exercise_name, '.rb')
    end.each do |filename| 
      FileUtils.touch(filename)
    end
end

def camel_case(file_number, exercise_name, ext)
  file_number = file_number.to_i < 10 ? "0#{file_number}_" : "#{file_number}_"
  exercise_name = exercise_name.split(' ').map.with_index do |name, index|
    if index == 0
      name.downcase
    else
      name.capitalize
    end
  end.join

  file_number + exercise_name + ext
end

def snake_case(file_number, exercise_name, ext)
  file_number = file_number.to_i < 10 ? "0#{file_number}_" : "#{file_number}_"
  exercise_name = exercise_name.gsub(/\ /, '_').downcase
  file_number + exercise_name + ext
end

generate_filenames(copy_and_paste, '.rb')