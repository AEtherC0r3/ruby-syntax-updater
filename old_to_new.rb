# Verify the number of arguments
unless ARGV.length == 1
	puts "Too many arguments"
	puts "ruby old_to_new.rb <filename>"
	abort
end

# Read the file and extract the hashes
file = File.read(ARGV[0])
old = file.scan(/:[a-z_]+ =>/).uniq

# Create the new hashes
new = old.collect do |olh|
	olh.sub(':', '').sub(' =>', '') + ':'
end

# Replace the old syntax with the new
old.zip(new).each do |ohs, nhs|
	file.gsub!(ohs, nhs)
end

# Writeback the file
File.write(ARGV[0], file)
