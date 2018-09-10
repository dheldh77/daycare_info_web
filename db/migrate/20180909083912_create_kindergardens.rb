class CreateKindergardens < ActiveRecord::Migration[5.0]
  def change
    create_table :kindergardens do |t|
      t.string :sidoname
      t.string :sigunguname
      t.string :stcode
      t.string :crname
      t.string :crtypename
      t.string :crstatusname
      t.string :zipcode
      t.string :craddr
      t.string :crtelno
      t.string :crfaxno
      t.string :crhome
      t.integer :nrtrroomcnt
      t.integer :nrtrroomsize
      t.integer :plgrdco
      t.integer :chcrtescnt
      t.integer :crcapat
      t.integer :crchcnt
      t.string :la
      t.string :lo
      t.string :crcargbname
      t.string :crcnfmdt
      t.string :crpausebegindt
      t.string :crpauseenddt
      t.string :crabldt
      t.string :crspec

      t.timestamps
    end
  end
end
