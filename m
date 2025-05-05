Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2D1BC9E2
	for <rust-for-linux@vger.kernel.org>; Mon,  5 May 2025 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424772; cv=none; b=Ku2pWWmu+V1Gutm4nbk0DIfH0bB5QKctQq/F6Z77nyzzMNX5vkmukvBqM3zkvK1AINVyirngatUVvQ8YOfa5v7Z1aXZP/SKKtp9syBNErkm8fhgqZ3/8cCg9uVuphQhp4i681AjGL7XiTbYoGpY8qcK2cn/O6l06zLr2BDHiF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424772; c=relaxed/simple;
	bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmnf3hSlMBPrl2BZ2lg7AedHYlPNyNAf4tqO5t7W+xAbmkZ5BW3//ylIt06bFsXfo/gC4SUlFWCxmFHpgf89QNByoCOHDEoCz++027NW0HMsleA4AR7n+oz5ZUtzucGc3t3WIrL/3wZbzttQe9K/F8YCjYjleenU4mTFiUOw84A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZoU+o4H; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZoU+o4H"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso41608681fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 May 2025 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746424769; x=1747029569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
        b=UZoU+o4HWvakX2nxmiB9eKOzNpzeS2xKKeVbm1wrONUXlfK+Hyb6JkBP5aS2thQouu
         vI/mJ2/dK1oDKJkn3BCsoMMzN0k3C2dG4qT0E0U6KemwFOOo2NxpDEyIoVVqZnbuKcdO
         VoM6jIiMGWvfCszwv6Rwd2Vsq4UuBAwpwEEfHeKctkptM9g11or6SlBb7mrb/QkTH/ED
         l8AyUeV7Sz7XOUxejmJiNYkv/2RAbNBfkh3cuZGjwgTsiPJpCDXeJBLZdkbPQ1GtFuXT
         b/3dtTIt/9nHROwnmuM/KJkTovXhbZGnxasysqCGdPRaxahnWJrjRdVkudOWLPJsw+Kj
         r9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746424769; x=1747029569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
        b=YZqGMT/BTUEIUaw/g7A6JPP6rnzi6IQlmDUGAMGuONfRX+jeEZr5Yxsduqwj1ZuwZE
         mJeW9C8gwxfQBte2RA0LgtmT2lzq8HE+dSJJ/8c1I/aCJe36jtdwoSXsFoo7qfoD3KjI
         4VDaMmlcXzy44xOvvaDXVIe9hPcZ0oiQV24do/R7Meou/IakKiv5SochJc+Wz0+LZsAy
         cUIqwpWaN5RKHEWg9JT6ZqwWfJy0vQEv/9vY8j3Bi1WyGxWxrYvYkuA9QwJNdM2kC6CQ
         A7fc9y33z+yesbDOr6TpT/m8Tn2yqNYhrvWTkmPSgAglDJtzYe+IJfTe4/rElT2ghR1H
         Al/A==
X-Forwarded-Encrypted: i=1; AJvYcCUOZtCYrOlbXkVsbNXsysF0WX/1QWpb6hiHoFy9aeds9FPyDzRu7dt7aZAMF04+jXHZAD1a8iZkE2w+u5zJqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhN0NLJE9zGK0qnN6JHgZT+MgGkqWiW3T6HEggcfrEyrf4//o8
	ahS2jITwN6FlWCAVMXXx/5KNQCRnkbdwAku5wqNcj2p560wLTcaUaddFF5hCMhyk1dyO5hlrKDS
	nQvNw/prUXuYpMnMhKMZKv8J6PMOKG16ER1WF
X-Gm-Gg: ASbGnct/DYNdMgxLKZYblKnW9JYhgEEgzfJgIwN69D/J4QN5OFMQcTrMje4f3V+JsNN
	vaotbZox0adw9KgKVIvHOP3y8FVXKTAur26LS+Mu5xpTQBhqGl0hYEUzT5arIXtx8O2TXgbfioP
	9PL4OX2BpVjFf5qk7/7ApP+x1pCefHLR5hEjLLYy3bNxL6bf5B4fqmzQ==
X-Google-Smtp-Source: AGHT+IFD2StGXXU4LRBTieMiBl1477i7opw2k6zaQzZpZT7Xzqji9FSBQHuj++vQYVldHnNlC03ywPxgJw7rDH3n0w8=
X-Received: by 2002:a2e:a585:0:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-3233ebe48fdmr15610161fa.0.1746424768540; Sun, 04 May 2025
 22:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
 <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com> <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
In-Reply-To: <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 5 May 2025 07:59:17 +0200
X-Gm-Features: ATxdqUE_jDd0HC0IONKRAtQ24jV76OHs3LwnQnbNgHzz6cgeJxyFcYPBg_mcEL4
Message-ID: <CACT4Y+Yavh4GkocO01GSP+0hWXZNVBEaD4-9W2V452Z5+C+kZA@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2 May 2025 at 15:47, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, May 2, 2025 at 2:36=E2=80=AFPM Aleksandr Nogikh <nogikh@google.co=
m> wrote:
> >
> > Thanks for incorporating the core.o change!
> > I've tested the v2 patch on my local setup and it works well.
> >
> > Tested-by: Aleksandr Nogikh <nogikh@google.com>
>
> Thanks for testing, very much appreciated.
>
> Dmitry/Andrey: I guess you may want this to go through your tree
> (although I don't see a `M:` there), but if not, please let me know:

KCOV does not have its own tree, it's merged via MM tree with MM
maintainers effectively serving as final accepting maintainers.
