//
//  ViewController.swift
//  Swift3_SendData
//

import UIKit

class ViewController: UIViewController {

    @IBAction func enviar(_ sender: Any) {
        
        print("Haciendo peticion...")
        
        data_request("http://34.208.142.178:9090/user/register")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //34.208.142.178:9090/user/register    www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php
        
        
        // 34.208.142.178:9090/user/register
        
           
       
      
        
    }

    

    
    //2
    func data_request(_ url:String)
    {
        let url:NSURL = NSURL(string: url)!
        let session = URLSession.shared
        
        //ad luego
        let boundary = "Boundary-\(UUID().uuidString)"
        
        
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        //  ; boundary=\(boundary)
        request.addValue("application/multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        //
        
        
        /*##############################################################################*/
        
        
        let body = NSMutableData()
        
        
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        //body.append("Content-Disposition:form-data; name=\"test\"\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append("hi\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        
       // body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
       // body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
       // body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
       // body.append(image_data!)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        request.httpBody = body as Data

        /*##############################################################################*/
        let paramString = "deviceID=Wecsd34redfrert"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest) {
            (
            data, response, error) in
            
            guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            
            if let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            {
                print(dataString)
            }
        }
        
        task.resume()
        
    }
    
    
}

