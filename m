Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3E33F20F0
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534446; cv=none; b=uLKsztZ3zWNxwMAIouzM5x2JFCRIi96HwL6y4+a4kc9nPcjXXzWa8y5/nfrJ+a+L5kBNIJGUO+JiJHkaj/3IJPTTXIHJyxbXLMrZtwLovq0tFaS/zE/5Lv8Yvx0z1JYypi5dHsE/Iw52E/SmJhMHyyeKJS94ilDZ96U8lbJctj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534446; c=relaxed/simple;
	bh=U4gW+OBf0/mdBZ9FmIxlu8IsN2r1yLULXAopVDTqBIc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=owp+MKxjjkHFmFH9OGbZOP+xNigDYb5/BZMbZT5Y5bMIAF6LpiuUxgqJL4px4bpXQ2wSnXs48k7JHb1kYW4j11ELPnNOIVUNP0LoVMPo3TcAlqi2ztTBxgH+EbOHTutTg1BVeMGR4D/u4BLlX1LHqnlve/vRhKgm2noCZrfZjH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trqEOxFR; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trqEOxFR"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490abeb7298so39312735e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781534443; x=1782139243; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DTQttaxV3G5HKnBXnP2YAG5bbW03fKM09oXLXTJdoxI=;
        b=trqEOxFRPPgcRboZSaHcsocovN9DgsYGL8n9wnztSPzTdVzFrjDsfp++2lxDEV1ynK
         oL1vxTeF7FCT4npVZQnjX1WRL9qo1e5m8b6OP10f+/WYXInRSYCqXjNmpyXnoPPoY418
         1DJvJBZgk3BdTsBNsmHOpIO1d4DDbHUD3y7ltocopW34Ew7YkjJczD6HpFbZh04f6SSJ
         af0OFGdvFWsnWXLuqU/qBGdDAN4JYGKpTuSyziTIcenKoUJTKeeOW0E8iWZhh7HJ3SiD
         dKhMkW2GPY8oXeU3Ict9VPTjPvTfeDWELNzzFHDCWTC67q9H9bNLsGsGSfoUOC9h6idE
         VfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534443; x=1782139243;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DTQttaxV3G5HKnBXnP2YAG5bbW03fKM09oXLXTJdoxI=;
        b=OWsUV3gP0U/jY4CosOKhBnSyKTka8OZeDK6GAc4Gr/pHouImDMRwql5ClSXX4yFY/T
         3z12uL6uChJEyohGL4l4bGFO+fGja8jmhx24Gd3sHwVWvGJ8PL+lAKVtygow58SXiho8
         A9QSEUwS+k5ESR+yjZSKZxZIEQK6p4YPbeHBne+XatmeiiYuz5EQQqnvHvm3ksr6tsFB
         ownOU+0M0VH123WaEEQykH1kLuDudoKcigUB/rJ1L8zmP+g8mMWwio84CLaK6WXkBojM
         jPE5DRorpC8Kbq2kcQZjZ6LnHHpKc8174Y/YrOElc3PhvHwXnFpW7eCOU+ZrrSCQytmy
         u/3A==
X-Forwarded-Encrypted: i=1; AFNElJ/tYcogkfzORqsd42uZqSIN6hgdK4qS56qNPB7uoSBl7odr9HwEDTjfwe00dt2da6cKDxy0QcY+k50jV36n/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCa8QF32oQ2yUZROSIPpgprcGBFa42BJNkhjABU7McmRdPBK7/
	JAidzePdj64nJzDT+4GZssjWlAltyhj0wNpm08ItwGNI3IrlV8BrRqhuD3Nzk3PbSORELEAZ9AK
	fwRWbveciV0HQ6j5vHQ==
X-Received: from wmok9.prod.google.com ([2002:a05:600c:4789:b0:490:51ba:4f8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c9:b0:492:1e50:978d with SMTP id 5b1f17b1804b1-492200838bemr149981185e9.16.1781534443223;
 Mon, 15 Jun 2026 07:40:43 -0700 (PDT)
Date: Mon, 15 Jun 2026 14:40:41 +0000
In-Reply-To: <20260615143225.471756-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260615143225.471756-1-ojeda@kernel.org>
Message-ID: <ajAO6V7Ki0QtwZTl@google.com>
Subject: Re: [PATCH] rust: allow `suspicious_runtime_symbol_definitions` lint
 for Rust >= 1.98
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 15, 2026 at 04:32:25PM +0200, Miguel Ojeda wrote:
> Starting with Rust 1.98.0 (expected 2026-08-20), Rust is introducing a
> couple new lints, `invalid_runtime_symbol_definitions` (deny-by-default)
> and `suspicious_runtime_symbol_definitions` (warn-by-default), which check
> the signature of items whose symbol name is a runtime symbol expected by
> `core`.
> 
> Our build hits the second one, i.e. the warning:
> 
>     error: suspicious definition of the runtime `strlen` symbol used by the standard library
>          --> rust/bindings/bindings_generated.rs:20018:5
>           |
>     20018 |     pub fn strlen(s: *const ffi::c_char) -> usize;
>           |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>           |
>           = note: expected `unsafe extern "C" fn(*const i8) -> usize`
>                   found    `unsafe extern "C" fn(*const u8) -> usize`
>           = help: either fix the signature or remove any attributes like `#[unsafe(no_mangle)]`, `#[unsafe(export_name = "strlen")]`, or `#[link_name = "strlen"]`
>           = help: allow this lint if the signature is compatible
>           = note: `-D suspicious-runtime-symbol-definitions` implied by `-D warnings`
>           = help: to override `-D warnings` add `#[allow(suspicious_runtime_symbol_definitions)]`
> 
>     error: suspicious definition of the runtime `strlen` symbol used by the standard library
>          --> rust/uapi/uapi_generated.rs:14236:5
>           |
>     14236 |     pub fn strlen(s: *const ffi::c_char) -> usize;
>           |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>           |
>           = note: expected `unsafe extern "C" fn(*const i8) -> usize`
>                   found    `unsafe extern "C" fn(*const u8) -> usize`
>           = help: either fix the signature or remove any attributes like `#[unsafe(no_mangle)]`, `#[unsafe(export_name = "strlen")]`, or `#[link_name = "strlen"]`
>           = help: allow this lint if the signature is compatible
>           = note: `-D suspicious-runtime-symbol-definitions` implied by `-D warnings`
>           = help: to override `-D warnings` add `#[allow(suspicious_runtime_symbol_definitions)]`
> 
> Thus `allow` the lint in `bindings` and `uapi`.
> 
> A more targeted alternative to avoid `allow`ing it would be to pass
> `--blocklist-function strlen` to `bindgen`, but we would perhaps need
> to adjust if other C headers end up adding more (or Rust checking more).
> Since it is just the less critical one that we hit, and since eventually
> this should be properly fixed by getting upstream Rust to provide a flag
> like GCC/Clang's `-funsigned-char` [2][3], just `allow` it for now.
> 
> Cc: Urgau <urgau@numericable.fr>
> Link: https://github.com/rust-lang/rust/pull/155521 [1]
> Link: https://github.com/rust-lang/rust/issues/138446 [2]
> Link: https://github.com/Rust-for-Linux/linux/issues/355 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

The change itself LGTM. With below question answered:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  #![cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
> +#![cfg_attr(
> +    CONFIG_RUSTC_HAS_SUSPICIOUS_RUNTIME_SYMBOL_DEFINITIONS,
> +    allow(suspicious_runtime_symbol_definitions)
> +)]

I'm wondering whether the cfg_attr is required? Is there a warning from
specifying an unknown warning otherwise?

Alice
