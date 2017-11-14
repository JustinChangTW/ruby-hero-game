class Monster
  attr_accessor :name,:hp,:ap # 生成能存取該 attribute 的 method
  # 在這裡寫入您的Monster的attributes和methods
  def initialize(name,hp,ap)
      @name = name # 要使用實例變數（Instance Variable）(@)，才可以在整個物件中使用，不然只能在method內使用
      @hp = hp
      @ap = ap
      @alive = true

      puts "遇到怪獸 #{@name}了!"
      puts "生命力（HP）：#{@hp}"
      puts "攻擊力（AP）：#{@ap}"
      puts "--------------------"
  end

  def is_alive?
    return @alive
  end

  def attack(enemy)
    # 1.計算攻擊的傷害
    damang = rand(@ap/2..@ap)
    # 2.減少敵人的HP
    enemy.hp = enemy.hp - damang

    puts "#{@name}攻擊"
    puts "#{enemy.name} 受到 #{damang} 點傷害"
    puts "#{enemy.name} 剩下 #{enemy.hp} 點HP"
    puts "--------------------"

    # 3.檢查被攻擊的敵人是否戰死
    if  enemy.hp < 1
      enemy.die
    end
  end
  def die
    # 「活著」的狀態改變
    @alive = false
    puts "#{@name} 被打倒了"
    puts "--------------------"
  end
end

class Hero
  attr_accessor :name,:hp,:ap # 生成能存取該 attribute 的 method
  # 在這裡寫入您的Monster的attributes和methods
  def initialize(name,hp,ap)
      @name = name # 要使用實例變數（Instance Variable）(@)，才可以在整個物件中使用，不然只能在method內使用
      @hp = hp
      @ap = ap
      @alive = true
      
      puts "勇者 #{@name}了！"
      puts "生命力（HP）：#{@hp}"
      puts "攻擊力（AP）：#{@ap}"
      puts "--------------------"
  end

  def is_alive?
    return @alive
  end

  def attack(enemy)
    # 1.計算攻擊的傷害
    damang = rand(@ap/2..@ap)
    # 2.減少敵人的HP
    enemy.hp = enemy.hp - damang
    
    puts "#{@name}攻擊"
    puts "#{enemy.name} 受到 #{damang} 點傷害"
    puts "#{enemy.name} 剩下 #{enemy.hp} 點HP"
    puts "--------------------"
    
    # 3.檢查被攻擊的敵人是否戰死
    if  enemy.hp < 1
      enemy.die
    end
  end
  def die
    # 「活著」的狀態改變
    @alive = false
    puts "#{@name} 被打倒了"
    puts "--------------------"
  end
end

hero = Hero.new("Hero",300,30)

monster = Monster.new("Bone",1000,30)
monster.name # 有設定 attr_accessor才能直接存取 name

while hero.is_alive? && monster.is_alive?

  hero.attack(monster)
  if !(monster.is_alive?) 
    break
  end
  monster.attack(hero)

end

