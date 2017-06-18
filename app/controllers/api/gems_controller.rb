class Api::GemsController < ApplicationController

  def query
    render json: RubyGem.joins(:libraries).where(name: params[:gems].to_a,:libraries => { :os_name => params[:os] }).group('ruby_gems.name').map{
        |gem| {name: gem.name, libraries: gem.libraries.map{ |l| l.name }}
    }
  end

end
