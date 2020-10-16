class ChangeGraduationYearToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column(:athletes, :graduation_year, 'integer USING CAST("graduation_year" AS integer)')
  end
end
