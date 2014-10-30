require 'file_parser_tools/version'

module FileParserTools
  # mod - режим использования метода
  # (uw - колличество полезных слов, cw - колличесвто обычных слов)
  def count_words(seps,line_arr,mod=nil, voc=nil)
    temp_arr = line_arr.each{ |line|
      seps.each{ |sep|
        replace_separators(sep,line)
      }
    }
    amount = 0
    temp_arr.each { |arr|
      amount+=arr.split(" ").length
    }
    if mod == uw
      count = 0
      temp_arr.each{|arr|
        arr.each{ |word|
          voc.each{ |uw|
            if uw == word
              count+=1
            end
          }
        }
      }
      return count
    elsif mod == "cw"
      return amount
    end
  end
  def replace_separators(sep,line)
    line.gsub!(sep," ")
  end
end