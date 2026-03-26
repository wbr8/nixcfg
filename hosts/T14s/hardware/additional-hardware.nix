{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-t14s
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-laptop-ssd
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = [
      pkgs.intel-compute-runtime
      pkgs.intel-media-driver
    ];
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 32*1024;
    }
  ];
  
  boot.resumeDevice = "/dev/nvme0n1p2";
  boot.kernelParams = [ "resume_offset=533760" ];

}
