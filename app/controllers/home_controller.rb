# -*- coding: utf-8 -*-
class HomeController < BaseController
  before_action :facebook_oauth_required, :only => [:iyeah]

  def index
  end

  def login
    flash[:notice] = "facebookのログインが必要です"

    redirect_to :root
  end

  def mypage
    flash[:notice] = "facebookログインが必要です" and redirect_to login_path if !User.where(facebook_id: params[:facebook_id]).first

    @user = User.where(facebook_id: params[:facebook_id]).first
  end

  def iyeah
    user = User.where(facebook_id: facebook_user['id']).first
    user.goods.create(photo_id: params[:photo_id])

    redirect_to mypage_path(params[:facebook_id])
  end
end