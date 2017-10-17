module ApplicationHelper


  def page_title(title)
    title += " | " if title.present?
    title += " GamerNow"
  end

  def slides()
    Slide.last(5)
  end

  def videos()
    Video.last(3)
  end

  def random_posts()
    Post.order_by_rand.limit(3).where(status: "published").all
  end

  def related_posts()
    Post.order_by_rand.limit(9).where(status: "published").all
  end

  def top_games1()
    Game.order("views DESC").limit(5)
  end

  def top_games2()
    Game.order("views DESC").limit(5).offset(5)
  end

  def top_reviews()
    Post.order("views DESC").where(category_id: 2).where(status: "published").take(3)
  end

  def is_path?(*paths)
    paths.include?(request.path)
  end



end
