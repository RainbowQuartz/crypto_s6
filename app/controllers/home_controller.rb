class HomeController < ApplicationController
  def index
    @crypto = Crypto.all
  end
end
