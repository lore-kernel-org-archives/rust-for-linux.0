Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B4D30ACEA
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 13:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337559; cv=none; b=sBIjwsOpKDeVICLKg4b9XBLEDo9nINmu3TLe401O+eQajdbGr3/IGGbearlvglSNhGsdepOYZgrXGNaKWEDU6AdMqprxqJc0sCdC8Ac4p4YTZl1te7YObRpYigj6ySZiSCxuUWYwf5u9JzjPfRj39Vq3a8Oc7y8FY+22TAQAwWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337559; c=relaxed/simple;
	bh=nWM82YYVgDfmnz3ZFulMlOndRktGXnF272wdon8Wdvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gr/4Qe2cdwGLXK9gVyVcWYOoNavbqaKRaZHUsQPmXoX2wHIzf7n48VSD+KfR6ArNbKNjMj0q7gO69LC/FIgQckAH3F++8cJq7YbgtgL9Ec6bMuE1K7X10q6FattayHDIKPYgvP9BvIAIoqmIuJkU/vaKyP8V/h/WrPsEvlAPSOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a4LvXJ0D; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a4LvXJ0D"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso36122895e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757337555; x=1757942355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWM82YYVgDfmnz3ZFulMlOndRktGXnF272wdon8Wdvw=;
        b=a4LvXJ0Dn30n/WO4xD7J+kLySGxRnSCOXJzoEqx7BdOWmEq2Tbzqk1LtMfnp5H7ZBe
         mT0MSJPl3caqIDSafAC973IpPnS2ph/uP78qXBoNwsR36dkdyulLeSEEsj840wqJX3iP
         U+SoQYHg2m4W8lzRIg6pvEhMc1gzfHHsmdeDOm567nYNOoBcXBbnqFy7YnC78dXHlMnZ
         Cx8EZWFKDO2jsZkZ9ZNoLGd0zBDEHaTR2kiklJqsTHrsvyUGaEq0E/0vk3aF9WGcTuzJ
         +F7rXtUZvcWi4PWno0ZHnWxQek5pk6vhO2hnkIOKPGG4btBjr2+4g5TJqhjfRU3jQPdE
         fA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337555; x=1757942355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWM82YYVgDfmnz3ZFulMlOndRktGXnF272wdon8Wdvw=;
        b=mdUnBSFxstrFqq9etBy592BGvWtqJKXQw/r4bB+td1ypQw1Dwl6WyAdaOm6uVgrE2X
         SXoERi2JsUJyDxhHeC5R+N9diVHp/xHtIV1uSzUwBQwYCBrFv7W8fZLMJUDQGIOeqJ4d
         0QJn5YyciUgYQiteqc8JvYef/K+PJ9e4kYXGRAGK3K0vnswXjBiPBarmzm1bi6gSmz0T
         Qa/PZhHcuLN6ku/zyTR8YrKc2cxHPEtq+rbfbMASxoSPlTUIR+ddEXdWoz7C1EwFev6f
         +YWqaOrkwcyYmNEzPQlo3teKTw02iNb6Xk2skTeFOlnz85aSVBhx3pVP6lzbAgp6oUG3
         8V/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9Rx0QgZ+XrxDev+Da09EY/K1UQLvzBPk3bcqPCZdFAAqu/DgNew6K4hKbZZpSvzx0ia/R3rDUyCjx2XSy1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy+W9x7nhK4DE0V8jIaL5yhbMHmNw9Hl6WFH81cmImrlnKCp+c
	d37oTxGqVfDKWe3dbwBCtm8cyAMZ5MNrZ0SzE9sBMHcVRhO3IkggQzdW6JH67zfNYH4bnZARGUF
	nmBY7aY5NWWsQRl/5NHIf6iCiITVhhmfNehJjbg8J
X-Gm-Gg: ASbGnctqMJF6w8+XHfEFtveFVMXKzMW1ndGu2UDKk/TONCUbIoREmA7zOLeeQu+TCjC
	QRFUZffnbXjHHhmLMiDciTCeqyrwy/mter2iR2d9U6VoB8sKYNUl3sWh90mLTDzEa6/nFgeS7Mk
	+NmF9txiG6bpMT2KslKx7PRbEtqRh6xUknmu64tQ0gfEhQRs1trEuM5lrXaI/6qkFnhSeBrrtqA
	8eo/ahAB6QxWUn2smExv6yLWRXLu4Py+RNbORHXghGriRse5GgdxoJiddAx5m8bBCH1UfPZz7xD
	EMoauBXP7mY=
X-Google-Smtp-Source: AGHT+IFjSj9fcvGgclrt2uVXMQc5eZzeD36hnbx/1QwTeUfZ8T3zw8xE5Ei6zyAbQg85xb3R6cvvnoz9yGYt46etz/w=
X-Received: by 2002:a5d:5f47:0:b0:3cf:ef30:c819 with SMTP id
 ffacd0b85a97d-3e627b712cfmr5610348f8f.4.1757337554607; Mon, 08 Sep 2025
 06:19:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-distill-lint-1ae78bcf777c@spud>
In-Reply-To: <20250908-distill-lint-1ae78bcf777c@spud>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Sep 2025 15:19:02 +0200
X-Gm-Features: AS18NWCUVBew4vUh8r_LLedLxLSYsoQ9pdJJZqEHSkY4P6yHIK6L_lJbY-hCLEI
Message-ID: <CAH5fLghqe8sxLD3vk6VLbA8UoMgEw1iNxgE8uETAeCnRz1D0DQ@mail.gmail.com>
Subject: Re: [PATCH v1] rust: cfi: only 64-bit arm and x86 support CFI_CLANG
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:13=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The kernel uses the standard rustc targets for non-x86 targets, and out
> of those only 64-bit arm's target has kcfi support enabled. For x86, the
> custom 64-bit target enables kcfi.
>
> The HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC config option that allows
> CFI_CLANG to be used in combination with RUST does not check whether the
> rustc target supports kcfi. This breaks the build on riscv (and
> presumably 32-bit arm) when CFI_CLANG and RUST are enabled at the same
> time.
>
> Ordinarily, a rustc-option check would be used to detect target support
> but unfortunately rustc-option filters out the target for reasons given
> in commit 46e24a545cdb4 ("rust: kasan/kbuild: fix missing flags on first
> build"). As a result, if the host supports kcfi but the target does not,
> e.g. when building for riscv on x86_64, the build would remain broken.
>
> Instead, make HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC depend on the only
> two architectures where the target used supports it to fix the build.
>
> CC: stable@vger.kernel.org
> Fixes: ca627e636551e ("rust: cfi: add support for CFI_CLANG with Rust")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
