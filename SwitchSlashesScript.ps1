param(
	[Parameter(Mandatory = $False)][string]$FilePath,
	[Parameter(Mandatory = $True)][string]$ReplaceStr = '\'
)
if($ReplaceStr -eq "\"){
	$OppositeStr = "/"
} else {
	$OppositeStr = "\"
}

try{

if(!($FilePath)){
	$Path = get-clipboard
} else {
	$Path = $FilePath
}

$NewPath = $Path -replace $ReplaceStr, $OppositeStr
set-clipboard($NewPath)
} catch{}