Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC25330D36
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170129; cv=none; b=uZj5PrgZA+YRLCmtAkwMWF7sFQju2Hq0UQ+SkxETXY5f4LjjAGL6C0fW5QYfMnTJaYtYMumd1ibk8Y+OSX4NkHIj86wKSsS++SV5Bo32SCIu7DqZ3x/8Bd5rdShHg80gzVNDkQXC6boDvajGGKkNRClWglzPfhpWl3T2jQLtiko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170129; c=relaxed/simple;
	bh=4+Wu74dryotI3ap27/frbT4+yrB8ToYvuQise3HWws0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nozjO0UNll93RsS9p+98PNGchgACbOC4XVCpKg35/o9HS3iXqcbt0+fgz1iSVsfF4l3iWDf3tHkVBaKtnioRl0L50QZPPET21Uvnrohlw13joAamlxMwDIK/sr1CG8sVvaqNI6TRaAffyEUeDBZZzU6PryQ99J8+mHZTSltocn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RY81Gk5Y; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RY81Gk5Y"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b87039c9a43so248057766b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 04:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769170125; x=1769774925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jX8ZXrxSKTJALGX+caA2iQKaO/aOfktLjQYXK9Gxow=;
        b=RY81Gk5YveG6VLrEr5OakVWMnt4Og/GRAQ5w5+lrZIrzRkCjZUR7BUdG+bvVVTvM/J
         Z0h5vmKyFncnGh+mtRawfAcaR2VG2AagLq13U/jgq207OI76f/Dge0UXyc86TJsoeyq7
         7ib8nDsrojmEFtKa/tyn7lGXpc34gws9CO0gRCfl16nCUX27mfLMh3i5f3eTCbpTyyap
         boesGieWaSpwQTDmHUeipnl3vTtsAPl52BlP3UeskcLmNEJR0blvI2hw71qDYku1Q5Jp
         PhOqDTbk1W7uIVxQNFmXcMvYmiAJ/C0Zz49lCp7GZWz6xGa2OcMDvogo4x+7nNc8VqSq
         F+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170125; x=1769774925;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7jX8ZXrxSKTJALGX+caA2iQKaO/aOfktLjQYXK9Gxow=;
        b=lZhKzGhtAUh34q6r9C20fAQBZdZv8/iatMJovM/W6NyX5YFhuZrYBxALUeokZnqjhE
         85KLlpdvw+ZTZu//yVyYClJ/iqErmtFcz5IJAlHbZObXbuT7yxZI5RLXEPUhCK7X5xB1
         IKjgW0y+QOmdBMdPeKKiuYbDT6Rwb8EWWU52J7Iz0Sj4AU6riyooVRGTSZz/hQYAzIru
         nTTjp3dyc1i/xKY2Lti6rEyg46vatiejBVU7GjlhSN4e8OGTndrWksGAEWmUD8FsGV63
         /QLbD0OokyYedKyaKSTTHjAEvvWy3VI5QZxV2KwIx68bfhf7IZmGEGiIZ9BM6PgW0lsc
         zVDg==
X-Forwarded-Encrypted: i=1; AJvYcCXaq55aPqrJRrJfMgXJoKtXfN9la7R//E88XVv9bsa2pZcaGwhtPQYNYlZ0mZ6EouOI2SVRX53rf/Vo+C6IyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOQjI0uxgEMBVFrw/Jw7eAhdBmZcZE/dddHKZmsglu0yVxl4PU
	H3Iodyh6YZphHCYsSuqoBZMa3454kAV/6e9Uh4ewxzv57G701Ez6ZrdEASGH3saPuI5UGLrOTOs
	+rjWZ7i2fBrK2OtV+Yw==
X-Received: from ejcs19.prod.google.com ([2002:a17:906:2853:b0:b87:76f3:ae34])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:da6:b0:b88:dc6:395d with SMTP id a640c23a62f3a-b885ae0a0b3mr199959266b.48.1769170124975;
 Fri, 23 Jan 2026 04:08:44 -0800 (PST)
Date: Fri, 23 Jan 2026 12:08:44 +0000
In-Reply-To: <aXJ1F4e7wdgM83Oo@um790>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com> <aXJ1F4e7wdgM83Oo@um790>
Message-ID: <aXNkzF2bgaj21OsI@google.com>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	broonie@kernel.org, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 11:05:59AM -0800, Deborah Brouwer wrote:
> On Thu, Jan 22, 2026 at 08:42:02AM +0000, Alice Ryhl wrote:
> > On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
> > > Currently these warnings, as errors, are preventing Tyr driver
> > > from building:
> > >=20
> > > error: field `device` is never read
> > >   --> drivers/gpu/drm/tyr/driver.rs:37:5
> > >    |
> > > 36 | pub(crate) struct TyrDriver {
> > >    |                   --------- field in this struct
> > > 37 |     device: ARef<TyrDevice>,
> > >    |     ^^^^^^
> > >    |
> > >    =3D note: `-D dead-code` implied by `-D warnings`
> > >    =3D help: to override `-D warnings` add `#[allow(dead_code)]`
> > >=20
> > > error: fields `mali` and `sram` are never read
> > >    --> drivers/gpu/drm/tyr/driver.rs:196:5
> > >     |
> > > 195 | struct Regulators {
> > >     |        ---------- fields in this struct
> > > 196 |     mali: Regulator<regulator::Enabled>,
> > >     |     ^^^^
> > > 197 |     sram: Regulator<regulator::Enabled>,
> > >     |     ^^^^
> > >=20
> > > error: aborting due to 2 previous errors
> > >=20
> > > Suppress these errors so that the Tyr driver will build.
> > >=20
> > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> >=20
> > I still don't understand why I couldn't reproduce it myself, but
> > assuming it's not just an 1.80.0 issue, below is my review:
>=20
> I think the problem is not actually the rust compiler version, but commit
> "0242623384c7 rust: driver: let probe() return impl PinInit<Self, Error>"
>=20
> Tyr probe() used to return a fully initialized Pin<KBox<Self>>, so the
> fields existed in an allocated struct which I suppose counted as
> =E2=80=9Creading=E2=80=9D the fields. But now Tyr probe() returns just a =
PinInit
> closure which doesn=E2=80=99t count as reading these fields.

I see.

> > >  drivers/gpu/drm/tyr/driver.rs | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driv=
er.rs
> > > index 2a45d0288825..04c865cb4397 100644
> > > --- a/drivers/gpu/drm/tyr/driver.rs
> > > +++ b/drivers/gpu/drm/tyr/driver.rs
> > > @@ -34,6 +34,7 @@
> > > =20
> > >  #[pin_data(PinnedDrop)]
> > >  pub(crate) struct TyrDriver {
> > > +    #[allow(dead_code)]
> > >      device: ARef<TyrDevice>,
> >=20
> > Let's use #[expect(dead_code)] so we remember to remove this when a use=
r
> > is added.
>=20
> Using #[expect(dead_code)] also fails with 'unfulfilled lint expectation'=
.
> So I could keep #[allow(dead_code)] or maybe just use an underscore
> _driver too with a comment to explain the issue. What do you think?

Ok, let's use _driver for now. If you send a v2, I'll apply it right away.

Alice
