class Server
    def initialize(size,no_r,per)
        @fre = Array.new(size,0)
        @timeline = Array.new
        @no_r = no_r
        @per = per*60
    end
    def request(user)
        self.reframe
        if(@fre[user] == @no_r)
            return false
        end
        @fre[user] = @fre[user]+1
        @timeline = @timeline.push([user,Time.now])
        puts @timeline[0][1]+@per
        return true
    end
    def reframe()
        while(@timeline.length != 0 && @timeline[0][1]+@per <= Time.now)
            @fre[@timeline[0][0]] =  @fre[@timeline[0][0]] - 1;
            @timeline.shift
        end
        
    end
end

temp = Server.new(3,3,1)
while true
    user = gets
    if(temp.request(user.to_i))
        puts "request get to the server"
    else
        puts "unable to get responce from server"
    end
end