Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6760054658
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Sep 2024 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726728114; cv=none; b=NVQvB51OpVR7Y15fdKOydoxRO0ViZBORYWGqGRoRJ/Gho/pMmp0ZokAvJQDAwtBaTn7gDw8WKPL3J1V6rfp6Bs/D7ByOJciITkFntouy4CD3QmmSfkq1NapbTQKRofRY9PUgvNc4nQYY5fRDYMbm664ErrHqHtPZADUV8r1mJC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726728114; c=relaxed/simple;
	bh=e4Nu5MGmGZequOr+3wn9e4KbQgdR2rd2ZaJgzM1jll8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQQvcJ5ekv7BT8iLyRO7AA1TvFIcCED0F9bDCYsXXmJK+6887jx9FrazR4PKebfyYlcDQWBcki+kDIbQrQnetW04J7UW306xY5pwGPCslWQQ2GaEeKbPyGqmpWC5fWMkQ0KBV5Zt6Ywhwa9wpUmXe6KCvZC2ANy0Q4qXVa6G61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dJrx8AGn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dJrx8AGn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso5522665e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Sep 2024 23:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726728111; x=1727332911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWdqrGJZj3KqeR7dMvmtNPPn0JD8u6tlo67ak5aubqY=;
        b=dJrx8AGnuClOsCH7mxmHdkx6M1tlgJzOXE2gS8rkHkSIkYFJn/ti0rcgonrDhTdpdw
         KIFcZXV3Rb2BByHjtkEvmnsrR467HHyfIb6Jq+hIHqgMcMNjt5hNb03L8Tzhv830O727
         bsAxTUsWE2tZ2rwzsDV4lEWkpUbV9vpbJJPInOvGg+5UfS0/87c2CMKBUcx+LRlquG2Q
         nci9+1Hwb4dirRwWFdwPG0aqLIPqho7a7Thr/yTBDrYMp3vrG2Jmfe6e5JbR0jva60sN
         NA8GtyHI2+O2Z2fkAkKxfv17gpu0vSul6QBO+yWHiVJkUYdCo5lfL569CZ8bTIPRwwI8
         qF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726728111; x=1727332911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWdqrGJZj3KqeR7dMvmtNPPn0JD8u6tlo67ak5aubqY=;
        b=szGVHRc+v/Zhr3TDYeVCNGj8U37Lfl5apZnK792ANnjTW/XPs7/0d1MCGGWuMlUPZl
         VCk6pl7eYIKHJhEnY78LAWx5Af9o7oQGRr8AAYva7yBuQdI8DVW2IimAnz7XugJWw1Sd
         reBawVfn9/AJ6FICE5GnUMW2FOrnq7gVm4Ue5ePwsd92aqQjV7fSt61+61DR/+LYKulq
         V2Kwb6CrCCYMTRbpHziYPgg9DRnY7FmdGmryRQncTR/DULnNxI75MnICwgjtFJAWEhA+
         Mo8PF5T3M7ZQsCqDb5FWCl5lB7QWG8oIlYcgHNCwLGQpmswpA9F7fhE7PxKJDM7xzPd1
         AZtg==
X-Forwarded-Encrypted: i=1; AJvYcCWTM9Y8xdgMEpzsQrYsHcCsFVo0WtsB+y6mERzXAiU7seed0xcePuthEN+Fxni4T+QRcLzkRBmqGcnjqjU2+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzlOfhul6IyoYOj8JGUX9DbfR03/ab89Q/JNh3hc+UvsytN3jN
	Y6K0NCVRPvkjXaueyzUznTXwcCWrInSchZgRN61k6U3lWaKLFEmiPJeKgmXUX9jx6R3PTlR8hFT
	ftnrL9a/fBi1FgTkU7D4rTwoSgSgq+rgbzElC
X-Google-Smtp-Source: AGHT+IEAY6SNMgMRXWCLfhmIRUzjKDV0SG60S0x4zyYpYl2/gWmxNOGZKQIUMkh2I62LrYx87ycjwgfX01cHn2EFbf4=
X-Received: by 2002:adf:e546:0:b0:374:ba2b:4d1c with SMTP id
 ffacd0b85a97d-378d61f09cfmr17330821f8f.31.1726728110548; Wed, 18 Sep 2024
 23:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917222739.1298275-1-a.hindborg@kernel.org>
 <20240917222739.1298275-5-a.hindborg@kernel.org> <uQyhqKNsbshVFUyAbdqOai1BfuYEl6ygcM8T-tTRf2rvmh6yIVNKqODmQavLegAedRUKVZ8JZoe7O-obhoz3Uw==@protonmail.internalid>
 <43b9bc9b-f64c-4421-8cf2-795f1f0ec94a@proton.me> <874j6cjiip.fsf@kernel.org> <87v7ysi2sd.fsf@kernel.org>
In-Reply-To: <87v7ysi2sd.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Sep 2024 08:41:37 +0200
Message-ID: <CAH5fLgjLf4nqH2m_VkB4kXzhuuN21wDF1BOd49qYLMR2R_E=kA@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] rust: sync: add `Arc::clone_from_raw`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 8:19=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
> > "Benno Lossin" <benno.lossin@proton.me> writes:
> >
> >> On 18.09.24 00:27, Andreas Hindborg wrote:
> >>> Add a method to clone an arc from a pointer to the data managed by th=
e
> >>> `Arc`.
> >>>
> >>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >>> ---
> >>>  rust/kernel/sync/arc.rs | 20 ++++++++++++++++++++
> >>>  1 file changed, 20 insertions(+)
> >>>
> >>> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> >>> index a57ea3e2b44c..2c95712d12a2 100644
> >>> --- a/rust/kernel/sync/arc.rs
> >>> +++ b/rust/kernel/sync/arc.rs
> >>> @@ -282,6 +282,26 @@ pub unsafe fn from_raw(ptr: *const T) -> Self {
> >>>          unsafe { Self::from_inner(ptr) }
> >>>      }
> >>>
> >>> +    /// Clones an [`Arc`] instance from a pointer to the contained d=
ata.
> >>> +    ///
> >>> +    /// # Safety
> >>> +    ///
> >>> +    /// `ptr` must point to an allocation that is contained within a=
 live [`Arc<T>`].
> >>> +    pub unsafe fn clone_from_raw(ptr: *const T) -> Self {
> >>> +        // SAFETY: The caller promises that this pointer points to d=
ata
> >>> +        // contained in an `Arc` that is still valid.
> >>> +        let inner =3D unsafe { ArcInner::container_of(ptr).as_ref() =
};
> >>> +
> >>> +        // INVARIANT: C `refcount_inc` saturates the refcount, so it=
 cannot
> >>> +        // overflow to zero. SAFETY: By the function safety requirem=
ent, there
> >>> +        // is necessarily a reference to the object, so it is safe t=
o increment
> >>> +        // the refcount.
> >>> +        unsafe { bindings::refcount_inc(inner.refcount.get()) };
> >>> +
> >>> +        // SAFETY: We just incremented the refcount. This increment =
is now owned by the new `Arc`.
> >>> +        unsafe { Self::from_inner(inner.into()) }
> >>
> >> The implementation of this function looks a bit strange to me, how abo=
ut
> >> this?:
> >>
> >>     // SAFETY: this function has the same safety requirements as `from=
_raw`.
> >>     let arc =3D unsafe { Self::from_raw(ptr) };
> >>     let clone =3D arc.clone();
> >>     // Prevent decrementing the refcount.
> >>     mem::forget(arc);
> >>     clone
> >>
> >
> > We do not own
> > a refcount on the Arc. For a short duration you will have a wrong
> > refcount. If you have two Arcs and the refcount is 1, the ArcInner migh=
t
> > be dropped after the first line of this suggestion, before you do clone=
,
> > and then this is not sound.
>
> Well, disregard that. This is why one should not reply to emails before
> coffee in the morning.
>
> Of course, a precondition for calling this function is that the arc
> containing the data pointed to by `ptr` is live for the duration. So
> what you wrote would work. But I still do not like having two `Arc`s in
> existence with the wrong refcount.

Doing it this way has been pretty standard with std for a long time,
until the Arc::increment_strong_count and similar methods were added.
I think it's fine, though I would have used ManuallyDrop instead of
mem::forget.

Of course, in this particular case, using `ArcBorrow` is even better.

Alice
