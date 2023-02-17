require 'mysql2'

class User_Connection

    def initialize
        # connecting the mysql server
        @Client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => '2001')
        # set the database
        @Client.query("use db1");
    end

    def runQuery(query)
        # error check for the query
        begin
            result = @Client.query(query)
            return result
        rescue error
            print error
        else
            print "query run successfully"
        end
    end

    # display row base on the key as the file name and value is the value of the row which we are finding
    def show(key,value)
        query = ""
        if key == ""
            query = "select * from user_info"
        else
            query = "select * from user_info where #{key} = \"#{value}\" "
        end
        results = self.runQuery(query)

        # printing the data from the row
        results.each do |row|
            puts row
        end
    end

    def insert(name,age,place,email)
        # using \ as the escape character to add the "" in the value
        query = "insert into user_info value(#{age},\"#{name}\",\"#{place}\",\"#{email}\")"
        self.runQuery(query)
    end
    
    def update(key,value,email)
        query = "UPDATE user_info SET #{key} = \"#{value}\" WHERE email=\"#{email}\""
        self.runQuery(query)
    end

    def delete(email)
        query = "DELETE FROM user_info WHERE email=\"#{email}\""
        self.runQuery(query)
    end
end



# creating user 
client = User_Connection.new

# menu driven program for testing the code
while true
    input = gets
    input = input.strip
    case input
    when "show"
        print "Enter the row name in the table = "
        key = gets
        print "Enter the row value which you want to search = "
        value = gets
        client.show(key.strip,value.strip)
    when "insert"
        print "Enter detail of the user \n"
        print "Email = "
        email = gets
        print "Name = "
        name = gets
        print "Age = "
        age = gets
        print "Place = "
        place = gets
        client.insert(name.strip,age.to_i,place.strip,email.strip)
    when "delete"
        print "Enter email address = "
        email = gets
        client.delete(email.strip)
    when "update"
        print "Enter the Email = "
        email = gets
        print "Enter the name of the row which you want to update = "
        key = gets
        print "Enter the value = "
        value = gets
        client.update(key.strip,value.strip,id.to_i)
    else
        puts "invalid command try again" 
    end
end
