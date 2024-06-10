{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mdafanasev";
  home.homeDirectory = "/home/mdafanasev";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    wl-clipboard
    nerdfonts
    telegram-desktop
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mdafanasev/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userName = "Max Afanasev";
    userEmail = "max@afsv.me";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      push.autoSetupRemote = true;
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding.x = 2;
	padding.y = 0;
	dynamic_padding = true;
	decorations = "none";
      };
      scrolling = {
        history = 10000;
	multiplier = 3;
      };
      font = {
        normal = {
	  family = "Iosevka Nerd Font Mono";
	  style = "Regular";
	};
        bold = {
	  family = "Iosevka Nerd Font Mono";
	  style = "Regular";
	};
        italic = {
	  family = "Iosevka Nerd Font Mono";
	  style = "Regular";
	};
        bold_italic = {
	  family = "Iosevka Nerd Font Mono";
	  style = "Regular";
	};
	size = 12;
      };
      env.TERM = "xterm-256color";
      colors = {
        primary.background = "0x1a1b26";
        primary.foreground = "0xa9b1d6";
        normal.black = "0x32344a";
        normal.red = "0xf7768e";
        normal.green = "0x9ece6a";
        normal.yellow = "0xe0af68";
        normal.blue = "0x7aa2f7";
        normal.magenta = "0xad8ee6";
        normal.cyan = "0x449dab";
        normal.white = "0x787c99";
        bright.black = "0x444b6a";
        bright.red = "0xff7a93";
        bright.green = "0xb9f27c";
        bright.yellow = "0xff9e64";
        bright.blue = "0x7da6ff";
        bright.magenta = "0xbb9af7";
        bright.cyan = "0x0db9d7";
        bright.white = "0xacb0d0";
      };
      selection.save_to_clipboard = true;
      mouse.hide_when_typing = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
