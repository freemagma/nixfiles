_:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Charles Gunn";
      user.email = "me@cjgunn.com";
      init.defaultBranch = "main";
    };
  };
}
