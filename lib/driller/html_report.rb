
class Html_Report
    def initialize        
        @html = "<table>"
    end 
    def addRow(row)
        @html = @html + "<tr>"
        row.each do |col|
            @html = @html + "<td>"
            @html = col
            @html = @html + "</td>"
        end
        @html = @html + "</tr>"
    end

    def getResult
        @html = @html + "</table>"
        return @html
    end
end