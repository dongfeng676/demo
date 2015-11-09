namespace :article do
  desc "test optimistic locking"
  task :optimistic_lock1 => :environment do
    a = Article.find(49)
    sleep(3)
    for i in 1..20
      a.update_attributes(text:a.text+i.to_s)
      puts a.inspect
    end
  end

  task :optimistic_lock2 => :environment do
    a = Article.find(49)
    for i in 1..20
      a.update_attributes(text:a.text+(i**2).to_s)
      puts a.inspect
    end
  end


end
