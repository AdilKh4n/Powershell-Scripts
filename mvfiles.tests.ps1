$here = (Split-Path -Parent $MyInvocation.MyCommand.Path)
. $here\mvfiles.ps1

Describe 'mvfiles' {
    
   # $testPath = "TestDrive:\"
    #Set-Content $testPath -value "my test text."
    Setup -Dir "source"
    Setup -Dir "dest1"
    Setup -Dir "dest2"

        It 'Given an empty folder, it returns a warning' {
            
            $output = mvfiles "TestDrive:\source"
    
            # We count how many lines of output we got. And validate it by using
            # the Should -Be assertion.
            $output.Count | Should -Be 1    
        }

        It 'Given a folder with files: (apple.txt,pear.txt,1234.txt) , it returns the expected behavior for the function'{
            Setup -File "source/apple.txt"
            Setup -File "source/pear.txt"
            Setup -File "source/1234.txt"

            $output = mvfiles "TestDrive:\source" "TestDrive:\dest1" "TestDrive:\dest2"

            (Test-Path -Path "TestDrive:\dest1\apple.txt") | Should Be $true
            (Test-Path -Path "TestDrive:\dest2\pear.txt") | Should Be $true
            (Test-Path -Path "TestDrive:\dest2\1234.txt") | Should Be $false
        }

        It 'Given a folder with files: (apple.txt,bobcaat.txt), run the function twice to see that it returns the expected behavior for the function'{
            #Setup -File "source/apple.txt"
            Setup -File "source/bobcat.txt"

            $output1 = mvfiles "TestDrive:\source" "TestDrive:\dest1" "TestDrive:\dest2"

            (Test-Path -Path "TestDrive:\dest1\apple.txt") | Should Be $true
            (Test-Path -Path "TestDrive:\dest1\bobcat.txt") | Should Be $true
        
            $output2 = mvfiles "TestDrive:\source" "TestDrive:\dest1" "TestDrive:\dest2"
            $output.Count | Should -Be 1    
        }


}    