class FlatsController < ApplicationController
  skip_before_action :authenticate_registration!, only: :home

  def home
    "Hello"
  end

  def index
  end

  def show
  end

  def edit
  end

  def new
  end
end
