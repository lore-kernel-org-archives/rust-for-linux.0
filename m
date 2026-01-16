Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA32207A0B
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768592530; cv=pass; b=lQPD0+sLFOPt8XdaaIG9avnZzVI0PKPpxUBq+uttOcXhQpD1tYIp9CeHcrJb9eYyDAgoPU78b7U0CmuciDoGtMCpxAo3YvUXtZbTIw5jaKg7a9gxxxmZnCWzJonix0VZ1dVVlJ60GMNcr+XyrulfML9b5gnJMvoe5DCnsw6ZEmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768592530; c=relaxed/simple;
	bh=eAdi2tKGdwtzK1W4hmlYB+ZVtEVFHvDaVbcQV/op7wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpcgWragkR/USXwoisspgPSV+dOU+lPm1a7izoZ5S7nzOoXUhR9DpyevsNfWwAunWoH+A8aC+nHM9WSxWGNGxl5fIu+0gw4P7Fbl7cGPmOMTmCVidF1KP9VUn1j+ro4nixaf19XTJElPDKxiOX1cQSRrOmDNaheCWN6QcutU7Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1qvRufi; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1qvRufi"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ae60d8a05dso312697eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 11:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768592528; cv=none;
        d=google.com; s=arc-20240605;
        b=lWntlEoEP+UMXqlv2JzAJWwEGG7axcH61V8Lpwf/rSMhZlMegFMwHCeWE2qKON2Bk0
         VfZZrS7wCYioDPRlIg1I6cMLpor+DyXZl687KHcBreBkzQsV8HfzKwdqujoFIYKQX5W9
         IWI2nwKDXEHFkKt7Te7jfHARRXOXRAKJsb59McbEp0EVWGelC/9TagMfu+EeQynwb40A
         bGFVeZAACf92YVtqk9w1GGLGM8A6Lbqe3ccbL67nrBzhH2v1iAJU86l2drVJY4rLYsOJ
         YYvT4S661zYLgHmuNYv/EKrq0/btXlWvpgNoPy04RHDCTHPp8gpmM50sXTuf1t3PiKMF
         HcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAdi2tKGdwtzK1W4hmlYB+ZVtEVFHvDaVbcQV/op7wA=;
        fh=svDXhrWfIwBAtJ5CLfP9OHUMyjgr5HYS06ljZazeAHY=;
        b=bKPj8AYzYbkMS3KaFoGLsg2cVWrfUCcCmys/JqYIvJGtxq01lmn0OihbKccowbbWy3
         n16C2xK9VWk0JSKhkkGpCHfbCA1A7YyVNfqsH2HYrBCwCrHXWMSxx8sEyTZGfrBzopM/
         R48MBfpj2ampO9+PoCaVCA3MkgthF9JzVp9z6ke2KpuBEsy1CSHfgv7ozQFedaPMfFK8
         N/aEvFgyscd+GTqYjUBxlDqg64KLmn6Ux9pvFhPjhvKjF7fLjDrp3h7otuQL+WvVajvo
         tG8jdN67CFcpGuMmwlQLFOwAyXWSq9r2lxLnP3JgnTHoQl5vFBVZJ2AkJYCl5jtb3yOf
         gvOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768592528; x=1769197328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAdi2tKGdwtzK1W4hmlYB+ZVtEVFHvDaVbcQV/op7wA=;
        b=Q1qvRufi2FlJezBM9DltIzJGbKKG8NAKI4IjW+5Vyclfox606IlLvgSFM+HThFPezD
         69n6YdhpehLCgt3IwiPQQh/bi4TYlT3ZYazkmibDx85echRyP4aFJvvwj/yM/W79UQiE
         askSrBhpvNzaJ1vtOSoI9WHpVX4QY1Fwzf8HzV7U4M4ckw8zYWq90FURszTQzAMx4Oap
         9ocBSw64jg7cmeY0phqCcifuhhB4mVQ1ME4S4x8o0SeMjUl70F1Pqs3RyzaDBtBQcNqq
         1lEayaccxPrCWZfVkxm8QoJ8Tn9wM9Hklagz+bKbvqYKCjIa/XjCSapM6tAXEgcS9YUf
         uEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768592528; x=1769197328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAdi2tKGdwtzK1W4hmlYB+ZVtEVFHvDaVbcQV/op7wA=;
        b=jkhKKs/cjpTx2u3107NSKzZjkSG4LAak0vQZ99Oj9mupKeTrPdOk5pGWLq3vZF84iF
         SC5eYlH3cL5G62/AypF2UsMKMB5iUsLntHGSb8MerT8E5JP6jnIjcgrbb9a655Cn3oGH
         2Dw5ERrWAHWEMTAm4/M7L+Osob5jKvXnbI6KwglJEy5KX216kaLNiYANpeFGtfjb0jRS
         LsTP/otJuJjVzWq68trBXOAb/HcCaaA3GYpnVfrOrxeWNUG4noKW0QTlpj97PhxZYh0g
         xoxfvVfAJhg31s+ci5AxT7YItQeS/jIVsk+DfjiW5gRlPQZnJgeb61Gf23u552a5Ot2n
         /vrw==
X-Forwarded-Encrypted: i=1; AJvYcCWePZ4j39VJBGbZEpKRKxPG702hhrbPMOLzHXUl3l/TrKSztw7g1mPdvtxCkzltmOSH5plOxHf+KQSYDaRlOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztCl+Po1PKPP6GDLNLaX2orwK4DduVa5QGBHSdJe7TI+oOhOhv
	8mf/H7mJoMlqDXahhN6dzBvg0HnD9BAQ0scCo1P8ZeRqYXA4Vgp8tFPor3gaHPe3S01xRCEJxWy
	CL67lC3lQM+nR5imi+yLvCNDFocV50Co=
X-Gm-Gg: AY/fxX47x9Gdc3ReKsts5DhuaFORWu+YH/NXd3h++jaKvDA9lC696mPvCk8RcCEZi8G
	SWBHbLmkHx52sPWj3G1KPGTxmFW1lYZs6KiIr6OAA/U3wY2pEHR2103jAhk5u3v8CvsEnbWjd9v
	atUUQw3bIS7VBkmzrAYp9XN9ygl8TotDgyzIeXQdvtfNI81ig+QF6kFd9kGPsSLtg14SIbbeuU+
	SiZxWPtOGw8nOrEz60HRsFb18NdaxpMu9sJaS15gaPEAXCp++Ab8trh0/cDgoQi7bQUXl3n2I5k
	D6EtGWqflhoLvW3zhn9mgmTly5c7JoeAGcS1VcT20Ev4j8/5oJyOICcCz8BQRSQvtRD7kPR/Jdt
	SvRqllAem4ufJ/niiVeLvybc=
X-Received: by 2002:a05:7300:748a:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b6b40adeddmr1981519eec.4.1768592528181; Fri, 16 Jan 2026
 11:42:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-rust-analyzer-pin-init-duplication-v1-1-5e85c5824a02@kernel.org>
In-Reply-To: <20260116-rust-analyzer-pin-init-duplication-v1-1-5e85c5824a02@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jan 2026 20:41:54 +0100
X-Gm-Features: AZwV_QiHfkNU0QNLcCb8-zUmrI_DNezL1s6uGMNEqvePx_xxikoGbdwF6RvO-i4
Message-ID: <CANiq72=O-+UTxP-eATh1yMAzX6B-O8h7v8FYVG7F-Ym0rA6F_A@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: reduce cfg plumbing
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 5:11=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Plumb `pin-init{,-internal}` cfgs from Makefile to rust-analyzer and
> automatically interpret `--cfg <crate>=3D<cfg>` as applying to <crate>.

So I guess the goal is to simplify things and avoid duplicate
information, which is good, but in general commits should explain why
the change is done (i.e. not just what is done), even if it may seem
obvious (for patches you receive, then you should ask the same to
submitters! :).

In addition, for the `rust/Makefile` ones, I try to mark those as
"rust: kbuild:" where possible/reasonable -- for instance, this could
be split into two patches. The first one would be the "rust: kbuild:"
factoring out the flags into the new variables and the second would
then be the rust-analyzer one that only would need the extra two
arguments in `rust/Makefile`.

The changes themselves seem fine.

Cc'ing Kbuild as well (there is no major change here, but still, I do
it out of habit).

Thanks!

Cheers,
Miguel
