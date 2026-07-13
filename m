Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9443382F4;
	Mon, 13 Jul 2026 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973371; cv=none; b=eX4QibyO1DbfIMtZMOAJRUiZL2WFkkv/I1RQfUudxzqJbFEWZaRm8TCMQLG8AzPjXK9Jl8i3+xh7m0snFadorX8qDGs/eJUUTzWcmLgePK+UoOw4FA1zF3DH2LQdR20qhSL0bFBJS0JJK1KfTbTqgxb35Yf2Iqke4yezGpnBAdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973371; c=relaxed/simple;
	bh=mss/B+cZ1HdpgFx6u4/LPmRMnN2jEzZGgXXzH7XVLKw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aLwlid79gIpObVW5RmezPKpFk0DJodKUwdT9UJTxcvht7SEYzyTwk43yZOAvhB+uaIQOaj4TvOWupjh4tLyR8OrviLBqHZFyyWFx3IfeGh1YklyWwhidjGSQMOq5izQX4gMT359K5ecFueoN/mB0KvhG66n8UNMP4X7ar7UwKAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVgW+o6l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVgW+o6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBD31F000E9;
	Mon, 13 Jul 2026 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783973368;
	bh=VTPpDn/Xcj1Tl5BJcGDkfSf33jZdlkZD65YlmnFb1kg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DVgW+o6l3gJwfvvKtHIJtCKCtGuFQU7aWxPe/3dmQDQyRDsnEc8QbDUJyptMj4PGH
	 LherIhJaiz7r+Bhz4nE2M3xUv1B4M8wQ2EO9pJH6fk6WQPN3cLMPTZrFAgvXO6eSIB
	 dBv69f0Ag3Jr/l/SqPYitkOr+LNi27EQqzpuleqQsMPzz1yYbEhOdFcP0ZVTSXZbCO
	 rqwhvwnYf78ObNsId/QslVgwVYKblWKpXVw+Qns+0eNIrJUIckfCFssNkv0V0ptw8Z
	 vrfGt8guQG2+dYx4rHbH2W7D8vBtKDqVd30OtX0VQMEzYSJctGcO82/HcXnP7MxF4D
	 O+55XHAvJGKTg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 22:09:21 +0200
Message-Id: <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
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
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
In-Reply-To: <alVEUR0JrF1ga3S8@pendragon>

On Mon Jul 13, 2026 at 10:03 PM CEST, Colin Braun wrote:
> On Mon, Jul 13, 2026 at 03:22:33PM +0200, Danilo Krummrich wrote:
>> (Cc: Oliver)
>>=20
>> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
>> > @@ -382,8 +556,8 @@ fn as_ref(&self) -> &device::Device<Ctx> {
>> >      }
>> >  }
>> > =20
>> > -impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
>> > -    fn as_ref(&self) -> &Device {
>> > +impl<Ctx: device::DeviceContext> AsRef<Device<Ctx>> for Interface<Ctx=
> {
>> > +    fn as_ref(&self) -> &Device<Ctx> {
>> >          // SAFETY: `self.as_raw()` is valid by the type invariants.
>> >          let usb_dev =3D unsafe { bindings::interface_to_usbdev(self.a=
s_raw()) };
>>=20
>> Please see commit f12140f21acb ("rust: usb: don't retain device context =
for the
>> interface parent").
>>=20
>> We can't derive the device context of a USB device from a USB interface.=
 Please
>> also see the device context documentation in [1].
>>=20
>> USB device drivers are separate from USB interface drivers, we can't ass=
ume that
>> a USB device is bound to a USB device driver just because a USB interfac=
e (of
>> that same device) is bound to an USB interface driver.
>>=20
>> The same is true from the Core context, which means the device is in a b=
us
>> device callback, where the device lock is held.
>>=20
>> This is also the reason why I keep proposing to only expose simple forwa=
rding
>> helpers on usb::Interface to implement URBs (see also [2] and [3]).
>>=20
>> An URB requires either usb::Interface<Bound> or, for a USB device driver=
,
>> usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
>> usb::Interface<Bound> a simple forwarding helper does the trick.
>
> That makes sense, thank you for pointing this out. I should have taken a
> look at the git log for that line to try to understand its background.
>
> I'll remove the usb::Device<device::Bound>::set_interface() and
> usb::Device<device::Bound>::control_msg() implementations in my next
> revision (since they will no longer be used) and just implement them on
> usb::Interface<device::Bound>.

I'd keep them unsafely on usb::Device and then safely expose forwarding via
usb::Device<Bound> and usb::Interface<Bound> once required.
