require 'player'

class Printer
  def self.player.name
    print "Player name"
    name = gets.chomp
    name
  end

  def self.show_base_actions
    puts "Enter n - to start new game"
    puts "Enter q - tu quit game"
  end

  def self.show_player_score(player, score)
    puts "#{player.type} - #{player.name}: #{score}"
  end

  def self.show_cards(player)
    player.cards.each do |card|
      puts "You have #{card}" if player.type = :player
      puts "Dealer card: (0_0)" if player.type = :dealer
    end
  end

  def self.print_message(msg)
    puts msg
  end

  def self.show_banl(bank_money)
    puts "Amoun of money in bank: #{bank_money}"
  end

  def self.show_choise(player)
    if player.type == :player ? self.player_choice : self.dealer_choice
  end

  protected
  def self.player_choice
    puts 'Choose action: '
    puts '1. if you want to hit'
    puts '2. if you want to pass'
    puts '3. if you want to open the cards'
    puts '0. if you want to exit'
  end
  
  def self.dealer_choice
    puts 'Choose action: '
    puts '1. if you want to hit'
    puts '2. you want to skip'
    puts '0. if you want to exit'
  end
end