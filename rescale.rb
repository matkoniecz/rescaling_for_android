# requires imagemagick
# on Ubuntu installable with
# sudo apt-get install imagemagick
def rescale_square(input_file, output_path, size)
    output_file = input.replace(/\.[^\.].*$/) + ".jpeg"
    `convert "#{input_file}" resize #{size}x#{size} "#{output_path}#{output_file}"`
end

def main
    drawables = [
        {name: "drawable-mdpi", size: 128},
        {name: "drawable-hdpi", size: 192},
        {name: "drawable-xhdpi", size: 256},
        {name: "drawable-xxhdpi", size: 384},
    ]
    output_path_root = "/home/mateusz/Documents/StreetComplete/app/src/main/res/"
    puts "#{ARGV[0]}"
    drawables.each do |drawable|
      rescale_square(ARGV[0], output_path_root + drawable[:name], drawable[:size])
    end
end

main
