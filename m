Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64438DE9
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610008; cv=none; b=XSwV19cSMoC5bUEfdeHPk0WXl2bnPbdOBujAlhAsljRPsKmes5VkYV1BcHW3IkKJ41M6Xcl5tGIGvq5JWzC/tx+sjszwA8l26Y+g8KZZVKocIfKfNn5dTcqEyZQmleleVLd7LB130YYDt+EF6LJpdjszcostX7L8lilvgU3rCko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610008; c=relaxed/simple;
	bh=EcYAJ3sm0OipCZGt70NZYjrd0f6pwL/eJ1O6BJzQFHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kB2UO6pgdhnwKqO/KnNLfixlKidew3lcVzmw2oBRQloaj2IyAaxHVYJAuymUQ5xA6hRcG2Guze1XxorhYvuFxFMLBJ4qzsRzvXWKhV9/xfEPvapt9as1A/miB65Eantlg3qGT2ntoAOI6Hf+WfzWv3Civ0rzhlr5ATxtrENNG1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEH9W7J4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEH9W7J4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so1627214a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Apr 2025 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743610006; x=1744214806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcYAJ3sm0OipCZGt70NZYjrd0f6pwL/eJ1O6BJzQFHg=;
        b=aEH9W7J4hSHo+dTEqD1BNqXBVA85vvSMylpE5UuRDP4FVcR1LKzWjwhR9ZqUrpCzJq
         zKKgEecoc/ySl+6Uxo9/1QUo6xiTkGXOAKOisQOZ7hs91pgEa8wAKhhLzhFz9LyUq5ct
         Afj9tNFdftjMiqEqeKvY1cVEY7eJW9kO9pVxQ24/zU+iUVKvRELL87PkV3UGd7bZYvK7
         uB9Vvx7UKhQh+XF+a5Kb6ztD1VpXdXLdtx5EmTuGigOXruWCXZSoFeF1TmR7fpD7FUm4
         T8omTwjT2Jer8mXKZPLd7pkDoDo/rwbOoBGAlqbPdJ1nQThMimHZ1cc21feUZoLLCsZC
         Vbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610006; x=1744214806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcYAJ3sm0OipCZGt70NZYjrd0f6pwL/eJ1O6BJzQFHg=;
        b=rRWDn3Zdr7roMq60+bmfOUEd+BhWZ75zfpFOTgP0JC1YZKZ7RUEGk7N8OznTB4DPMR
         crqdWOA4qMyeRu705rZ5zoTRX5sXWZRfDgoOyp+Re2Utoa+8gNqsTvOR5fODJ3ETRrUo
         pjzwYHEra9ZKufZ6TlPBQTTAanXVbmDcHDl6ODL7wVdGS0qDbQyH8vog4jd6PNtwPh7/
         N6fvBdYllsOHaOmxNzAk6DwBuhr8BuU0WFTM4dB5eTTREtK0Iyt+202Bbg2EWHhQdPTq
         TifK/k7ssNfImklEpuBIDFUl2USr5ut2ua0c/+tFZ5/dzT7vIE8d2ftETDlF5+kPlFj2
         ig1A==
X-Forwarded-Encrypted: i=1; AJvYcCXQQMpKoLgCXDDYvSnj9nxUlK1eteylXYXgJrCIkhvgmtIcCs6swtQoBRVDgSnui/3KBfakdpUA4MtO5lw8Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyzLT7cJOmSPj48r84qt35PoGe33dZj/nm623lLmjJQsvsY1r9
	9jfX0iVHQN3/NivRqAuP4XdqDG8oW8AYvd8mYK51mvHnJs5omqQSID8YFFawhepEzCj6bJHooFL
	BjcJ/VJUc5nUcxUMIs73d2RFzLhjqm6qWO7M=
X-Gm-Gg: ASbGncsOKkK14Bp5KxH5gWZay/+8kZlirPzfv6UM2sqYB7NdmeoZeLc+z+gYjRQY09z
	G9CHiDqfwlYS2i22a9+03VJU/ggGSbXCnfFHon8gLGubKREiSku6bIiB6h2KMqo1z/4bK8cOio2
	upH8sv3XOxRwV5H7/nOaXpzdctcQyHNu4+ShpG
X-Google-Smtp-Source: AGHT+IHLYuQNJqL73TOMCXG0UVkiqHvSAV8OPpG/vM8Nm6UMGLAAVDibukuq58uPgS2dYYafMKr4T47wDNxD9iIOThI=
X-Received: by 2002:a17:90b:33c2:b0:305:5f20:b28c with SMTP id
 98e67ed59e1d1-30562e9d510mr3593622a91.5.1743610005932; Wed, 02 Apr 2025
 09:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402104759.1764282-1-igor.korotin.ref@yahoo.com>
 <20250402104759.1764282-1-igor.korotin@yahoo.com> <CANiq72mysmMph1zGAxPKDY_FixbRRa0kS3pSqj4Qhq6Yjqq2AA@mail.gmail.com>
 <cdcf14f6-76e2-4895-b85e-cef0439a30cc@yahoo.com>
In-Reply-To: <cdcf14f6-76e2-4895-b85e-cef0439a30cc@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 18:06:31 +0200
X-Gm-Features: AQ5f1Jp4R_RCmNPmBdPub3jnoyv2zTzes1PDxcsrOHSWKaD36yyG8-X1XGegWF8
Message-ID: <CANiq72=7cUKx7eCgjiWRZd9tt==w3uqRT-O6rpuvZK5_hYg+VA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: rust: quick-start: update Ubuntu instructions
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 1:49=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.com=
> wrote:
>
> I checked what happens with other tools(For example rustdoc) if I define
> only
> `RUSTC=3Drustc-1.80`. Unsurprisingly `rustdoc` remains 1.75, which is
> installed from `rustc` package, which in its turn is dependency for the
> package `bindgen-0.65`. Though I see that this mix works fine, it seems
> a little bit weird when you have one tool of version 1.80 another 1.75,
> etc. Without a doubt one can define each tool explicitly using `RUSTC`,
> `RUSTDOC`, etc. On the other hand defining `PATH` to
> `/usr/lib/rust-1.80/bin/` automatically makes build to use rust-1.80
> tools.

Ah, I see -- what I meant is that it is not required to set `PATH`,
i.e. one can use the approach of setting each variable explicitly
instead (e.g. that is what I do). In fact, setting the variables is
the "most general" solution, since it allows any name for the
binaries.

That is also what I meant by "minimize global changes", i.e. instead
of touching something like `PATH` (especially if done as an env var),
we just touch those variables.

But, yeah, I understand that you are trying to simplify by setting
less variables, which is also good. That is why I mentioned that
perhaps it is best to just show the two examples, i.e. one with
`PATH`, and the other setting each variable. Then people can decide
what they prefer, and they have also the most general solution in case
something breaks with future packages etc.

But I don't want to force any particular approach -- whatever
you/others think it is easiest for newcomers is probably the best.

To be honest, I think Ubuntu's packages should not be used for normal
development at this point.

Cheers,
Miguel
