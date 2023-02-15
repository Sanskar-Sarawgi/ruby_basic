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

def delete(id)
    Client.query("DELETE FROM user_info WHERE userid=#{id}")
end

show
insert("random",3,"xyz")
show
delete(1)



