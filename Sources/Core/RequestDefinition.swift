/*

 MIT License

 Copyright (c) 2016 Maxim Khatskevich (maxim@khatskevi.ch)

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

 */

public
protocol RequestDefinition
{
    static
    var relativePath: String { get }
    
    static
    var method: HTTPMethod? { get }
}

public
extension RequestDefinition {
    
    /// Parameters for the corresponding URL request.
    var parameters: Parameters {
        
        Mirror
            .init(reflecting: self)
            .children
            .compactMap{
                
                (child: (label: String?, value: Any)) -> (key: String, value: Any)? in
                
                //---
                
                if
                    let key = child.label
                {
                    return (key, child.value)
                }
                else
                {
                    return nil
                }
            }
            .reduce(into: [:]) {
                
                result, nextItem in
                
                //---
                
                result[nextItem.key] = nextItem.value
            }
    }
}
