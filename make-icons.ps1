Add-Type -AssemblyName System.Drawing
$dir = "C:\PROJETOS\extensions\youtube-hidden-shorts\icons"
New-Item -ItemType Directory -Force -Path $dir | Out-Null

function New-Icon([int]$size) {
  $S = 512
  $bmp = New-Object System.Drawing.Bitmap $S, $S
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.SmoothingMode = 'AntiAlias'
  $g.InterpolationMode = 'HighQualityBicubic'
  $g.Clear([System.Drawing.Color]::Transparent)

  # Rounded-square (squircle) red background
  $pad = 40
  $r = 120
  $rect = New-Object System.Drawing.Rectangle $pad, $pad, ($S-2*$pad), ($S-2*$pad)
  $path = New-Object System.Drawing.Drawing2D.GraphicsPath
  $d = 2*$r
  $path.AddArc($rect.X, $rect.Y, $d, $d, 180, 90)
  $path.AddArc($rect.Right-$d, $rect.Y, $d, $d, 270, 90)
  $path.AddArc($rect.Right-$d, $rect.Bottom-$d, $d, $d, 0, 90)
  $path.AddArc($rect.X, $rect.Bottom-$d, $d, $d, 90, 90)
  $path.CloseFigure()
  $bg = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(255, 240, 0, 0))
  $g.FillPath($bg, $path)

  # White lightning bolt (Shorts logo, centered)
  $bolt = @(
    (New-Object System.Drawing.PointF 295, 120),
    (New-Object System.Drawing.PointF 180, 285),
    (New-Object System.Drawing.PointF 250, 285),
    (New-Object System.Drawing.PointF 217, 392),
    (New-Object System.Drawing.PointF 332, 227),
    (New-Object System.Drawing.PointF 262, 227)
  )
  $white = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
  $g.FillPolygon($white, $bolt)

  # Diagonal "blocked" strike across the whole icon
  $penOuter = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(255,255,255,255)), 58
  $penOuter.StartCap = 'Round'; $penOuter.EndCap = 'Round'
  $g.DrawLine($penOuter, 110, 402, 402, 110)
  $penInner = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(255, 240, 0, 0)), 30
  $penInner.StartCap = 'Round'; $penInner.EndCap = 'Round'
  $g.DrawLine($penInner, 110, 402, 402, 110)

  $g.Dispose()

  # Downscale to target size
  $out = New-Object System.Drawing.Bitmap $size, $size
  $og = [System.Drawing.Graphics]::FromImage($out)
  $og.InterpolationMode = 'HighQualityBicubic'
  $og.SmoothingMode = 'AntiAlias'
  $og.PixelOffsetMode = 'HighQuality'
  $og.DrawImage($bmp, 0, 0, $size, $size)
  $og.Dispose()
  $out.Save("$dir\icon$size.png", [System.Drawing.Imaging.ImageFormat]::Png)
  $out.Dispose()
  $bmp.Dispose()
}

foreach ($s in 16,48,128) { New-Icon $s }
Write-Output "icons done"
