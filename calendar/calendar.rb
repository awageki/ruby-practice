require 'date'

# 年月：August 2022
today = Date.today
month_year = today.strftime('%B %Y')

# 今月末の日付を取得
this_year = today.strftime('%Y')
this_month = today.strftime('%m')
end_month = Date.new(this_year.to_i, this_month.to_i, -1)
end_month_day = end_month.strftime('%e').to_i

# 今月1日の曜日を数字で取得（月曜日を1）
begin_month = Date.new(this_year.to_i, this_month.to_i, 1)

# 日曜の場合、番号を0に変更
week_number = begin_month.strftime('%u').to_i == 7 ? 0 : begin_month.strftime('%u').to_i

# 週ごとに表示するデータ（行）を生成する関数
def create_week(
  week,
  week_number,
  end_month_day
)
  new_week = ''
  week.each do |n|
    new_week_number = n - week_number
    new_week << if new_week_number.positive? && new_week_number < 10 # 一桁の場合、前にスペースを入れる
                  " #{new_week_number} "
                  # " " + new_week_number.to_s + " "
                elsif new_week_number >= 10 && new_week_number <= end_month_day
                  "#{new_week_number} "
                else
                  '   '
                end
  end
  new_week
end

# 各行を文字列として保持しておく必要あり
week1 = [1, 2, 3, 4, 5, 6, 7]
new_week1 = create_week(week1, week_number, end_month_day)

week2 = [8, 9, 10, 11, 12, 13, 14]
new_week2 = create_week(week2, week_number, end_month_day)

week3 = [15, 16, 17, 18, 19, 20, 21]
new_week3 = create_week(week3, week_number, end_month_day)

week4 = [22, 23, 24, 25, 26, 27, 28]
new_week4 = create_week(week4, week_number, end_month_day)

week5 = [29, 30, 31, 32, 33, 34, 35]
new_week5 = create_week(week5, week_number, end_month_day)

week6 = [36, 37, 38]
new_week6 = create_week(week6, week_number, end_month_day)

doc = <<~EOF
    #{month_year}
Su Mo Tu We Th Fr Sa
#{new_week1}
#{new_week2}
#{new_week3}
#{new_week4}
#{new_week5}
#{new_week6}
EOF

puts doc
