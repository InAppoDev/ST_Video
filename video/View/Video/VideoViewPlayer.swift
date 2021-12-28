//
//  VideoViewPlayer.swift
//  swim-training
//
//  Created by Alexandr on 09.12.2021.
//

import UIKit
import WebKit

class VideoViewPlayer: ViewFromXib {

	var webView = WKWebView()
	let label = UILabel()
	
	override func layoutSubviews() {
		configureWKWeb()
		addLabel()
	}
	
	private func configureWKWeb() {
		let configuration = WKWebViewConfiguration()
		configuration.mediaTypesRequiringUserActionForPlayback = []
		configuration.allowsInlineMediaPlayback = true
		
		let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
		webView = WKWebView(frame: frame, configuration: configuration)
		self.addSubview(webView)
	}

	func load(url: String) {

		let html = "<video playsinline controls autoplay width=\"100%\" src=\"\(url)\"> </video>"
		self.webView.loadHTMLString(html, baseURL: nil)
		
	}
	
	func addLabel() {
			label.text = "VideoNull".localizeString
			label.font = UIFont(name: "Geometria", size: 20)
			label.textAlignment = .center
			label.textColor = .white
			webView.addSubview(label)
			label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
			label.center = webView.center
	}
}

