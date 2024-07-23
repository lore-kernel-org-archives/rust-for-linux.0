Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA3A22EE8
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721726140; cv=none; b=noO3CKjsAtfYhWlp7UOJ2bDw2i/l7ic5riYutEBtN1xpDHJpkbal/+/AgURZdYuQ/8K5SoMR7mcGrxYB4IfOprz+1sKGugrfwCUwia63V/3tRe4Hy5HiyAg9v4ZC3NMHnStcsk3v/WXGxGhKJqdtNDFPA3Pursn1hih83lMb+30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721726140; c=relaxed/simple;
	bh=UeoKgLuiGBLt7clh3EHbFnak0jUQWM6xKW91Vn0DzZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEL5R7lFGM0jQHVqEs0+rGUs3Xnq/lVkmNtRPi6COCSz/pYghVFuh4L3iTZi5A6+P9KoR/rzxka00qu8ceVHz4cV6hEp+1sKg8nPJ+lm0tNLomNPsMD1jSRY0e1h4eaErMQ6wPLtAyeBfue22EoUZ3obc0kuSqOkFImxWvJjFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MCkgNb9G; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MCkgNb9G"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-367940c57ddso2717323f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jul 2024 02:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721726138; x=1722330938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeoKgLuiGBLt7clh3EHbFnak0jUQWM6xKW91Vn0DzZo=;
        b=MCkgNb9GvlNP7SwwpwsrRzRKVoRODTqiKoU4EFSO9KA9l6iIaIqiIRXhAKw0j5K6L8
         0CkGFEJa5WYF69k86jNciLGbMI8jon4zn620z68PEelcoRynx7gZnRgDKPxhSojXZc3u
         DGzrz67jJosGqESBI/Y2/us601mIdHSJadrtVgVcIGjzHB31bDH+AslMlRaQt9eBxyfs
         0YrGXCPmVJ8EBcclr4d73co8fK6BLJaPJMAui+nmqYnFyZ+ht1XT7spJmua9rx7pK/AB
         evojlAWRzymb2MP5yc/OKRdj3KENk/AZ7QB39WHqPY8NvzCWJ4aRkkbAC/+8hpNZAwnE
         C1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721726138; x=1722330938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeoKgLuiGBLt7clh3EHbFnak0jUQWM6xKW91Vn0DzZo=;
        b=OS7txDuS+lqUrTdQNibOSB+HIjSeAPkKmsPhL76f95TR5i4Gfe/0Tj/NaHMLA17ObK
         4u+P5B5GgKbJjDpOEQWnia4kKmgKKQS/jw8DuQpmAiuTmt6w57pUMPh2zMgqNFeZMiJ9
         uKFviWWeOAzIzIBmVxb7OiYrH4ijR0A34uX5PYs2kViVlHmElZbZ0XFOKHl/hFYSg1cX
         4FosdqPfoYvsQLFri6swHcrgiNBdcW2GWBDzk3AV1HJHpAtUIfYLF6d4CECnDDUu890v
         uM2DQ5tYBt0Xy8p8J155WRiPgsX+cVuYU7IEWC7xMLpQ615+pgIIVWP5wjd+WHPtCZyi
         Emyw==
X-Forwarded-Encrypted: i=1; AJvYcCVUCdWU4540hMxzHWIhXgXk8eVu5QiGouX1z9udkG71GVH0HrgNms+EUGOxSBiw8kxCoKh25uYuutxLBmYry/e7bQUknElXQdpN5IspRWQ=
X-Gm-Message-State: AOJu0YxRIVBYHf8M3EgWgZt1cInbSyeTdz3++jqgU2cdoloOTJFmrv67
	SzRaVETMqHPjivliUuBgskxJ4KuNbyCRD5cDLxm0ccZALWHnTzYyvGJxY2I6y1euVKnu01EPlNn
	Wa2+RRQPJCT40oh40U+O4phSqNZgM0B8Qp5bk
X-Google-Smtp-Source: AGHT+IHA9MnCfP0s2Vkd21JStygGnWcgLAvV7aVLxLyDLsv453hcAk/4iObIjQRQq648iR/A4OVxND2W0CGkZHxBhTA=
X-Received: by 2002:adf:e6c9:0:b0:369:b7e3:4983 with SMTP id
 ffacd0b85a97d-369bae01bdemr6548783f8f.1.1721726137514; Tue, 23 Jul 2024
 02:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240711-b4-rbtree-v6-0-14bef1a8cdba@google.com> <20240711-b4-rbtree-v6-1-14bef1a8cdba@google.com>
In-Reply-To: <20240711-b4-rbtree-v6-1-14bef1a8cdba@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 23 Jul 2024 11:15:25 +0200
Message-ID: <CAH5fLggtbe0kjA-Wz4mi66MCLLczaC0MfyAc9S3xw6tQfoXw4Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] rust: kernel: add `drop_contents` to `BoxExt`
To: Matt Gilbride <mattgilbride@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Christian Brauner <brauner@kernel.org>, Rob Landley <rob@landley.net>, 
	Davidlohr Bueso <dave@stgolabs.net>, Michel Lespinasse <michel@lespinasse.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 6:21=E2=80=AFPM Matt Gilbride <mattgilbride@google.=
com> wrote:
>
> From: Benno Lossin <benno.lossin@proton.me>
>
> Sometimes (see [1]) it is necessary to drop the value inside of a
> `Box<T>`, but retain the allocation. For example to reuse the allocation
> in the future.
> Introduce a new function `drop_contents` that turns a `Box<T>` into
> `Box<MaybeUninit<T>>` by dropping the value.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/rust-for-linux/20240418-b4-rbtree-v3-5-323e=
134390ce@google.com/ [1]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
