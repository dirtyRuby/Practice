def replace_all_separators(seps,text)
  new_text = text.each{ |line|
    seps.each{ |sep|
      replace_line_separators(sep,line)
    }
  }
end

def count_words(text)
  amount = 0
  text.each { |line|
    amount+=get_words(line).length
  }
  amount
end

def count_usfull_words(text,voc)
  amount = 0
  text.each{ |line|
    get_words(line).each{ |word|
      voc.each{ |uw|
        if word == uw
          amount+=1
          break
        end
      }
    }
  }
  count_words(text)-amount
end

def replace_line_separators(sep,line)
  line.chop
  line.gsub!(sep," ")
end
def get_words(line)
  arr = line.split(" ")
end
def count_sentences(text,seps)
  amount = 0
  text.each { |line|
    line.each_char{ |char|
      seps.each{ |sep|
        if sep == char
          amount+=1
          break
        end
      }
    }
  }
  amount
end

usless_words = %w{the a by on for of are with just but and to the my I has some in}
seps = %W(, . ! ? - ( ) : ;)
p_seps = %W(. ! ?)
lines = File.readlines("file.txt")
text = lines.join
chars = text.scan(/./).length
chars_non_space = text.gsub(/\s+/,"").length
paragraphs = text.split(/\n\n/).length
sentences = count_sentences(lines,p_seps)

lines_count = lines.size
words = count_words(replace_all_separators(seps,lines))
usful_words = count_usfull_words(replace_all_separators(seps,lines),usless_words)
spp_average = sentences/paragraphs
wps_average = words/sentences
puts "#{lines_count} lines"
puts "#{chars} characters"
puts "#{chars_non_space} characters excluding spaces"
puts "#{words} words"
puts "#{usful_words} useful words"
puts "#{paragraphs} paragraphs"
puts "#{sentences} sentences"
puts "#{spp_average} sentences per paragraph (average)"
puts "#{wps_average} words per sentence (average)"
