class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  #  Page Title Helper
  module ApplicationHelper
    def title(text)
      content_for :title, text
    end

    def meta_tag(tag, text)
      content_for :"meta_#{tag}", text
    end

    def yield_meta_tag(tag, default_text='')
      content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
    end
  end

end
