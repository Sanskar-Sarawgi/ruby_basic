require 'mysql2'


Client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => '2001')
Client.query("use db1");
#create table if not exit

def show()
    results = Client.query("select * from user_info");
    results.each do |row|
        puts row
    end
end

def insert(name,age,place)
    results = Client.query("select * from user_info")
    id = results.size+1;
    Client.query("insert into user_info value(#{id},#{age},\"#{name}\",\"#{place}\")")
end

def update(value,key,id)
    Client.query("UPDATE user_info SET #{key} = \"#{value}\" WHERE userid=#{id}");
end

def delete(id)
    Client.query("DELETE FROM user_info WHERE userid=#{id}")
end


while true
    input = gets
    puts input
    case input
    when "show\n"
        show
    when "insert\n"
        name = gets
        age = gets
        place = gets
        insert(name,age.to_i,place)
    when "delete\n"
        id = gets
        delete(id.to_i)
    when "update\n"
        key = gets
        value = gets
        id = gets
        update(key,value,id.to_i)
    else
        puts "invalid command try again" 
    end
end


