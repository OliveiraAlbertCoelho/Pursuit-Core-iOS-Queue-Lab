import Foundation

//1. Find the smallest element in a queue

func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    var myQ = q
    if myQ.isEmpty{
      return nil
    }
    var small = myQ.dequeue()!
    while !myQ.isEmpty{
    let secondSmall = myQ.dequeue()!
        if small > secondSmall{
            small = secondSmall
        }
    }
    return small
    
    
}

//2. Find the sum of a queue of Ints

func sum(of q: Queue<Int>) -> Int {
    var myQ = q
    if q.isEmpty{
        return 0
    }
    var sum = 0
    while !myQ.isEmpty{
   sum += myQ.dequeue()!
    }
    
    return sum
}

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    var myQ = q
    if myQ.isEmpty{
        return false
    }
    var small = myQ.dequeue()!
    while !myQ.isEmpty{
        let secondSmall = myQ.dequeue()!
        if small < secondSmall{
            small = secondSmall
        }else {
            return false
        }
    }
    return true
}

//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)

/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
    var myQ = q
    var array = [T]()
    if myQ.isEmpty{
        return q
    }
    while !myQ.isEmpty {
        var num = myQ.dequeue()!
        array.append(num)
    }
    while !array.isEmpty {
        myQ.enqueue(array.popLast()!) 
    }
    return myQ
}

//5 Determine if two Queues are equal

func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var q1 = qOne
    var q2 = qTwo
    
    while !q1.isEmpty && !q2.isEmpty{
        guard let q1Val = q1.dequeue(), let q2Val = q2.dequeue() else{ return false}
        if q1Val != q2Val{
            return false
        }
    }

    return  q1.isEmpty && q2.isEmpty
}

