require 'mechanize'
require 'fileutils'

if Dir.exist?("results") == false
  Dir.mkdir("results")
end

Dir.chdir("results")
if ARGV.length < 3
  File.new("output.txt","a+")
end
mechanize = Mechanize.new
if ARGV[0].match(/https?:\/\/[\S].[\S]/)
  page = mechanize.get(ARGV[0])
else
  exit
end
page.links.each do |link|
  if link.text.match(ARGV[1])
    if ARGV.length < 3
      File.open("output.txt", "a+") do |f|
        f.puts "#{link.text} - #{link.uri}"
      end
    else
      File.open(ARGV[2], "a+") do |f|
        f.puts "#{link.text} - #{link.uri}"
      end
    end
  end
end