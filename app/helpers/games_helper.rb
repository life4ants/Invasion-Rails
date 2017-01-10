module GamesHelper
  def creator_of(game)
    game.players.where(admin:true).first.user.name
  end

  def is_creator_of?(game)
    current_user == game.players.where(admin:true).first.user
  end

  def has_joined(game)
    players = game.player_ids
    players.each do |id|
      if Player.find(id).user == current_user
        return true
      end
    end
    return false
  end

  def territory_owner(territory)
    num = @game.territory_owners.first[:"terr#{territory}Owner"]
    user = User.find(num)
    gravatar_for(user, size: 20, class: "gravatar circle-img color#{num}")
  end

  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end

  def terri_owner(territory)
    num = @game.territory_owners.first[:"terr#{territory}Owner"]
    icon = Player.find(num).icon
    svg_icon(icon, "svg#{territory}", 25)
  end

  def icon_for(player, size=15)
    svg_icon(player.icon, "player#{player.id}", size)
  end

  def svg_icon(numcode, id, size) #returns the shape and color for a icon code
    color = (numcode - numcode % 10)/10
    shape = numcode % 10
    shapes =
      [{cords: "d='m0.5,5 c 4,-8 12,1 12,1 0,0 8,-9 12,-1 3,8 -5,14 -12,20 -7,-6 -15,-12 -12,-20 z'", type: "path"}, #heart
      {cords: "d='m25,1 -9,12 9,12 -25,0 9,-12 -9,-12 z'", type: "path"}, #hourglass
      {cords: "y='1' width='24' height='24'", type: "rect"}, #square
      {cords: "d='m0,25 25,0 -12.5,-24z'", type: "path"}, #triangle
      {cords: "d='m0.5,1 12,5.5 12,-5.5 -5.5,12 5.5,12 -12,-5.5 -12,5.5 5.5,-12 z'", type: "path"}, #4-sided star
      {cords: "cx='12.5' cy='13' r='12.5'", type: "circle"}, #circle
      {cords: "d='m8.8,1 0,8.8 -8.8,0 0,7 8.8,0 0,8.8 7,0 0,-8.8 8.8,0 0,-7 -8.8,0 0,-8.8 -7,0z'", type: "path"}, #cross
      {cords: "d='m0,13.5 12.5,-12.5 12.5,12.5 -12.5,12.5z'", type: "path"}, #diamond
      {cords: "d='m12,1 a 12,12 0 0 0 -12,12 12.108591,12.108591 0 0 0 12,12.2168 12.108591,12.108591 0 0 0 12.10937,-12.10937" +
      "A 12.108591,12.108591 0 0 0 12,1 Z m -0.0742,5.0918 a 7.0915475,7.0915475 0 0 1 7.08984,7.0918 7.0915475,7.0915475 0 0 1" +
      "-7.08984,7.09179 7.0915475,7.0915475 0 0 1 -7.0918,-7.09179 7.0915475,7.0915475 0 0 1 7.0918,-7.0918z'", type: "path"}, #donut
      {cords: "d='m23,20.5 -6.75,-3.94 0.45,7.86 -3.14,-7.16 -4.26,6.63 1.67,-7.64 -7.34,2.86 5.84,-5.2 -7.62,-2 7.77645,-0.77" +
      "-4.99,-6.1 6.75,3.94 -0.45,-7.86 3.14,7.16 4.26,-6.63 -1.67,7.64 7.34,-2.86 -5.84,5.2 7.62,2 -7.78,0.77z'", type: "path"}] # star
    colors = ["#OOOOOO", "#FF00FF", "#FF0000", "#FFFF00", "#00FF00", "#00FFFF", "#0000FF", "#FFFFFF", "#764710", "#FF8000"];
    data = <<-EOS.gsub(/^[\s\t]*|[\s\t]*\n/, '') # no space "\s" for new line "\n"; kill tabs too
    <svg id='#{id}' version='1.1' height='#{size}' width='#{size}' viewbox='0 0 26.5 28.5' style='background-color: none'>
      <#{shapes[shape][:type]} style='fill: #{colors[color]}; stroke:black; stroke-width:0.8'
      #{shapes[shape][:cords]} />
    </svg>
    EOS
    data.html_safe
  end
end
