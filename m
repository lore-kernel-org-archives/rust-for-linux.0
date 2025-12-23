Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A01D4204E
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472101; cv=none; b=JK/HuaGoE1aVCvTZcURC/DA5Tp230OlrxapNsyDnjYk2PpC/lvlLT97+pP1XjZPGWjHnrJ+kaFfI983tzGhpYbe9hOJGejgznPyhjhHV4BKgZL+dAmMKI+5Zl0WIbPmI4dBzJwRTP19VbgSukSg4eyx1qmVtzkwCAKdYWCZYRkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472101; c=relaxed/simple;
	bh=NLViVmaAOVroFXDwtc+Z4yIl2fJzlqgHCzXmn7ocwcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKs+igFv55oesHxNIyyk7o0Gwq8gPRdf0T9fqPQMNcvBwfp+iEEyX0/evIUNtQwflQYWCoYyNZbju4N2WWAlsXzwpCrvm9ML1ey0Ct0W88f/X4+/eZaZOqZ+raTaVMA/sVd84C8ueoTQiqCEsCl/gXTlkSN/n7am40LmuT7Ts88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiIV2myI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiIV2myI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29f08b909aeso8829055ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766472098; x=1767076898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLViVmaAOVroFXDwtc+Z4yIl2fJzlqgHCzXmn7ocwcw=;
        b=CiIV2myIxI+XpUkJkgX1joc3oG+Xy3K8Mz9vK4CURMtncxfsEgShlM0Ddg9I/MKr4q
         gmk6gW3HFaFmmnEPhAjSFf/WMF989OTValTO82IVeTWFRMV1LEPy+pLlCI5f6bmvDP8o
         63mAx21Oceqs7Yvjoew0PqFbrbmUFXPwt3W7Qzu1Q3m++bV9VpJGaTwBgVUTjspYKLEW
         vGisuhUAdNOG3vuyyzEehSuQ7nOpwwCo1flNQAAziF/+SGOziCJkWe8NBbkCGF7v7/Dv
         qmqHMdq3R/yy1FejM6ZG8UARewFHEtfm5LYleU6teMwG4uN3eyP6cp0LegXKs3TE+1lv
         Ckwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766472098; x=1767076898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLViVmaAOVroFXDwtc+Z4yIl2fJzlqgHCzXmn7ocwcw=;
        b=THdSqls2QcKZCYtS/24V55QlEhUeECQvsQ/RdAIZgAKiGC03/bUdAV2FQZreJyzuRV
         9sHJDddhiKMOwIJDPOSsFyew2/9Em2Rt3f+dWH8SZm7kCLDy/BU/iEVACwfcNEsXNetU
         5KY98I9UDV/Kjl2ZUH3ukGlOpd3DKfcTi1F2Uzt033Tqe0kULUtM7xmrRiaYA/KuY2LS
         /lgoyGmAuo9eg/4BBI1nPTqjTDapA2Mxj88UKHVBmKOP/fepjzLOpoXCRNqJbSE8WdB0
         pkjjuW0aMY2o7TZNg6IVnZY/dl6lfQV/pHn3GrNyrUnec/5NXwOC4itQ71febDF7ZP7R
         Ckpg==
X-Forwarded-Encrypted: i=1; AJvYcCVXmGXHAzkl45Yj2xjDi/oHkxbdRJGE948hDsXwI3TUXIsh662YRUNHxxeb5tpZfVul9XBGYcsbeM7Oev46HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyur3nSROfZJJ2IaAuNauJSl9xAyPHHmGQJ/Io4/9lzN6+jX6CM
	gT7q+WP1j7vN1b1o4UUjrkIv9G4Wv9TO2kB0FCWLOQbdwsIZLToqUdytDlmABs4KU2lfAohvyh4
	FCZ2TcxtRRdUsMFpRsHMBcd3mUqXetjI=
X-Gm-Gg: AY/fxX78agE+et2mH/Wa6L51OT7+1l47jnhk6dGC5V0Vu6qI033YbW+us6kPuJ1aPne
	8vIPJmaQ91mCdAj0NEQ7LgNZsMRmQDbnQiELrqhUpXsSne2kwPFIiqD2FMiumWFlUUNBftErZkl
	uzf8U+gmkpQHuug5puolDv/Dx7T25co8I2xWGob5XuTyfnOeBD9mrKirZiA/FfULu/Lcq1UaqgP
	Do/Tsx0OWLAbpS2iHK0X2mt17L8Tshe6jqHEhhFDebW2efrGgXLpW3MSGXwNsmpZdmqSG8ALdw0
	pR+/HhG6BaOR5i544UuP8PNT1K4C7ahYj99BR/m2Lh42prt1DqWC0HqIv3uAdvXCE3DIR5sPC7J
	uuemzHI3f253R
X-Google-Smtp-Source: AGHT+IF0gpBSFg9g3C9p7b3WprZB7rplZaaASllGESKgF7Qipj0FQPaLuNAYc0CrWkXEGJnK1czmHtz0DoDixKgxNCE=
X-Received: by 2002:a05:7301:4090:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b05ec45daemr8051110eec.6.1766472098357; Mon, 22 Dec 2025
 22:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223033018.2814732-1-sunke@kylinos.cn>
In-Reply-To: <20251223033018.2814732-1-sunke@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Dec 2025 07:41:25 +0100
X-Gm-Features: AQt7F2ohOlgYMeGhLIyXZi0JlKaibG_S40sESb7YcIPYt0pbj_TXDIs8YxAVv3s
Message-ID: <CANiq72nZp-ULXMV9yG_PP=gkr0HUPTcE6ZRQhtgRp5Zk5SR6sA@mail.gmail.com>
Subject: Re: [PATCH] rust: fmt: reject {:p} format specifier for raw pointers
To: Ke Sun <sunke@kylinos.cn>, Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 4:30=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Add compile-time check in fmt! macro to detect {:p} format specifier
> and emit a compile error when it's used.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Please use the `git format-patch -vN` flag so that you can set a
version for the patch (it is true that it is fairly different than the
other one, so perhaps you did not use v2 for that reason).

Regarding the patch itself, ideally what we probably want is to do
something similar to the C side, i.e. by default hash the pointers
like C does, and then have an explicit way to request the real address
when really needed.

For the real address case, we could require wrapping the pointer-like
argument into another type, so that it is very explicit and opt-in
(since having our own custom formatting is harder, though perhaps we
should finally look into that -- Cc'ing Gary/Benno may have some ideas
in this domain).

Otherwise, if we land something like this, how does one print a
pointer when needed without having to manually replicate the
formatting? `:?` perhaps? But that is almost as easy to make a mistake
with as `:p`, so that should probably be included. It is actually what
was done in https://github.com/rust-lang/rust-clippy/pull/14792, i.e.
both are caught by the lint. Cc'ing Trevor who was involved in
reviewing that one.

Speaking about the lint: since it got implemented, assuming it works
well, then we could just use the lint, which allows developers to at
least opt-out when needed, e.g. debugging, until we get the hashing
etc.

Finally, when the macro shouldn't work, normally we just panic the
macro, is the `compiler_error` meant for diagnostics?

(By the way, eventually (i.e. not for this patch), it would be nice to
point to the user to the docs on pointers are printed, i.e. we should
probably expand on pointers on the `fmt!` docs linking to
`prink-formats.rst` to explain the hashing when we have that etc.).

Thanks!

Cheers,
Miguel
