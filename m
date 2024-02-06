Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5417744
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707248135; cv=none; b=EQKWDyGA0bHrU0A8cipg+xUsXkky6DO3eWcxXEyFbjlBh/SlcKcDjroTj7IB2Cb+/nREuP2CqVqFxND+ffsEpsycf/A0wVXoXacTYIL2Y0sCEnxySpfrKdP2IM//Z8G2X+rE3jGqePhxeNXrvrg6mNGlI00jWaPDfCO1rC3wU2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707248135; c=relaxed/simple;
	bh=8NpezXNrfkFlFHdfEHZRzWtYzbLL3RDV2uywd5SBqbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKpbZu/Fs+fC4HZ0263LHLm/VjupkjdzGDAeDDgBO60ckde/AfMScVePlUkgZntdhsuVVCtqTsXwR/UIUeAz+TqJxQ5ZegKM8IXc4tI3JcZbfg6kDpfmpwHxwO45endm9KyMK0OrVOY4B5SuAGsMkCDG2uv6jLPyacT3ImE1gwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwR+AvlL; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwR+AvlL"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5ffdf06e009so53723107b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 11:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707248132; x=1707852932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N974SEtZMfqJOuSF8H0DzJbNXP3hTtsAR2YbBB9Z+YM=;
        b=DwR+AvlL9omHIzaeTHmUMvc1iTo3UZz+qpI9DRUFe+tGsoapfA1sDmJJIruXgyC9UB
         6HqYReENZwqZW7ecOMFOOE9fSrZ2/W97qIKavpdmx/ThJ6QcCYoX/rPFpU1mD09a6eO4
         fw9TC43EE7lJml/rtcyR2R7pVdZcXyLTZMsJOcEKzWw/qaWBIKxRlEpDnMLv8ScRe4yf
         9Vm8p6eiFosiNdEDmW13aTf0uEClkB7ZQDuerTC6r5CdC8jwEHm0PnJgdvl/6MnOPgBr
         WK72eeTnhb3B6d7hyogmf2YDX+ieCUW+tyqeEyIiXw4NS6GMGqfZIlCaNCL5lzg6OUq1
         hDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707248132; x=1707852932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N974SEtZMfqJOuSF8H0DzJbNXP3hTtsAR2YbBB9Z+YM=;
        b=kPxnmewEDfyw1TPSJRr5T025AwVEOJFnw4Qf+ZQmwez8HC2b0Ro8KN0+zcwaXJn95m
         a79zNjv7qy61Mberud/nFxtXwRxn4eRKUHhTyUizUZfmXd9zfwQSAeiQYw5ju7Gi6ZKe
         HaUN9Nohnp2JStxlHzIVtBwwZDHzIRkleJucK8dUwrl4KtcwAPaUZ+60lxxTgpsvikyw
         K8748MtzEPZyFnSzhL1mICdFXS6ojzI8R+IqZSA6zOowSPjQUzhdWNSihx4YgEwFg4kz
         0adlfSPhDz8kuQNkfvMGBLc7heW28+2DRaGw1q1DvkfL9VQRkGj2X+kE8l4sDBLLdeOg
         sqSA==
X-Gm-Message-State: AOJu0Yy2FnDNS8igjE4f8u28Q/8AuIH76zn8BFWLfB4+IsNhiTI5pW91
	zmaF4bWusWvZI9r1n9xtDBKwnz7DNvCaJ/a8pAWuOaGB+S5m0CHW71TbUzN4AaQ145KPqT3Gb3T
	xkSIrD9rjZMUoT7aOFk5zvaOPMG0orETXwKuaZA==
X-Google-Smtp-Source: AGHT+IHGpuCjy3G0xdOjebntuElNhHLc/Hgk/75ccv0+i6hQySZiYnnkwy7WoGpxr+KENGHL71kl2dtzNBqb7wK/VXQ=
X-Received: by 2002:a81:d30b:0:b0:5ee:7299:e2cf with SMTP id
 y11-20020a81d30b000000b005ee7299e2cfmr2300773ywi.52.1707248132346; Tue, 06
 Feb 2024 11:35:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206065429.1933397-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240206065429.1933397-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Feb 2024 20:35:20 +0100
Message-ID: <CANiq72kqdsX34MOCz1qOyb0TCxsHAjn9N9S5OqdxfwwtJSGXUw@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: extend abstraction and binding documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 7:54=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> CC: Miguel Ojeda <ojeda@kernel.org>

Nit: it is typically spelled Cc (i.e. camel case).

> +.. code-block::
> +
> +                                                       rust/bindings/
> +                                                       (rust/helpers.c)
> +
> +                                                          include/ -----=
+ <-+
> +                                                                        =
|   |
> +         drivers/              rust/kernel/              +----------+ <-=
+   |
> +           fs/                                           | bindgen  |   =
    |
> +          .../            +-------------------+          +----------+ --=
+   |
> +                          |    Abstractions   |                         =
|   |
> +       +---------+        | +------+ +------+ |          +----------+   =
|   |
> +       | my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-=
+   |
> +       | driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |   =
    |
> +       +---------+        | |system| |system| |          | bindings | <-=
----+
> +            |             | +------+ +------+ |          |  crate   |   =
    |
> +            |             |   kernel crate    |          +----------+   =
    |
> +            |             +-------------------+                         =
    |
> +            |                                                           =
    |
> +            +------------------# FORBIDDEN #----------------------------=
----+

Thanks a lot for the effort of making that slide into ASCII :)

I could try to see if I can export the diagram into SVG and include it.

> +The main idea is to encapsulate all ``unsafe()`` handling in the abstrac=
tions reviewed
> +and documented carefully. These are considered to be sound then. With th=
is model
> +it is assumed that users of the abstractions ("my_foo driver") can't do =
anything
> +unsound if
> +
> +#. the abstractions are sound
> +#. they don't use ``unsafe()``

Like Valentin, I feel the wording needs some improvement here. Part of
the confusion may be the `unsafe()` there -- it is unclear what it
means (especially given the parentheses).

It is true we want to encapsulate C APIs and we forbid calling
directly `bindings` outside subsystems / exceptional cases; and
ideally provide safe abstractions as much as possible. However, we are
not the ones "considering" the abstractions sound (or at least that
way of putting it may confuse readers). We do our best to have sound
abstractions, but it is not something we "decide". So if e.g. someone
passes a raw pointer and just dereferences it in a safe function, that
is most likely unsound and it should be fixed.

That is, in turn, what allows callers to avoid breaking things. In
other words, we don't "assume that users cannot do anything unsound"
(introduce UB?) -- quite the opposite: what we want (as much as
possible) is that they cannot introduce UB even if they tried.

And that applies even if users use `unsafe`, as long as they use it
correctly, i.e. as long as they don't break the preconditions of what
they use. It is just that the best case is that they do not even need
to use `unsafe` calls (this is why we want that APIs are as safe as
possible, because then we minimize the chances that users get it wrong
and introduce UB).

> +Abstractions
> +~~~~~~~~~~~~
> +
> +Abstractions are the glue layer between the bindings and the in-kernel u=
sers. E.g.

Perhaps we should avoid "glue layer", since that sometimes implies
that it is a "thin" layer / "uninteresting" layer. However, the
abstractions are the actual interesting bits (and can be quite
complex, precisely to achieve the relaxation of safety preconditions,
i.e. making APIs "as safe as possible", that you mention below).

But it is quite subjective.

> +The webinar `Rust For Linux: Writing Safe Abstractions & Drivers`
> +
> +       https://www.linuxfoundation.org/webinars/rust-for-linux-writing-a=
bstractions-and-drivers
> +
> +has an introduction to this topic.

I appreciate this, though some of the things in there are outdated, so
I am not sure about including this nowadays. Perhaps we should record
new ones instead :) Or, even better, I could "write" the talk in
written form here, which can be maintained and be kept up to date.
Relatedly, Benno is working on some extra documentation about how to
write safety preconditions that we will probably add around here when
it is ready.

Cheers,
Miguel
