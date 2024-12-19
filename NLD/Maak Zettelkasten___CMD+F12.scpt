tell application "DEVONthink 3"

# Name: Maak Zettelkasten
# Coder: Marco Janssen
# mastodon: @marc0janssen@mastodon.online
# bluesky: @mjanssen.nl
# micro.blog: @marc0janssen@micro.blog
# date: 2024-12-18 06:38:51
# update: 2024-12-19 13:38:15
# Description: Dit script maakt een zettelkasten notitie met markdown in de huidige groep binnen DEVONthink

    -- Verkrijg de huidige datum en tijd
    set huidigeDatum to current date
    
    -- Vraag de gebruiker om een bestandsnaam
    set datumString to my formatDateFilename(huidigeDatum)
    set gebruikersBestandsnaam to text returned of (display dialog "Voer de bestandsnaam in:" default answer datumString & " - NieuweZettelkasten")

    -- Maak een nieuw Markdown-bestand met de opgegeven bestandsnaam
    set nieuwBestand to create record with {name:gebruikersBestandsnaam, type:markdown} in current group

    -- Stel de inhoud van het nieuwe bestand in
    -- Definieer de inhoud van het bestand
    set datumString to my formatDate(huidigeDatum)
    set bestandInhoud to "# " & gebruikersBestandsnaam & return & ¬
        "---" & return & ¬
        "> **Datum:** " & datumString & return & ¬
        "> **Context:** " & return & ¬
        "> **Doel:** " & return & ¬
        "> **Bron:** " & return & ¬
        "> **Verwijzing:** " & return & ¬
        "> **Tags:** " & return & ¬
        "> **Volgende:** " & return & ¬
        "> **Vertakking:** " & return & return & ¬
        "### Samenvatting" & return & return & return & ¬
        "### Opmerkingen" & return & return & return & ¬
        "### Inhoud" & return & return & return
        
    
    set plain text of nieuwBestand to bestandInhoud

end tell

-- functie om de datum te formatteren
on formatDate(huidigeDatum)
    set dagVanDeWeekDeel to weekday of huidigeDatum as string
    set dagDeel to day of huidigeDatum as string
    set maandDeel to month of huidigeDatum as string
    set jaarDeel to year of huidigeDatum as string
    set uurDeel to hours of huidigeDatum as string
    set minuutDeel to minutes of huidigeDatum as string
    
    -- Zorg ervoor dat de maand, dag, uur en minuut altijd twee cijfers zijn
    if length of dagDeel is 1 then set dagDeel to "0" & dagDeel
    if length of uurDeel is 1 then set uurDeel to "0" & uurDeel
    if length of minuutDeel is 1 then set minuutDeel to "0" & minuutDeel
    
    set datumString to dagVanDeWeekDeel & ", " & dagDeel & " " & maandDeel & " " & jaarDeel & " om " & uurDeel & ":" & (minuutDeel as string)
    
    return datumString
end formatDate

on formatDateFilename(huidigeDatum)
    set jaarDeel to year of huidigeDatum as string
    set maandDeel to (month of huidigeDatum as integer) as string
    set dagDeel to day of huidigeDatum as string
    set uurDeel to hours of huidigeDatum as string
    set minuutDeel to minutes of huidigeDatum as string
    
    -- Zorg ervoor dat de maand, dag, uur en minuut altijd twee cijfers zijn
    if length of maandDeel is 1 then set maandDeel to "0" & maandDeel
    if length of dagDeel is 1 then set dagDeel to "0" & dagDeel
    if length of uurDeel is 1 then set uurDeel to "0" & uurDeel
    if length of minuutDeel is 1 then set minuutDeel to "0" & minuutDeel
    
    return jaarDeel & "-" & maandDeel & "-" & dagDeel & "-" & uurDeel & minuutDeel
end formatDateFilename
