Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ED91327ED
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713289691; cv=none; b=NMOkaLssgD5BGb3fZdOqdbHDcFYVDYxqhBKMG41x3Sh94DuemmO/nlhqaW5DLHsHr+QkdDToXQSxe/9fU5HOT69LZ2lGd7BhSohV9BEf/6NmzUepE7RBOCP9G+hZhLjANJvkJ6FQn3KmDhto/bRsBtaPwaN63vVPlQ7N5Fl55ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713289691; c=relaxed/simple;
	bh=CFLPbaTqHgy35LCkZ8/WIR4fdR8dupvDJeKom1cb3Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+08vVsPOnt/WUF45H7Z+uzmzQLxfbowlYAIv40q90rP1RGWnhJMw8KkNNxmJK8QtNPL6a1mb+9p+VtZ0k3AEo6aMiPsRQj/aYo3bBgtDukOoAjS1MCMTX1MOWLseezMash+X4DFBiJPQ7ZmX7pX8fUDdj7SXmXnpGKqcPE4LXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=eUDKjTlB; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="eUDKjTlB"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-614ec7ee902so43389987b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1713289688; x=1713894488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgxo59IYhnHPL9WU4YKhZaxzeo3fMP1MrECdS5RGdv8=;
        b=eUDKjTlBT29qfAlDcoUy2U1r+7cY8RglJ/6AU7pb+GfackqEn8tjBT63fCwXj8r6ph
         vIHzVswQ1aD1xiHv3jXV5FyJALVltYXvFK8pgG/Ym5HtTIZHS++PW5hZah87Wml7yFqC
         b+ai5iO//SnTNatl1C9pDoSOlvT+H28FDhW0HH5ET4iHKkgFrg8EtXaQdyCG4Brk0rVw
         GGlB04Mij1r/0jNX2/DBE3PYmw5kSLimADJz4MjfJkwumGoGhb7HiAHFI+oih90oPeDW
         h9EkLvDAH3lmGV09U8//u6YmLnZk6eWYVlgDGIge1PQ0xs8gv8whaCKZ5MbPaI6SKCEb
         Kx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713289688; x=1713894488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgxo59IYhnHPL9WU4YKhZaxzeo3fMP1MrECdS5RGdv8=;
        b=X9NXxnakdHRkJLjo2YiMV/ae7/u5CNt1niKgEvCHJt8X71gMAl1rBpR0/N1KmOVvRo
         DyiEKijcMLkcjPvyhpPAXvN31HzQFx5cOSKOiJQfWiNbCRM4GoUHrCUN72+L4fcPHLoN
         HZ5yEJ7pMYNtTBupMxDaAr+xNDzqdQLkImU1Infw7uJ9VpZQmr/Fj9/PMMmtUZsseAkO
         08u7/QEtEIA1nZ0pRkzdcoSfThl5NyC1BsmRtZpZyCjhx7SEEbqAAcmEZ/2gatA83Q+j
         1yq61S+Gx+L64GghMHyOKP1lIjNfxISRxveZyxZiMZxk3t6g2bFLFNF7Eyx6RX+lUnwC
         JP1g==
X-Forwarded-Encrypted: i=1; AJvYcCWnm4Syr1vxYbnse2FA1VGShFyb5b2wEvNPVnV7TLnQsryZJ5rsuQd5XE6/UU6GBxtskTRPPblbmh6twb1TU62HOBTKCKxmm8vm7LU5SBE=
X-Gm-Message-State: AOJu0YxEV572+ii+P/HFPShWL7VLN9zr8IOExRTlH0yTYi06gG9s7EOC
	Zrwdv39tIWGN+e7VGAIVPM5mJrxfAsGfCje4grLiNGf+htMHWJ49mMxP4WyYy2E6TJg4cDPS6DG
	HnTWWblPWNtTxFqHzb0sZzEUx1WXDSe4ENxx+Bg==
X-Google-Smtp-Source: AGHT+IFEcewgx6K0H5JoHC0s7S4uCrcrKg0tuesPZ6/XjGUTZZkpFY+pctxrZr4MfL7ku3gK9QgVdIyhlEaUIc8tLro=
X-Received: by 2002:a25:2f0f:0:b0:de0:d728:1b21 with SMTP id
 v15-20020a252f0f000000b00de0d7281b21mr10940224ybv.54.1713289688081; Tue, 16
 Apr 2024 10:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALNs47tEZqL201jsExfF1j7m+yW37YRAws-NTF6hwsxohSKoQA@mail.gmail.com>
 <20240416095333.1108884-1-aliceryhl@google.com>
In-Reply-To: <20240416095333.1108884-1-aliceryhl@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 16 Apr 2024 13:47:56 -0400
Message-ID: <CALNs47vUXA9z8+bM4TOU-Q_NY3wbux3OA4nBVxegAWykzTd2zQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: add abstraction for `struct page`
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@samsung.com, akpm@linux-foundation.org, alex.gaynor@gmail.com, 
	arnd@arndb.de, arve@android.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, brauner@kernel.org, 
	cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, maco@android.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, surenb@google.com, tkjos@android.com, 
	viro@zeniv.linux.org.uk, wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 5:53=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> >> +/// Flags for the "get free page" function that underlies all memory =
allocations.
> >> +pub mod flags {
> >> +    /// gfp flags.
> >
> > Uppercase acronym, maybe with a description:
> >
> >     GFP (Get Free Page) flags.
> >
> >> +    #[allow(non_camel_case_types)]
> >> +    pub type gfp_t =3D bindings::gfp_t;
> >
> > Why not GfpFlags, do we do this elsewhere?
> >
> >> +    /// `GFP_KERNEL` is typical for kernel-internal allocations. The =
caller requires `ZONE_NORMAL`
> >> +    /// or a lower zone for direct access but can direct reclaim.
> >> +    pub const GFP_KERNEL: gfp_t =3D bindings::GFP_KERNEL;
> >> +    /// `GFP_ZERO` returns a zeroed page on success.
> >> +    pub const __GFP_ZERO: gfp_t =3D bindings::__GFP_ZERO;
> >> +    /// `GFP_HIGHMEM` indicates that the allocated memory may be loca=
ted in high memory.
> >> +    pub const __GFP_HIGHMEM: gfp_t =3D bindings::__GFP_HIGHMEM;
> >
> > It feels a bit weird to have dunder constants on the rust side that
> > aren't also `#[doc(hidden)]` or just nonpublic. Makes me think they
> > are an implementation detail or not really meant to be used - could
> > you update the docs if this is the case?
>
> All of this is going away in the next version because it will be based
> on [1], which defines the gfp flags type for us.
>
> [1]: https://lore.kernel.org/rust-for-linux/20240328013603.206764-1-wedso=
naf@gmail.com/

Great, thanks for the link.

> > Could you add an example of how to use this correctly?
>
> This is a private function, you're not supposed to use it directly.
> Anyone who is modifying this file directly can look at the existing
> users for examples.

Ah you're right, missed this bit.

Thanks for the followup.

Trevor
