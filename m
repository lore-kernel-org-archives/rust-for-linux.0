Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154B81FCFC0
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737971123; cv=none; b=Jx9ojxwCJDnukUw+sxf/mA1C1HXh6qVbsr/42+aCrGr+wLoTlyMkSetqH66Ih7osDU9YQXREABsy/oMa9Buto8eDO19NTFfqM6AvWbOlr3WkDnAKmJPbi08RbA4+VLWNV4Zq+yVsNxs7zFt7gKzZ984KTbRuNMk+rm1lkhTOfxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737971123; c=relaxed/simple;
	bh=vQ3gmIZqaNW1g/LT+/j4YlDwXHe3djbAtV5fO8bABQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXi2lf5gG0xLbB1vtQQHF9A1czXyas/74q93rqRo2uxVxSAoqC4rIlVa8Q9/4nyfXRFSbq/srYahmcT+/2OZyocd5vQJhWPGvmd3oAqhWV+56dR63Rk7F0qNpHLAoJ95JKPAsURNr+HfH/mhTdlnujlIk8Tu7hQ6b/CJPPSpYso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P5LhVtz3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5LhVtz3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a34e8410bso2075006f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 01:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737971119; x=1738575919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWfgF91HXh+KWhnSvXw9sos0v6cTulWAKwLbp0WnDlU=;
        b=P5LhVtz3BYK0kiZgFni6YeDdR/KHCfSrckMEDQabH2xF1+AdpsIAOXAVlZTQh+iWei
         fK0WPYDMiZfbztpI5myXT0To7YkIV4/lDl0Q91Gh6N6SdEE4mVOT/ezqHeCn1tv18ptp
         U5eEjmdgbOy6Y29KRHz3Ph+FSAbTbtClcZK8EFwk7N4VsGI8TnwamHUnn26vPs3it9WL
         wE2cigkTcREfr60XiW682QERIQ/qxJWPMcDpV4XMcxFjYGhaVjEfkqXVJG2DF6qqF616
         nTzpknzFLWSmPKZGgQZtgwhfXVVhBYlvnIcctJtlIyLUtZ+y+iQpDhSmEO4XRmemf6wk
         OQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971119; x=1738575919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWfgF91HXh+KWhnSvXw9sos0v6cTulWAKwLbp0WnDlU=;
        b=FuJXKwLXn2q3ubTQmc7LWQ/TIisVFwuimeQI0nM/wBDsKyXZy0NbA/kzDX4+0bVE9z
         2nMIIztHZcRaF6BjtbGoX4k+KkoeTpa6cisyBGoUjRY1DE4n/rvaSqdbRJ2+ekUh7ofj
         dVWBeFCe6+GljMxQ8t9MHt9HnsW2GBt6ifr1VWaEpU5y75z78zRAbkT9xKbCYxvWw2IO
         8nYK9gqGbJcOr6sKBIQeAm360Xe5lF1XRrGjD8ap4Iw3mfvxgMklqmzV3KTmmcSOjUZg
         M7a226pD6Fln5ZrBmW4VBIgGIuOoYaN6WXUa85Huttfdf8s8Fo/ogfmuU/OdsCz5//vy
         kUuA==
X-Forwarded-Encrypted: i=1; AJvYcCVexl6IYCtl+Hu6t2fJJdnLRb8U7tkrFAccrVo7VE31AzmitOgPKkUZ9jzkLrzolBO6DK2AHLNOnlPYuMPb5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQvhyhkubES86F89bmEGcgbQ+swxZmjR8XnhLGIDXog4rCNmaQ
	UTO50rNUNMHiDASSRXy1PbtSEGwXVYTfOJJSVSqidmH9HsdDesYqfJNL9+joM+dJPWxuCaq6Zur
	R6Q+kl91WxO8pY42xg41Zm6n8oCazAYLEVV2a
X-Gm-Gg: ASbGnctSgDNLGm9rPlLlSe9jmyEOuhBrq9kAQhovG7G6kMQ83yv/nA4n1rhz6WLhz61
	53sN0OyoFMbYV2WE357bFRBwYTyrdNR2ohBonCwMY9GKMufzWDbyL2mN5cghwLhp401FJbvD9qc
	YIOYgey4V22UA3Rzmg
X-Google-Smtp-Source: AGHT+IEXkLLN3S3MMw4xRiFR1Y8MHCtfk58zMT4UAb6q3UkIxnbgrIDMMRrud/wsyj6Dp4vZezgOZE+N4vP5xJk59zI=
X-Received: by 2002:a05:6000:1864:b0:386:3328:6106 with SMTP id
 ffacd0b85a97d-38bf59e199cmr43026813f8f.35.1737971119189; Mon, 27 Jan 2025
 01:45:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com> <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <20250127071625.1882afa4@meshulam.tesarici.cz>
In-Reply-To: <20250127071625.1882afa4@meshulam.tesarici.cz>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 10:45:06 +0100
X-Gm-Features: AWEUYZlHQHrC2gBJEuAbWTkeobjQJsyNv5yQQrQaI_rFXqTf4MZLW4pDDd9H1bE
Message-ID: <CAH5fLgic6kdOQyw+=S49p4rVnA7x6maKPVakd1uqA5fkGxZiXA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, dakr@kernel.org, robin.murphy@arm.com, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 7:16=E2=80=AFAM Petr Tesa=C5=99=C3=ADk <petr@tesari=
ci.cz> wrote:
>
> On Fri, 24 Jan 2025 08:27:36 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Thu, Jan 23, 2025 at 11:43=E2=80=AFAM Abdiel Janulgue
> > <abdiel.janulgue@gmail.com> wrote:
> > >
> > > Add a simple dma coherent allocator rust abstraction. Based on
> > > Andreas Hindborg's dma abstractions from the rnvme driver, which
> > > was also based on earlier work by Wedson Almeida Filho.
> > >
> > > Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> >
> > Overall I think it looks pretty good, but a follow-up from our
> > discussion the other day.
> >
> > > +    /// Returns the device, base address, dma handle, attributes and=
 the size of the
> > > +    /// allocated region.
> > > +    ///
> > > +    /// The caller takes ownership of the returned resources, i.e., =
will have the responsibility
> > > +    /// in calling `bindings::dma_free_attrs`. The allocated region =
is valid as long as
> > > +    /// the returned device exists.
> > > +    pub fn into_parts(
> > > +        self,
> > > +    ) -> (
> > > +        ARef<Device>,
> > > +        *mut T,
> > > +        bindings::dma_addr_t,
> > > +        crate::ffi::c_ulong,
> > > +        usize,
> > > +    ) {
> > > +        let size =3D self.count * core::mem::size_of::<T>();
> > > +        let ret =3D (
> > > +            // SAFETY: `&self.dev` is valid for reads.
> > > +            unsafe { core::ptr::read(&self.dev) },
> >
> > This safety comment should explain why this will not lead to
> > decrementing the refcount too many times. Which is because this
> > doesn't actually duplicate the ARef due to the use of mem::forget.
> >
> > That said, I think wrapping self in ManuallyDrop is slightly easier to
> > read than using mem::forget. I refer you to this pattern from Tokio
> > that solves a similar problem:
> > https://github.com/tokio-rs/tokio/blob/ee19b0ed7371b069112b9c9ef9280b81=
f3438d26/tokio/src/sync/rwlock/owned_write_guard.rs#L38-L51
> >
> > > +            self.cpu_addr,
> > > +            self.dma_handle,
> > > +            self.dma_attrs.as_raw(),
> >
> > Why not return the Attrs type instead of an integer?
> >
> > > +            size,
> > > +        );
> > > +        core::mem::forget(self);
> > > +        ret
> > > +    }
> >
> > > +    /// Reads data from the region starting from `offset` as a slice=
.
> > > +    /// `offset` and `count` are in units of `T`, not the number of =
bytes.
> > > +    ///
> > > +    /// Due to the safety requirements of slice, the data returned s=
hould be regarded by the
> > > +    /// caller as a snapshot of the region when this function is cal=
led, as the region could
> > > +    /// be modified by the device at anytime. For ringbuffer type of=
 r/w access or use-cases
> > > +    /// where the pointer to the live data is needed, `start_ptr()` =
or `start_ptr_mut()`
> > > +    /// could be used instead.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// Callers must ensure that no hardware operations that involve=
 the buffer are currently
> > > +    /// taking place while the returned slice is live.
> > > +    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Re=
sult<&[T]> {
> >
> > You were asked to rename this function because it returns a slice, but
> > I wonder if it's better to take an `&mut [T]` argument and to have
> > this function copy data into that argument. That way, we could make
> > the function itself safe. Perhaps the actual copy needs to be
> > volatile?
> >
> > Well ... I understand that we did this previously and that we want to
> > avoid it because it causes too much reading if T is a struct and we
> > just want to read one of its fields. How about an API like this?
> >
> > dma_read!(my_alloc[7].foo)
> >
> > which expands to something that reads the value of the foo field of
> > the 7th element, and
> >
> > dma_write!(my_alloc[7].foo =3D 13);
> >
> > That expands to something that writes 13 to field foo of the 7th elemen=
t.
> >
> > Thoughts? I'm proposing this to avoid going in circles between the
> > same solutions.
>
> I don't have a strong opinion, but maybe you could elaborate a bit on
> what exactly you dislike about as_slice() / as_slice_mut().

The as_slice() method is unsafe as currently defined. The purpose of
this proposal is so we can have a method that is not unsafe.

Alice
