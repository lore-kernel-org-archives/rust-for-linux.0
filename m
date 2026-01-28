Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796F371072
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625694; cv=pass; b=QzjEMaeVdWMg2kPfzgMCAiiVkZSVp55sMH4TA1UajIBDebgofi+72QTvncqzZk/WHWGpQ8z20A7Gzt8bLKNKN9tx2fcMqdRuvVWnqOAGtqhIex4TkuJI/3cOk7LM3bwR7i5ak3vjs37nb5ZIGsYbp4gIq1gNF3UONjzdIR3n0/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625694; c=relaxed/simple;
	bh=ttG3qlAFFJpT8PzbCCCV8yd14ECEBjB5uHYqXeSabVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMxKxXbPxZ88CzSw3XTttn20Q2Yzh3zmKufe59+1+iA8iIIXrBujUWCTJjhNjf8ZNQYpik7wb34qQkBbpI5zD57Ao2LWovZ9/2T1ADniqA1IAnsZQrdmLotDZeoFLBvvXF1Hljh1FL+RA3FVWjoEYQBv2adc+p/eqqVeZbgZzPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIhOfE+d; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIhOfE+d"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59de306cec1so11483e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 10:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769625690; cv=none;
        d=google.com; s=arc-20240605;
        b=lmLbSZXoTAvPKWdO+Fxi/fhD79xji0hQHtIcB5JNvqgY9OGQivhVLgEEtLSVihiffe
         g+rhLCVtJZb26qKQckEE4t4fQv6Gh7MfnIXXID3afm7WM0mqpjVN9n5PglQQU7C/d2Za
         yG+kUMZYPBkcaDnuCskkll9x2XV5/0HrlS+hpqJf2BAc4TAvLwn5Bs6EtaZb8FCPObG+
         D1CFVuwuWtiNO5lrkgSgAnXbnAdYqg6/RD+TWHcpywQDgaNikovP+5ej+B5EpTITGSDo
         fo+ADH1QTY43ih1jwx5a2NCq5l2v+dg2viJeEnsqswCcOYPz3+Nb6A+C7fUdodfdkM+1
         AtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ttG3qlAFFJpT8PzbCCCV8yd14ECEBjB5uHYqXeSabVw=;
        fh=A7VqZIctnrtN+EDO9wssa4+Dn6OvKIQ39OnxL5/r4wY=;
        b=L9RePTFT0PbSJ+YeXTdpgwO+keH6MYm2e6gjtHkjv1nq0KmAN8rDoLM1bKa7fTv8hj
         LdPbifEfGfGBvZERNQZcoXm3k1rvXL8zwc0wZn5TQQMUrx2AlWnKZmA7SvBN0CmweS+e
         sQAtzQbsi06DPG+K9G/7ml4xZmQJ29/Vb5GfTbt56HNl+TL0rmlHCMqH/r1f7Zq6P6Wn
         CvzMQsRGx0AJTLNT98wSu6TTJ8EPy7ICoFXFAGsJRN8LKrSeICL5NqKfZWRWXf+RY6v+
         ahI9y+ZKClXwHTq2CJ0P0Oz6MSmk2L3O90iH1ftOM99asnL0WISpLAWIyUnEyPDbTBjZ
         FRgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769625690; x=1770230490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttG3qlAFFJpT8PzbCCCV8yd14ECEBjB5uHYqXeSabVw=;
        b=nIhOfE+dTBMrNelpJsPHTipYi9b3ABH3v8ngrY4IC9RANgJzE/+u8y6GdRyLJNAYtL
         8hOEFEnkGzv6zJY0IbPPpsVMNaiMROaHSpCil9sMzX7rznNsO4K4xcuvAwb0xl8f70p5
         n0pLXQDQonFwZDiiLVt+BrmILa5t/Fzj0Sa1HTDmwac3DWNnSXzAIjfK2Kb3HfoYvDmK
         Fvnwu0Pa/JlYeyel8EmCDjIMulMxSVQdP85HG3eR7Q0qEP696qA/kv5iThOzlOIaKcjs
         7Sge3jJhxU2pt8mzw3qRq/lNdTg6RYt85tGeoxUitVIxvJtfm3a4M7yvwnc6C3KkJv/f
         OWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769625690; x=1770230490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ttG3qlAFFJpT8PzbCCCV8yd14ECEBjB5uHYqXeSabVw=;
        b=hYoohyA6JzHsqvzKjUscFfIaVUW3SyKDKQPXnytlaJN6TEPfregVjvI5XKKTH04gmc
         VQAN73zQhJbWxe3Zp/hGNj0kt1QITBNaHua1MOaBdViBX2i4jGKSWRd2pmPJzQluPhh6
         RUQsxznCDv4yNsdkxlfvH5m9xA/hsXF834ehZKEPZCVBsymstsQrr1k86A0fAK+hXGZr
         5aX+Q/E9s3XqR0akyR9nvgQ1azejJ7YpwJlHCtZP42w90f7NBqAiRJOhal3/BUgJp5HH
         8qlcOexU/YO6aJY/GUGUNLxZ5bOp3CXfQlXR/jFFKi8HZgInKLo/YTRgKQdiH6aTdKUY
         E9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxF7aCYzvcts/VYhvzvmGPbxUBxSO28LJZZWhhAL3a7Ku+zmF/KUaLjNgEXS3nv52VUS/K2UqCSdPqfKSQ/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvHMHg65u/GY/rrdOAOBGW19ywOZ6DQ5XwcQyZciv/pQBH/exT
	5sGJ2uFKQyTIwthCwhdKwg6npyTqd2LNLzwA8CWezcCKUusc8AIvKbVHLCZOZWvPq3QHA359Q3H
	AIEG+qGGR7Zn9f/Uy6ls6GLE+jUUefCUfvtOE
X-Gm-Gg: AZuq6aJmx1LhSP/Q4UA0FdFZbi7bvjdrkb92I8XqSKQfAEMboagyOdqj6jf68V3fj05
	00j1zr1XxokqVDufhQpyyqFkWbjhtqsXevr05qSdSG44d8Y7sWaqexoHk6rBW5sCBSB9moOdRlZ
	ygbnAf2KgUCcNlUk5R95EflKNCIwYQ20AOYEKoFGlTNx9+v4C7PyjFyiXHMK/0GldPZKi6Z7U52
	9lVjgM/vycAyFoMy6R0lWCXBE4fnzgyszAL+ijqmcImHsbUmO+WgnC3spSBkobbZe4JmWyy3im1
	xHhkBLjPXg/W5d/Sq8z4t+BRGJNbhzgHhtKIgctxnjNmuYM+Xr55NvQzxSwthJh8KyiUokZdwiG
	5Hh/r4N5frRVX
X-Received: by 2002:a05:6512:61a6:b0:59e:d5d:116e with SMTP id
 2adb3069b0e04-59e0d5d1197mr105557e87.0.1769625690185; Wed, 28 Jan 2026
 10:41:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <HywJSfnz6Ic-AiaoIhW4WEsxI6joJea5UuRJqh_sqpDCeyEYZrOoM9ZKLgKz0V8Q00AENEnmwXATYQjlVbMEkA==@protonmail.internalid>
 <CANiq72=nMQb_zKOngmKWQQeESGAovC+pE2wiD7Njxxix-BQ3Fw@mail.gmail.com> <87fr7psijk.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87fr7psijk.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Jan 2026 19:41:11 +0100
X-Gm-Features: AZwV_QjFBVQMjeaa2rRRqPEl5bIo9wrK14Tpvn9HSKMS8bhfSqRAQUx6Dlnsj_o
Message-ID: <CANiq72my6zTs2L6FpGSG=EcnUBWy7Fs9EEJqs3JzbNP0K123=g@mail.gmail.com>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment of values
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 7:23=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> I think I wrote this before `kernel::prelude`. I would put it in the
> prelude today instead of here, what do you think about that?

I guess it depends on how much we expect it to be used.

i.e. so far we put things in the prelude if they are both general
("core") enough and frequently used.

Cheers,
Miguel
