Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B233E373
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108779; cv=pass; b=n2g92WrohKXs1m+tQD1S9KlPQrWbzsd8QD9CY51SJMANtTd6HZjrGjkZG7PKmevcvXUqwOjawZdXAf3AhNCkdV3Iq758BvoBHY52Y2B9wl3H5vGopf0y3ukcfbteDSOMYrEdtLVKdREpzG/lRMenUPxhzfHaoCdY2pjhAiH00pA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108779; c=relaxed/simple;
	bh=81yGT7j3zMjIy0ZC6vBWcdfg+lmagSHygFDNpwNF2pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8fXeKoLl1kylCJBlOmrR6tS5foF59OHqxpOzut1wdgAKgkJUdrDkczlh1mj92rUs8fTK+MfpXTi5GE52rFZseT36L+vBWs5+uURt3RyCr0gp3PRtBA8sOsgb4oVBa6BcKnWafr0pFde8+PjK7fqQDfljOjoLcQ9KWapYk/fqUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=kBmVs6np; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="kBmVs6np"
ARC-Seal: i=1; a=rsa-sha256; t=1769108763; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g0ptvo0tmmgB9fdAFJoCetNQFCJ6m5F3/MFhZy/fMcOoNeaTncjeX0eGEY/DWZOiPKcqpHPBX1fkSY8zmEbjpY2X8g/QzPfn1ztBg5LIUvcWvtc4W6ViL/HfqTgxuamT4uAmjhmDuumFX4oHGdwR7luP2zti15F1d6z35RDi0Hs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769108763; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=faRdJUDNrt+iPBKV4ukuA3a4Ha5WPF5TGx+wxawSFO0=; 
	b=keX6X1e0Cb4i5XUBsxZEELBmbmkqOQCbKmTe/RdJmFgamlrNKkKfAkd8UDIfRV4PkBZl3horT9B8srCu9vQrOD2Iu5tpkIq0knXa2kwx6pp3d9Xo5LCIlsqTfBKgBZpJy85JM/IRii1ajEFnaWfM/NkyeFXYCrt41ye1wuPOh5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769108763;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=faRdJUDNrt+iPBKV4ukuA3a4Ha5WPF5TGx+wxawSFO0=;
	b=kBmVs6npXNcrQe+DcdjW85v+0gfddLLEobVO66xlGJkNIf4j4/YsCQPYxP2OoWgv
	142hn7AUjWzzPKkaQeJKZBrGDah7zKymD2Oo9KWMBQZ2MjdUlaL/nRfRupDS3/DAYD/
	0DX83P96Sx6IfCm1kL+mTgz+KCJ6/8K3X5j5hFus=
Received: by mx.zohomail.com with SMTPS id 1769108760674919.727871103422;
	Thu, 22 Jan 2026 11:06:00 -0800 (PST)
Date: Thu, 22 Jan 2026 11:05:59 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, boris.brezillon@collabora.com,
	broonie@kernel.org, dakr@kernel.org,
	miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
Message-ID: <aXJ1F4e7wdgM83Oo@um790>
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXHi2jJNptrgUqyj@google.com>

On Thu, Jan 22, 2026 at 08:42:02AM +0000, Alice Ryhl wrote:
> On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
> > Currently these warnings, as errors, are preventing Tyr driver
> > from building:
> > 
> > error: field `device` is never read
> >   --> drivers/gpu/drm/tyr/driver.rs:37:5
> >    |
> > 36 | pub(crate) struct TyrDriver {
> >    |                   --------- field in this struct
> > 37 |     device: ARef<TyrDevice>,
> >    |     ^^^^^^
> >    |
> >    = note: `-D dead-code` implied by `-D warnings`
> >    = help: to override `-D warnings` add `#[allow(dead_code)]`
> > 
> > error: fields `mali` and `sram` are never read
> >    --> drivers/gpu/drm/tyr/driver.rs:196:5
> >     |
> > 195 | struct Regulators {
> >     |        ---------- fields in this struct
> > 196 |     mali: Regulator<regulator::Enabled>,
> >     |     ^^^^
> > 197 |     sram: Regulator<regulator::Enabled>,
> >     |     ^^^^
> > 
> > error: aborting due to 2 previous errors
> > 
> > Suppress these errors so that the Tyr driver will build.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> I still don't understand why I couldn't reproduce it myself, but
> assuming it's not just an 1.80.0 issue, below is my review:

I think the problem is not actually the rust compiler version, but commit
"0242623384c7 rust: driver: let probe() return impl PinInit<Self, Error>"

Tyr probe() used to return a fully initialized Pin<KBox<Self>>, so the
fields existed in an allocated struct which I suppose counted as
“reading” the fields. But now Tyr probe() returns just a PinInit
closure which doesn’t count as reading these fields.

> 
> >  drivers/gpu/drm/tyr/driver.rs | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> > index 2a45d0288825..04c865cb4397 100644
> > --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -34,6 +34,7 @@
> >  
> >  #[pin_data(PinnedDrop)]
> >  pub(crate) struct TyrDriver {
> > +    #[allow(dead_code)]
> >      device: ARef<TyrDevice>,
> 
> Let's use #[expect(dead_code)] so we remember to remove this when a user
> is added.

Using #[expect(dead_code)] also fails with 'unfulfilled lint expectation'.
So I could keep #[allow(dead_code)] or maybe just use an underscore
_driver too with a comment to explain the issue. What do you think?

> 
> >  }
> >  
> > @@ -193,6 +194,8 @@ struct Clocks {
> >  
> >  #[pin_data]
> >  struct Regulators {
> > +    #[allow(dead_code)]
> >      mali: Regulator<regulator::Enabled>,
> > +    #[allow(dead_code)]
> >      sram: Regulator<regulator::Enabled>,
> 
> I don't think we intend to ever use these fields - they exist only for
> their destructor. In that case, please prefix them with an underscore
> instead:
> 
> #[pin_data]
> struct Regulators {
>     _mali: Regulator<regulator::Enabled>,
>     _sram: Regulator<regulator::Enabled>,
> }
> 
> Alice
