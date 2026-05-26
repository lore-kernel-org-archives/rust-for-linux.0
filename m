Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FF26B764
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802833; cv=pass; b=rOCZFz8s8BPLE9yQgjj6Oy6G3FZVNicr74U4jnfiFrLu69hCiNmC9n+FRXl+U5/suLvXQYICop+FtNTDCsSlByMx9c4Jxkv9byqx8W0gAGKbU67kGEgSCuEimXBGD7cPmC1obICJXc/INcHAuuU6JdR+quNLZQqHozFljNHpBJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802833; c=relaxed/simple;
	bh=EIYlIEXc5tc+hid8Ng5d3qn7UD4ojiNhKWhU2R870zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0xm7uuOrhdQ7aKDItHhuNONhvvmc2ZkJFdkoV2ZCy5n4gVjRSjBIfB5HI8K6D2eU4DyaVNPFsmYMmXt3dLn1YbCcGlBNqUrL1KPhnnTqsZLxELOQ/2/gAbbwWck98dX8trpIngHfCOYDEpsKpTRPeaH7arxLNaG6kYwR3CrsrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNOgNO8i; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNOgNO8i"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3047a628b34so187708eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 06:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779802831; cv=none;
        d=google.com; s=arc-20240605;
        b=Dc+DX4sfBdjyIXHEVk+0PgP9vFb5Z4XYqKckSvvXg1Vz1eweNsZFezMV58nOtyqNgk
         F6i2fx+g97HEoN+Ct/JfHC5ZeUwt45e/h0Ldqos1d4LIis36Low3jWuV4wA75sEDXGQb
         qdJ4v25W8XVNvhhP9MiDl4Qu9a7FJQsYlxfkoF5OjI/B8X37lgQn5RmA9DQ+qQFiJWVr
         N0KIAO/x6svWC5/GQ3VKKFW9SEGiNXhbX1TfvVUtBYye5ZL29k+8VEIulRvcFilsblTt
         UfLYv793zo4zU6vuuMiZWlmHVm+tOU+WN5yLiCbu/7ee4s87IzTeVCuKH5uCNJ+V4Ffr
         EbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKrFN0bQRu9gfOMs5pJYKzklMZbwjQgz6+P0DJa82gQ=;
        fh=sKxC73cu6RXQmhDCGTq9Za0+a3DMvb0DrSAB1znQvEA=;
        b=X1xXmQFp5yeMFpGCQn3b4aeQhB7f6UlHW02OJ9tF60MzYgAoE/BjnEc3zZiVwaVDfl
         iQyOn6s3sLCKn7W32xJCWf5wMNtW0El9FctyROr5dkJalJYYT70orh8vsniYj81I0MNM
         FAkwX8e/WK+Y5PfwrEHRTNEjiKL+7s+Unh1MWV3gV9b51rfeULSvcrv58sXBL7Mf4zzV
         mp9TsYa2F4kUsRRvR+JCJRPSTVAzQKsNEl4kaFB3pbX+IxKuUjPLoXm6PmcYTPPlntEc
         eSFI0S0jzt7mvNMZQ/updduI+hl03s5a8a0EOIkfg5GH0y7UBr8Ju6tSlcu/JXDKa4C1
         AVsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802831; x=1780407631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKrFN0bQRu9gfOMs5pJYKzklMZbwjQgz6+P0DJa82gQ=;
        b=tNOgNO8iDTy5Hzf6bwOKwz/BMAZttIIQSIl68607+s7O32OcuGJKiHqajpsnU8nMK9
         UHBKH7YUkiIWkOkjz+QzVk2Hhzb3vrpwyS5FgHz+0YgL6U4SsxhvrgXrMtMcHLqZ5PdB
         ej3N7PFmvqUj+6OJzR3XNx04G9DwBWosS428agd1FTSVOnWAVZZ9iEKccyG96lH8XDJX
         pmOCInmhxguhZu1YU0itj78wUfoXQ5epmLNfbp6tPsPouKx/uuFPjqzBJz+EvGVFw5VO
         l3BjzpT3V9SjvkTLnm65neUn13+lFxVVvBaEltpy7NVYwK1WgT0lt6gB2uuP2nEV3iXD
         EyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802831; x=1780407631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKrFN0bQRu9gfOMs5pJYKzklMZbwjQgz6+P0DJa82gQ=;
        b=aAWN0U9g4ZiwnTOO6HD7ccWEzBcoQ0EhHczrptV22vS2Yxy9dxQ51E1ZL//Gqhez2K
         EVOfW3nqzLji3g/AiSRlSdd3sdo1dP6kbusVDjO7Oj8pfXM66a8OoXXQrM/XiJO29/hZ
         NL8rmwktXaZSJgAJKVs7ZqpW2P9+WTBWbMLRtJhXLb3aVvs9Npu5Uj9WymYacQytux/J
         L4KPVRDpacvRnE1B7u1gu5VZuJkVmYddmj5E2qe7PEfsIdc6f2H/REYFiNpLvLBGS7DZ
         Q8rowhSmuA0MqLkZb4a2rRcFEMl8V+/DVZfFjk3D9jgYBN41fnOIJ+nT9J0Gstm23ozV
         wt0w==
X-Forwarded-Encrypted: i=1; AFNElJ+LF/bq8LAdLQC3EJf7bl4hWNwAA+vYo3nd6dwUvc/1N75tR5yn64KUOu9K40AgSXdlIi4Z9/IRS64jdm+lrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjGEcuk5elRS7Pt7SMS+TJ7mvisJHR7fm35EClo8XovqmxBBT
	mTdxj5Ore0PGIceNuK2QOMAIOUfwrgXWtKviqnu/DMy3jB4vSXWmrb8C+AvwpfxMsdNuX3AnOk1
	o37bp7mHUoBVcMe7zlzxBGgmkmpCxfwI=
X-Gm-Gg: Acq92OGoPcOw5CafUePtXvovttHTT/MLs0QyAofB5/pyof3XGdpT0FPDPklZzWv0qz7
	8E7kDbt3UDo5isXhqLFusxOna5v/c3lUWEVx1uHH402UpJLAbGx5EzUM5/7wGgPtvfZdnz9DQN7
	lNvNQ7ocHjBIoq3p5jP5PrpXmUx0KTc/FLIIP1IQBqv6cEZ/jMwOs60FBuSXw86mf1fBd5TjJc2
	419LjNWPkb05m6yZGlKp+JVI5RnyqHifirBR0j8dccS5lmk7jq34FSLtFO9EFbV5YCMEwHnRv/g
	ERC3Zi9uYtYlxfgcUzd2LDwl8QNgXiIMSDRKQmURI2vbNa/boNBWnVWv1Kz3FhXNIxcav/gNZcF
	RFyX+p28dbdxisH6VKOobtAci3Q3ThODtBg==
X-Received: by 2002:a05:7300:3255:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-30448d4e2fbmr3950265eec.0.1779802830932; Tue, 26 May 2026
 06:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
In-Reply-To: <20260523-is-vmalloc-addr-build-fix-v1-1-73c919440c41@zohomail.in>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 15:40:17 +0200
X-Gm-Features: AVHnY4JY3BERx0GWS8ietVYuqgpvN7Ck7UFpC3ku9nW4ZHWYohQhxxbwfYTlApo
Message-ID: <CANiq72kJL9gqQS1Kcv5gVY_95WA61cC0xqx1JU8vsHYUsi3RAg@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: add is_vmalloc_addr wrapper for NOMMU builds
To: shivamkalra98@zohomail.in, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 8:54=E2=80=AFPM Shivam Kalra via B4 Relay
<devnull+shivamkalra98.zohomail.in@kernel.org> wrote:
>
> From: Shivam Kalra <shivamkalra98@zohomail.in>
>
> Commit 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
> introduced a call to bindings::is_vmalloc_addr(). However, this
> fails to compile on architectures where CONFIG_MMU is disabled,
> resulting in the following build error:
>
>     error[E0425]: cannot find function is_vmalloc_addr in crate bindings
>
> When CONFIG_MMU is not set, is_vmalloc_addr() is defined as a
> static inline function in <linux/mm.h> that unconditionally
> returns false. Because bindgen skips static inline functions
> when generating bindings, the symbol is completely missing from
> the Rust bindings crate.
>
> Fix this by providing a C helper wrapper, rust_helper_is_vmalloc_addr(),
> in rust/helpers/vmalloc.c. This ensures the function is reliably
> exposed to Rust regardless of the MMU configuration. On NOMMU builds,
> this allows KVVec::shrink_to() to successfully compile and correctly
> route all allocations through the kmalloc realloc path.
>
> Fixes: 47ac2a4b5cd8 ("rust: kvec: implement shrink_to for KVVec")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605220811.LRplxeBR-lkp@i=
ntel.com/
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>

I can take this in my `rust-fixes` PR unless mm/akpm plans to do so.

Cc'ing akpm, Lorenzo, Liam and linux-mm, by the way.

Thanks!

Cheers,
Miguel
