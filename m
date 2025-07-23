Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CBE1ADC7E
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282926; cv=none; b=KrFD/rvDZfkf0PXFq9x4v7QWbWY7sAIGeS2t7vFG8VGTCgRwNaoNW20fcouNKZOZnRDvXbsG/4O+mqZLIuuq5mDagkNWv0NWYV/tUNuVW5xjkF5yEtOz6wvxEkHBUd1nT5rL/vLHUlWqa7PoGpVuZtk52NgZyMQOe65MikHOy1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282926; c=relaxed/simple;
	bh=iE1aBZYKqQwEYNiRMnq//IWDWufJ3w5YS/WloRgwiBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mn3GkaahlxZ+6j/A4jrd7rkbCMFLt5/cr/xTsQK1J3gcok22quN9ObbS4g6LTfFKczC80Je5goDMYOn0u06P0aZb5S90XNB/boCJD6Ucf1OKXi3LlYjZUC7nT5x+fKxRwNdUZukoA11Ng7OgkVOHrxZPw1nnzXXxfsPzZ1SFA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mY8ORgke; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mY8ORgke"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-455b00339c8so49098985e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753282912; x=1753887712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkED1IFnrdQOrvPX+FEDqQyJbbz8ySr0pcHO2vzmZv4=;
        b=mY8ORgkeMqot4uEjGnYMYmtPMYFU4yXkUjVRzbrGVaArMpIR5Bz+YFf/Ad3QNZQ5rP
         5YpAoMUNAlKRE1/FZQxTjcE68GVbvBi/4douPtk1XB5wvozcRDHC1LeNXKofDSmMnbFf
         esPoTpKXproQ1BR/qhYRoV24aW9JbAcUfzyiP6m//5U31+NP3y82NwDKULklwCWkvDJ9
         LDdC5LJwfPO+m/i25r5JMaB3vIzFT/ug6iY85ZlIfnTCZsxhoDGk3mQMC7x0vU5MZwBK
         MnwM9V9EC8Hlz9j3nLnZkr0h2dtoQ0mYvrct+pGQjtrex0PV6+NM/4LCTCPwyBrj6cvH
         s1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282912; x=1753887712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkED1IFnrdQOrvPX+FEDqQyJbbz8ySr0pcHO2vzmZv4=;
        b=eJan+t1dl4vfyWYfQ+Zz5vI5mfJTbtY5YHHs9fc5nsgM+SzhAXglHY3MrgQ9QmyF4z
         Qcng7ej1imcvCdRwuai7/dbsb+7wvxNwA510iRclqIM5ZPpMfbAHSxDcOCSE9ek0CpU5
         MseoCLdvmtzEgh5ArV/wrxphjOy0CLdUS7ILtz3MvLmvqfxY5vFXLHMmCuIC4XoWxlbo
         idGHrLuivIcqKg65pRGmtYmex6+FBX8PiNOZIIzU6CWT8jT6nAdyUAa3aQDiuU9mPpFg
         jshKNfXiE6H8EY+ta/YG0XcIR0MrTM+1WxQa8LbRKod9RL3XanF9F4UMuKtk9uh1dZSn
         PQzw==
X-Forwarded-Encrypted: i=1; AJvYcCVcf8VMXDxf7BtVXJnUVL29h8mJxIyTyynNigMSM18kBesUMvgJEU/V7OiyzlM8h6Go9isf318r8A/4FAYOQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9oX2TP1yNIm9dL7LUleMyU3QX1S6jweEZWH/NC7ETlieDsTVk
	pE1yj5SIeScdxgJXc1YkQhvUhIf8O19LyLlJhFrHmwglLowV8SCg/FKdt0xtkiavAe9XfH5PEvQ
	X/ImtbtqIC9J09Q+voVtLZh5cRJcbPdfZfDlfA/NY
X-Gm-Gg: ASbGncusksDk5GP7cBMw3LpfkcHjGEFox1GPk/fE+GnIxDJJ7Ca2Iiszt8MEE/0GAaz
	PgL1PlH9bOmHD1WzCjjrRzhaFedwRbFPLUi9MLHmmQyzn6hnDY1TzUXFNmyIT/EKHSKLieNMmqM
	MxkSpvOnhHI0Uum0z5J9XFNGpGOQrAbFY/sJpxPfBGB+XtAO2YVvkA6ZgMfsnlZ8bJVqMtYPS5i
	ZZ1NNXJIqBYxcy3fRw1YOfa+JWxIL+XUS56mKS12a5uKA6Z
X-Google-Smtp-Source: AGHT+IFo6IwyLbR5G5tGGMDaDPd7c+A7mFM1EecPzUD9PrHXz7Z7GSYJhFYbhBZl9Tl4KwnUO6QlPYWlXLeyCswGE/g=
X-Received: by 2002:a05:600c:3483:b0:456:1e5a:8879 with SMTP id
 5b1f17b1804b1-45868c9454fmr32278955e9.9.1753282911854; Wed, 23 Jul 2025
 08:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-lock-class-key-cleanup-v1-0-85fa506b8ca4@google.com>
 <20250723-lock-class-key-cleanup-v1-1-85fa506b8ca4@google.com> <DBJIDFSMYASO.3VRN4ZZEUI8EX@kernel.org>
In-Reply-To: <DBJIDFSMYASO.3VRN4ZZEUI8EX@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Jul 2025 17:01:39 +0200
X-Gm-Features: Ac12FXyaXk0Tn1xnIVYCpD8QPrGtzpt5ky0enjvHtYvN2fs0RSIRfx2AoBIsbAU
Message-ID: <CAH5fLgjWFa8TjTL+rfv7Zd+OQqhkKqWvyTkGf60pMUyQ=c4sXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: refactor static_lock_class!() macro
To: Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 4:36=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Wed Jul 23, 2025 at 1:49 PM CEST, Alice Ryhl wrote:
> >  impl LockClassKey {
> > +    /// Initializes a statically allocated lock class key.
> > +    ///
> > +    /// This is usually used indirectly through the [`static_lock_clas=
s!`] macro.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The destructor must never run on the returned `LockClassKey`.
>
> I don't know how lockdep works, but Boqun mentioned in the other thread
> that it uses the address of static keys. But AFAIK there is no mechanism
> to differentiate them, so does lockdep just check the address and if it
> is in a static segment it uses different behavior?
>
> Because from the safety requirements on this function, I could just do
> this:
>
>     // SAFETY: we leak the box below, so the destructor never runs.
>     let class =3D KBox::new(unsafe { LockClassKey::new_static() });
>     let class =3D Pin::static_ref(KBox::leak(class));
>     let lock =3D SpinLock::new(42, c_str!("test"), class);
>     let _ =3D lock.lock();
>
> Because if lockdep then expects this to be initialized, we need to
> change the requirement to only be used from statics.

My understanding is that it has to with correctly handling reuse of
the same key. In your scenario it's not reused.

Alice
