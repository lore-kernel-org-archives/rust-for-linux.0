Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E746313528
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265539; cv=none; b=m9iooSJBGdWopO27PTp7v7EdWfgihJfm6CSo0NRZpEva0GHQsnxJD+7A6qgGKxcqoOeW9KX7AVQ3+uEvpLKXKrt4ZSmQ3Hm9Kwatwcu6OPEySqCHT3ERnUMjGxcbiNSFgsk3mJ8nvkKlmMuRvuZBihH+MbyM2QcClI6JQmB6Kbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265539; c=relaxed/simple;
	bh=LYroiBGaiqJFoYRjuCQFvHWZlCK3HdSaFOb38tGzgTY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uLmBrG1Mw8USXa0Y54J8/n7xy+g0a9sdv097T88JZG/lgZ9z2bel3Vi1aPm94PxChhwi8LZOw+KJU0IMlkccCECifUoSmMGopeDAZkLADJYSfglyITkrMsDaSf5+YPRvMFIBlrVzdYD5qYoI4YMH2WUpozVaZ2CkEsp2rcL84DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YXMOX5l0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YXMOX5l0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4711899ab0aso48585995e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 06:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762265536; x=1762870336; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEcbNaHwwUu98mMFzjQHBl3Ur9imCbSK1SRamisoVo0=;
        b=YXMOX5l0MCa98HOuCNOLye8nzmjYKfBO3kDRL6JBOuxbcgBo7g4yru2YpyqVDMtqRl
         EE3hHfFKUTIAvo0tkLz8g98Mpfv/FhQNDkJjXSEwItYkmd5UDIwC6zSp/cW5T0oZyjzf
         ShvlfIgujf21CNtUC8npNQ3GGBFyQWOKdxo4IQRZzS6+NbIO0wKpYVUtAt69ndCxAxHP
         O/IKsWHTw4fUcppJ6+VhVXwXUTkO4cY0dWpVbgkjwqQUWy1VDgdR1v8IcYojDbASzOMl
         RNCri5PPoGAh23ryrD7HQP+DJV4aH/eMDCJ/b+jqBgR44EtMkJxqkM5AneyvrnIAhiPE
         xfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265536; x=1762870336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEcbNaHwwUu98mMFzjQHBl3Ur9imCbSK1SRamisoVo0=;
        b=Z+Trhbmo/fTOf85wVgfQ6wHdgH5fA5ToYS6GKM7nnXZh2QtrbvZMiALVg8f90OdOnM
         77JI9QmkAa7HttsvwYnWN5sfFIEuu7QeEXCGw0PbaqKAj2w4jaWWNLWt+c28FxzlgP6h
         pa8eJT+Ah5W0p8b6ANubODLLZP8ysLAX4VzpsHpaJdCaRGhrr8EwyjstSxzYe2dIGlnw
         D9LPlFJRH49RPzOuR7UyFJZ9TuuplDZlgNBA1fDRI5PhYiGG3I8wmQbBawRgFxSbAoOu
         7aSqn9RkfwJkP+/P4Y4xDy1Yqx6zG45bRoFck0lA3yiNvLvbdJCcqX9SZvlc0u3c9J3K
         /KtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKeQOvXSyd+TQ37pPRUKSWk1t9/GvYIwddxxaO93stwsqnLYJNNd4WTIg7BxCYcH/L1zIWzLIJcphBzjhsQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFPhIS8G/kVjTmXcVQrOFb10+glrHizeYJi4xWNoVbeMu0EpUt
	u39iHab2vnVbf4+CBlLePse+0IgcLM0TC60qFeE8KjXe7W+Sipdm8lmKx4FXb81MgHA7NX9ni8S
	wxt+aaR6sVTGMBiUQow==
X-Google-Smtp-Source: AGHT+IGmpX17CaUkQY1Gxu1oZZH6fZFyNIPKiUmNUKaWbFGeyvKLHWQP3KgMrQGejtswKORq1dCUqZB740zTpoM=
X-Received: from wmnv20.prod.google.com ([2002:a05:600c:4454:b0:477:54f2:85b7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:538e:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-477308a1198mr141637275e9.23.1762265536653;
 Tue, 04 Nov 2025 06:12:16 -0800 (PST)
Date: Tue, 4 Nov 2025 14:12:15 +0000
In-Reply-To: <20251101-b4-frombytes-prefix-v1-1-0d9c1fd63b34@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251101-b4-frombytes-prefix-v1-1-0d9c1fd63b34@nvidia.com>
Message-ID: <aQoJv3k8sJvbWaF9@google.com>
Subject: Re: [PATCH RESEND] rust: transmute: add `from_bytes_prefix` family of methods
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Nov 01, 2025 at 10:41:21PM +0900, Alexandre Courbot wrote:
> The `from_bytes*` family of functions expect a slice of the exact same
> size as the requested type. This can be sometimes cumbersome for callers
> that deal with dynamic stream of data that needs to be manually cut
> before each invocation of `from_bytes`.
> 
> To simplify such callers, introduce a new `from_bytes*_prefix` family of
> methods, which split the input slice at the index required for the
> equivalent `from_bytes` method to succeed, and return its result
> alongside with the remainder of the slice.
> 
> This design is inspired by zerocopy's `try_*_from_prefix` family of
> methods.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
