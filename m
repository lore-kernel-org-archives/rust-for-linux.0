Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C511F668C
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732708907; cv=none; b=b6A1dFOLn5K4twnVaPFr+tEE87sjcAh5wqC3nJzrcSma2a4fHUz2/LmaFMwBAvQRIWmXMdI6iOCyP/LqqlGyX3uV5ntXH7mFvmNLuf6oERr8aH2213/8RroK0DnJSoXDZXSvjgNLmVwU2HH2uKSLGApEJ6t5aSGePNrp3bTtKOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732708907; c=relaxed/simple;
	bh=y/d+AdUBHAvfWeUx9r1GJYMljSO9U0xh/zkVkaxDIX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6s+wWvDldbuJcY+0bHvGrNLW1NpkdedTOSOZvu9cuk/Yvx50g9XDogQS5SLmN08Ad4vPPu28mK9RJr/NSGQAesjZkYEEYjObqgJLMVxQh0WrrEvr9gCZoU1/clRe9wWdprDkkGkIK8LDnALEzJq4CyLFf55XkBeOc/WwAXt5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JU9LhwK2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JU9LhwK2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a10588f3so22367305e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 04:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732708904; x=1733313704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LttQy60/kWcqxExcUEWFDW36cE0UWcTmyvNbFBXdz84=;
        b=JU9LhwK20GNaKLDxB6OwzUNB9Ke5LxJjS7HvZKe00xrgatDvZo1VZYIi7a8tftT7Qn
         exzJcrETHgpUcShL2W9XnjSedEaDZLUHy5BTfw8M5crrrGlMAmdxKhamZDjN+g5ZOaQJ
         oojM6sq+FYijEiEl6wUManrUWaS54/RTOGAHWoqpLnSE8uhjEjtkkEZoYhjhw1Qezvrl
         H1xRtkW7f6fWPLBgq4cXtAldJfeUKS+Pi7Toxe3Cu5YuDjKJMSBKSiaDuYh/xYGuHMwV
         AOrvSPPau0el8lCLXgm3lpi7AZfZ6YjaCNI/uzDDrrWS0CnXG30VXVgjqo51g14O2g0o
         tl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732708904; x=1733313704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LttQy60/kWcqxExcUEWFDW36cE0UWcTmyvNbFBXdz84=;
        b=Rz/ycmFl6jWjrLNmIGOMiFDHCiCZ8JRjI0jAqnhUmt8MFpddfAKT3w8RqbkaLjXcR4
         zgxAZ3IeXN5z7j/bnaUf004cgjm3SjHoFiADvwSGt7FqfHueBV/cvJhOw9/ee1w9mH1O
         /vqLfs/0vehbJOtpAsRVXCIO60O72r6NTpY/5jVler0zF6OkPE2/XvbTLLaXATR0Er6p
         MWpU5Du+szkLajjDorfEmbPttvNVB/PQg9x0cCDnAsizKi8Zl9+fduQrAXgJ0tB+HA5s
         XoKVUY3Xtr/4PxZabixIIcmAxXySRsqaW8YCfvxjivK/iapHbOYnDjPdaMdwpVQw93qf
         GfrA==
X-Forwarded-Encrypted: i=1; AJvYcCU7vvCzHiEdp+Rg+buzjeBOj4ur+9tX3+JDlX9yT1RidWbFpXCdUToL2H8q6unxzTrvC+dvT9X6h9PwQKVjoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HUWzPXWsN5PFppjtbnhaIW/rvm5Lj/JYFgsrjslc1rp3EPFY
	62i4AmPpo3FfZnqbrrfPrwt+csGsQfdHWHiYaQEinLeK2YaeKTr6NIuSp2ujw3N3vdW9KE2+/o/
	mYAJdIdEsK9dTwSLmeG7HqO7b4CbL7NkiwQeE
X-Gm-Gg: ASbGncvgVOPRscSak70sZiwyOcdMI8iE7BNV5mQQFfpC2B1+z1PpGw1ihmB34I5jWzo
	mPGR90W0Znl8ZIt1uFYny5m6CxGDSj7bprI7h4Hes8h2GXdZewCTSgkW3Szgb8Q==
X-Google-Smtp-Source: AGHT+IHqg6CrZWcGbjXGFSKqCo16d2ZolJeyMhRXXeaa5dMC7DrpyRxOtPnCH2W00kCXyLasTa2O9cyFsPYSfR0A0N8=
X-Received: by 2002:a05:6000:4402:b0:382:5088:936a with SMTP id
 ffacd0b85a97d-385c6ec029amr1647814f8f.28.1732708903384; Wed, 27 Nov 2024
 04:01:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-2-7127bfcdd54e@google.com>
 <CAG48ez28kzjrvMN66Yp9n+WziPzE5LU_Y320405Q=PoOzdzStg@mail.gmail.com>
In-Reply-To: <CAG48ez28kzjrvMN66Yp9n+WziPzE5LU_Y320405Q=PoOzdzStg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 13:01:31 +0100
Message-ID: <CAH5fLggh7HeOm8wGZH=hnR+SyPoW8Hik3uy4RodibyjY1UT36w@mail.gmail.com>
Subject: Re: [PATCH v9 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 11:10=E2=80=AFPM Jann Horn <jannh@google.com> wrote=
:
>
> On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > This adds a type called VmAreaRef which is used when referencing a vma
> > that you have read access to. Here, read access means that you hold
> > either the mmap read lock or the vma read lock (or stronger).
> >
> > Additionally, a vma_lookup method is added to the mmap read guard, whic=
h
> > enables you to obtain a &VmAreaRef in safe Rust code.
> >
> > This patch only provides a way to lock the mmap read lock, but a
> > follow-up patch also provides a way to just lock the vma read lock.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Reviewed-by: Jann Horn <jannh@google.com>

Thanks!

> with one comment:
>
> > +    /// Zap pages in the given page range.
> > +    ///
> > +    /// This clears page table mappings for the range at the leaf leve=
l, leaving all other page
> > +    /// tables intact, and freeing any memory referenced by the VMA in=
 this range. That is,
> > +    /// anonymous memory is completely freed, file-backed memory has i=
ts reference count on page
> > +    /// cache folio's dropped, any dirty data will still be written ba=
ck to disk as usual.
> > +    #[inline]
> > +    pub fn zap_page_range_single(&self, address: usize, size: usize) {
> > +        // SAFETY: By the type invariants, the caller has read access =
to this VMA, which is
> > +        // sufficient for this method call. This method has no require=
ments on the vma flags. Any
> > +        // value of `address` and `size` is allowed.
>
> If we really want to allow any address and size, we might want to add
> an early bailout in zap_page_range_single(). The comment on top of
> zap_page_range_single() currently says "The range must fit into one
> VMA", and it looks like by the point we reach a bailout, we could have
> gone through an interval tree walk via
> mmu_notifier_invalidate_range_start()->__mmu_notifier_invalidate_range_st=
art()->mn_itree_invalidate()
> for a range that ends before it starts; I don't know how safe that is.

I could change the comment on zap_page_range_single() to say:

"The range should be contained within a single VMA. Otherwise an error
is returned."

And then I can add an overflow check at the top of
zap_page_range_single(). Sounds ok?

Alice
