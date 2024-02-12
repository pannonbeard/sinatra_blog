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
    enable :sessions
  end

  def current_user
    if session[:user_id]
      User.where(id: session[:user_id]).first
    else
      nil
    end
  end

  not_found do
    title 'Not Found!'
    haml :not_found
  end

  def root_path
    return '' if instance_of?(ApplicationController)

    self.class.name.downcase.gsub('controller', '')
  end

  get '/' do
    return unless self.class.method_defined? :index

    index
    haml :"#{root_path}/index"
  end

  get '/new' do
    return unless self.class.method_defined? :new

    new
    haml :"#{root_path}/new"
  end

  post '/' do
    return unless self.class.method_defined? :create

    create
  end

  get '/:id' do
    return unless self.class.method_defined? :show

    show
    haml :"#{root_path}/show"
  end

  get '/:id/edit' do
    return unless self.class.method_defined? :edit

    edit
    haml :"#{root_path}/edit"
  end

  post '/:id' do
    return unless self.class.method_defined? :update

    update
  end

  delete '/:id' do
    return unless self.class.method_defined? :destroy

    destroy
  end

  protected

  def str_params
    StrongParams.new(params)
  end
end
