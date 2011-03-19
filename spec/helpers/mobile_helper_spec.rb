require "spec_helper"

describe ActionView::Helpers::JqueryMobileHelper, :type => :helper do
	describe "mobile page" do
		it "should output data-role pages" do
		 	helper.page() do
		 		"Yahoo!"
		 	end.should eql('<div data-role="page">Yahoo!</div>')
		end
		it "should take a class and id " do
			helper.page :class => "cool", :id => "crazy" do
				"Yahoo!"
			end.should have_selector("div[data-role='page'].cool#crazy", :content=>"Yahoo!")
		end
	end
	
	describe "content" do
		it "should output" do
			helper.content :class => "cool", :id=>"kewl" do
				"COOOL"
			end.should have_selector("div[data-role='content'].cool#kewl", :content => "COOOL")
		end
	end
	
	describe "navbar" do
		it "has output" do
			navbar :class => "klass", :id=>"eye-d" do
				"Navigation"
			end.should have_selector("div[data-role='navbar'].klass#eye-d", :content => "Navigation")
		end
	end
	
	describe "listview" do
		it "has output" do
			helper.listview.should have_selector("ul[data-role='listview'][data-theme='g']")
			helper.listview("theme" => "c").should have_selector("ul[data-role='listview'][data-theme='c']")
		end
	end
	
	describe "mobile parse options" do
		it "should replace theme with data-theme" do
			opts = mobile_parse_options "theme" => "c"
			opts.should eql("data-theme" => "c")
			
			opts = mobile_parse_options :theme => "c"
			opts.should eql("data-theme" => "c")
		end
	end
	
	describe "content_tag with block" do
		it "should replace theme with data-theme" do
			content_tag(:div, {:class => "wee", :theme => "c"}) do
				""
			end.should have_selector("div.wee[data-theme='c']")
		end
	end
	
	describe "content_tag without block" do
		it "should replace theme with data-theme" do
			content_tag(:div, "aaa", {:class => "wee", :theme => "c"}).should have_selector("div.wee[data-theme='c']")
		end
	end
end
