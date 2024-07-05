import ballerina/test;

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType() {
    StringRecord1Array|Error st1sr1 = parseListAsRecordType([st1, st1], (), {}, StringRecord1Array);
    test:assertTrue(st1sr1 is Error);
    test:assertEquals((<Error>st1sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|Error st2sr1 = parseListAsRecordType([st2, st2], (), {}, StringRecord1Array);
    test:assertTrue(st2sr1 is Error);
    test:assertEquals((<Error>st2sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|Error st1sr2 = parseListAsRecordType([st1, st1], (), {}, StringRecord2Array);
    test:assertTrue(st1sr2 is Error);
    test:assertEquals((<Error>st1sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord2"));

    StringRecord2Array|Error st2sr2 = parseListAsRecordType([st2, st2], (), {}, StringRecord2Array);
    test:assertTrue(st2sr2 is Error);
    test:assertEquals((<Error>st2sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord2"));

    StringRecord9Array|Error st1sr9 = parseListAsRecordType([st1, st1], (), {}, StringRecord9Array);
    test:assertTrue(st1sr9 is Error);
    test:assertEquals((<Error>st1sr9).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord9"));

    StringRecord9Array|Error st2sr9 = parseListAsRecordType([st2, st2], (), {}, StringRecord9Array);
    test:assertTrue(st2sr9 is Error);
    test:assertEquals((<Error>st2sr9).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord9"));

    StringRecord10Array|Error st1sr10 = parseListAsRecordType([st1, st1], (), {}, StringRecord10Array);
    test:assertEquals(st1sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|Error st2sr10 = parseListAsRecordType([st2, st2], (), {}, StringRecord10Array);
    test:assertEquals(st2sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|Error st1sr19 = parseListAsRecordType([st1, st1], (), {}, StringRecord19Array);
    test:assertEquals(st1sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|Error st2sr19 = parseListAsRecordType([st2, st2], (), {}, StringRecord19Array);
    test:assertEquals(st2sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|Error st1sr20 = parseListAsRecordType([st1, st1], (), {}, StringRecord20Array);
    test:assertEquals(st1sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord20Array|Error st2sr20 = parseListAsRecordType([st2, st2], (), {}, StringRecord20Array);
    test:assertEquals(st2sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|Error st1sr21 = parseListAsRecordType([st1, st1], (), {}, StringRecord21Array);
    test:assertEquals(st1sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|Error st2sr21 = parseListAsRecordType([st2, st2], (), {}, StringRecord21Array);
    test:assertEquals(st2sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|Error st1sr22 = parseListAsRecordType([st1, st1], (), {}, StringRecord22Array);
    test:assertEquals(st1sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|Error st2sr22 = parseListAsRecordType([st2, st2], (), {}, StringRecord22Array);
    test:assertEquals(st2sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|Error st1sr23 = parseListAsRecordType([st1, st1], (), {}, StringRecord23Array);
    test:assertEquals(st1sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|Error st2sr23 = parseListAsRecordType([st2, st2], (), {}, StringRecord23Array);
    test:assertEquals(st2sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|Error st1cr15 = parseListAsRecordType([st1, st1], (), {}, CustomRecord15Array);
    test:assertEquals(st1cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord15Array|Error st2cr15 = parseListAsRecordType([st2, st2], (), {}, CustomRecord15Array);
    test:assertEquals(st2cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|Error st1cr16 = parseListAsRecordType([st1, st1], (), {}, CustomRecord16Array);
    test:assertTrue(st1cr16 is Error);
    test:assertEquals((<Error>st1cr16).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|Error st2cr16 = parseListAsRecordType([st2, st2], (), {}, CustomRecord16Array);
    test:assertEquals(st2cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|Error st1cr17 = parseListAsRecordType([st1, st1], (), {}, CustomRecord17Array);
    test:assertEquals(st1cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord17Array|Error st2cr17 = parseListAsRecordType([st2, st2], (), {}, CustomRecord17Array);
    test:assertEquals(st2cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|Error st1cr18 = parseListAsRecordType([st1, st1], (), {}, CustomRecord18Array);
    test:assertTrue(st1cr18 is Error);
    test:assertEquals((<Error>st1cr18).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|Error st2cr18 = parseListAsRecordType([st2, st2], (), {}, CustomRecord18Array);
    test:assertEquals(st2cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|Error st1cr19 = parseListAsRecordType([st1, st1], (), {}, CustomRecord19Array);
    test:assertEquals(st1cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|Error st2cr19 = parseListAsRecordType([st2, st2], (), {}, CustomRecord19Array);
    test:assertEquals(st2cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|Error st1cr20 = parseListAsRecordType([st1, st1], (), {}, CustomRecord20Array);
    test:assertEquals(st1cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|Error st2cr20 = parseListAsRecordType([st2, st2], (), {}, CustomRecord20Array);
    test:assertEquals(st2cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|Error st1cr21 = parseListAsRecordType([st1, st1], (), {}, CustomRecord21Array);
    test:assertEquals(st1cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|Error st2cr21 = parseListAsRecordType([st2, st2], (), {}, CustomRecord21Array);
    test:assertEquals(st2cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|Error st1cr22 = parseListAsRecordType([st1, st1], (), {}, CustomRecord22Array);
    test:assertEquals(st1cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord22Array|Error st2cr22 = parseListAsRecordType([st2, st2], (), {}, CustomRecord22Array);
    test:assertEquals(st2cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|Error st1cr23 = parseListAsRecordType([st1, st1], (), {}, CustomRecord23Array);
    test:assertEquals(st1cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|Error st2cr23 = parseListAsRecordType([st2, st2], (), {}, CustomRecord23Array);
    test:assertEquals(st2cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|Error st1cr24 = parseListAsRecordType([st1, st1], (), {}, CustomRecord24Array);
    test:assertEquals(st1cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|Error st2cr24 = parseListAsRecordType([st2, st2], (), {}, CustomRecord24Array);
    test:assertEquals(st2cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord25Array|Error st1cr25 = parseListAsRecordType([st1, st1], (), {}, CustomRecord25Array);
    test:assertTrue(st1cr25 is Error);
    test:assertEquals((<Error>st1cr25).message(), generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|Error st2cr25 = parseListAsRecordType([st2, st2], (), {}, CustomRecord25Array);
    test:assertTrue(st2cr25 is Error);
    test:assertEquals((<Error>st2cr25).message(), generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|Error st3cr25 = parseListAsRecordType([st3, st3], (), {}, CustomRecord25Array);
    test:assertTrue(st3cr25 is Error);
    test:assertEquals((<Error>st3cr25).message(), generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord25Array|Error st4cr25 = parseListAsRecordType([st4, st4], (), {}, CustomRecord25Array);
    test:assertTrue(st4cr25 is Error);
    test:assertEquals((<Error>st4cr25).message(), generateErrorMessageForInvalidFieldType("string", "1"));

    CustomRecord26Array|Error st1cr26 = parseListAsRecordType([st1, st1], (), {}, CustomRecord26Array);
    test:assertEquals(st1cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|Error st2cr26 = parseListAsRecordType([st2, st2], (), {}, CustomRecord26Array);
    test:assertEquals(st2cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|Error st3cr26 = parseListAsRecordType([st3, st3], (), {}, CustomRecord26Array);
    test:assertEquals(st3cr26 , [
        {'1: s1},
        {'1: s1}
    ]);

    CustomRecord26Array|Error st4cr26 = parseListAsRecordType([st4, st4], (), {}, CustomRecord26Array);
    test:assertEquals(st4cr26 , [
        {'1: s1},
        {'1: s1}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType2() {
    StringRecord1Array|Error st3sr1 = parseListAsRecordType([st3, st3], (), {}, StringRecord1Array);
    test:assertTrue(st3sr1 is Error);
    test:assertEquals((<Error>st3sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord1Array|Error st4sr1 = parseListAsRecordType([st4, st4], (), {}, StringRecord1Array);
    test:assertTrue(st4sr1 is Error);
    test:assertEquals((<Error>st4sr1).message(), generateErrorMessageForMissingRequiredField("s3"));

    StringRecord2Array|Error st3sr2 = parseListAsRecordType([st3, st3], (), {}, StringRecord2Array);
    test:assertTrue(st3sr2 is Error);
    test:assertEquals((<Error>st3sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\"]", "data.csv:StringRecord2"));

    StringRecord2Array|Error st4sr2 = parseListAsRecordType([st4, st4], (), {}, StringRecord2Array);
    test:assertTrue(st4sr2 is Error);
    test:assertEquals((<Error>st4sr2).message(), generateErrorMessageForInvalidHeaders("[\"string\",\"\",\"a\",\"\"]","data.csv:StringRecord2"));

    StringRecord9Array|Error st3sr9 = parseListAsRecordType([st3, st3], (), {}, StringRecord9Array);
    test:assertTrue(st3sr9 is Error);
    test:assertEquals((<Error>st3sr9).message(), generateErrorMessageForMissingRequiredField("s1"));

    StringRecord9Array|Error st4sr9 = parseListAsRecordType([st4, st4], (), {}, StringRecord9Array);
    test:assertTrue(st4sr9 is Error);
    test:assertEquals((<Error>st4sr9).message(), generateErrorMessageForMissingRequiredField("s1"));

    StringRecord10Array|Error st3sr10 = parseListAsRecordType([st3, st3], (), {}, StringRecord10Array);
    test:assertEquals(st3sr10, [
        {'1: "string", '2: ""},
        {'1: "string", '2: ""}
    ]);

    StringRecord10Array|Error st4sr10 = parseListAsRecordType([st4, st4], (), {}, StringRecord10Array);
    test:assertEquals(st4sr10, [
        {'1: "string", '2: "", '3: "a", '4: ""},
        {'1: "string", '2: "", '3: "a", '4: ""}
    ]);

    StringRecord19Array|Error st3sr19 = parseListAsRecordType([st3, st3], (), {}, StringRecord19Array);
    test:assertEquals(st3sr19, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord19Array|Error st4sr19 = parseListAsRecordType([st4, st4], (), {}, StringRecord19Array);
    test:assertEquals(st4sr19, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord20Array|Error st3sr20 = parseListAsRecordType([st3, st3], (), {}, StringRecord20Array);
    test:assertEquals(st3sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord20Array|Error st4sr20 = parseListAsRecordType([st4, st4], (), {}, StringRecord20Array);
    test:assertEquals(st4sr20, [
        {s1: "", s2: ""},
        {s1: "", s2: ""}
    ]);

    StringRecord21Array|Error st3sr21 = parseListAsRecordType([st3, st3], (), {}, StringRecord21Array);
    test:assertEquals(st3sr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord21Array|Error st4sr21 = parseListAsRecordType([st4, st4], (), {}, StringRecord21Array);
    test:assertEquals(st4sr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord22Array|Error st3sr22 = parseListAsRecordType([st3, st3], (), {}, StringRecord22Array);
    test:assertEquals(st3sr22, [
        {s1: "", s2: "", "1": s1, "2": s2},
        {s1: "", s2: "", "1": s1, "2": s2}
    ]);

    StringRecord22Array|Error st4sr22 = parseListAsRecordType([st4, st4], (), {}, StringRecord22Array);
    test:assertEquals(st4sr22, [
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2},
        {s1: "", s2: "", '1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringRecord23Array|Error st3sr23 = parseListAsRecordType([st3, st3], (), {}, StringRecord23Array);
    test:assertEquals(st3sr23, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    StringRecord23Array|Error st4sr23 = parseListAsRecordType([st4, st4], (), {}, StringRecord23Array);
    test:assertEquals(st4sr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord15Array|Error st3cr15 = parseListAsRecordType([st3, st3], (), {}, CustomRecord15Array);
    test:assertEquals(st3cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord15Array|Error st4cr15 = parseListAsRecordType([st4, st4], (), {}, CustomRecord15Array);
    test:assertEquals(st4cr15, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord16Array|Error st3cr16 = parseListAsRecordType([st3, st3], (), {}, CustomRecord16Array);
    test:assertTrue(st3cr16 is Error);
    test:assertEquals((<Error>st3cr16).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord16Array|Error st4cr16 = parseListAsRecordType([st4, st4], (), {}, CustomRecord16Array);
    test:assertEquals(st4cr16, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord17Array|Error st3cr17 = parseListAsRecordType([st3, st3], (), {}, CustomRecord17Array);
    test:assertEquals(st3cr17, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord17Array|Error st4cr17 = parseListAsRecordType([st4, st4], (), {}, CustomRecord17Array);
    test:assertEquals(st4cr17, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord18Array|Error st3cr18 = parseListAsRecordType([st3, st3], (), {}, CustomRecord18Array);
    test:assertTrue(st3cr18 is Error);
    test:assertEquals((<Error>st3cr18).message(), generateErrorMessageForMissingRequiredField("3"));

    CustomRecord18Array|Error st4cr18 = parseListAsRecordType([st4, st4], (), {}, CustomRecord18Array);
    test:assertEquals(st4cr18, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord19Array|Error st3cr19 = parseListAsRecordType([st3, st3], (), {}, CustomRecord19Array);
    test:assertEquals(st3cr19, [
        {'1: s1, '2: s2, '3: "", '4: ""},
        {'1: s1, '2: s2, '3: "", '4: ""}
    ]);

    CustomRecord19Array|Error st4cr19 = parseListAsRecordType([st4, st4], (), {}, CustomRecord19Array);
    test:assertEquals(st4cr19, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord20Array|Error st3cr20 = parseListAsRecordType([st3, st3], (), {}, CustomRecord20Array);
    test:assertEquals(st3cr20, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord20Array|Error st4cr20 = parseListAsRecordType([st4, st4], (), {}, CustomRecord20Array);
    test:assertEquals(st4cr20, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord21Array|Error st3cr21 = parseListAsRecordType([st3, st3], (), {}, CustomRecord21Array);
    test:assertEquals(st3cr21, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord21Array|Error st4cr21 = parseListAsRecordType([st4, st4], (), {}, CustomRecord21Array);
    test:assertEquals(st4cr21, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord22Array|Error st3cr22 = parseListAsRecordType([st3, st3], (), {}, CustomRecord22Array);
    test:assertEquals(st3cr22, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord22Array|Error st4cr22 = parseListAsRecordType([st4, st4], (), {}, CustomRecord22Array);
    test:assertEquals(st4cr22, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomRecord23Array|Error st3cr23 = parseListAsRecordType([st3, st3], (), {}, CustomRecord23Array);
    test:assertEquals(st3cr23, [
        {"1": s1, "2": s2, a: ""},
        {"1": s1, "2": s2, a: ""}
    ]);

    CustomRecord23Array|Error st4cr23 = parseListAsRecordType([st4, st4], (), {}, CustomRecord23Array);
    test:assertEquals(st4cr23, [
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""},
        {'1: s1, '2: s2, '3: s3, '4: s2, a: ""}
    ]);

    CustomRecord24Array|Error st3cr24 = parseListAsRecordType([st3, st3], (), {}, CustomRecord24Array);
    test:assertEquals(st3cr24, [
        {"1": s1, "2": s2},
        {"1": s1, "2": s2}
    ]);

    CustomRecord24Array|Error st4cr24 = parseListAsRecordType([st4, st4], (), {}, CustomRecord24Array);
    test:assertEquals(st4cr24, [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndRecordAsExpectedType3() {
    record{string a; boolean b; int c;}[]|Error ct1br4 = parseListAsRecordType([["a", "1", "true"], ["a", "1", "true"]], ["a", "c", "b"], {});
    test:assertEquals(ct1br4, [
        {a: "a", b: true, c: 1},
        {a: "a", b: true, c: 1}
    ]);

    record{() a; float b; decimal c; boolean d; int e; string f;}[]|Error ct1br6 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br6, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|decimal c; boolean d; int e; string f;|}[]|Error ct1br7 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br7, [
        {c: <decimal>0, d: true, e: 1, f: "a"},
        {c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{decimal c; boolean d; int e; string f;}[]|Error ct1br8 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br8, [
        {a: (), b: 2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: 0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|int|() a; float b; decimal? c; boolean d; int e; string f; string...;|}[]|Error ct1br9 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br9, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|int|() a; float b; decimal? c; string|boolean d; int|string e; string f; string...;|}[]|Error ct1br9_2 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br9_2, [
        {a: (), b: <float>2.23, c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), b: <float>0, c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|decimal c; boolean|string d; int e; string f; string...;|}[]|Error ct1br10 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br10, [
        {a: "null", b: "2.23", c: <decimal>0, d: true, e: 1, f: "a"},
        {a: "()", b: "0", c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|decimal? c; boolean d; int? e; string f; ()...;|}[]|Error ct1br11 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br11, [
        {a: (), c: <decimal>0, d: true, e: 1, f: "a"},
        {a: (), c: <decimal>2.23, d: true, e: 1, f: "a"}
    ]);

    record{|()...;|}[]|Error ct1br12 = parseListAsRecordType(
        [["a", "1", "true", "0", "2.23", "null"], ["a", "1", "true", "2.23", "0", "()"]], 
        ["f", "e", "d", "c", "b", "a"]);
    test:assertEquals(ct1br12, [
        {a: ()},
        {a: ()}
    ]);

    record{|string?...;|}[]|Error ct1br13 = parseListAsRecordType(
        [["a", "1"], ["a", "1"]], 
        ["f", "e"]);
    test:assertEquals(ct1br13, [
        {e: "1", f: "a"},
        {e: "1", f: "a"}
    ]);

    record{|boolean...;|}[]|Error ct1br14 = parseListAsRecordType(
        [["2.23", "null"], ["7", "()"]], 
        ["b", "a"]);
    test:assertEquals(ct1br14, [
        {},
        {}
    ]);

    map<int?>[]|Error ct1br15 = parseListAsRecordType(
        [["2", "()"], ["2", "1"], ["()", "2"]], 
        ["f", "e"]);
    test:assertEquals(ct1br15, [
        {e: (), f: 2},
        {e: 1, f: 2},
        {e: 2, f: ()}
    ]);

    record{|boolean...;|}[]|Error ct1br16 = parseListAsRecordType(
        [["2.23", "null"], ["7", "()"]], 
        ["b", "a"]);
    test:assertEquals(ct1br16, [
        {},
        {}
    ]);
}

@test:Config
function testFromCsvWithTypeForTupleAndMapAsExpectedType() {
    StringMapArray|Error st1sma = parseListAsRecordType([st1, st1], (), {}, StringMapArray);
    test:assertEquals(st1sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|Error st2sma = parseListAsRecordType([st2, st2], (), {}, StringMapArray);
    test:assertEquals(st2sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    StringMapArray|Error st3sma = parseListAsRecordType([st3, st3], (), {}, StringMapArray);
    test:assertEquals(st3sma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    StringMapArray|Error st4sma = parseListAsRecordType([st4, st4], (), {}, StringMapArray);
    test:assertEquals(st4sma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|Error st1niusma = parseListAsRecordType([st1, st1], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st1niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|Error st2niusma = parseListAsRecordType([st2, st2], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st2niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NillableIntUnionStringMapArray|Error st3niusma = parseListAsRecordType([st3, st3], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st3niusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    NillableIntUnionStringMapArray|Error st4niusma = parseListAsRecordType([st4, st4], (), {}, NillableIntUnionStringMapArray);
    test:assertEquals(st4niusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|Error st1iusma = parseListAsRecordType([st1, st1], (), {}, IntUnionStringMapArray);
    test:assertEquals(st1iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|Error st2iusma = parseListAsRecordType([st2, st2], (), {}, IntUnionStringMapArray);
    test:assertEquals(st2iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    IntUnionStringMapArray|Error st3iusma = parseListAsRecordType([st3, st3], (), {}, IntUnionStringMapArray);
    test:assertEquals(st3iusma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    IntUnionStringMapArray|Error st4iusma = parseListAsRecordType([st4, st4], (), {}, IntUnionStringMapArray);
    test:assertEquals(st4iusma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|Error st1jma = parseListAsRecordType([st1, st1], (), {}, JsonMapArray);
    test:assertEquals(st1jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    JsonMapArray|Error st2jma = parseListAsRecordType([st2, st2], (), {}, JsonMapArray);
    test:assertEquals(st2jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    JsonMapArray|Error st3jma = parseListAsRecordType([st3, st3], (), {}, JsonMapArray);
    test:assertEquals(st3jma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    JsonMapArray|Error st4jma = parseListAsRecordType([st4, st4], (), {}, JsonMapArray);
    test:assertEquals(st4jma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|Error st1anydma = parseListAsRecordType([st1, st1], (), {}, AnydataMapArray);
    test:assertEquals(st1anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|Error st2anydma = parseListAsRecordType([st2, st2], (), {}, AnydataMapArray);
    test:assertEquals(st2anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    AnydataMapArray|Error st3anydma = parseListAsRecordType([st3, st3], (), {}, AnydataMapArray);
    test:assertEquals(st3anydma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    AnydataMapArray|Error st4anydma = parseListAsRecordType([st4, st4], (), {}, AnydataMapArray);
    test:assertEquals(st4anydma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|Error st1cma = parseListAsRecordType([st1, st1], (), {}, CustomMapArray);
    test:assertEquals(st1cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|Error st2cma = parseListAsRecordType([st2, st2], (), {}, CustomMapArray);
    test:assertEquals(st2cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    CustomMapArray|Error st3cma = parseListAsRecordType([st3, st3], (), {}, CustomMapArray);
    test:assertEquals(st3cma , [
        {'1: s1, '2: s2},
        {'1: s1, '2: s2}
    ]);

    CustomMapArray|Error st4cma = parseListAsRecordType([st4, st4], (), {}, CustomMapArray);
    test:assertEquals(st4cma , [
        {'1: s1, '2: s2, '3: s3, '4: s2},
        {'1: s1, '2: s2, '3: s3, '4: s2}
    ]);

    NilMapArray|Error st1nma = parseListAsRecordType([st1, st1], (), {}, NilMapArray);
    test:assertEquals(st1nma, ([
        {},
        {}
    ]));

    IntegerMapArray|Error st2ima = parseListAsRecordType([st2, st2], (), {}, IntegerMapArray);
    test:assertEquals(st2ima, ([
        {},
        {}
    ]));

    DecimalMapArray|Error st3dma = parseListAsRecordType([st3, st3], (), {}, DecimalMapArray);
    test:assertEquals(st3dma, ([
        {},
        {}
    ]));

    BooleanMapArray|Error st4bma = parseListAsRecordType([st4, st4], (), {}, BooleanMapArray);
    test:assertEquals(st4bma, ([
        {},
        {}
    ]));
}
