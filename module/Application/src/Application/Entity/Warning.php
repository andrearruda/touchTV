<?php

namespace Application\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * Warning
 *
 * @ORM\Table(name="warning")
 * @ORM\Entity(repositoryClass="Application\Repository\Warning")
 * @Gedmo\SoftDeleteable(fieldName="deletedAt")
 */
class Warning
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
     * @var \DateTime
     *
     * @ORM\Column(name="day_notice", type="date", nullable=false)
     */
    private $dayNotice;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=45, nullable=false)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="text", type="text", length=65535, nullable=false)
     */
    private $text;

    /**
     * @var string
     *
     * @ORM\Column(name="image", type="string", length=45, nullable=true)
     */
    private $image;

    /**
     * @var boolean
     *
     * @ORM\Column(name="active", type="boolean", nullable=false)
     */
    private $active = '0';

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="scheduling_start", type="datetime", nullable=false)
     */
    private $schedulingStart;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="scheduling_end", type="datetime", nullable=false)
     */
    private $schedulingEnd;

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
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set dayNotice
     *
     * @param \DateTime $dayNotice
     *
     * @return Warning
     */
    public function setDayNotice($dayNotice)
    {
        $this->dayNotice = $dayNotice;

        return $this;
    }

    /**
     * Get dayNotice
     *
     * @return \DateTime
     */
    public function getDayNotice()
    {
        return $this->dayNotice;
    }

    /**
     * Set title
     *
     * @param string $title
     *
     * @return Warning
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set text
     *
     * @param string $text
     *
     * @return Warning
     */
    public function setText($text)
    {
        $this->text = $text;

        return $this;
    }

    /**
     * Get text
     *
     * @return string
     */
    public function getText()
    {
        return $this->text;
    }

    /**
     * Set image
     *
     * @param string $image
     *
     * @return Warning
     */
    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get image
     *
     * @return string
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * Set active
     *
     * @param boolean $active
     *
     * @return Warning
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
     * Set schedulingStart
     *
     * @param \DateTime $schedulingStart
     *
     * @return Warning
     */
    public function setSchedulingStart($schedulingStart)
    {
        $this->schedulingStart = $schedulingStart;

        return $this;
    }

    /**
     * Get schedulingStart
     *
     * @return \DateTime
     */
    public function getSchedulingStart()
    {
        return $this->schedulingStart;
    }

    /**
     * Set schedulingEnd
     *
     * @param \DateTime $schedulingEnd
     *
     * @return Warning
     */
    public function setSchedulingEnd($schedulingEnd)
    {
        $this->schedulingEnd = $schedulingEnd;

        return $this;
    }

    /**
     * Get schedulingEnd
     *
     * @return \DateTime
     */
    public function getSchedulingEnd()
    {
        return $this->schedulingEnd;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return Warning
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
     * @return Warning
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
     * @return Warning
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
}
