module Yeah

class Invisible
  def self.size
    @size
  end
  def self.size=(value)
    @size = value
  end

  def size
    @size ||= self.class.size || V[]
  end
  attr_writer :size

  def thing
    @thing ||= Thing.new
  end
  def thing=(val)
    @thing = val
    @thing.visual = self unless @thing.visual == self
  end

  def render; end

  private

  def screen
    thing.game.context.screen
  end
end

end
