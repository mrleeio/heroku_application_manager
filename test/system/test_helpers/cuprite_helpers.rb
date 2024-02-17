module CupriteHelpers
  def pause
    page.driver.pause
  end

  def debug(*args)
    page.driver.debug(*args)
  end
end
