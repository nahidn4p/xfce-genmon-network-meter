# XFCE GenMon Network Speed Monitor (wlan0)
A simple Bash script for XFCE's GenMon (Generic Monitor) that displays real-time download/upload speeds for the wlan0 wireless interface (Any Interface Change in Scripts).
example screenshot
(Example output in the panel: ↓ 245 kB/s ↑ 67 kB/s)

## Features
- Shows live download (↓) and upload (↑) speeds in kB/s
- Updates every second (perfect for GenMon default 1s interval)
- Clean, readable panel output using Pango markup
- Hover tooltip with exact speeds
- Automatically creates a cache file on first run
- Lightweight – only reads /proc/net/dev

## Screenshot:
<img width="1500" height="60" alt="image" src="https://github.com/user-attachments/assets/e9166a7a-7a4b-4495-97a3-7162bd8f0f6b" />

## Hover tooltip:
```
Download: 1247 kB/s
Upload: 89 kB/s
```
## Requirements
- XFCE desktop environment with GenMon plugin enabled on a panel
- Bash
- Wireless interface named wlan0 (common on most Linux systems) or Your Default Interface

## Installation
- Clone The Repo
```
git clone https://github.com/nahidn4p/xfce-genmon-network-meter
```
- Right-click your XFCE panel → Panel → Add New Items
- Add Generic Monitor
- Right-click the new GenMon item → Properties
- In cmd option select the script [Cloned repo directory]
<img width="310" height="318" alt="image" src="https://github.com/user-attachments/assets/245f9e0a-ded7-498b-8a7e-28d3090e8214" />
- Set Period 1 or 0.8
- Save

Done! You now have a beautiful live network speed indicator.

## Customization
| What                  | How to change                                                                 |
|-----------------------|-------------------------------------------------------------------------------|
| Interface             | Change `IFACE="wlan0"` to `eth0`, `enp3s0`, etc.                               |
| Colors                | Edit the `fgcolor` values in the `<span>` tags (e.g., `#88ff88` for green)    |
| Show MB/s instead     | Replace `/ 1024` with `/ 1048576` and change label from `kB/s` to `MB/s`      |
| Single-line layout    | Modify the `$INFO` section as desired (remove `\n`, adjust spacing, etc.)    |
| Add icons             | Add Unicode icons like `↓` `↑` or use font-awesome if supported              |
| Tooltip format        | Edit the `$TOOL` variable content                                             |

## Notes
- The script uses /tmp/genmon_wlan0_cache to store previous byte counters.
- On first launch it shows 0 kB/s (no previous data).
- If your interface name changes (e.g., wlp2s0), just edit the IFACE variable.

Enjoy your new minimal & fast network monitor! 
