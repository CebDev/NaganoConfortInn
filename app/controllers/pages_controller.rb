class PagesController < ApplicationController
  def index
    @title = 'NaganoConforInn'
  end

  def administration
    @title = 'NCI administration'
  end

end
