# frozen_string_literal: true

# Application controller
class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  set :views, ['app/views']
  set :haml, format: :html5

  set :public_folder, File.expand_path('../../../public', __dir__)

  configure :production, :development do
    register Sinatra::Reloader
    enable :logging
  end

  not_found do
    title 'Not Found!'
    haml :not_found
  end

  def root_path
    return '' if self.instance_of?(ApplicationController)

    self.class.name.downcase.gsub('controller', '')
  end

  get '/' do
    index

    haml :"#{root_path}/index"
  end

  def index; end

  get '/new' do
    new

    haml :"#{root_path}/new"
  end

  def new; end

  post '/' do
    create
  end

  def create; end

  get '/:id' do
    show

    haml :"#{root_path}/show"
  end

  def show; end

  get '/:id/edit' do
    edit

    haml :"#{root_path}/edit"
  end

  def edit; end

  post '/:id' do
    update
  end

  def update; end

  delete '/:id' do
    destroy
  end

  def destroy; end
end
