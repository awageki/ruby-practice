require "date"

# class Calendar
class Calendar
  DEFAULT_DATE = Date.today

  attr_reader :target_date

  def initialize(target_date = DEFAULT_DATE)
    @target_date = target_date
  end

  # クラスメソッドではなくインスタンスメソッドの方が適正？→インスタンスごとに値が変わるから
  def print_calendar
    # 年月
    puts @target_date.strftime('%B %Y').center(20) # 一行の文字列の長さを指定して中央揃え

    # 曜日を表示
    puts 'Su Mo Tu We Th Fr Sa'

    # 月末と月初の日付を取得
    this_year = @target_date.year
    this_month = @target_date.month
    first_day = Date.new(this_year, this_month, 1)
    last_day = Date.new(this_month, this_month, -1)

    # 冒頭の空白部分
    first_wday = first_day.wday # wday: 曜日を返す（0-6、日曜が0）
    blank = '   ' * first_wday
    print blank # print は改行を加えない

    # カレンダーの日付部分を表示
    display_date(last_day, first_wday) # Ruby2.7以降、selfを付けなくてもOK
  end

  private

  def display_date(last_day, first_wday)
    # 改行を含む長いブロックを書く場合はdo...end
    (1..last_day.day).each do |day| # day: 月の日を返す（1-31）
      printf('%2d ', day) # %の後の数字→桁数指定、足りない部分には空白が出力されて右詰で出力

      if ((first_wday + day) % 7).zero?
        puts "\n"
      end
    end
    puts "\n"
  end
end

# 今月のカレンダー
this_month_calendar = Calendar.new
this_month_calendar.print_calendar
# 翌月のカレンダー
next_month_calendar = Calendar.new(Date.new(2022, 11, 1))
next_month_calendar.print_calendar
