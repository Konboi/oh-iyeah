# -*- coding: utf-8 -*-
class HomeController < BaseController
  before_action :facebook_oauth_required, :only => [:iyeah]

  def index
  end

  def login
    flash[:notice] = "facebookのログインが必要です"

    redirect_to :root
  end

  def logout
    reset_session
    redirect_to :root
  end

  def mypage

    flash[:notice] = "facebookログインが必要です" and redirect_to login_path if !User.where(facebook_id: params[:facebook_id]).first

    @user = User.where(facebook_id: params[:facebook_id]).first
    @url = "http://www.facebook.com/dialog/feed? app_id=#{Facebook::APP_ID}&link=http://oh-iyeah.konboi.com/#{params[:facebook_id]}&picture=http://oh-iyeah.konboi.com/img/icon.png&name=Oh!遺影&description=最後にみんなに見てもらう写真だからこそ、みんなが自分らしいと思う写真にしたい。素の自分、意外な自分、いつもの自分 そんな自分をみんなで選ぼう&redirect_uri=http://oh-iyeah.konboi.com/#{params[:facebook_id]}"
  end

  def iyeah
    user = User.where(facebook_id: facebook_user['id']).first

    flash[:error] = "1人1Oh!遺影 になります。ご了承ください。 " and  redirect_to mypage_path(params[:facebook_id]) and return if Good.where(photo_id: params[:photo_id]).where(user_id: user.id).first

    user.goods.create(photo_id: params[:photo_id])
    redirect_to mypage_path(params[:facebook_id])
  end
end





