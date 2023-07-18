if [ $# -eq 0 ]
  then
    echo "usage ${0} project_name"
    echo "example : ${0} streamer"
    exit
fi

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"
PROJECT_DIR="$SCRIPT_DIR/../"
TEMPLATES_DIR=$SCRIPT_DIR/templates/project/
export PROJECT_NAME="$1"

mkdir $PROJECT_DIR/src $PROJECT_DIR/examples $PROJECT_DIR/docs $PROJECT_DIR/tests

cp $TEMPLATES_DIR/meson_examples.build.tpl $PROJECT_DIR/examples/meson.build
cp $TEMPLATES_DIR/meson_tests.build.tpl $PROJECT_DIR/tests/meson.build
cp $TEMPLATES_DIR/meson_src.build.tpl $PROJECT_DIR/src/meson.build
cp $TEMPLATES_DIR/meson_options.txt.tpl $PROJECT_DIR/meson_options.txt

MESON_FILE_CONTENT=$(cat $TEMPLATES_DIR/meson.build.tpl | envsubst)
echo "$MESON_FILE_CONTENT" > "$PROJECT_DIR/meson.build"
