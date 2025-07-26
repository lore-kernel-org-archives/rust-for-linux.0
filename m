Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6538D1E8328
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 16:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753546699; cv=none; b=nrWQ9lROplN6ob7Pg9jffb3G2bx5OiE200ktbEBLd/KOj4qTwKduPrTYfjheXkUBRXi1gTomZ/ctddxT4ZAz2ZhdL9Shgc00zOjW/Jg2yJrTPsnFKgNRAVqjOi7PKFj0KfLvRnO9tak7CinNXad1L+c/OBQ6VmHa+wI3RkY555Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753546699; c=relaxed/simple;
	bh=ic2Zk6+bWwOnrKpYxsTey5iqwLnd+WrItLsmAfsWNFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+KkwZOgCMryXFCqhnKRiKsF4I41etOR+FixKJuW/dEo6iBmi+DNnJDqI4nh4+PLbwvbKRN5PA6Tg9K6/0M2Y+H1eg7OCTaVjlJouV0Or5kj93el8jTcHmTYPQa0KrorO8+BEROMPQuGr2fE1//PMatE7Ye0PSGzVJvGd/SJLWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RLHRa732; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RLHRa732"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b77673fd78so1165874f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 09:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753546695; x=1754151495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiLS2MBgpKK7dn/WFA7kJ/QtNdTGL5/cM0Nxh/9FxvY=;
        b=RLHRa732AeQleH53Uf0y2llmWBDjfspw95D0LJ3rMAXA3m1no+9MwXo5XDOh40uuNB
         lU4jW32oiIqfn/0JOMPdYFyQOJ7hmhLMMH9em803urGJU5n7paoXXFRnXwu0jsvRRBrK
         UNMNAgN7r8M8+GsfluZSXUxXcyVgC4amPJYl7UhtzTLKwIoS4ApJ3BhKX6w/+MLuySSY
         9XnF/wPAFzxvJqMDDXx0ZuzemW/FTHu+0NXzwCXJ67MRnn5ACdOkPsHS/2ktoo4CqNcr
         fktcMaHNzMGrP4Ipuq0x6wEKvqNX8UpaFL8c5CJJ8sNfqs/HBll8r9UmortiAisJzBbR
         xXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753546695; x=1754151495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiLS2MBgpKK7dn/WFA7kJ/QtNdTGL5/cM0Nxh/9FxvY=;
        b=VpEjwcuXvfmEI5W1D1n0qU+Q/QocoHYHFlH1WCZ7pXTIi9KPD2mUfOsdpr5+wd5x5/
         CR+6awuZf0cdQmRl3hXxrYSjo4Z6zqwUndI2SVHZ5Mt0G70j/7EF74p49ZcA+ncWrz8B
         c+HdRZ60ma6lwSLR3U69NYwpVg3P31QCfvlTCeUchxKm5sNgW8bOXzbWCgbSuGFKtFSf
         UonbA+maxBN/aQs1PUxiPAI7KHz4ChUJs5nA4moQ1jQjAs79IWB/29lZSmpnuvUsGESE
         JtOsHsuLl+nLNpuP0rngjUP0vERQeKJRt1nm20D2DP5UMlWyCjc8z4IlmIcwH8Hz38R0
         nPcg==
X-Forwarded-Encrypted: i=1; AJvYcCVwfrxU8w8jzFTcj2YVo/6dCTM2eVMDkSFtAzZrM1vO37/2wwAlSG0SJ66rjiEFoLk/MXTam2HJqeT+kzbfcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOROx5mtfC9M2Nv07nbgnVlEuovWQPkfU0WODX+9N00XNKHmwT
	Z79GzGMHZVoY6iQF+9Mz+lJwJMlkE2aL/04WF7rvA7ZhEcfUvBmgWu95nlGSedwF4zn5xt2MpXY
	pTVA9TyXea+nxp77TF76ZYSCedMmh3VzIYQZIDoy8
X-Gm-Gg: ASbGncvsgYIP7QNhNlsvt6lTAOst3RKsfyDKOhvQmlm6N6VEeSUJyf184HuqGXuhWd+
	Aw9zJq4t6PR/wODcAGBerIZJltjQhdgrCR3fOH90MEY1Tq5FkIPrSbGPiZm4s4MsxI/L1RphtAI
	tdmTgIql35rS0YYxe15q4HNT34MDuixErmE4YSWkDnkzpekpEqVHRENEwLj0LMdfZkDiiolOjnx
	MhfJiAQ
X-Google-Smtp-Source: AGHT+IE4T2Sn+YCnW4UddIk8IedAnI3g7v/KjWu/nPuK/MNxlZtY8DLAjeFjfi7qmMPpMkzy+RMzIlyv7WFJGSZZYKQ=
X-Received: by 2002:a05:6000:1886:b0:3b5:d726:b7c with SMTP id
 ffacd0b85a97d-3b7766641a0mr4429309f8f.40.1753546694652; Sat, 26 Jul 2025
 09:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726-maple-tree-v1-0-27a3da7cb8e5@google.com>
 <20250726-maple-tree-v1-2-27a3da7cb8e5@google.com> <20250726165020.46880c31.gary@garyguo.net>
 <CAH5fLgi-3oT8+5Krzrg5JeagJMm6-8FNVr5G-UAszuhi0qZ1xA@mail.gmail.com>
In-Reply-To: <CAH5fLgi-3oT8+5Krzrg5JeagJMm6-8FNVr5G-UAszuhi0qZ1xA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 26 Jul 2025 18:18:02 +0200
X-Gm-Features: Ac12FXz05m1OoGuwnB7bHkQoMy2rtk_a0qxycMPIapq4u8Ue_k0Q0z6l5hoUYyU
Message-ID: <CAH5fLgjB7-xJ2OjVa6nxnUPk-1+wyxPMWQ15-Vc3mUp36+_Rhg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: maple_tree: add MapleTree::lock() and load()
To: Gary Guo <gary@garyguo.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 6:15=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Sat, Jul 26, 2025 at 5:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
> >
> > On Sat, 26 Jul 2025 13:23:23 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > > To load a value, one must be careful to hold the lock while accessing
> > > it. To enable this, we add a lock() method so that you can perform
> > > operations on the value before the spinlock is released.
> > >
> > > Co-developed-by: Andrew Ballance <andrewjballance@gmail.com>
> > > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > >  rust/kernel/maple_tree.rs | 94 +++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  1 file changed, 94 insertions(+)
> > >
> > > diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
> > > index 0f26c173eedc7c79bb8e2b56fe85e8a266b3ae0c..c7ef504a9c78065b3d575=
2b4f5337fb6277182d1 100644
> > > --- a/rust/kernel/maple_tree.rs
> > > +++ b/rust/kernel/maple_tree.rs
> > > @@ -206,6 +206,23 @@ pub fn erase(&self, index: usize) -> Option<T> {
> > >          unsafe { T::try_from_foreign(ret) }
> > >      }
> > >
> > > +    /// Lock the internal spinlock.
> > > +    #[inline]
> > > +    pub fn lock(&self) -> MapleLock<'_, T> {
> > > +        // SAFETY: It's safe to lock the spinlock in a maple tree.
> > > +        unsafe { bindings::spin_lock(self.ma_lock()) };
> > > +
> > > +        // INVARIANT: We just took the spinlock.
> > > +        MapleLock(self)
> > > +    }
> > > +
> > > +    #[inline]
> > > +    fn ma_lock(&self) -> *mut bindings::spinlock_t {
> > > +        // SAFETY: This pointer offset operation stays in-bounds.
> > > +        let lock =3D unsafe { &raw mut (*self.tree.get()).__bindgen_=
anon_1.ma_lock };
> > > +        lock.cast()
> > > +    }
> >
> > Could this return `&SpinLock<()>` using `Lock::from_raw`?
> >
> > I guess it has the drawback of having `MapleLock` needing to store
> > `ma_lock` pointer but the guard is usually just all on stack and
> > inlined so it probably won't make a difference?
> >
> > This way you remove `unsafe` from `lock` and gets a free `drop`.
>
> I ended up going this way to avoid the extra field in MapleLock, like
> you mention.

Oh, and it also avoids assuming anything about the layout of SpinLock<()>

Alice
