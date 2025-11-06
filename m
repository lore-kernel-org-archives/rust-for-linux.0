Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A730DD29
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422795; cv=none; b=airoKVnPDoOm20sb3AvhlWzEp2NbAHGVhnah8m8NnQ0ZuanF7MSaCPzzHwOuWw+ulDnU4vvaXla89DHJ237F/9b+W2s5fji9zTpUjB+kiUZuIHdiZ2qQ1zbTfZaHu3F/JVZuIwjugGHv51244+SFh2mzeB81QOYxYFyXxz+U5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422795; c=relaxed/simple;
	bh=DQzpv/TYMchRYZzNB1pDl8yk/D0X2IoZkn9PxYccw2Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MmLYwCAdJyWJrDzM/B+vaGEqG/28bkNrIc+d1cbdEiX9WyyTWBV+hJADKJNZpbV445QbqHmmMXrYjThlLSlRmxz1qbFWO86lynix1wirpMcxArr4H0HgQYC+haXGK18cyTCxXJiuWvtvezFbRVcqiKiorfb+1KYwsUMX8JBFShs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dZc2rnTz; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dZc2rnTz"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42814749a6fso412179f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 01:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762422791; x=1763027591; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=063+2yRbgcy5fr/+fYl2gv0i5dCoMtQowgKOfRYL/rE=;
        b=dZc2rnTzFip+Y41VIyTuYkLOlca44urk4oewCsdjoaKAw8YQmShHd7cnWl8twv450V
         m5a0P+zXktLEjHg99P/eOwW7z/lJVwIzCn288sEyZA1KRiJVETwDO+b3VsQI8a8uccIA
         pmOZOZYlqbV0dO4ri695wpCHKJgQO4EFzemwGKPeMdHzxOrJ8f3PcsxMOueFmax2m1PC
         xvWNNuRko5Bk44ap6fYw9RU8BYSXnwCegx8dZRIfd3ccpjA/mtu0PJDNHMA3+bfWwnCk
         1FDU/xppe1gE7Fimzy6g97KLDcIAypSCiAzCu/ulgP2wAvTupt+geJY4jMH9cZcLyoBw
         OUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762422791; x=1763027591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=063+2yRbgcy5fr/+fYl2gv0i5dCoMtQowgKOfRYL/rE=;
        b=RJBvrsZKzj2Qk1RBp6ylmNNrpptTK9Ezl7WN+8kIcpJ9Jg2hdm+wgRWgEFXxn9DxEe
         DEcFVSSp51d0HLqt0sfRnmMHPW2mfkSeMbV6LCwE+be3l6c+VzX2rnxcaV/SDFhQNX9N
         UOrB4r44yxhrGrdkYPZXXJCutZyNWCc1dpZV9959uSnHZMC9VLrtcbfuzmxnUD1pQrz8
         5Xw7QkPrb2CGN+p+9aMTSyg2gJuXvQFfxo0WSSl6YofRzn3EXQlh3lG3F5xrrjh3G1Yw
         KOWqE7YYa1WgPlcQQulaueiVlTM6ivEM3D9XPSsP9ueeCV4XYSiWgUSfx4T6ZuVyiGmZ
         SJ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwo72C0zk0ltxySF8xSLIqpGZ6bEfZvGjJltmTm6pD8VQN7aa8d7/pYZEYSwQKMHyme6ACEvKHa4OowovK2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YynU0E46eXhmaFzRXbs8LyBirKhQ94cZKat//0roJKtJWNefmEc
	/9biKjdv1rUSvkb9v+9RU6wZIByrcdxZHZvzr3LbtcNZMb45gy3/J18SHaJuTC+DUu5HG+ojNNF
	MnWxLi3+EIBUWtm8Mgg==
X-Google-Smtp-Source: AGHT+IH4JaqOWvbda9FU3Lrm88Olxfwq8t5npRK2ZGs5JLE00pXS42s+sIVC4X/gdM3AtJgiaw2Qp62onQ7vt4s=
X-Received: from wron10.prod.google.com ([2002:adf:f08a:0:b0:429:c8a6:4f61])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4105:b0:429:bb53:c8f4 with SMTP id ffacd0b85a97d-429e330600emr4500043f8f.34.1762422791613;
 Thu, 06 Nov 2025 01:53:11 -0800 (PST)
Date: Thu, 6 Nov 2025 09:53:10 +0000
In-Reply-To: <20251106-bounded_ints-v3-2-47104986a5c3@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251106-bounded_ints-v3-0-47104986a5c3@nvidia.com> <20251106-bounded_ints-v3-2-47104986a5c3@nvidia.com>
Message-ID: <aQxwBn6wOarZ5ApN@google.com>
Subject: Re: [PATCH v3 2/4] rust: num: add Bounded integer wrapping type
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 06, 2025 at 04:07:14PM +0900, Alexandre Courbot wrote:
> Add the `Bounded` integer wrapper type, which restricts the number of
> bits allowed to represent of value.
> 
> This is useful to e.g. enforce guarantees when working with bitfields
> that have an arbitrary number of bits.
> 
> Alongside this type, provide many `From` and `TryFrom` implementations
> are to reduce friction when using with regular integer types. Proxy
> implementations of common integer operations are also provided.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num.rs         |    3 +
>  rust/kernel/num/bounded.rs | 1045 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 1048 insertions(+)
> 
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> index 3f85e50b8632..bc9abcc3a317 100644
> --- a/rust/kernel/num.rs
> +++ b/rust/kernel/num.rs
> @@ -4,6 +4,9 @@
>  
>  use core::ops;
>  
> +pub mod bounded;
> +pub use bounded::*;
> +
>  /// Designates unsigned primitive types.
>  pub struct Unsigned(());
>  
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> new file mode 100644
> index 000000000000..2e4bc4ce9af5
> --- /dev/null
> +++ b/rust/kernel/num/bounded.rs
> @@ -0,0 +1,1045 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Implementation of [`Bounded`], a wrapper around integer types limiting the number of bits
> +//! usable for value representation.
> +
> +use core::{
> +    cmp,
> +    fmt,
> +    ops::{
> +        self,
> +        Deref, //
> +    }, //,
> +};
> +
> +use kernel::{
> +    num::Integer,
> +    prelude::*, //
> +};
> +
> +/// Evaluates to `true` if `$value` can be represented using at most `$n` bits in a `$type`.
> +///
> +/// Can be used in const context.
> +macro_rules! fits_within {
> +    ($value:expr, $type:ty, $n:expr) => {{
> +        let shift: u32 = <$type>::BITS - $n;
> +
> +        // `value` fits within `$n` bits if shifting it left by the number of unused bits, then
> +        // right by the same number, doesn't change it.
> +        //
> +        // This method has the benefit of working for both unsigned and signed values.
> +        ($value << shift) >> shift == $value

I'm still confused about whether this works or not for signed values.

I guess for a signed 4-bit int, the range of values is -8 to 7, so those
are the values that this shift should preserve the values of. Is that
what it does?

Alice
