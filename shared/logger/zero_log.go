package logger

import (
	"os"

	"github.com/rs/zerolog"
)

type ZerologLogger struct {
	logger zerolog.Logger
}

// Nueva instancia de un ZerologLogger
func NewZerologLogger() *ZerologLogger {
	return &ZerologLogger{
		logger: zerolog.New(os.Stderr).With().Timestamp().Logger(),
	}
}

func (l *ZerologLogger) Info(fields map[string]interface{}, message string) {
	l.logger.Info().Fields(fields).Msg(message)
}

func (l *ZerologLogger) Warn(fields map[string]interface{}, message string) {
	l.logger.Warn().Fields(fields).Msg(message)
}

func (l *ZerologLogger) Error(fields map[string]interface{}, message string) {
	l.logger.Error().Fields(fields).Msg(message)
}
