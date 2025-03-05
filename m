Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A301FC7C3
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164182; cv=none; b=ajH1GOHXATMNoxUSwRGaki8fG1PW3cktibSGWr43mKqHs49siMtM9JxKEDTbawa6X8Ri1cKhNrN2rNGNZUdj2gnurQd4Q3TMe55M6rQUhgyzJUa23Wi/L6+6RlUWvpSrfi6vJp1Ax3rLuS9Mc1OeldUZQ8lkbN6uLZmNz4lFRbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164182; c=relaxed/simple;
	bh=SAf7h5gbxMINcuKvSl8+lprJ6OvJxNewbzasDdhpwHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LKZJBpFBOMPAjtmItRnMt13zqQnLbsHFU3cjHz6av+jfudhz2jdeeEKLH27uWLWkYRuy6nHY0c9oB3myM7A8CRnf4XgJY+Zx9g0QXfPzqxwIHaZvrbW7b8WOeDDotM0b9WlHMVcGFi94m6iLDOGG8U/e3iyX6m55f+Ym7tCCrSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yLwJKKrA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yLwJKKrA"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43942e82719so47509915e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741164179; x=1741768979; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=;
        b=yLwJKKrADZWAvKTGP14I+B+ah0jjShYY5QKbBwrs08C4gBtiPCAlGmQSzLI+ceHxwS
         owP4X7mAUhDtozJxNT8tQOEDQhtiOLjYTd5kG1CZIm2XNNT8EggssEKQm/dfQihh+a9r
         beiy9TzSRek6dZV4eOSDL1xbgowk+jTs9tS8ZRLDbLFptufQ2kqaJFmZFCSmsXTXSIQ/
         lIQiTxFF+IG3pxHHn0NjKwvFEunJuCLXbwRMN1RgPGi38IKK+9xlyzMG0h88vsffbl6v
         xV/yNO7uDs1neJtQer+yFYcydzjTKtRPq8VbmTfv80bKW7SecYwEd1ChrluMOmB0qLVH
         3MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164179; x=1741768979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fbv4NmRo8rWuhx/VklrPSnRlTJS9K51A0iqhEMUSP14=;
        b=VKfBqCMsOENd/WTbp9cqHLMXN7zTswm5+JeckUbioNn2hElcVgy9Qd/WRnmw1qClbc
         tN+gsBAq7AY0B6vV2pDLZYVyMxMA/VFNItVvXQiZDp4hqDsoHTdE53eGq1Toy1xOsEdU
         sh9UozDaixTK/9pBFTZkw7OVDMDE5IP/VUgC/YaR75BxHdJa4xqCC+7ZpBrhS0TUcT2/
         brUvfIJmd94qdVZSZHuOue5mjNDJjwWgddqa71OZoFji2Q9Y8tQBJzyLRDBS4rrdvhSY
         Fy3kRx7CVAA0ty6zF41kU3ScepKv73i+TY2bvQN/mE+5FEZsyoQyrF8N5oOU/uRxaq1i
         erxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9o7nKB/WXAf7FuI4J85oFmvIQZxF/QkYUNIs4vF8E7hWA1lVWXHYkCi3TWBhiSwVYQym6U5SdR2MWTpqZJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LCltq/rgvGyupRLaYAVVHiX8XOBRvKKuzr6OsRhKLY10/iQR
	UGjpuMQmPi7kQjpnq6J1t4e27VKCbt5ypyd0ySZAyZcx1spO92C3f///n0N0SYr8n0gQ2oy27yr
	Fa9Qgawqd/g+QQA==
X-Google-Smtp-Source: AGHT+IGNc0nObqBIdB7e0pv2I7PeyN0NrbTAt23TRGJiElvbDtYcA/dcph5rmLVDajCFRggPb9cddtoV966/r0s=
X-Received: from wmgg24.prod.google.com ([2002:a05:600d:18:b0:43b:c99a:4af8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c09:b0:43b:d04a:3506 with SMTP id 5b1f17b1804b1-43bd2ad9527mr12625425e9.25.1741164179002;
 Wed, 05 Mar 2025 00:42:59 -0800 (PST)
Date: Wed, 5 Mar 2025 08:42:57 +0000
In-Reply-To: <20250213135759.190006-6-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250213135759.190006-1-fujita.tomonori@gmail.com> <20250213135759.190006-6-fujita.tomonori@gmail.com>
Message-ID: <Z8gOkeJ8o2pMCwGu@google.com>
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 13, 2025 at 10:57:59PM +0900, FUJITA Tomonori wrote:
> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> macros doesn't work so this uses the assembly code exported by the C
> side via ARCH_WARN_ASM macro. Like the static branch code, this
> generates the assembly code for rust at compile time by using the C
> preprocessor.
> 
> file()! macro doesn't work for the Rust inline assembly in the same
> way as __FILE__ for the C inline assembly. So the code to handle a
> file name is different from the C assembly code (similar to the
> arm64/loongarch assembly).

Nit: Should be file!() not file()!.

> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> index 6ba39a178f30..f1d7f4225332 100644
> --- a/rust/kernel/.gitignore
> +++ b/rust/kernel/.gitignore
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  /generated_arch_static_branch_asm.rs
> +/generated_arch_warn_asm.rs
> +/generated_arch_reachable_asm.rs
> \ No newline at end of file

There should be a newline.

> +++ b/rust/kernel/bug.rs
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 FUJITA Tomonori

2025?

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +macro_rules! warn_flags {
> +    ($flags:expr) => {
> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
> +        // SAFETY: Just an FFI call.
> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
> +        unsafe {
> +            $crate::asm!(concat!(
> +                "/* {size} */",
> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
> +                "111:\t .string ", "\"", file!(), "\"\n",
> +                ".popsection\n",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> +            line = const line!(),
> +            flags = const FLAGS,
> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> +            );
> +        }
> +        // SAFETY: Just an FFI call.
> +        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
> +        unsafe {
> +            $crate::asm!(
> +            concat!(
> +                "/* {size} */",
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
> +                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
> +            flags = const FLAGS,
> +            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
> +            );
> +        }

I generally prefer to have the cfgs on the macro rather in its
expansion. That avoids emitting a lot of code that is not actually used.

> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! bugflag_taint {
> +    ($taint:expr) => {
> +        $taint << 8
> +    };
> +}

This could just be a const fn.

> +/// Report a warning only once.
> +#[macro_export]
> +macro_rules! warn_on_once {
> +    ($cond:expr) => {
> +        if $cond {
> +            $crate::warn_flags!(
> +                $crate::bindings::BUGFLAG_ONCE
> +                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)

Or maybe a constant?

const WARN_ON_ONCE_FLAGS: u32 = bindings::BUGFLAG_ONCE | (bindings::TAINT_WARN << 8);

$crate::warn_flags!($crate::bug::WARN_ON_ONCE_FLAGS);

Alice
