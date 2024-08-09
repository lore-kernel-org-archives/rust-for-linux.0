Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D89194A43
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Aug 2024 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723210732; cv=none; b=k6NKvqfRPPxmciIStX4rLAwVzQXNZkjE3EqyQp/kHuxFtS+vtQH2YK27RMi8l476JIE6HlNUaufsfg5KIE7dikfmo9yjZbjrqk9ADsbLDc/JYnADRqmzHpWMhTDh8k+EmoNL5Ivo4ca5hR2Pz4ISRX8ds5AAc3K9eL62d46rAbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723210732; c=relaxed/simple;
	bh=U9PgHMmXwArkaS49p8aX1dEbXHZP/CRcN0LvOlL7M5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4r5+OaDjWRLPRVCVx+X4aL9D0iiSvjEip4R6yAKl7IRZcCHTWMeSpgKRzJ2ZW61ZT1+dpBf9xaA4u232Miz/Ba+x/OnGP6bSRG6V70i2EvDCvkzknS0p6NZrl/TOs7ptlqURULvF/nGwzo5VVrWdtSKYIkPM4M+sQPGy4b+YXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D3ew+NPR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D3ew+NPR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-368440b073bso1238841f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Aug 2024 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723210729; x=1723815529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+NGAfmPnXsWwgUAptnJ+cd0Pt188Yd+YvqSzH2iizw=;
        b=D3ew+NPRUjJG7Xvl1GaRZYqEYe1sm7k6CyHsqKMyzebfFha+gvyPm0PSFUx4Rk5j7A
         m//CgC/GRFGESBz1zWNxVt9MPepsJSW72NljtWbjwyjW7a0W5q3w5HEbvG/XHsBq7RCG
         mMID2K35NBJmjIyRZu1Q3OflyDoihE3jaY/dDIzvSDkNrWZL8PDMjL9ZalJp2QV3b4XJ
         GETyyvPDcI61PSAoO8lsKJeSJELXidMmxHbKUm7inVbjJR0VGOoERWBe3ljcmy6lAngl
         WZqMzdcLwcRmnsb+tuK2ml+GR9XlAo/PZVD/HkYeAmE4w241JnLe5TFOznj2QGyE65nF
         9q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723210729; x=1723815529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+NGAfmPnXsWwgUAptnJ+cd0Pt188Yd+YvqSzH2iizw=;
        b=m/Nx5Xr+S/Qzq3xX7jIxtFKA7o4YpadHni3gj7803IgWm1pfd6Kqp64t2WBhXJ3bE+
         e4LapF4rTpixNIDoIAFc798UOIj5LM6TN7wVZOeAEbUr9S8Ycp0L7HKgQ3dDgn1+QV35
         7nhDz48v0/uUB15aF2OHZK6rU93bZUeRrjiGStldWJ6q3IgjevOyyNZqROVc9dZiqUOa
         Ju8wR1gzTX3JWoT6BZG+SugXQD41nfMJcCB+QWyNLbGEw+WENiY03t0nmFHvVBUFkFae
         yKTpQGW/+DUgk4IxB2nD192ddpHv8OhqsFvDO2wHPgPXQG+ejNrKu3/TXDwD+AJvifKo
         2sBg==
X-Forwarded-Encrypted: i=1; AJvYcCXvYvFyD7DywMehqPmbFRaLxnwNLd/qrcoFSPcRWz8lyMTQiFkizC7f1RjglFjkSK/3hTToiuPHub5duxe/RI25VXxdDF2ntfVXQu3CkRI=
X-Gm-Message-State: AOJu0Yyy0vvmpF+uY6CP5g1WL8LPpfRrUv97GctIuJ3/EqTkdQISmKS2
	qt02esUhqRnIgIf3rbdDkLwui5RrWRHt8nk00XBPZIAPtBHRvHQRLDefKudNdRgWVb5a0rUatr3
	pHLM9fH91hLbQoNWzMZskjJfNxB3MVXJE16Zx
X-Google-Smtp-Source: AGHT+IGLCN0hdBaFSgURlEBmYzXSiLipHSTPGxPeeVAfZBF3FCClOKXB0C2KWuYJCS7FyPZ+RAPHoq/m3t48/wKHerI=
X-Received: by 2002:adf:f208:0:b0:360:8c88:ab82 with SMTP id
 ffacd0b85a97d-36d6a75842cmr1629625f8f.30.1723210728768; Fri, 09 Aug 2024
 06:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809064222.3527881-1-aliceryhl@google.com> <CANiq72nP+pL7fEvaB7HA-mHJFs1j9SKMoSMSCif61YCy4QDFoA@mail.gmail.com>
In-Reply-To: <CANiq72nP+pL7fEvaB7HA-mHJFs1j9SKMoSMSCif61YCy4QDFoA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 9 Aug 2024 15:38:37 +0200
Message-ID: <CAH5fLghQ9dRqGdvRxGfiby9-xG4kY3QN8adyH2gVA5urZXpq=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: sort includes in bindings_helper.h
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 2:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Aug 9, 2024 at 8:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > Dash has ascii value 45 and underscore has ascii value 95, so to
> > correctly sort the includes, the underscore should be last.
> >
> > Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module=
")
>
> Looks good to me (`LC_ALL=3DC`), thanks!
>
> I can take it; otherwise:
>
>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> I am not sure if this should count as a bug/fix (there is an
> recent/ongoing debate about the Fixes tag).

I fix merge conflicts in this file almost daily, so I think there's a
case to be made for taking it as a fix. I should have clarified this
in my commit message. I sent a v2 with more info:
https://lore.kernel.org/r/20240809132835.274603-1-aliceryhl@google.com

> (This kind of issues can be also opened as "good first issues", by the
> way, i.e. as a way to get contributors to set their email workflow.)

I didn't think of that, but if I had I would probably still have
submitted it myself for the above reason.

Alice
