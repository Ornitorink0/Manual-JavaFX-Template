#!/bin/bash

JAVAFX_LIB=lib
SRC_DIR=src
RES_DIR=res
OUT_DIR=out
CP=$(find "$JAVAFX_LIB" -name "*.jar" | tr '\n' ':')

MODULES="javafx.controls,javafx.fxml"

case "$1" in
    compile)
        echo "Compilation in progress..."
        mkdir -p "$OUT_DIR"
        cp -r "$RES_DIR"/* "$OUT_DIR"/
        javac --module-path "$JAVAFX_LIB" --add-modules $MODULES \
              -cp "$CP" \
              -d "$OUT_DIR" \
              $(find "$SRC_DIR" -name "*.java")
        echo "Compilation completed."
        ;;

    run)
        echo "Compilation in progress..."
        mkdir -p "$OUT_DIR"
        cp -r "$RES_DIR"/* "$OUT_DIR"/
        javac --module-path "$JAVAFX_LIB" --add-modules $MODULES \
              -cp "$CP" \
              -d "$OUT_DIR" \
              $(find "$SRC_DIR" -name "*.java")
        echo "Compilation completed."

        echo "Execution..."
        java --module-path "$JAVAFX_LIB" --add-modules $MODULES \
             -cp "$CP:$OUT_DIR" Main
        ;;
    
    clean)
        echo "Cleaning output directory..."
        rm -rf "$OUT_DIR"
        echo "Cleaning completed."
        ;;
    
    *)
        echo "Usage: ./run.sh {compile|run|clean}"
        exit 1
        ;;
esac

exit 0