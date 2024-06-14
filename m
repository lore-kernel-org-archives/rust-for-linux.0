Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9C191497
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718355619; cv=none; b=V0gwCwwlHJmm/XK0fEuOSHLW0Cw40NLNshaHxPRv62BYp8fVzKIAHpfngugx3W9PV1rYpCiM37Qof03fpgdrx7WchIkhMHkIm+ijbE9+fZ6ft+FsDkmpEpd+n4BxrYY+C54yQTOWnVIn/pdireVdh98/4gSygpjX2Ribp7IW+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718355619; c=relaxed/simple;
	bh=vuue96tIfWgsHiuEfmQb0PzqCqBFJ6nsE7tv6QKBDGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myj5u5a1MQAE1rZIoSg+lpe6MIiCu8h//0UNur7tVnIG90CPyHnXk5VhUHVR5EGWPUhJX70wPN88QBh2Bz/tSqsJL5s/y6f4sib1gBivXIkPRKGg9bxTeq22BxcwC/c2PTKouzsX1UKeE2pkJBxI9Sfo9eZeg4GHbth953mt3vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A+7+Mxo2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A+7+Mxo2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36084187525so250246f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718355616; x=1718960416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkjEfE5W3OSfNWGJdTHQ8Hm/JHwwsjW4jrKA6Avs2YU=;
        b=A+7+Mxo2p92MjY95gtY/ZscTo6hbEHslQFT5vSyph0Rj/vYOZf5gifSIafewF0Ig5/
         TaxtxwMjiDT9wbHHXzwTxK/w/GEMnt1rojNWcPR8j3LTTW6v0EuViLB6sYz/C04PIF6Q
         o0me77UR1cSGTaxHF1pgjPKKAqFBJcs6I28Ca7GGhNRjK1Akz7ALvi/FeFNYst4KJHhO
         DDE8a249ZIFyWxIpJPfAwm33l9xLNkzglqoSejvHQlYqX7L8tWK78Ib8KR8TqGELIN7r
         ucW+CqAU7iQ2iB2McAyBFReNdKpOvouH8UubSHFD40s8yiSvx5sQtzbMu/jyfC87hBkc
         MC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718355616; x=1718960416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkjEfE5W3OSfNWGJdTHQ8Hm/JHwwsjW4jrKA6Avs2YU=;
        b=UqmWLR+OrtG6O5vphsXegqZ7mHl0QCaX0r7dOp6jZzUnncbaqqZHq9UyvurVd4yHfP
         NZuCiSxVIKVS55i5/gEgjO2+OXy2d6eVwK8qZDY48xWexvlZ9m/zKin7EwuBgDudnou8
         Gb19ifiWQcL8pR6+vdDlT/CVGQQVs1Za4m15DGDgK/yIUX4QzeDY4RTOSHRyk7VYtFpg
         4B2Ynct0jpjiNH81vznZ7OFrthLZKCdYiGCmFKodZNOR4wnmbB77YdPT8FpKKOf0ziQ0
         NjjXvavHj9cwkwznu5hp/YblVfG9pfIuSosVEWUe5c3ufW0Bm/0gLrODvsarsxB0kZVc
         pJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDtFLVfceHzIyek3f/GYui1nLq+Ts+GbyMDiRMkevB83PkO+lr5aPdX+fVro/3BrhFOeZ7URuGjPLc/1Odh6kmMjA4p4tjFfwQ7zipBTo=
X-Gm-Message-State: AOJu0Yxm2s63dXlmD51bVsFQffZVQWflSg/P8toWxE4VMCCET1J/qJcH
	fhDF/Bf6oltEWjQB8IvaEGMXQhOT1d0gwKAOVyhEwS9FFtDAR6c8P5FLVJSMZMpwhV9O14mWE+K
	Z5cSbaUJYQNEQAE2XNCk2eT3lQVan28R7rpbC
X-Google-Smtp-Source: AGHT+IHIvcZm6t6jTk4ahi6buXLdxcxdUQK9Bj+Nnu9A3LPhEL1/OTB+NBQWXFB5IKzAaEAjsBkW3l+oszXwGLcZ8vw=
X-Received: by 2002:adf:ce10:0:b0:360:7284:969 with SMTP id
 ffacd0b85a97d-3607a76be82mr1562172f8f.42.1718355615440; Fri, 14 Jun 2024
 02:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240601004856.206682-1-jhubbard@nvidia.com>
In-Reply-To: <20240601004856.206682-1-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 14 Jun 2024 11:00:02 +0200
Message-ID: <CAH5fLgiJd3j3siCWteK-bBsnKvVrpS88vyWVV-k37SZyu2Nj8Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile: rust-analyzer target: better error handling and comments
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 1, 2024 at 2:49=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> 1) Provide a more self-explanatory error message for the "Rust not
> available" case. Without this patch, if Rust is not set up properly
> (which happens a lot, seeing as how one must routinely run "rustup
> override ..." with each new kernel release), the "make rust-analyzer"
> invocation generates a somewhat confusing message:
>
>     "No rule to make target 'rust-analyzer"
>
> This is confusing at first, because there is, in fact, a rust-analyzer
> build target. It's just not set up to handle errors gracefully.
>
> Instead of inflicting that on the developer, just print that Rust is
> not available, with a blank line above and below, so it doesn't get lost
> in the noise. Now the error case looks like this:
>
>     $ make rust-analyzer
>
>     Rust is not available
>
>     make[1]: *** [/kernel_work/linux-github/Makefile:1975: rust-analyzer]=
 Error 1
>     make: *** [Makefile:240: __sub-make] Error 2
>
> 2) As long as I'm there, also add some documentation about what
> rust-analyzer provides.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>
