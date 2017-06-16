class RubyGemsController < ApplicationController
  before_action :set_ruby_gem, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  semantic_breadcrumb "Gems", :ruby_gems_path

  def index
    @ruby_gems = RubyGem.all
  end

  def show
  end

  def new
    semantic_breadcrumb "Create", new_ruby_gem_path
    @ruby_gem = RubyGem.new
  end

  def edit
    semantic_breadcrumb @ruby_gem.name
  end

  def create
    @ruby_gem = RubyGem.new(ruby_gem_params)
    @ruby_gem.user = current_user

    if @ruby_gem.save
      redirect_to ruby_gems_url, notice: 'Gem was successfully created.'
    else
      semantic_breadcrumb "Create", new_ruby_gem_path
      render :new
    end
  end

  def update
    if @ruby_gem.update(ruby_gem_params)
      redirect_to ruby_gems_url, notice: 'Gem was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ruby_gem.destroy
    redirect_to ruby_gems_url, notice: 'Gem was successfully destroyed.'
  end

  private
  def set_ruby_gem
    @ruby_gem = RubyGem.find(params[:id])
  end

  def ruby_gem_params
    params.require(:ruby_gem).permit(:name, :version, libraries_attributes: [:id, :name, :_destroy])
  end
end
