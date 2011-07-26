task :test_it => :environment do

    puts "test it!"

  tester = TestMain.new

  tester.go

end



