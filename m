Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658DC2281D9
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 20:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729197535; cv=none; b=Dw6Mdn/kjLMf8EkwDGp15KRCO7dRX5RefHA8ovJzemcHLnoZXgtkbFzAiXg+Q9Ck9pXZOqgxCtUQQ81zQ8x1hion4z4hnux5IEPeicWEw4lECUvhWqlKMIR6AnVgf8I4KspRZX95zjNtCzh/1YLUXoI8VGf2WWfwiucSfLmXKPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729197535; c=relaxed/simple;
	bh=cnQlnqdueLjUFXPl+rjNUrcziR/Uu37bRyAKm+ZnoQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BiRHvKUhyO9RgZsLC2b9eqx+PkKEv4QN8kGHitAaIY1uOG6NPq5WXtp9P8A6SbWKPeK9lFZo8wpHZNJUGvI1/hK2pwpJnICBNaa26Itl4Vgnozo2Y59EqyDuZvzVd3YL+DV0+0LtX+p98bpV2Hdu7uJcAuQWvGr8699t9WGH+Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TRcCd71r; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TRcCd71r"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so1044277f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 13:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729197531; x=1729802331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrcUDqdyzXImioFxfeLr6A00K3sNtV9qNS2Npm9oScs=;
        b=TRcCd71rwrA/I9JsY4MTxlkiu20pWrGzR0kfgJlfzNyOqJz3LDBkFZ4UvwhO6IyQSd
         vEJSWALfF1mkDuUqc413LamRc0uE76wLitrPNsW9jKZv5qHZOZz5rlpYj6O5/ZqNFZmF
         lKCLabNufsvada+lUUZLuo/1A3Q+dA+/Q5L9RdQjUWlVRrXDY/65705qAENlBZ6S1+7y
         g+qXLdKCcGex5meAtsycLbyzafMT7N0J6d9Ygxyap02oUvacwOy5Ktq/ZAFK43M+gD/t
         i9TFto5a3K7F4trV84vCLssEi9jMwTfEBoQ639qFgVffedVw+5xLAG6BcKPUG00XdhIQ
         tkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729197531; x=1729802331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrcUDqdyzXImioFxfeLr6A00K3sNtV9qNS2Npm9oScs=;
        b=O7/sY/MHuZ3NXJEmp62Hy3xSJGc7JmqVoY36seVIkH9Tfpbh7b3jJ4pf2CP0Fbz6eG
         iwBIMCmAIM6OIj2fZtV2UVOEOshtrJZUUYQ+FVpLzGOP6uDyZbZGdHW5hgTFEulsDYEW
         RQPsyBj460zHtOlnLVGiVv6WWtiFyqk6rA/Z/sQ5/2bKbG9DiGQSIEjbidXllyQo3knP
         3e3exOEszApZsEqIgFaSlvVlkDuShn54ysYsA+fGqi01eRCtpVl+WoqkBLEzCMS3yRQz
         RGcl6xn21h9ABAJVBPxHSXXSLfAFkPoigNWeNgw+zUWcWuqiUnotK7hfb0Jv3VPW0+Vv
         pMsw==
X-Forwarded-Encrypted: i=1; AJvYcCXZxy8dc8kj1PkJAmYb5626t7/OUFRyqAKZSpzVKSHGTDsclzu/Ozdi1ch27apDDBhDnvUjvOBbgZFu+J+xDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwebdEQMb4wvQfkAAJqoGfbTsmtKl6gMeNm7GIgjZJFa7pq0AnH
	l0s0jqhbqYjwGu6qqMdoOVa8iBwztIdwIT7XCMskdwupizwNiQ/wkxO9Qv8hXLEVUAcqYSjwl6x
	UHT8s/3Mzq9xSkBKTX9o39kd0xo7jofYc62/c
X-Google-Smtp-Source: AGHT+IHcG3qFIxzTBgPLhK0vUVNvs8oMv5K7oaKrCVIEfYnMO/l//my7v70uumTSJb7AZ47qEdjZy5rUy4JTUVaI2bI=
X-Received: by 2002:a05:6000:1807:b0:37d:5035:451 with SMTP id
 ffacd0b85a97d-37eab4edef1mr132912f8f.10.1729197530525; Thu, 17 Oct 2024
 13:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017200138.2390077-2-elsk@google.com>
In-Reply-To: <20241017200138.2390077-2-elsk@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Oct 2024 22:38:36 +0200
Message-ID: <CAH5fLgh3JyY9L6Fg+LXVguyx8iPRbHVHqTyXSfM9gq6jdWRdtw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: add PROCMACROLDFLAGS
To: HONG Yifan <elsk@google.com>
Cc: mmaurer@google.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, kernel-team@android.com, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 10:01=E2=80=AFPM HONG Yifan <elsk@google.com> wrote=
:
>
> These are additional flags to be passed when linking proc macros for the
> Rust toolchain. If unset, it defaults to $(HOSTLDFLAGS).
>
> This is needed because the list of flags to link hostprogs is not
> necessarily the same as the list of flags used to link libmacros.so.
> When we build proc macros, we need the latter, not the
> former. To distinguish between the two, introduce this new variable
> to stand out from HOSTLDFLAGS used to link other host progs.
>
> Signed-off-by: HONG Yifan <elsk@google.com>
> ---
>  Documentation/kbuild/kbuild.rst | 5 +++++
>  Makefile                        | 1 +
>  rust/Makefile                   | 2 +-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuil=
d.rst
> index 1796b3eba37b..d9866394bd98 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -91,6 +91,11 @@ HOSTRUSTFLAGS
>  -------------
>  Additional flags to be passed to $(HOSTRUSTC) when building host program=
s.
>
> +PROCMACROLDFLAGS
> +-------------
> +Additional flags to be passed when linking proc macros for the Rust tool=
chain.
> +If unset, it defaults to $(HOSTLDFLAGS).

It may be less confusing to say "when linking Rust proc macros" here.
Saying "for the Rust toolchain" could be confusing, as the proc macros
are "for" use with the various pieces of kernel source code. Most
people would not think of them as being "for the toolchain".

If you want to mention the toolchain, you could add a sentence: "Since
proc macros are loaded by rustc at build time, they must be linked in
a way that is compatible with the rustc toolchain being used."

Alice
