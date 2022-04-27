# maturita-webovky
Vypracované otázky k maturitní zkoušce z webových aplikací

## Instalace - Linux
Pro použití s XAMPP serverem:
```bash
chmod +x lampp_sync_linux.sh
./lampp_sync_linux.sh
```

### Error fix
V případě, že se nenačítá CSS, http error 403 - forbidden:
```bash
sudo chmod -R 0755 /opt/lampp/htdocs/maturita-webovky
```