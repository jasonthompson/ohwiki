def log_in_user
  visit '/log_in'
  within('form#log_in') do
    fill_in 'email', :with => 'jason@example.ca'
    fill_in 'password', :with => 'secret'
    click_on 'Log in'
  end
end

def log_in_admin_user
  visit '/log_in'
  within('form#log_in') do
    fill_in 'email', :with => 'joe.admin@example.ca'
    fill_in 'password', :with => 'secret'
    click_on 'Log in'
  end
end

def create_user
  user = User.new(:email => 'jason@example.ca',
           :password => 'secret',
           :password_confirmation => 'secret',
           :first_name => 'Jason',
           :last_name => 'Thompson')
  user.save
  user
end

def create_admin_user
  user = User.new(:email => 'joe.admin@example.ca',
           :password => 'secret',
           :password_confirmation => 'secret',
           :first_name => 'Joe A.',
           :last_name => 'Thompson',
           :admin => "1")

  user.save
  user
end
