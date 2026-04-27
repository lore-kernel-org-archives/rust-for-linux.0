Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7772D8399
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275105; cv=none; b=gswO3kYpo+RBpx80cx6K4MsGwEYJlFtCuwd7iyuSxbtEV4/Z2z8WkHbKUYSOKjVyqt0Mcq+R86VBwD340vfX+D42Q4DcT4ZecRt8I+4mVnODrqg8EjvDfp4GloXcsCMeUZOsho9Q2MEal3DR+adinnFeWUbx4WIZid/pJRkoAGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275105; c=relaxed/simple;
	bh=AzhnRd7uMDXxIJJxCZZbO0QTzZ7PG14b932u70QXqfw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HX3ptY8f4RRn4JdFENuxoRuKKZrNGjieoNdL6BGbKC622QgKeG2nfOcV5ZJ4XyMzv5oyquYipawcPtaU4hbrkUJT1gQNqNg1KY0YjlBOtkhd8GLx4j7dTyUNJyaZf7y/JJJYDfAjmmGPTB+vDlSjl7bipC2+SNeoQq01wdXLlxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RgCvFxZS; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RgCvFxZS"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d77286244so6482239f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 00:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777275103; x=1777879903; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0H9hNNwQAwVWgy1oqiYjlVuhlejMxqv2O6HygJrC/c=;
        b=RgCvFxZS9TBkWbtP0bA7egDV9ysm/nJmodYJYtL4VIj3cRKeKSLj06Hk5dA2M086gk
         IYwvdUOPkjiHGD5CzNWWRcCQDFgyWFZfCLH+tvdordUN14p9B2GloOqy4JvgYCbUMVIc
         BrZo1HIKxjud0JCVYEVXL904nCSdNDIcjcn91sWBOSXfMki0qNBu9Zn3mxV7HTp8EboV
         kIfETJTm1V8+rZw7wgptUB0j+YEnRlWRC+NGFArzSDxdlxyM1JsG9/J51xV2QYrGrGoh
         dQVFsitdBYKaL+hZqcHlIyXJSURgXif7yYKwO2QsFEZ3Jc0OCMcZ7WJcA8YwfKkFv7WH
         IQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777275103; x=1777879903;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0H9hNNwQAwVWgy1oqiYjlVuhlejMxqv2O6HygJrC/c=;
        b=TNn4zlq8gEQfqd3ZRmA3thlXuwjHtJV41m0R1rBwGGeTstBrI2frlMYrM07ZgHV6MQ
         sMG2Vb6oqsp/GGlkZ3WEVYGLqiAQ4G+8MUhsXezDxC5K/k4BhZCp+yBcZ15klY35TZ1c
         vHpRXE/wsuv6AwzKBD3yUQz6aZLo1e29oQIr6HA0QPQnVh+HNxM9t5Hm4D91O/rrHQhI
         Pbu9Z5UD4MHkar0b5kIS+kUnzrZcmxh4aWv7OytwLMX4QKGOtO8DEE8ZPnq7WFjo9Krn
         t6Kl3Z2AuWxXxPHtJgZ0KIH4h5CHOEjWOT2V0/EcIJGmfQT5rhnbCdcRb2WYCZkdLOuC
         AfiA==
X-Forwarded-Encrypted: i=1; AFNElJ9biHv3H9eT2U4ntsoqBIKL36vwcJvhwwZXLbDEGE1KxSTjiDQdT7B20eb4x/y8U7fHfjaeekQ10kkwArWVrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3/cUx/7yNW2VOjyD26+PObhbyZrnKj2ePvy0z8z2zT+XSdDD
	JW5llAt369nA9Viagl/6UUMnmj8Xw03oqluh8vvnDYwfupc+wGqM8AaCfWqKsCOg5LKCLEGDnFd
	pPUJPKTc+nvYPXE269w==
X-Received: from wrjd17.prod.google.com ([2002:adf:e2d1:0:b0:43c:f792:df96])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c7:b0:43b:962b:5314 with SMTP id ffacd0b85a97d-43fe3db34c4mr61642910f8f.19.1777275102626;
 Mon, 27 Apr 2026 00:31:42 -0700 (PDT)
Date: Mon, 27 Apr 2026 07:31:41 +0000
In-Reply-To: <20260420161636.1790502-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260420161636.1790502-1-gary@kernel.org>
Message-ID: <ae8Q3bdhXJ3rzVtJ@google.com>
Subject: Re: [PATCH] rust: doc: disable doc inlining for all prelude items
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 20, 2026 at 05:16:36PM +0100, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Somehow the rustdoc heuristics determined that a large chunk of the items
> found in prelude should have documentation inlined. This bloats the
> generate documentation size.
> 
> Also, for crates that optimize documentation with `cfg(doc)`, as the
> documentation inlining makes use of the metadata compiled by just rustc, it
> will not pick up the `cfg(doc)` attributes from the inlined documentation.
> pin-init for example optimizes tuple/fn rendering using the nightly
> fake_variadic feature [1], but this is missing from the inlined version
> [2].
> 
> Thus, mark all prelude items as `#[doc(no_inline)]`.
> 
> Link: https://rust.docs.kernel.org/next/pin_init/trait.Zeroable.html#impl-Zeroable-for-(J,) [1]
> Link: https://rust.docs.kernel.org/next/kernel/prelude/trait.Zeroable.html#impl-Zeroable-for-(J,) [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
