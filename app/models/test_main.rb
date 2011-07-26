class TestMain

  def go
    puts "TestMain::go"

    counties = load_csv()

    puts "Counties loaded : #{counties.size}"
    #counties.each {|x| puts "#{x} ~ #{replace_non_ascii x}"}

    #do stuff in parallel
    Parallel.each(counties, :in_threads => 5) do |x|
      counties.each {|x| puts "#{x} ~ #{replace_non_ascii x}"}
    end
  end

  def load_csv
    puts "load csv"
    arr_of_rows = FasterCSV.read("counties_view.csv")
    counties = []
    arr_of_rows.each {|row| counties << row[5]}
    return counties
  end

  def replace_non_ascii in_string
#    return in_string.chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
    return in_string.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').to_s
    #return in_string.mb_chars.normalize(:kd).gsub(/[^\u0080-\u00ff]/n,'').to_s
  end


end