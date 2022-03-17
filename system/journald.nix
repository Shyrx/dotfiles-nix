{ config, lib, pkgs, ... }:

{
  # Logging config for journalctl
  # Log levels are: emerg - alert - crit - err - warning - notice - info - debug
  # Nothing is configured to be redirected to Syslog and Console so they should
  # be useless.
  #
  # Storage=volatile means to store journal data in memory and not on disk.
  # It prevents flushing the data to the disk and thus save boot time
  services.journald.extraConfig = ''
    Storage=volatile
    SystemMaxUse=100M

    MaxLevelWall=emerg # Default = emerg
    MaxLevelKMsg=notice # Default = notice
    MaxLevelStore=warning # Default = debug

    MaxLevelConsole=warning # Default = info
    MaxLevelSyslog=notice # Default = debug
   '';

}
