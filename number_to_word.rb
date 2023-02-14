# write a program to convert positive integer to words formate:

Name_no = {
      10000000 => " crore" ,
      100000 => " lakh" ,
      1000 => " thousand" ,
      100 => " hundred" ,
      90 => " ninety" ,
      80 => " eighty" ,
      70 => " seventy" ,
      60 => " sixty" ,
      50 => " fifty" ,
      40 => " forty" ,
      30 => " thirty" ,
      20 => " twenty" ,
      19=>" nineteen" ,
      18=>" eighteen" ,
      17=>" seventeen" , 
      16=>" sixteen" ,
      15=>" fifteen" ,
      14=>" fourteen" ,
      13=>" thirteen" ,              
      12=>" twelve" ,
      11 => " eleven" ,
      10 => " ten" ,
      9 => " nine" ,
      8 => " eight" ,
      7 => " seven" ,
      6 => " six" ,
      5 => " five" ,
      4 => " four" ,
      3 => " three" ,
      2 => " two" ,
      1 => " one" 
    }
def Convert_To_Word(no)
    ans = " " 

    Name_no.each do |num,name|
        if no == 0  # your string is complete 
            return ans
        elsif no < 10 && no/num > 0 # when the last word is(1...9)
            return ans + name
        elsif no < 100 && no/num > 0
            return ans + name if no%num == 0
            return ans + name + Convert_To_Word(no/num)
        elsif no/num > 0
            return ans + Convert_To_Word(no/num) + name + Convert_To_Word(no%num)
        end
    end
end

no = gets
puts Convert_To_Word(no.to_i)