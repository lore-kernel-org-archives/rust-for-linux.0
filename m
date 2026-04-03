Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C043A7F57
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221650; cv=pass; b=DFDkh2lCyxS49zgKlrcMJY3bpacqWN78yhlH6MNKsFmuHsIZkvFu3VHWUaI+1f7MXFxbqo5HTnGJBUTlI0oSY79ErFcq8jesxGdbiDFxtUY56uke+eMCmViDZda4OYDdUVg3jwlLrtTA/R9fmvM66XqvKui8hRxLqZk7XUaDVCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221650; c=relaxed/simple;
	bh=+uZaDMP/AozcYqTZf/oaFF3EszPbfJb/aEebqbPHujU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KF91kgTXau3V8mnz4+x+iMn+If2vqQ5tysw5ojoF5Wsed8dx93MHhbEAHJNAC0LXbprS6R7tUsauAWbi5ejjLlzUOyFI7j4CyJ3zYu7ferJZ14a6nuXBKVYlZVh+MCn8NbVTBsz7CqeyzidJqyTFq1Wu5Nltm1PRFMwJdtgIJLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBA7C0LY; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBA7C0LY"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bd801b40dbso166949eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 06:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775221646; cv=none;
        d=google.com; s=arc-20240605;
        b=FqiwL0cYriOKma4/a/N9KGLs8D6iQKAqSvL/hBl81fjVmuBjqMdpOsIzCnZFUG1g55
         zKyo/kEP7Y8E9dYWYGZIu5cSLIgRTmqCWTd9mGo5cemXigZjiOhaNlPGK+QrozEfx8fQ
         kX0tgGTXbOmxDnuEpO4oVfjADbU8pUqsQA08PZcD0beB6GMjMastwgfMadGIJ4O2B16+
         CgoHs9g7su2hGwkNhl7QQipYalELkXwvFzFEC4Pns+gJpPgmmc2kuiwinL087+PjkhCg
         oS6tIGQzREC485kYXsLnpN8tirywbEF9csB41JqdZh7LkOqQTnEN+Ixy454fE0LV/EpF
         rQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8LexMMltL/kK/wLwnO1jphEmsYhPwoj9kNcnexg4bI8=;
        fh=lM54gd6LavqwEsZLIdOO/USuh4r/2mMYJS06rlP4Z6Y=;
        b=L4n+fzq48TQNJ75VMHjvSn4GxsFAn2kvtOaDYtJV/EsZ5hN4p7l0gU4b38Q5Am1E+c
         PKv5tKLv7DueD+jdxvB72YLGQHgqBjllXwuW//9btBz7oVzawAAq9BVsQ9ii6Tovakb+
         SyWYV7fvYDEQAXL8WM7wvnU9gVZ8VjFKqyQf7MqP26I+GeN8m6D/KNxwxbB2alG57gw8
         BbVuRC0wKctJ1sRV0XrEXwSTrK+ykFM6KQstM6K21wzLSGJlTLSzHs+m1muC8KamqOSy
         HqS/9aCwT9xjh0zepq7pUbY+WkQxpHU8qMizRfeI3RBOogpyaihmw08XaRSK0oabvexh
         it0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775221646; x=1775826446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LexMMltL/kK/wLwnO1jphEmsYhPwoj9kNcnexg4bI8=;
        b=ZBA7C0LYezdbT1eDixqh2nwBPi6Y/sO93F7TCx7DyANmm6gIDgbFFxef+JZijrv975
         tduR58jh/u2ErihNLY/8s8OYU6/ZS1qhZpd8bmVLN/XbQxAHNCJuNZRIUIklqojelYHi
         vS9Fg5Axg+GG3RAVC+mIeO7hWo/YSw4e3LV8savuLGj5CFn0Jnjwgqz6IcoDyMMbdq1I
         1nsLQt+VePCtm/wEcXJHvN9yTpOol7iPLAgmvSeh2rEg2CHOxCqH2pVrPJlCkimfCj2i
         TWe5j561urXIGJJT/jppo89HR6EQcRqD41zUbjkkZCNjMneOy3Q2I0euYG3eBbXyF8vq
         QoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775221646; x=1775826446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LexMMltL/kK/wLwnO1jphEmsYhPwoj9kNcnexg4bI8=;
        b=r5kij0r/JQo7LDf4LuMleEBs17nDPuOpnesCmNui2NG/JkNMGwMaWbIQVa3z0Dy95t
         3tOjdbSKev2quwPaMKteeoZUim7bR7d4Qr6JtbgqhGnH4IL8MB+stMzaj7IyQ+PeCA2W
         Dw0+b2n6C98GvUvLKGmLkXFSetcvb3oUq47GhZA3fgR81cYLSKNgdUdRaLDVsBgm1ZVr
         IGGK7HvAuAw8dGBSagLeo7hDgEZVf0uVfE0xoGI7bNn+OC6kzaH8D26uiNi+mnraK2io
         XYFVAPbFMaakffv1a0jwbrZY+dnwijmLuwz6c6CJROgYSCHpxvtybDUtctBYdvasTQjM
         OZeg==
X-Forwarded-Encrypted: i=1; AJvYcCXhhT5z7ntk4J9jPX9IoQ09+W4tPBgCYjQ84RTKO28x4YPxCOU1ef5o8HYLBQYUplWaq2HA9fF4TKZ6n7PJxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhfKKsfuZspPoWe582kgtOAeCrb0Zl5behMKK6RE0HZFJOfud3
	QG4Izs+fAO1jeFLMz18OT9VRJbLK2B0z8h3HXa+Ozbnr83CE/lDToE/G8XI3+MUlLszn1MsDRoq
	JRRWsHs5IdZgxRobdk8cVDn4CIkattTM=
X-Gm-Gg: AeBDietTgfNkIiMUIdvgbZdd/MTMUtmTJJXnlX3Z3LFtuP8nsZgLHT/dTEtw9LI/727
	To0U6F9jVuFjhgbyFNXLzt4GhRULenahTwfeGR1PuRxDmztGvTXjzN9VSEqSIn1v05/Y6SzH4Uw
	DPm72jHcpxPJLtXQ/hUG21xzIUtjmfXmRU36Y1kI6fZrwVHQC9KWQcbE4SeYiq9m+0IYERnPPHp
	HuaQw4jUiZAXX4NH9sXzQHxCexDwogikCfhgKRcCYdnZzqrqV/EfSy1jJhtZbRInl/hg717Uc0b
	uE6DBumBy7tYyVsT7mKhrSQYEm+L1sMQ3QNQGO0tOmlY7DBwGGO4AFWa53zNEu0M0M21zYnOt2B
	5Qc5s1gMiNlJ26HhhjooZa28=
X-Received: by 2002:a05:7301:6093:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2cbfbc82969mr602584eec.4.1775221646195; Fri, 03 Apr 2026
 06:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <CAJ-ks9nqv30SOiCia8LE6XbKEURNCa9qwwcszsQ0a8FRxR0Msg@mail.gmail.com>
In-Reply-To: <CAJ-ks9nqv30SOiCia8LE6XbKEURNCa9qwwcszsQ0a8FRxR0Msg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 15:07:12 +0200
X-Gm-Features: AQROBzAi7I-5aiPFC3vwoZZjn0KQTGSqr8-BroXwKxkn5hps7t8T0SwwfFMqiV4
Message-ID: <CANiq72mKuQgK_R=xs6270nwYigzCvJiFJ1PcOB+WT3OdXO7E0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 12:25=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Seeing this patch a bit late but in clippy 1.85.0 there is
> `#[clippy::format_args]` which would permit us to make the lint work
> with our custom macros.

+1, that may be good to consider, especially with the bump -- added
and backlinked in:

  https://github.com/Rust-for-Linux/linux/issues/349

Maybe an issue would be good to create too.

It is good to see Clippy adding more attributes, because I requested a
similar one for other lints involving macros in that list, e.g.

  https://github.com/rust-lang/rust-clippy/issues/11303

So hopefully we will eventually get those too.

Thanks!

Cheers,
Miguel
