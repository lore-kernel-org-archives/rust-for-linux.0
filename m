Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C031372EF1
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721563; cv=none; b=HGjd7VAlLNL58Tg6TJOyHxc4KI0EXWs2bfKuEtQsq2fua1GldaGAJuJd6rm2Y0N8WHo0C6HwVQ4CeSaPYWA2kmk5kgf5StUcNY7HhLoLg+jaQZPh7N4uEDgDWvcEPka6NjmHBe4XbcFDPeHAHex3xyxjCenS5dR0S3qEYkoq2fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721563; c=relaxed/simple;
	bh=tmhfjL+7A+jarJnPQhyIwqYjI/s0zpjORzM9eSIVCtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Par274OKxH8TSxwDTjjPmABu5a7AbxN3KNdMQuhi9IrZQLp73MIAx6B33yC3ggcYxDMHuOtDCfz5T/oIttRyMu93k7lW8W0OMV3gAhWEJL/YF7NrJsN2+W2GDz0hmxLpRg4PMDIfid2X6FhbNp6mEwNl/QKE8Kx2ZRpne2nABrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ErcF2Wj3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ErcF2Wj3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cb59f6ba26so35705ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 15:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783721562; x=1784326362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vrj/KNeeXRo3F4qSEnUw4GznCEEs9Z+LOPo84ArtpU8=;
        b=ErcF2Wj3AoCk+mpzarjA4PCkWkn/dwXPVXPbjd9YVO74Vz5we/Qfb41Ab9xr4Qt0JF
         pCyVc8Bvr0Z4/Txp7JiCCUkswpd+VQg9ZhecIs5cVlVzE+Fl/DBcA8Q0ai06w6TkCLnK
         Dwc0bzDlhd15+xOP6PzooPAka2vyU1SBjgKWhETfQQCeH6fnQXuXaKjOsnwrLnureJ+2
         yQbKhaKlgGdUDsNP8cYqBcGnrPTIxjDkUiK/ebQwipnl03XLqYHlKWAjcb0RnMcn9r39
         lmQSC/l/tdQZvvbemxGMGh6yfST/LayHjsM1+Y4g1KkviHu4E9PgqZViayLU0pyQU1ac
         Nspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721562; x=1784326362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vrj/KNeeXRo3F4qSEnUw4GznCEEs9Z+LOPo84ArtpU8=;
        b=Bsf/SaaJkQ7vF+KGJflrfIyqIKr62tEorc5uIW9QmEtFH009b0B0nqj9hGRcsKNlvp
         BMih7BvYfU9EODa5z1UE0ZH0ABNQfXoEyycOxxK5+KoFczHK0NfAjwPiJScRitG0d05e
         wa45pBosBKrMXneSKlCn9yDqwpnRM9jlDjbosHReF4u2sAqPU3qOY+o4vmmiXOlEJNMZ
         7zzytKDt91V0AYu0DESLCyK2MMROyYuCk9PWEv1Uy1TAXSZl8EzIWYDynSafKnFJGsTi
         FPX+kUABlvLE2Zq8zGChN1+UroIz9Sl0vOFyi/Xv278sNkOsAcZm7adgB5JbubvhOqOe
         rC8g==
X-Forwarded-Encrypted: i=1; AHgh+RpxNg5P6JDuD0Lgcx6NgAcSKwNn9QGG1gIb50Ooxloqd/ygOY9ZEAkXHruUaL7+aGFvOv3FxUPL/my+j3WHOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxNRTc5orMOyTkuRpckxjjxsag0pkfY7Fv+0mDFgDCRJThjoE
	V/oMc2YsaJnc2X8I9kXFYpRUd8yjHzmekC9rKpLrjNet60ERea1nja/4A1i8l1YeiQ==
X-Gm-Gg: AfdE7cnMor7hmd/0+V2Yc+fQ6UwnF02slKujAU3uSDxUuigGGgSywuxeAhrvnSr1tH2
	kgty6+c74cSF4xki0Rv1FeEhdqOKRaQdBIKwBsoh5/VcODScpu1MmX8eaeS6XskgLJtCcXLuDNf
	2ei1B0WyqH8NaqyIwedM+cQy04TK+1Ef5AOAPWkWtHyi5sFMiItdN3hwpAybJcHLK75ZW3iwa5w
	VoLsKeW6x7iWbRBNPIv0LIJBRxJ+KnPgUUJbhMsRHemdtkBsY6dESojdm1GsffkyIHAb5D66Dz1
	olN/5JT5pvCUWDK8VbOTlFfxO2QsE9GFIZVrdie3b5ZILHW1QRifZt/k/CWnFTu9ji32A7UtkVs
	lLeS/4L3ZKTADKms06fWvnyZ6advMvelJufepkrN2UIYryJBWaymX9BJARIz5+QSYnHWffihHeu
	1vDq1Ck/l68mcbe7afWjmtN0yBFXGEBPji31+zHZl/6EsyqpWZUU9lBAZ43Z7jiaLyl1kAYuNNQ
	FYX3TrIfVChBZu+AELikdU/4RzTnnWmHnpj
X-Received: by 2002:a17:903:2301:b0:2ca:ed25:9c2f with SMTP id d9443c01a7336-2ce9f292e51mr1293035ad.16.1783721561213;
        Fri, 10 Jul 2026 15:12:41 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574ca88sm3281168a91.7.2026.07.10.15.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:12:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 22:12:35 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: jahnavimn@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/7] rust_binder: Add dynamic debug logging mask
Message-ID: <alFuU1Uek6t9v_tZ@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com>
 <alFMOYlB24vuOxP2@google.com>
 <DJV6AD2E0WK3.BFCKB6AM6A79@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJV6AD2E0WK3.BFCKB6AM6A79@garyguo.net>

On Fri, Jul 10, 2026 at 09:27:37PM +0100, Gary Guo wrote:
> On Fri Jul 10, 2026 at 8:47 PM BST, Carlos Llamas wrote:
> > On Fri, Jul 10, 2026 at 02:32:52PM +0000, Jahnavi MN via B4 Relay wrote:
> >> From: Jahnavi MN <jahnavimn@google.com>
> >> 
> >> Implement a dynamic debug logging mask (`debug_mask`) for the
> >> `rust_binder` module to allow dynamic runtime configuration of log
> >> levels. This enables parity with the legacy C driver's debug mask.
> >> 
> >> Since the Rust `module!` macro in the current kernel build does not yet
> >> support declaring module parameters directly in Rust, we define the
> >> `debug_mask` variable in a C companion file to expose it to the kernel
> >> runtime and import it using FFI with volatile reads.
> >> 
> >> To verify the setup, instrument process lifecycle events (open, flush,
> >> and release) in `process.rs` under the new `BINDER_DEBUG_OPEN_CLOSE`
> >> logging mask. These entry-point events are chosen for initial validation
> >> because they represent the start of the Binder lifecycle and occur
> >> at low frequency, allowing simple runtime verification of the dynamic
> >> toggle without log noise.
> >> 
> >> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> >> ---
> >>  drivers/android/binder/debug.rs            | 80 ++++++++++++++++++++++++++++++
> >>  drivers/android/binder/process.rs          |  7 ++-
> >>  drivers/android/binder/rust_binder_main.rs |  2 +
> >>  drivers/android/binder/rust_binderfs.c     |  3 ++
> >>  rust/kernel/task.rs                        |  7 +++
> >>  5 files changed, 98 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/android/binder/debug.rs b/drivers/android/binder/debug.rs
> >> new file mode 100644
> >> index 000000000000..da48bce3df54
> >> --- /dev/null
> >> +++ b/drivers/android/binder/debug.rs
> >> @@ -0,0 +1,80 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +// Copyright (C) 2026 Google LLC.
> >> +
> >> +//! Binder debugging helpers.
> >> +
> >> +#![allow(dead_code)]
> >> +
> >> +kernel::impl_flags!(
> >> +    /// Represents multiple debug mask flags.
> >> +    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> >> +    pub struct DebugMasks(u32);
> >
> > Where is this being used? I can't find it on subsequent patches.
> > Maybe leftover from previous implementation?
> 
> impl_flags macro requires a type for a single flag and a type for flag masks.

Oh I see. I was expecting the bitops to be peformed on this type
somewhere. I guess the reason it wasn't is because of the issue with
module parameters and their C macros.

> 
> >
> >> +
> >> +    /// Represents a single debug mask category.
> >> +    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> >> +    pub enum DebugMask {
> >> +        UserError = 1 << 0,
> >> +        FailedTransaction = 1 << 1,
> >> +        DeadTransaction = 1 << 2,
> >> +        OpenClose = 1 << 3,
> >> +        DeadBinder = 1 << 4,
> >> +        DeathNotification = 1 << 5,
> >> +        ReadWrite = 1 << 6,
> >> +        UserRefs = 1 << 7,
> >> +        Threads = 1 << 8,
> >> +        Transaction = 1 << 9,
> >> +        TransactionComplete = 1 << 10,
> >> +        FreeBuffer = 1 << 11,
> >> +        InternalRefs = 1 << 12,
> >> +        PriorityCap = 1 << 13,
> >> +        Spinlocks = 1 << 14,
> >> +    }
> >> +);
> >> diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
> >> index df47aba05133..995e6131bb77 100644
> >> --- a/drivers/android/binder/rust_binder_main.rs
> >> +++ b/drivers/android/binder/rust_binder_main.rs
> >> @@ -31,6 +31,8 @@
> >>  mod context;
> >>  mod deferred_close;
> >>  mod defs;
> >> +#[macro_use]
> >> +mod debug;
> >>  mod error;
> >>  mod netlink;
> >>  mod node;
> >> diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
> >> index ade1c4d92499..fa8b38465550 100644
> >> --- a/drivers/android/binder/rust_binderfs.c
> >> +++ b/drivers/android/binder/rust_binderfs.c
> >> @@ -51,6 +51,9 @@ DEFINE_SHOW_ATTRIBUTE(rust_binder_proc);
> >>  char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
> >>  module_param_named(rust_devices, rust_binder_devices_param, charp, 0444);
> >>  
> >> +u32 rust_binder_debug_mask = 7;
> >
> > hmm, I'm not sure about this magic number. Do you think we can
> > initialize on the rust end at init()? Or at least a comment about what
> > flags we are setting as default here?
> 
> It doesn't even need that, just a
> 
> static rust_binder_debug_mask: Atomic<u32> = Atomic::new((FLAG_A as u32) | (FLAG_B as u32) | ...);
> 
> and a `extern u32` on C side should do.

ha sure, reversing the declaration and extern would also work.
