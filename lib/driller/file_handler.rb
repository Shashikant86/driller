class File_Handler
    def initialize(filename, data)
        write(filename, data)
    end 

    def write(filename, data)
        begin 
            file = File.new(filename + '.html', 'w')
            file.puts data
            file.close
        rescue
            puts "Unable to write to file, please check your permissions" 
        end
    end
end