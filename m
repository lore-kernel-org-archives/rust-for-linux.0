Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6603120764A
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312273; cv=none; b=IADoc1nrrL36gAmjw/w+J4bE0E3N2h9goN5fLgmo+HdSiNqAOwcW2BJ53uObx52RclcA41k1OAyUldw2Lf0fu0y47ik+tEI5urYVKw2XivDvWN+qH8lZed7a4MKk1+s/upWb0reH4D9d/9C+OfgWljGIvXMCuvUeTBrtC4RPUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312273; c=relaxed/simple;
	bh=/Je5UXiwOWqz6f08s+PYQFTOWZkBEsyOwgm9HBPZxO4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iaYGM1r0Ds+nzKOzbsXYvTSWuzQ7Tj9E0l0VN64vLYCtCZJD4xhm830sBqRkBKzQqcdB1iQGTu/hRWf5sDujRj7VhaQXHZkvtbSacbt1m9fRIq9IrbQ4Z3QldWp6o+quZbSKEPN58vkQFcDs35IxIhTtskUJNGqrgvPvAwvnX3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2+6o0UAI; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2+6o0UAI"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-438e4e9a53fso22030375e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Mar 2025 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742312267; x=1742917067; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0W8HnfzAxnHkec7vQ+j5syBypIsUG+kdLlAbbpLVR5U=;
        b=2+6o0UAIk/2hvU4i6x8Gsthw2vQA71VZsm7IN56tPgz2A41XaPHgmUNjoaCMlPWQkk
         N/W7f8LSx/szjCOsnHSYZO2hGlDEaBiFyM1vOh3jKtDduxe8h7dHElflVviQ02R38v1S
         1E+qqBxEaoEJ4eD6RpjkuK3x/sSMrWUgvLzDo9fSwNLqMZZxXLUvxntFnb/yBOO8YKGt
         e+KhCoQKMaHFj7uq4hosVY/Ird5DQp3g7XkgGfE/8zaXJPeWnCRvVRlUZ8RT7t5umQcK
         LSlm7Nxcn/jR0HtjlOWUTd1zn9qrzMfWDNkP8o9VdrIUV85mzfE3XtQCgvDSUn2tsBYZ
         y+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312267; x=1742917067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0W8HnfzAxnHkec7vQ+j5syBypIsUG+kdLlAbbpLVR5U=;
        b=smAWZ+XTkiLLBn8qFvCxeCLqR1oydRybUV8kqqA22SR+rEuc0/4r2kzSrMUhgHmfA1
         OfouIQQt+SpUzrA8XhucQNnJnWtNgYSUlkqZcXUG9Ov31Ef7wQHKSiry+ipztMVY/xzS
         e30SvShsO8+Z8yf/uzMzuP7GVNEahOF6t57ovJu+Gy3Nm8nsuM1vgL1VJO1ZSc1aRFZe
         Huc5vMtF3sw9HBFaLs0IvBC5Dlpm+rK4ArTyvdMgmpK+AkhuDxf3Y1yecFlrhrLNVDid
         a5CTeM4+Z9ZuR6PDX8VeWkYZKma44+asP0AaMuVstbxgfLBULySc+pcDDEyeFXaZXW8G
         qTWw==
X-Forwarded-Encrypted: i=1; AJvYcCV7EvVmBWhNM00gFg3byi195/kWb27Tl6WnkaDM1GTYjUuXzPkNPWwW72nc+daET8ZGwVjLcLTX8PgItD+vng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEeN5rAc4LaAkNYhB/jFaOO8NRkiTChqBCaU5PLRis8eiC3nFu
	oD88PnQcVjSW7/w5zkd4D09ivCH1SD12ULF+hjaEpWSh1PuP4J89Xp+AVTwAnO8BWqrqheWDH8r
	Cp9dg/3+3arytRw==
X-Google-Smtp-Source: AGHT+IGA0qJ6PYrRhjzrqDj0mSaeJEyUJhZzeOOnoV2qfnSov2tcHVx0g2ACLAhAFvFXBUJ9xLW5yU4GNF2hCAk=
X-Received: from wmbez8.prod.google.com ([2002:a05:600c:83c8:b0:43c:fce2:1db2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b97:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43d3b951b2cmr29925335e9.3.1742312266727;
 Tue, 18 Mar 2025 08:37:46 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:37:44 +0000
In-Reply-To: <87senajxlv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250317185345.2608976-1-abdiel.janulgue@gmail.com>
 <UiefwZ9WcVV7q7YyERsbNIYqOxTWUWEO9aZNxThH7uRFkjE4LDSUtaVdiLeShk_JYe5RJLD5MgFC9IxGUuzTEw==@protonmail.internalid>
 <20250317185345.2608976-3-abdiel.janulgue@gmail.com> <87senajxlv.fsf@kernel.org>
Message-ID: <Z9mTSNj23fLlBbSF@google.com>
Subject: Re: [PATCH v15 02/11] rust: add dma coherent allocator abstraction.
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, dakr@kernel.org, robin.murphy@arm.com, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, linux-kernel@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 18, 2025 at 02:07:40PM +0100, Andreas Hindborg wrote:
> "Abdiel Janulgue" <abdiel.janulgue@gmail.com> writes:
> 
> [...]
> 
> > +/// Possible attributes associated with a DMA mapping.
> > +///
> > +/// They can be combined with the operators `|`, `&`, and `!`.
> > +///
> > +/// Values can be used from the [`attrs`] module.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::device::Device;
> > +/// use kernel::dma::{attrs::*, CoherentAllocation};
> > +///
> > +/// # fn test(dev: &Device) -> Result {
> > +/// let attribs = DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_WARN;
> > +/// let c: CoherentAllocation<u64> =
> > +///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, attribs)?;
> > +/// # Ok::<(), Error>(()) }
> > +/// ```
> > +#[derive(Clone, Copy, PartialEq)]
> > +#[repr(transparent)]
> > +pub struct Attrs(u32);
> > +
> > +impl Attrs {
> > +    /// Get the raw representation of this attribute.
> > +    pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> > +        self.0 as _
> > +    }
> 
> OT: I wonder why we do not have `usize: From<u32>`? It seems like this
> should be fine, even on 32 bit systems?

usize only implements From<unn> when it would work on all concievable
platforms, so it's missing for u32 due to 16-bit platforms.

Alice
