Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87EB12883A
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Apr 2024 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712239268; cv=none; b=JdrLCz4Rg5WTVXJCmFut/ehe0LF8zLcjBwbZo4oacPOB1C7LI18paL3eLrxgupxWDGCOQ5GMs3lnQwnsbr39iL81nHvXdQKNQZdkpApPIXKkc+qkV3k2E8c79xy6eImV9MonJGMv1c7q6cMnPxxCNNlSnfK/mZ+FbaVdz0eE2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712239268; c=relaxed/simple;
	bh=udVQSjhfnqy52V1XS3ehV4LRge6VDAk7Xg6f3XGDtsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEnLt6x0f0DOIaWdfmy6LFeMQ34W3lqV/xy28D/XNJpiwiUWDD4RtRTOkWmM6nXHP0zUNPO9zytrILK/3KioDsxYiZK3gV8sRqrVrlhIKZnSmeQva59AmaTGruaWKbFTTBsJ4z1mWPrhfD3RwFfRakSqdhtgJ3UYTk3Emo+1NCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JAIO5Z0l; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JAIO5Z0l"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7e057fb0b69so330581241.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Apr 2024 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712239265; x=1712844065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tyEmoQXrb2vn5ihqj4opABMTJZwudykixVbhG5rjFw=;
        b=JAIO5Z0lN+FMY8KriBO1L5F4biqddFWpFsvsRLnRKkgpW/+uFMH6Y7gJLFhnAi2YJr
         JxDLmzUj54hoFMfz8A05+joT1aduHrpVoa5vFirhvYv7xTpTwel7JlzPhk1Et9+g28kT
         q533raz+09LY6/vQWYvtr0BnpxaRw987BRxN3U5rkgM4L/OfOWQVKul2pGB32Xe0cQ+U
         C/0NDB1/xOLOQ1i73JPobVhI5lOXlpMRD/qYcq43kLPgcA77iaTJya8z5SbEu6Dw2FZn
         ZeZH7GaI65SxPqHsB/4fUprqpbp+frjmHE4dAT2g6ESN5TOA0zmX68bDraUduC5wU4Cd
         hH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712239265; x=1712844065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tyEmoQXrb2vn5ihqj4opABMTJZwudykixVbhG5rjFw=;
        b=h6ErYNV+JOuWWfV1zs9fHc13n8VXmohrM1hA6LpPFNMUFciHDIdbet9wh8KNfz/sLH
         rImPw4gx1fm7RFnnaXssoX9d01Uy/fd+Jw6tH7Cb/4sWFOyzTYFGFLEpESr/o/nXOE7g
         500wbTKZwf4zO4fSAV7heNRWzpfprnixvusVkBrB/u7rVY76i7A+6tusIzJC74tJGFp6
         +ivzWfZhtXDaWKIWvmC5j/sX650OiOTdysNfSePP91c1kDHJzpPGORd8zNYXaA3gCyLV
         sczDuq4t+KEslAQODXUFMTezVMCfZ1OT065QwEKePEg91VFExAsF+OYQ1VTnSzVwHJX0
         SpDg==
X-Forwarded-Encrypted: i=1; AJvYcCWlH9HqC8SHfjSWqgqsDsf8LGQw02r2YI9nFZo8+eCL5D6v4oglzE2gEOKjQ5rcGVQQa21H/lafKsimLAgcyyZjI3Jt+jIFHGPFrhdB2wo=
X-Gm-Message-State: AOJu0YysMOU1HOhtrhU9COq6WvgN7+pqmIQ78uvBezkaWVnFWHEulW2K
	EG4SXh9QVHd5zSzcpUNeSw2HDb+kmBteAMGZ1BakTUZWj2mHZM9ArcBAlwlGqo3bR4f5RmhP7wq
	omjSTvqe4B1pA7TswqQbeZZOs1u1ob8wgPKcD
X-Google-Smtp-Source: AGHT+IHuf1JaoB9Kt4ln2E4Z2CuYaFwp+MyoMrdetoJGO8NiLwRIu6qbZt3P3mTkRUo42hJ0+bU9hJU64Uy7WfWyC7g=
X-Received: by 2002:a05:6102:2455:b0:476:e72e:271d with SMTP id
 g21-20020a056102245500b00476e72e271dmr2127513vss.13.1712239264885; Thu, 04
 Apr 2024 07:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
 <20240402-linked-list-v1-1-b1c59ba7ae3b@google.com> <2f25f21e-fad8-48bb-aa2b-d61bf8909a41@proton.me>
In-Reply-To: <2f25f21e-fad8-48bb-aa2b-d61bf8909a41@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Apr 2024 16:00:53 +0200
Message-ID: <CAH5fLgjqyfExjckh7KnSLnT+Ok+yjcoJ+DpDkj0gUZRmoz=M8Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] rust: list: add ListArc
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, 
	Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 5:51=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 02.04.24 14:16, Alice Ryhl wrote:
> > +impl<T: ListArcSafe<ID>, const ID: u64> ListArc<T, ID> {
> > +    /// Constructs a new reference counted instance of `T`.
> > +    pub fn try_new(contents: T) -> Result<Self, AllocError> {
> > +        Ok(Self::from_unique(UniqueArc::try_new(contents)?))
> > +    }
> > +
> > +    /// Use the given initializer to in-place initialize a `T`.
> > +    ///
> > +    /// If `T: !Unpin` it will not be able to move afterwards.
> > +    pub fn pin_init<E>(init: impl PinInit<T, E>) -> error::Result<Self=
>
> > +    where
> > +        Error: From<E>,
> > +    {
> > +        Ok(Self::from_pin_unique(UniqueArc::pin_init(init)?))
> > +    }
>
> pin-init has a general trait for this: InPlaceInit. I don't know if the
> other functions that it provides would help you.

I will use that.

> > +}
> > +
> > +impl<T, const ID: u64> ListArc<T, ID>
> > +where
> > +    T: ListArcSafe<ID> + ?Sized,
> > +{
> > +    /// Convert a [`UniqueArc`] into a [`ListArc`].
> > +    pub fn from_unique(mut unique: UniqueArc<T>) -> Self {
> > +        // SAFETY: We have a `UniqueArc`, so there is no `ListArc`.
> > +        unsafe { T::on_create_list_arc_from_unique(&mut unique) };
> > +        let arc =3D Arc::from(unique);
> > +        // SAFETY: We just called `on_create_list_arc_from_unique` on =
an arc without a `ListArc`,
> > +        // so we can create a `ListArc`.
> > +        unsafe { Self::transmute_from_arc(arc) }
> > +    }
> > +
> > +    /// Convert a pinned [`UniqueArc`] into a [`ListArc`].
> > +    pub fn from_pin_unique(unique: Pin<UniqueArc<T>>) -> Self {
> > +        // SAFETY: We continue to treat this pointer as pinned after t=
his call, since `ListArc`
> > +        // implicitly pins its value.
>
> This is not sufficient, since you also rely on `Self::from_unique` to
> handle the parameter as if it were pinned, which it does not. Since it
> calls `T::on_create_list_arc_from_unique` which just gets a `&mut self`
> as a parameter and it could move stuff out.

I'll swap these so that from_unique calls from_pin_unique instead.
I'll also change on_create_list_arc_from_unique to take a Pin<&mut
Self>.

> > +        Self::from_unique(unsafe { Pin::into_inner_unchecked(unique) }=
)
> > +    }
> > +
> > +    /// Like [`from_unique`], but creates two `ListArcs`.
> > +    ///
> > +    /// The two ids must be different.
> > +    ///
> > +    /// [`from_unique`]: ListArc::from_unique
> > +    pub fn pair_from_unique<const ID2: u64>(mut unique: UniqueArc<T>) =
-> (Self, ListArc<T, ID2>)
> > +    where
> > +        T: ListArcSafe<ID2>,
> > +    {
> > +        assert_ne!(ID, ID2);
>
> Can this be a `build_assert!`?

Most likely.

> > +
> > +        // SAFETY: We have a `UniqueArc`, so we can call this method.
>
> I liked the comment from above better:
>
>      // SAFETY: We have a `UniqueArc`, so there is no `ListArc`.
>
> Maybe use the variation "so there are no `ListArc`s for any ID.".

Will do.

> > +        unsafe { <T as ListArcSafe<ID>>::on_create_list_arc_from_uniqu=
e(&mut unique) };
> > +        // SAFETY: We have a `UniqueArc`, so we can call this method. =
The two ids are not equal.
> > +        unsafe { <T as ListArcSafe<ID2>>::on_create_list_arc_from_uniq=
ue(&mut unique) };
> > +
> > +        let arc1 =3D Arc::from(unique);
> > +        let arc2 =3D Arc::clone(&arc1);
> > +
> > +        // SAFETY: We just called `on_create_list_arc_from_unique` on =
an arc without a `ListArc`,
> > +        // so we can create a `ListArc`.
>
> I would mention the two different IDs again.

Sure.

> > +        unsafe {
> > +            (
> > +                Self::transmute_from_arc(arc1),
> > +                ListArc::transmute_from_arc(arc2),
> > +            )
> > +        }
> > +    }
> > +
> > +    /// Like [`pair_from_unique`], but uses a pinned arc.
> > +    ///
> > +    /// The two ids must be different.
> > +    ///
> > +    /// [`pair_from_unique`]: ListArc::pair_from_unique
> > +    pub fn pair_from_pin_unique<const ID2: u64>(
> > +        unique: Pin<UniqueArc<T>>,
> > +    ) -> (Self, ListArc<T, ID2>)
> > +    where
> > +        T: ListArcSafe<ID2>,
> > +    {
> > +        // SAFETY: We continue to treat this pointer as pinned after t=
his call, since `ListArc`
> > +        // implicitly pins its value.
> > +        Self::pair_from_unique(unsafe { Pin::into_inner_unchecked(uniq=
ue) })
> > +    }
> > +
> > +    /// Transmutes an [`Arc`] into a `ListArc` without updating the tr=
acking inside `T`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// * The value must not already have a `ListArc` reference.
> > +    /// * The tracking inside `T` must think that there is a `ListArc`=
 reference.
> > +    #[inline]
> > +    unsafe fn transmute_from_arc(me: Arc<T>) -> Self {
> > +        // INVARIANT: By the safety requirements, the invariants on `L=
istArc` are satisfied.
> > +        // SAFETY: ListArc is repr(transparent).
> > +        unsafe { core::mem::transmute(me) }
>
> Why do you need a transmute here? Can't you just construct the struct?
>
>      Self { arc: me }

Yeah, I guess that works.

Alice
