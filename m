Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660860;
	b=bDNQFP8XAx3MXFcB3ZH2gZbX5O2HAW4LiqR1tvRWwlPbAU9/+Eho9qNMeG7Vu8X3JHgo
	 B/RYBLH+M1JrbroHH+gg9ftN62qpEE/T+kc67mLBPnFPedDO+a8DSqpGdT3HyWpkZWsK1
	 CCPpu3IZPYjG54MkdLN/XoNSUq2bmv1ifx833v2emiYjdaXryKNUw4Qg82/0ifv5T+BCt
	 FCGVjAjOnTAlvYRGkrttQCpsX8MWNz6kbKBjfzQ3sx7wdtsKJLN6ou/lx7WSo9Czzlx2I
	 CpqSVOsQoL9ap+Dv/81hkI4gpnjDXeS5vOR+YaTgKvgvFIW5WnLUemh0XGB2Es63SiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660860;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=3x2uPxaUDUNcZQcyh+416Ae+eQzIj5pPSZ+v/0y7/bU=;
	b=d3fh/OykBWKUk1hpa/Ujlvs1/Z1VJLVIKqAyAuUZwcr53Q47lh9bvui405yxJ8XPpsL4
	 8EUC4ExyYrvtphVeNjwoMCouPsYzRrMOSwmIjWrJttunHtoOVYNlh66rKcZPnfFltVmWA
	 0QJZ6/bxx0R6bZ7RV7UyvLtS86zjD+sdjbBnPEd9jEeYkASch6s0xHY1PnE5M38+8WaMS
	 gyst7fr0uyzAL4x3IMau98cGWvXbeJ8oF9tRtwUCMheJhDVCHATU2cjo9/oYNdxzWget2
	 xx8PHPzi1t690OO+oYiYWrfKJd42Wl90ebaIs6bGLv95KjRd/ED+GnIGTzI956OzlKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1QFmvT5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AA606A31B;
	Thu, 22 Oct 2026 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1QFmvT5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C94B1F000C1;
	Thu, 22 Oct 2026 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792660860;
	bh=3x2uPxaUDUNcZQcyh+416Ae+eQzIj5pPSZ+v/0y7/bU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=D1QFmvT55agxM/uWXUWqXh6eKaEhNOHPoynKREmCsF7WrIE/mCPEl2PilcSxFQUeo
	 tmq9ckOXVbyg/8SMYjTEU9A+o7/aiJQL3e1/Whn8YuMlHTCebjXIdwo6cd63fTQ/EP
	 S6SfYcZW91pbS/IC/DeAM1RkmS2q7iOMM5qnUj5+2VkxiG2Do6cF445fm9sX2tPnMp
	 WeMYXOPIUjuUbybI8GmqofWWY3DQDvezYQUIJnDQCwaiyoWpo5TuyMqPZM/nF12yX6
	 fyF8ZNrEoDyJ2GBERKsGUJ/lq8iiAtngRh3e3sDJE4CFgSoatgDt13kjwwWbimbojz
	 HunLq0BL3v4KQ==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 11:20:52 +0200
Message-Id: <DMB98IOE3UFS.3GDRFXA47B2PW@kernel.org>
Subject: Re: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for
 &I2cClient
Cc: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Georgios
 Androutsopoulos" <georgeandrout13@gmail.com>, "Muchamad Coirul Anwar"
 <muchamadcoirulanwar@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Jori Koolstra" <jkoolstra@xs4all.nl>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>
To: "Igor Korotin" <igor.korotin@linux.dev>, "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261019152329.620610-1-nico.antinori.7@gmail.com>
 <179258597583.20422.10358976352101642829@linux.dev>
 <DMAIXJB74Q1O.9A03KK0SSDLH@garyguo.net>
In-Reply-To: <DMAIXJB74Q1O.9A03KK0SSDLH@garyguo.net>

Igor,

On Wed Oct 21, 2026 at 2:44 PM CEST, Gary Guo wrote:
> On Wed Oct 21, 2026 at 1:32 PM BST, Igor Korotin wrote:
>> Hi all,
>>
>> Want to flag something before this lands -- I gave this an Acked-by
>> already, but while reviewing Muchamad's concurrent AS5600/IIO series
>> (Cc'd) I hit a real conflict with it.
>>
>> His IioDriver::read_raw is called by the generic IIO core, which only
>> ever hands the driver a generic &Device<Bound>
>
> That'd be a subsystem design issue.

Indeed, for class devices registered for a bus device there are two possibl=
e
options to get to the specific parent bus device:

  (1) Track it in the type system taking advantage of the AsBusDevice trait=
.

  (2) Let the driver store a reference to the specific bus device in its cl=
ass
      device registration data (which is guaranteed to be shorter lived tha=
n the
      'bound lifetime).

The "upcast" was only ever needed for cases where we couldn't (easily) repr=
esent
the relationship through the type system (1); auxiliary bus was such an exa=
mple.
But with the lifetime design this went away too.

> In the latest device driver lifecycle model design, class device must not=
 mess
> around with parent bus device. It should use its own mechanism to carry a=
round
> private data, which is initialized when creating the class device registr=
ation.
>
> The callback bridges should simply retrieve that registered data and hand=
 it to
> the driver callback. The driver can decide to put whatever it needs there=
, and
> this include a `&Device<Bound>` of the bus device (hint -- you probably d=
on't
> need it, it should just be a reference to whatever bus device resoruce th=
e
> callback needs).

There's nothing wrong with a subsystem using AsBusDevice to keep track of t=
he
specific parent bus device type and handing out references of it in callbac=
ks,
but the lifetime design makes it largely unnecessary.

> The need for conversion is a strong indication that it's not aligned with=
 the
> device driver lifetime design.

Indeed, but as mentioned above, this shouldn't even be necessary without it=
.
