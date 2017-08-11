class DojosControllerController < ApplicationController
  def index
    @dojos = Dojo.all
  end
end
