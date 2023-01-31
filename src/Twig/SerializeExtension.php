<?php
use Twig\Extension\AbstractExtension;

class SerializeExtension extends AbstractExtension
{

    public function serialize($data, string $format = 'json', array $context = []): string
    {
        return $this->serializer->serialize($data, $format, $context);
    }
}
