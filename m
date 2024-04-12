Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB21F5FF
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Apr 2024 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712910980; cv=none; b=BLmOHQ+J2+htm0J3YdOf8VGhlmjqRruNRbjKiXOLScGosSdXFATxwnfBilauCtbHFh7EvuAhfUvn1fuvhHAp1uNZ+DSwDKUvnLFwGFxw8SuZZf+EZcbbmOKCbu1Sb6cMPOvSpaKDixzSOJrr1FMpFRibBwfe87f28mNymoOQ1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712910980; c=relaxed/simple;
	bh=icsXkT0xOb6e+1xr9g6dtXExIPMijW/K98732uk8zLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hav4X29Wb9OD+D829t+NmLFYyMNR42wOcCZhvym2LjVwkeU71Ft7eBlorYkpxtm155EWw3cPtzd46MOQ3PlRjWE/Gi6Co/9E9VwaSqnmXMP1TBGba0IgMjdb7TkcFX2Gfwzn6rZUcHi8nNmoOUjRvGqG1A9tjjO1xrQPN2eXWJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qxf+OBHG; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qxf+OBHG"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7e3555015a8so230611241.3
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Apr 2024 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712910977; x=1713515777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwTW8iE9nJVGzJXr2vldh3noIwLG2G8OB3Efo+SZIqE=;
        b=qxf+OBHGRqPwF/JjAr1m9zngOp3YGqbpB9PJS3wXxpOIl+WjESNKURUeOJc3MJB5ud
         HTrCOSTbFGKPTb08+q0cfy3D6qZBLHPg4B+2ZktQ6hvdHFueDc9GNB2N3gHTHAtKWd55
         y+IgDqZ86a+JkQW+JbqTPBAsDGQ8VhGG9N1MxUMLN4ALhU43V72vkbarIXhVDBJUwPqb
         +FYXuM51KItRspYIaHftajaqNHl8YJGUSIP9SXzQB/6YHa24nVpcs/mrPZetgPkaxljX
         j+PsdzZQT1A9z4FuaZrz99A+9HM84SYNaJ0jlifIpj8t06w95TZNIMmqIxxkx4h5FMF2
         qF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712910977; x=1713515777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwTW8iE9nJVGzJXr2vldh3noIwLG2G8OB3Efo+SZIqE=;
        b=aWPKqc2bl1HrDGv4yjb0OSVTpTF5CgCFgGvHwrvq1OEsn1gUwAO5pSEitxRcag6e7r
         E+B/NTab5OD3ry7ebTMul58WySOsDiIZTVQ2+cKn1ZfTTwNz43LO6hvvykfaK4Tx4Vb2
         ePzg7QTO7UscVrRuiAYxnzo96SIqPlsxOCtwD38Ojbt+woIjfBk80TmVSnHx6Dieq8ep
         z7hb9osEpue1JzZ1hntIpsJqb1TMnOMs9eYgYAntypb7xdt4CfujiCLM8WPVJlJW6UV6
         GYSg8eWO/v85LFuxKMa9v1IHVXadN5nZ8V08lC+RyJqA60aE6OJ8xSB9WGzmn1PP9N+k
         YBwA==
X-Forwarded-Encrypted: i=1; AJvYcCXoEuOlKTDujAvtxrmf+CXaD6MzifuQYRbbNN+9+wgWvrie0A8JhOWoRJ7WvHGufVbat1Xu9kkrjzHYt66/Uv1Mv1DOV0nXnFl8gUsjAq4=
X-Gm-Message-State: AOJu0YxJtVmw2ficXyxezVHseIePjtx1FrGNqiDDkFwx5nIG3phk+vnZ
	WQfmVvnxmhSwcM+0alSkX6dN2eokoazDDJYJXnaok4Ml+xNOLLv9ULoLYPBZxVpRZZ/O1mEdOQs
	/D+RtN8RJXTfihJYS+2tdBDgGwv13PxTox4rf
X-Google-Smtp-Source: AGHT+IFOFFi3ViOVoOD1KndrTnby69/2E/tV4wV+grVEX/qVdsAByWdqEzJf07hfF6DtoBQbHiGWIc7+81kZy2zFfpQ=
X-Received: by 2002:a05:6122:16a4:b0:4da:e977:1fb7 with SMTP id
 36-20020a05612216a400b004dae9771fb7mr2234667vkl.15.1712910977298; Fri, 12 Apr
 2024 01:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411230801.1504496-1-boqun.feng@gmail.com> <20240411230801.1504496-3-boqun.feng@gmail.com>
In-Reply-To: <20240411230801.1504496-3-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 12 Apr 2024 10:36:05 +0200
Message-ID: <CAH5fLgg0CkZO9KF58boui6Y5ajpXHuGh0OxyNru2aEG5pNObwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: time: Use wrapping_sub() for Ktime::sub()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Miguel Ojeda <ojeda@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 1:08=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Currently since Rust code is compiled with "-Coverflow-checks=3Dy", so a
> normal substraction may be compiled as an overflow checking and panic
> if overflow happens:
>
>         subq    %rsi, %rdi
>         jo      .LBB0_2
>         movq    %rdi, %rax
>         retq
> .LBB0_2:
>         pushq   %rax
>         leaq    str.0(%rip), %rdi
>         leaq    .L__unnamed_1(%rip), %rdx
>         movl    $33, %esi
>         callq   *core::panicking::panic::h59297120e85ea178@GOTPCREL(%rip)
>
> although overflow detection is nice to have, however this makes
> `Ktime::sub()` behave differently than `ktime_sub()`, moreover it's not
> clear that the overflow checking is helpful, since for example, the
> current binder usage[1] doesn't have the checking.

I don't think this is a good idea at all. Any code that triggers an
overflow in Ktime::sub is wrong, and anyone who enables
CONFIG_RUST_OVERFLOW_CHECKS does so because they want such bugs to be
caught. You may have been able to find one example of a subtraction
that doesn't have a risk of overflow, but overflow bugs really do
happen in the real world. I have seen real examples of bugs in Rust
code, where overflow checks were the reason the bug was not a security
vulnerability.

> Therefore make `Ktime::sub()` have the same semantics as `ktime_sub()`:
> overflow behaves like 2s-complement wrapping sub.

From Miguel's reply, it sounds like 2s-complement wrapping is not even
the semantics of ktime_sub. The semantics are just UB.

Alice
