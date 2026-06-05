Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED484183A5
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658229; cv=none; b=g/yyayZyw0F3p7EX/nlJT5jCp8SJkLpTajvMMTLn6upPJTXixJEBNuJyzoSTe+g/nb6LMwmHKCmrk1r9q2840lIJzFzbPm81apILPyHbgC8LaheczmH+HCU1ElewZVjIEeSU6ZZirzcEtt+pc3I26jnBf4PR/R+0LaMth9I7BCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658229; c=relaxed/simple;
	bh=Jfhhoy1F0ebcVxM7LEmEEcwMSkV1JGLOusEFPE2K4+c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hSebdtqguhwND1FF2Ey2w/VUwDfSWxA6Ff7JhhNa6WMgiERiOQgrgdbKGiNPRkf98LQvHJ3em0dWhPjBBHOD4jQiMZRcvHrl9BcC2yhqYNJ6OXXb/DM9b8MqxsloFNzj8oBYuO9wxflpYVqcPxXkANheT9DR4aBZVlpGdthWHco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GSHsKHuq; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSHsKHuq"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b79e6b94so13246835e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780658226; x=1781263026; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9+aRoATs22S45omivn7vkQA5BKTx+/lYuCUoy7Taidw=;
        b=GSHsKHuqfCvlQfegaZ4uzvb0RZNyKBgLVD+cJCncCwPwpryhiJWzIyCtcyYVWxHA8F
         wbMLLNwmyJ8CJPMjNyy6w6A+FGaCRxB/qXjutmQfWEFaoVlDU58G2muPit/npTBtao+b
         Zw0NREIPcndHqKhm3RWPCjzis9cxmUHzFmE0x7+tym6Giu5JdAhsz0959cMypHcMVvPB
         UVDM/d8YvufhuGA1+F82Le+t6k0iHjQP77g+J0BiM9+9GtEgafm2HCNr47lq9LNaXrbP
         +Z11NQ1IDFaastlL4vfyuDpv//i5Gp6bq+BpYdIRfe7pE1Ly49/bUBvVemWWB3tJPFCK
         /gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658226; x=1781263026;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+aRoATs22S45omivn7vkQA5BKTx+/lYuCUoy7Taidw=;
        b=jKP3nucdchokYz1NS/NwV+dn5GA4e0jQPqL5gRHuBla/1GKkvNPqfQzh9VDjG4WDwD
         a26oW4Ju92+TmCBKAb95wxL09asb8N+OskHeNIg8PwH7+CFxPU/fDucqIQrcadzzZMRk
         NOrhgrE+L2u4o0d3BtMU22A3EuokyK/0HQTOpciOKUEQKTk6lIejyGGQru205QSiWVJk
         kKTSAKkyf4zj6rQZ3IFuHu2ppjyaqKM3xTYcWuyy5r+F/TsvO78ylv1wz6F65HaVHKH7
         B536xfqapE3NgUvm0D5A8JuJ35gcWpoblkSfP/lUCX7nqAXsY/RrcprH/7KzEF7WY/Z+
         bX9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+3yhIhzJOm60YvWsKb41SZS1y9Nm66vPQgbxt7G1rWB3KT/t4o048MTmaqMawUocQMYGqXUqnbRDCCMJPJcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1McDEBcoH2ZVyGr7PP5mfLas48rdFmxSv77ZKJVkBgt2Rohr9
	FX6tLJ0vobesSPvEU8QZsK68P8pk69ZBT7Ry5JU3p7nHv/g7m+f+yBUcffNx5hqaZLDIvBcadNJ
	tBWeFIFuu+5RcVVb/7g==
X-Received: from wmbjq12.prod.google.com ([2002:a05:600c:55cc:b0:487:2186:fcf7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45d1:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-490c26055aemr42019955e9.19.1780658225644;
 Fri, 05 Jun 2026 04:17:05 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:17:04 +0000
In-Reply-To: <20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260605-xarray-lockdep-fix-v2-1-25a5509abee3@kernel.org>
Message-ID: <aiKwMKyHaZ1WqI5I@google.com>
Subject: Re: [PATCH v2] rust: xarray: fix false positive lockdep warnings
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 05, 2026 at 11:14:29AM +0200, Andreas Hindborg wrote:
> `xa_init_flags()` is a static inline that expands `spin_lock_init()`,
> which generates a single static `lock_class_key` per compilation unit.
> When used through the Rust binding helper, every Rust `XArray`
> instance ends up sharing that single key. Lockdep then sees concurrent
> locking of distinct Rust `XArray`s as recursive locking on the same
> class and emits false-positive lock-ordering reports.
> 
> Add a custom helper `xa_init_flags_with_key()` that mirrors
> `xa_init_flags()` but takes an explicit name and `struct
> lock_class_key` from the caller. Update `XArray::new` to take a name
> and a `LockClassKey`, and add a `new_xarray!` macro that uses
> `optional_name!` and `static_lock_class!` to generate a unique class
> per instantiation site.
> 
> Remove the now unused `rust_helper_xa_init_flags`.
> 
> This was previously part of the series at [1].
> 
> Link: https://lore.kernel.org/r/20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org [1]
> Fixes: 210b81578efbe ("rust: xarray: Add an abstraction for XArray")
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Tamir Duberstein <tamird@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
