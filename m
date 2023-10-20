Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD4182A9
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="D32qKzB7"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DDBB3
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 03:52:22 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so481778f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1697799141; x=1698403941; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=omV/XyQj/EwUlpDEwxR2OKoBv2EHlF+FWnoupM0fP/Y=;
        b=D32qKzB7pA/JbURmmYHLYXt1tlKMZzdILAy4UywgXU4VfYEEYFYEZx0g2RaNs381//
         jwqcfxwXZr21jMmxNAhA4DtTUTrZjiijqo3dKURkLgqzkdzSipeUEvS+hcWvgNJSTIBN
         cNXalHgoWgvU7h324lffiVpn3WvFHuJlCIFBuEadKYbGIQDmJiyVWHHLVu5yuY7AosC8
         HKV0n1qVKRlSr+ur+ilDg2rkPhbf+34zalQVXtHuqrT4kidkjPcv49LOLDgVbeB3+jd+
         RLUt4kJcVsN17KfvBRIJFUdMaTe7v0VWT+sKfdZOIwM9YKYQ2/6tnEFD8fr8KeXQ4a3W
         iblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697799141; x=1698403941;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omV/XyQj/EwUlpDEwxR2OKoBv2EHlF+FWnoupM0fP/Y=;
        b=rFjLWadHreU9pA9VPuE8Ww6mZe23i7dFMSiFDjduROm99/tf2UgxN4a7LXezrIBiM9
         6EbVSS6s3h0HqfrkCdc+rd+9egsgU3v/sD7yFwwUqLBeuoNqMgOxsuZQc2qD2m3GqY7R
         vIwuN+Kih/Wt9QybJWyGFnsNB4S0Z33+pWqkC09iyBYTi9zJhy6FL0N25mVn1rb++lg9
         gBm26EnWjGybQnRABqaBD7jtADRCNTKE2wN/Zyz6bMOvLIGOERjbeep1tfCFyj48trws
         BkbqcNdNo7Mb7qRdOn8L1YLrkgNigPl7smR5+0yvhB8NilLkEPYk2PwgGp083LZn4sZX
         SBEw==
X-Gm-Message-State: AOJu0YxY46k901F0vwrX5JOEQbfZKbul43sSTA5H+O67kRsvPE0Yv67g
	dsPdpY/YZzRxPSiUd0ABiX5d9h9Efkz59+NVzCc=
X-Google-Smtp-Source: AGHT+IHhGS0/rlNF/T6OqaNRbkTGnu+qhnV8B72MBIUZlGM1PxAPzJXYRYgGRQ5CjHCfnwrDIeLuaA==
X-Received: by 2002:a5d:6443:0:b0:32d:8a4b:2715 with SMTP id d3-20020a5d6443000000b0032d8a4b2715mr1144844wrw.8.1697799140853;
        Fri, 20 Oct 2023 03:52:20 -0700 (PDT)
Received: from localhost ([165.225.194.196])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d5042000000b0032d886039easm1439008wrt.14.2023.10.20.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:52:20 -0700 (PDT)
References: <20230930133704.13313-1-gary@garyguo.net>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Martin
 Rodriguez Reboredo <yakoyoku@gmail.com>, Vincenzo Palazzo
 <vincenzopalazzodev@gmail.com>, Vlastimil Babka <vbabka@suse.cz>, Wedson
 Almeida Filho <walmeida@microsoft.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: bindings: rename const binding using sed
Date: Fri, 20 Oct 2023 12:51:57 +0200
In-reply-to: <20230930133704.13313-1-gary@garyguo.net>
Message-ID: <87bkctin18.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Gary Guo <gary@garyguo.net> writes:

> Current for consts that bindgen don't recognise, we define a helper
> constant with
>
>     const <TYPE> BINDINGS_<NAME> = <NAME>;
>
> in `bindings_helper.h` and then we put
>
>     pub const <NAME>: <TYPE> = BINDINGS_<NAME>;
>
> in `bindings/lib.rs`. This is fine that we currently only have 3
> constants that are defined this way, but is going to be more annoying
> when more constants are added since every new constant needs to be
> defined in two places.
>
> This patch changes the way we define constant helpers to
>
>     const <TYPE> RUST_BINDING_<NAME> = <NAME>;
>
> and then use `sed` to postprocess Rust code by generated by bindgen to
> remove the distinct prefix, so user of the binding crate can refer to
> the name directly.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

> ---
>  rust/Makefile                   | 2 ++
>  rust/bindings/bindings_helper.h | 6 +++---
>  rust/bindings/lib.rs            | 3 ---
>  rust/kernel/allocator.rs        | 2 +-
>  4 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 14d93cf60a95..20889302b172 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -339,6 +339,8 @@ quiet_cmd_bindgen = BINDGEN $@
>  
>  $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags = \
>      $(shell grep -v '^#\|^$$' $(srctree)/$(src)/bindgen_parameters)
> +$(obj)/bindings/bindings_generated.rs: private bindgen_target_extra = ; \
> +    sed -Ei 's/pub const RUST_BINDING_([a-zA-Z0-9_]*)/pub const \1/g' $@
>  $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_helper.h \
>      $(src)/bindgen_parameters FORCE
>  	$(call if_changed_dep,bindgen)
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 85f013ed4ca4..c41eaab4ddb2 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -15,6 +15,6 @@
>  #include <linux/workqueue.h>
>  
>  /* `bindgen` gets confused at certain things. */
> -const size_t BINDINGS_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
> -const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
> -const gfp_t BINDINGS___GFP_ZERO = __GFP_ZERO;
> +const size_t RUST_BINDING_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
> +const gfp_t RUST_BINDING_GFP_KERNEL = GFP_KERNEL;
> +const gfp_t RUST_BINDING___GFP_ZERO = __GFP_ZERO;
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 9bcbea04dac3..40ddaee50d8b 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -48,6 +48,3 @@ mod bindings_helper {
>  }
>  
>  pub use bindings_raw::*;
> -
> -pub const GFP_KERNEL: gfp_t = BINDINGS_GFP_KERNEL;
> -pub const __GFP_ZERO: gfp_t = BINDINGS___GFP_ZERO;
> diff --git a/rust/kernel/allocator.rs b/rust/kernel/allocator.rs
> index a8f3d5be1af1..4b057e837358 100644
> --- a/rust/kernel/allocator.rs
> +++ b/rust/kernel/allocator.rs
> @@ -21,7 +21,7 @@ unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: bindings::gf
>  
>      let mut size = layout.size();
>  
> -    if layout.align() > bindings::BINDINGS_ARCH_SLAB_MINALIGN {
> +    if layout.align() > bindings::ARCH_SLAB_MINALIGN {
>          // The alignment requirement exceeds the slab guarantee, thus try to enlarge the size
>          // to use the "power-of-two" size/alignment guarantee (see comments in `kmalloc()` for
>          // more information).

