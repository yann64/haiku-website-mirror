
# Change the following values to configure your mirror :
# Path to the Hugo binary
HUGO_PATH=""
# The mirror website title
MIRROR_TITLE="Haiku Project (Mirror Site)"
# The mirror base URL (must end with a slash '/')
MIRROR_BASEURL="https://localhost/haiku/"
# Where the files will be copied
MIRROR_LOCALPATH="" 


# First we clone the website latest version
echo "==> Clone from official repository :"
git clone https://github.com/haiku/website.git

# We then enter the website repository
cd website

# We change the site title
sed -i 's@title = "Haiku Project"@title = "'$MIRROR_TITLE'"@' ./config.toml

# We change the base URL
sed -i 's@baseURL = "https://www.haiku-os.org/"@baseURL = "'$MIRROR_BASEURL'"@' ./config.toml

# We generate the site
echo "==> Site generation using Hugo :"
$HUGO_PATH

# Copy the website to the target folder
echo "==> Copy files to destination forlder: "$MIRROR_LOCALPATH
cd  public
cp -r * $MIRROR_LOCALPATH

# Clean
echo "==> Cleaning"
cd ..
rm -rf ./website

echo "Done !"
