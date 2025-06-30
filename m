Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96728B7C1
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Jun 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290427; cv=none; b=k3SyKPSdvRgOK24GgeZlKf6pwU5fSEVVvEbxtrI4W5yLcPq5G5RkE8Mepk3vJ8jPpPVNfcWgDbm+sLRdupxEEUeyqeyGeTtoNfAY4opx0Mf8Wu0uUSMPkTdqf4ZS09R6Cyyrazeo7XDmrpOGAHL9bHuAwpBwqinLY9+AK8S8378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290427; c=relaxed/simple;
	bh=o45INCbiSeQE2IgHq1YnHw8Gfkpjyezwdh5cW/jtGEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maffHUixQsVos6MWZD5JQZGOcMmS8ur+DQ+irz0IM+3hkHeGiy5AMfUsdyi4HSpeJLdgbbNMRqYEhYTnX9zSXRaS+XUNvlvrTg5jL7jZhhjQ6IYFkH7g2ldZPvVFAK+VI1R9bid2BqRKluU9rE36YlV0lSsSTBJ0VdHLMZTk9NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nEDF8MM2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nEDF8MM2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso28306805e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Jun 2025 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751290424; x=1751895224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o45INCbiSeQE2IgHq1YnHw8Gfkpjyezwdh5cW/jtGEk=;
        b=nEDF8MM2pc7lbtsVi3CTNhTyrzz6UkXzdgcX0fhTCrPjr834pmMvFk52be2MR4awJ2
         2iZxXtR+m0LYrOA07pY7LU8wCNwAHrg3qDBc3H1e+CWspixjdCYJyNEtNfj9nqyiaAWQ
         i8qZLNe68flg2qa7cKoyhxqVfNuPLX8o31yTJFWrvC+gTfrxY2X7kv7LNDgxz0kDg8+M
         png/m9NgUoS+8Ictbqop2IAFtG77TozE36kwQ5i0J2B+B/MzQgRUHDjY0RDjgddNQW3I
         OrPQBM/IGfi+N0Nk/dSbQbFUtBO9JTWu1S2LAAEJeOWhjPew/dnpviw0LX7IYKD4+Jrh
         o/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290424; x=1751895224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o45INCbiSeQE2IgHq1YnHw8Gfkpjyezwdh5cW/jtGEk=;
        b=R2wVaVzBMVWsP7xDD98ZZxKvU9CQqM+qY+xJjxr8Ld+kqOQbc81XzC179nzD1ZIc1D
         /wGSbLIzgzjW6mM1ZJ6A+sQNXTzrNhkfZIKQA1dGHErj1zzEXAwlTD2W3imeP0faKsi6
         cRnTdMf3ibgDFxAehddEWE7fdl08laqc5cR4DiGQ14JY3DsCJ3IsT2HdipvokadcdflU
         FPOArTIO/kHbxERgRsv4g/pu4kwuUL2cUkXsBQhrG6wIWyQ68z8BXXf4kueQyaUhjnI0
         9F0I21nDEVQl8nthktnhnJEn/11/u+04vSa5HaKtcFyp15tHwjwCIPcdHeOv178TlYYi
         qMJA==
X-Forwarded-Encrypted: i=1; AJvYcCXrlRW3xiiFPA/fkFwSpKEArw13GLWlFhY+sRpPDMUAGHrYyhQLengK4BkrfD0UOFJ6UxCiHspcheFyyvgP1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YytxGErslc72AWHwJO75LfuAu2SEdKoJz0hAt3NpKkZvT9P0Hy2
	10aW7M9PJ0Lu9NftI8mGm66OviElf+OTgvgpPwPAHWk/Xy/CdfH7n/b/Bdq49Y+v2BQhsrwH9Cv
	RqxBHGpb4Kl0quxT7nG4MvE1ZceDfrpUOeO6xbEHu
X-Gm-Gg: ASbGncsqUGKr3uHE5WR55Aq0wvWGCAADJVEDPZwZkaPDLL9kAwWAoTwHnqYWrsjlcrZ
	0LGJ+vZOeEno45vDK+Y+In4VJTk5t6vy5l94CJeY/AcFBwfV68DsKkT7kKbR3p2lZFsi0VvnAu5
	sU4LJRGN5na2OOaV5snerstPGjmtabYrVdawfkKFib/xUbuBohBQJefGUT+G/6Sq2rDrIg4vg6
X-Google-Smtp-Source: AGHT+IGVJu/D277FQPc0r0siJTAo3I5FJWrKQJdxkbD3ntuYhNVrd8Ps5yu0EVn0gdE5xaSnpYRMnPIuj1WaKYAXRKc=
X-Received: by 2002:a05:600c:698e:b0:43c:f513:958a with SMTP id
 5b1f17b1804b1-4538ee3bb38mr125353655e9.13.1751290424357; Mon, 30 Jun 2025
 06:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630131011.405219-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250630131011.405219-1-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 30 Jun 2025 15:33:31 +0200
X-Gm-Features: Ac12FXxucSgJGsLEUQk81gSz3INXTFu7cO5Eq9OXyDy2vbnALYwRo8UAsMt7WH4
Message-ID: <CAH5fLgirsNn9WwEUgFaY2z9+9gG3SWssCoNSzpE56F=sS02kEw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	boqun.feng@gmail.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:10=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Mark the ClockSource trait as unsafe and document its safety
> requirements. Specifically, implementers must guarantee that their
> `ktime_get()` implementation returns a value in the inclusive range
> [0, KTIME_MAX].
>
> Update all existing implementations to use `unsafe impl` with
> corresponding safety comments.
>
> Note that there could be potential users of a customized clock source [1]
> so we don't seal the trait.
>
> Link: https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-archl=
inux/ [1]
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

LGTM:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Though you're missing `` around [0; KTIME_MAX] in some places, which
may be worth adding.

Alice
