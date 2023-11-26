class HomeHandler < Marten::Handler
  def get
    render("home.html", context: {hosts: Agent.all})
  end
end
