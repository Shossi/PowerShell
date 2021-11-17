$answer =
$path = "C:\Windows\System32\drivers\etc\"
$direc = Get-ChildItem $path
$menu = @{}
for ($i=1;$i -le $direc.count; $i++)
{
    if (($direc[$i - 1].name) -ne 'lmhosts.sam')
    {
        if (($direc[$i - 1].name) -ne 'services')
        {
            Write-Host "$i. $( $direc[$i - 1].name )"
            $menu.Add($i, ($direc[$i - 1].name))
        }
    }
}
while ($menu[$answer] -notin $direc.name)
{
    [int]$answer = Read-Host 'Please enter your selection'

    if ($menu[$answer] -in $direc.name)
    {
        $path
        Write-Host "You selected:"$menu.Item($answer)
        Write-Host "Path to specified file is: "($path)($menu.item($answer))
        $continue = Read-Host "Do you want to continue? (yes/no)"
        Write-Output $continue
        if ($continue -like "yes"){
            $answer =-23
            $menu
            continue
        }
        else
        {
            Write-Output "Thank you and have a marvelous day"
            break
        }
    }
    Write-Output "This option is not valid, please choose from the available items"
}