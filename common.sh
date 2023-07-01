
create_element () {
  SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"
  export PLUGIN_NAME=$1
  export ELEMENT_NAME_CAMEL_CASE=$2
  export ELEMENT_NAME_SNAKE_CASE=$(echo $ELEMENT_NAME_CAMEL_CASE \
  | sed 's/\([^A-Z]\)\([A-Z0-9]\)/\1_\2/g' \
  | sed 's/\([A-Z0-9]\)\([A-Z0-9]\)\([^A-Z]\)/\1_\2\3/g' \
  | tr '[:upper:]' '[:lower:]'
  )
  export ELEMENT_NAME_CAMEL_CASE_LOWER="$(echo "$ELEMENT_NAME_CAMEL_CASE" | tr '[:upper:]' '[:lower:]')"
  SRC_PATH="$SCRIPT_DIR/../src/"
  export ELEMENT_NAME_SNAKE_CASE_UPPER="$(echo "$ELEMENT_NAME_SNAKE_CASE" | tr '[:lower:]' '[:upper:]')"
  export ELEMENT_NAME_LOWER="${ELEMENT_NAME_SNAKE_CASE//_}"
  export ELEMENT_FILENAME="gst${ELEMENT_NAME_LOWER}"
  export ELEMENT_FILENAME_C="$ELEMENT_FILENAME.c"
  export ELEMENT_FILENAME_H="$ELEMENT_FILENAME.h"
  export ELEMENT_DIRECTORY="$SRC_PATH$1"

  export ELEMENT_CLASS_NAME="Gst${ELEMENT_NAME_CAMEL_CASE}Class"
  export ELEMENT_OBJECT_NAME="Gst${ELEMENT_NAME_CAMEL_CASE}"
  export ELEMENT_FUNCTION_PREFIX="gst_${ELEMENT_NAME_SNAKE_CASE}"
  export ELEMENT_FUNCTION_PREFIX_UPPER="$(echo "$ELEMENT_FUNCTION_PREFIX" | tr '[:lower:]' '[:upper:]')"

  echo "Element Name Camel Case : $ELEMENT_NAME_CAMEL_CASE"
  echo "Element Name Camel Case Lower : $ELEMENT_NAME_CAMEL_CASE_LOWER"
  echo "Element Name Snake Case : $ELEMENT_NAME_SNAKE_CASE"
  echo "Element Name Snake Case Upper : $ELEMENT_NAME_SNAKE_CASE_UPPER"
  echo "Element filename c : $ELEMENT_FILENAME_C"
  echo "Element filename h : $ELEMENT_FILENAME_H"
  echo "Element Directory : $ELEMENT_DIRECTORY"
  echo "Element class name : $ELEMENT_CLASS_NAME"
  echo "Element object name : $ELEMENT_OBJECT_NAME"
  echo "Element function prefix : $ELEMENT_FUNCTION_PREFIX"


  [ -f $"$ELEMENT_DIRECTORY/$ELEMENT_FILENAME_C" ] && echo "Dest filename exists skipping" && exit
  [ -f $"$ELEMENT_DIRECTORY/$ELEMENT_FILENAME_H" ] && echo "Dest filename exists skipping" && exit

  C_FILE_CONTENT=$(cat $SCRIPT_DIR/templates/$3.c.tpl | envsubst)
  H_FILE_CONTENT=$(cat $SCRIPT_DIR/templates/$3.h.tpl | envsubst)

  echo "$C_FILE_CONTENT" > "$ELEMENT_DIRECTORY/$ELEMENT_FILENAME_C"
  echo "$H_FILE_CONTENT" > "$ELEMENT_DIRECTORY/$ELEMENT_FILENAME_H"

}