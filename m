Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE31D63F7
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989166; cv=none; b=lVCf7HlK873Q94MNTd42ZK+q7W3fCr71VxkW7yS46vXAseWowWS+itCsezr9rM3UH1ga7pl+AGjrf1Ngj9COyBpgdNcBdEsWYiXY902D4xk0vG9LS5ET9rdOkS+6VK5TKoNIB+A43SAsJ7bS+B6ttC1f0UEyGDG0ccfAs50Ki/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989166; c=relaxed/simple;
	bh=IH4Qw4OZUiaQzCHILHMnQ5Z2BcYMRjESRbrTXR7+1/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF0XFdFnL65El7Zl92Y0rOpXSvytJdZJX1zYLf7POeE3v1BTvWcIURE/KMO7NiXAbtjlUFsaRLC4CmYykgIlDeVrZLydO/4y3rpLdElSeE/dlJ/Elwp9sy6v1Hjr/kj6mN4RoOScREm1iedQRskTzdd9fZu8jPOwXElRgyeDhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBhz+R/q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBhz+R/q"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3910f525165so221094f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 00:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740989162; x=1741593962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0iUVs2ZQh+M1rl5kLkJ/YPcqr6UkD+Cttj33+uPFnc=;
        b=NBhz+R/qqyjfywOFffrgJ1wP0oqlZb2rYxFPhIP/O7rUgP2s43pWZena9MhiSXJo4q
         yJ4Ow7ZdKhZz+IN1wrkCPYn1jsBNwdIts0yllsm9rg/omcslSWjV7EFxrNx31Dq2hn5Q
         PGysDfFx1VPlU1V7Ba87UCvz4GsbwneOYxxmgK0p1pBn6xgcN6Ko63B4orX0JJeCe3gj
         qxk+cDe8BrPdyX/yTLS9DxO0475a2af7aUIkdWbwvjhEt+bzv1nnhcbX35GPuaanE3Nm
         y8F5LCADAa7xpM84SzXL2uLLeqN/FaSqPzBYFbU2DJFt/MehcBNf+zASY1zuP3PktDZl
         fadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740989162; x=1741593962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0iUVs2ZQh+M1rl5kLkJ/YPcqr6UkD+Cttj33+uPFnc=;
        b=dJxbAd63t1slqveKt3XL9dy/NjZlW7vyh6FuXQQac5xkDFPVg+Wt7apj8eSbCyB9x/
         Db8hRVHxYPuVumUyqHXdkJS9c9XRcLqWATT//W/RO3wT3/5D4uwlMe77POQNXdZHuuEs
         8bzMXKUfA7ZPTpLQt7RVAryyPQQdVSTXR1qaZjSVfpEogm+QGAs+4OERzZSdUYtgneGQ
         vdA2R4U3eJEva7scuoGVF9rismBOl81sF1k2T6TigYmIdPDsJPFOgof15fJn6a0b3ZXi
         foJXOLUXIxq2tkFfoZ1LN+mMxe9xE/kxjvVYYTI3C8zdEgsfX9e3dE7kT6ihsO3ePAoF
         0yQg==
X-Forwarded-Encrypted: i=1; AJvYcCUHob1tnlnsx7lor5IDhaK70XbbYF6uKiSxRymJ7dKhs9f5fEa33oq5PzB+jMkMh/UZQkCIMh3xtBlt4gqH4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8xtsuLnrCoBEOepvM0Z3Nk631H15sRz17jJBq3P8StsFgVuwu
	l9cIGlOK475I7MHeybPE/vf6saM6/0msCpnpCLp6Up+66+3oqIjarvNm5zaGXATqKCgKh++y1wX
	iMmjZZHKbY+E1ad+LVkHDk+4orusz+eaFB6PD
X-Gm-Gg: ASbGnctB5Z+sJn+1xLgF1mSRFCbcmvoClzBjWAdgzlz8WvAc2m/cSpUS6FtvSgwkt2r
	jwKd+nfPaR0dpNVFokYwcD7fEl1l1Vgic6+doADf2++o5c6jhog6fapMfZW7hke/TiNuatCwC2U
	NF0TQVwSfHCgoGb5OJAwPM6Ze5XnfoOsNJGJ6Y5KtgXYk9rOUcsVfiDLhR
X-Google-Smtp-Source: AGHT+IEk6318AFfc1LcVsJJ84wt3g9PnbPRWzDdM7m2/xTI/OwzWoyIK3cmNaUT7+G0p9cZPZuhg9T+sy8bKgxhf/+k=
X-Received: by 2002:a5d:5f91:0:b0:38f:3c8a:4bf4 with SMTP id
 ffacd0b85a97d-390ec7cd27fmr9441896f8f.6.1740989162420; Mon, 03 Mar 2025
 00:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:05:49 +0100
X-Gm-Features: AQ5f1JrxAQw0Rq7Ilhd1yFsj2dY9VjMUraWB3QJMgYSvaEWDQVWq8PuNQusYF1c
Message-ID: <CAH5fLgjhMfk1vZCc242vKYnTN13Ss23VhVhaAjwU67Z5qhP9mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panic: use `div_ceil` to clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 2, 2025 at 12:17=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> Clippy warns:
>
>     error: manually reimplementing `div_ceil`
>        --> drivers/gpu/drm/drm_panic_qr.rs:548:26
>         |
>     548 |         let pad_offset =3D (offset + 7) / 8;
>         |                          ^^^^^^^^^^^^^^^^ help: consider using =
`.div_ceil()`: `offset.div_ceil(8)`
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#manual_div_ceil
>
> And similarly for `stride`. Thus apply the suggestion to both.
>
> The behavior (and thus codegen) is not exactly equivalent [1][2], since
> `div_ceil()` returns the right value for the values that currently
> would overflow.
>
> Link: https://github.com/rust-lang/rust-clippy/issues/14333 [1]
> Link: https://godbolt.org/z/dPq6nGnv3 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
