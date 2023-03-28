class Janken
  HANDS = ['グー', 'チョキ', 'パー']

  def start
    puts "数字を入力してください。\n0: グー\n1: チョキ\n2: パー"
    player_hand = gets.chomp.to_i

    if valid_hand?(player_hand)
      opponent_hand = rand(3)
      puts "相手の手は#{HANDS[opponent_hand]}です。"

      if player_hand == opponent_hand
        puts "あいこです。もう一度勝負してください。"
        start
      elsif (player_hand == 0 && opponent_hand == 1) || (player_hand == 1 && opponent_hand == 2) || (player_hand == 2 && opponent_hand == 0)
        puts "あなたの勝ちです。"
      else
        puts "あなたの負けです。"
      end
    else
      puts "0〜2の数字を入力してください。"
      start
    end
  end

  private

  def valid_hand?(hand)
    [0, 1, 2].include?(hand)
  end
end

janken = Janken.new
janken.start
