require 'date'

# 年月：August 2022
today = Date.today
month_year = today.strftime('%B %Y')

# 曜日：Su Mo Tu We Th Fr Sa
day_of_week = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"]

# 月末の日付を取得
this_year = today.strftime('%Y')
this_month = today.strftime('%m')
begin_month = Date.new(this_year.to_i, this_month.to_i, -1)
this_month_days = begin_month.strftime('%e').to_i

puts begin_month
