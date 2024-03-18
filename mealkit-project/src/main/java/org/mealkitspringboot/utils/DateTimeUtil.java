package org.zerock.utils;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class DateTimeUtil {

    public static String formatDateTime(String dateTimeString) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
        LocalDateTime dateTime = LocalDateTime.parse(dateTimeString, formatter);

        // 현재 시간을 ZonedDateTime으로 얻기
        ZonedDateTime currentZonedDateTime = ZonedDateTime.now();

        // 입력된 날짜와 시간을 ZonedDateTime으로 변환
        ZonedDateTime inputZonedDateTime = ZonedDateTime.of(dateTime, ZoneId.systemDefault());

        // 현재 시간과 입력된 시간의 차이를 계산 (단위: 시간)
        long hoursDifference = (currentZonedDateTime.toEpochSecond() - inputZonedDateTime.toEpochSecond()) / 3600;

        if (hoursDifference >= 24) {
            // 24시간이 지난 경우
            return dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        } else {
            // 24시간이 지나지 않은 경우
            return dateTime.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
        }
    }
}
