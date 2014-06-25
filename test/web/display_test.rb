require 'yeah/web'

class DisplayTest < Test
  include Yeah::Web

  def setup
    `document.body.appendChild(document.createElement('canvas'))`

    @object = Display.new(
      canvas_selector: 'canvas',
      size: V[400, 400]
    )
  end

  def test_implements_display_interface
    methods = %i[size size= color_at clear rectangle]
    methods.each { |m| assert_respond_to(@object, m) }
  end

  def test_clear_fills_all_with_black
    rect_position = V[10, 10]
    rect_size =     V[1, 1]
    rect_color =    C[255, 255, 255]
    clear_color =   C[0, 0, 0]

    @object.rectangle(rect_position, rect_size, rect_color)

    @object.clear

    assert_equal(clear_color, @object.color_at(rect_position))
  end

  def test_rectangle_fills_area_with_color
    position = V[100, 200]
    size =     V[100, 100]
    color =    C[255, 128, 0]

    @object.rectangle(position, size, color)

    topleft = position
    middle = V[position.x + size.x / 2, position.y + size.y / 2]
    bottomright = V[position.x + size.x - 1, position.y + size.y - 1]

    [topleft, middle, bottomright].each do |position|
      assert_equal(color.value, @object.color_at(position).value)
    end
  end
end
