#ifndef LOG_COMMON_H__
#define LOG_COMMON_H__

#include <stdio.h>

#define LOG_LINE_ENDING   "\r\n"
#define LOG_FUNCTION_NAME __FUNCTION__

#define LOG_ERROR(...)   LOG_ERROR_(__VA_ARGS__, LOG_LINE_ENDING)
#define LOG_WARNING(...) LOG_WARNING_(__VA_ARGS__, LOG_LINE_ENDING)
#define LOG_INFO(...)    LOG_INFO_(__VA_ARGS__, LOG_LINE_ENDING)
#define LOG_DEBUG(...)   LOG_DEBUG_(__VA_ARGS__, LOG_LINE_ENDING)
#define LOG_VERBOSE(...) LOG_VERBOSE_(__VA_ARGS__, LOG_LINE_ENDING)

#define LOG_ERROR_(fmt, ...)   printf("<E> %s: " fmt "%s", LOG_FUNCTION_NAME, __VA_ARGS__)
#define LOG_WARNING_(fmt, ...) printf("<W> %s: " fmt "%s", LOG_FUNCTION_NAME, __VA_ARGS__)
#define LOG_INFO_(fmt, ...)    printf("<I> %s: " fmt "%s", LOG_FUNCTION_NAME, __VA_ARGS__)
#define LOG_DEBUG_(fmt, ...)   printf("<D> %s: " fmt "%s", LOG_FUNCTION_NAME, __VA_ARGS__)
#define LOG_VERBOSE_(fmt, ...) printf("<V> %s: " fmt "%s", LOG_FUNCTION_NAME, __VA_ARGS__)

#endif // LOG_COMMON_H__
