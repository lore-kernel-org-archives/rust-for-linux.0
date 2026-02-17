Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E13822156B
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771364153; cv=pass; b=qzK2+Z3G0Yd3rrBWuSmO37Z5LTQjp8fA2Q+R0iXC977TrbjvQRGxYNd1XiuiKxYxxv8jcqiUKcJpajAEnH6K2+uPL29bUChE6+UH3SgkRd1MpJb5mlmRfxtY8yFxIgE9onZ3TUNQlUuXQg5hMaDiUvNcmB8zNMpubHDWfqxUALo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771364153; c=relaxed/simple;
	bh=AlTDEr9XEhP0NbtXCAh2y2xp31drr7QfyS/Mc76R+jI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hp7yulUOZcKHX28MQLrU98WT+0lL1Or8pPkOYaWcgQhuz3fhzZoXvbxAwwrfTGiAPDIEEaZJyRKZYhapvwNynYoPmjxOJA8Gef8GK8gY1gRayeBXGm2ss0xb/D7R1IRla4MHjoFpfNl+mFPRiIFrZj6a30xroK77k6L+MpcaAwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCGyUkQm; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCGyUkQm"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ba6737fafbso273451eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 13:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771364151; cv=none;
        d=google.com; s=arc-20240605;
        b=hElG1WK3QB9RtkYVy0s1/EjreY6P8ESj0Rofa+QXysAXLluSFYVwPglPx8Z5RjYgoM
         +qWy/9kluHrSK8H25gqwTfVTr19IextGTTlPM158HprqL0CeiLeCF8SiWCctKq/kv5zR
         RgBISXauKzLkg3Eo5SNBOIyXlJ/ua6L0xllxIED6YscctPGn6AwtxxHt/cSYv0uGMPuu
         IhlYd1dOVm/0wjTpGW/FeDAWv+H42L6kWXajb9n2qHx+jxTfCcw7su6ujOT+uhTNQk5o
         9OUBl3zvDe38dhI3orUtMvMStefriwVFBWaLQ5AvvAptfwfbW3CVCK7wGFib7NU5u23S
         82Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AlTDEr9XEhP0NbtXCAh2y2xp31drr7QfyS/Mc76R+jI=;
        fh=kSuaGGz/9PCI1rvWlktseyQBq06yCEJ7nG8iyslLEGM=;
        b=jR0KM7PqbvV/7AUQ8q94DOPaE0Alm2jUoFWWGSUDaz5DyCi2v0/oQa67/Li3Q5IED/
         0EsfHllm+3toHEwTdHFAZnYSfLHmfkkRp0TA4z57OSPViU6AanvFq3Lu0bbYb4oneUEu
         WH+JR+68mBNXr7e4F24zUOIp9BHfz9JSg+MqJ6GVUXTCA5RSy9NohcFxtLevVeubXLaG
         2zgvkRYid3u4NFN1v6uLPDZOgdU1MsHjHPTrIMfPpc4GZdHiJqmgCHB97MAUapo4C2Uj
         rj7HENafcKsOaj8KETcwsnscvBq4qm3YpyaULpmwzvBa8G+KxHlzOwYqBrHesctnSebg
         fHgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771364151; x=1771968951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlTDEr9XEhP0NbtXCAh2y2xp31drr7QfyS/Mc76R+jI=;
        b=TCGyUkQmafDztVGL8aEVdawbT7q1FemkZ3k4m0yXOxP7AJcYUoiqHAu6NXiDGQ2Cz+
         s0ms1Dy5UKUBx8QnkSg5U4yT12loPzQv65lOaf6HOG/PJajMsth5ocCgh/8C2AzfPc3V
         alJWRYndv9r7WhJRaRSyQQRBnN/kbfEmrkCYSqHcMwBV4YvCFDMiqo93A7+nZmsLDt3/
         3o+yhtdTkwAKk1Hs/2h49RwVPqygVTrfXMe6kQi33SCG6oqlXVOuDFIz54cAZYIl3aQQ
         R5jxt8Y3S7HPNK2E5+IZ4tv+nXyfzSldSe/+Q83bLwNqvlli+/CJM8dkpsVym9Zi5i/k
         16aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771364151; x=1771968951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlTDEr9XEhP0NbtXCAh2y2xp31drr7QfyS/Mc76R+jI=;
        b=nzL8ySfVpRqFeijgAS/acdMwC2Wmf5DQQ0hj3AbEuOjMFpQn60M35yBU+SVvO4+R1f
         JSbzFsd0nYPJm8FXUX8AvhovTv4b3/BpW33HwQoETlueMDUTjdtlVMt3mYeArhhs9NDm
         gyES2oZzQ64Kh+nSNLJC4wvL0awOBlXoz0mdOr7nrAoT7sqsOSavVaIytEHUVzqx2b5c
         WMfzdDwhsZ2uhyWVC8Ku6dQlr4FyYCDkxuoES4kcwFAhXikRor9T9dCXQsODmaRwDJWQ
         LNHX4SfS4z6Tl9aRHfuBt8/zQLMSjmtKuWVdVNdhX6iLkGCbnZH/u/ymUYwDLpKKiwQ8
         SYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrcUlg8BbynOAZEB8E/F1YIvk0K+covgzxjoGz/OnHhN3x6y+Zaw00GE5Th7Om3GCENVjQRYAoHHa5gPQnkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2vd+uCV6ITrOkj1H3N5UZOCgrd9VQeqIC2yUPcZGup6wu6RL8
	aF2OXMqZxkC8smh5CUo4vJV9bSzwV82b0JqyyuZqy0885PUOI9K3sjXAECqzYMQyQkpu1IWTCdS
	TMTbpOSKJ0GJhmm+beN/YGSgFu08l5v4=
X-Gm-Gg: AZuq6aJIaNz11PHyFRx2r15qTzcHpGA+Px+BJJ4Fxq0n/ZLIJ0R5zwcKtxw9GZF5o/u
	lcKvZtSUrUbvuxrLgGn4zPmEK/jn/ZL2EeJoUVCVWZWPX8SMf3BQUb1YivlAUPA7hymcxNdWBzq
	I4NmEKcVd8bZuAe6KgCar+5MJw30IDci7Vd1cxE6hx5ZKB6delILsQ6rWv2ggrJUCn549Zpsx4P
	BhdKtUPAsWt6qR01btLKKNim378elZqXvSOUMja9rw0HZ+iTsa6OEFyfs3ChxYLEvARC4iASnmd
	XARiVIH9Wga2M4jHsprmHmgjJmMfk4wQx3TMtEF0oWq8srxdt/RCfy4fY++yetogURsAthrEfv4
	n3lmrR1/8QArfkCy7obhU1dix
X-Received: by 2002:a05:7301:3f19:b0:2ba:8496:47e with SMTP id
 5a478bee46e88-2baba10f3f4mr3422217eec.8.1771364151417; Tue, 17 Feb 2026
 13:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
 <20260215-page-additions-v1-2-4827790a9bc4@kernel.org> <g4ihY-XQwSZ3ysINoU0v3jFzzJG7Uzonq0b6C-EYEYDx4pbJWHHJ1hYmQsmGATIDzexHv6NFea8YNikY6zXq6w==@protonmail.internalid>
 <CANiq72kovxkiF1Kj66yVyQYKx1OijjtTGB6UN5M35th57UFFeQ@mail.gmail.com> <87ldgteftm.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ldgteftm.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Feb 2026 22:35:39 +0100
X-Gm-Features: AaiRm523b5qMOhoIdKn4-pyxHU1Rpi-47kriAyvWums9a9bruJTWdRHw7N9WR4U
Message-ID: <CANiq72kZQiu9DbQgkHXDDjHORwUdTm7oOhZOE4Tr8eHiyW7RbQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: page: add method to copy data between safe pages
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 12:42=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Why?

If you mean why we don't do it everywhere, then it is because for many
functions it wouldn't add much value, but it would add substantial
verbosity, which has a cost for both readers and writers.

Originally, we picked the standard library style, because it seemed
like a good balance that both had shown good results (especially for
this language, where we have rich, strong types in signatures which
help reduce the need) and that would get others to write docs easily.

Sometimes it may be needed, e.g. there are many parameters with
details to explain that wouldn't read well otherwise, or there are
primitive integers parameters with constraints on them (instead of a
newtype that enforces them) and so on.

i.e. why do you think you need it here? When a reader sees the list,
they will need to pause to read it, thinking there is something
important/subtle there -- is there?

(I say this as someone that generally likes structured, "exhaustive"
documentation such as, say, the classic Win32 docs...)

> Writes require a mutable reference. There cannot be a mutable reference
> while we have a shared reference.

Ok, but I am trying to map what you wrote with what the callee
requires. In the second bullet point, you justify there are no races
for the read side, and the third one for the write side. But you refer
to the type invariant in the second one, for some reason, and that
type invariant already promises no data races for `SafePage`, and all
we have here are `SafePage`s on both sides, no?

So to me it sounds like either you could justify everything just by
invoking the type invariant (that is why I mentioned circular
reasoning, because the type invariant doesn't seem justified itself in
`// INVARIANT:`) or the type invariant is actually a different, weaker
one (which would explain why you need extra explanations in `//
SAFETY:` on top of the type invariant).

(By the way, if we use bullet points, then I think we should map each
to the callee's one, i.e. #2 and #3 would be together since #2 is the
one in the callee about data races).

Cheers,
Miguel
