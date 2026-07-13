Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FAE42E00F;
	Mon, 13 Jul 2026 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948961; cv=none; b=Ya3KTlKUSaV2SGexZjwrQbnp1RefbHLUhhLyL7URMYMencZRBTKb5XQiq4X1eWX+HZNJyaQr+uhBa/E0UxFXLrefnbi7Qr1ZcGptNDoDPTC6113w81CIThpn/ZfSjqYojC9mDKdpYSITkMbVOZHyCJxwXPnZSIDow+vOVUA9CAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948961; c=relaxed/simple;
	bh=jM6e9c+0o75eNSvMophbQ8WJrLMI6Mrq3HnN42o2rqo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=AwO9UW8/YWFY7nWOsvFTPhmBZ4z6FnxE0djOwJ425/pqLJCsyLRvXvGG8ris+hdAQMtJJhX5pIq2BEttrIbKyaVeUBygJbGids3DDhC9ZDvZkGTyvffQ/dVzJHxC4zMbzTpXlBBJ0cqGMGTdchHxaQrvHYM6Dimx92GyqP8umcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/yRq4yF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/yRq4yF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9DE1F000E9;
	Mon, 13 Jul 2026 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948959;
	bh=oN4fj19HlXx2gH9uVU0NktYB1l0CTvjr8ja0mgYRZ7I=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=b/yRq4yFfhFI/VFgrjlcjCvG6J1C292nFVSaKSvG0Y87cCj2pwiXmTpth/btpZQmc
	 WkAYyqlkXeUgIGWfqDI0NeroLdhQf33eBbcfl02BosFiM/8p8Gq+gOFTZHzTm4a9DD
	 sDmjTxKfgRx+EfWh9xgJMZCCPYwW89mJ1wnQXjdOiDt8IRuq9AvU73o76mMyLYmETl
	 ZIUNIj5X3EFMSK30+8WlHOex9v3i7Hs/gJS44EVEcExwZKBWl69hd1shOezktbJFx3
	 j07bJ7sU2E6415ZgTzhMR3Jy2MpggV0JP46c/nd0vP5qYC6FjEXIaJIsrfDhTSDFYX
	 cQ+k6Pv/npM5A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 15:22:33 +0200
Message-Id: <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
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
 <linux-media@vger.kernel.org>, "Colin Braun" <colin.braun.cl@gmail.com>,
 <oneukum@suse.com>
To: "Colin Braun" <colinbrauncl@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
In-Reply-To: <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>

(Cc: Oliver)

On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
> @@ -382,8 +556,8 @@ fn as_ref(&self) -> &device::Device<Ctx> {
>      }
>  }
> =20
> -impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
> -    fn as_ref(&self) -> &Device {
> +impl<Ctx: device::DeviceContext> AsRef<Device<Ctx>> for Interface<Ctx> {
> +    fn as_ref(&self) -> &Device<Ctx> {
>          // SAFETY: `self.as_raw()` is valid by the type invariants.
>          let usb_dev =3D unsafe { bindings::interface_to_usbdev(self.as_r=
aw()) };

Please see commit f12140f21acb ("rust: usb: don't retain device context for=
 the
interface parent").

We can't derive the device context of a USB device from a USB interface. Pl=
ease
also see the device context documentation in [1].

USB device drivers are separate from USB interface drivers, we can't assume=
 that
a USB device is bound to a USB device driver just because a USB interface (=
of
that same device) is bound to an USB interface driver.

The same is true from the Core context, which means the device is in a bus
device callback, where the device lock is held.

This is also the reason why I keep proposing to only expose simple forwardi=
ng
helpers on usb::Interface to implement URBs (see also [2] and [3]).

An URB requires either usb::Interface<Bound> or, for a USB device driver,
usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
usb::Interface<Bound> a simple forwarding helper does the trick.

[1] https://rust.docs.kernel.org/kernel/device/trait.DeviceContext.html
[2] https://lore.kernel.org/lkml/DJRF98V7SMXT.14BS8WGBEESZ8@kernel.org/
[3] https://lore.kernel.org/lkml/24196da3-62e8-4707-8024-d989bcd5d3a8@rowla=
nd.harvard.edu/
