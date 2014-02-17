	def path_to(page_name)
	  case page_name
	  
	  when /the homepage/
	    root_path
	  when /the list of articles/
	    articles_path
	  
	  # Add more page name => path mappings here
	  
	  else
	    raise "Can't find mapping from \"#{page_name}\" to a path."
	  end
	end




Given /^I have articles titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Article.create!(:title => title)
  end
end

Given /^I have no articles$/ do
  Article.delete_all
end

Given /^I am on (.+)$/ do |page_name|
	visit path_to (page_name)
end

Then /^I should have ([0-9]+) articles?$/ do |count|
  Article.count.should == count.to_i
end

Then /^I should see "([^\"]*)"$/ do |text|
		page.should have_content (text)
end

When /^I follow "(.*?)"$/ do |link|
	click_link(link)
end

When /^I go to (.+)$/ do |page_name|
	visit path_to (page_name)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
 fill_in(field,:with=>value)
end

When /^I press "(.*?)"$/ do |button|
  click_button(button)
end
