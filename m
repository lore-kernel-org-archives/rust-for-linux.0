Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1EF425CF9
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912860; cv=none; b=OMTIpIZn3yTkVxFl8cl4KZb3iZpwdteZko48HA0W4a+UQe4p0gYTp9ynM9oZsDD01K9ZrYW9HTQ150KLbzchDWHqktNCGU4bxFrhiu3gfw3/hkgPZXqYIu4D1wjftA6+i9Wv5lG3ld7BFoVLMtSkH3Z3MbT/uyp95UI3XM8WFFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912860; c=relaxed/simple;
	bh=vFTKGGke7gcYt0Y24qQ4qECg4XQrgXTzFKM0gvn13TE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=psHEspA5fpR4rr2jOXPK6udng4smTFWTluQHgJXNPIRhBBmUiGlDhlNZJW3/Depaa44jwb0xOdfD0vrSuW7vThpYOjPT8KDpBH7g/9DQ+HTRu9m7L0s3A6fE9vwXb+5iOaYOTzTQBaeapUFsFHR+RAGRr46FHDt+2yQ1GZUICqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ZvcGUFw; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ZvcGUFw"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64d01707c32so8557026a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 04:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768912858; x=1769517658; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZRsF4NvxTK9k0YGvZ/neWvOZ1bis6ac+sRh2zfafCw=;
        b=3ZvcGUFwJY3tRPDE666ArVIz+J7eKTvfpv+AqpKm9bQ2+LuKcebohDx4nE6H1l72N1
         jNGukDRZ5AO6u6yhMPdaPtRMsF2dtb6XArmty4SIfzIqg+49+XGaA8BdnGI9YbMdXKG9
         Latgd5Uq3VtY/9l6KinOX/LYvXIk9eRa9+WhNVUIiluRZ17QYGFqBvj/8P1/jzs6lmyL
         pwE8Q/xoz5Qjm3GLcrfyDdp4D+82ArS5VAXaI15Dgg/LjDTSnhVuWu3+/W8NB8bbQ2eb
         MGA7tXi5faR2VV6ys3ml1IyJj6y0yjFJ94pzQaEP4BfwDeE6eF1pRAQ3RdmJZxqn0vl+
         IW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912858; x=1769517658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZRsF4NvxTK9k0YGvZ/neWvOZ1bis6ac+sRh2zfafCw=;
        b=VfYLjmAsJ3suS7hO9OdW0Jm+u8sWRjPTTDBf1tXMXyuFflV4YYpfUn8DFP9IOUlwCL
         xh7ISEceMGHMSNBsFI3IDTfdq5OLKdsDX16gm7iC7x8Qml8bazyvOOk4MEtD0YE2gTIn
         IXCM5wwvdUg7nPDbBBMQyiBkd7MwsHKviQcxi+wYeWN4Gr9g0wURHUonjo41fNFUJjjR
         gtbUlouyAabORYLOOaDmRa0kGL0fdLVfku3kgnREsvteoBEP+CGt0R7NV4G7+hw6ZSt1
         DEuE8SinlIHqdFsya4k2w69fPXt52cWRjwkjy3sru0PuLAuLguGUXwMfnY0UTwYt9Nhx
         f/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnqE1XDu+F9/ZcfygWHRULckSOazM13hbNXhIxszx/XFC+hZCJQ3Myvg3qsDmzsGMyBIsjfZRxozyKOYwHew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuPbbLAephRcCStCLp0zWRolpOfQx5LJWLbwgP+aTKnYCYfveh
	a7unyRGmcLm8NOr/xHrqAkCHRvE0LK4FEAWaua2TElybAZKSWhTmKD348ACIkA9LB8gAPwCdTC1
	unTA+Br1A0zsc821VeQ==
X-Received: from edqp3.prod.google.com ([2002:aa7:d303:0:b0:64b:511b:32fc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3643:b0:64c:e9b6:14d7 with SMTP id 4fb4d7f45d1cf-654bb427f7amr8037497a12.24.1768912857702;
 Tue, 20 Jan 2026 04:40:57 -0800 (PST)
Date: Tue, 20 Jan 2026 12:40:56 +0000
In-Reply-To: <20260120115207.55318-3-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120115207.55318-1-boqun.feng@gmail.com> <20260120115207.55318-3-boqun.feng@gmail.com>
Message-ID: <aW932LmY0IBwrIt7@google.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers over
 raw pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Marco Elver <elver@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 20, 2026 at 07:52:07PM +0800, Boqun Feng wrote:
> In order to synchronize with C or external, atomic operations over raw
> pointers, althought previously there is always an `Atomic::from_ptr()`
> to provide a `&Atomic<T>`. However it's more convenient to have helpers
> that directly perform atomic operations on raw pointers. Hence a few are
> added, which are basically a `Atomic::from_ptr().op()` wrapper.
> 
> Note: for naming, since `atomic_xchg()` and `atomic_cmpxchg()` has a
> conflict naming to 32bit C atomic xchg/cmpxchg, hence they are just
> named as `xchg()` and `cmpxchg()`. For `atomic_load()` and
> `atomic_store()`, their 32bit C counterparts are `atomic_read()` and
> `atomic_set()`, so keep the `atomic_` prefix.
> 
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +/// - `atomic_store(.., Relaxed)` maps to `WRITE_ONCE()` when using for inter-thread communication.

typo: "when used for"

Alice
