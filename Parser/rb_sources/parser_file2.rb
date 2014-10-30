def count_words(seps,line_arr,mod=nil, voc=nil)
  temp_lines = line_arr.each{ |line|
    seps.each{ |sep|
      replace_separators(sep,line)
    }
  }
  amount = 0
  temp_lines.each { |line|
    amount+=get_words(line).length
  }
  if mod == "uw"
    count = 0
    temp_lines.each{ |line|
      get_words(line).each{ |word|
        voc.each{ |uw|
          if word == uw
            count+=1
            break
          end
        }
      }
    }
    return amount-count
  elsif mod == "cw"
    return amount
  end
end
def replace_separators(sep,line)
  line.chop
  line.gsub!(sep," ")
end
def get_words(line)
  arr = line.split(" ")
end