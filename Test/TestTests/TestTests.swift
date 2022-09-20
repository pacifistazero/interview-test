import XCTest
@testable import Test

class TestTests: XCTestCase {
    
    func testStairCase() {
        // Write your code here
        let n = 10
        for index in 1...n {
            let counter = n - index
            if index != 1 {
                print()
            }
            for i in 1...n {
                if counter < i {
                    print("#", terminator: "")
                } else {
                    print(" ", terminator: "") // space + space
                }
            }
        }
    }
    
    func testMinMaxSum() {
        // Write your code here
        let arr:[Int] = [1, 3, 5, 7, 9]
        var sortedArray = arr
        sortedArray.sort()
        
        var totalMin = 0
        var totalMax = 0
        for i in 1..<sortedArray.count {
            totalMax += sortedArray[i]
        }
        
        for j in stride(from: sortedArray.count-1, through: 0, by: -1) {
            if j != 0 {
                totalMin += sortedArray[j-1]
            }
        }
        
        print("\(totalMin) \(totalMax)")
    }
    
    func testBirthdayCake() {
        let candles:[Int] = [3, 2, 2, 1, 1, 3, 4]
        var counts: [Int : Int] = [:]
        
        candles.forEach {
            counts[$0, default: 0] += 1
        }
        
        let sortedDict = counts.sorted(by: {$0.value < $1.value})
        let count: Int = sortedDict.last?.value ?? 0
        print(count)
    }
    
    func testTimeConversion() {
        let time = "12:45:54PM"
        let hour = Int(time.prefix(2)) ?? 0
        
        var newTime = time
        if time.contains("PM") {
            if 0...11 ~= hour {
                newTime = time.replacingOccurrences(of: time.prefix(2), with: String(hour + 12))
            }
        } else {
            if hour == 12 {
                newTime = time.replacingOccurrences(of: time.prefix(2), with: "00")
            }
        }
        
        print(String(newTime.dropLast(2)))
    }
    
    func testProportion() {
        // Write your code here
        let arr:[Int] = [1, 2, 3, -1, -2, -3, 0, 0]
        var negativeRatio = 0
        var positiveRatio = 0
        var zeroRatio = 0
        for i in 0..<arr.count {
            if arr[i] < 0 {
                negativeRatio+=1
            } else if arr[i] > 0 {
                positiveRatio+=1
            } else{
                zeroRatio+=1
            }
        }
        
        print(String(format:"%.6f", Double(positiveRatio) / Double(arr.count)))
        print(String(format:"%.6f", Double(negativeRatio) / Double(arr.count)))
        print(String(format:"%.6f", Double(zeroRatio) / Double(arr.count)))
    }
    
    func testGrades() {
        let grades:[Int] = [73, 67, 38, 33]
        var newGrades: [Int] = []
        for grade in grades {
            if grade >= 38 {
                if grade % 5 > 2 {
                    newGrades.append(grade + (5 - (grade % 5)))
                }
            }
            print(grade)
        }
    }
    
    func testCountApplesAndOranges() -> Void {
        let houseStartPoint = 2
        let houseEndPoint = 3
        
        let appleTreeLoc = 1
        let orangeTreeLoc = 5
        let distanceApples: [Int] = [-2]
        let distanceOranges: [Int] = [-1]
        
        var countApple = 0
        var appleLoc = 0
        for distanceApple in distanceApples {
            if distanceApple < 0 {
                appleLoc = appleTreeLoc - abs(distanceApple)
            } else {
                appleLoc = appleTreeLoc + distanceApple
            }
            
            if houseStartPoint...houseEndPoint ~= appleLoc {
                countApple += 1
            }
        }
        
        var countOrange = 0
        var orangeLoc = 0
        for distanceOrange in distanceOranges {
            if distanceOrange < 0 {
                orangeLoc = orangeTreeLoc - abs(distanceOrange)
            } else {
                orangeLoc = orangeTreeLoc + distanceOrange
            }
            
            if houseStartPoint...houseEndPoint ~= orangeLoc {
                countOrange += 1
            }
        }
        
        print("\(countApple) \(countOrange)")
    }
    
    func testKangaroo() {
        let firstKangarooStart = 2081
        let firstKangarooMovesRate = 8403
        let secondKangarooStart = 9107
        let secondKangarooMovesRate = 8400
        
        var response = "NO"
        if firstKangarooMovesRate > secondKangarooMovesRate { // first kangaroo will eventually catching up
            if (firstKangarooStart - secondKangarooStart) % (secondKangarooMovesRate - firstKangarooMovesRate) == 0 {
                response = "YES"
            }
        }
        
        print(response)
    }
    
    func testBirthday() {
        let s: [Int] = [2, 5, 1, 3, 4, 4, 3, 5, 1, 1, 2, 1, 4, 1, 3, 3, 4, 2, 1]
        let d: Int = 18
        let m: Int = 7
        
        var total = 0
        for i in 0...(s.count-m) { // 19 - 7 // as the piece that want to be share is 7 no need to continue from element 12 onwards
            let pieces = s[i..<(i+m)].reduce(0, +)
            if pieces == d {
                total += 1
            }
        }
        
        print(total)
    }
    
    func testGetX() {
        let a: [Int] = [2, 4]
        let b: [Int] = [16, 32, 96]
        
        if let maxA = a.max(), let minB = b.min(), minB >= maxA {
            let items = Array(maxA...minB)
            let count = items.filter { (item) -> Bool in
                let modA = a.map { item % $0 }.reduce(0, +)
                let modB = b.map { $0 % item }.reduce(0, +)
                // filter the items that meet both requirements
                return (modA + modB) == 0
            }.count
            
            print(count)
        }
        
        print(0)
    }
    
    func testDivisibleSumPairs() {
        let ar = [129, 97, 52, 86, 27, 89, 77, 19, 99, 96]
        let k = 3
        
        var count = 0
        for i in 0..<ar.count {
            for j in i+1..<ar.count {
                if (ar[i] + ar[j]) % k == 0 {
                    count+=1
                }
            }
        }
        
        print(count)
    }
    
    func testMigratoryBird() {
        var dictionary: [Int:Int] = [:]
        let arr = [1, 2, 3, 4, 5, 4, 3, 2, 1, 3, 4]
        arr.forEach {
            dictionary[$0] = (dictionary[$0] ?? 0) + 1
        }
        
        let count = dictionary.filter { $0.value == dictionary.values.max()}.keys.min() ?? 0
        print(count)
    }
    
    func testProgrammersDate() {
        let year = 2017
        var isLeap: Bool {
            return year < 1918 &&
                year % 4 == 0 ||
                year > 1917 &&
                year % 400 == 0 ||
                year > 1917 &&
                year % 4 == 0 &&
                year % 100 != 0
        }
        
        if isLeap {
                print("12.09.\(year)")
        } else if year == 1918 {
                print("26.09.1918")
        }
        print("13.09.\(year)")
    }
    
    func testSockMerchant() {
        let ar = [10, 20, 20, 10, 10, 30, 50, 10, 20]
        var pairs: [Int:Int] = [:]
        ar.forEach {
            pairs[$0] = (pairs[$0] ?? 0) + 1
        }
        
        print(pairs)
        let count = pairs.filter { (pair) -> Bool in
            return pair.value >= 2 && (pair.value % 2 == 0 || pair.value % 2 == 1)
        }.map { $0.value / 2 }.reduce(0, +)
        
        print(count)
        
        // Super short. Convert directly to dictionary from array and create new array where total of value / 2
        print(Dictionary(grouping: ar, by: {$0}).map({ $1.count / 2 }).reduce(0, +))
    }
    
    func testPageCount() {
        // Write your code here
        let n: Int = 5
        let p: Int = 4
        let totalPageTurnCountFromFront = n / 2;
        let targetPageTurnCountFromFront = p / 2;
        let targetPageTurnCountFromBack = totalPageTurnCountFromFront - targetPageTurnCountFromFront;

        print(min(targetPageTurnCountFromFront, targetPageTurnCountFromBack))
    }
    
    func testCountingValleys() {
        let path: String = "DDUUDDUDUUUD"
        var level = 0
        var valley = 0
        
        for p in path {
            level += p == "U" ? 1 : -1
            if (level == 0 && p == "U") {
                valley += 1
            }
        }
        
        print(valley)
    }
    
    func testGetMoneySpent() {
        /*
         * Write your code here.
         */
        
        let keyboards: [Int] = [4]
        let drives: [Int] = [5]
        let b: Int = 5
        var total : [Int] = []
        var index = 0
        for k in keyboards {
            index += 1
            for d in drives {
                if k + d <= b{
                    total.append(k+d)
                }
            }
        }
        
        print(total.max() ?? -1)
    }
    
    // find the most duplicated number
    func testDuplicateNumbers() {
        let a = [4, 6, 5, 3, 3, 1].sorted()
        var dictionary : [Int : Int] = [:]
        a.forEach {
            dictionary[$0] = (dictionary[$0] ?? 0) + 1
        }
        
        if let key = dictionary.first(
            where: {
                $0.value == dictionary.values.max()
            }
        )?.key {
            print(key)
        }
    }
    
    // find the most unique number
    func testLonelyinteger() {
        // Write your code here
        let a = [0, 0, 1, 2, 1].sorted()
        var dict : [Int : Int] = [:]
        a.forEach {
            dict[$0] = (dict[$0] ?? 0) + 1
        }
        
        let uniqueNumber = dict.first(where: {
            $0.value == dict.values.min()
        })?.key ?? 0
        
        print(uniqueNumber)
    }
    
    func testCountingSort() {
        // Write your code here
        let arr = [63, 25, 73, 1, 98, 73, 56,
                   84, 86, 57, 16, 83, 8, 25,
                   81, 56, 9, 53, 98, 67, 99,
                   12, 83, 89, 80, 91, 39, 86,
                   76, 85, 74, 39, 25, 90, 59,
                   10, 94, 32, 44, 3, 89, 30,
                   27, 79, 46, 96, 27, 32, 18,
                   21, 92, 69, 81, 40, 40, 34,
                   68, 78, 24, 87, 42, 69, 23,
                   41, 78, 22, 6, 90, 99, 89,
                   50, 30, 20, 1, 43, 3, 70,
                   95, 33, 46, 44, 9, 69, 48,
                   33, 60, 65, 16, 82, 67, 61,
                   32, 21, 79, 75, 75, 13, 87,
                   70, 33]
        
        print(arr.reduce(into: Array(repeating: 0, count: 100)) {
                $0[$1] += 1
        })
    }
    
    // The goal of the game is to maximize the sum of the elements in the submatrix located in the upper-left quadrant of the matrix.
    func testFlippingMatrix() {
        // Write your code here
        let matrix = [[112, 42, 83, 119],
                      [56, 125, 56, 49],
                      [15, 78, 101, 43],
                      [62, 98, 114, 108]]
        let topLeftMatrixLength = matrix.count/2
        var total = 0
        for row in 0..<topLeftMatrixLength {
            for column in 0..<topLeftMatrixLength {
                let topLeftQuadrantPoint = matrix[row][column]
                let bottomLeftQuadrantPoint = matrix[matrix.count - 1 - row][column]
                let topRightQuadrantPoint = matrix[row][matrix.count - 1 - column]
                let bottomRightQuadrantPoint = matrix[matrix.count - 1 - row][matrix.count - 1 - column]

                var maximum = max(topLeftQuadrantPoint, bottomLeftQuadrantPoint)
                maximum = max(maximum, topRightQuadrantPoint)
                maximum = max(maximum, bottomRightQuadrantPoint)

                total += maximum
            }
        }
        print(total)
    }
    
    // find longest subarray where the absolute difference between any two elements is less than or equal to 1
    func testPickingNumbers() {
        let a = [4, 6, 5, 3, 3, 1].sorted()
        var result = 0
        let sortedArray = a.sorted()
        let totalArray = sortedArray.reduce(into: Array(repeating: 0, count: 101)) { partialResult, current in
                partialResult[current] = partialResult[current] + 1
        }
        let totalArray2 = totalArray.reduce(into: [0], { nextPartialResult, current in
            result = max(result, current + nextPartialResult.last!)
            nextPartialResult.append(current)
        })
        print(totalArray2)
    }
    
    // The Utopian Tree goes through 2 cycles of growth every year.
    // Each spring, it doubles in height. Each summer, its height increases by 1 meter.
    // A Utopian Tree sapling with a height of 1 meter is planted at the onset of spring.
    // How tall will the tree be after `n` growth cycles?
    func testUtopianTree() {
        let n = 5
        
        var height : Int = 0
        if n == 0 {
            height = 1
            return
        }
            
        for i in 0...n {
            //i == 0 : height = 1 // initial
            //i == 1 : height = 2 // spring(*2)
            //i == 2 : height = 3 // spring(*2) + summer(+1)
            //i == 3 : height = 6 // spring(*2) + summer(+1) + spring(*2)
            //i == 4 : height = 7 // spring(*2) + summer(+1) + spring(*2) + summer(+1)
            //i == 5 : height = 14
            
            if i % 2 == 0 {
                height += 1
            } else if i % 2 != 0 {
                height *= 2
            }
        }
        
        print(height)
        
        // shorter version
        print((0..<n).reduce(1) {
                $1 % 2 == 0 ? $0 * 2 : $0 + 1
        })
    }
    
    func testAngryProfessor() {
        let k: Int = 3
        let a: [Int] = [0, -1, 2, 1]
        
        var onTime : [Int] = []
        var late : [Int] = []
        a.forEach {
            $0 <= 0 ? onTime.append($0) : late.append($0)
        }
        
        print(onTime)
        print(late)
        if onTime.count >= k {
            print("NO")
        } else {
            print("YES")
        }
        
        // Short version
        // 1. Filter the array that has a <= 0
        // 2. Count the array
        // 3. If total item is >= k then print NO otherwise YES
        a.filter { ($0 <= 0) }.count >= k ? print("NO") : print("YES")
    }
    
    func testViralAdvertising() {
        let n = 3
        var cumulative = 0
        var shared = 5
        for _ in 1...n {
            let liked = abs(shared/2)
            shared = liked * 3
            cumulative += liked
        }
        
        print(cumulative)
    }
    
    /*
     Given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
     For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
     Given A = [1, 2, 3], the function should return 4.
     Given A = [−1, −3], the function should return 1.
     */
    func testSmallestPositiveInteger() {
        let a : [Int] =  [1, 3, 6, 4, 1, 2]
        
        var dict : [Int:Bool] = [:]
        for i in a {
            dict[i] = true
        }
        
        for i in 1..<a.count {
            if dict[i] == nil {
                print(i)
            }
        }
    }
    
    /**
     John Watson knows of an operation called a right circular rotation on an array of integers.
     One rotation operation moves the last array element to the first position and shifts all remaining elements right one.
     To test Sherlock's abilities, Watson provides Sherlock with an array of integers.
     Sherlock is to perform the rotation operation a number of times then determine the value of the element at a given position.

     For each array, perform a number of right circular rotations and return the values of the elements at the given indices.
     */
    func testCircularArrayRotation() {
        // Write your code here
        let queries = [1, 2]
        let k = 2
        let a = [3,4,5]
        var result: [Int] = []
        let startIndex = a.count - k % a.count // 3 - 2 % 3 = 1
        for index in queries {
            // index = 1 --> a[(1 + 1) % 3] = a[2] = 5
            // index = 2 --> a[(1 + 2) % 3] = a[0] = 3
            result.append(a[(startIndex + index) % a.count])
        }
        print(result)
    }
    
    func testPermutationEquation() {
        // Write your code here
        var array : [Int] = []
        let p: [Int] = [2, 3, 1]
        
        // p --> 2, 3, 1
        for i in 0..<p.count {
            let index = p.firstIndex(of: i + 1) ?? p.endIndex
            let index2 = p.firstIndex(of: index + 1) ?? p.endIndex
            array.append(index2 + 1)
        }
        
        print(array)
    }
    
    func testFindDigits() {
        // Write your code here
        let n = 1012
        let total = String(n).map { $0.wholeNumberValue! }.filter { $0 > 0 }.filter{ n % $0 == 0 }.count
        print(total)
    }
    
    func testExtraLongFactorials() {
        let n = 25
        var factorial : UInt64 = 1
        for i in 1...n {
            factorial *= UInt64(i)
        }
        
        print(factorial)
    }
    
    // MARK: Not working. Time limit
    func testGetKthSmallestTerm_With2DArray() {
        
        let array = [2, 2, 1]
        let k = 5
        
        let benchmarkTime = BenchTimer.measureBlock {
            var tempArray = [[Int]]()
            for i in 0..<array.count {
                for j in 0..<array.count {
                    tempArray.append([array[i], array[j]])
                }
            }
            
            let sortedArray = tempArray.sorted {
                $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]
            }
            print(sortedArray[k-1])
        }.formattedTime
        
        print(benchmarkTime)
    }
    
    func testJumpingOnClouds() {
        let c: [Int] = [0, 0, 1, 0, 0, 1, 1, 0]
        let k: Int = 2
        
        var e = 100
        var position = 0

        repeat {
            e -= (c[position] == 1) ? 3 : 1
            position += k
        } while position < c.count
        print(e)
    }
    
    func testWhileLoop() {
        var i = 0
        while(i<10) {
            print("Test \(i)")
            i+=1
        }
    }
    
    /**
     You have two strings of lowercase English letters. You can perform two types of operations on the first string:

     Append a lowercase English letter to the end of the string.
     Delete the last character of the string. Performing this operation on an empty string results in an empty string.
     Given an integer k, and two strings, s and t, determine whether or not you can convert s to t by performing exactly k of the above operations on s.
     If it's possible, print Yes. Otherwise, print No.
     */
    func testAppendAndDelete() {
        let s: String = "abc"
        let t: String = "def"
        let k: Int = 6
        
        let firstString = s
        var secondString = t
        var actualNumberOfMoves = 0
        let differenceBetweenTwoStringLengths = Int(abs(s.count - t.count))
        var count = 0
        
        for _ in 1...t.count {
            if firstString.hasPrefix(secondString) {
                if count == 0 {
                    actualNumberOfMoves = differenceBetweenTwoStringLengths
                } else {
                    actualNumberOfMoves = ((firstString.count - secondString.count) + count)
                }
            } else {
                if secondString.count > 1 {
                    secondString.removeLast()
                    count += 1
                } else {
                    actualNumberOfMoves = s.count + t.count
                }
            }
        }
        
        if actualNumberOfMoves == k {
            print("Yes")
        } else if actualNumberOfMoves < k {
            if (k - actualNumberOfMoves) % 2 != 0 && differenceBetweenTwoStringLengths != 0 && t.count != 1 {
                print("No")
            } else {
                print("Yes")
            }
        } else {
            print("No")
        }
    }
    
    /**
     On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time.
     However, you can buy it then immediately sell it on the same day.
     
     Input: prices = [7,1,5,3,6,4]
     Output: 7
     Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
     Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
     Total profit is 4 + 3 = 7.
     */
    func testMaxProfit() {
        let prices : [Int] = [7,1,5,3,6,4]
        
        if prices.count <= 1 {
            print(0)
        }
        
        var maxProfit = 0
        // Start from index 1 as we will compare with i-1
        for i in 1...prices.count - 1 {
            // Check if the i more than i-1.
            // If this true that means, there's a profit
            // Otherwise, continue looping
            if prices[i] > prices[i-1] {
                maxProfit += prices[i] - prices[i-1]
            }
        }
        print(maxProfit)
    }
    
    /**
     Example 1:
     Input: nums = [1,2,3,4,5,6,7], k = 3
     Output: [5,6,7,1,2,3,4]
     Explanation:
     rotate 1 steps to the right: [7,1,2,3,4,5,6]
     rotate 2 steps to the right: [6,7,1,2,3,4,5]
     rotate 3 steps to the right: [5,6,7,1,2,3,4]
     
     Example 2:
     Input: nums = [-1,-100,3,99], k = 2
     Output: [3,99,-1,-100]
     Explanation:
     rotate 1 steps to the right: [99,-1,-100,3]
     rotate 2 steps to the right: [3,99,-1,-100]
     */
    func testRotateArray() {
        let nums = [1,2,3,4,5,6,7]
        let k = 3
        
        let times = k % nums.count
        let n = nums.count
        
        // Create an array that is being rotated
        let nums1 = Array(nums[n-times..<n])
        print(nums1)

        // Create an array that is NOT rotated
        let nums2 = Array(nums[0..<n-times])
        print(nums2)
        
        // Combine them
        print(nums1 + nums2)
    }

    /**
     Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
     Example 1:
     Input: nums = [1,2,3,1]
     Output: true
     
     Example 2:
     Input: nums = [1,2,3,4]
     Output: false
     
     Example 3:
     Input: nums = [1,1,1,3,3,4,3,2,4,2]
     Output: true
     */
    func testContainsDuplicate() {
        let nums = [1,1,1,3,3,4,3,2,4,2]
        var dict = [Int:Int]()
        nums.forEach {
            dict[$0, default: 0] += 1
        }
        
        print(dict.values.max() ?? 0 > 1)
    }
    
    /**
     Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
     You must implement a solution with a linear runtime complexity and use only constant extra space.

     Example 1:
     Input: nums = [2,2,1]
     Output: 1
     
     Example 2:
     Input: nums = [4,1,2,1,2]
     Output: 4
     
     Example 3:
     Input: nums = [1]
     Output: 1
     */
    func testSingleNumber() {
        let nums = [4,1,2,1,2]
        var dict = [Int:Int]()
        nums.forEach {
            dict[$0, default: 0] += 1
        }
        
        
        print(dict.filter {
                $0.value == dict.values.min()
              }.first?.key ?? 0)
    }
    
    /**
     Given two integer arrays nums1 and nums2, return an array of their intersection.
     Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

     Example 1:
     Input: nums1 = [1,2,2,1], nums2 = [2,2]
     Output: [2,2]
     
     Example 2:
     Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
     Output: [4,9]
     Explanation: [9,4] is also accepted.
     */
    func testIntersect() {
        let nums1 = [1,2,2,1]
        let nums2 = [2,2]
        var result = [Int]()
        var nums = nums2
        for num in nums1 {
            // Check if the second array contains the number
            if nums.contains(num) {
                // If yes, then append to the result. It means it intersect.
                result.append(num)
                
                // Then remove the number on the second array copy
                nums.remove(at: nums.firstIndex(of: num)!)
            }
        }
        
        print(result)
    }
    
    /**
     You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer.
     The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
     Increment the large integer by one and return the resulting array of digits.

     Example 1:
     Input: digits = [1,2,3]
     Output: [1,2,4]
     Explanation: The array represents the integer 123.
     Incrementing by one gives 123 + 1 = 124.
     Thus, the result should be [1,2,4].
     
     Example 2:
     Input: digits = [4,3,2,1]
     Output: [4,3,2,2]
     Explanation: The array represents the integer 4321.
     Incrementing by one gives 4321 + 1 = 4322.
     Thus, the result should be [4,3,2,2].
     
     Example 3:
     Input: digits = [9]
     Output: [1,0]
     Explanation: The array represents the integer 9.
     Incrementing by one gives 9 + 1 = 10.
     Thus, the result should be [1,0].
     */
    func testPlusOne() {
        let digits = [4,3,2,9]
        var result = digits
        
        for i in (0..<result.count).reversed() {
            // Add 1 if the digits is not 9 then stop the loop
            if result[i] != 9 {
                result[i] = result[i]+1
                print(result)
                break
            } else {
                // if the digits is 9 then replace the number with 0 then continue the loop
                result[i] = 0
            }
        }
        
        // In the end, check if the first digit of the resulting array is a 0.
        // If it is, that means that the number was of the form 9999...
        // In this case, insert a 1 in the start.
        if result.first == 0 {
            result.insert(1, at: 0)
        }
        print(result)
    }
    
    /**
     Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
     Note that you must do this in-place without making a copy of the array.

     Example 1:
     Input: nums = [0,1,0,3,12]
     Output: [1,3,12,0,0]
     
     Example 2:
     Input: nums = [0]
     Output: [0]
     */
    func testMoveZeroes() {
        var nums = [0,0,1]

        var writeIdx = 0
        // Move non-zero items
        for num in nums where num != 0 {
            nums[writeIdx] = num
            writeIdx += 1
        }
        // Fill the remaining with zero
        for i in writeIdx..<nums.count {
            nums[i] = 0
        }
        
        print(nums)
    }
    
    /**
     Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
     You can return the answer in any order.

     Example 1:

     Input: nums = [2,7,11,15], target = 9
     Output: [0,1]
     Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
     */
    func testTwoSum_proper() {
        let nums: [Int] = [3,2,4]
        let target: Int = 6
        
        var dict = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if let index = dict[target-num] { // If Index is not nil
                if i != index {
                    print([index, i])
                    break
                }
            }
            dict[num] = i
        }
        print([0])
    }
    
    // Reverse a string
    func testReverseString() {
        // Cheating can use
        // s.reverse()
        
        var s = ["h","e","l","l","o"] // --> ["o","l","l","e","h"]
        
        // Reverse the Character with swapping the array value
        // Swap only until half of the array as the middle value will not be swap
        for i in 0..<s.count/2 {
            let temp = s[i]
            s[i] = s[s.count-i-1]
            s[s.count-i-1] = temp
        }
        
        print(s)
    }
    
    
    // Given a signed 32-bit integer x, return x with its digits reversed.
    // If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
    
    // Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
    func testReverseInt_WithString() {
        let x = 123 // --> Output 321
        
        // Convert it first to string so we can loop through it
        // if the integer is negative then get the absolute value of it
        var y = Array(String(abs(x)))
        
        // loop until half of the array
        for i in 0..<y.count/2 {
            let temp = y[i]
            y[i] = y[y.count-1-i]
            y[y.count-1-i] = temp
        }
        
        // Convert back array to Int
        var s = ""
        for c in y {
            s.append(c)
        }
        
        // If x is negative then make it negative
        let reversedInt = Int(s) ?? 0
        if reversedInt > Int32.max {
            print(0)
            return
        }
        print(reversedInt)
    }
    
    // Given a signed 32-bit integer x, return x with its digits reversed.
    // If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
    
    // Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
    func testReverseInt_WithMath() {
        let x = 123 // --> Output 321
        // let x = 1534236469 // --> Output 0 as it is more than Max Int 32
        
        // Ignore the negative number
        var y = abs(x)
        var reverse = 0
        while y > 0 {
            // Get the last digits of number
            let lastDigits = y % 10
            
            // Remove the last digits from number
            y /= 10
            
            // Append the last digits to number
            reverse = (reverse * 10) + lastDigits
            
            // If the reverse is more than Int32 Max then return 0
            if reverse > Int32.max {
                reverse = 0
                break
            }
        }
        
        // If x is negative then make it negative
        print(x < 0 ? -reverse : reverse)
    }
    
    // Given a string s, find the first non-repeating character in it and return its index.
    // If it does not exist, return -1.
    // Input: s = "loveleetcode"
    // Output: 2
    func testFirstUniqChar() {
        let s = "loveleetcode"
        
        // Put the characters to a dictionary
        var dict = [Character:Int]()
        s.forEach {
            dict[$0, default: 0] += 1
        }
        
        print(dict)
        
        // Loop through the string again (in correct order)
        for (i, c) in s.enumerated() {
            // Check the character that is in the dictionary
            if let count = dict[c], count == 1 {
                // If the character exist then print the index
                print(i)
                return
            }
        }
        
        // If the character doens't exist then print -1
        print(-1)
    }
    
    // Given two strings s and t, return true if t is an anagram of s, and false otherwise.
    
    // An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
    // typically using all the original letters exactly once.
    func testIsAnagram() {
        let s = "anagram"
        let t = "nagaram"
        
        // Cheating :P
        // print(s.sorted() == t.sorted())
        
        // Check if the string length is the same
        if s.count != t.count {
            print(false)
        }
        
        // Put every strings on the dictionary
        
        var dictS = [Character:Int]()
        s.forEach {
            dictS[$0, default: 0] += 1
        }
        
        var dictT = [Character:Int]()
        t.forEach {
            dictT[$0, default: 0] += 1
        }
        
        print(dictS == dictT)
    }
    
    func testIsPalindrome() {
        let s = "A man, a plan, a canal: Panama"
        
        // Set to lower case
        let filter = CharacterSet.lowercaseLetters
        
        // Remove all non letter characters
        let filteredLetter = String(s.lowercased().unicodeScalars.filter {filter.contains($0)})
        print(filteredLetter)
        
        
    }
    
    // Rotate an image 90 degrees
    func testRotate() {
        var matrix = [[1,2,3],[4,5,6],[7,8,9]]
        // Output: [[7,4,1],[8,5,2],[9,6,3]]
        
        // Swap horizontal first
        for i in 0..<matrix.count/2 {
            let temp = matrix[i]
            matrix[i] = matrix[matrix.count - i - 1]
            matrix[matrix.count - i - 1] = temp
        }
        
        // --> Output is [[7,8,9],[4,5,6],[1,2,3]]
        
        // Swap diagonal
        for i in 0..<matrix.count {
            for j in i..<matrix[i].count  {
                // Swap the matrix
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
                print("i:\(i) | j:\(j) --> \(matrix)")
            }
        }
        
        // --> Output is [[7,4,1],[8,5,2],[9,6,3]]
        
        print(matrix)
    }
    
    func testTwoSum_DoubleLoop() {
        let nums: [Int] = [2, 7, 11, 15]
        let target = 9
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                if nums[i] + nums[j] == target {
                    print(i, j)
                    break
                }
            }
        }
    }
    
    func testTwoSum_WithSet() {
        let nums: [Int] = [2, 7, 11, 15]
        let target = 18
        
        var set = Set<Int>()
        for num in nums {
            let sum = target - num
            if set.contains(num) {
                print("Found")
                break
            }
            set.insert(sum)
        }
        
        print("Not found")
    }
    
    /**
     Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

     Each row must contain the digits 1-9 without repetition.
     Each column must contain the digits 1-9 without repetition.
     Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
     Note:

     A Sudoku board (partially filled) could be valid but is not necessarily solvable.
     Only the filled cells need to be validated according to the mentioned rules.
     */
    func testIsValidSudoku() {
        let board = [["5","3","5",".","7",".",".",".","."]
                     ,["6",".",".","1","9","5",".",".","."]
                     ,[".","9","8",".",".",".",".","6","."]
                     ,["8",".",".",".","6",".",".",".","3"]
                     ,["4",".",".","8",".","3",".",".","1"]
                     ,["7",".",".",".","2",".",".",".","6"]
                     ,[".","6",".",".",".",".","2","8","."]
                     ,[".",".",".","4","1","9",".",".","5"]
                     ,[".",".",".",".","8",".",".","7","9"]]
        
        
        // Solutions: Use String in HashSet
        var set = Set<String>()
        
        outerLoop: for i in 0..<9 {
            for j in 0..<9 {
                let val = board[i][j]
                if val != "." {
                    // String will always be defined with something like "4 in row 2" or "4 in column 2"
                    // which is unique for every iteration
                    if !set.insert("\(val) in row \(i)").inserted || // This is to record the row
                       !set.insert("\(val) in column \(j)").inserted || // This is to record the column
                       !set.insert("\(val) in box \(i/3) of \(j/3)").inserted // This is for checking which box th val is
                    {
                        print("NO")
                        break outerLoop
                    }
                }
            }
        }
    }
    
    func testRemoveDuplicatesWithInOutArray() {
        var array : [Int] = [1,1,2]
        var dict : [Int : Int] = [:]
        
        array.forEach {
            dict[$0, default: 0] += 1
        }
        
        array = Array(dict.keys.sorted())
        print(array)
        print(array.count)
    }
    
    func testMinimizingString() {
        var array = Array("baacba")
        for i in 0..<array.count {
            // Find c
            if array[i] == "c" {
                // find b
                for j in i..<array.count {
                    if array[j] == "b" {
                        // swap c with b
                        array[j] = "c"
                        array[i] = "b"
                        break
                    }
                }
            }
            
            // find b
            if array[i] == "b" {
                for j in i..<array.count {
                    if array[j] == "a" {
                        // swap a with b
                        array[j] = "b"
                        array[i] = "a"
                        break
                    }
                }
            }
        }
        
        let newString = array.map {"\($0)"}.reduce("") { $0 + $1 }
        print(newString)
    }
    
    /**
     Given a list of phone numbers, determine if it is consistent in the sense that no number in the list is the prefix of another number in the list.

     Example

     For numbers = ["911", "9876543", "9112345"], the output should be
     solution(numbers) = false.
     In this case, it isn't possible to call the third person in a list, because the system would direct your call to the first number as soon as you dialed the first three digits of third phone number. So this list is not consistent.
     */
    
    func testHashPrefix() {
        let numbers: [String] = ["911", "9876543", "9112345"]
        for i in 0..<numbers.count {
            
        }
    }
    
    /**
     A streaming algorithm, also called an online algorithm, is one in which the input dataStream arrives one piece at a time. We are going to emulate a streaming algorithm, and calculate the median of all the numbers that have been seen so far.

     The dataStream is an array of integers, ordered by the arrival time of each piece. The output will be an array of integers, output, such that output[i] is the median of the entries up to and including dataStream[i]. When finding the median of an even number of integers, choose the smaller of the two "middle" values.

     Example

     For dataStream = [1, 2, 3], the output should be
     solution(dataStream) = [1, 1, 2].

     When we have only seen [1], the median is 1.
     When we have seen [1, 2] then the median can be either 1 or 2 (or any number in between). Our rule to break ties is to pick the smallest number, in this case 1.
     When we have seen [1, 2, 3], the median is 2.
     For dataStream = [6, 2, 10, 49, 193, 1], the output should be
     solution(dataStream) = [6, 2, 6, 6, 10, 6].

     When we have only seen [6], the median is 6.
     When we have seen [6, 2] then the lowest median is 2.
     When we have seen [6, 2, 10], the median is 6.
     When we have seen [6, 2, 10, 49], the lowest median is 6.
     When we have seen [6, 2, 10, 49, 193], the median is 10.
     When we have seen [6, 2, 10, 49, 193, 1], the lowest median is 6.
     */
    
    
    /**
     "dd/MM/yy"              // 29/10/20
     "y, M d"                // 2020, 10 29
     "YY, MMM d"             // 20, Oct 29
     "YY, MMM d, hh:mm"      // 20, Oct 29, 02:18
     "YY, MMM d, HH:mm:ss"   // 20, Oct 29, 14:18:31
     */
    func testStreaming() {
        let dataStream: [Int] = []
    }

    /**
     Given a rectangular matrix of English lowercase letters board and a string word, your task is to find the number of occurrences of word in the rows(→), columns(↓) and diagonals(↘) of board.

     Example

     For

     board = [['s', 'o', 's', 'o'],
              ['s', 'o', 'o', 's'],
              ['s', 's', 's', 's']]
     and word = "sos", the output should be solution(board, word) = 3.

     There are 2 occurrences of word starting from board[0][0](going → and ↘), and one starting from board[0][2](going ↓).

     No other occurrences of word were counted, so the answer is 3.

     For

     board = [['a', 'a'],
              ['a', 'a']]
     and word = "aa", the output should be
     solution(board, word) = 5.

     There are 2 horizontal, 2, vertical, and 1 diagonal occurrence of word, for a total of 5.
     */
    func testMatric() {
        let board: [[Character]]
        let word: String
    }
    
    /**
     A regular game of tic-tac-toe is played on a 3-by-3 grid. The ACME board company is putting out a generalized version of tic-tac-toe that is played on an n-by-n board.

     In this variant, players take turns placing an X or an O on the board, and the game ends when one of the players wins or there are no spaces left to play. A player wins if they place a move that satisfies one of the following three conditions:

     They complete a row of n of their symbols;
     They complete a column of n of their symbols;
     They complete a diagonal of n of their symbols. There are only two diagonals on the board that are large enough to win.
     You have been asked by ACME to write a function that checks the results of the board. The board is represented by a n-by-n matrix of characters. The cell in row i and column j is represented by board[i][j], and can take the values "X" (if the X player has played there), "O" (if the O player has played there), or "." (if the cell is currently empty).

     Write a function solution(board) that takes a n-by-n matrix of strings, and returns the string representing the result of the board. The possible return values are:

     "X WIN": The X markers satisfy one of the win conditions.
     "O WIN": The O markers satisfy one of the win conditions.
     "ONGOING": Neither player has won yet, and there are still empty spaces on the board.
     "TIE": The game is over, and neither player has won.
     It's guaranteed that there is at most one winner.
     
     Example
     For board = ["XO", "X."], the output should be
     solution(board) = "X WIN".

     X    O
     X
     For board = ["XOX", "OXO", ".X."], the output should be
     solution(board) = "ONGOING".

     X    O    X
     O    X    O
     X
     Even though an "X" win is inevitable in this game, there is no current winner, and the game is still ongoing.
     */
    func testTicTacToe() {
        let board: [String]
    }

    
    func testDateFromString() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let dateFormatOne = "dd MM YYYY, HH:mm:ss"
        let dateFormatTwo = "EEEE d/MMMM/yyyy"
        let dateFormatThree = "MM(EE).dd(MMM).yyyy"
        
        let dateString = "Tue, 25 February 2010 12:53:58 +0000"
        let dateString2 = "12 Dec 2018 22:15:10"
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        if let date = formatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM"
            let nameOfTheMonth = dateFormatter.string(from: date)
            print(nameOfTheMonth)
            print(Calendar.current.component(.day, from: date))
            print(Calendar.current.component(.year, from: date))
            print(Calendar.current.component(.month, from: date))
            
            dateFormatter.dateFormat = "EEEE"
            let nameOfDay = dateFormatter.string(from: date)
            print(nameOfDay)
            
            print(date)
        } else {
            print("Could not convert date")
        }
    }
}

extension DateFormatter {
    func dateFromMultipleFormats(fromString dateString: String) -> Date? {
        var formats: [String] = [
            "d MMM yyyy HH:mm:ssZ",
            "EEEE d/MMMM/yyyy",
            "MM(EE).dd(MMM).yyyy"
            ]
        for format in formats {
            self.dateFormat = format
            if let date = self.date(from: dateString) {
                    return date
                }
            }
            return nil
        }
}


extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.dateFromMultipleFormats(fromString: self)
    }
}

extension Date {
    var day: Int? {
        return Calendar.current.component(.day, from: self)
    }

    var nameOfDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let nameOfDay = dateFormatter.string(from: self)
        return nameOfDay
    }

    var month: Int? {
        return Calendar.current.component(.month, from: self)
    }

    var nameOfTheMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let nameOfTheMonth = dateFormatter.string(from: self)
        return nameOfTheMonth
    }

    var year: Int? {
        return Calendar.current.component(.year, from: self)
    }

    static func numberOfDaysBetween(_ date: Date, and date2: Date) -> Int? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date, to: date2)
        return components.day
    }
}
