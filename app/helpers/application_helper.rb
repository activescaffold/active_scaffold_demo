# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def show_code(path, filename, comment = "")
    begin
      file = File.open("#{File.dirname __FILE__}/../../app/#{path}/#{filename}")
<<PRE_BLOCK
<h4>/#{path}/#{filename} #{comment}</h4>
<pre><code class=\"ruby\">#{file.read.gsub("<", "&lt;").gsub(">", "&gt;").strip}</code></pre>
PRE_BLOCK
    rescue
      "#{filename} is missing"
    end
  end

end
