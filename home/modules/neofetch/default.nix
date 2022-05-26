_: { pkgs, config, ... }:

{
  home.packages = with pkgs; [ neofetch ];

  xdg.configFile = {
    "neofetch/logo.ascii".source = ./nixos.ascii;
    "neofetch/config.conf".text = ''
      print_info() {
          info title
          info underline

          info "distro\t" distro
          info "packages\t" packages
          info "screen\t" resolution
          prin "windows\t" "i3-gaps"
          info "terminal\t" term
          info "font\t" term_font
          info "cpu\t" cpu
          info "song\t" song

          info cols
      }

      kernel_shorthand="on"
      distro_shorthand="off"
      os_arch="off"
      uptime_shorthand="on"
      memory_percent="off"
      package_managers="tiny"
      shell_path="off"
      shell_version="on"
      speed_type="bios_limit"
      speed_shorthand="on"
      cpu_brand="off"
      cpu_speed="on"
      cpu_cores="off"
      cpu_temp="off"
      gpu_brand="on"
      gpu_type="all"
      refresh_rate="on"
      gtk_shorthand="off"
      gtk2="on"
      gtk3="on"
      public_ip_host="http://ident.me"
      public_ip_timeout=2
      disk_show=('/')
      disk_subtitle="mount"
      music_player="auto"
      song_format="%title% - %artist%"
      song_shorthand="off"
      mpc_args=()
      colors=(4 5 1 2 1 7)
      bold="on"
      underline_enabled="on"
      underline_char="─"
      separator="->"
      block_range=(0 15)
      color_blocks="on"
      block_width=3
      block_height=1
      bar_char_elapsed="-"
      bar_char_total="="
      bar_border="on"
      bar_length=15
      bar_color_elapsed="distro"
      bar_color_total="distro"
      cpu_display="off"
      memory_display="off"
      battery_display="off"
      disk_display="off"
      image_backend="ascii"
      image_source="${config.xdg.configHome}/neofetch/logo.ascii"
      ascii_distro="auto"
      ascii_colors=(5 4 3 2 1 6)
      ascii_bold="on"
      image_loop="off"
      thumbnail_dir="$(XDG_CACHE_HOME:-$(HOME)/.cache)/thumbnails/neofetch"
      crop_mode="normal"
      crop_offset="center"
      image_size="auto"
      gap=3
      yoffset=0
      xoffset=0
      background_color=
      stdout="off"
    '';
  };
}


