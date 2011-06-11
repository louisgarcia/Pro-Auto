class JavascriptsController < ApplicationController
  def dynamic_models
  @models = Model.find(:all)
  end
end
