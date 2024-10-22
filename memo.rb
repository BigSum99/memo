require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます


loop do
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
    memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

    if memo_type == 1
        puts "拡張子を除いたファイル名を入力してください"
        file_name = gets.chomp
        puts "メモしたい内容を記入してください"
        puts "完了したらCtrl + D を押します"
        user_memo = STDIN.read
        CSV.open("#{file_name}.csv","w") do |csv|
            csv << ["content"]
            csv << [user_memo]
        end
        puts "メモを新規保存しました"
        break
    elsif memo_type == 2
        puts "編集したいファイル名を拡張子なしで入力してください"
        file_name = gets.chomp

        puts "現在のメモ"
        puts "----------"
        CSV.foreach("#{file_name}.csv", headers: true) do |row|
            puts row.to_s
        end
        puts "追加したい内容を記入してください"
        puts "完了したらctrl + D を押します"
        new_content = STDIN.read
        CSV.open("#{file_name}.csv","a") do |csv|
            csv << [new_content]
        end
        puts "編集内容を保存しました"
        break
    else
        puts "1か2を入力してください"
    end
end