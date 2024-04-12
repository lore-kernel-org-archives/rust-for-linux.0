Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B9548E4
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Apr 2024 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712919941; cv=none; b=OMjHwcswYmJB37BGws1iR6pMgHlRRC01YMm6gBldfcA+PE6k9lkObdg0k6qBJ29O5X04MvAEBMYT69SytVX443ijkJSfm7hJTW8bU3fKLdZN9b/ZnFbrSH/wZnmirQkhV190Sf7IqBumaWhqa8G71fADyaYENWB32Qu/Jtgxlys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712919941; c=relaxed/simple;
	bh=0IoG0mCZOW0wJmxr2Xu4LuFbvj+6BIcyh7qESx1wVw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEzjQA6uQWb1f6WEAR071bhfuHhz8e2K4duOmYxEUJhXkpx8yGXyvDuz3F9sTOlchH0Ou4eDDXnnPQhQbYAE1QKCvfZsi5GcuL9T/ziwt2FkU/KF73ufXz6vqiKcFghZ98rD8Bf5hxL3dUBJObu/MFltQ7tzH1wRNMlqLFff6lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wd3IZ2Td; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wd3IZ2Td"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61587aa956eso7047647b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Apr 2024 04:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712919938; x=1713524738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzfOcKUbZNTZgqT86TeCwDD13GWyo5joeRsaFKSBZXU=;
        b=Wd3IZ2TdZoHWnqOmtIbwnLYX4N2UhKNYymjo+ZqN0wiSFdxkSb3X/8uYf+QcwQMZ5t
         8a9zxaZC/hnWr3tEuvuRIBleVOsamljoXiCr3pjhOiBRK0ydO/jznekn7UPAeajOfKys
         bKWYCe29yPj8peAKZg1J3kjh5dbzSUak+3c2li8RIYSX7lvUjbmBCcMN62etyATWWo6S
         VqyNjZPQ9GT5fdbFkGvGik3EivmCkF2ZBUWQD/Oxn2qpcf+hfWlS5OnE0yLlDTYEFOTk
         0Ay9CKyBJcomTkXQua6Dkr+DygF1PBLkhOUa8l45zyTCyWHYaBOStKlNxrb9RnyC/Wkb
         PUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712919938; x=1713524738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzfOcKUbZNTZgqT86TeCwDD13GWyo5joeRsaFKSBZXU=;
        b=k19XGr6mcFA3n4gYaugNuWKRxJp7it6pytQ4Z93Oe07wpsdglGWZIo3Hri9s+EmYir
         wmf4NPfGjRHX5zeC/lU6D5gsuTWtau9PAtTx9h59jetdHgst1GtqT7hy5pb0gMm7jCIM
         xrbvZl2JXbQBvKPDxw7TtE60GiY9QpjVb6q7VJwmaqNvJa2UD41DB29m9fxLnjlj2Dff
         OA32iIyxtxwY4ChaNNKXrzLbWmdJd78JBlS4FrzY734QLYRaB+ducsvQN16BMDG0MwaJ
         vIxqv47Vsotd2/V1BY/FHuP6EVw3Kzf+nPSrGkbtWLRN8+GuzQ2WbCPpj0Jz6hrotOyb
         4mVA==
X-Forwarded-Encrypted: i=1; AJvYcCWIb/uGpdoC7aYy1X/hnzaLQ2VxRHF4bcVTGrtleieltUWuD1GJe6rtN0b/NWuHMimfFAMlR40i53k4rL8FTGx8lDvQTmNnr2nBDnLGd/Y=
X-Gm-Message-State: AOJu0YxQK27Bv91xjiRAR1mywihGpCYWe01vDxQPALMB1N0ZbEVYxWJe
	P1gEkQKv3WANJsDiMU/4bWJqm70wv1PmZNCJthIK0zyv1w3sVJ1m5ORj9Uy98ecTr4nr+tUZhqq
	GXVfYSjhta+zVPWTse5/pApuBYcG6ZZzBLh9a
X-Google-Smtp-Source: AGHT+IEBnDnyttWxFfdfXd1lACxwpBaMVWQSGqXihk2W5PNA76nEeDSDYyOMEAi8SbgER2qNscvel2MUuN1FtzPft6w=
X-Received: by 2002:a81:83cb:0:b0:615:7311:8f01 with SMTP id
 t194-20020a8183cb000000b0061573118f01mr1966333ywf.51.1712919937826; Fri, 12
 Apr 2024 04:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411205428.537700-1-thorsten.blum@toblux.com>
In-Reply-To: <20240411205428.537700-1-thorsten.blum@toblux.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 12 Apr 2024 13:05:27 +0200
Message-ID: <CAH5fLgjx=z-bDHOD4nNiagzGyAigBaKpu+mRsYvWSF5Qj4p+xA@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: Fix grammar in comment
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 10:55=E2=80=AFPM Thorsten Blum <thorsten.blum@toblu=
x.com> wrote:
>
> s/directly the bindings/the bindings directly/
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  rust/helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 70e59efd92bc..4c8b7b92a4f4 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -4,7 +4,7 @@
>   * cannot be called either. This file explicitly creates functions ("hel=
pers")
>   * that wrap those so that they can be called from Rust.
>   *
> - * Even though Rust kernel modules should never use directly the binding=
s, some
> + * Even though Rust kernel modules should never use the bindings directl=
y, some
>   * of these helpers need to be exported because Rust generics and inline=
d
>   * functions may not get their code generated in the crate where they ar=
e
>   * defined. Other helpers, called from non-inline functions, may not be

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
