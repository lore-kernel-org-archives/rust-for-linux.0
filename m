Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B418AEA
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Dec 2024 15:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733067468; cv=none; b=qqI8cSUaWfF+gCeZ/30WyrzMQI8Emiv40Tb0iLveB2c7/nyZhAZgQp0y5hvmsexnScl0eMib7LdQ39X/IR9OCjk5hFLk3VnK4LL+LQgR1aOeSBzWP0EVUNYJ8w81iGXVTUhvRlZmE+iMq0tKgZuiEM+yvx+KQJSOkEM67zNjKZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733067468; c=relaxed/simple;
	bh=6ZXrC4/JlUk7ti0Y8JtIyAZnh6Xgd7N1iPkLDMzrnOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJrfObNdIo8/+MSeO0G16iGpoytndmyUHqlkcQZWP6SSWK6hd41o9FMkgtbjK4QPZdkgVGzkzbB5BDLE+f3GVH23LidR9VKGpJZpZKWZCuY50ZcIURV58golDQUn0D8VZwJ52rRmv3HIG6wvb16lgmeeZjeTH8HnVFM+pVhUbzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrFDOLRD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrFDOLRD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ea93311724so369250a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Dec 2024 07:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733067466; x=1733672266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrO9vMDUN0Dq6iSTh/s7EQvHs41r1emtkUzWokIshw0=;
        b=jrFDOLRDjLpbydFW1fqXiiwdQKUCfdhnctoRlr9BQOH7Mc4YykIohgJiRvB+yraMdd
         iUWXRz9BkL+GxrT9qPJ+GCva+zIa+t5i6Sg/05a19Vlcx0RzW+/jKYB8YLCmFEdmoPBA
         H+gRd2aCOvM3EJuCCRI9kxvrzEIZ0laWK+/FdYxeg7LHC7UzGXIXJ2xfhW/JKlJAuXDh
         FVUbHfF2R8QZbO9YbDHWElHqSdFAggd9/hp8z9vEw7FLT6sof0bwtgKnMTNPuO4uKe98
         0bADRDGxZzvJ4PjcclHf54ZX+SalRGeNsHG0gtEXtW5dqhuByeePfqXcdN6ozKqgK3wp
         mn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733067466; x=1733672266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrO9vMDUN0Dq6iSTh/s7EQvHs41r1emtkUzWokIshw0=;
        b=I7uzG85a6ioz3HX4WbXQ8L0LBxdGMl4GmL8xAGie3Y2bEvWd40I1Cd+naeCRIXtC4b
         Mo+vsgt9exaun1TK+If3XEJIb2quCQPwn5VwEnKzFpxxcOumlNzOj0hEmOHx+5aFtd2x
         SHD2StWqpebY4FKhB2dYf70vuoltoZoIYKszYJ52094Rtad2AKdSotVgBJVAKMxpuRrg
         5s4+SnXLSAbzEUmZZCtI67Q4GGFMNwhvGmPKCxBT/khjep4Rsu8ROTC3/RbnjMGWs1/I
         BDo11lKy+sahu2uNxEbCMW6dvGj5PPlWOTggfYp7vdEooEO280zgvXm4PwSX8gZuMysI
         UlzA==
X-Forwarded-Encrypted: i=1; AJvYcCVpq31WdXSUG4zIf3vKD8W6ibVGQO2VU6myrkbhzBC3oNnTpsu91b+w2NBq3KASm3SkIQk0XZGuj1dvSq0rSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEuURY3eH6J2KMEegYJQBPQuZnRlfLW0idNyDd6nS7EE4zIO+g
	V+g3z+x9y0EQk9MJpDCpyc/47GPFqnKV8ANHB8c2diBRsG1iC6u3OLr7N3D74/VbQ1OAk6ods/j
	9xI4CM9MDuSbhN4hImQQakiKdCi0=
X-Gm-Gg: ASbGnctpVcdP6l9tNnOVTZDjtS2veym8UV/6NgfXeL2Q6FGYJR8ci3qW9EBta/HMss1
	gmlQLbVnrrplaG+IlMu43aWFZhBEAcpI=
X-Google-Smtp-Source: AGHT+IFd4boXfyqAVtLwktVrQUk+GxZGW6vp5gn0EeDIOHf7FonumzOkJjRmtnVlz2dEeVVyp4TlPLE63SL6YZ2Ml/c=
X-Received: by 2002:a17:90b:1b47:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2ee656323b4mr4954170a91.0.1733067466571; Sun, 01 Dec 2024
 07:37:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118031225.38080-1-kernel@mandragore.io> <87ed34ly80.fsf@prevas.dk>
 <caEePXpz3dyKABs5ReUO5NGlpbqf98_Aw_8tz9ADE6c1c8hYp523uGk7l9EcfSD0u-YLtozTD4wwgLEytbzzm6gnd3r6jQeXqr0Fo3YEYtM=@mandragore.io>
 <87y116icrx.fsf@prevas.dk>
In-Reply-To: <87y116icrx.fsf@prevas.dk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 1 Dec 2024 16:37:34 +0100
Message-ID: <CANiq72nH7T9b0uLP-QtX6eOZhybQE0TWJfgi-J3dfLcCr-s87w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add safety comment in rust_fmt_argument
To: Rasmus Villemoes <ravi@prevas.dk>, Esteban Blanc <esteban.blanc@epita.fr>
Cc: Konstantin Andrikopoulos <kernel@mandragore.io>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 10:07=E2=80=AFAM Rasmus Villemoes <ravi@prevas.dk> =
wrote:
>
> That's certainly possible, I didn't think about that possibility. If so,
> my comments should be ignored :)

That may have been the case -- this was commit 9e8bd679ecf2 ("Support
Rust `core::fmt::Argument` in vsprintf") in our old out-of-tree
branch, which added the docs to `pointer()`.

> So I dunno. If the intention is to refer to vsprintf.c as a whole,
> perhaps it would be better to actually include that .c extension when
> referring to it, to avoid the ambiguity.

Agreed, it would be better to clearly distinguish between one and the other=
.

In addition, I would suggest moving the "`vsprintf` guarantees that
..." out of the `# Safety` section since it is not a precondition, and
probably reword it to clarify it is talking about particular callers.

In fact, wouldn't it make more sense to move that note to the `//
SAFETY` comment(s)? Actually, what if we just add it to the C call?
i.e.

        /* SAFETY: ... */
        return rust_fmt_argument(buf, end, ptr);

It would be our first `SAFETY` comment outside a Rust file, but I
think it would be a good time to start doing that.

...now, I actually did a quick grep, and there already are a couple
`/* SAFETY: ` comments in drivers/rtc/rtc-tps6594.c by Esteban -- that
was a nice surprise! :)

(Speaking of drivers/rtc/rtc-tps6594.c: I think to follow the usual
convention those `SAFETY` comments should be on top the block (not
below) and ideally split for each operation. Also, I think it is not
up to date (?), e.g. it mentions `TICK(S)_PER_HOUR` but it uses `NANO`
instead (the other side of the code does use `TICKS_PER_HOUR`))

Thanks!

Cheers,
Miguel
