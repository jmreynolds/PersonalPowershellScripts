function CamelCaseToDisplayName ([string]$inString) 
{
    $newString = "" 
    $stringChars = $inString.GetEnumerator() 
    $charIndex = 0 foreach ($char in $stringChars) 
    { 
        # If upper and not first character, add a space 
        if ([char]::IsUpper($char) -eq "True" -and $charIndex -gt 0) 
        { 
            $newString = $newString + " " + $char.ToString() 
        } elseif ($charIndex -eq 0) 
        {
            # If the first character, make it a capital always 
            $newString = $newString + $char.ToString().ToUpper() 
        } else 
        { 
            $newString = $newString + $char.ToString() 
        } 
        $charIndex++ 
    } 
    $newString 
}

function ChangeAllFilesInDir()
{
    $fileList = gci
    foreach ($file in $fileList) {
        Out-Host CamelCaseToDisplayName($file)
    }
}