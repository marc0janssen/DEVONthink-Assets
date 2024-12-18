tell application "DEVONthink 3"

# Name: Create Zettelkasten
# Coder: Marco Janssen
# mastodon: @marc0janssen@mastodon.online
# blue sky: @mjanssen.nl
# micro.blog: @marc0janssen@micro.blog
# date: 2024-12-18 06:38:51
# update: 2024-12-18 21:07:15
# Description: This script creating a zettelkasten note with markdown in de current group in DEVONthink

    -- Get the current date and time
    set currentDate to current date
    
    -- Prompt the user for a filename
    set dateString to my formatDateFilename(currentDate)
    set userFilename to text returned of (display dialog "Enter the filename:" default answer dateString & " - NewFile")

    -- Create a new Markdown file with the specified filename
    set newFile to create record with {name:userFilename, type:markdown} in current group

    -- Set the content of the new file
    -- set content to userFilename & return & return & dateString
    set dateString to my formatDate(currentDate)
    set fileContent to "# " & userFilename & return & "---\n> Date: " & dateString & "\n> Context: \n> Purpose: \n> Source: \n> Reference: \n> Tags: \n> Next: \n> Branch: \n" & return & "### Summary\n" & return & return & "### Notes\n" & return & return & "### Content" & return & return
    
    set plain text of newFile to fileContent

end tell

-- function to format the date
on formatDate(currentDate)
    set weekdayPart to weekday of currentDate as string
    set dayPart to day of currentDate
    set monthPart to month of currentDate as string
    set yearPart to year of currentDate
    set hourPart to hours of currentDate
    set minutePart to minutes of currentDate
    
    set dateString to weekdayPart & ", " & dayPart & " " & monthPart & " " & yearPart & " at " & hourPart & ":" & (minutePart as string)
    
    return dateString
end formatDate

on formatDateFilename(currentDate)
    set yearPart to year of currentDate as string
    set monthPart to (month of currentDate as integer) as string
    set dayPart to day of currentDate as string
    set hourPart to hours of currentDate as string
    set minutePart to minutes of currentDate as string
    
    -- Ensure that month, day, hour, and minute are always two digits
    if length of monthPart is 1 then set monthPart to "0" & monthPart
    if length of dayPart is 1 then set dayPart to "0" & dayPart
    if length of hourPart is 1 then set hourPart to "0" & hourPart
    if length of minutePart is 1 then set minutePart to "0" & minutePart
    
    return yearPart & "-" & monthPart & "-" & dayPart & "-" & hourPart & minutePart
end formatDateFilename