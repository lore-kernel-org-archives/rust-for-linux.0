Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C130296BD3
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006809; cv=none; b=AYWXJ1kphKJ6wineVcIxkCQtbcH/2sn0qNDr7aM+SQkhbDUYhsy9yvICZhLZUhbx7BAoJn20c+WR/39f+9AQc6sWswW1VBnT48/ZfEavMD+g49G8uRHMj0xW5Ipg6BEmSHfp2eWJ2vaa49+7wIf0PGZply0EjqtaqYmvc/bSiEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006809; c=relaxed/simple;
	bh=942jX0tbSg6HLiQWbLr1U9FRZ+036lwlHUvlXbc+j/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzgTD5uThyPPTgw5auPNPlMplrH1IzE1kRFZO0CHA3MwjH7/PtROaQ0XPBhwxaWStbmdj9O/VA+L1hVEz4DuCdOsKTVv4ujvKz3xzbfUsyBFMRiWAFfWzzfDGmg2/3e2coLRru5yBDHcJTlt6/LYltBoFeMTz90VPQu037gGQmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0GOZdSB; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0GOZdSB"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88a379ca088so102560086d6.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 03:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767006806; x=1767611606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMjg66TkUXnvEEpGyV90gswGFrQoaYQK9vJ+BwnyYYo=;
        b=k0GOZdSByKk7Fijidh2eD6dgeBXp4SmRVSTKIoHqlJXVNEMkm9GNyIB1nhHp/e3An6
         uzs4OYZdVO96AdDlm4mmOCJqLf2SABRPJ9Ur8K3ZS2QcnacoKlNg/I1Jd772RSazew/d
         ZhCSb6B8aILAe9vIlPnY5Ido4yzi2s8TZ8HtcnBMqDW/rvRvP02evZpIeJ6TUX+pyzxe
         oB83AtYTYCNpIJ52LXPGZX3UTmrVL5P+Ns8K4+4ZQOTZiDex/IUmWxN4BAEcg3Kvse8O
         dwhMN1QmlUpmF7QmBsQkjGLBJ0D1WQ8T9sk9i1xQzhyDPHHlFyI31Ck3PUcKRWMAhkeA
         lMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006806; x=1767611606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YMjg66TkUXnvEEpGyV90gswGFrQoaYQK9vJ+BwnyYYo=;
        b=CM5/4Uk9cD3KOJ9v1YUubKRrY26+LGVf1GaAuTONiKOW1Taru0+gSvA3H2RV0wxSGY
         J5xIkIIay4QvqInP9HJOwis6zX+nCVmeo8XKssJHP/XYZOvxhCziM2a1ydygEzE6Kz9l
         o6VsF902GuMJj032hMZpDhIdL0s6vbk66VQxlJRZHqf3438s7zhD7MISX7rzvfbVOJY/
         V85ZmscsUx2UXlRYm/9NRO/STyVWE21dsExPkdYr2SSuaBI56kIkFD5CkRIky9Aivism
         j3RCbDjlHHOd1qklN//FdRYR4xqborj7fTwsObCc+rsa5WchFdfZYFQEiJRmoZwhAWHx
         Ncjw==
X-Forwarded-Encrypted: i=1; AJvYcCVYW/u7Xm8W+dW4wgXSZ5WJ/VwMou2VKA2pQjuYEtE8QJ3QS99OKDn773Yl6BFzb+9e84Xcoa2ZpcaFfZPgsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7L31HUGpJYrSNZrsaV/eo4N8IFPFDOp280ulxRY2fbBAaHCeW
	9y21qM8Wj2KzRg9hsX/288T35upYKMLvJqBKBM/W/hJ65m3bQPguQRD4
X-Gm-Gg: AY/fxX6JaR5V8+nsByBAPwlnp1v4og2Y/mow26FlMex027Q4c6NSUK04LH8YaQSkXHk
	hXdTKocdLfeaawhD+fVRK9POu1XCtfp3+eLknxLBiRVh368VLfyW8ZPhwR4E1v7HFOmmDg/9mf4
	6IANVzyE1G1/Ra8NygAfn/AjBulCubiFLecQ5z3JTszwlnGIpWh8tdu3zNarVAht8wvECpCliuH
	Dr4cWDBndOjs5MZlX/kTbraU0eKWGvoLAfATSQ5QdhiOJXFYOmxTdPF934sIBS+UIsgJhBMZz4o
	lyNTXixrbpgJD7ThH/C/f15jeGeS9gQ+R8SIpgTllIDiRvDvmgpvxa8zxyzcPwNF4xrHPuXRMmL
	uCAd95tKV79wSZGsz2pfUV1E1QjeiocM1+Da/k1j6wTNF1mSTvGo9mVQkNOpatkv2nFVF5t9iN8
	jsdO0y9RMhK+uxLNuoIjMDFqS2vymPgXXOXjExoDB8xwvdO7LPMOr7KpPMVzlygz1NNG3Kvpivk
	hyGWl8ZEB/A6g8=
X-Google-Smtp-Source: AGHT+IFuEOKRfSv8uVgWXie4wEwpy8DkFPSl6ov7JV7YZkB4orz9LgbEPoa5npbMxH36uL/UQoyHgw==
X-Received: by 2002:a05:6214:4603:b0:88e:adfe:89b7 with SMTP id 6a1803df08f44-88eadfe8c7dmr395959166d6.30.1767006806335;
        Mon, 29 Dec 2025 03:13:26 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fe52sm219102866d6.11.2025.12.29.03.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:13:25 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4DA1EF40074;
	Mon, 29 Dec 2025 06:13:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 29 Dec 2025 06:13:25 -0500
X-ME-Sender: <xms:VWJSaewov2qo63vhzN7kXgda3bPKRHkTITJUoBcAjRetQ5ESd97rZA>
    <xme:VWJSaQwUJvlTbKEsYyo5ruLMU23zN2O2b_m02jX8o6a9KlE9fiCqGURBPhl8Flvnr
    nOLFsdEo_kXGVLRdwZNRrd1GC-o3RDJpfJG7Ru2eXW-QfyYOFmIsA>
X-ME-Received: <xmr:VWJSaeVbM8cbIC8pSeAahxk7A2BYIvtp_OrLWVXZxK6g2gj9-afn2gt3rA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejieellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhr
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgt
    ohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrg
    hrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:VWJSaXQqNFDuQEr9aJbg2Wb2PQl9k9nFuVChKetvqnIOByPlZGhRxA>
    <xmx:VWJSaWQuODnXPfeG5UD3TJdUL3CmxuSsu2LKqT2abBaK0NFXKe3j4w>
    <xmx:VWJSafeLj_CtDUGSM28YXYHL7CE15_jJmaxI0Q1uu6qJLC8oCt69Ig>
    <xmx:VWJSacfPCWY40jWWEX20b2pMuGEUqPw1XNBnE0m09oDKh-EiVG2Nzg>
    <xmx:VWJSaTaJzpAPhZA8r8alBn73bgXvxjDJtFzblfaEAFUhb6k8_ImMrWsE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 06:13:24 -0500 (EST)
Date: Mon, 29 Dec 2025 19:13:11 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 1/3] rust: sync: atomic: Prepare AtomicOps macros for
 i8/i16 support
Message-ID: <aVJiR72gcz_uonoS@tardis-2.local>
References: <20251228120546.1602275-1-fujita.tomonori@gmail.com>
 <20251228120546.1602275-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228120546.1602275-2-fujita.tomonori@gmail.com>

On Sun, Dec 28, 2025 at 09:05:44PM +0900, FUJITA Tomonori wrote:
> Rework the internal AtomicOps macro plumbing to generate per-type
> implementations from a mapping list.
> 
> Capture the trait definition once and reuse it for both declaration
> and per-type impl expansion to reduce duplication and keep future
> extensions simple.
> 
> This is a preparatory refactor for enabling i8/i16 atomics cleanly.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Thanks! I have an idea that uses proc-macro to generate the Atomic*Ops
impls, e.g.

    #[atomic_ops(i8, i16, i32, i64)]
    pub trait AtomicBasicOps {
        #[variant(acquire)]
        fn read(a: &AtomicRepr<Self>) -> Self {
	    unsafe { binding_call!(a.as_ptr().cast()) }
	}
    }

But I think the current solution in your patch suffices as a temporary
solution at least.

Regards,
Boqun

> ---
>  rust/kernel/sync/atomic/internal.rs | 85 ++++++++++++++++++++++-------
>  1 file changed, 66 insertions(+), 19 deletions(-)
> 
> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
> index 51c5750d7986..0634368d10d2 100644
> --- a/rust/kernel/sync/atomic/internal.rs
> +++ b/rust/kernel/sync/atomic/internal.rs
> @@ -169,16 +169,17 @@ fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
>      }
>  }
>  
> -// Delcares $ops trait with methods and implements the trait for `i32` and `i64`.
> -macro_rules! declare_and_impl_atomic_methods {
> -    ($(#[$attr:meta])* $pub:vis trait $ops:ident {
> -        $(
> -            $(#[doc=$doc:expr])*
> -            fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
> -                $unsafe:tt { bindings::#call($($arg:tt)*) }
> -            }
> -        )*
> -    }) => {
> +macro_rules! declare_atomic_ops_trait {
> +    (
> +        $(#[$attr:meta])* $pub:vis trait $ops:ident {
> +            $(
> +                $(#[doc=$doc:expr])*
> +                fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
> +                    $unsafe:tt { bindings::#call($($arg:tt)*) }
> +                }
> +            )*
> +        }
> +    ) => {
>          $(#[$attr])*
>          $pub trait $ops: AtomicImpl {
>              $(
> @@ -188,21 +189,25 @@ fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
>                  );
>              )*
>          }
> +    }
> +}
>  
> -        impl $ops for i32 {
> +macro_rules! impl_atomic_ops_for_one {
> +    (
> +        $ty:ty => $ctype:ident,
> +        $(#[$attr:meta])* $pub:vis trait $ops:ident {
>              $(
> -                impl_atomic_method!(
> -                    (atomic) $func[$($variant)*]($($arg_sig)*) $(-> $ret)? {
> -                        $unsafe { call($($arg)*) }
> -                    }
> -                );
> +                $(#[doc=$doc:expr])*
> +                fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
> +                    $unsafe:tt { bindings::#call($($arg:tt)*) }
> +                }
>              )*
>          }
> -
> -        impl $ops for i64 {
> +    ) => {
> +        impl $ops for $ty {
>              $(
>                  impl_atomic_method!(
> -                    (atomic64) $func[$($variant)*]($($arg_sig)*) $(-> $ret)? {
> +                    ($ctype) $func[$($variant)*]($($arg_sig)*) $(-> $ret)? {
>                          $unsafe { call($($arg)*) }
>                      }
>                  );
> @@ -211,7 +216,47 @@ impl $ops for i64 {
>      }
>  }
>  
> +// Declares $ops trait with methods and implements the trait.
> +macro_rules! declare_and_impl_atomic_methods {
> +    (
> +        [ $($map:tt)* ]
> +        $(#[$attr:meta])* $pub:vis trait $ops:ident { $($body:tt)* }
> +    ) => {
> +        declare_and_impl_atomic_methods!(
> +            @with_ops_def
> +            [ $($map)* ]
> +            ( $(#[$attr])* $pub trait $ops { $($body)* } )
> +        );
> +    };
> +
> +    (@with_ops_def [ $($map:tt)* ] ( $($ops_def:tt)* )) => {
> +        declare_atomic_ops_trait!( $($ops_def)* );
> +
> +        declare_and_impl_atomic_methods!(
> +            @munch
> +            [ $($map)* ]
> +            ( $($ops_def)* )
> +        );
> +    };
> +
> +    (@munch [] ( $($ops_def:tt)* )) => {};
> +
> +    (@munch [ $ty:ty => $ctype:ident $(, $($rest:tt)*)? ] ( $($ops_def:tt)* )) => {
> +        impl_atomic_ops_for_one!(
> +            $ty => $ctype,
> +            $($ops_def)*
> +        );
> +
> +        declare_and_impl_atomic_methods!(
> +            @munch
> +            [ $($($rest)*)? ]
> +            ( $($ops_def)* )
> +        );
> +    };
> +}
> +
>  declare_and_impl_atomic_methods!(
> +    [ i32 => atomic, i64 => atomic64 ]
>      /// Basic atomic operations
>      pub trait AtomicBasicOps {
>          /// Atomic read (load).
> @@ -238,6 +283,7 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
>  // used for now, leaving the existing macros untouched until the overall
>  // design requirements are settled.
>  declare_and_impl_atomic_methods!(
> +    [ i32 => atomic, i64 => atomic64 ]
>      /// Exchange and compare-and-exchange atomic operations
>      pub trait AtomicExchangeOps {
>          /// Atomic exchange.
> @@ -265,6 +311,7 @@ fn try_cmpxchg[acquire, release, relaxed](
>  );
>  
>  declare_and_impl_atomic_methods!(
> +    [ i32 => atomic, i64 => atomic64 ]
>      /// Atomic arithmetic operations
>      pub trait AtomicArithmeticOps {
>          /// Atomic add (wrapping).
> -- 
> 2.43.0
> 
