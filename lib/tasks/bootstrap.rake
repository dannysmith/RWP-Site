namespace :db do
  desc "Loads an admin user, default pages and a site object into the database. Run rake db:populate to insert dummy data."
  task :bootstrap => :environment do
    
    #Drop any site which exists and all users/sites.
    [Page, User, Site].each(&:delete_all)
    
    
    #Create admin User danny
    User.create(:id => 1,
                :username         => "danny",
                :email            => "danny@dasmith.co.uk",
                :password         => "madasafish",
                :created_at       => Time.now,
                :updated_at       => Time.now,
                :first_name       => "Danny",
                :surname          => "Smith",
                :phone            => "01323123456",
                :company_name     => "RWP Group",
                :number_of_logins => 0,
                :admin            => true,
                :country          => "United Kingdom").save!
    
    #Create Site object
    Site.create(:id => 1,
                :display_blog     => true,
                :rss_message      => "",
                :new_user_message => "Welcome, Welcome, Welcome!!").save!
                
    #Create Pages.
    Page.create(:title => "Ethics & Recycling",
                            :name     => "ethics",
                            :content  => "<h2>An ethical company</h2>\n<p>[Include some stuff about local companies] Ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<h2>Recycling & materials</h2>\n%p Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
                            :disabled => false,
                            :site_id  => 1).save!
    
    Page.create(:title => "History",
                            :name     => "history",
                            :content  => "<p>Lorem Ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<h2>Recycling & materials</h2>\n%p Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
                            :disabled => false,
                            :site_id  => 1).save!
                            
    Site.first.pages.create(:title    => "Contact",
                            :name     => "<div class='contact'>\n          <address>\n            RWP Group\n            108 Wick Street\n            Littlehampton\n            West Sussex\n            BN17 7JS\n            United Kingdom\n          </address>\n          <p class='phone'>\n            +44 (0)845 450 6605\n          </p>\n          <p class='fax'>\n            +44 (0)845 450 6606\n          </p>\n          <p class='email'>\n            Sales & Enquieries <span>sales@rwpgroup.com</span>\n          </p>\n          <p class='email'>\n            Accounts <span>accounts@rwpgroup.com</span>\n          </p>\n          <p class='email'>\n            Estimates <span>estimates@rwpgroup.com</span>\n          </p>\n<iframe width='425' height='350' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=108+Wick+Street&amp;sll=50.819321,-0.543931&amp;sspn=0.000685,0.002052&amp;num=10&amp;ie=UTF8&amp;ll=50.843237,-0.355682&amp;spn=0.303505,0.583649&amp;z=10&amp;output=embed'></iframe><br /><small><a href='http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=108+Wick+Street&amp;sll=50.819321,-0.543931&amp;sspn=0.000685,0.002052&amp;num=10&amp;ie=UTF8&amp;ll=50.843237,-0.355682&amp;spn=0.303505,0.583649&amp;z=10' style='color:#0000FF;text-align:left'>View Larger Map</a></small>",
                            :content  => "ehlo",
                            :disabled => false).save!
    
  end
end