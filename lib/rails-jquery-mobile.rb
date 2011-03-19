require "action_view"
module ActionView
	module Helpers
		module TagHelper
			ATTRIBUTES = [:theme, :collapsed, :transition, :direction, :ajax]
			
			def content_tag_with_mobile(name, content_or_options_with_block = nil, options = nil, escape = true, &block)
				if block_given? 
					options = mobile_parse_options content_or_options_with_block
					content_tag_without_mobile name, options, options, escape do
						yield
					end
				else
					options = mobile_parse_options options
					content_tag_without_mobile name, content_or_options_with_block, options, escape
				end
			end
			
			
			alias_method_chain :content_tag, :mobile
			
			def mobile_parse_options(options=nil)
				unless options.nil?
					options.each do |key, value|
						if ATTRIBUTES.include?(key.to_sym)
							options.delete(key)
							options["data-#{key}"] = value
						end
					end
				end
				return options
			end
		end
  		module JqueryMobileHelper
			
			
			[:page, :navbar, :content, :footer, :header, :collapsible].each do |name|
				class_eval "def #{name} (options = {}, &content)
					mobile_div('#{name}', options) do
						yield content
					end
			 	end"
			end
			
			def listview(options = {})
				mobile_tag :ul, {"data-role" => "listview", "data-theme" => "g"},options do
					yield if block_given?
				end
			end
			
			def numberedlist(options)
				mobile_tag :ol, {"data-role" => "listview", "data-theme" => "g"}, options do
					yield if block_given?
				end
			end
			
			protected
			
			
			def mobile_tag(tagname, default = {}, options = {})
				options = mobile_parse_options options
				content_tag tagname, default.merge(options) do
					yield if block_given?
				end
			end
			
			def mobile_div(role, options = {}, &block)
				content_tag(:div, options.merge("data-role" => role)) do
					yield if block_given?
				end
			end
		end
	end
end
