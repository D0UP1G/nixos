{ pkgs, ... }:

{
  # Вариант 1: Через xdg.configFile (более гибкий)
  xdg.configFile = {
    "wofi/config".text = ''
      show=drun
      width=400
      height=400
      always_parse_args=true
      show_all=false
      print_command=true
      insensitive=true
      prompt=YO-Ho-Ho-Ho-Ho
    '';
    
    "wofi/style.css".text = ''
      @define-color primary #edddc7;
      @define-color secondary #595959;
      @define-color background #1C1B1F;
      @define-color surface #212121;
      @define-color on-primary #595959;
      @define-color on-secondary #CAC4D0;
      @define-color on-background #E6E1E5;
      @define-color on-surface #595959;

      * {
          font-family: "Iosevka Nerd Font", monospace;
          font-weight: bold;
          font-size: 14px;
      }

      *:selected {
          color: @on-primary;
          background-color: @primary;
      }

      /* Window */
      window {
          margin: 0px;
          padding: 10px;
          border: 3px solid @on-primary;
          border-radius: 7px;
          background-color: @background;
          animation: slideIn 0.5s ease-in-out both;
      }

      /* Slide In */
      @keyframes slideIn {
          0% {
              opacity: 0;
          }
          100% {
              opacity: 1;
          }
      }

      /* Inner Box */
      #inner-box {
          margin: 5px;
          padding: 10px;
          border: none;
          background-color: @surface;
          animation: fadeIn 0.5s ease-in-out both;
      }

      /* Fade In */
      @keyframes fadeIn {
          0% {
              opacity: 0;
          }
          100% {
              opacity: 1;
          }
      }

      /* Outer Box */
      #outer-box {
          margin: 5px;
          padding: 10px;
          border: none;
          background-color: @surface;
      }

      /* Scroll */
      #scroll {
          margin: 0px;
          padding: 10px;
          border: none;
      }

      /* Input */
      #input {
          margin: 5px;
          padding: 10px;
          border: none;
          color: @on-background;
          background-color: @secondary;
          animation: fadeIn 0.5s ease-in-out both;
      }

      /* Text */
      #text {
          margin: 5px;
          padding: 10px;
          border: none;
          color: @on-surface;
          animation: fadeIn 0.5s ease-in-out both;
      }

      /* Selected Entry */
      #entry:selected {
          background-color: @primary;
          border-radius: 5px;
      }

      #entry:selected #text {
          color: @on-primary;
      }
    '';
  };

  # Вариант 2: Установка пакета
  home.packages = with pkgs; [
    wofi
  ];
}
