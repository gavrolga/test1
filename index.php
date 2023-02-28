<?php
// Настройки подключения к БД
$host = 'localhost';
$dbname = 'test1';
$user = 'user';
$pass = '****';

try {
    $db = new PDO('mysql:host=' . $host . ';dbname=' . $dbname . ';charset=utf8', $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Получение списка категорий
    $sqlCategoriesQuery = 'SELECT id, name, parent_id FROM categories';
    $sqlCategoriesQuery = $db->query($sqlCategoriesQuery)->fetchAll(PDO::FETCH_ASSOC);

    // Получение товаров в каждой категории
    $sqlProductsCategoriesQuery = 'SELECT category_id, product_id FROM products_categories';
    $sqlProductsCategoriesQuery = $db->query($sqlProductsCategoriesQuery)->fetchAll(PDO::FETCH_ASSOC | PDO::FETCH_GROUP);
} catch (PDOException $e) {
    die("Невозможно получить данные из БД!<br>" . $e->getMessage());
}

// Массив с товарами приводим к виду id_категории => [id_товара, id_товара, ...]
$categoryWithProductsIds = [];
foreach ($sqlProductsCategoriesQuery as $key => $products_ids) {
	$categoryWithProductsIds[$key] = array_map(function($item) {
		return $item['product_id'];
	}, $products_ids);
}

$showCategoriesNames = getCategoryInfo($sqlCategoriesQuery, $categoryWithProductsIds, null);
echo '<pre>' . $showCategoriesNames['category_info'] . '</pre>';

// Возвращает инфу о всех дочерних категориях и общий список товаров в них
function getCategoryInfo($sqlCategoriesQuery, $categoryWithProductsIds, $parent_id, $depth = 0)
{
    $categoriesRecursive = ['category_info' => '', 'products_list' => []];

    if (array_key_exists($parent_id, $categoryWithProductsIds)) {
        $categoriesRecursive['products_list'] = $categoryWithProductsIds[$parent_id];
    }

    foreach ($sqlCategoriesQuery as $category) {
        if ($category['parent_id'] == $parent_id) {
            // Собираем инфу о ребенке
            $childCategories = getCategoryInfo($sqlCategoriesQuery, $categoryWithProductsIds, $category['id'], $depth + 1);

            $categoriesRecursive['category_info'] .= str_repeat("\t", $depth) . $category['name'] . '(' . count($childCategories['products_list']) . ') <br>';
            $categoriesRecursive['category_info'] .= $childCategories['category_info'];

            // Чтобы посчтать кол-во уникальных товаров т.к один товар может принадлежать сразу к нескольким категориям
            $categoriesRecursive['products_list'] = array_unique(array_merge($categoriesRecursive['products_list'], $childCategories['products_list']));
        }
    }

    return $categoriesRecursive;
}

/*
 *  При большом кол-ве категорий и уровней вложенности метод будет работать медленно. Вариант ускорения -
 *  изначально показывать только категории верхнего уровня, а остальные подгружать по клику через Ajax.
 *  В этом случае не получится динамически считать число товаров, но их можно закешировать в отдельном столбце в таблице с категориями.
 * 
 * */
