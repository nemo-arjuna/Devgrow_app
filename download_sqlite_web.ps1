$webPath = "web"
$urls = @(
    "https://raw.githubusercontent.com/tekartik/sqflite/master/packages_web/sqflite_common_ffi_web/lib/src/worker/worker.dart.js",
    "https://github.com/tekartik/sqflite/raw/master/packages_web/sqflite_common_ffi_web/lib/src/sqlite3.wasm",
    "https://github.com/tekartik/sqflite/raw/master/packages_web/sqflite_common_ffi_web/lib/src/sqlite3.js"
)

# Create web directory if it doesn't exist
if (!(Test-Path $webPath)) {
    New-Item -ItemType Directory -Path $webPath
}

# Download files
foreach ($url in $urls) {
    $fileName = $url.Split('/')[-1]
    if ($fileName -eq "worker.dart.js") {
        $fileName = "sqflite_sw.js"
    }
    $output = Join-Path $webPath $fileName
    Write-Host "Downloading $fileName..."
    Invoke-WebRequest -Uri $url -OutFile $output
}

Write-Host "Download complete!"
