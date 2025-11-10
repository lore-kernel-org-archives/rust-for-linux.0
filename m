Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699F2FDC57
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771955; cv=none; b=ded5lyxgh7pepoCnUe8z83bkYqPq4ue/FQzorcUm6+m0eM1bWVRjsYUcNpq8eIEaDWFaarX0mM+39EeWYMPlTtzS5uDzIef91fO4wjiE0PjaJtXGmlcvtO+BrCa/ZMdxuMZy/awKRAP1iehRd5vaLK/8yo0CjVSKNKK1hDGbmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771955; c=relaxed/simple;
	bh=g1oy0my9Z+ccbHHb+iF/yvdsIdcE9KiibVk4bik3RqI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RXvBPsHwF0maKWweaUU5mGFYq5VwILJQXkPML9pyPpYYQSoeWUJUcxfvBdpsyPjT+wAMuikerVqent0hZ4wX50gIo860KaQEIND1D6F9hI4fhdj+ygOan5WLLMegkAeG0qCk1QXfPjyvFd9RtHgyt2FRAqn0EzbKylctb+VZBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AU8bDxQY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AU8bDxQY"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso22303385e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 02:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762771952; x=1763376752; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N6NZ9bgEr68vNmFOnWb6hMPpN/BBFhK5I6oSe3Kfhy0=;
        b=AU8bDxQYlVdQEDJK9Zd6BYPEwO1anamptPIdlz0an90HYGqn1/IiO26qV534glPh4w
         F0HddtxKFO1Tqq4jIJMa/sAn+4l5qBHddi04lJp+dwyoKsvA9BDlnub32frdrp0xXMQ1
         QUCcGGhzyIQWpe6MfQMzTBgfXj/+mzFKhplFCrMLDOv6RYC1g3GQXWclAr6+sy4EENVJ
         h+P+iDrvRJBqBqrOKSBi6wGJFpwSRnYOU/VojkXzE3qiViGB4ejW86Rm21XjT5YoIFoC
         0zVeIbNMbEiUTVzNDVPlQFyVpUHMBVgrfmHAyepwltJVHiqaLoBi2ksGIoe7uKFjzPdm
         PIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771952; x=1763376752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6NZ9bgEr68vNmFOnWb6hMPpN/BBFhK5I6oSe3Kfhy0=;
        b=oEnzJa96my//vlJrmk5RmpdI9wbOdvxaGy4mPIDMe+wEbFpg7Qjxvceku3Qb0s/Ov9
         GG70MjV4l5NkcfZCqDIA+K7Qun/agbR5ZuZOjSvsvY2jkYtOyLNblBhEvYuextBjc8hp
         tfg/S0Q6u2OLLKL+o+lVHnhDhkPS80dYDf3XaOEaeV9nxK0+mK9GKSg7pdQ9Rf4yhKOS
         77unf0ZpSkDetjITfIc4f6sB/M2bMx8G5gjDoDEQfCvYBaj5d75XzIlE6XXoc1OVRGAT
         jPaMInzK1KT1qdFxS7UirOgj+tLERU15HsXjq4Ve+kdWJC5zwBdkrlJ8T3zEeutLhXnK
         fd7A==
X-Forwarded-Encrypted: i=1; AJvYcCWzgyt9956xfUeF80abh/pHukA+yqRLVaEYG2P37I4zoSEmB6yXldwdUmK3RP6usbGPv9XeqGldhTzegwPsOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4bj/wYAii5ZGLGvULgGSqGQ8cnzywNQ6dCCP259+Zy/WG4YSZ
	rhkW5+O7OXVVsdXidIfoN/R3ZgTq09RNN9loYQFCl4ddXBrASfeUtmByWS+Eg52ET3U/bNgeV2G
	FT7oRbbruE0Fvql0S3A==
X-Google-Smtp-Source: AGHT+IHLTlx/88ANqEFu1mmPKn7N2gVA3BGY0KVpSBasitym/dwRaUr5k7lI5g/0T3mMBoRLLo/Kvlowmg2Jd7c=
X-Received: from wmjf14.prod.google.com ([2002:a7b:cd0e:0:b0:475:d8de:fe5b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524a:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4777323eb5fmr65374595e9.13.1762771951937;
 Mon, 10 Nov 2025 02:52:31 -0800 (PST)
Date: Mon, 10 Nov 2025 10:52:30 +0000
In-Reply-To: <20251110095025.1475896-9-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-9-ojeda@kernel.org>
Message-ID: <aRHD7m2f7CS_LGK4@google.com>
Subject: Re: [PATCH 08/18] rust: proc-macro2: add `README.md`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:13AM +0100, Miguel Ojeda wrote:
> Originally, when the Rust upstream `alloc` standard library crate was
> vendored in commit 057b8d257107 ("rust: adapt `alloc` crate to the
> kernel"), a `README.md` file was added to explain the provenance and
> licensing of the source files.
> 
> Thus do the same for the `proc-macro2` crate.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/proc-macro2/README.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 rust/proc-macro2/README.md
> 
> diff --git a/rust/proc-macro2/README.md b/rust/proc-macro2/README.md
> new file mode 100644
> index 000000000000..af044fee4f59
> --- /dev/null
> +++ b/rust/proc-macro2/README.md
> @@ -0,0 +1,13 @@
> +# `proc-macro2`
> +
> +These source files come from the Rust `proc-macro2` crate, version
> +1.0.101 (released 2025-08-16), hosted in the
> +<https://github.com/dtolnay/proc-macro2> repository, licensed under
> +"Apache-2.0 OR MIT" and only modified to add the SPDX license
> +identifiers and to remove the `unicode-ident` dependency.
> +
> +For copyright details, please see:
> +
> +    https://github.com/dtolnay/proc-macro2/blob/1.0.101/README.md#license
> +    https://github.com/dtolnay/proc-macro2/blob/1.0.101/LICENSE-APACHE
> +    https://github.com/dtolnay/proc-macro2/blob/1.0.101/LICENSE-MIT

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
