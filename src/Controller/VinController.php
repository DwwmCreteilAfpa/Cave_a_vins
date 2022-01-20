<?php

namespace App\Controller;

use App\Repository\VinRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Vin;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\Request;


class VinController extends AbstractController
{
    #[Route('/vin/list', name: 'vin.list')]
    public function list(VinRepository $vinRepository): Response
    {
        $vins = $vinRepository->findAll();
//dump($vins);
        return $this->render('vin/list.html.twig', [
            'vins' => $vins,
        ]);
    }

    // #[Route('/vin/show/{id}', name: 'vin.show')]
    // public function show(VinRepository $repo, Request $req): Response
    // {
    //     $id = $req->get('id');
    //     $vin = $repo->findOneBy(['id' => $id]);
    //     return $this->render('vin/show.html.twig', ['vin' => $vin]);

    // }

  
    #[Route('/vin/show/{id}', name: 'vin.show')]
    public function show(Vin $vin): Response
    {
        return $this->render('vin/show.html.twig', ['vin' => $vin]);

    }

}
