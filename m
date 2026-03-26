Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8273C871A
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521189; cv=none; b=sb6N6sqxcYn9ccJ+aAZLJ6kI5A7JqTx6qHjVhafJZzYLfMW1pPtI3NcMO+qv6IVDn4LAKBGR2Z/+FWfnyBwFgJchhm4/4bYXlWfpc/uJFUhE7Mom4bBoHWnP8Z0jZx0o3ZAQvAZ2X0++2TS+J5BIaMvvZlFVKBUqu0EnlWNmJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521189; c=relaxed/simple;
	bh=49EpW7otmt2+8pJbSD73mxpn82dMF9GWF5kANcLymtY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oGAifrUHM+iOACFcUMTrv9cj6aGVqy8sSeKhBJqpOH+BUIsDIyzE5ttPWFml/ySsWKAqs+CHsF2Ku/nj6UBdzPc8KXJbutbqDhlZ2TfaPURDhVYnvXKaFv34kH427G+VrdEqSpwRlMg2YX4JclfQ7o4iAn8T44kZ0FsAqMILsx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W8HBx6lo; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W8HBx6lo"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-486fe36cf73so9371315e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774521185; x=1775125985; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LlKqLsTzmiqMvVjxZ1hKRTllJg3aB1y79hp0DydrO4s=;
        b=W8HBx6loSdGGc9NNIrWbTEuI30gAs2AEq5RFYUwKoQyZh/uLhLX3/B13YSoL7N4bz0
         OuO3E6ieNjo2L6bD1kCNHlsippaiRR3JV1oE/3Y/xExmaF0348G/2HDV1FSZn/CAY7Gh
         vM6LBG3zfDyjR4ZZ0L9OOLUuPvERMGwmOOe4tcXUCJ1Z3mw5O8pEscKjNsobe9UvcRy4
         endQ8a+fCMFtKnaTKldDBlS5jcQw0MCyFxD9jYmyOYrToOU8bRhgt91P66QOOyu54zYJ
         +3Ooi67Nq2DvU9RB9ziD6h7H/Qbw2Q+bSWbxlTSA7SIACgfMZT9PcprRn8sYXieUKstd
         erDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774521185; x=1775125985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LlKqLsTzmiqMvVjxZ1hKRTllJg3aB1y79hp0DydrO4s=;
        b=CJR27OXkA3anfoRG0FbYcj+XP3JiGXhmN1cns65S1zuvdIQgiFN3w/mF4R5r+AQPKX
         jv0lvG0eGSOxJ/1YLBvOOV9lmGkSzIzl3CTMfJUffk0ysx+HaFVpYcH626ubS4zGSJM0
         7i28h4w/hYJ7BlRhnOgu3RXwYg495eIt2w9B2yvchj4LKU6XDHZFg/WayLExc6Hihk3U
         0U6kba3iaELGtgRH3bzb7pI6AXUSh0N6+c02mkVkN9F2kVjof5Bj8b6Xm8ZPBv1rogvS
         /YfsyjccqwGK8K5yfoKMVtJK1Wv/6Xj4FKJGnZ6YNpjNeLHzLxAjbsob9d+7fVy2p40U
         iu1A==
X-Gm-Message-State: AOJu0YyaDttCeTUEg2YlgxYFutESTNHqpORdA0eW5wkInEKKtlg04qQ8
	c81b1gxQ5W+43tMgSdYtSTUMKdFUgLIj9Bm0ydy2gkaQLw1drG+agegnua3a5rOWJWLUciCP3MB
	TtWU+T8roR11IwWfiwQ==
X-Received: from wmfr22.prod.google.com ([2002:a05:600c:1596:b0:485:314d:637a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4896:b0:485:3c05:24dc with SMTP id 5b1f17b1804b1-487160afec3mr60293255e9.33.1774521185097;
 Thu, 26 Mar 2026 03:33:05 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:33:04 +0000
In-Reply-To: <20260326095621.846840-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326095621.846840-1-david@readahead.eu>
Message-ID: <acULYP6ejIQAIdX-@google.com>
Subject: Re: [PATCH] rust/alloc: add Vec::into_boxed_slice()
From: Alice Ryhl <aliceryhl@google.com>
To: David Rheinsberg <david@readahead.eu>
Cc: rust-for-linux@vger.kernel.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 26, 2026 at 10:56:20AM +0100, David Rheinsberg wrote:
> Add `Vec::into_boxed_slice()` similar to
> `std::vec::Vec::into_boxed_slice()` [1].
> 
> There is currently no way to easily consume the allocation of a vector.
> However, it is very convenient to use `Vec` to initialize a dynamically
> sized array and then "seal" it, so it can be passed along as a Box:
> 
>     fn create_from(src: &[T]) -> Result<KBox<[U]>, AllocError> {
>         let v = Vec::with_capacity(n, GFP_KERNEL)?;
> 
>         for i in src {
>             v.push(foo(i)?, GFP_KERNEL)?;
>         }
> 
>         Ok(v.into_boxed_slice())
>     }
> 
> A valid alternative is to use `Box::new_uninit()` rather than
> `Vec::with_capacity()`, and eventually convert the box via
> `Box::assume_init()`. This works but needlessly requires unsafe code,
> awkward drop handling, etc. Using `Vec` is the much simpler solution.
> 
> [1] https://doc.rust-lang.org/std/vec/struct.Vec.html#method.into_boxed_slice
> 
> Signed-off-by: David Rheinsberg <david@readahead.eu>

> +    /// Excess capacity is retained in the allocation, but lost until the box
> +    /// is dropped.

We currently say that you should provide the right length when freeing
an allocation, but this is going to violate that. You should probably
invoke realloc here, like stdlib does.

Alice
