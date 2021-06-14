$hand = {0 => "グー", 1=> "チョキ", 2 =>"パー"}
$hoi = {0 => "上", 1=> "下", 2 =>"左", 3=>"右"}

def game_start()
    puts "じゃんけん..."
    puts "0(グー)1(チョキ)2(パー)その他(戦わない)"
    myhand = gets.chomp.to_i
    unless ([0, 1, 2]).include?(myhand)
        puts("さようなら")
        exit
    end  
    cphand = rand(3)
    puts "あなた:"+ $hand[myhand]
    puts "CP:"+ $hand[cphand]
    janken(myhand, cphand)
end

def acchimuite(result)
    puts "あっちむいて～"
    puts "0(上)1(下)2(左)3(右)"
    myhoi = gets.chomp.to_i
    cphoi = rand(4)
    puts "ほい！"
    unless ([0, 1, 2, 3]).include?(myhoi)
        if result == "win"
            puts("あなたはどちらも指さなかった...")
        else
            puts("あなたは顔を動かさなかった...反則負け！")
        end
    else
        puts "あなた:"+ $hoi[myhoi]
        puts "CP:"+ $hoi[cphoi]   
        if myhoi == cphoi
            if result == "win"
                puts "あなたの勝ち！"
            else
                puts "CPの勝ち！"
            end
        end
    end
    puts("----------------------")
    game_start()
end



def janken(myhand, cphand)
    if myhand == cphand
        puts "あいこで.."
        puts "0(グー)1(ちょき)2(パー)その他(諦める)"
        myhand = gets.chomp.to_i
        if ([0,1,2]).include?(myhand)
            cphand = rand(3)
            puts "あなた:"+ $hand[myhand]
            puts "CP:"+ $hand[cphand]
        else
            puts("さようなら")
            exit
        end
        janken(myhand, cphand)
    elsif (myhand == 0 && cphand == 1) || (myhand == 1 && cphand == 2) || (myhand == 2 && cphand == 0)
        result = "win"
    else
        result = "lose"
    end
    acchimuite(result)
end

game_start()