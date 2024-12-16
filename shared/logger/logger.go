package logger

type Logger interface {
	Info(fields map[string]interface{}, message string)
	Warn(fields map[string]interface{}, message string)
	Error(fields map[string]interface{}, message string)
}

func Info(log Logger, message string, fields map[string]interface{}) {
	log.Info(fields, message)
}

func Warn(log Logger, message string, fields map[string]interface{}) {
	log.Warn(fields, message)
}

func Error(log Logger, message string, fields map[string]interface{}) {
	log.Error(fields, message)
}
