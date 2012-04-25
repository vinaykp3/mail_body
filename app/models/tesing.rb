class Tesing < ActiveRecord::Base
  def self.escape_string(str)
     return Regexp.escape(str).gsub(/([:~!<>="])/,'\\\\\1')
  end

  def self.save(upload)
    att=Array.new
    upload.each do |name|
       n=upload[name[0]].original_filename
       directory = "public/data"
       path = File.join(directory, n)
       File.open(path, "wb") { |f| f.write(upload[name[0]].read) }
      att.push n
    end
    return att
    #name =  upload['datafile'].original_filename
    #directory = "public/data"
    ## create the file path
    #path = File.join(directory, name)
    ## write the file
    #File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    #return name
  end
end
