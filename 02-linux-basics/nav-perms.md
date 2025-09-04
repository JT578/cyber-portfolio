# Linux: Navigation, Packages, Permissions

```
pwd
ls -la
cd ..
cp source target
mv old new
rm -i file
mkdir -p path/to/dir
touch notes.txt
```

## Packages (Debian/Ubuntu)
```
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl wget git
```

## Permissions
```
chmod u+x script.sh
chown $USER:$USER file
sudo visudo
```

## Useful search
```
grep -R "pattern" .
find . -type f -name "*.txt"
```
