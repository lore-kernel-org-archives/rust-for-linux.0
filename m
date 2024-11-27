Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76261FA82F
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732711130; cv=none; b=TbFwXjhuvvb/uDuWI7xGHCEpst2n4LSchjgHg52LKwO4oT1VxLNq9sNjV0lRu3Hyuq/rSeJyidaYnPmtHf1AT48qPWzc6+oB2fvAeibscyP50jRoyLp8ta0ajEUcQYv5NbhPcMAQYOWgJw7kgRPoqBHgH0k3awadaG/iA32XkaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732711130; c=relaxed/simple;
	bh=1YYaQVcd/H798xCcU6/zkfoT/mGH/vxkiRfRp4k/Kpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwkWJ0iBnGbc3uMx6E8BYl51yUL7jwBQHJ0VYO0teqX6l46jUzNV7f7dlVl1SQY78htEHPm4oX6LxwdQhDypK1nKyKXpzn2R8NaZZ7hHD5K5YlvF/exWdWtLPXmujutLJP7YQmhSdykyKIsyV2Cc0AEyE/UVuhhCrRgFHiLn9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=czKHaq92; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="czKHaq92"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-382442b7d9aso5106566f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 04:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732711127; x=1733315927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHjB0FS8XpctltbckXhibhTVw5p/t9yVHsmxkraO6NE=;
        b=czKHaq92j6hF5wjIB3dT9vG8nv2j1iMhF+crtgiEilp4cmRT8Vz/hBsybI0BMfJ9G3
         r1Cbzsk6BJTipBGPzX6oWkfo3ROPciIeFC0CoRTfuH2q9F1ugnaeH4NfZIxsD94f9OlG
         C4dlkurArBpbdvZF0TXYbdHKFKS8jNydylpeELXydHD38gKASolIzq+Oyx0S8wwOvZfh
         DL7CAOhA7YjI2IvNqJfe+a6FyvNdOs3f5vf+/Eem7YHfrMhZrS6vlQzSM6c/bgErYJ60
         fssfodIdC2EKSN6h/wgd4k1w0CoLsHk/+drWpAKxZKUxioMfkRinyKuVJDPkENrU350p
         ZvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732711127; x=1733315927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHjB0FS8XpctltbckXhibhTVw5p/t9yVHsmxkraO6NE=;
        b=RN7Y1E24Fd/RQQ5V/BKAp5m1ZtSaiMWvjZiHQb7Qi25lFB85QLC/nGtiO7swGtbShG
         ta6/Sn9lU9C4YHwy+FTsP1OEMW52C0IRda2VcYF+QRCnTdlJO4CRPTPsfrj+PSF0bXUW
         HNSkD6E2egG1H/Cf4chmJgnztzoO7dwp9caY5xn/98+Ki74ijkeTHRjFBqXOtrtabCic
         gAoRfcQTJ9TyVhVOhGYaEQ7x8V5CDhHeDqqffRsia62zO6FN5zGODuhlpJs93g4Yd/ET
         kqQwywIHlH+VLogjJwpM/XM4Pooi99wKW9pmwPXdJ5/ztXePxkz0hpG7SqXgDNbXpanz
         CyLw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ2PecWPRN9w2ZEB3qpUgaW98XyCq/L1k4iohTGzgJTonnyxMiWg0ii4Ajn5vP4BlorQRZ4xqJmWaZOnwbOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1oHkZLTANPkr14B46izB8V9+IKypgWtZJ1Zxg3FHrZiuZ+4G6
	zVE9ZQ8dCN4LCvpe3+yD9puYeQoHc+2T3rFDKq9hdrVUQynhQg12dPTjvtAxIHpfZAOluXBepai
	KdID6EuaG94bDo9SZJ9fk2ny7VBQoFD6VVAy6
X-Gm-Gg: ASbGncuj/2Bp93I9cKbLhbR4wgriS0r532BcdMZPi76cadiUh2bjCf+WVsPMsckWbab
	IxeI4NubhJQrM25XAiOzfBNbnPwHRLQnKDa2NxTh+5V3CTNjQX2tgHmM6ck53Kg==
X-Google-Smtp-Source: AGHT+IGn2m8yJDcE/Dzz/61f9ciHRrx99d8i4GRYNDch74O8JfcQB+p+RQG8+bfMn1ARySVuPp8Pgo3KGaUZC/Ej4uk=
X-Received: by 2002:a05:6000:1aca:b0:382:397f:3df5 with SMTP id
 ffacd0b85a97d-385c6edd4fcmr2071742f8f.38.1732711126964; Wed, 27 Nov 2024
 04:38:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-6-7127bfcdd54e@google.com>
 <CAG48ez0V5B0ycPuP7eRA-xE88ks8cr+a1MFZC5emv_eAsybNAw@mail.gmail.com>
In-Reply-To: <CAG48ez0V5B0ycPuP7eRA-xE88ks8cr+a1MFZC5emv_eAsybNAw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 13:38:35 +0100
Message-ID: <CAH5fLghFezPeoPD57rXq-jy2wZBO0Bv6nSmU4OA6=hqeuGDVmA@mail.gmail.com>
Subject: Re: [PATCH v9 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
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

On Tue, Nov 26, 2024 at 10:30=E2=80=AFPM Jann Horn <jannh@google.com> wrote=
:
>
> On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > This type will be used when setting up a new vma in an f_ops->mmap()
> > hook. Using a separate type from VmAreaRef allows us to have a separate
> > set of operations that you are only able to use during the mmap() hook.
> > For example, the VM_MIXEDMAP flag must not be changed after the initial
> > setup that happens during the f_ops->mmap() hook.
> >
> > To avoid setting invalid flag values, the methods for clearing
> > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an erro=
r
> > if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
> > the return value results in a compilation error because the `Result`
> > type is marked #[must_use].
> >
> > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
> > we add a VM_PFNMAP method, we will need some way to prevent you from
> > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Thanks, this looks really neat!
>
> Reviewed-by: Jann Horn <jannh@google.com>
>
> > +    /// Set the `VM_IO` flag on this vma.
> > +    ///
> > +    /// This marks the vma as being a memory-mapped I/O region.
>
> nit: VM_IO isn't really exclusively used for MMIO; the header comment
> says "Memory mapped I/O or similar", while the comment in
> remap_pfn_range_internal() says "VM_IO tells people not to look at
> these pages (accesses can have side effects)". But I don't really have
> a good definition of what VM_IO actually means; so I don't really have
> a concrete suggestion for what do do here. So my comment isn't very
> actionable, I guess it's fine to leave this as-is unless someone
> actually has a good definition...

I can use this comment?

This is used for memory mapped IO and similar. The flag tells other
parts of the kernel to not look at the pages. For memory mapped IO
this is useful as accesses to the pages could have side effects.

Alice
