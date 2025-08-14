Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF42D3731
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755158752; cv=none; b=lh6ir3t6+qgrYdZ4sm97gVG/Q3XQ5wiL9g5xB7S3zSmuk1Riptz14A7e7V+CK/0DzHEvOVhJVqF0Hl7VEeB5zRQMqYOcI+uyWNx3mD9j4bORvQiBIwD19oHHmHSAMex1GAheBPUJ7bh4q6wiwf4NgFWm7Y6uvzGEm1P0jKHcyLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755158752; c=relaxed/simple;
	bh=an+fe+pkyixQU9vVZxme5xq6n1zoaEJRMKOUczUAZr8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cxnQmZat584WYgENyWTqZhxIV/aQF5dubdAoTJvrvtBwBQwRGUrQi0xRExJ/0Tc1jwfzVRFnhNrdGzC1O6tOKNVV4oxjzzqQeKJEdNEEoAGz7eTi/Mc4vR/jbjLj/hyI9DgzWyXv92cRRXQnHuZG3HsdHRXHHq/tYKMkDjjxOIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jhY6YqA9; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jhY6YqA9"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b9dc56225aso248618f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755158749; x=1755763549; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/9LXxrbOz6ZUqYRAh2ZKLcYQii49//1Gile44Y+OEUs=;
        b=jhY6YqA9BVKHwnKtlnnJBge1DblKLNYtAX6Z+I2txdqmk5qq9I0/zKSxE3u6lNUCW9
         i4V17EqwfVZvbwYvpee9XKhDaHV5vBPAB8c45+Z1fnFZfc0xgwj3CT08icLfKFjgptEy
         zTB08J+gzZil5/FVlNM2WNUFaM66lBdNGGpEtSaLY92hqR/ps+cTin8k+VWzUf4mLRi5
         fJkMruolKdhsx7D8mob5hJRRorOSWB7lSeQG7DkB9AuL7L5Dsnw0VSQDxCWdQpUa9JD+
         eRj5CWgeQMhEvxBA5tt8QLd57HDco1U5qZo8q1YMueig0wzVX6xtiBuw8s2/1tv+Q22Q
         UT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755158749; x=1755763549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9LXxrbOz6ZUqYRAh2ZKLcYQii49//1Gile44Y+OEUs=;
        b=f3PS4kbVD0P7Rev4uOdwmEHBr79fcTBfPt0FlG2ywoufqzwUzd3OKDr1cv2pDSifBB
         t7UkZ/9t2Axwl9KTUhpjcw+YZJYIfT4mcvPEDyQelaU6IttMq0L7Wruz6RyXjk9lk2p5
         vc7DmGRiqid2+ffQXlWrhz2nGLbMowegNOZhxuU/iPiHAay39YZ7yFF6DdXlbQgMP0Jd
         6mRVOiJzuGsosHhuqKvd0SLQcLAboX6u4J7QDGiw+nOtI5M1H0qeNij6O2u8HPJX82Ie
         mSrXTRDg0QZmDWZa05gik4p/K8fB2NSBemK6kXC0oExMooQ4xy++/2vrInzR6hI2MQnz
         IKig==
X-Forwarded-Encrypted: i=1; AJvYcCWX37IDd0YRP+p6wnu7gmwTNG+LQPOzRQ1VNEuv0f+f1OLIjdRqOXzjLZ0i7TlqSkR62yIGXnuw77A/Vt1ttQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3fDmBhbGxrGWIVokLitB73bkSPhXQIRwdJoVrYJxnhX9Ca8g
	HxIhPSPcBVtfkyMPUziDP1u7ezi9pPfuYsDWUG18gUosahaAZSoXX9gNV++qk0JFvLHh4x5Ojbl
	QmFpDheBGCh6Zetqn9w==
X-Google-Smtp-Source: AGHT+IE2hoWIzSbuEgXhxUd0EI6pjBljB/gE7D2tdM9iYAMHa3Cqm9j9sHtlblSRnu9eammOTk+un12zhHYbPj0=
X-Received: from wrhq9.prod.google.com ([2002:adf:cb89:0:b0:3b8:e2b6:4205])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2502:b0:3b9:1342:f8ac with SMTP id ffacd0b85a97d-3b9fc3595fbmr1665685f8f.31.1755158749085;
 Thu, 14 Aug 2025 01:05:49 -0700 (PDT)
Date: Thu, 14 Aug 2025 08:05:47 +0000
In-Reply-To: <20250813153548.1650533-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250813153548.1650533-1-bqe@google.com>
Message-ID: <aJ2Y21Yjs3a0CnAo@google.com>
Subject: Re: [PATCH v14 0/5] rust: adds Bitmap API, ID pool and bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Carlos LLama <cmllamas@google.com>, 
	Pekka Ristola <pekkarr@protonmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 13, 2025 at 03:35:41PM +0000, Burak Emir wrote:
> This series adds a Rust bitmap API for porting the approach from
> commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> 
> The Rust bitmap API provides a safe abstraction to underlying bitmap
> and bitops operations. For now, only includes method necessary for
> dbitmap.h, more can be added later. We perform bounds checks for
> hardening, violations are programmer errors that result in panics.
> 
> We include set_bit_atomic and clear_bit_atomic operations. One has
> to avoid races with non-atomic operations, which is ensure by the
> Rust type system: either callers have shared references &bitmap in
> which case the mutations are atomic operations. Or there is a
> exclusive reference &mut bitmap, in which case there is no concurrent
> access.
> 
> This series includes an optimization to represent the bitmap inline,
> as suggested by Yury.
> 
> We ran a simple microbenchmark which shows that overall the Rust API 
> can be expected to be about 4.5% slower than C API.
> 
> We also introduce a Rust API in id_pool.rs that would replace 
> dbitmap.h from the commit referenced above. This data structure is coupled 
> with the bitmap API and adds support for growing and shrinking, along
> with fine-grained control over when allocation happens. 
> The Binder code needs this since it holds a spinlock at the time it
> discovers that growing is necessary; this has to be release
> for performing a memory allocation with GFP_KERNEL that may cause 
> sleep.  We include example doctests that demonstrate this usage.
> 
> Thanks everyone for all the helpful comments, this series has improved 
> significantly as a result of your work.

Thanks a lot for doing this, Burak! I gave it a spin locally on
v6.17-rc1, and it seems to work.

Alice

