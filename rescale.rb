# requires imagemagick
# on Ubuntu installable with
# sudo apt-get install imagemagick
def rescale_square(input_file, output_path, size)
  output_file = input.replace(/\.[^\.].*$/) + ".jpeg"
  `convert "#{input_file}" resize #{size}x#{size} "#{output_path}#{output_file}"`
end

def generate_drawable(input_filepath, output_path_root)
  drawables = [
    { name: "drawable-mdpi", size: 128 },
    { name: "drawable-hdpi", size: 192 },
    { name: "drawable-xhdpi", size: 256 },
    { name: "drawable-xxhdpi", size: 384 },
  ]
  drawables.each do |drawable|
    output_filepath = output_path_root + drawable[:name]
    rescale_square(input_filepath, output_filepath, drawable[:size])
  end
end

def main
  output_path_root = "/home/mateusz/Documents/StreetComplete/app/src/main/res/"
  generate_drawable(ARGV[0], output_path_root)
end

main
