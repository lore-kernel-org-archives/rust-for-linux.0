Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B521E9B35
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626846; cv=none; b=H1jFcXWzw60OjsYXS916gMaaIVxlywVMMbfzBZo0+ibNKIIiG8UwUQqvcGVzArso/K0wP6YZGLej3RyFLoPbC0yYszK5yRoTRYHFdmWw9sc/gm+eaL6hRfRXTpDTTxm/4O+4w60C8FvUNxzgorz8K/UsjnKTaa1LT79iqfzXvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626846; c=relaxed/simple;
	bh=C5vrL1z6SnvH6Ygy1t0+EZnabdVjHODIVIGv4RRZCEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLtVOuMwqjU1lASRJ8UTDVnx6lmQQNRU9umjDuHq3ea0ATYwULWgJgUNreGSkUenqvOLpGnrg1cXpKtHEBWjONci/0j8mE6s//76BHQxIGbRLmuF7HG9ONDqsNoaRYBZZSdSFkEA4lN2AYIzOEt7bRkH24nop6B0I4MpGliVa5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRSLmMTs; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRSLmMTs"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3825ae23d95so449901fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 07:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767626841; x=1768231641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kn43i3LzpcaVKx8sZkO5nilSDYZhIbH7gusssvJywO0=;
        b=SRSLmMTs2UBHru+2q7kTmuwodhC/c8Gx/kvnJd9qPc2w+IRMXJ8MNAhgCNBhxOV6O4
         XwEEiUjwIEOZUHxlFPenRllsdIdQYp3pHDaMJlT89w97xzga43bH2FED8xpE2LDY9p5T
         MhRzqDT2UISNzNVbhL6LqIS6zwnPklPPgFS4BuUvJImr6pTPM2XiahhGIPlOZgGsXeaQ
         Mc9NHJWvDDmQrqBIa9dQi1bOUTNSuVV+U27WtGD88Tn8+NShOgsb+6DVnT3xqO4AxK2D
         GTnfq+2OBpmbX6epTziT3mrGDFnSq0aK331hCk+qJPcmgwwN+k2FOAJJkkWkXnVYYe4Q
         wpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626841; x=1768231641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kn43i3LzpcaVKx8sZkO5nilSDYZhIbH7gusssvJywO0=;
        b=u7IDx0Ov+o5+gNp2D/DWdTfnkRpW8mdWEzopwS9Bc6dP+nhRbb8wtm5AdwgAXLQnxW
         p+c+UQNO0NAl2H1ftFneQ1AxWxemAs6y4lSfs0UhdVHzM/IEhCR6TKJbXFesJ25azyUZ
         8AzUh6+OOCe/T4LyEh24g84BSjTZQyqto6gujhhcQ/6OecSD/Xw78WC10S9dvo0uRddE
         wdZkgqCz8ZF0vqnJ/09TPXxglqcHwHRupAkMXP9glDtlK+rUw+MqIfU6RHnItVetGbjO
         9z7DlqNdiFK+NU1KJq8HZfe5WoP7dOr0SfHaBdfIHuFSm6m2Nm0BODubYUGV9CYJ68bu
         C52w==
X-Gm-Message-State: AOJu0YyfJ35KSMzJlU5atV7KQugQsUTX6Edelub9l9iIu8IGNlpOmD17
	pX2P0FHvcWcD7KoDrp5XsRRIfwahi9h6avGon7pmGszA6aZvMMleUaIBJE9nE7u7XGUkXbpJiFr
	PKzSqw8pi0mGY4dOADvd35KW7H+73Aog=
X-Gm-Gg: AY/fxX6S9gAigNLFbXaGtMqVUi76GnLFuKKPVibfoSRg3wPZO6HzAmz+hjLSCxt45vN
	yMGoQeoU+brQtdeFfuE9b1kY1+7eIfzGbDoTVCS5iwTcAdogiou0V4rjN5p+3WH6h+RjSrbhXMM
	dsqTEewKvlZzdDEUc7w/gYxasDQZZTE0MY1N1UkOyHozOIMjGsz2rt+maInVpEYtD2t7cGqx3T8
	doZaxxVb6wzfZmAP6KUgTairvSLXNo/+tnjTNZP1ZI+iLg8j8FpFwfMnoAxjyeWkyHJwnt4h4CH
	Ujsoso+epS6/fEcykB+qocsKwPI1fYxCQ42t3aEYq2f279RSeTLI5Q6k9zMh6IxfnKfIAaun2sN
	Oxdlqx9CVlF55Q7Qm0XOG3g/QlBkrEmXW4cAZsc5QSQ==
X-Google-Smtp-Source: AGHT+IHLPkk84HDbctsvqovRdNwO8VvPLDd80eOVW7PHacCQOYIdRdymbqSCwJh/PEO5EV8UmN/IUnVVjDjqV/oUkCU=
X-Received: by 2002:a05:651c:1a08:b0:372:628b:5cb4 with SMTP id
 38308e7fff4ca-381216a75b0mr155117721fa.45.1767626841435; Mon, 05 Jan 2026
 07:27:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com> <20260105-define-rust-helper-v2-27-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-27-51da5f454a67@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 5 Jan 2026 10:26:45 -0500
X-Gm-Features: AQt7F2qJLVbMjEOQg2dt-RJ8P2I5PmniDGVk1Kk9Jbi2wHHMLCGhrUjUoujZw4c
Message-ID: <CAJ-ks9mh9ni0_td285C+=o8TDshrKKzUE64-hQ5hx4pO0v0vXQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/27] rust: xarray: add __rust_helper to helpers
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 7:43=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> This is needed to inline these helpers into Rust code.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Tamir Duberstein <tamird@gmail.com>

> ---
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Tamir Duberstein <tamird@gmail.com>
> Cc: Andreas Hindborg <a.hindborg@kernel.org>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-mm@kvack.org
> ---
>  rust/helpers/xarray.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
> index 60b299f11451d2c4a75e50e25dec4dac13f143f4..08979b3043410ff89d2adc0b2=
597825115c5100f 100644
> --- a/rust/helpers/xarray.c
> +++ b/rust/helpers/xarray.c
> @@ -2,27 +2,27 @@
>
>  #include <linux/xarray.h>
>
> -int rust_helper_xa_err(void *entry)
> +__rust_helper int rust_helper_xa_err(void *entry)
>  {
>         return xa_err(entry);
>  }
>
> -void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
> +__rust_helper void rust_helper_xa_init_flags(struct xarray *xa, gfp_t fl=
ags)
>  {
>         return xa_init_flags(xa, flags);
>  }
>
> -int rust_helper_xa_trylock(struct xarray *xa)
> +__rust_helper int rust_helper_xa_trylock(struct xarray *xa)
>  {
>         return xa_trylock(xa);
>  }
>
> -void rust_helper_xa_lock(struct xarray *xa)
> +__rust_helper void rust_helper_xa_lock(struct xarray *xa)
>  {
>         return xa_lock(xa);
>  }
>
> -void rust_helper_xa_unlock(struct xarray *xa)
> +__rust_helper void rust_helper_xa_unlock(struct xarray *xa)
>  {
>         return xa_unlock(xa);
>  }
>
> --
> 2.52.0.351.gbe84eed79e-goog
>
