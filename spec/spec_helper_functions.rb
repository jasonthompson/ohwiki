def log_in_user
  visit '/log_in'
  within('form#log_in') do
    fill_in 'email', :with => 'jason@example.ca'
    fill_in 'password', :with => 'secret'
    click_on 'Log in'
  end
end
