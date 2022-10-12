require "date"

# 年月
year_month = Date.today.strftime('%B %Y')
puts year_month.center(20) # 一行の文字列の長さを指定して中央揃え

# 曜日を表示
puts 'Su Mo Tu We Th Fr Sa'

# 月末と月初の日付を取得
this_year = Date.today.year
this_month = Date.today.month
first_day = Date.new(this_year, this_month, 1)
last_day = Date.new(this_month, this_month, -1)

# 冒頭の空白部分
first_wday = first_day.wday # wday: 曜日を返す（0-6、日曜が0）
blank = '   ' * first_wday
print blank

# 日付部分の表示
# 改行を含む長いブロックを書く場合はdo...end
(1..last_day.day).each do |day| # day: 月の日を返す（1-31）
  printf('%2d ', day) # %の後の数字→桁数指定、足りない部分には空白が出力されて右詰で出力

  if ((first_wday + day) % 7).zero?
    puts "\n"
  end
end
puts "\n"
