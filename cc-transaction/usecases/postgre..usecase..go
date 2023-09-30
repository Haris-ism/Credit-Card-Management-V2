package usecase

import "cc-transaction/models"

func (uc *usecase) InsertDB(req models.ItemList) error {
	err := uc.postgre.Insert(req)
	if err != nil {
		return err
	}

	return nil
}
func (uc *usecase) QueryDB(req []models.ItemList) error {
	err := uc.postgre.Query(req)
	if err != nil {
		return err
	}

	return nil
}
