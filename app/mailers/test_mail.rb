load "erb.rb"
class TestMail < ActionMailer::Base
  default :from => "vinay.kp@relyonsoft.com"
    def registration_confirmation(body,post,user)
      @body=body
      post.each do |file|
        if(File.extname(file)==".png" || File.extname(file)==".jpg" || File.extname(file)==".jpeg" || File.extname(file)==".gif")
          attachments.inline[file] = {:content => File.read("#{Rails.root}/public/data/#{file}")}
        else
          attachments[file] = {:content => File.read("#{Rails.root}/public/data/#{file}")}
        end
      end
      html=ERB.new(@body)
      puts binding.inspect
      @ht=html.result(binding)
      puts @ht.inspect
      mail(:to => user.email, :subject => "Registered")
    end
end
