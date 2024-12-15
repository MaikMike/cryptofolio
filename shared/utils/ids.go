package utils

import (
	nanoid "github.com/matoous/go-nanoid"
)

func UniqueId(len int) string {
	id, error := nanoid.ID(len)

	if error != nil {
		panic(error)
	}

	return id
}
