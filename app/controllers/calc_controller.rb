class CalcController < ApplicationController
  before_action :authenticate_user!, except: [:main,:ajaxtrig]

  def main
  end

  def articles
    @post = Article.all
  end

  def work
  end

  def contacts

  end
  def sort
    render "calcfile/sort"
  end
  def noknod
    render 'calcfile/noknod'
  end
  def ajaxnoknod
    @a,@b=params[:firstnumber].to_i,params[:secondnumber].to_i
    @a,@b=@a.gcd(@b),@a.lcm(@b)#a it's nod
    respond_to do |format|
      format.json {render json: { key: "noknod", nok: @b, nod: @a }}
      end
  end
  def ajax
    @string = params[:string].split.map(&:to_i).sort
      respond_to do |format|
        format.json {render json: { key: "sort", arrlist: @string }}
      end
  end
  def ajaxtrig
    @a=params[:number].to_f*Math::PI/180
    @func=params[:trig]
    case @func
    when 'sin'
      @a=Math.sin @a
    when 'cos'
      @a=Math.cos @a
    when 'tg'
      @a=Math.tan @a
    when 'ctg'
      @a=1/(Math.tan @a)
    when 'asin'
      @a=Math.asin @a
    when 'acos'
      @a=Math.acos @a
    when 'atan'
      @a=Math.atan @a
    when 'actg'
      @a=Math::PI*0.5- (Math.atan @a)
    end
    if @a<0.00000001 then @a=0 end
    if @a>999999999 then @a=Float::INFINITY end
    respond_to do |format|
      format.json {render json: { key: "trig", result: @a }}
    end
  end
  def trigonometric
    render 'calcfile/trigonometric'
  end
  def combinatoric
    render 'calcfile/combinatoric'
  end
  def ajaxcomb
    @first=params[:firstnumber].to_i
    @second=params[:secondnumber].to_i
    nfac=(1..@second).inject(:*)
    kfac=(1..@first).inject(:*)
     @second-@first==0 ? nminusk=1: nminusk=(1..(@second-@first)).inject(:*)
    @reversal=nfac
    @combination=nfac/(kfac*nminusk)
    @placing=nfac/nminusk
    respond_to do |format|
      format.json {render json: {key:"comb",reversal:@reversal,combination:@combination,placing:@placing}}
    end
  end
end
