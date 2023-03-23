<?php

// src/Controller/DefaultController.php
namespace App\Controller;

use App\Entity\Article;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(EntityManagerInterface $entityManager): Response
    {

        $articles = $entityManager->getRepository(Article::class)->findAll();

        return $this->render('index.html.twig', [
            'articles' => $articles,
        ]);
    }
}
