# frozen_string_literal: false

require_relative './hexagram_renderer'

class HtmlHexagramRenderer < HexagramRenderer
  def do(hexagram: Hexagram.new([]), first: true)
    out = ''
    out += changing_art(hexagram).join('') if first
    out += render_hexagram(hexagram).join('')
    out
  end

  def render_hexagram(hexagram)
    linkaddr = make_binary_string(hexagram)
    file_lines(linkaddr)
  end

  def changing_art(hexagram = Hexagram.new(Array.new(7, 7)))
    i = -1
    o = hexagram.lines.reverse.map do |l|
      line = ''
      line << MAP[l.to_i]
      i += 1
      line << " #{6 - i} \n"
    end
    ['<pre>'] + o + ['</pre>']
  end

  def self.out(reading1, reading2)
    "#{reading1} \n #{reading2}"
  end

  def file_lines(linkaddr)
    lines = []
    File.open("#{__dir__}/../hexagrams/#{linkaddr.join}.md", 'r') do |f|
      f.each_line do |line|
        lines << line + "\n"
      end
    end
    lines
  end

  def render_from_number(num)
    file_lines(linkaddress(num)).join('')
  end

  def linkaddress(num)
    self.class::HEXLOOKUP.select { |e| e.match?(/=>#{num}\./) }.first.split('.')[0].chars.map(&:to_i)
  end

  HEXLOOKUP = %w[
    000000.md=>2._K'un_/_The_Receptive
    000001.md=>24._Fu_/_Return_(The_Turning_Point)
    000010.md=>7._Shih_/_The_Army
    000011.md=>19._Lin_/_Approach
    000100.md=>15._Ch'ien_/_Modesty
    000101.md=>36._Ming_I_/_Darkening_of_the_Light
    000110.md=>46._Shêng_/_Pushing_Upward
    000111.md=>11._T'ai_/_Peace
    001000.md=>16._Yu_/_Enthusiasm
    001001.md=>51._Chên_/_The_Arousing_(Shock,_Thunder)
    001010.md=>40._Hsieh_/_Deliverance
    001011.md=>54._Kuei_Mei_/_The_Marrying_Maiden
    001100.md=>62._Hsiao_Kuo_/_Preponderance_of_the_Small
    001101.md=>55._Fêng_/_Abundance_(Fullness)
    001110.md=>32._Hêng_/_Duration
    001111.md=>34._Ta_Chuang_/_The_Power_of_the_Great
    010000.md=>8._Pi_/_Holding_Together_(Union)
    010001.md=>3._Chun_/_Difficulty_at_the_Beginning
    010010.md=>29._K'an_/_The_Abysmal_(Water)
    010011.md=>60._Chieh_/_Limitation
    010100.md=>39._Chien_/_Obstruction
    010101.md=>63._Chi_Chi_/_After_Completion
    010110.md=>48._Ching_/_The_Well
    010111.md=>5._Hsu_/_Waiting_(Nourishment)
    011000.md=>45._Ts'ui_/_Gathering_Together_(Massing)
    011001.md=>17._Sui_/_Following
    011010.md=>47._K'un_/_Oppression_(Exhaustion)
    011011.md=>58._Tui_/_The_Joyous,_Lake
    011100.md=>31._Hsien_/_Influence_(Wooing)
    011101.md=>49._Ko_/_Revolution_(Molting)
    011110.md=>28._Ta_Kuo_/_Preponderance_of_the_Great
    011111.md=>43._Kuai_/_Break-through_(Resoluteness)
    100000.md=>23._Po_/_Splitting_Apart
    100001.md=>27._I_/_The_Corners_of_the_Mouth_(Providing_Nourishment)
    100010.md=>4._Mêng_/_Youthful_Folly
    100011.md=>41._Sun_/_Decrease
    100100.md=>52._Kên_/_Keeping_Still,_Mountain
    100101.md=>22._Pi_/_Grace
    100110.md=>18._Ku_/_Work_on_What_Has_Been_Spoiled_(Decay)
    100111.md=>26._Ta_Ch'u_/_The_Taming_Power_of_the_Great
    101000.md=>35._Chin_/_Progress
    101001.md=>21._Shih_Ho_/_Biting_Through
    101010.md=>64._Wei_Chi_/_Before_Completion
    101011.md=>38._K'uei_/_Opposition
    101100.md=>56._Lu_/_The_Wanderer
    101101.md=>30._Li_/_The_Clinging,_Fire
    101110.md=>50._Ting_/_The_Caldron
    101111.md=>14._Ta_Yu_/_Possession_in_Great_Measure
    110000.md=>20._Kuan_/_Contemplation_(View)
    110001.md=>42._I_/_Increase
    110010.md=>59._Huan_/_Dispersion_(Dissolution)
    110011.md=>61._Chung_Fu_/_Inner_Truth
    110100.md=>53._Chien_/_Development_(Gradual_Progress)
    110101.md=>37._Chia_Jên_/_The_Family_(The_Clan)
    110110.md=>57._Sun_/_The_Gentle_(The_Penetrating,_Wind)
    110111.md=>9._Hsiao_Ch'u_/_The_Taming_Power_of_the_Small
    111000.md=>12._P'i_/_Standstill_(Stagnation)
    111001.md=>25._Wu_Wang_/_Innocence_(The_Unexpected)
    111010.md=>6._Sung_/_Conflict
    111011.md=>10._Lu_/_Treading_(Conduct)
    111100.md=>33._Tun_/_Retreat
    111101.md=>13._T'ung_Jên_/_Fellowship_with_Men
    111110.md=>44._Kou_/_Coming_to_Meet
    111111.md=>1._Ch'ien_/_The_Creative
  ].freeze
end
