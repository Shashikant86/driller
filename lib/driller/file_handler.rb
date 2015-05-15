class File_Handler
    def initialize(reportName)
        begin 
            @file = File.new(reportName + '.html', 'w')
        rescue
            puts "Please check your directory permissions."
        end
    end 

    def generateReport(str)
        file = File.open(@reportName, 'a+')
        begin 
            file.puts str
            file.write("\n")
        rescue
            puts "unable to write file" 
        end
        file.close
    end
end