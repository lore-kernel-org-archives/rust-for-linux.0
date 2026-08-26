Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750ED3D0927;
	Wed, 26 Aug 2026 18:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770802; cv=none; b=AJRJDskai5nSUOL+1rWsLo2BNsNBfxR/et422DMHYXGnWezJ7iASjnaEhUhbQXwrt5EWvwwyGIT0WFk56dWhkm4PCzQjDjf/HwqiQW5euRNkC2r9uIJhmV6Yhx7nbV7feM9IZWbTcX9WBtOeQUjhj+UsMaNZ0hhpAKAqqgxeI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770802; c=relaxed/simple;
	bh=uXgi8iKJnUvL0UbynOWlNB/E3XxehnflE1vksrfXgVE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lIe0rylyNzrjJzpISZ3XNQDPLFERKPXtX8cGH0MiG0dv068IXy0W4V+UYc5FtQ40jdoJJokzE893as4R+qNHe+oxI3J081TVkhY84PYtJe8CvoBlwW41a8CB53hs4zreLzkdKyjWlA1PUC61pIg6ccpGy131AZ6dpu08zBr66Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShWldzbn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShWldzbn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998241F00A3A;
	Wed, 26 Aug 2026 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787770793;
	bh=fbV04NJfrDSda39bLfWpSQ1+96igYqVLEjB/G359u1A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ShWldzbn3uUC0ns5uuQZ0h6aN8QEk/hUHthMftucv/SJ6uem6njm5qntvgNmlXnh1
	 YyyM1T9FrehPY0fAVO/U9hIP/f0Rs4hohmQj5YaDK3TqobTAbgM/z3JU5wK5xXBWnU
	 mGeIGer3HpU+dIUvrH3wNAlw+TCFE4QC2BOqMe1ZoPtgivqq+79rg8R0IsGFkmIyJh
	 74H+igIc0nTFpdSflHK5Kk5AhVIVa8AQObxjN/aMHhOwNzKae9jGsr5D2uvVF2dvMX
	 Qb2hRT+VKZYcNafp1zlvcqUeYQGiw94aRuuh4FDFi9/9mmoBaJ0VlC1j4QNzio3PP2
	 6QDo7BjpiuR2A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Aug 2026 20:59:47 +0200
Message-Id: <DKZ3UPVXL5C5.37DDI6DQKS3MS@kernel.org>
Subject: Re: [PATCH v3 1/5] rust: usb: add revocable typed interface I/O
Cc: <linux-usb@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Colin Braun" <colinbrauncl@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Mike Lothian" <mike@fireburn.co.uk>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
 <20260826163101.4168-2-mike@fireburn.co.uk>
In-Reply-To: <20260826163101.4168-2-mike@fireburn.co.uk>

On Wed Aug 26, 2026 at 6:30 PM CEST, Mike Lothian wrote:
> +    /// Asks the driver core to unbind whatever driver is currently boun=
d to this interface.

What is this needed for? Where do you use it?

> +    /// This is the narrow, reviewed replacement for handing out a raw `=
struct device` pointer: it
> +    /// performs exactly one operation (`device_release_driver()`) on th=
is interface's own device,
> +    /// and cannot be used to reach the device-wide state of a composite=
 peer.
> +    ///
> +    /// It is intended for a driver-provided "release my devices" contro=
l (e.g. a sysfs attribute),
> +    /// and must not be called from the driver's own `probe()` or `disco=
nnect()` callback: the
> +    /// driver core already holds the device lock across those.

IOW, it must not be available for Interface<Core>, which due to the deref c=
hain
is not that trivial to model. So, if this is really needed I think this nee=
ds a
an abstraction where you get a different device newtype from the scope wher=
e
this *should* be called from that allows you to do this and can never leave=
 the
scope.

> +    pub fn release_driver(&self) {
> +        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` by =
the type invariant, so the
> +        // address of its embedded `dev` is a valid `struct device`. `de=
vice_release_driver()`
> +        // takes the device lock itself and tolerates a device with no d=
river bound.
> +        unsafe { bindings::device_release_driver(&raw mut (*self.as_raw(=
)).dev) };
> +    }

[...]

> +/// A revocable window during which USB I/O is permitted on an interface=
.
> +///
> +/// A driver-`Bound` interface is *not* on its own proof that a transfer=
 may be issued: the USB
> +/// core forbids I/O outside the window that opens after a successful `p=
robe()`/resume/reset-resume
> +/// and must be closed again before `disconnect()`, `suspend()` or `pre_=
reset()` returns. This type
> +/// represents exactly that narrower state.

How is this different or narrower than the device's Bound type state repres=
ents?
Also, this seems to reinvent Devres, which we superseded with Rust native
lifetimes and higher-ranked types. Please use that instead.
