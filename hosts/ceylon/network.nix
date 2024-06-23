{
  systemd.network = {
    enable = true;
    networks."20-wired" = {
      dns = [
        "133.11.124.164"
        "133.11.123.45"
      ];
      matchConfig.Name = "eno1";
      networkConfig = {
        Address = "133.11.234.39/28";
        Gateway = "133.11.234.33";
      };
    };
  };
}
