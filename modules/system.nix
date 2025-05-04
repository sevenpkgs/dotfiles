{
  config,
  pkgs,
  lib,
  ...
}: {
  # Bootloader.
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-3a63e346-2bab-4b76-9a40-0266eaa8d436".device = "/dev/disk/by-uuid/3a63e346-2bab-4b76-9a40-0266eaa8d436";

  boot = {
    # Kernel Panic on suspend fix, taken from ArchLinux wiki.
    kernelParams = ["acpi_enforce_resources=lax" "i915.enable_dc=0"];
    # Audio Mute LED
    extraModprobeConfig = ''
      options snd-hda-intel model=mute-led-gpio
    '';
  };

  # fancontrol
  hardware.fancontrol = {
    enable = true;
    config = ''
      INTERVAL=5
      DEVPATH=hwmon4=devices/platform/dell_smm_hwmon hwmon7=devices/virtual/thermal/thermal_zone9
      DEVNAME=hwmon4=dell_smm hwmon7=iwlwifi_1
      FCTEMPS= hwmon4/pwm1=hwmon7/temp1_input
      FCFANS= hwmon4/pwm1=
      MINTEMP= hwmon4/pwm1=20
      MAXTEMP= hwmon4/pwm1=50
      MINSTART= hwmon4/pwm1=230
      MINSTOP= hwmon4/pwm1=100'';
  };

  # ssd
  services.fstrim.enable = lib.mkDefault true;

  # cpu
  services.thermald.enable = true;

  # power
  powerManagement.cpuFreqGovernor = "performance";

  # graphics (intel hd 6000)
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
  };
  hardware.graphics = {
    # hardware.graphics since NixOS 24.11
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
      intel-compute-runtime-legacy1
    ];
  };

  # cpu
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # input
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  networking.hostName = "dwmachine"; # Define your hostname.

  # enable sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
