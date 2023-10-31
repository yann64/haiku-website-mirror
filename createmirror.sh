# Change the following values to configure your mirror :

# Path to the Hugo binary
HUGO_PATH="/c/Local/hugo/hugo.exe"
# The mirror website title
MIRROR_TITLE="Haiku Project (Mirror Site)"
# The mirror base URL (must end with a slash '/')
MIRROR_BASEURL="http://localhost/haiku/"
# Where the files will be copied
MIRROR_LOCALPATH="/c/Local/PortableApps/PortableApps/XAMPP/App/xampp/htdocs/haiku" 

# Main site
echo "==> Clone website from the official repository :"
git clone https://github.com/haiku/website.git
cd website
sed -i "s/title = \"Haiku Project\"/title = \"$MIRROR_TITLE\"/" ./config.toml
sed -i "s@baseURL = \"https://www.haiku-os.org/\"@baseURL = \"$MIRROR_BASEURL\"@" ./config.toml
echo "==> Site generation using Hugo :"
$HUGO_PATH
echo "==> Copy files to destination forlder: "$MIRROR_LOCALPATH
cd  public
cp -r * $MIRROR_LOCALPATH
echo "==> Cleaning"
cd ../..
rm -rf ./website

# Clone the userguide latest version
echo "==> Clone userguide from the official repository :"
git clone "https://review.haiku-os.org/userguide"
cd userguide
echo "==> Copy files to destination forlder: $MIRROR_LOCALPATH/docs"
cp -r * "$MIRROR_LOCALPATH/docs"
echo "==> Cleaning"
cd ..
rm -rf ./userguide

echo "Done !"
