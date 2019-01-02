//
//  ViewController.swift
//  InternetApp
//
//  Created by Hillstead, Matthew on 12/12/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit
import WebKit

public class internetDetailViewController: UIViewController
{
    @IBOutlet weak var webViewerWKWebView!
    @IBOutlet weak var screenTitle: UILabel!
    
    var detailTitle : String?
    {
        didSet
        {
            updateView()
        }
    }
    
    var detailAddress : String?
    {
        if (detailTitle != nil && screenTitle != nil && webViewer != nil)
        {
            if (detail?.range(of: "Definitions", options: .caseInsensitive) != nil)
            {
                loadPDF()
            }
            else
            {
                if (detailAddress != nil)
                {
                    loadURL(webAddress: detailAddress!)
                }
            }
            screenTitle?.text = detailTitle
        }
    }
    
    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        
        updateView()
    }

    private func LoadIRL(webAddress: String) -> Void
    {
        let currentURL = URL(string: webAddress)
        let currentWebRequest = URLRequest(url: currentURL!)
        webViewer.load(currentWebRequest)
    }
    
    private func loadPDF() -> Void
    {
        if let contentPDF = Bundle.main.url(forResource: "Your PDF Name HERE", withExtension: "pdf", subdirectory: nil, localization: nil)
        {
            let requestPDF = NSURLRequest(url: contentPDF)
            webViewer.load(requestPDF as URLRequest)
        }
    }
  

}

