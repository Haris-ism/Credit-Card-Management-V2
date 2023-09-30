package postgre

import (
	"cc-transaction/models"
	"fmt"

	"github.com/sirupsen/logrus"
)

func (db *postgreDB) Insert(req models.ItemList) error {
	if err := db.postgre.Create(&req).Error; err != nil {
		logrus.Errorf("Failed to Insert Postgre, Err:", err)
		return err
	}
	return nil
}

func (db *postgreDB) Query(req []models.ItemList) error {
	if err := db.postgre.Where("price > ?", 1).Find(&req).Error; err != nil {
		logrus.Errorf("Failed to Insert Postgre, Err:", err)
		return err
	}
	fmt.Println("ieu res:", &req)
	return nil
}
