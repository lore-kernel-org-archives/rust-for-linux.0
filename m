Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F2D285C96;
	Sat, 17 Jan 2026 11:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648272; cv=none; b=U8iOTrub3N4raHN/5BVjVzrKYv2o1i6ZSENVr3UH9reoq1ik21UjmHrBpBd8QP4FRlsC83aN0Scg0Rb2kzUwpO9CW4aT5NN/Jgv1CcQwjuiQRsjsi3/b78Opyhy1GJ65YjpXgI+X8v8TskBl4NkvFkdzlJGu65OS/TpAK5FgDSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648272; c=relaxed/simple;
	bh=ofbbr2aMpIJ7HbJcXcbCaozmzOpi2JPkW5CMljd/Xn0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENHlBICgBhNQOJ4t2wa+P1DoufY4wrpmlLd0v6G9NiCCLIK6P7PLdGkWAIJ5LU5hyBd1wCDWbMF2qljL6AlX/rewXFiEAI9jV5LvPncRxTMHSh7Qc7/PVCXnXvP2JRCujHFQt2QKzHoy+/VM4ClKzFNjqqGedyUP1lCSpf25khc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=lBxEvPof; arc=none smtp.client-ip=178.154.239.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="lBxEvPof"
Received: from mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1c1a:0:640:aab7:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTPS id CA039C0CBF;
	Sat, 17 Jan 2026 14:02:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id g2VlMdHGEuQ0-YmBMGCYB;
	Sat, 17 Jan 2026 14:02:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1768647766;
	bh=3/jfEeAE2JUKOJKcBA7d3hubcYSGkGBM7rbZZM3b+/8=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=lBxEvPofOkfxlZgX33wE0v5Lb+38HUEBBGQBk2XrXIMKloyGz/uM5ukWQtz65oNOe
	 EMBJKxow1FjBbbp/okVeqMQNLTjt6dGNeLh2icrdg1hyvyHxtjYxgVwsQ/wJwUZ1wm
	 pIVOfOJaCUeUOZAUYZfHtjdNDpKQpRiXXX7Bffso=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Sat, 17 Jan 2026 14:02:40 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, rafael@kernel.org, dakr@kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
Message-ID: <20260117140240.15d1120c@nimda>
In-Reply-To: <2026011725-contour-salary-d3d1@gregkh>
References: <20260117094710.24301-1-work@onurozkan.dev>
	<20260117094710.24301-2-work@onurozkan.dev>
	<2026011725-contour-salary-d3d1@gregkh>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 17 Jan 2026 11:00:11 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sat, Jan 17, 2026 at 12:47:10PM +0300, Onur =C3=96zkan wrote:
> > id_info() checks ACPI first and falls back to OF.
> >=20
> > This replaces the unnecessarily verbose approach with a
> > simple or_else() chain and drops temporary variables.
> >=20
> > No functional change intended.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/driver.rs | 12 +-----------
> >  1 file changed, 1 insertion(+), 11 deletions(-)
> >=20
> > diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> > index 649d06468f41..6cef792d54e4 100644
> > --- a/rust/kernel/driver.rs
> > +++ b/rust/kernel/driver.rs
> > @@ -307,16 +307,6 @@ fn of_id_info(dev: &device::Device) ->
> > Option<&'static Self::IdInfo> { /// If this returns `None`, it
> > means that there is no match in any of the ID tables directly ///
> > associated with a [`device::Device`]. fn id_info(dev:
> > &device::Device) -> Option<&'static Self::IdInfo> {
> > -        let id =3D Self::acpi_id_info(dev);
> > -        if id.is_some() {
> > -            return id;
> > -        }
> > -
> > -        let id =3D Self::of_id_info(dev);
> > -        if id.is_some() {
> > -            return id;
> > -        }
> > -
> > -        None
> > +        Self::acpi_id_info(dev).or_else(|| Self::of_id_info(dev))
>=20
> Have we already started the game of "rust golf" on the kernel?  The
> original code here is much easier to read, and the compiler should
> produce the same thing for both, right?
>=20
> thanks,
>=20
> greg k-h

Hi Greg,

I don't know what "rust golf" means, the main motivation here was to use
a more idiomatic Rust pattern.

Functions called in Adapter::id_info already return the same Result
type and it's quite annoying(IMO) to do "if x.is_some() { return x }"
in cases like this. Clippy would argue on many cases similar to this.
Readability is subjective, but to me the new code is slightly simpler
to follow (as it does the "try X, then Y" thing in a shorter way).

That said, I don't have strong feelings on the new code. The main
motivation was to drop the "annoying" code with more idiomatic one,
but seems like not everyone agrees with it. Feel free to ignore the
patch if you prefer the original code.

Regards,
Onur =C3=96zkan
