import os

import cv2
import torch
from pandas import read_csv
from torch.utils.data import Dataset



class GalaxyDataset(Dataset):
    def __init__(
        self,
        labels: str,
        img_dir,
        inds=None,
        ext=".jpg",
        transform=None,
        target_transform=None,
    ):
        """
        Ensemble de données pour les images de galaxies

        Chaque élément du dataset est un tuple avec (image, probabilités, galaxyid)

        :param labels: Fichier CSV avec les informations sur les images
        :type labels: str
        :param img_dir: Dossier avec les images
        :type img_dir: str
        :param inds: indices (galaxyid en str) à utiliser pour cet ensemble, defaults to None
        :type inds: List[str], optional
        :param ext: Extension des fichiers images dans img_dir, avec le point, defaults to ".jpg"
        :type ext: str, optional
        :param transform: Transformation PyTorch pour les images, peuvent être combinnées avec Compose au besoin, defaults to None
        :type transform: Transformation PyTorch pour les clases (probabilités), optional
        :param target_transform: Transofmation , defaults to None
        :type target_transform: utils, optional
        """

        self.img_labels = read_csv(labels, index_col=0)
        self.img_labels.index = self.img_labels.index.astype(str)
        if inds is not None:
            self.img_labels = self.img_labels.loc[inds]
        self.img_dir = img_dir
        self.ext = ext
        self.transform = transform
        self.target_transform = target_transform

    def __len__(self):
        # Donne la longueur des données
        return len(self.img_labels)

    def __getitem__(self, idx):
        # Retourne un tuple avec l'image, les probabilités et l'ID de l'image
        img_id = self.img_labels.index[idx]
        img_path = os.path.join(self.img_dir, img_id + self.ext)
        img = cv2.imread(img_path)
        label = torch.tensor(self.img_labels.iloc[idx].tolist())

        if self.transform:
            img = self.transform(img)
        if self.target_transform:
            label = self.target_transform(label)

        return img, label, img_id


CLASSES = [
    "Class1.1",
    "Class1.2",
    "Class1.3",
    "Class2.1",
    "Class2.2",
    "Class3.1",
    "Class3.2",
    "Class4.1",
    "Class4.2",
    "Class5.1",
    "Class5.2",
    "Class5.3",
    "Class5.4",
    "Class6.1",
    "Class6.2",
    "Class7.1",
    "Class7.2",
    "Class7.3",
    "Class8.1",
    "Class8.2",
    "Class8.3",
    "Class8.4",
    "Class8.5",
    "Class8.6",
    "Class8.7",
    "Class9.1",
    "Class9.2",
    "Class9.3",
    "Class10.1",
    "Class10.2",
    "Class10.3",
    "Class11.1",
    "Class11.2",
    "Class11.3",
    "Class11.4",
    "Class11.5",
    "Class11.6",
]

DESCRIPTIONS = [
    "Smooth",
    "Featured or disc",
    "Star or artifact",
    "Edge on",
    "Not edge on",
    "Bar through center",
    "No bar",
    "Spiral",
    "No Spiral",
    "No bulge",
    "Just noticeable bulge",
    "Obvious bulge",
    "Dominant bulge",
    "Odd Feature",
    "No Odd Feature",
    "Completely round",
    "In between",
    "Cigar shaped",
    "Ring",
    "Lens or arc",
    "Disturbed",
    "Irregular",
    "Other",
    "Merger",
    "Dust lane",
    "Rounded bulge",
    "Boxy bulge",
    "No bulge",
    "Tightly wound arms",
    "Medium wound arms",
    "Loose wound arms",
    "1 Spiral Arm",
    "2 Spiral Arms",
    "3 Spiral Arms",
    "4 Spiral Arms",
    "More than four Spiral Arms",
    "Can't tell how many spiral arms",
]

CDICT = dict(zip(CLASSES, DESCRIPTIONS))
