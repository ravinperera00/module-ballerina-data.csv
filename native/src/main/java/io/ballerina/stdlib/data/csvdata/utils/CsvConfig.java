package io.ballerina.stdlib.data.csvdata.utils;

import io.ballerina.runtime.api.utils.StringUtils;
import io.ballerina.runtime.api.values.BArray;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BString;

import static io.ballerina.stdlib.data.csvdata.utils.Constants.ConfigConstants.*;

public class CsvConfig {
    public char delimiter = ',';
    public char textEnclosure = '\\';
    public Object header = 0;
    public char escapeChar = '\\';
    public Object lineTerminator = '\n';
    public Object skipLines = null;
    public Object nilValue = null;
    public char comment = '#';
    public String locale = "EN/US";
    public String encoding = "UTF-8";
    public boolean nilAsOptionalField = false;
    public boolean absentAsNilableType = false;
    public boolean allowDataProjection = true;
    public Object customHeader = null;
    public BArray headersOrder = null;
    public boolean stringConversion = false;
    public boolean enableConstraintValidation = false;

    private CsvConfig(Object skipLines, boolean nilAsOptionalField,
                      boolean absentAsNilableType, boolean allowDataProjection) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
    }

    private CsvConfig(boolean enableConstraintValidation, Object skipLines, boolean nilAsOptionalField,
                      boolean absentAsNilableType, boolean allowDataProjection) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.enableConstraintValidation = enableConstraintValidation;
    }

    private CsvConfig(Object skipLines, boolean nilAsOptionalField,
                      boolean absentAsNilableType, boolean allowDataProjection, Object customHeader) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.customHeader = customHeader;
    }

    private CsvConfig(Object skipLines, boolean nilAsOptionalField,
                      boolean absentAsNilableType, boolean allowDataProjection, boolean stringConversion) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.stringConversion = stringConversion;
    }

//    private CsvConfig(Object skipLines, boolean nilAsOptionalField, boolean absentAsNilableType,
//                      boolean allowDataProjection, boolean stringConversion, Object customHeader) {
//        this.skipLines = skipLines;
//        this.nilAsOptionalField = nilAsOptionalField;
//        this.absentAsNilableType = absentAsNilableType;
//        this.allowDataProjection = allowDataProjection;
//        this.stringConversion = stringConversion;
//        this.customHeader = customHeader;
//    }

    private CsvConfig(Object skipLines, boolean nilAsOptionalField, boolean absentAsNilableType,
                      boolean allowDataProjection, boolean stringConversion, Object customHeader,
                      boolean enableConstraintValidation) {
        this.skipLines = skipLines;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.stringConversion = stringConversion;
        this.customHeader = customHeader;
        this.enableConstraintValidation = enableConstraintValidation;
    }

    public static CsvConfig createListTypeOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
            options.get(SKIP_LINES),
            options.getBooleanValue(NIL_AS_OPTIONAL).booleanValue(),
            options.getBooleanValue(ABSENT_AS_NILABLE).booleanValue(),
            options.getBooleanValue(ALLOW_DATA_PROJECTION).booleanValue(),
            options.getBooleanValue(STRING_CONVERSION).booleanValue()
        );
    }

    public static CsvConfig createListAsRecordTypeOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.get(SKIP_LINES),
                options.getBooleanValue(NIL_AS_OPTIONAL).booleanValue(),
                options.getBooleanValue(ABSENT_AS_NILABLE).booleanValue(),
                options.getBooleanValue(ALLOW_DATA_PROJECTION).booleanValue(),
                options.getBooleanValue(STRING_CONVERSION).booleanValue(),
                options.get(CUSTOM_HEADERS),
                options.getBooleanValue(ENABLE_CONSTRAINT_VALIDATION).booleanValue()
        );
    }

    private CsvConfig(char delimiter, char textEnclosure, Object header,
                      char escapeChar, Object lineTerminator, Object skipLines,
                      Object nilValue, char comment, String locale, String encoding,
                      boolean nilAsOptionalField, boolean absentAsNilableType, boolean allowDataProjection) {
        this.delimiter = delimiter;
        this.textEnclosure = textEnclosure;
        this.header = header;
        this.escapeChar = escapeChar;
        this.lineTerminator = lineTerminator;
        this.nilValue = nilValue == null ? null : nilValue;
        this.comment = comment;
        this.locale = locale;
        this.encoding = encoding;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.skipLines = skipLines;
    }

    private CsvConfig(char delimiter, char textEnclosure, Object header, char escapeChar, Object lineTerminator,
                      Object skipLines, Object nilValue, char comment, String locale, String encoding,
                      boolean nilAsOptionalField, boolean absentAsNilableType,
                      boolean allowDataProjection, Object customHeaders, boolean enableConstraintValidation) {
        this.delimiter = delimiter;
        this.textEnclosure = textEnclosure;
        this.header = header;
        this.escapeChar = escapeChar;
        this.lineTerminator = lineTerminator;
        this.nilValue = nilValue == null ? null : nilValue;
        this.comment = comment;
        this.locale = locale;
        this.encoding = encoding;
        this.nilAsOptionalField = nilAsOptionalField;
        this.absentAsNilableType = absentAsNilableType;
        this.allowDataProjection = allowDataProjection;
        this.skipLines = skipLines;
        this.customHeader = customHeaders;
        this.enableConstraintValidation = enableConstraintValidation;
    }

    public static CsvConfig createRecordAsRecordOption(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.getBooleanValue(ENABLE_CONSTRAINT_VALIDATION),
                options.get(SKIP_LINES),
                options.getBooleanValue(NIL_AS_OPTIONAL),
                options.getBooleanValue(ABSENT_AS_NILABLE),
                options.getBooleanValue(ALLOW_DATA_PROJECTION)
        );
    }

    public static CsvConfig createParseOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                StringUtils.getStringValue(options.getStringValue(DELIMITER)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(TEXT_ENCLOSURE)).charAt(0),
                options.get(HEADER),
                StringUtils.getStringValue(options.getStringValue(ESCAPE_CHAR)).charAt(0),
                options.get(LINE_TERMINATOR),
                options.get(SKIP_LINES),
                options.get(NIL_VALUE),
                StringUtils.getStringValue(options.getStringValue(COMMENT_CHAR)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(LOCALE)),
                StringUtils.getStringValue(options.getStringValue(ENCODING)),
                options.getBooleanValue(NIL_AS_OPTIONAL),
                options.getBooleanValue(ABSENT_AS_NILABLE),
                options.getBooleanValue(ALLOW_DATA_PROJECTION)
        );
    }

    public static CsvConfig createParserToRecordOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                StringUtils.getStringValue(options.getStringValue(DELIMITER)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(TEXT_ENCLOSURE)).charAt(0),
                options.get(HEADER),
                StringUtils.getStringValue(options.getStringValue(ESCAPE_CHAR)).charAt(0),
                options.get(LINE_TERMINATOR),
                options.get(SKIP_LINES),
                options.getStringValue(NIL_VALUE),
                StringUtils.getStringValue(options.getStringValue(COMMENT_CHAR)).charAt(0),
                StringUtils.getStringValue(options.getStringValue(LOCALE)),
                StringUtils.getStringValue(options.getStringValue(ENCODING)),
                options.getBooleanValue(NIL_AS_OPTIONAL),
                options.getBooleanValue(ABSENT_AS_NILABLE),
                options.getBooleanValue(ALLOW_DATA_PROJECTION),
                options.get(CUSTOM_HEADERS),
                options.getBooleanValue(ENABLE_CONSTRAINT_VALIDATION)
        );
    }

    public static CsvConfig createToRecordOptions(BMap<BString, Object> options) {
        updateDataProjectOptions(options);
        return new CsvConfig(
                options.get(SKIP_LINES),
                options.getBooleanValue(NIL_AS_OPTIONAL),
                options.getBooleanValue(ABSENT_AS_NILABLE),
                options.getBooleanValue(ALLOW_DATA_PROJECTION),
                options.get(CUSTOM_HEADERS)
        );
    }

    private static void updateDataProjectOptions(BMap<BString, Object> options) {
        Object allowProjections = options.get(ALLOW_DATA_PROJECTION);
        if (allowProjections instanceof Boolean) {
            options.put(NIL_AS_OPTIONAL, false);
            options.put(ABSENT_AS_NILABLE, false);
            return;
        }
        BMap<BString, Object> projections = (BMap<BString, Object>) allowProjections;
        options.put(ALLOW_DATA_PROJECTION, true);
        options.put(NIL_AS_OPTIONAL, projections.getBooleanValue(NIL_AS_OPTIONAL));
        options.put(ABSENT_AS_NILABLE, projections.getBooleanValue(ABSENT_AS_NILABLE));
    }
}
