<?php

namespace App\Controller;

use App\Repository\VinRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class HomeController extends AbstractController
{
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/', name: 'home')]
    public function home(VinRepository $repo): Response
    {
        // $stock = $repo->nbrVinEnCave();
        // $stockBlanc = $repo->nbrVinEnCaveByRobe('blanc');
        // $stockRouge = $repo->nbrVinEnCaveByRobe('rouge');
        // $stockRose= $repo->nbrVinEnCaveByRobe('rosé');
        $stocks = $repo->stock();
        return $this->render('home/home.html.twig', [
            'stocks' => $stocks
            // 'stock' => $stock,
            // 'stock_blanc' => $stockBlanc,
            // 'stock_rouge' => $stockRouge,
            // 'stock_rose' => $stockRose,
        ]);
    }
}
