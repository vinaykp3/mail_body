class TesingController < ApplicationController
  before_filter :set_cache_buster

  def index
    render :partial => "check"
  end

  def send_mail
    @body=params[:body]
    #post=params[:images]
    #puts post.inspect
    post= Tesing.save(params[:images])
    puts post.inspect
    @users=User.all
    @users.each do |user|
      TestMail.registration_confirmation(@body,post,user).deliver
    end

    #puts @body
    #post = Tesing.save(params[:upload])
    #TestMail.registration_confirmation(@body,post).deliver
    #TestMail.activation_instructions(@body,post).deliver
    render :text => "Mail Sent Successfully"
  end

  def something_diff

  end


end
