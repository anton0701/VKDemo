//
//  UIImageView+Loading.swift
//  Vanilla
//
//  Created by Anton Krylov on 28.06.17.
//  Copyright © 2017 BrightBox. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        self.imageFromUrl(urlString: urlString, heightCConstraint: nil)
    }

    public func imageFromUrl(urlString: String, heightCConstraint: NSLayoutConstraint?) {
        if let data = ImageLoadingCache.sharedCache.object(forKey: urlString as AnyObject) as? Data {
            self.image = UIImage(data: data)

        } else {
            let sessionConfig = URLSessionConfiguration.default
            let url = URL(string: urlString)
            let session = URLSession(configuration: sessionConfig)
            let request = URLRequest(url: url!)
            updateHeightConstreint(heightCConstraint: heightCConstraint)
            let dataTask = session.dataTask(with: request) { responseData, _, error in
                if let error = error {
                    print(error)
                } else {
                    if let data = responseData {
                        ImageLoadingCache.sharedCache.setObject(data as AnyObject, forKey: urlString as AnyObject)
                        DispatchQueue.main.async {
                            self.image = UIImage(data: data)
                            self.updateHeightConstreint(heightCConstraint: heightCConstraint)
                        }
                    } else {
                        print("no data")
                    }
                }
            }

            dataTask.resume()
        }
    }

    private func updateHeightConstreint(heightCConstraint: NSLayoutConstraint?) {
        guard let heightCConstraint = heightCConstraint, let image = self.image else {
            return
        }
        let width = image.size.width
        let height = image.size.height
        heightCConstraint.constant = height*self.frame.size.width/width

    }
}

extension String {

    public func imageFromUrlAsync(_ completion: ((UIImage?) -> Void)?) {
        guard let url = URL(string: self) else {
            return
        }
        if let data = ImageLoadingCache.sharedCache.object(forKey: self as AnyObject) as? Data {
            async_main {
                completion?(UIImage(data: data))
            }
            return
        }
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: url)

        let dataTask = session.dataTask(with: request) { responseData, _, error in
            if let error = error {
                print(error)
            } else {
                async_main {
                    if let data = responseData {
                        ImageLoadingCache.sharedCache.setObject(data as AnyObject, forKey: self as AnyObject)
                        completion?(UIImage(data: data))
                    } else {
                        completion?(nil)
                        print("no data")
                    }
                }
            }
        }
        dataTask.resume()
    }

    public func getImageFromCache() -> UIImage? {
        if let data = ImageLoadingCache.sharedCache.object(forKey: self as AnyObject) as? Data {
            return UIImage(data: data)
        } else {
            return nil
        }
    }

    public func getAsyncImageFromUrl(completion: @escaping (UIImage?, String) -> Void) {//
        async {
            if let data = ImageLoadingCache.sharedCache.object(forKey: self as AnyObject) as? Data {
                async_main {
                    completion(UIImage(data: data), self)
                }
                return
            }
            self.forceLoadImageFromUrl(completion: completion)
        }
    }
    
    func forceLoadImageFromUrl(completion: @escaping (UIImage?, String) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let url = URL(string: self)
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: url!)
        
        let dataTask = session.dataTask(with: request) { responseData, _, error in
            if let error = error {
                print(error)
            } else {
                async_main {
                    if let data = responseData {
                        ImageLoadingCache.sharedCache.setObject(data as AnyObject, forKey: self as AnyObject)
                        completion(UIImage(data: data), self)
                    } else {
                        completion(nil, self)
                        print("no data")
                    }
                }
            }
        }
        dataTask.resume()
    }

    public func dataFromUrlSync(timeout: Int = 10) -> Data! {

        let sessionConfig = URLSessionConfiguration.default
        let url = URL(string: self)
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: url!)

        var asyncData: Data!

        let sema = DispatchSemaphore(value: 0)
        let dataTask = session.dataTask(with: request) { responseData, _, error in
            if let error = error {
                print(error)
            } else {
                if let data = responseData {
                    asyncData = data
                } else {
                    print("no data")
                }
            }
            sema.signal()
        }
        dataTask.resume()

        _ = sema.wait(timeout: .now() + Double(timeout))
        return asyncData
    }

    public func imageFromUrlSync(timeout: Int = 20) -> UIImage! {
        if let data = ImageLoadingCache.sharedCache.object(forKey: self as AnyObject) as? Data {
            return UIImage(data: data)
        }
        let sessionConfig = URLSessionConfiguration.default
        let url = URL(string: self)
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: url!)

        var syncImage: UIImage!

        let sema = DispatchSemaphore(value: 0)
        let dataTask = session.dataTask(with: request) { responseData, response, error in
            if let error = error {
                if let response = response as? HTTPURLResponse {
                    print(response.description)
                    print(response.allHeaderFields)
                    print(response.statusCode)
                }
                print(error)
            } else {
                if let data = responseData {
                    ImageLoadingCache.sharedCache.setObject(data as AnyObject, forKey: self as AnyObject)
                    syncImage = UIImage(data: data)
                } else {
                    print("no data")
                }
            }
        }
        dataTask.resume()

        _ = sema.wait(timeout: .now() + .seconds(timeout))
        return syncImage
    }
}
