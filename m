Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0087512EBEE
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707218338; cv=none; b=BgcfYSAvw7xQystln88UIVQLA9hVip0rmsAo+GDZ/hFGT67/N4pgD2To+wiTMjbaKdDRUAfuLuJH+TmdVsaLeD1dfzkYAgBC6UHlGQA5bZoWJjinlUQY7FXRrki+KtBP53dpnv6ODQXiNzGQGkUEmAiocqbeyeSrgLUi0ZPVcCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707218338; c=relaxed/simple;
	bh=tHsPmXySmfEZeBznGeXeSOlcbdRdNZhEqxfrkRYKIM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6pqUDaKTMnBVFq253eqeD6Ykv0xU7z8F0BOk02if8otXn3jw0/juZ9gOUwY4JlvVv1hr7Bp7GUXE14uuT8G7ngjpWXKBHuqehrtj3uqzz6NHJpJtv7h8Wc6Ce0etywMEffo2zcUmcCeYjQOvbf4h1aAwV28IJNMdLgwWY53dM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HofsmNh0; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HofsmNh0"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60412f65124so50385747b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 03:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707218336; x=1707823136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgT3GYtzun8jRihAY49wTcUXRLWnznoXqj7XMTeYC2I=;
        b=HofsmNh0AK7h0Pz6cUdirdDuOahm5oBrh8VU9kPrnzmzwJcCqG/B6kd3uTZPbtOhaY
         tR8jbmz7pmOuMxo57P+PtN03amTaNFB6rR+FjeEYhO7uSgjVub4fMLPS8hEjEf0B8oNm
         hMT5hnPHLXZzq6/B4+L+dz4A0DAey7H6xnOCOUJ01XyR1frGabs2XYf/g/bGVZ/hXuGV
         4WA2hy3y+Tta7gRblLTlqbmgNDIsGt765Fz2fCmnFsJchV1AwB2wYVqPzmElP+Ne3tBx
         AfgpOm/6zAd4OKyiRiWuKyUp/6GAo2czCcM0MiGy9WqiGOpCwOHUZwuegCGekpfV2l1B
         8/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707218336; x=1707823136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgT3GYtzun8jRihAY49wTcUXRLWnznoXqj7XMTeYC2I=;
        b=YSUynoykTzUUhhxPVTKzO4VvIF0Xtuv9BmmdogprNhr53vwZLqwXjmMjNDldbzzbuW
         KU0OnhimzlwhUUnGaTaMkQ18QQDb+sZU8cU9tHONlshFSTMv990Zky5KOg24PC37ZuXd
         fSLvyAD9Om3UCBmTrA0SPNnkUTts4bGbP3bK4+ob+qFieaApLlnv2iUqol+4z5qvekjA
         AeqBuAJRZXD5cJjXi2IYfot5g2ORiHK7vUatwqY1do9kuzL5zYANTBD2BJIhKAhzK7qi
         4x3qY0ZxwCfE7SryWMLbyfnu1nXb0idp5kfnckc/AGmxpVjGIZvxLa9c+dIu5xRWP6Jo
         kQLw==
X-Gm-Message-State: AOJu0Yx8h00K8+AZMYevuki+wxP7yB8JsdlrbwzqhVjsZGzvh6G1nVDv
	0ZxRo+C4KDS0K+3ja2Rer3FjZdtQ+zXT4kyHWcZnQeYbmBfH9LbrqBFZUOy66R0Bf+wL3BunoJX
	46FNEeJpdG63e594za5NiPn7glP4=
X-Google-Smtp-Source: AGHT+IGb62ZlDoTXZwtqVfAdQe8t3FTer8Ks41yc5vMw2Fn1BaWP3K7IEbzAum09OxjJ85WgsdG7OCQdIaCkPfckeS8=
X-Received: by 2002:a81:ec0f:0:b0:603:cbe0:465e with SMTP id
 j15-20020a81ec0f000000b00603cbe0465emr1473466ywm.20.1707218335827; Tue, 06
 Feb 2024 03:18:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020617-edition-underpaid-4873@gregkh> <CAH5fLgjYCg+m7+Q63gFr425NiMkhTPWkDufB82pPHCZNhYAk9g@mail.gmail.com>
 <2024020613-illusion-quirk-14d4@gregkh>
In-Reply-To: <2024020613-illusion-quirk-14d4@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Feb 2024 12:18:44 +0100
Message-ID: <CANiq72kOdNWvr2MMGXOnB5GGPOGaFotV0sB+1T8aze1WSfCTaw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Greg KH <greg@kroah.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Thomas Bertschinger <tahbertschinger@gmail.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 11:50=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> Cool, but has anyone tested it?

Yeah, in C, I see some warnings from modpost (section mismatch, plus
the explicitly exported symbol), but it does not seem to catch all
cases under `defconfig` at least.

In Rust, similarly, I also get the warning in some cases, but not all;
e.g. I had to force the function to be non-inline so that modpost can
notice.

Anyway, the "unsafe" approach (or hiding the functions completely
inside a `const` if possible, but IIRC from a previous discussion that
required rearranging things a bit due to the global asm block --
ideally Rust would provide anonymous modules) would be even better.

> It's not "unsafe" at all!  It's totally normal, and "safe" and should be
> used for many types of modules.  If you get it "wrong" the linker will
> catch the issue, so what is unsafe?

In Rust's terminology, "unsafe function" does not mean "wrong" or
"broken" or "always triggers UB", it just means there are safety
preconditions, i.e. "it is UB if you break my preconditions;
otherwise, there isn't UB".

In other words, it means that callers need to be careful (and cannot
call the function without using unsafe Rust) and they also are
required (via a comment) why their call is correct.

So if we do not want any Rust caller to call this function, we could
say "Rust callers must not call this function". Even if the function
could be obviously called in other cases.

Put another way, as a function writer, you can hide "use cases" if you
do not want to support them. Even if they happen to work today. You
can think of it as opaque/private members in structs, but for
functions, i.e. contracts.

So if it is an unintended use case, it is better to catch it as early
as possible, even assuming there is another safety net somewhere else
that catches that too.

Cheers,
Miguel
