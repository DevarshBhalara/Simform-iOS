//
//  WKWebViewViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/04/23.
//

import UIKit
import WebKit

class WKWebViewViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var textFieldURL: UITextField!
    @IBOutlet private weak var progressBarLoading: UIProgressView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var toolBar: UIToolbar!
    
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
        

        /** Custom bar Item Demo  */
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
        let barItem = UIBarButtonItem(customView: view)
        view.backgroundColor = .black
        barItem.image = UIImage(systemName: "trash.fill")

        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
        view2.backgroundColor = .red
        let barItem2 = UIBarButtonItem(customView: view2)

        toolBar.setItems( [barItem, barItem2], animated: true)
  
        /** Setting Background to Toolbar  */
//        toolBar.setBackgroundImage(UIImage(named: "avtar"), forToolbarPosition:  .any, barMetrics: .default)
        
    }
    
    @IBAction func homeButtonClicked(_ sender: UIBarButtonItem) {
        print("Going to home page")
        loadWebPages(passedUrl: "https://www.google.com")
    }
    
    @IBAction func reloadButtonClicked(_ sender: UIBarButtonItem) {
        print("reloading web view")
        webView.reload()
    }
    
    
    @IBAction func faceBookButtonClicked(_ sender: UIBarButtonItem) {
        loadWebPages(passedUrl: "https://www.facebook.com")
    }
    
    @IBAction func loadURLButtonClick(_ sender: UIButton) {
        loadWebPages(passedUrl: textFieldURL.text ?? "")
    }
    
    func loadWebPages(passedUrl: String) {
        progressBarLoading.isHidden = false
        guard let url = URL(string: passedUrl) else {
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
