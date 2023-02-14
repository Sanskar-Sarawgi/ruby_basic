# write a code to search and print urls that exist in a file 

begin
    body = ""
    File.open("url.txt","r") do |ptr|
        ptr.each_line do |line|
            body += line
        end
    end
rescue 
    p "File not found"
end

url = body.scan(/(https?:\/\/\S+?)(?:[\s)]|$)/i)
p url