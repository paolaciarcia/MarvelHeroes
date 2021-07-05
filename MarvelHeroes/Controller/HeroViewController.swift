//
//  HeroViewController.swift
//  MarvelHeroes
//
//  Created by Erick Borges on 02/07/21.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    //MARK: - Properties
    var hero: Hero?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = hero?.name
        getWebView()
    }
    
    //MARK: - Methods
    func getWebView() {
        if let hero = hero?.urls.first?.url {
            let url = URL(string: hero)
            let request = URLRequest(url: url!)
            webView.allowsBackForwardNavigationGestures = true
            webView.allowsLinkPreview = true
            webView.navigationDelegate = self
            webView.uiDelegate = self
            webView.load(request)
        }
    }
}

//MARK: - WKNavigationDelegate, WKUIDelegate

extension HeroViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
