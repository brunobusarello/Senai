package com.psii.app_prod_ped.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psii.app_prod_ped.model.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Long> {

}
