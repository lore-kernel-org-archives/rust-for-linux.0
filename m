Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A7187554
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736763527; cv=none; b=jFEUjBU01fRe1NwAxI9ysXs4nCdFlTazqkTMLr8uKc3bCG/KujuzZHkBpy6W+VcpgxPUI6S7reVsWRGwbH1R/wXQH4IIgm1KG8uQQErYiG7laFrESpoeKCkrgNnq9962zB8VdavCqXf/iUDb1oqeCXEVBwrNIx7HL65/JfpC4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736763527; c=relaxed/simple;
	bh=RQqCH4c8ligDPjmeabH4Wu6WVaTunNrklb0ytnJpOhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1rd/nnn5lNQohyEPG1LRiyQ9VG0pXid84ZgtFW9WIvXHeD3owNthfiU0hYdG3mrcWzrCYVv+bAT4KUx5Q69QTHmCAXXbUKYvgQbkA11sWvjYOsdGjMTupaZ6T/PYY3+yBDexo9FBn299zoz8a42sEVU6w0nbzp5XqAdsH64n+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b9hoIVw7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b9hoIVw7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385df53e559so3277813f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 02:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736763524; x=1737368324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8GDo/MCdKx6Z/Ef/GGop6qPQS31mjUdMoKIJbkfs3M=;
        b=b9hoIVw7qRqW0AOyx8j9IQsBDFqYamyYCjFWy+0j31c9i7LDM+z2i56AYlc8ZSbz74
         Ns+AHOkhlqaKVKIgulc266cplzAovqYNY2dzZ9O1ZRVEJr6n3Zsz9EBthu3PHM7Q1TUl
         UjdW3XGNOS2PApD8kPL7qjt5LDiIHeEedGrhwqikCQVmrANPKQPOXhZ6ya+CEMMPX/Uo
         NF2DyWJxW1Vrx8AOlpzcw08k1lTRTMXZu5kJhHHAjn4KNtr2s9oy/xFCbbbL+NDbX02S
         BIySwu1aKOO6b4YhNPXADz2KDrwjAQUSAZ4sO/2BbpJuAkyiB2cxlRF1juPPjjj0Fdog
         t7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736763524; x=1737368324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8GDo/MCdKx6Z/Ef/GGop6qPQS31mjUdMoKIJbkfs3M=;
        b=Z8IqYrvV9D/bPxn28kF1xD8ZDYbWbMuVcT7e133dIowc5YwiINT2/y+cayPYLQhfb/
         2/YymzE0d9MkP1fPsiE+H9EyrNiuivKpdXQ4+pgBrtboplVMLlor6l2so8Sn2fIwGBEz
         MAcKAKMpvh4LhopPqMjHamFGEaK91kQv1xBaEC2XAnymw1RF9/7u+Nt++MFpj6v+HoRu
         Iorv23tcyiVKtHGQXrJqUY1xGayxKRDdr6hKn3cr6ReiRqg2LoUrsIEX6Hwlx2zHZZvB
         FBhuWSGMNEy++dMmaVboXoHj/YKZAyJ4+TsL9qRUhzOfWP33h4PysRJ5xmOy+HSW3pBf
         isqw==
X-Forwarded-Encrypted: i=1; AJvYcCXweKh23WIq5VD1qMA1bApX83KXy+8DPwAzNtC3Zy1qAzrRd4FgBEWZHGssGGTTk6+XL+S1+GZUd4o+8qISZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAcFX3k2znmcMgTE/jeh3wJgKS5+1MdjUHg77MKdB617x+gILN
	SAFVYESDz6Re4+yk1J7OtCH76iIHNuDWsi21532LqBj1Jvgg5tUxjrd6eVpPU9QhWu92cSLOYAl
	we38CcRvboJXk7jRptMwQqAXMIZu51dpHgwa7
X-Gm-Gg: ASbGncsL/dMDFt7W2D2OyiSSzdt4N9lDlj+kVh3oRIXwf4YGqjG+OiHCh4/4WHNX0Hp
	vaVrK3idM2AM4EK4sMsEXE6BqLGxdEu8dkt6Ljak4/6sthqKIMnLcg4/mjeAehABcOUpO
X-Google-Smtp-Source: AGHT+IGpz/SHkxbp+N3cQw0S7DSAij+3lPOEYN2Yu2IpzNCgXQ1VyNHvutxAlnjy9IbHqOouApIerBv3HdqSu06NEN8=
X-Received: by 2002:a05:6000:2a3:b0:385:efc7:932d with SMTP id
 ffacd0b85a97d-38a8730faafmr17951935f8f.46.1736763524405; Mon, 13 Jan 2025
 02:18:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <f8bp5f3T5_3_0LpabBpwjSarzhZTp1CbAvcTBI6lHlaKpPAAFiofsNI2iJxK9kuXwnqvTkky9uvpS0rqRpa_RA==@protonmail.internalid>
 <20241211-vma-v11-6-466640428fc3@google.com> <87zfku8xm3.fsf@kernel.org>
 <pA6wMXsuufZYDAp8gFd3zk-NMh14PhUmFfNrteolm9tyjR2W8fCmaMzUhE3oG2Z_pWN_mju46C_fyDygXvRUmg==@protonmail.internalid>
 <CAH5fLggSiiQ1xTcEKbAiux=r+3C_HqY7AMtZOC6fwQCR51crCA@mail.gmail.com> <874j28bdkq.fsf@kernel.org>
In-Reply-To: <874j28bdkq.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jan 2025 11:18:32 +0100
X-Gm-Features: AbW1kvY4UPbhcl0V_aUw-htWIkjKdS5fOAkjYdW1l2Er6j35yFohAleL9I4lA3I
Message-ID: <CAH5fLggDvFa7jhZSdUQ90oqUWAnvv4RjynNGr8=57RB_p9_JrA@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 9:23=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Tue, Dec 17, 2024 at 10:31=E2=80=AFAM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
> >>
> >> "Alice Ryhl" <aliceryhl@google.com> writes:
> >>
> >> > This type will be used when setting up a new vma in an f_ops->mmap()
> >> > hook. Using a separate type from VmAreaRef allows us to have a separ=
ate
> >> > set of operations that you are only able to use during the mmap() ho=
ok.
> >> > For example, the VM_MIXEDMAP flag must not be changed after the init=
ial
> >> > setup that happens during the f_ops->mmap() hook.
> >> >
> >> > To avoid setting invalid flag values, the methods for clearing
> >> > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an e=
rror
> >> > if VM_WRITE is set. Trying to use `try_clear_maywrite` without check=
ing
> >> > the return value results in a compilation error because the `Result`
> >> > type is marked #[must_use].
> >> >
> >> > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. Wh=
en
> >> > we add a VM_PFNMAP method, we will need some way to prevent you from
> >> > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
> >> >
> >> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> >> > Reviewed-by: Jann Horn <jannh@google.com>
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> > ---
> >> >  rust/kernel/mm/virt.rs | 181 ++++++++++++++++++++++++++++++++++++++=
++++++++++-
> >> >  1 file changed, 180 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> >> > index 3a23854e14f4..6d9ba56d4f95 100644
> >> > --- a/rust/kernel/mm/virt.rs
> >> > +++ b/rust/kernel/mm/virt.rs
> >>
> >> [cut]
> >>
> >> > +    /// Returns whether `VM_READ` is set.
> >> > +    ///
> >> > +    /// This flag indicates whether userspace is mapping this vma a=
s readable.
> >> > +    #[inline]
> >> > +    pub fn get_read(&self) -> bool {
> >> > +        (self.flags() & flags::READ) !=3D 0
> >> > +    }
> >>
> >> As an afterthought, should we name these getters according to RFC344 [=
1]
> >> (remove get_ prefix)?
> >
> > Well, perhaps is_readable?
>
> Why not just `readable() -> bool`? That would match the guidelines.

I guess that could work.

Alice
