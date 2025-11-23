Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8B1262FD7
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 21:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763934714; cv=none; b=NwHQXkrLTvyzqit1wwMR6hIocxr5sabwGVkNNI+a1VoldUxtj0wBjSJGf3tnPudozeYHJzlu9iujTw8EDZmmn+2+S2EAh5BZRTwQbvfAEMyuhKYoC0SFSsuYrIbCTQYxr+R6s1jrxBrXHyBUWYtIA/nLFyXnqRK3qSBt7xlhLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763934714; c=relaxed/simple;
	bh=KnO7pb4RKVQ0Wf09fszQAMwierpBb4a3L/+VDN/PmZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nA2p+wX4K1MknsEQumX8fGLAispcHEQLDNLWab4YATpJimksFiKWd97FSynkwNJA6t0pKYMw7KtQnWqd3kT1UZMqLnfxUuNYYg5RqjKN2Z3+yMObCy69xCuleG+cSLG5Ob6BsZL2VjaDosqE8Z/L3Cj2jmvOsK5yQpL7s8BBcs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIRO19RZ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIRO19RZ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b9da0ae5763so398037a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 13:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763934713; x=1764539513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDpJZkhL4RD7DFsNylrEccAx4j0omH1HPTKnYRPThMo=;
        b=TIRO19RZwzS5ewT1b+e+A/EhQwyK9aQe4KZvCLEHyfzwn1Tbrt/WweX3NZ++Ua34HI
         zSd0pBxGPfntlfLMJufvhyoFRT/R09cS/kK0gF3IjR3fknz+VQ45h7Usv8zRdPpezZHh
         wiBYFAgsFdI8gg18oiJsP4W8izRNSH7EBFyOLr4k0KVWY9j0b03EXfxAQd1maNx6dtAm
         KqREGL9hhMkP2kgjOdLiE0/pjsqkor7XLMqi8iBcBCLI4Ur/Pp3cBO1DozfSMOreZQOQ
         Rq0eMFVMexArjHsZa+BvmNPiuGT2dmsjHF4lN1NoQFoC3tYTYtwG18qe0yQUTA66x/5L
         c/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763934713; x=1764539513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EDpJZkhL4RD7DFsNylrEccAx4j0omH1HPTKnYRPThMo=;
        b=mXJy7EHLzD3M4agYurBr6+ExQGvKof+BpOVKvrdpzHr3Ii5aC6SlTkA0apUu4lLqsL
         xeIlzS5KZ0T5T07rZygZNIOojeepT9CgVODce+jUBUpQuZju6sXWyYej7/ZAe/b7SFxF
         L/nh9TiHL5kfE3MKoV5czTk7KR5YllmHMEznD120zucH5SH+eAYhhv/N0DnEipsbf+wh
         YETxgcZnxQQRaxOoNdo6w2tyV48K7OYE97ZKvNAUtu97t8Yv1MhBwGJ3UcyMnD9lMqi3
         XXnmwct7rLPop/Jn9CByEhfeV33oI7wlvr09hepjYbwxLZeJ3uI/A0+fro5vi9wU3v0N
         FLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWve+11MdMC+7XjzcN9s5Mdb5RaJh1eAHcYUEjQepYG+ngF6FCUpe/5TD9nfyPGuMtf3f69/pd2LzigN4Np7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMAEJkNRK+wdVpVFSEDcLvB9ouu1zQmzygvojuk1FsSC0SXVw
	WCLAlv/PsN1DDpBmXOzfvL7Ytdfd8Id7cWAiPdB3lsMCgrXs5IAUn6rzHwtPXQsP5WhsTeVSGPu
	Ap4OZKO+GFSDvCAR0BYxb6Wp3WsvK4ho=
X-Gm-Gg: ASbGnct4T4SYeiOEtsTq1UoNDaeGNYQWv2iTAnmrjsLqjr5Ro0owMAlnL+fR3sRaXZk
	YzfrNk4XAPtcKdPpS7NwepyPVk18G9Nni5iEsn1eVuVZNE/oekVNCv+idKXIZAQYWqQMVax4p24
	2FW3Xb2EJNWXQgDhdFvS/A+QvDWcpyqx1Wamkr8ISjlRc18NXOJCkSZq169PA0js6V7dgGa79g7
	bhHWOHC6ai3KSAYtNUmkOT59SmyE7UmChtMaw7wT8h8P0S5bDnAbCo6VwadkpIhM0EeADmjJbIx
	GFHytoTpDHRGJjyFmQTHgrDR3/140D+kpljHaj95Jvr6YR3jKm+N6r21hRZB+6YEv2AFvX58htn
	L7Kbgk8dKjLBlFw==
X-Google-Smtp-Source: AGHT+IEMQHmdyakOeIIw3iAuL1W7GGk/NFW1yNE2weFpvdkukwJdMkGgLprkTw1ukYoLyuSd2K1g3cQNsP+Qg9KmnmY=
X-Received: by 2002:a05:693c:2a0c:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2a719277278mr3806619eec.2.1763934712562; Sun, 23 Nov 2025
 13:51:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-bounded_ints_fix-v1-1-1e07589d4955@nvidia.com>
In-Reply-To: <20251122-bounded_ints_fix-v1-1-1e07589d4955@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Nov 2025 22:51:38 +0100
X-Gm-Features: AWmQ_bkP6JS2fs2ekvtebgyJyWDx0pvA9y8x5GoMhQYrKrQtjLPinN_gCZPJbgQ
Message-ID: <CANiq72kfe=k+vuJ13yvwzfNg-or3Np-4+XiZ0nX-YFoDTY=n4Q@mail.gmail.com>
Subject: Re: [PATCH] rust: num: bounded: Always inline fits_within and from_expr
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 5:01=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> `from_expr` relies on `build_assert` to infer that the passed expression
> fits the type's boundaries at build time. That inference can only be
> successful its code (and that of `fits_within`, which performs the
> check) is inlined, as a dedicated function would need to work with a
> variable and cannot verify that property.
>
> While inlining happens as expected in most cases, it is not guaranteed.
> In particular, kernel options that optimize for size like
> `CONFIG_CC_OPTIMIZE_FOR_SIZE` can result in `from_expr` not being
> inlined.
>
> Add `#[inline(always)]` attributes to both `fits_within` and `from_expr`
> to make the compiler inline these functions more aggressively, as it
> does not make sense to use them non-inlined anyway.
>
> Fixes: 01e345e82ec3 ("rust: num: add Bounded integer wrapping type")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511210055.RUsFNku1-lkp@i=
ntel.com/
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks!

    [ For reference, the errors look like:

        ld.lld: error: undefined symbol: rust_build_error
        >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:8=
3)
        >>>
rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u8,
1>>::from_expr) in archive vmlinux.a

          - Miguel ]

I could have rebased, but since you sent this nice patch with a good
commit message and kernel test robot reported it, let's add it :)

Cheers,
Miguel
