//
//  ViewController.swift
//  SuperStorage
//
//  Created by seon.yeong on 2022/07/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    let api = API()
    var name: String?
    
    init() {
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateContent()
    }
    
    func updateContent() {
        Task {
            // 동작 : 3초 뒤에 한번에 바뀜
            /*
             let name = try await api.fetchName()
             let desc = try await api.fetchDesc()
             
             vs
             
             /// async let can only be used on local declarations.
             /// 프로퍼티로 쓰는 건 불가능
             /// group several async calls and await them all together
             async let name = api.fetchName()
             async let desc = api.fetchDesc()
             */
            async let name = api.fetchName()
            async let desc = api.fetchDesc()
            label.text = try await name + desc
        }
    }
}
