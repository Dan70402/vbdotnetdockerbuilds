function compileDocker {

    $baseFolder = ".\VBDotNetDockerBuilds\bin\" #test TODO
    $releaseFolder = "Docker-Release"
    Remove-Item "${baseFolder}\${releaseFolder}" -Recurse -ErrorAction Ignore    

    Invoke-Expression -Command:'docker build -f Dockerfile.build -t vbdotnetdockerbuildsbuild .'

    $out = Invoke-Expression -Command:'docker run -d vbdotnetdockerbuildsbuild'
    
    $cmd = "docker cp ${out}:\app\VBDotNetDockerBuilds\${releaseFolder} ${baseFolder}"
    Write-Host $cmd
    Invoke-Expression -Command:$cmd
    Invoke-Expression -Command:"docker kill ${out}"
    Invoke-Expression -Command:"docker rmi -f vbdotnetdockerbuildsbuild"
}

compileDocker