namespace "parse"
task :upload_file_to_parse => [:file_name, :file_type] do |t|
  puts "file name is #{args.first name}"
  puts "file name is #{args.first name}"
  #make http request to parse api
  #specify http headers and api keys
  #pass name of file and type
  #save
end

task :clear_previous_entry do
  Rake::Task[:upload_file_to_parse].clear
end

#task :build => ["parse:build"]
