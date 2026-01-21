Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEAA13635E
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769019135; cv=pass; b=craj425p71dXN1kRgcuImkGmUprbcM58Nm8z8XmF2Kz1GQrp+oOFXDQQMKs5QLBrTHZ0E3yMs2KM/Uy4q7jmbg8+29Jlr15M8fP1X9Ix1Cp2YDPCTJpH9mdFH5hHaDKy/LrOtAttgOtR3rcv8M8yzN+nW5fTsm6/ZrtgVNuFfp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769019135; c=relaxed/simple;
	bh=wuQcO78TjreKTDmq/z3KDs5Qdmz5VokQaGfqVrH0XZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGp+913zxFolJGODeu2zgjtclUy5o+Iey92XsFRkclrz44BV/Xboqg0jU1l9GbeEbhWx/q8pdQhbuyRWM880Wff7mjnPEpigjVgSWJei6PBvQK2Akkg5BPWo7sDPwYcONGkF/2LULfFFcVmKLeR8JvCkC2NFOdACcnE5uzcnO/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsJEdW+r; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsJEdW+r"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b71e7dab12so8813eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 10:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769019132; cv=none;
        d=google.com; s=arc-20240605;
        b=A6pexG0ZbpL8plPizsLf4pZpFgzbxWicAar7Wy0yCj1nxAHeb4OIqiFSC/eEEiXT70
         nCV+V7bS7aFd+5EDlEtc+BOxRQagy8vZ3pQ3aq8+9CzS6yui1errz6d1bFqYAX664eQ/
         Un2KWg+U2Q1tXb2SVr+gT204zrqk3HyJsxOdAKx9+RUCA2I2CqjdEK8fF7GuXBlJHkzO
         bekPTN9BpZg+KoHAwcxxiSJCpU7ik/Tdpnr05/VrbfmtwcCuz5D5DalNKCo9I8Ryf/Fi
         xqNmdfaXfqgCfAxtMvmLFIlPjoJhf5Yii4OJu+s0GDY0Ilqe2ywrP/aGP3TZ13ai/dp0
         apIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wuQcO78TjreKTDmq/z3KDs5Qdmz5VokQaGfqVrH0XZA=;
        fh=4cxUxEAiBuZ37j7dipv8jYGGrC463w2Jg/K2TepYxR8=;
        b=PLfzyHDXXL6d07oYgX1QACNlAcOMLt+ko8WJiMY4bOYFbnTbSnjpqOSF5siNQlqqle
         zgDnwzYazz1CMcq2zrXenUpUmkghAxs/iogDE3xRWlv4aTnM62ppxf8aJrLVzoDGIl3S
         RIh3dUSunKqICZEP73A2qpYspMYoztCqjAZrHL5+5yYk1WGpAORlguaOdA3bWcRBvQ7F
         raVQzfP4K8ztBadyWbmMlzy4rT7292k38YJ5MCaIHICqnGJUlAatguTaB8paPuub7UNZ
         zxQY2O22ujwtrvxN0YZONmDEecs6kraTdMBIsGYIwwiu49jcHAoeB5Pyr4xVw8o9Cn6+
         LB/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769019132; x=1769623932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuQcO78TjreKTDmq/z3KDs5Qdmz5VokQaGfqVrH0XZA=;
        b=hsJEdW+rhh7YVaIJzaZza17sgWL8GaseajhpSo7IhIyLX8VKE7eaCbKE9i6NaLoNEO
         WLNu/w6Mx8GFu93QuAX4doC7M+gXOpsaj2KstSa80TwU4BwmT7+E9J7+g732V2nJQrQ0
         CkABGpWZdF4ZuTtGnjfWWBE0fjzmEGE5slqSpE2bzSDY7apZr9748Nrxh+PGR3tUeGiC
         Ob4IWT5xX5NOlvITEeMdHNr7mccF8bcha7ceuvg1tKlY+kR02ADDm5aqrDVGrVLAvCxO
         wiZtOomt5zj7qf57CoWTqiN9YDzt8BzvQdG2YYPVQ/rqQI1iCXO20Sy5ZOI/1SuyEj1f
         tC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769019132; x=1769623932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wuQcO78TjreKTDmq/z3KDs5Qdmz5VokQaGfqVrH0XZA=;
        b=YC3aMqaLuyHrn2tsfnwffi0V4p09eB4DMcyazlVmk9I4Q8aNzrycGoI+gGdD8e0v98
         mkX4qxehtXrXhRp/F38sHZbqZLN4vke+KrJ2FNAcbnAEWFL16NV+Rjpgx3h0WrgRrxLg
         gdNyIWTOBZM/PEIp2b0PGbf7U+Bu90fZ70T60rpZszIYmtVL1RF3qZaSTs2udqyO8EfN
         ZaborY00Kso6Yd5ASsw8LbG5L1qrfBXb+OYzQXeDU3t1VckitC8AjzULnG5SP6B2EGbB
         P1gf+MEoT3cOO6rLrrbCu2dQ1gsGzzfB1M3MUwXgmW3HtRfaoI/AnpaBtmU8hfJhEVuA
         AE8w==
X-Forwarded-Encrypted: i=1; AJvYcCXYmUtlpmhZqH65oxwmIyTiSNliScom2HHWRVG+119E+dokedXn/YrA64kgeSu/eE6cBYR09brZQyPaV7EK3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcYbdnvPo5kJMwJANOfbujGSWbCJnghkpKCdrYKvg/pcNM02SN
	OY1uGIou6oeT/FxUkHSIkuRveYrUc0tq3Hq4v0ArIT91nOZurt9ssxKsr5ShJd1JhAjVUOlAP2T
	To44PTHgStJC8kc3LnX1KkI773aH0uy8=
X-Gm-Gg: AZuq6aJgZ4vLdCTZIQSqmmkZf8Mmp2rjAXw0xTrmo0MasZ18NDX5Uqb/nSl9vvoj4WQ
	q5lV9I1/WrojmdSp3YMc8x53wCMkbQh+NeNX7TZ9sAbxc7KM7X77tFjz7o58QL6BlM0qUqcTaI+
	ZWT2cPK3uVFnPFMXjNyvBA/aEzbsI3EGildVFG/UHbs6i53kr8lLs0cT4jcTXuajZo3iFtaJnp7
	+rz8jTvM7FYrov2QQkUR57tvhpeqOPQAJTwEIxL7KRZJ6GRtOeKQgpwLGZ7ngKjW0qCRNnrqYq0
	sz3l1r9pZ/CyeZamkzlaWshjfOi5kRyDQcXLU20VzqDnjGCBa5WUgY//n1dFPuHc2CR9f+rmjor
	DNIH9N0FpFBh35hGjwIBNFGs=
X-Received: by 2002:a05:7300:748a:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b6b40adeddmr7876148eec.4.1769019132248; Wed, 21 Jan 2026
 10:12:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121165835.4097975-1-gary@kernel.org> <CANiq72n7PTiAMHy5cM0H3GGNdn8BZic9MAyJCD2KRnPa2MM6Hg@mail.gmail.com>
 <DFUG45Y0U7IS.32I4NMAV9NHT6@garyguo.net>
In-Reply-To: <DFUG45Y0U7IS.32I4NMAV9NHT6@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 19:11:58 +0100
X-Gm-Features: AZwV_QjtuMSwZFrtfH_CUyX5oTKT7xOZtvt_2COopb3thKNnrBL0qc-c58w02S4
Message-ID: <CANiq72=sR2FiD3agm+GvaC7yT5t+bums9DGnkex8ybkdk=oNiw@mail.gmail.com>
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 6:33=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> These are the methods that we want people to use? The "internal implement=
ation"
> means that the use of `CStr::as_char()` is the internal implementation de=
tail of
> `as_char_ptr` so it's okay. But nobody else should use it.

Yeah, not sure how I read that, sorry. And obviously we can't (easily)
add it to `core` one.

Cheers,
Miguel
