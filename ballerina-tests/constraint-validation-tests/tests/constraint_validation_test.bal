// Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/constraint;
import ballerina/data.csv;
import ballerina/test;

type ConstrainedRec record {
    @constraint:Int {
        minValue: 3,
        maxValue: 10
    }
    int a?;
    @constraint:String {
        minLength: 2
    }
    string b;
};

@test:Config
function testConstraintWithRecords() returns error? {
    ConstrainedRec[]|csv:Error cRec1 = csv:parseString(string `a,b
                4,abc
                3, cde`);
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    ConstrainedRec[]|csv:Error cRec1_2 = csv:parseString(string `a,b
                4,abc
                3, cde`, {enableConstraintValidation: false});
    test:assertEquals(cRec1_2, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = csv:parseString(string `a,b
                4,abc
                11, cde`);
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = csv:parseString(string `a,b
                4,abc
                5, "b"`, {});
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("minLength"));

    cRec1 = csv:transform([{"a": 4, "b": "abc"}, {"a": 3, "b": "cde"}], {});
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = csv:transform([{"a": 4, "b": "abc"}, {"a": 11, "b": "cde"}], {});
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = csv:transform([{"a": 4, "b": "abc"}, {"a": 5, "b": "b"}], {});
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("minLength"));

    cRec1 = csv:parseLists([["4", "abc"], ["3", "cde"]], ["a", "b"]);
    test:assertEquals(cRec1, [{a: 4, b: "abc"}, {a: 3, b: "cde"}]);

    cRec1 = csv:parseLists([["4", "abc"], ["11", "cde"]], ["a", "b"]);
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("maxValue"));

    cRec1 = csv:parseLists([["4", "abc"], ["5", "b"]], ["a", "b"]);
    test:assertTrue(cRec1 is csv:Error);
    test:assertTrue((<error>cRec1).message().startsWith("Validation failed")
                    && (<error>cRec1).message().includes("minLength"));
}
