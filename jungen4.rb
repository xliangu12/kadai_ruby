class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "[0]:グー\n[1]:チョキ\n[2]:パー"
        player_hand = gets.chomp

        unless player_hand == "0" || player_hand == "1" || player_hand == "2"
          puts "無効な値、再戦。"
          return hand
        else
          player_hand = player_hand.to_i
          player_nandayo = ["グー","チョキ","パー"]

          return[player_hand, player_nandayo]
        end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_hand = rand(0..2)
    enemy_nandayo = ["グー","チョキ","パー"]

    return [enemy_hand, enemy_nandayo]
  end
end

class Janken
  def pon(player_return_value, enemy_return_value)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーenのうち、何を出したのかも表示させる
    #playerの数字が返る
    player_hand = player_return_value[0]
    # playerの["グー","チョキ","パー"]
    player_nandayo = player_return_value[1]
    # enemy の数字が返る
    enemy_hand = enemy_return_value[0]
    # ["グー", "チョキ", "パー"]
    enemy_nandayo = enemy_return_value[1]

    verdict = (player_hand - enemy_hand + 3) % 3

    case verdict
      when 2 then
        puts "相手の手は#{enemy_nandayo[enemy_hand]}、あなたは#{player_nandayo[player_hand]}、勝ち！"
        # return false
      when 1 then
        puts "相手の手は#{enemy_nandayo[enemy_hand]}、あなたは#{player_nandayo[player_hand]}、残念だけど負け。"
        # return false
      when 0 then #selfはclass名Jankenと等しく、置き換えても良い
        puts "相手の手は#{enemy_nandayo[enemy_hand]}、あなたも#{player_nandayo[player_hand]}であいこ、もう１回やろう。"
        return self.pon(Player.new.hand, Enemy.new.hand)
    end

    # next_game = true
    #
    # while next_game do
    #   next_game = self.pon(Player.new.hand, Enemy.new.hand)
    # end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)

