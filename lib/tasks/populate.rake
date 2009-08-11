namespace :db do
  desc "Erase and fill database with default data"
  task :populate => :environment do
    require 'populator'
    
    #Drop all data from these tables
    [Category, Product, Tagline, Post].each(&:delete_all)
    
    #Populate categories and products, with no pictures.
    Category.populate 3 do |category|
      category.name = Populator.words(1..3).titleize
      Product.populate 3..6 do |product|
        product.category_id = category.id
        product.name = Populator.words(1..3).titleize
        product.description = Populator.sentences(2..10)
        product.created_at = 2.weeks.ago..Time.now
        product.disabled = false
      end
    end
    
    #Create dummy Blog posts
    Post.populate 10 do |post|
      post.title = Populator.words(1..3).titleize
      post.body = Populator.paragraphs(3..20)
      post.created_at = 2.weeks.ago..Time.now
    end
    
    #Create dummy Taglines
    Tagline.populate 6 do |tagline|
      tagline.tagline = Populator.words(3..4).titleize
      tagline.description = Populator.paragraphs(1)
    end
  end
end