package logger

// Info loguea un mensaje con nivel de información
func Info(log Logger, message string, fields map[string]interface{}) {
	log.Info().
		Fields(fields).
		Msg(message)
}

// Warn loguea un mensaje con nivel de advertencia
func Warn(log Logger, message string, fields map[string]interface{}) {
	log.Warn().
		Fields(fields).
		Msg(message)
}

// Error loguea un mensaje con nivel de error
func Error(log Logger, message string, fields map[string]interface{}) {
	log.Error().
		Fields(fields).
		Msg(message)
}
