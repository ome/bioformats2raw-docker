set -e
set -u
set -x
version=$1; shift
docker build -t openmicroscopy/bioformats2raw:${version} .
docker build -t openmicroscopy/bioformats2raw:latest .
docker run --rm openmicroscopy/bioformats2raw:${version} --version
set +x
echo '# if you are happy with the above, run:'
echo docker push openmicroscopy/bioformats2raw:latest
echo docker push openmicroscopy/bioformats2raw:${version}
