{ opts, ... }: {
  home-manager.sharedModules = [
    (_: {
      programs.git = {
        enable = true;
        userName = "${opts.gitUserName}";
        userEmail = "${opts.gitUserEmail}";
      };
    })
  ];
}

