<?php

namespace App\Services\Repository\Contracts;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface RepositoryServiceInterface
{
    public function create(array $data);
    public function update(array $data, $id);
    public function updateOrCreate(array $attributes, array $values = []);
    public function firstOrCreate(array $attributes, array $values = []);
    public function delete($id);
    public function deleteBy(array $criteria);
    public function __call($method, $arguments);
}
