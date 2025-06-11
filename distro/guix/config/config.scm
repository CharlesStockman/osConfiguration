;; Minimal Guix System Configuration with Firmware Support
;; Terminal-only installation with GRUB bootloader and hardware firmware

(use-modules (gnu)
             (gnu system)
             (gnu bootloader)
             (gnu bootloader grub)
             (gnu services)
             (gnu services networking)
             (gnu system file-systems)
             (gnu system users)
             (gnu system shadow)
             (gnu system linux-initrd))

(operating-system
  (locale "en_US.utf8")
  (timezone "America/New_York") ; Change to your timezone
  (keyboard-layout (keyboard-layout "us"))
  (host-name "guix-minimal")

  ;; Include firmware for better hardware support
  (kernel-arguments '("modprobe.blacklist=nouveau")) ; Blacklist nouveau for NVIDIA proprietary drivers
  (firmware (list linux-firmware))

  ;; Alternative initrd with firmware support
  (initrd-modules (append (list "ahci" "usb_storage" "uas"
                               "usbhid" "usb_hid" "hid_generic" "hid_apple")
                         %base-initrd-modules))

  ;; GRUB EFI bootloader configuration
  (bootloader (bootloader-configuration
               (bootloader grub-efi-bootloader)
               (targets (list "/boot/efi")) ; EFI system partition mount point
               (keyboard-layout keyboard-layout)))

  ;; File systems - root, boot, and swap partitions
  (file-systems (cons* (file-system
                        (mount-point "/")
                        (device "/dev/nvme0n1p3") ; Root partition on NVMe SSD
                        (type "ext4"))
                      (file-system
                        (mount-point "/boot/efi")
                        (device "/dev/nvme0n1p1") ; EFI system partition on NVMe SSD
                        (type "vfat"))
                      %base-file-systems))

  ;; Swap partition
  (swap-devices (list (swap-space (target "/dev/nvme0n1p2"))))

  ;; User accounts
  (users (cons* (user-account
                 (name "cstockman")
                 (comment "Charles Stockman")
                 (group "users")
                 (home-directory "/home/cstockman")
                 (supplementary-groups '("wheel" "netdev")))
               %base-user-accounts))

  ;; Minimal packages - just base system
  (packages %base-packages)

  ;; Minimal services - just the essentials
  (services (append (list
                     ;; Network management
                     (service network-manager-service-type))
                    ;; Base services only
                    %base-services)))
