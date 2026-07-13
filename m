Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D6526F29C;
	Mon, 13 Jul 2026 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953871; cv=none; b=AfXATU0Nt10xeoBlXaeZq7mDeJGEfRps2mbdr+i3DTVtXpBiSomGD4SGP6t/lzwuk7DnnsjwAP8w7p5qcI9rOS2WoMw8DgVp3ChL0QFiilPMoYlQyRdqh9d3sRShojT00et4LO06DtzCwk8lyzBNRJiq/ZQw8guhNj+uKq5FWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953871; c=relaxed/simple;
	bh=Wi2oIO4KlthMzhdBHCa/zOWzvuPpWi847pDCLSaxheI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=pfvxvav0wNpHys4XlPNwb2QjMpUWQIYdMrOF7kxbAazFjD0HdpCHlTY37O0W2o4t3UvVgnh7As1R3XGPT492EVl+3S3spu1T703PQq12YDAzT06QvaTO8hpszkXfD1N9/9kaSk2NreIVwZqGL0eXRgHcYYiPxo7yyyfDRfV8d7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEqe3vf0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEqe3vf0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339E71F000E9;
	Mon, 13 Jul 2026 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783953870;
	bh=TJzui1iXfClv4opxUqA+6q+P2kgXyCK8mGf+aPBN15w=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=NEqe3vf0wECpvAehX8BA508mFHxw0Vc+AtEr40n2CwBWIiKY9M5HKEQJdqd1xlMmt
	 EgDYk/hdyBDIigSlvRgafUlNMjplThFerXphRXqe4b3FttoCaLpaKfIBavvLjc32uU
	 xy1J7dsY7IfJypwkgZBgfiq4fYuhIZQfWHGlYthHPLANI34eHyb4aOEMP2Dewt66hL
	 UkV4VFQHRC3NXK/frjsMQIkwccnJlQxyzOD5sq9bCPlaDAKr+Zpgld3CJmzfI8p5kk
	 nA9abuqjtHBhFpeV2SxbxhK/WTD25aCh+ejr2yhz8MStXbrugC93aKVHOcJ9QGsRJU
	 kO3x4WDSa3R6A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 16:44:24 +0200
Message-Id: <DJXIV7JTU8JG.2U0I0LMHE84NJ@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Alan
 Stern" <stern@rowland.harvard.edu>, "Mathias Nyman"
 <mathias.nyman@intel.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-media@vger.kernel.org>, "Colin Braun" <colin.braun.cl@gmail.com>
To: "Colin Braun" <colinbrauncl@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 4/4] media: add gv-usb2 audio capture driver
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-4-9fa011634ead@gmail.com>
In-Reply-To: <20260712-urb-abstraction-v1-v1-4-9fa011634ead@gmail.com>

On Sun Jul 12, 2026 at 11:08 PM CEST, Colin Braun wrote:
> +/// Write a vendor-specific control register on the GV-USB2 device.
> +///
> +/// Uses a vendor-type control request (`REQ_WRITE_REG`) to write the
> +/// given `value` to the given `reg` address.
> +fn write_reg(intf: &usb::Interface<device::Bound>, reg: u16, value: u8) =
-> Result {

In addition to raw control messages, this can leverage the generic I/O back=
end
infrastructure, so you don't have to roll your own write_reg() function and=
 use
the register!() infrastructure instead. See also [1] and [2].

[1] https://lore.kernel.org/driver-core/20260706-io_projection-v6-0-72cd5d0=
55d54@garyguo.net/
[2] https://lore.kernel.org/lkml/DJVQ852J7SOH.26YBIJTQ9B66G@kernel.org/

> +    let req =3D usb::ch9::CtrlRequest::new(
> +        usb::ch9::RequestType::new(
> +            usb::ch9::Direction::Out,
> +            usb::ch9::Type::Vendor,
> +            usb::ch9::Recipient::Device,
> +        ),
> +        regs::REQ_WRITE_REG,
> +        u16::from(value),
> +        reg,
> +        0,
> +    );
> +    let dev: &usb::Device<device::Bound> =3D intf.as_ref();
> +    dev.control_msg(&req, None, Delta::from_millis(1_000))
> +        .map(|_| ())
> +}
