class Html_Report
    def initialize(reportName, rows)   
        @reportName = reportName     
        @html = ""
        createTable(rows)
    end 

    def createTable(rows)

        if rows.length == 0
            @html = "#{@html}<tr><td>There are no #{@reportName}.</td></tr>"
            return 
        end

        addHeading(rows[0])

        if rows.kind_of?(Array)
            rows.each do |row|
                unless row.nil?
                    addRow(row)
                end
            end
        else 
            abort("Rows should be an array in Html_Report");
        end
    end

    def addHeading(row)
        @html = "#{@html}<tr>"
        row.each do |key, value|
            @html = "#{@html}<th>"
            @html = "#{@html} #{(key.to_s).capitalize}"
            @html = "#{@html}</th>"
        end
        @html = @html + "</tr>"
    end

    def addRow(row)
        @html = @html + "<tr>"
        row.each do |key, value|
            @html = "#{@html}<td>"
            @html = "#{@html}#{value}"
            @html = "#{@html}</td>"
        end
        @html = @html + "</tr>"
    end

    def getReport
      
        @htmlWithWrapper = "<!DOCTYPE html><html><head><title>Report</title></head><body>"
        @htmlWithWrapper = @htmlWithWrapper + "<h1>#{@reportName.capitalize}</h1>"
        @htmlWithWrapper = @htmlWithWrapper + "<table class='table'>#{@html}</table>"
        @htmlWithWrapper = @htmlWithWrapper + "</body></html>"
        
        return @htmlWithWrapper
    end
end