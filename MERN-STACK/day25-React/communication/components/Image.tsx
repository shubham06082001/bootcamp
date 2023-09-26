import Image from "next/image"

function ImageComponent({ url }) {
  return (
    <div>
      <Image src={url} height={500} width={500} alt="picture" />
    </div>
  )
}

export default ImageComponent
