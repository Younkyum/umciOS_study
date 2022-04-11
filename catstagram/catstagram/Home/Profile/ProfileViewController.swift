//
//  ProfileViewController.swift
//  catstagram
//
//  Created by Jin younkyum on 2022/04/11.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        
    }
    // MARK: - Action
    
    
    // MARK: - Helpers
    private func setupCollectionView() {
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    }

}


extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {  fatalError("셀 타입 캐스팅 실패..") }
        return cell
    }
}


extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 159)
    }
}
