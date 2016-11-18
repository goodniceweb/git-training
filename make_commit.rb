require 'fileutils'
require 'pry-byebug' # REMOVE ME
require './get_options'

# init vars
file_basename, file_ext, folder, commits, text = Parser.parse

# helpers
def last_file_index(files)
  i = files.sort_by do |file|
    file.match(/\d+/).to_s.to_i
  end.last.match(/\d+/).to_s.to_i
  i = i == 0 ? 1 : i
  i += 1
  i
end

# prepare working dir
FileUtils.mkdir_p folder

# create commits
commits.times do
  files = Dir.glob("#{folder}/#{file_basename}*.#{file_ext}")
  file_name = nil
  if files.any?
    i = last_file_index(files)
    file_name = "#{file_basename}#{i}.#{file_ext}" 
  else
    file_name = "#{file_basename}.#{file_ext}"
  end
  File.open("#{folder}/#{file_name}", 'w') {|f| f.write(text) }
  puts "New file created"
  
  # commit changes
  Dir.chdir(folder) do
    %x[git add #{file_name}]
    %x[git commit -m 'Add file #{file_name}']
  end
  puts "Commit created"
end
