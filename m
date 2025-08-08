Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2BD265CC5
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643691; cv=none; b=mecl1Dx0xhQt1u6PSJZGJuOpnUkS9F+TqpiyF/RZ7eU0DIAVskKdnaIdr/3bUh/bPT77bb1YjXEu4ro0t0FhXuNeYauBV2K7BBg88epPb3bQYtnsRUdO09nOy3lNK4iCmC27e2zvo9et5V9HoMrcWWR/lmh77mmtvH/p2KE4jrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643691; c=relaxed/simple;
	bh=S5BbbIBMFeUFbhVaPxRSNFTw0qJPKwRkfes0nfiMt2A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mMPoBAbtgQkahA40glGEf1na3UHDnX1Cos15gLzhtWZcikRC22ss0Xou+SO7v3sP3oW5xm2MEIVJlXU9zxhY6A3OKIUdbPGxiwWu2qo8xj7aU2sjPlkCoAs/jar9LcsRTVBcDIvDBZWD+wSE8S7EeejaxUdmThLhUUZn816daTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zH2v3BAk; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zH2v3BAk"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b8d8935418so1198576f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 02:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754643687; x=1755248487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6hx28fY710hmZoCtY9ahIDUPzjy3OpjuLmB7MR5G0+g=;
        b=zH2v3BAkT80x+kOFvVoarcmDRXobGOzWMroobniNI+b+YFCXidrBUdOWNAyHQLaC/Q
         /FQ/fy/Mj6XcRMn4nHICjokz66qzuCEo5nmg4SWUwDhjJESHIP0AL1hiEex/qmmPhyWN
         g1c2ZeKjX7K/+AEUwTjmrFdHcalwSelKgWlQwPBQPZyUSZ0mnqDuQ+ZL5DW8TmG6t/V6
         Ik4vg18oMiPvcHSn9MoP2KhaX/zizcMElbUxlixnoQPu+JfjDgFL5kEXttipGK+gHVso
         ccgUd/lCzJTcj6qAPAkHZUJoNEUJBLTeBUFgmtEoYBXkc8RjznYt0+FWhit4e14vBwmO
         5oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643687; x=1755248487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6hx28fY710hmZoCtY9ahIDUPzjy3OpjuLmB7MR5G0+g=;
        b=n0AY3uhxgZa8TTWTe9b5Qb0M249Q4Dw3n2tn1CqHbztONly/ud875mDYYMlvHkPFuU
         I5nGeSVpPRfBFKpvT+XVdbL5HNV1PsXoQB/DiHOoSAG6ZGxZYn+Lm3ppkD4MZ3lSB+5h
         dXgsa5rTV8W8tV4J8WAlxMg4dzvbCY1aGstVU1jhax26shFlL2LmrjGCmL6nX3ZRDIN1
         jXmEWuRsOfwE3t9N667TQAPBE0zqFpZ4AtP9wUYAbO4dzIH3oCiMhwaWFuTL1eYuixax
         YOiRfkLY4yLHl69ccdcj/sq43Atq4iBdU2K1N1mEwoEke610aHf6XRXwuoy31m3B1dCV
         tjTA==
X-Forwarded-Encrypted: i=1; AJvYcCWtj0lGFdqVhi1g0BBdbyx4nVisLcTsYfBf+Y8yAWTUvvy3l+9X6Gbgtgh5m8UcvCjaihtVhyxjtTVFha1U6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzInNyS4fzw3al0AOc+RD0ktutpD2hu+yJkPDSOntI+sOOmEDGG
	ERdUPMvKe1uyirgpsBS/GRTs4nEUbUckaWanh/dEBoW735DcQQEvHr+DldSVk0DJUWwL+yl6T2Y
	quIHeDdwMD0+pu30OVg==
X-Google-Smtp-Source: AGHT+IGVMPGcjfQeO4iXzfFefGzFkTgDTQfi5FOkH2u+QnZpAFGbYE5Kja9UGZFhuBG1gDCKVyHoZXsb7yxPdmY=
X-Received: from wmbfa15.prod.google.com ([2002:a05:600c:518f:b0:459:d639:5949])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1885:b0:3b7:8146:4642 with SMTP id ffacd0b85a97d-3b900b5031cmr1618025f8f.20.1754643687418;
 Fri, 08 Aug 2025 02:01:27 -0700 (PDT)
Date: Fri, 8 Aug 2025 09:01:24 +0000
In-Reply-To: <DBWGKO6W6BK3.1ZTUQ8EI9LFJ7@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250807121011.2317762-1-vitaly.wool@konsulko.se> <DBWGKO6W6BK3.1ZTUQ8EI9LFJ7@kernel.org>
Message-ID: <aJW85LX_mp6pOBM6@google.com>
Subject: Re: [PATCH] rust: extend kbox with a new constructor
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 07, 2025 at 09:56:09PM +0200, Danilo Krummrich wrote:
> On Thu Aug 7, 2025 at 2:10 PM CEST, Vitaly Wool wrote:
> 
> Please start the patch subject with "rust: alloc:" and make the subject more
> concrete, i.e. name the constructor you add, e.g. "rust: alloc: implement
> Box::pin_slice()".
> 
> This makes things much more obvious when using 'git log --oneline'.
> 
> > From: Alice Ryhl <aliceryhl@google.com>
> >
> > Add a new constructor to KBox to facilitate KBox creation from a
> 
> NIT: You're adding it for all allorcators, hence "Box".
> 
> > pinned slice of elements. This allows to efficiently allocate memory for
> > e.g. arrays of structrures containing spinlocks or mutexes.
> 
> Sounds reasonable, can you please mention where this will be used?
> 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> > ---
> >  rust/kernel/alloc/kbox.rs | 51 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> > index 1fef9beb57c8..74877afab0a3 100644
> > --- a/rust/kernel/alloc/kbox.rs
> > +++ b/rust/kernel/alloc/kbox.rs
> > @@ -290,6 +290,57 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
> >          Ok(Self::new(x, flags)?.into())
> >      }
> >  
> > +    /// Construct a pinned slice of elements `Pin<Box<[T], A>>`. This is a convenient means for
> > +    /// creation of e.g. arrays of structrures containing spinlocks or mutexes.
> 
> Please add an empty line after the first sentence.
> 
> NIT: "slices of structures"
> 
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// #[pin_data]
> > +    /// struct Example {
> > +    ///     c: u32,
> > +    ///     #[pin]
> > +    ///     d: SpinLock<Inner>,
> > +    /// }
> > +    ///
> > +    /// impl Example {
> > +    ///     fn new() -> impl PinInit<Self> {
> > +    ///         pin_init!(Self {
> > +    ///             c: 10,
> > +    ///             d <- new_spinlock!(Inner { a: 20, b: 30 }),
> > +    ///         })
> > +    ///     }
> > +    /// }
> > +    /// // Allocate a boxed slice of 10 `Example`s.
> > +    /// let s = KBox::pin_slice(
> > +    ///     | _i | Example::new(),
> > +    ///     10,
> > +    ///     GFP_KERNEL
> > +    /// )?;
> 
> How would a more complex example look like where the slice items are not
> identical, i.e. the impl PinInit<T, E> objects returned by the FnMut?
> 
> Do we need a temporary Vec for this? If so, it would probably make more sense to
> have the following signature.
> 
> 	pub fn pin_slice<F, I, E, Arg>(mut init: F, &[Arg], flags: Flags) -> Result<Pin<Box<[T], A>>, E>
> 	where
> 	   F: FnMut(&Arg) -> I,
> 	   I: PinInit<T, E>,
> 	   E: From<AllocError>,
> 
> 
> Where Arg is some generic type containing the arguments passed to the closure
> to create the impl PinInit<T, E>. For the example above Args could just be ().

Forcing the user to construct an array of the appropriate length seems
unfortunate. Right now we provide the index being initialized, which you
can use to index an array if that's what you want.

I used a temporary Vec because its destructor does the right thing we if
exit early on error.

Alice
