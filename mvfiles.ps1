
function mvfiles{
    #write-host (Get-ChildItem $args[0]| Measure-Object ).Count;
    $count1 = 0
    $count2 = 0
    $count3 = 0

    If((Get-ChildItem $args[0]| Measure-Object ).Count -eq 0)
    {
        write-host "No files found for processing " -ForegroundColor "Red"
        break
    }
    Foreach($file in (Get-ChildItem $args[0]))
    {
        #write-host $file.BaseName.Substring(0,1)
        If($file.BaseName.Substring(0,1) -Match '^[a-l]')
        {   
            $count1++
            #write-host "Moving file $File to Destination 1 " -ForegroundColor "Green"	
            Move-Item -Path $($file.FullName) -Destination $args[1]
        }
        ElseIf($file.BaseName.Substring(0,1) -Match '^[m-z]')
        {
            $count2++
            #write-host "Moving file $File to Destination 2 " -ForegroundColor "Yellow"	
            Move-Item -Path $($file.FullName) -Destination $args[2]
        }
        Else 
        {
            $count3++
            #write-host "Moving file $File to Trash" -ForegroundColor "Red"	
            Remove-Item -Path $($file.FullName)
        }
    }
   # write-host "No of files moved to Destination 1: $count1" -ForegroundColor red -BackgroundColor white
   # write-host "No of files moved to Destination 2: $count2" -ForegroundColor red -BackgroundColor white
   # write-host "No of files deleted: $count3" -ForegroundColor red -BackgroundColor white
}