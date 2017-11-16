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

  @@heroes=[] # class variables 
  # 在這裡寫入您的Monster的attributes和methods
  def initialize(name,hp,ap)
      @name = name # 要使用實例變數（Instance Variable）(@)，才可以在整個物件中使用，不然只能在method內使用
      @hp = hp
      @ap = ap
      @alive = true
      
      @@heroes << self # self：object本身（this)，<<:放入陣列尾端

      puts "勇者 #{@name}了！"
      puts "生命力（HP）：#{@hp}"
      puts "攻擊力（AP）：#{@ap}"
      puts "--------------------"
  end

  # 回傳英雄們的數量
  def self.count
    return @@heroes.length
  end

  # 回傳英雄們的陣列
  def self.all
    return @@heroes
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

class HolyKnight < Hero
  def attack(enemy)
      # 1.計算攻擊的傷害
      damang = rand(@ap..@ap*2)
      # 2.減少敵人的HP
      enemy.hp = enemy.hp - damang
      
      puts "#{@name}發出聖光！"
      puts "#{enemy.name} 受到 #{damang} 點傷害"
      puts "#{enemy.name} 剩下 #{enemy.hp} 點HP"
      puts "--------------------"
      
      # 3.檢查被攻擊的敵人是否戰死
      if  enemy.hp < 1
        enemy.die
      end
  end
end

class Mage < Hero
  def initialize(name,hp,ap,mp)
    super(name,hp,ap)
    # 新增一個attribute:mp 魔法力
    @mp = mp
  end
    
    def attack(enemy)
      if @mp >= 3
        damang=fireball
        puts "#{@name}發出火球！"
        puts "#{enemy.name} 受到 #{damang} 點傷害"
        puts "#{enemy.name} 剩下 #{enemy.hp} 點HP"
        puts "--------------------"
        # 1.計算攻擊的傷害
        damang = rand(@ap..@ap*2)
        # 2.減少敵人的HP
        enemy.hp = enemy.hp - damang
        # 3.檢查被攻擊的敵人是否戰死
        if  enemy.hp < 1
          enemy.die
        end
      elsif @mp < 3
        super(enemy)
      end
    end

    def fireball
      @mp -= 3
      return rand(@ap/2..@ap)+50
    end
end

hero = Hero.new('Hero',300,30)
holy_knight = HolyKnight.new('HolyKnight',300,30)
mage = Mage.new('Mage',100,20,50)

team = Hero.all

puts "You have #{Hero.count} heros in your team:"
team.each do |hero|
  puts "#{hero.name} - Class:#{hero.class}, HP:#{hero.hp}"
end

monster = Monster.new('Bone',1000,30)

while hero.is_alive? && monster.is_alive?

  hero.attack(monster)
  holy_knight.attack(monster)
  mage.attack(monster)
  if !(monster.is_alive?) 
    break
  end
  monster.attack(hero)

end

