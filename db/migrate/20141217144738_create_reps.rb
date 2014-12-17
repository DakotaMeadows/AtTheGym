class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.references :workout
      t.references :exercise

      t.timestamps
    end
  end
end
