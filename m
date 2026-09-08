Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6E4B53FB
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871563; cv=none; b=byZMQtIoq5nJwI3BBYQRyyjl+AyEwoE7kMEAWzrW0tFW/a9HTKPOzwizEy3FMrX+QT4e5WZ90Zb5+lzynQrswpNyrMsCppns8HIkKMHp5mWgAHRhE8WRNtkTorxNDF2/vBCRk/o5abpUmNorXdG5eFjoQ1CsVodRsKL4wGPM2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871563; c=relaxed/simple;
	bh=YFgBifjgOGHbDSwJlK1t64CFzxKDs9rUR1EgxMuK07g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U7hSAZj5V6Vjflu7dE4xaqLK4cH5KuT7DGN39ZLERkzr1w1exnvFyGi0tdIg/lYJIc4IgMHHPdzKGNQfWKKdXvZei4oX4j0IM34ArxuAxHp3Ge+0PU6vnR3ZHoMBgaI1XqaExFmOnDQ1J16j28J4k39lHPywygK2qnQobVgaHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p9v5GpuF; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p9v5GpuF"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49564d4b849so16568255e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788871560; x=1789476360; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJRhY8D4U25FwL+nOjzB9Zu8DFF6vwmzErj3pvizmLg=;
        b=p9v5GpuFNhC6TJb5wLOvJL8KYqmsU1mwrB2gT3ZWiqfreVqZiUwKoSz4GP2k2GTmM6
         tu2Bk/rtk8HLiwbweKK6VTUpwpPw3/kD0p81ccUsmDSaIKLjzjo8NShLL9doBvpWajqq
         jRQTGlx3naC7EKwXLvf982R6VCu5ylxlU/isspz3UgaxmFQahvD813EqvyOkRI3NCNLv
         gTxglcXYfL2cKFYjfRTjlcroptzygSTbkr1Q1yvWLnMYuyt8esfcjW59bKnO0N0wxOR5
         raPWdxfolkKdgfQDGHftyb3GmK0BMP1aXh8ZP6LFjYSOp2zF9Z7oeZrQRQRpGy4UQFpz
         ezdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871560; x=1789476360;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJRhY8D4U25FwL+nOjzB9Zu8DFF6vwmzErj3pvizmLg=;
        b=bGuZwCy+eyyhy2Bd5STs0uhZT1goaSsnNvFHpKBehNtgjW5GG9sSwufaIvbyyXE/kU
         keyj9yTG6NGIra8e8eG61r61g8oI+jfJLzE+6iEBBsTCGah5wgcGDpqqQi2dAOHq+BLV
         Vk1ILmfMh42Z4aYQt6TKA5f/ynbqVJNI7RfSzLPvLX12hjPaUCVQW17R+N+BdZia4bI3
         +cduyRZ8aGKV4tAFaHGf5WYLtArB2Akw6W10u3/fnRgbiShAlPB6DwAEwN0uTVVaAuj1
         Jl89LnUP/Y+oIit6mNpLRADpKSylw+RLNx3wWIfdMIG5v4LLzd4KwyEqGDGSyfbOWqxZ
         WKfA==
X-Forwarded-Encrypted: i=1; AKwUvBzRyH4W1XDVNnCTBWir5F57tH7HjPfebeZ0N3YqlE0MS80NcrzYaCmQ2cysAGaE21IsBE0wzR/z/Dtu7i8j9A==@vger.kernel.org
X-Gm-Message-State: AFuF++mmOygdneSjax25HJetT27USDHYliIA9peblpW8X2DVdCNN5BFs
	gM+KT+EH9nwTYKH6RT68cBfzq2Ks5T3sn+0GedwlWPgvj26XBtCmM6Jj+tBcTZccVAOsVJRIxBh
	ky+vTcoeoHEbSORoLxg==
X-Received: from wmej22.prod.google.com ([2002:a05:600c:42d6:b0:49d:1d3c:7f07])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c0e:b0:49d:17a8:211a with SMTP id 5b1f17b1804b1-49d17a8217dmr67278325e9.28.1788871560121;
 Tue, 08 Sep 2026 05:46:00 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:45:58 +0000
In-Reply-To: <20260907123524.2332118-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907123524.2332118-1-tomo@flapping.org>
Message-ID: <aqADhk2Z7ynuawJf@google.com>
Subject: Re: [PATCH v2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com, 
	sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 07, 2026 at 09:35:24PM +0900, FUJITA Tomonori wrote:
> diff --git a/rust/helpers/math.c b/rust/helpers/math.c
> new file mode 100644
> index 000000000000..e2ee29bcce0f
> --- /dev/null
> +++ b/rust/helpers/math.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/math64.h>
> +
> +__rust_helper u64 rust_helper_mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> +{
> +	return mul_u64_add_u64_div_u64(a, b, c, d);
> +}

This looks like it's never an inline function, so I don't think a helper
is needed.

> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6c0a5e8090d0..8e9c349b1df7 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -39,6 +39,10 @@
>  /// The number of nanoseconds per second.
>  pub const NSEC_PER_SEC: i64 = bindings::NSEC_PER_SEC as i64;
>  
> +/// The C side `MAX_JIFFY_OFFSET`, i.e. `((LONG_MAX >> 1) - 1)`. It is the upper
> +/// bound the kernel uses for a jiffies span, not a wait-forever value.
> +const MAX_JIFFY_OFFSET: isize = (isize::MAX >> 1) - 1;

Should this be:

const MAX_JIFFY_OFFSET: Jiffies = (isize::MAX >> 1) - 1;

The Jiffies type alias is always the same as isize, but it may be more
clear for readers to use Jiffies for the constant.

> +        // `bindings::HZ` cannot be used here. bindgen keeps the first definition of a
> +        // macro and ignores a later `#undef`, so `HZ` resolves to `__USER_HZ`, i.e.
> +        // 100, from `include/uapi/asm-generic/param.h` instead of `CONFIG_HZ`.
> +        const HZ: u64 = bindings::CONFIG_HZ as u64;

Sounds very error-prone. Consider fixing this in rust/bindings/lib.rs
similar to `compat_ptr_ioctl` and then use bindings::HZ here. This will
reduce the chance of others using bindings::HZ and getting the wrong
value.

Alice
