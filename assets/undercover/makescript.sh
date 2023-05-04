#!/bin/bash

# Define the name of the script that will be generated
SCRIPT_NAME="set_desktop_variables.sh"

# Check if the script already exists
if [ ! -f $SCRIPT_NAME ]; then
  echo "Creating script..."
  
  # Get the current desktop variables
  THEME_NAME=$(gsettings get org.cinnamon.theme name)
  PANELS_ENABLED=$(gsettings get org.cinnamon panels-enabled)
  ICON_THEME=$(gsettings get org.cinnamon.desktop.interface icon-theme)
  WM_THEME=$(gsettings get org.cinnamon.desktop.wm.preferences theme)
  GTK_THEME=$(gsettings get org.cinnamon.desktop.interface gtk-theme)
  BACKGROUND=$(gsettings get org.cinnamon.desktop.background picture-uri)
  
  # Create the script that will set the desktop variables
  echo "#!/bin/bash" > $SCRIPT_NAME
  echo "gsettings set org.cinnamon.theme name \"$THEME_NAME\"" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon panels-enabled $PANELS_ENABLED" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon.desktop.interface icon-theme \"$ICON_THEME\"" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon.desktop.wm.preferences theme \"$WM_THEME\"" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon.desktop.interface gtk-theme \"$GTK_THEME\"" >> $SCRIPT_NAME
  echo "gsettings set org.cinnamon.desktop.background picture-uri \"$BACKGROUND\"" >> $SCRIPT_NAME
  
  # Make the script executable
  chmod +x $SCRIPT_NAME
  
  echo "Script created successfully."
else
  echo "Running script..."
  ./$SCRIPT_NAME
fi
