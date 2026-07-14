Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EAC46AEE0;
	Tue, 14 Jul 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034323; cv=none; b=TcQWv+r06Gj829RIuuY0miOMALuKU+VlfAL2eV0ZVgbtk8GGHlJJax5wmxanb3WIdDz56YeWzF0WsYINYU4t0C+649sU4nllPwJrabHxnDRXMRyZ0ggrJr0/SVEaUBygBoI3s9KusrbqTQUSMEt5N+venZCkVkzt5FgOJeuNOQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034323; c=relaxed/simple;
	bh=I7wEKHsf2R2pDc9KJje/OSCZvG41Dp/KsYtJEHVdnMs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=k3dgRiF8YQ260yJYgGTS5FWw2Kz4XN/elqJB5jjcfqZU1PEY7yfgor4Qt7ruu1bTxeQdO9EeBDbLvDmm/s4AgBFdvY55t8CYSk2kt6OtF0qNaB7nncAtNMKtDAG16Cu5a4S29zEY6IPCrLAZKjH+aJRY21tJonNZzv0jTVr2y2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COCqk8yy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COCqk8yy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EBF1F00A3D;
	Tue, 14 Jul 2026 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784034322;
	bh=Wbj6QDXg19S0b+wBbjbuJhWZrQ4U/U4cwe80Uim8/Nc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=COCqk8yyHxuJEN9djlQCTBh1IOHnxAtOtM7s2b6RdmnnTWMojnCSpQIfMqwRwYfHP
	 B0UOy3ZkXmNxGTNJ3MvwP3FVsxqSpWc/eLDKHRwuuAvjkaKRWWaojT06mkzVkPZgA1
	 h4mqw18yCbo6A7lmCWrEWECM69YSLHZibj6CIUQRN0s3jhEOJmuUPe66HUxQVkgoKR
	 RNu+OsP1oeQLsWmdvn0Yx5ak7ZbUDft+r+GbBdHvh1FhBIuNZtqqyCXtoX+8TuqHCy
	 x/XqK+fknZYwEiGKKJ5C5Qa+XxR7u6xQu0aqbNslIWJ7JqpQs+XyJxOInB9/xJdl5s
	 e7F3bSOmsq71Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 15:05:16 +0200
Message-Id: <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
Cc: "Colin Braun" <colinbrauncl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Mathias
 Nyman" <mathias.nyman@intel.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-media@vger.kernel.org>, "Colin Braun" <colin.braun.cl@gmail.com>
To: "Oliver Neukum" <oneukum@suse.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
In-Reply-To: <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>

On Tue Jul 14, 2026 at 11:26 AM CEST, Oliver Neukum wrote:
> You can see that there is no way a configuration and thereby its interfac=
es
> can last longer than its device.

So, what you're saying is that, in the generic case, there is a guarantee t=
hat
if a usb_interface is bound to a usb_driver, then the usb_interface's paren=
t
usb_device is also bound to a usb_device_driver.

But the relevant question is whether this always holds. In a previous discu=
ssion
[1] Alan explained that it currently doesn't hold.

Note that I'm not looking at this from a USB topology perspective, but from=
 a
driver model perspective. All I'm saying is that usb::Device<Bound> from th=
e
driver model side means "it is guaranteed that the usb_device is bound to a
usb_device_driver" and therefore can implement functions that rely on this
invariant.

Analogously, usb::Interface<Bound> means that the usb_interface is bound to=
 a
usb_driver. So, if we want to be able to derive usb::Device<Bound> from
usb::Interface<Bound> it must always be guaranteed that this holds, not jus=
t in
the most common case.

As for the question whether it should be

	let dev =3D intf.device();
	dev.bulk_recv();

or

	intf.bulk_recv();

the former does not work if we can't uphold the guarantee that
usb::Device<Bound> follows from usb::Interface<Bound>; at least not without=
 an
additional type state wrapper.

However, I don't see why we don't want to have the helper regardless. A
usb_driver primarily deals with the usb_interface device, so that makes per=
fect
sense from a driver model perspective: The "device" a usb_driver deals with=
 is
the usb_interface.

I think our main disconnect comes from the fact that you see this from a US=
B
stack topology point of view, whereas I see it from a driver model topology
point of view.

From the driver core perspective a usb_interface is just another device tha=
t
happens to have a usb_device parent. Lifecycle wise any device resources
requested by a usb_driver are tied to the lifetime of the usb_interface bei=
ng
bound to the usb_driver.

The semantic relationship of a usb_interface and a usb_device is a USB subs=
ystem
implementation detail, but it doesn't change the core lifecycle and ownersh=
ip
rules as far as the driver model is concerned.

That said, the question of having or not having those helpers is "bikeshedd=
ing"
about USB topology vs. driver model perspective and either seems reasonable
IMHO. However, it has a correctness implication, as giving out
usb::Device<Bound> from usb::Interface<Bound> would currently be unsound as=
 by
[1]; deriving usb::Device<Core> from usb::Interface<Core> is never correct,=
 as
it implies being in the scope of a device lock protected bus callback.

> There simply is no data structure equivalent to the binding of a driver a=
nd an
> interface,

I don't know what you mean by this.

> hence we cannot just give interfaces a state.

Of course we can, and we have to. As mentioned above, from a driver core
perspective a usb_interface is just another device, with an own struct devi=
ce it
embedds, its own device lock and its own driver structure (struct usb_drive=
r) it
can be bound to.

The device types states match exactly this. For instance the 'Core' context
represents a device that is given out in a bus callback while the device lo=
ck is
held, such that we can restrict methods that require this scope to this con=
text.

The same goes for the 'Bound' device context state. In the case of usb_inte=
rface
it means that the usb_interface is bound to the usb_driver.

[1] https://lore.kernel.org/all/0ff2a825-1115-426a-a6f9-df544cd0c5fc@rowlan=
d.harvard.edu/
