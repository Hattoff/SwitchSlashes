# SwitchSlashes
Windows shell extension registry keys allow you to copy and paste file paths with the backslashes changed to forward slashes.

# Note:
These registry keys have embedded Powershell code to handle the clipboard and string replacement. Powershell 5 or greater is required to run this properly. 

## Getting Started:
If you have Windows 10 or newer, your system should have Powershell 5 or greater already installed. If not, you will need to download it.

[Powershell 5.1 install](https://www.microsoft.com/en-us/download/details.aspx?id=54616)

[Powershell install documentation](https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell?view=powershell-6)

###### Microsoft likes to depreciate links almost as much as they like to rename their products. If these links don't work, use your favorite search engine and get the latest version of Powershell.

## Install:
Once you have Powershell installed:
  1. Download the _SwitchSlashes.reg_ registry file.
  2. Run it (as administrator if needed).
  3. Click ok and you are done.

## Removal:
I have also included a registry file which will attempt to remove any keys added. Download and run _Remove-SwitchSlashes.reg_ registry file.

## Use:
The shell extensions work on Windows File Explorer by __holding__ Shift and Right Clicking _on_ a folder, _in_ a folder, or _on_ a file.
You can then click the "Copy //" option in the context menu.

###### You may see a command prompt flash. This is normal. If you know of a way to prevent this let me know or create a pull request.

## Customization:
If you prefer to not hold Shift before your Right Click, simply open the _SwitchSlashes.reg_ file in a text editor, and add a semicolon __;__ infront of the lines _`"Extended"=""`_ and save. 

If you have already installed the keys, run _Remove-SwitchSlashes.reg_ to remove the old ones, then run the modified _SwitchSlashes.reg_.

# Troubleshooting:
If the "Copy //" option is not behaving as expected there are a couple things you can do.
 * Ensure you have powershell 5 or greater installed.
 * Check the install path of Powershell; it may be different on your machine, and require you to modify the _SwitchSlashes.reg_ file.

   Powershell will normally be located in __`c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe`__
   
  __If Powershell is not located in the path noted above:__
  
   1. Copy the proper path to _powershell.exe_.
   2. Open _SwitchSlashes.reg_ in a text editor.
   3. Locate the _`[HKEY_CLASSES_ROOT ... SwitchSlashes.ForwardSlash\command]`_ portions of the registry file.
   4. Replace the path like so:
    
   __BEFORE:__ `@="c:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe ...`
    
   __AFTER:__ `@="c:\\new\\path\\to\\powershell.exe ...`
    
   __IMPORTANT:__ mind the double `\\` backslashes. They are required when modifying the _SwitchSlashes.reg_ file. If you are directly modifying the registry the double `\\` backslashes are not required.
    
   5. Save the _SwitchSlashes.reg_ file, run the _Remove-SwitchSlashes.reg_ file if needed, and rerun _SwitchSlashes.reg_.
  * If all else fails, you can include -NoExit to the registry key commands like so:
  
    __BEFORE:__ `@="c:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe \"-command\" ...`
  
    __AFTER:__ `@="c:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -NoExit \"-command\" ...`
   
     Save the _SwitchSlashes.reg_ file, run the _Remove-SwitchSlashes.reg_ file if needed, and rerun _SwitchSlashes.reg_. 
     
     Now, when the "Copy //" context menu option is pressed, the Powerscript will remain open and you can further debug the issue.
