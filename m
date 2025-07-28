Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927AD22C32D
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Jul 2025 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753701584; cv=none; b=SrYGIyXGOFvlh4iatBhKJOXpi4NgrfsLy+mbLzlSZvV31gNQ/SgNBRPag4XgcHks5KLAczPdIZO5eadK1PVOOD6UcOiRSGSgfqthRs14+M+o3EyXjjJNiV4ajNvldJ9sBsX4fZ773PW6E79h22mGpFUs1nTPQtABtuIgQG1fdC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753701584; c=relaxed/simple;
	bh=fMvFtqY0dZeTgFscTQ6EikQG17iQn9yAO5mQTlzzO6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StreHYnId2xI+6ZZv24u4vJcdn13WLWmG8rHGWUhphKAHabIFYMTwN3fBvPwSpWyErByCHkTXWdeK9X7166oPqwDOt0nSfK67Ofq6/yYySGR/7EY8rFTy8vwjZU0Q9rV/iihr+0oiT/tvY7ze0Er56DzdYb4xxvrZeHZLunFo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pomFTSss; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pomFTSss"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4560d176f97so46296945e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Jul 2025 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753701581; x=1754306381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbmSA0QipmAIbHbKw8GhXr6SE1pl+CI9qEcVQNYIoK4=;
        b=pomFTSssg9OZS78aX3B2oQCP66eYFLleaf8LeMbmqb0u9lPSCqOGon0bBkcedsjAIa
         cv8xrVYcHkkl0CoqxGk5GpCLjDSVDgD6UfNPwD8+sQXUgltn+NGaAYqlSuvA1HRdBLml
         iePnVcTXn5ldKmJj7sYQDdpiJh/duiq2Wd+ZDl32ooQVTU+mRRQN2MMHTObLLwr+YUsj
         t3/iRWgOgAaUz8+3l+tgLxqY5fQA0L0sYtXa40qPFvu/yJs9DrHTnTY+eZdyMUer8U8y
         2CysKo5CIalA4LVATua72YJoLWM372YfV1BYV1jGWRHVKdWO/2U01CcGO6EVuRcot8sj
         29oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753701581; x=1754306381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbmSA0QipmAIbHbKw8GhXr6SE1pl+CI9qEcVQNYIoK4=;
        b=ZxWmM0ZBrWX3ZJatOPlct4ICq2ofNz1Wgd3LXzczDEwWvj7hYIGyEOsQsslx7O/45p
         bfb1r6ou0XIsyT2F7BMFmrzXm3bIYptzJgOF2U3fOXC6aaYu0xLNjVJ4u24O4xUgwAU/
         vkYK35oSIpm6r9yfLxcorTGZP/s8xbyy3cBXsphJlQcO576sr7b/Ir5G8nYsmxPLyRq3
         C7LAQIqzGX2s5l6Jq5k7RCx0M6KuBRsso6XCX861iEC1zqI2QmfDBPL1dmQ1OfzSK0Wc
         7Neo9DIfN7XcvnWAxlyrNwEb7zK/dKqAefvHCD0DYUOJOiA4q7MD5tUwrZ7ry+KNWwo2
         85Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXvdUdZ25K+7Vqc9tue0II0D7Kn+RE2sRI5hs1mYwgf+RaY4AE6dkQoBUZS9mBUVMmJN2G2sHAbyDnC1Nqh1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwfP8a/OrwubzV7G75fiS244zyUYzAJ1Y/RLrQLFQCNIIM4neH
	LI9h28dV+rJ7hFGNTzwz4sH2q10nKft5aHpGJxWlfrEh0bZfFsgtPHA7nqzdrBGmtBFM/0cKH2r
	zK6LExK7NsgYYJ2VU2Tu0peEEvFTnPgeVJBJHx9UZ
X-Gm-Gg: ASbGnctYRl3+moTcXjf9fj7YqpT91IVzPDjN2MEmJ9ucfYQjrNnU6z/U8rhQOtlJKvt
	X4p5yufFUL7Cb+JJ6Hd8LsSm6R1ADNOwLWbkObEWQYDhIE15UrEiJPCyOOa2oqDuoit/Zjaq0YZ
	avXbRKjOuyOim+HhVz4zYOT03VMKdZ8rdZexPzHX9ax1rqytin36pq7Jchiy6LmDy/NwWybCXxC
	sahu81tBAyeQ0Fr7bmWkP8RqhkfGW2hPHpXXA==
X-Google-Smtp-Source: AGHT+IH67iNxNSkrojY3fM95xQae5TfwbJj4xs2uDRg40WNQDB01MpvP3CEcQwXZKV/Ly+szDBAKEgcdFxAhv/DfOFQ=
X-Received: by 2002:a05:6000:290c:b0:3b7:8832:fde5 with SMTP id
 ffacd0b85a97d-3b78832fff5mr2866538f8f.13.1753701580696; Mon, 28 Jul 2025
 04:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726-maple-tree-v1-0-27a3da7cb8e5@google.com>
 <20250726-maple-tree-v1-2-27a3da7cb8e5@google.com> <a4b93eb0-9742-4f24-86d9-486ce87fbed8@gmail.com>
In-Reply-To: <a4b93eb0-9742-4f24-86d9-486ce87fbed8@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 28 Jul 2025 13:19:28 +0200
X-Gm-Features: Ac12FXytrZNUlSdOYgH1ca32A8QXnXdUtZWRs5mU3kT7ILNpSGtpDjWYR9OsYM0
Message-ID: <CAH5fLghK9RhbEXAW4fYS=61Dps34+jgv1UGAOMf7_LD0DVO6rA@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: maple_tree: add MapleTree::lock() and load()
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 1:11=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> On 7/26/25 8:23 AM, Alice Ryhl wrote:
> > To load a value, one must be careful to hold the lock while accessing
> > it. To enable this, we add a lock() method so that you can perform
> > operations on the value before the spinlock is released.
> >
> > Co-developed-by: Andrew Ballance <andrewjballance@gmail.com>
> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> I have a couple of nits, but overall looks good to me.
>
> > ---
> >   rust/kernel/maple_tree.rs | 94 ++++++++++++++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 94 insertions(+)
> >
> > diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
> > index 0f26c173eedc7c79bb8e2b56fe85e8a266b3ae0c..c7ef504a9c78065b3d5752b=
4f5337fb6277182d1 100644
> > --- a/rust/kernel/maple_tree.rs
> > +++ b/rust/kernel/maple_tree.rs
> > @@ -206,6 +206,23 @@ pub fn erase(&self, index: usize) -> Option<T> {
> >           unsafe { T::try_from_foreign(ret) }
> >       }
> >
> > +    /// Lock the internal spinlock.
>
> probably should add #[must_use] here.
>
> > +    #[inline]
> > +    pub fn lock(&self) -> MapleLock<'_, T> {
> > +        // SAFETY: It's safe to lock the spinlock in a maple tree.
> > +        unsafe { bindings::spin_lock(self.ma_lock()) };
> > +
> > +        // INVARIANT: We just took the spinlock.
> > +        MapleLock(self)
> > +    }
> > +
> > +    #[inline]
> > +    fn ma_lock(&self) -> *mut bindings::spinlock_t {
> > +        // SAFETY: This pointer offset operation stays in-bounds.
> > +        let lock =3D unsafe { &raw mut (*self.tree.get()).__bindgen_an=
on_1.ma_lock };
> > +        lock.cast()
>
> This cast seems unneeded. lock should already be a *mut spinlock_t.

In some configurations, the type is BindgenUnionField<spinlock_t>.

Alice
