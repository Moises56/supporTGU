class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :telefono
      t.string :estado_ticket
      t.string :nombre_usuario
      t.string :email_cliente
      t.string :departamento
      t.text :asunto
      t.text :mensaje
      t.text :solucion
      t.string :pais
      t.string :ciudad
      t.string :ubicacion
      t.string :t1821

      t.timestamps
    end
  end
end
