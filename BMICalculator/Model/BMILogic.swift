//
//  BMILogic.swift
//  BMICalculator
//
//  Created by Jenna Marquardt on 2/21/24.
//
// BMI Calculations come from CDC
// https://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html#Interpreted

import Foundation

struct BMILogic {

    var bmi : Double = 0
    
    enum TextError : Error {
        case TextInvalid(reason: String)
        case NoValue(reason: String)
        case ZeroValue(reason: String)
    }
    
    func getbmi() -> Double {
        return bmi
    }
    
    mutating func checkValue(_ text : String) -> (result: String, isValid: Bool) {
        //Error checking for value typed in text field.
        do {
            try isValueInt(text)
            //If valid, update variables in currency logic
            return ("", true)
        } catch TextError.TextInvalid(let reason) {
            //If invalid, return error string.
            return (reason, false)
        } catch TextError.NoValue(let reason) {
            return (reason, false)
        } catch TextError.ZeroValue(let reason) {
            return (reason, false)
        } catch {
            return ("Error found", false)
        }
    }
    
    func isValueInt(_ text : String) throws {
        if text.isEmpty {
            throw TextError.NoValue(reason: "Please type a value.")
        }
        let integers: Set<Character> = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        for char in text {
            if integers.contains(char) {
            } else {
                throw TextError.TextInvalid(reason: "The value must be an integer.")
            }
        }
        if Int(text)! == 0 {
            throw TextError.ZeroValue(reason: "The value must be greater than zero.")
        }
    }
    
    mutating func computeBMI(_ ft : Double, _ inches : Double, _ lbs : Double) {
        //all values should be valid
        let height = (ft * 12) + inches
        bmi = lbs / pow(height, 2) * 703
        
    }
    
    mutating func computeBMI(_ cm : Double, _ kg : Double) {
        //all values should be valid
        bmi = kg / pow((cm * 0.01), 2)
    }
}
