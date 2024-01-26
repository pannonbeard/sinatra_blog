# frozen_string_literal: true

# Application Helper Module
module ApplicationHelper
  def title(value = nil)
    @title = value if value
    @title ? "Sinatra Blog - #{@title}" : 'Sinatra Blog'
  end
end
