#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{vim};

our $SCHEMA = [
    #          COMMAND                 LABEL              ICON
#    {item => ['pcmanfm',       'Files', '/usr/share/icons/Papirus/16x16/places/folder-blue.svg']},
#    {item => ['tilix',            'Terminal',     '/usr/share/icons/Papirus/16x16/apps/terminal.svg']},
#    {item => ['google-chrome-stable', 'Browser',  '/usr/share/icons/Papirus/16x16/apps/google-chrome.svg']},
##    {item => ['gmrun',            'Run command',  'system-run']},
    #{sep => 'MENU'},
      {sep  => undef},
    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    ##    {cat => ['development', 'Development', 'applications-development']},
##    {cat => ['education',   'Education',   'applications-science']},
##    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     '/usr/share/icons/elementosh-BLUEBERRY/devices/24/network-wireless.svg']},
    {cat => ['office',      'Office',      'applications-office']},
    ##    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    '/usr/share/icons/Papirus/16x16/apps/system-config-services.svg']},
    {cat => ['system',      'System',      '/usr/share/icons/Papirus/16x16/apps/system-config-display.svg']},

    #             LABEL          ICON
    #{beg => ['My category',  'cat-icon']},
    #          ... some items ...
    #{end => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    #{sep       => undef},

    ## Custom advanced settings
##    {sep => undef},
##    {beg => ['Advanced Settings', 'applications-engineering']},

      # Configuration files
##      {item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-generic']},
##      {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Panel', 'text-x-generic']},

      # obmenu-generator category
##      {beg => ['Obmenu-Generator', 'accessories-text-editor']},
##        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
##        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},

##        {sep  => undef},
##        {item => ['obmenu-generator -s -c',    'Generate a static menu',             'accessories-text-editor']},
##        {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons',  'accessories-text-editor']},
##        {sep  => undef},
##        {item => ['obmenu-generator -p',       'Generate a dynamic menu',            'accessories-text-editor']},
##        {item => ['obmenu-generator -p -i',    'Generate a dynamic menu with icons', 'accessories-text-editor']},
      {sep  => undef},

      # {item => ['openbox --reconfigure',               'Reconfigure Openbox', '/usr/share/icons/Papirus/16x16/emblems/emblem-rabbitvcs-calculating.svg']},
##        {item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
##      {end => undef},

      # Openbox category
      ##{beg => ['Configs', '/usr/share/icons/Soda/16x16/places/folder-script.svg']},
      ##{item => ["$editor /home/josh/.Xresources", '.Xresources',   'text-x-generic']},
      ##{item => ["$editor ~/.vimrc",    '.vimrc',          'text-x-generic']},
      ##{item => ["$editor ~/.zshrc",  '.zshrc',        'text-x-generic']},
      ##{item => ['openbox --reconfigure',               'Reconfigure Openbox', '/usr/share/icons/Papirus/16x16/emblems/emblem-rabbitvcs-calculating.svg']},
      ## {end => undef},
      #  {sep => undef},
      {beg => ['Exit', '/usr/share/icons/Papirus/16x16/apps/gnome-session-halt.svg']},
#        {item => [

      #    {end => undef},

    ## The xscreensaver lock command
##    {item => ['xscreensaver-command -lock', 'Lock', 'system-lock-screen']},
    ## This option uses the default Openbox's "Exit" action
    #{exit => ['Logout', 'application-exit']},

        {item => ['openbox --exit', 'Logout', '/usr/share/icons/Papirus/16x16/apps/system-config-users.svg']},
        {item => ['systemctl reboot', 'Reboot', '/usr/share/icons/Papirus/16x16/apps/system-reboot.svg']},
        {item => ['systemctl -i poweroff', 'Shutdown', '/usr/share/icons/Papirus/16x16/apps/gnome-session-halt.svg']},

      {end => undef},
    ## This uses the 'oblogout' menu
]
