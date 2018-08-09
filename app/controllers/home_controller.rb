class HomeController < ApplicationController
  def index
    StartScrap.perform
    StartScrap.save
    @crypto = Crypto.all
  end
end
