package schemas

import (
	"fmt"
	"path/filepath"

	"github.com/xeipuuv/gojsonschema"
)

func Validate(schema string, data map[string]string) {
	schemaLoader := gojsonschema.NewReferenceLoader("file://" + toAbsolutePath(schema))
	dataLoader := gojsonschema.NewGoLoader(data)

	result, err := gojsonschema.Validate(schemaLoader, dataLoader)

	if result.Valid() {
		fmt.Printf("The document is valid\n")
	} else {
		fmt.Printf("The document is not valid. see errors :\n")
		for _, err := range result.Errors() {
			fmt.Printf("- %s\n", err)
		}
	}

	if err != nil {
		panic(err.Error())
	}
}

func toAbsolutePath(path string) string {
	absPath, err := filepath.Abs(path)

	if err != nil {
		panic(err)
	}

	return absPath
}
