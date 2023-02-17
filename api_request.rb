class Server_Frequency_Check
    def initialize(request_frequency,request_timestamp)
        @request_frequency = request_frequency
        # converting min to sec
        @request_timestamp = request_timestamp*60
        @user_log_detail = []
    end

    # create use that can use server
    def Add_User(name)
        @user_log_detail.push({
            "name" => name,
            "time_log" => []
        })
    end


    def find_index_by_name(name)
        @user_log_detail.find_index {|item| item["name"] == name}
    end

    def Can_Request(name)
        # if the user can request the request will add to the user log
        if self.Check_log(name)
            user_index = self.find_index_by_name(name)
            @user_log_detail[user_index]["time_log"].push(Time.now)
            return true
        end
        return false
    end

    def Check_log(name)
        user_index = self.find_index_by_name(name)
        while(@user_log_detail[user_index]["time_log"].length != 0 && @user_log_detail[user_index]["time_log"][0]+@request_timestamp < Time.now)
            @user_log_detail[user_index]["time_log"].shift
        end
        if @user_log_detail[user_index]["time_log"].length < @request_frequency
            return true
        else
            return false
        end
    end
end

temp = Server_Frequency_Check.new(3,1)
temp.Add_User("Sanskar")
temp.Add_User("Aditya")
while true
    user = gets
    if(temp.Can_Request(user.strip))
        puts "request get to the server"
    else
        puts "unable to get responce from server"
    end
end