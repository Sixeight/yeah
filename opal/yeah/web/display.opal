module Yeah
module Web
class Display
  def initialize(args = {})
    @canvas = `document.querySelectorAll(#{args.fetch(:canvas_selector)})[0]`
    @context = `#@canvas.getContext('2d')`

    self.size = args.fetch(:size)
  end

  def size
    V[`#@canvas.width`, `#@canvas.height`]
  end
  def size=(value)
    `#@canvas.width =  #{value.x}`
    `#@canvas.height = #{value.y}`
  end

  def fill
    C[`#@context.fillStyle`]
  end
  def fill=(color)
    `#@context.fillStyle = #{color.to_hex}`
  end

  def color_at(position)
    data = `#@context.getImageData(#{position.x}, #{position.y}, 1, 1).data`
    C[`data[0]`, `data[1]`, `data[2]`]
  end

  def rectangle(position, size)
    `#@context.fillRect(#{position.x}, #{position.y}, #{size.x}, #{size.y})`
  end

  def draw_image(image, position)
    `#@context.drawImage(#{image.to_n}, #{position.x}, #{position.y})`
  end
end
end
end
