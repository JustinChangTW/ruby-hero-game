class Monster
  attr_accessor :name,:hp,:ap # 生成能存取該 attribute 的 method
  @@monsters=[] # class variables
  # 在這裡寫入您的Monster的attributes和methods
  def initialize(name,hp,ap)
      @name = name # 要使用實例變數（Instance Variable）(@)，才可以在整個物件中使用，不然只能在method內使用
      @hp = hp
      @ap = ap
      @sp = 3
      @alive = true
      @@monsters << self
      puts "遇到怪獸 #{@name}了!"
      puts "生命力（HP）：#{@hp}"
      puts "攻擊力（AP）：#{@ap}"
      puts "--------------------"
  end
  
  # 回傳怪物們的數量
  def self.count
    return @@monsters.length
  end

  # 回傳怪物們的陣列
  def self.all
    return @@monsters
  end

  def is_alive?
    return @alive
  end

  def attack(enemy)
    
    # 判斷體力是否小於 0
    if !has_sp?
      @sp +=2
      puts "#{@name} 無法攻擊, 休息一回合，恢復 2 sp"
    else
      # 1.計算攻擊的傷害
      damang = rand(@ap/2..@ap)
      # 2.減少敵人的HP
      enemy.hp = enemy.hp - damang
  
      # 減少體力
      use_stamina
      
      puts "#{@name}攻擊"
      puts "#{enemy.name} 受到 #{damang} 點傷害"
      puts "#{enemy.name} 剩下 #{enemy.hp} 點HP"
      puts "--------------------"
  
      # 3.檢查被攻擊的敵人是否戰死
      if  enemy.hp < 1
        enemy.die
      end
    end
  end
  
  def die
    # 「活著」的狀態改變
    @alive = false
    puts "#{@name} 被打倒了"
    puts "--------------------"
  end
  
  def has_sp?
    return @sp>0
  end
  
  def use_stamina
    @sp -= 1
  end
  
end

class Ocr < Monster
    def attack(enemy)
      # 判斷體力是否小於 0
      if !has_sp?
        @sp +=2
        puts "#{@name} 無法攻擊, 休息一回合，恢復 2 sp"
      else
        # 1.計算攻擊的傷害
        damang = rand(@ap..@ap*2)
        # 2.減少敵人的HP
        enemy.hp = enemy.hp - damang
        
        # 減少體力
        use_stamina

        puts "#{@name}攻擊"
        puts "#{enemy.name} 受到 #{damang} 點傷害"
        puts "#{enemy.name} 剩下 #{enemy.hp} 點HP"
        puts "--------------------"

        # 3.檢查被攻擊的敵人是否戰死
        if  enemy.hp < 1
          enemy.die
        end
      end
    end
end

class DarkMage < Monster
  
    def initialize(name,hp,ap,mp)
      super(name,hp,ap)
      # 新增一個attribute:mp 魔法力
      @mp = mp
    end
    
    def attack(enemy)
      if @mp >= 3
        damang=dark_force
        puts "#{@name} 黑暗力量攻擊！"
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

    def dark_force
      @mp -= 3
      return rand(@ap/2..@ap)+50
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
      @sp = 3
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
    # 判斷體力是否小於 0
    if !has_sp?
      @sp +=2
      puts "#{@name} 無法攻擊, 休息一回合，恢復 2 sp"
    else
      # 1.計算攻擊的傷害
      damang = rand(@ap/2..@ap)
      # 2.減少敵人的HP
      enemy.hp = enemy.hp - damang
      
      # 減少體力
      use_stamina
      
      puts "#{@name}攻擊"
      puts "#{enemy.name} 受到 #{damang} 點傷害"
      puts "#{enemy.name} 剩下 #{enemy.hp} 點HP"
      puts "--------------------"
      
      # 3.檢查被攻擊的敵人是否戰死
      if  enemy.hp < 1
        enemy.die
      end
    end
  end
  
  def die
    # 「活著」的狀態改變
    @alive = false
    puts "#{@name} 被打倒了"
    puts "--------------------"
  end
  
  def has_sp?
    return @sp>0
  end
  
  def use_stamina
    @sp -= 1
  end
end

class HolyKnight < Hero
  def attack(enemy)
      #聖光治療
      if @hp <= 20
        heal
      end
      
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
  def heal
    @hp += 50
    puts "#{@name}聖光治療！生命力（HP）：#{@hp}"
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


class Champion < Hero
  def attack(enemy)
    # 判斷體力是否小於 0
    if !has_sp?
      @sp +=2
      puts "#{@name} 無法攻擊, 休息一回合，恢復 2 sp"
    else
        # 1.計算攻擊的傷害
        @ap = Hero.count * 50
        damang = rand(@ap/2..@ap)
        # 2.減少敵人的HP
        puts "#{enemy.name}-#{enemy.hp}"
        enemy.hp = enemy.hp - damang
        
        # 減少體力
        use_stamina

        puts "#{@name} 冠軍攻擊！"
        puts "#{enemy.name} 受到 #{damang} 點傷害"
        puts "#{enemy.name} 剩下 #{enemy.hp} 點HP"
        puts "--------------------"
        
        # 3.檢查被攻擊的敵人是否戰死
        if  enemy.hp < 1
          enemy.die
        end
      end
  end
end

champion = Champion.new("Peter", 100, 30)
hero1 = Hero.new("Roger", 100, 30)
hero2 = Hero.new("Ben", 100, 30)

hero_team = Hero.all

puts "You have #{Hero.count} heros in your team:"
hero_team.each do |hero|
  puts "#{hero.name} - Class:#{hero.class}, HP:#{hero.hp}"
end

monster1 = Monster.new("Goblin", 100, 30)
monster2 = Monster.new("Troll", 100, 30)
monster3 = Monster.new("Gremlin", 100, 30)

monster_team = Monster.all

puts "遇到 #{Monster.count} 怪獸 ！！"
monster_team.each do |hero|
  puts "#{hero.name} - Class:#{hero.class}, HP:#{hero.hp}"
end


while Hero.count >  0 && Monster.count > 0
  i=0
  for i in 0..Hero.count-1
    monster = monster_team[rand(0..Monster.count-1)]
    hero_team[i].attack(monster)

    if !(monster.is_alive?) 
      monster_team.delete(monster)
      puts "剩下#{Monster.count}個怪獸 ！！"
    end
    if Monster.count <= 0  
      break
    end
  end

  if Monster.count <= 0  
    break
  end
    
  # monster.attack(hero)
  i=0
  for i in 0..Monster.count-1
    hero = hero_team[rand(0..Hero.count-1)]
    monster_team[i].attack(hero)
   
    if !(hero.is_alive?) 
      hero_team.delete(hero)
    end
  end

end

