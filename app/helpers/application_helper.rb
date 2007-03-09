# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_code(path, filename, comment = "")
    file = File.open(Dir.pwd + "/../app/#{path}/#{filename}")
<<PRE_BLOCK
<div class="Heading_1">/#{path}/#{filename} #{comment}</div>
<pre>
#{file.read.gsub("<", "&lt;").gsub(">", "&gt;")}
</pre>
<div class="Body_1">&nbsp;</div>
PRE_BLOCK
  end

end
