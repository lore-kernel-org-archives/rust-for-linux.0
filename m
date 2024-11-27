Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889401FF7DB
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732724388; cv=none; b=j8c4hKtMfV2wwh2axDys9UBDeh0Ajq6PWsawED5v2LuD9wdekoTvdguyB/0I0nOI4BIJvRNuVBwLRbfZ0oN3yOTYdloqZHaauWKWptgaezUPhxVMQHEn9Wx0Xy3aJalJarZmO6HVGVMuwr75VTyaf24ucM1H5tm1xQ9BAmy/wm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732724388; c=relaxed/simple;
	bh=E+w9nNLSMAN+ZeW6dWk4UB03wj8vwo2aNxGc+VDrmxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZ98ieFuCL0VKbmAu44qFrIDzxqCDwj9bxtSK9p2kAlcHAN712mZNZIqSpjeIxj7xu1XJEE0nD0m2fwByUZFwFH0F3a5jWXrZJnUWblpNwgtwucgN+l2nLQJL5SndwJbfn0P3wjIoARcRHFUx+suzqjuxi1n/wIGXJiW5UmIiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=stQ13ZbY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="stQ13ZbY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so10603a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 08:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732724385; x=1733329185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAjY4cUXfzBi8WYwGYeSH20OavkqXnIHitIyVQzxrLw=;
        b=stQ13ZbYItPwXmwBTX1ghPoCC614HcMBV0Rl5VnQfAnU8lJOyWCNJINpkPoJSp8noQ
         CShUMHn9Efvwo0UYC+nwIQuOK9UswCssQzp6HlBf/Iw73nzHDYbK6zELuyW+fPY15P0R
         zjDAxhuxiYqK53O5LrGVwqJib3QCaB8kuQdz75kheyfSn8OYSYwGZHy56spigtOIrONi
         VN1RFkSGRWGKfmtUe59kiT9FvWpcOkl1vOhP/CQSd2zWFrhG/Ks+Ace5CXfLogtRr1t/
         UGlODRrOBg3+aZhH/8XDEAgQtIkWTeqYniPiK+mqNqvIlYD3CeGjaCwCgkdJv/2mawkz
         nJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732724385; x=1733329185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAjY4cUXfzBi8WYwGYeSH20OavkqXnIHitIyVQzxrLw=;
        b=Y6wKQbynseGb8ekVuam+TDEj52OBC2hBxp6WFZkEnblqcPhV6Aa8vinK/trn/1ElAH
         4nFi1NJN99bP+BvO69HfZNJhJLzjvuDPJR1paUHAa5C7JhXIbvvnKb4vfDcFZLqXtf+R
         WqFNSPVMUT+MiPypji7+c1n7raDRTkpfETGnuVY9n1dlvaWoEC8Mn6Fd0jknfEtYi+w2
         1sy5ONtLvVnjQFFK2LIngJvIkfC49Lqfrfj+7PefOW3k+EE+JfHIwRYQf6A4FEZyrp/A
         beo8Exu7GpogOQ6DGr4dWy1ew6Ypf9sdhHOH2MswDcI/1egj6YcKAmIg0ljKgd40ImPy
         an5g==
X-Forwarded-Encrypted: i=1; AJvYcCW95mwiYRfJK4Ubi3nN+XWMcT2HiEAZPmGqenrUaZVaah7O7aeEhbqu5UGYH31YLII+5ekUFKSWrr5r3rCSNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrPMLoC4EBtbdXQ+evNGfbacTNys7/ebqW2dly9BCl6kpZXbV
	5ce/YDVmYuqzNLIoKppxrtLpYE2+wU3RHY6dl6ZKFXxaboIAsCakY6DI3uNf57hsnT6U9fK/Ur/
	s2pz7nsIFQ0Mp6lbdWEfQ3nITDwW1vqNVYQ7c
X-Gm-Gg: ASbGnctSQ4R1mzpoi0Mxwkdtfp8uTGIpnYjCWNIyg1YFeDCCnwxmmJt7qp7ON2y9xHu
	DSVQQfvp86BDVsLjztFyAUzB5Xixc6BW1q+Rt8h8WYnpjRAmHnYo+Ch/6Fao=
X-Google-Smtp-Source: AGHT+IHOfimbq5UVJFbeLGrkhx7uhD/EG8rIKTd4IIfYXZcO8eb5dxm860fiWHAJKL8K0w2iOIAFqyZVTagJNyJjsfE=
X-Received: by 2002:aa7:cd50:0:b0:5d0:f39:9c7 with SMTP id 4fb4d7f45d1cf-5d083570c07mr71295a12.7.1732724384503;
 Wed, 27 Nov 2024 08:19:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-6-7127bfcdd54e@google.com>
 <CAG48ez0V5B0ycPuP7eRA-xE88ks8cr+a1MFZC5emv_eAsybNAw@mail.gmail.com> <CAH5fLghFezPeoPD57rXq-jy2wZBO0Bv6nSmU4OA6=hqeuGDVmA@mail.gmail.com>
In-Reply-To: <CAH5fLghFezPeoPD57rXq-jy2wZBO0Bv6nSmU4OA6=hqeuGDVmA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 27 Nov 2024 17:19:08 +0100
Message-ID: <CAG48ez3n5AbKDC1dc7a9G0H9iHCZpc8mcR7Epuz78RB79=LaVA@mail.gmail.com>
Subject: Re: [PATCH v9 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
To: Alice Ryhl <aliceryhl@google.com>
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

On Wed, Nov 27, 2024 at 1:38=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Tue, Nov 26, 2024 at 10:30=E2=80=AFPM Jann Horn <jannh@google.com> wro=
te:
> > On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > > This type will be used when setting up a new vma in an f_ops->mmap()
> > > hook. Using a separate type from VmAreaRef allows us to have a separa=
te
> > > set of operations that you are only able to use during the mmap() hoo=
k.
> > > For example, the VM_MIXEDMAP flag must not be changed after the initi=
al
> > > setup that happens during the f_ops->mmap() hook.
> > >
> > > To avoid setting invalid flag values, the methods for clearing
> > > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an er=
ror
> > > if VM_WRITE is set. Trying to use `try_clear_maywrite` without checki=
ng
> > > the return value results in a compilation error because the `Result`
> > > type is marked #[must_use].
> > >
> > > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. Whe=
n
> > > we add a VM_PFNMAP method, we will need some way to prevent you from
> > > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >
> > Thanks, this looks really neat!
> >
> > Reviewed-by: Jann Horn <jannh@google.com>
> >
> > > +    /// Set the `VM_IO` flag on this vma.
> > > +    ///
> > > +    /// This marks the vma as being a memory-mapped I/O region.
> >
> > nit: VM_IO isn't really exclusively used for MMIO; the header comment
> > says "Memory mapped I/O or similar", while the comment in
> > remap_pfn_range_internal() says "VM_IO tells people not to look at
> > these pages (accesses can have side effects)". But I don't really have
> > a good definition of what VM_IO actually means; so I don't really have
> > a concrete suggestion for what do do here. So my comment isn't very
> > actionable, I guess it's fine to leave this as-is unless someone
> > actually has a good definition...
>
> I can use this comment?
>
> This is used for memory mapped IO and similar. The flag tells other
> parts of the kernel to not look at the pages. For memory mapped IO
> this is useful as accesses to the pages could have side effects.

Yeah, sounds reasonable.
