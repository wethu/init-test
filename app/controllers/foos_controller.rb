class FoosController < ApplicationController
  def index
    @foo = Foo.configuration.bar
  end
end
