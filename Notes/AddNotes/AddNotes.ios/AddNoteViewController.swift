//
//  AddNoteViewController.swift
//  Remember
//
//  Created by CPU12071 on 8/27/18.
//  Copyright © 2018 Le Duy Bach. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController,
    AddNoteView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var presenter: ViewToPresenterProtocol?
    private var idToUse: Double = -1
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantButton: UIButton!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    func setAddNotePresenter(presenter: ViewToPresenterProtocol) {
        self.presenter = presenter
    }
    
    func displayNote(data: Note?) {
        titleTextField.text = data?.title ?? ""
        bodyTextView.text = data?.body ?? ""
        importantButton.isSelected = data?.isImportant ?? false
        
        let imgPath = data?.imagePath
        if imgPath != nil {
            loadImageIntoImageView(path: imgPath!)
        }
    }
    
    private func loadImageIntoImageView(path: String) {
        
    }
    
    private func generateImagePath() -> String? {
        if (photoImageView.image != nil) {
            idToUse = Util.getTimeStamp()
            return "\(idToUse).png"
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewReady()
        importantButton.setImage(#imageLiteral(resourceName: "highlightedStar"), for: .selected)
        titleTextField.becomeFirstResponder()
        navigationItem.title = "Add note"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(handleAdd))
    }
    
    @IBAction func importantButtonSelected(_ sender: Any) {
        importantButton.isSelected = !importantButton.isSelected
    }
    
    @IBAction func photoImageViewTap(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Image corrupted")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    @objc func handleAdd() {
        let note = constructNoteToAdd()
        let addRequest = NoteRequest(type: .add, itemId: nil, item: note)
        presenter?.handleRequest(request: addRequest)
    }
    
    private func constructNoteToAdd() -> Note {
        let title = titleTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let body = bodyTextView.text?.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        let important = importantButton.isSelected
        
        // TODO: Save selected image to a custom path and load pass it here
        let path = generateImagePath()
        saveImageToPath(path: path!)
        if idToUse == -1.0 {
            idToUse = Util.getTimeStamp()
        }
        
        return Note(id: 12, isImportant: important, title: title, body: body, imagePath: path)
    }
    
    private func saveImageToPath(path: String?) {
        if (path == nil) {
            return
        }
        
        if let data = UIImagePNGRepresentation(photoImageView.image!) {
            let filename = getDocumentsDirectory().appendingPathComponent(path!)
            try? data.write(to: filename)
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
