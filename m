Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA2747D951
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577910; cv=none; b=D0Gd7hVFZxyWsY1Zh3cIw+lj2laO79WlAG0tHHnTxbnVIg22b/d2U8R8svuXnZmd4Lqgws+zIml4Ioe9TxVndHVqnN98GCAHtXDIRreF7VQ9NaJOGQlvdg0Rg2KNrhF63jaF8I48GL6f7tE+imjxg2JBrOtiv+qL5APXQtuLgYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577910; c=relaxed/simple;
	bh=WTeAlVO0DRWMQLHY+AVCUlz1Ehp3ZPr3YJrQQQlXSb8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b/0ajR82xoKEvb6RtkFbtwLvMB6ZLHwu6xcAaeYSeJ2r8uSjglZ7P01x8PU0vTR6yc5hP3/bVqCoLHpAoqSf+Dj44gwgsN414ORAGAJIotnmBWvFLKuA+ffnRo8zN/PZy2Br/mJxxpSw7axdQv16CKU6UCyPhyiMbuERKtAXz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hymAQgjl; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hymAQgjl"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso6002145e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780577908; x=1781182708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwe384gyxIbZlOev+w5QVkieSQ1N1l24QasZ+3nTCfs=;
        b=hymAQgjlycnxX4GViYv/Cgvgmg96cjw8d8Y/MKADdH8cODtlhC1eLNZ1zawB2C5Xba
         54YySIqfZJ1q0848vY8li2MaapnIMoM2QDi86HpK2IoiVEbUiBFowsi8iYNehOY4Qu0T
         F4k7O3BmCgVZ7BQFZm5SR2SQioiYhfqcx9/n76mZrctZDN+RrixR58hxOBBNIvAroooQ
         Gm+6iax/hYkuksFg+XQ4XQqXOMz/MjE6ML3zC21r0kSsxmtRCXgUTrZh2b2V/w3/7A5J
         Ht9RGxIIaXpruMw89i3xLa6rpvjTJgvp/q+M51YxtZGyZl4rgCwLX1AoFNH6hRQzvwDs
         eHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577908; x=1781182708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwe384gyxIbZlOev+w5QVkieSQ1N1l24QasZ+3nTCfs=;
        b=lPz4wBWR+jTGkaSjiZFMm9MJJlIE6O5HwJB8eIBjdsd5TPb0+Gje0TjiJtm86m/ZpR
         sBv9Q9/hBxQDorQRwFCPW35s+Hf+0DQ/HmYoc0LsixY+vqBngQRJZlvRPYM3PbE7YKHi
         hm0uhXtGomB41zrzNVRTccLgLEQNrD79Q5QLzyKLKyb9r0kmRB+LSQyhDaU9YX9cXXgn
         Mmj5F2kDkgdrpCYBpT9lt9exP7UWbm6+367MZY+Yqif0d7p7rs4rBd6ZZaT+RlwX0xy5
         +79QQcWvOSVhAdVWiREQrSpRIeg7z7C41UobYM10GReXZvMZ9/+qAuhI5OI370p2tl15
         o6nw==
X-Forwarded-Encrypted: i=1; AFNElJ/rK2ixA9z5C4cRkneDLd5xqUJGSWWFUv2cupPnjxNg0jC+X3aWJX4DqkHZxObWD/DA+nMNUvN9KVFCH9V5wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRzekMBvV3A7MdJoFtvlho1hgnE5UDcZm+4nLv0uQBphXPKj0
	JVj7dZvNilLZnBCwU6kP6rb2pDLjU4D7pEpkRpBMjJe7VPyVBhzGkglofRzxoWyayTdvFwsx6FC
	DGIZoG1Xu4PveO5qkTA==
X-Received: from wmbje15.prod.google.com ([2002:a05:600c:1f8f:b0:490:4477:50d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5250:b0:490:c015:21 with SMTP id 5b1f17b1804b1-490c0150155mr22460345e9.20.1780577907632;
 Thu, 04 Jun 2026 05:58:27 -0700 (PDT)
Date: Thu, 4 Jun 2026 12:58:26 +0000
In-Reply-To: <20260604-set-extended-error-v2-1-fb0753e7ab53@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260604-set-extended-error-v2-1-fb0753e7ab53@google.com>
Message-ID: <aiF2cpJKpyj3XFj4@google.com>
Subject: Re: [PATCH v2] rust_binder: fix BINDER_GET_EXTENDED_ERROR
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 04, 2026 at 11:37:07AM +0000, Alice Ryhl wrote:
> This code currently copies the ExtendedError struct to the stack,
> modifies the copy, and then doesn't modify the original. Thus, fix it.
> 
> Furthermore, errors when replying must be delivered directly to the
> remote thread, so update deliver_reply() to take an extended error
> argument.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

>              BR_DEAD_REPLY => f.pad("BR_DEAD_REPLY"),
>              BR_FROZEN_REPLY => f.pad("BR_FROZEN_REPLY"),
>              BR_TRANSACTION_PENDING_FROZEN => f.pad("BR_TRANSACTION_PENDING_FROZEN"),
>              BR_TRANSACTION_COMPLETE => f.pad("BR_TRANSACTION_COMPLETE"),
> -            _ => f
> -                .debug_struct("BinderError")
> -                .field("reply", &self.reply)
> -                .finish(),
> +            _ => match self.source.as_ref() {
> +                Some(source) => source.fmt(f),
> +                None => f.pad("OTHER_ERROR"),

As sashiko points out, this is probably better as:

	self.reply.fmt(f)

to just print the raw integer.

> -            let reply = Err(BR_FAILED_REPLY);
> -            orig.from.deliver_reply(reply, &orig);
> +
> +            let param = err.source.as_ref().map_or(0, |e| e.to_errno());
> +            let ee = ExtendedError::new(orig.debug_id as u32, err.reply, param);
> +            orig.from
> +                .deliver_reply(Err(BR_FAILED_REPLY), &orig, Some(ee));

As sashiko points out it should be info.debug_id instead of
orig.debug_id here.

Alice
