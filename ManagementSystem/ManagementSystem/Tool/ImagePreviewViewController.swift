//
//  ImagePreviewViewController.swift
//  ManagementSystem
//
//  Created by 余润杰 on 2021/4/3.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    var images: [String]
    var index: Int
    var collectionView: UICollectionView!
    var collectionViewLayout: UICollectionViewFlowLayout!
    var pageControl: UIPageControl!
    
    init(images: [String], index: Int = 0) {
        self.images = images
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 0
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.black
//        collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        // 不自动调整内边距，确保全屏
        collectionView.contentInsetAdjustmentBehavior = .never
        self.view.addSubview(collectionView)
        
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        
        pageControl = UIPageControl()
        pageControl.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 20)
        pageControl.numberOfPages = images.count
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPage = index
        view.addSubview(self.pageControl)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 隐藏导航栏
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 显示导航栏
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // 隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // 将要对子视图布局时调用（横竖屏切换时）
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // 重新设置collectionview的尺寸
        collectionView.frame.size = self.view.bounds.size
        collectionView.collectionViewLayout.invalidateLayout()
        
        // 将视图滚动到当前图片上
        let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        
        // 重新设置页控制器的位置
        pageControl.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 20)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//extension ImagePreviewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//}


class ImagePreviewCell: UICollectionViewCell {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView = UIScrollView(frame: self.contentView.bounds)
        self.contentView.addSubview(scrollView)
        scrollView.delegate = self
        // scrollview缩放范围
        scrollView.maximumZoomScale = 3.0
        scrollView.minimumZoomScale = 1.0
        
        imageView = UIImageView()
        imageView.frame = scrollView.bounds
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
        
        let tapSingle = UITapGestureRecognizer(target: self, action: #selector(tapSingleDid(_:)))
        tapSingle.numberOfTapsRequired = 1
        tapSingle.numberOfTouchesRequired = 1
        
        let tapDouble = UITapGestureRecognizer(target: self, action: #selector(tapDoubleDid(_:)))
        tapDouble.numberOfTapsRequired = 2
        tapDouble.numberOfTouchesRequired = 1
        tapSingle.require(toFail: tapDouble)
        
        self.imageView.addGestureRecognizer(tapSingle)
        self.imageView.addGestureRecognizer(tapDouble)
    }
    
    // 重置单元格内元素尺寸
    func resetSize() {
        scrollView.frame = self.contentView.bounds
        scrollView.zoomScale = 1.0
        if let image = self.imageView.image {
            imageView.frame.size = scaleSize(size: image.size)
            imageView.center = scrollView.center
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 重置单元格内元素尺寸
        resetSize()
    }
    
    // 获取imageview的缩放尺寸，确保首次显示是可以完整显示整张图片
    func scaleSize(size: CGSize) -> CGSize {
        let width = size.width
        let height = size.height
        let widthRatio = width / UIScreen.main.bounds.width
        let heightRatio = height / UIScreen.main.bounds.height
        let ratio = max(heightRatio, widthRatio)
        return CGSize(width: width / ratio, height: height / ratio)
    }
    
    @objc func tapSingleDid(_ ges: UITapGestureRecognizer) {
        // 显示或隐藏导航栏
        if let nav = self.responderViewController()?.navigationController {
            nav.setNavigationBarHidden(!nav.isNavigationBarHidden, animated: true)
        }
    }
    
    @objc func tapDoubleDid(_ ges: UITapGestureRecognizer) {
        // 隐藏导航栏
        if let nav = self.responderViewController()?.navigationController {
            nav.setNavigationBarHidden(true, animated: true)
        }
        // 缩放视图
        UIView.animate(withDuration: 0.5, animations: {
            if self.scrollView.zoomScale == 1.0 {
                // 以点击的位置为中心，放大3倍
                let pointInView = ges.location(in: self.imageView)
                let newZoomScale: CGFloat = 3
                let scrollViewSize = self.scrollView.bounds.size
                let w = scrollViewSize.width / newZoomScale
                let h = scrollViewSize.height / newZoomScale
                let x = pointInView.x - w / 2.0
                let y = pointInView.y - h / 2.0
                let rectToZoomTo = CGRect(x: x, y: y, width: w, height: h)
                self.scrollView.zoom(to: rectToZoomTo, animated: true)
            } else {
                self.scrollView.zoomScale = 1.0
            }
        })
        
    }
    
    func responderViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImagePreviewCell: UIScrollViewDelegate {
    // 缩放视图
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    // 缩放响应，设置imageView的中心位置
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        var centerX = scrollView.center.x
        var centerY = scrollView.center.y
        centerX = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width / 2 : centerX
        centerY = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height / 2 : centerY
        NSLog("imageview center \(centerX) \(centerY)")
        imageView.center = CGPoint(x: centerX, y: centerY)
    }
}
