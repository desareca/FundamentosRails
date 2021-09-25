class RpgsController < ApplicationController
  def index
    if(session[:gold].nil?)
      @gold = 0
      session[:gold] = 0
    else
      @gold = session[:gold]
    end
    if(session[:content].nil?)
      @content = ''
      session[:content] = ''
    else
      @content = session[:content]
    end

    #session[:content] = ''
    #session[:gold] = 0
  end

  def calc
    if(data_parameter[:box]=='farm')#10-20
      gold_n = rand(10..20)
      content_n = "Earned " + gold_n.to_s + " golds from the farm! (" + Time.now.strftime("%d/%m/%Y %H:%M %p") + ")"
    elsif(data_parameter[:box]=='cave')#5-10
      gold_n = rand(5..10)
      content_n = "Earned " + gold_n.to_s + " golds from the cave! (" + Time.now.strftime("%d/%m/%Y %H:%M %p") + ")"
    elsif(data_parameter[:box]=='house')#2-5
      gold_n = rand(2..5)
      content_n = "Earned " + gold_n.to_s + " golds from the house! (" + Time.now.strftime("%d/%m/%Y %H:%M %p") + ")"
    elsif(data_parameter[:box]=='casino')#-50 - 50
      gold_n = rand(-50..50)
      if(gold_n<0)
        content_n = "Entered a casino and lost " + gold_n.abs.to_s + " golds... Ouch.. (" + Time.now.strftime("%d/%m/%Y %H:%M %p") + ")"
      else
        content_n = "Entered a casino and win " + gold_n.abs.to_s + " golds... Wow.. (" + Time.now.strftime("%d/%m/%Y %H:%M %p") + ")"
      end
    elsif(data_parameter[:box]=='reinit')
      session[:content]=''
      session[:gold]=0
      content_n=''
      gold_n=0
    end
    if(gold_n<0)
      color_g = 'danger'
    else
      color_g = 'success'
    end
    @content = session[:content]
    @content = '<p class="col-12 my-0 text-' + color_g + '">' + content_n + '<p/>' +  @content
    session[:gold]+=gold_n
    session[:content]=@content
    redirect_to "/"
  end

  def data_parameter
    params.require(:data).permit(:box)
  end


end
