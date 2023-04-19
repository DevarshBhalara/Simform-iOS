//
//  WKWebViewViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/04/23.
//

import UIKit
import WebKit

class WKWebViewViewController: UIViewController {
    
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textFieldURL: UITextField!
    
    @IBOutlet weak var progressBarLoading: UIProgressView!
    //MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBarLoading.isHidden = true
        webView.navigationDelegate = self

        /** Load URL  */
//        guard let url = URL(string: "https://www.google.com/") else {
//            return
//        }
//
//        let urlRequest = URLRequest(url: url)
//        webView.load(urlRequest)
        
        
        /** Load file */
        guard let pdfURL = Bundle.main.url(forResource: "First", withExtension: "pdf") else {
            return
        }
        webView.loadFileURL(pdfURL, allowingReadAccessTo: pdfURL.deletingLastPathComponent())
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.webView.reload()
        }

        _ = Timer.scheduledTimer(withTimeInterval: TimeInterval(0.2), repeats: true) {
            (timer) in
            print(self.webView.estimatedProgress)
        }
    }
    
    
    @IBAction func loadURLButtonClick(_ sender: UIButton) {
        progressBarLoading.isHidden = false
       guard let url = URL(string: textFieldURL.text ?? "https://www.google.com/") else {
            return
        }
        
        

        let urlRequest = URLRequest(url: url)
        progressBarLoading.setProgress(Float(webView.estimatedProgress), animated: true)
        webView.load(urlRequest)
    }
}


extension WKWebViewViewController: WKNavigationDelegate {
    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//
//        if let host = navigationAction.request.url?.host {
//            print(host)
//            if host == "www.google.com" {
//                decisionHandler(.allow)
//                return
//            } else if host.contains("facebook.com") {
//                print("inside")
//                decisionHandler(.allow)
//                return
//            }
//        }
//
//        decisionHandler(.cancel)
//    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("start provisional")
        self.loadingIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("did finish")
        self.loadingIndicator.stopAnimating()
        progressBarLoading.setProgress(0.0, animated: false)
        progressBarLoading.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("did commit")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("fail")
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("nav fail")
    }
}
