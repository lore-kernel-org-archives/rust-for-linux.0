Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917B1D6187;
	Sat, 17 Jan 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768655126; cv=none; b=i2zKyYByf+fktK3OPXRNAZxebD6fm30xXwmX5Ypcn2S/jzQuytV86xMy1Q0jHBzC+E3uH2b1ldPyyASFaBcNB7s1+OFz/sPLe5QVkMKQRZouPA53+iV5IoBXlvkO/iglTHzp4UeSkBwyNqfQsNfFX2xewZH5tOD0opZ8WLVDJD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768655126; c=relaxed/simple;
	bh=BY4h0gCIdzIzZNIyWzL4gR7I5uWwRAs+jwkbGODHvWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/iqSsnxJt/DZIlQaZVsKCbuNClIDsVRPT8gKetXlPvu3KcZPCzATNU2RNQXMMn7VUrkyBwH4eMFgKk/fp+ibtc8fjFPERvg+9eMezqpscqQWa7sDvHYl4V0Otf2KD+X+NoccWL4rAiTyCixa6bV55YXGjDvIWYbD9HWDNpnTiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=YL8x1XAq; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="YL8x1XAq"
Received: from mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:9a4b:0:640:e388:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 7C0DF81320;
	Sat, 17 Jan 2026 15:56:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id XuW9n1NGpa60-eOtB0v00;
	Sat, 17 Jan 2026 15:56:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1768654596;
	bh=wYx/drHJKsunxl3UzLgHglN3zEFvMfYLPRJCE21E/Kk=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=YL8x1XAqvn+Kh26cKZOrZzQBH6BpCgsNcWsF2FCuv91Xl++KwtEwciR5pp1mwe5KA
	 Xqi2pHLbgn8hwCXQRJgHky6rHppFbT8ZcXhcU5/JGQgEAYWfcO2B2mkJDCptkeoQw7
	 xbVUrMbmpY1z74BPbEU0fvu2CzAioX/7rytkGlwk=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Sat, 17 Jan 2026 15:56:31 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, rafael@kernel.org, dakr@kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
Message-ID: <20260117155631.5a65b3c6@nimda>
In-Reply-To: <2026011703-bony-unloader-9099@gregkh>
References: <20260117094710.24301-1-work@onurozkan.dev>
	<20260117094710.24301-2-work@onurozkan.dev>
	<2026011725-contour-salary-d3d1@gregkh>
	<20260117140240.15d1120c@nimda>
	<2026011703-bony-unloader-9099@gregkh>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 17 Jan 2026 13:07:54 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sat, Jan 17, 2026 at 02:02:40PM +0300, Onur =C3=96zkan wrote:
> > On Sat, 17 Jan 2026 11:00:11 +0100
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> >=20
> > > On Sat, Jan 17, 2026 at 12:47:10PM +0300, Onur =C3=96zkan wrote:
> > > > id_info() checks ACPI first and falls back to OF.
> > > >=20
> > > > This replaces the unnecessarily verbose approach with a
> > > > simple or_else() chain and drops temporary variables.
> > > >=20
> > > > No functional change intended.
> > > >=20
> > > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > > > ---
> > > >  rust/kernel/driver.rs | 12 +-----------
> > > >  1 file changed, 1 insertion(+), 11 deletions(-)
> > > >=20
> > > > diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> > > > index 649d06468f41..6cef792d54e4 100644
> > > > --- a/rust/kernel/driver.rs
> > > > +++ b/rust/kernel/driver.rs
> > > > @@ -307,16 +307,6 @@ fn of_id_info(dev: &device::Device) ->
> > > > Option<&'static Self::IdInfo> { /// If this returns `None`, it
> > > > means that there is no match in any of the ID tables directly
> > > > /// associated with a [`device::Device`]. fn id_info(dev:
> > > > &device::Device) -> Option<&'static Self::IdInfo> {
> > > > -        let id =3D Self::acpi_id_info(dev);
> > > > -        if id.is_some() {
> > > > -            return id;
> > > > -        }
> > > > -
> > > > -        let id =3D Self::of_id_info(dev);
> > > > -        if id.is_some() {
> > > > -            return id;
> > > > -        }
> > > > -
> > > > -        None
> > > > +        Self::acpi_id_info(dev).or_else(||
> > > > Self::of_id_info(dev))
> > >=20
> > > Have we already started the game of "rust golf" on the kernel?
> > > The original code here is much easier to read, and the compiler
> > > should produce the same thing for both, right?
> > >=20
> > > thanks,
> > >=20
> > > greg k-h
> >=20
> > Hi Greg,
> >=20
> > I don't know what "rust golf" means, the main motivation here was
> > to use a more idiomatic Rust pattern.
>=20
> I was referring to this:
> 	https://en.wikipedia.org/wiki/Code_golf
> sorry for not being explicit :)
>=20

I didn't know this term before - good to know :)

> > Functions called in Adapter::id_info already return the same Result
> > type and it's quite annoying(IMO) to do "if x.is_some() { return x
> > }" in cases like this. Clippy would argue on many cases similar to
> > this. Readability is subjective, but to me the new code is slightly
> > simpler to follow (as it does the "try X, then Y" thing in a
> > shorter way).
>=20
> Does clippy complain about this one?
>=20

No, it doesn't.

> > That said, I don't have strong feelings on the new code. The main
> > motivation was to drop the "annoying" code with more idiomatic one,
> > but seems like not everyone agrees with it. Feel free to ignore the
> > patch if you prefer the original code.
>=20
> I don't have strong feelings either, but the original is "easier" for
> those of us used to C code.
>=20

Fair point, you are right.

Thanks,
Onur =C3=96zkan

> thanks,
>=20
> greg k-h

