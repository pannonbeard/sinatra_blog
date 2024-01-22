require 'rubygems'
require 'sinatra'
require "sinatra/base"
require 'sinatra/reloader'

class ApplicationController < Sinatra::Base
  set :views, ['app/views']
  set :haml, :format => :html5

  set :public_folder, File.expand_path('../../../public', __FILE__)

  configure :production, :development do
    register Sinatra::Reloader
    enable :logging
  end

  not_found do
    title 'Not Found!'
    haml :not_found
  end

  def root_path
    return '' if self.class.name == 'ApplicationController'

    self.class.name.downcase.gsub('controller', '')
  end

  get '/' do
    index

    haml "#{root_path}/index".to_sym
  end

  def index; end

  get '/new' do
    new
  
    haml "#{root_path}/new".to_sym
  end

  def new; end

  post '/' do
    create
  end

  def create; end

  get '/:id' do
    show

    haml "#{root_path}/show".to_sym
  end

  def show; end

  get '/:id/edit' do
    edit

    haml "#{root_path}/edit".to_sym
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