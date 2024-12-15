package logger

import (
	"os"

	"github.com/rs/zerolog"
)

type ZerologLogger struct {
	logger zerolog.Logger
}

type Logger interface {
	Info() *zerolog.Event
	Warn() *zerolog.Event
	Error() *zerolog.Event
}

// Nueva instancia de un ZerologLogger
func NewZerologLogger() *ZerologLogger {
	return &ZerologLogger{
		logger: zerolog.New(os.Stderr).With().Timestamp().Logger(),
	}
}

// Métodos de la interfaz Logger para Zerolog
func (l *ZerologLogger) Info() *zerolog.Event {
	return l.logger.Info()
}

func (l *ZerologLogger) Warn() *zerolog.Event {
	return l.logger.Warn()
}

func (l *ZerologLogger) Error() *zerolog.Event {
	return l.logger.Error()
}
