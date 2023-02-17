# write a code to search and print urls that exist in a file 


# fetch detail from the file contain text case
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

# geting the list of all the url which are valid

# condition for valid url
# The string should start with either http or https 
# top level domain size between 3 to 6
url = body.scan(/(https?:\/\/\S+?)(?:[\s)]|$)/i)
p url