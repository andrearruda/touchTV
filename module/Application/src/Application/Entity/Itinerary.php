<?php

namespace Application\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * Itinerary
 *
 * @ORM\Table(name="itinerary", indexes={@ORM\Index(name="fk_itinerary_itinerary_route1_idx", columns={"itinerary_route_id"}), @ORM\Index(name="fk_itinerary_itinerary_city1_idx", columns={"itinerary_city_id"})})
 * @ORM\Entity(repositoryClass="Application\Repository\Itinerary")
 * @Gedmo\SoftDeleteable(fieldName="deletedAt")
 */
class Itinerary
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="schedule", type="string", length=5, nullable=false)
     */
    private $schedule;

    /**
     * @var string
     *
     * @ORM\Column(name="stop", type="string", length=25, nullable=false)
     */
    private $stop;

    /**
     * @var string
     *
     * @ORM\Column(name="reference", type="string", length=25, nullable=false)
     */
    private $reference;

    /**
     * @var string
     *
     * @ORM\Column(name="neighborhood", type="string", length=15, nullable=false)
     */
    private $neighborhood;

    /**
     * @var boolean
     *
     * @ORM\Column(name="active", type="boolean", nullable=false)
     */
    private $active = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=false)
     * @Gedmo\Timestampable(on="create")
     */
    private $createdAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="updated_at", type="datetime", nullable=false)
     * @Gedmo\Timestampable(on="update")
     */
    private $updatedAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="deleted_at", type="datetime", nullable=true)
     */
    private $deletedAt;

    /**
     * @var \Application\Entity\ItineraryRoute
     *
     * @ORM\ManyToOne(targetEntity="Application\Entity\ItineraryRoute")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="itinerary_route_id", referencedColumnName="id")
     * })
     */
    private $itineraryRoute;

    /**
     * @var \Application\Entity\ItineraryCity
     *
     * @ORM\ManyToOne(targetEntity="Application\Entity\ItineraryCity")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="itinerary_city_id", referencedColumnName="id")
     * })
     */
    private $itineraryCity;



    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set schedule
     *
     * @param string $schedule
     *
     * @return Itinerary
     */
    public function setSchedule($schedule)
    {
        $this->schedule = $schedule;

        return $this;
    }

    /**
     * Get schedule
     *
     * @return string
     */
    public function getSchedule()
    {
        return $this->schedule;
    }

    /**
     * Set stop
     *
     * @param string $stop
     *
     * @return Itinerary
     */
    public function setStop($stop)
    {
        $this->stop = $stop;

        return $this;
    }

    /**
     * Get stop
     *
     * @return string
     */
    public function getStop()
    {
        return $this->stop;
    }

    /**
     * Set reference
     *
     * @param string $reference
     *
     * @return Itinerary
     */
    public function setReference($reference)
    {
        $this->reference = $reference;

        return $this;
    }

    /**
     * Get reference
     *
     * @return string
     */
    public function getReference()
    {
        return $this->reference;
    }

    /**
     * Set neighborhood
     *
     * @param string $neighborhood
     *
     * @return Itinerary
     */
    public function setNeighborhood($neighborhood)
    {
        $this->neighborhood = $neighborhood;

        return $this;
    }

    /**
     * Get neighborhood
     *
     * @return string
     */
    public function getNeighborhood()
    {
        return $this->neighborhood;
    }

    /**
     * Set active
     *
     * @param boolean $active
     *
     * @return Itinerary
     */
    public function setActive($active)
    {
        $this->active = $active;

        return $this;
    }

    /**
     * Get active
     *
     * @return boolean
     */
    public function getActive()
    {
        return $this->active;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return Itinerary
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get createdAt
     *
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Set updatedAt
     *
     * @param \DateTime $updatedAt
     *
     * @return Itinerary
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    /**
     * Get updatedAt
     *
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * Set deletedAt
     *
     * @param \DateTime $deletedAt
     *
     * @return Itinerary
     */
    public function setDeletedAt($deletedAt)
    {
        $this->deletedAt = $deletedAt;

        return $this;
    }

    /**
     * Get deletedAt
     *
     * @return \DateTime
     */
    public function getDeletedAt()
    {
        return $this->deletedAt;
    }

    /**
     * Set itineraryRoute
     *
     * @param \Application\Entity\ItineraryRoute $itineraryRoute
     *
     * @return Itinerary
     */
    public function setItineraryRoute(\Application\Entity\ItineraryRoute $itineraryRoute = null)
    {
        $this->itineraryRoute = $itineraryRoute;

        return $this;
    }

    /**
     * Get itineraryRoute
     *
     * @return \Application\Entity\ItineraryRoute
     */
    public function getItineraryRoute()
    {
        return $this->itineraryRoute;
    }

    /**
     * Set itineraryCity
     *
     * @param \Application\Entity\ItineraryCity $itineraryCity
     *
     * @return Itinerary
     */
    public function setItineraryCity(\Application\Entity\ItineraryCity $itineraryCity = null)
    {
        $this->itineraryCity = $itineraryCity;

        return $this;
    }

    /**
     * Get itineraryCity
     *
     * @return \Application\Entity\ItineraryCity
     */
    public function getItineraryCity()
    {
        return $this->itineraryCity;
    }
}
