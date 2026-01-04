Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C72868AB
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767526833; cv=none; b=IP//LLB+Dv93NWy4AVD0dwOLqg4RbeHTFfnCmFaMusGicrRvyDpQRlFl4HldWC/82Ep0yAjsFtcSdAkEozt8NkxHS8s2vSsEt7LPPR+gB2ID5nxpliO0bH9cmd+WmL4eXdM3K+dUqV0KpysUsGpEWApRKP3Efnk2vSoqQylq51g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767526833; c=relaxed/simple;
	bh=AdLaEbu+CLiQdTtmMqeBoK5MYppvfGHNfnURahOocNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzqI8zbhq6ragjM0VaVykr6RlctLsdcSHLLP4DT1nlQYKiunCH03IxoV1D5QnEpUkpKbLnVhbSuDdOiMBWwfI//I/6WKhbr0E8qP5aCYA7dGDnCBuAZDrauMdCPOZo5HkY28CzMBlQhnMFBkgGDjLTz4UePC36akNi1Zv4Mwaro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4okUE7t; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4okUE7t"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a08cb5e30eso27888075ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 03:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767526831; x=1768131631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOiR2u6mlLJSl02K2L/VerbaqrkSVNkTdi5KWJEftGE=;
        b=T4okUE7t+I9TqDuCLL+M/tpNw3aQ5bD15V8iH/q2I7xh94TiS4QUyiRr3+89ppVnMN
         JOv7Rr7QCkzALUbgerC75tarvJqQJnAjftb8uKP7fPGWmmkaJ+u8qYROB2H1AaX4Z+AR
         ok9B3jKLInItr78KbYbQpNEYGBvRvlrdF3qBaqHuC3C6eOvwQ9hw1GP/hOgAvenpUwxf
         kocf/ALJU2c+65fwEXTm6bGGkm62ryKuZ9bppCkX++4XmtikAAbq4gB+YjJj+jXXHIfY
         5haaCJuLbJTxh+vSW4FL/lAGiSSyVXuKthAoY/qgduRNPppGsTId46Hud7r6fp76WH32
         sZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767526831; x=1768131631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OOiR2u6mlLJSl02K2L/VerbaqrkSVNkTdi5KWJEftGE=;
        b=Ytk1lJ54Wn2MK5J5jGfCjOs9iIFY4ujHMjbsNSVDm3fH03o4DsFTVlXEzQ/EuJAF1l
         IQk3e1RvdAO5vYPGOc1RGP7a/xWRm4DZf77XVbTmWYzY+XQ2Gr0e03jZmGtTLOBLv0T2
         hh0lzdLRVmvybncHl5jYbsG3j2D8z+cCDMg717gy7XmTbW9AAf+gL+XuXBBGf1SdXhTq
         3R3weN2ggA9OV+P90MEv24ozF7zce7wEkjvQpnnUDc45i6L8uibtIvIA8YDlib1SnmF1
         zBoLwgGUCHHyGrkoJnldnZwKAfJqq7BAvXEj3bdRvAxIFRwrOuSN/GavMoq14prjCrqb
         IDOw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ7kXLmQj90NdcQis4uQ49HWjWv4Jm0G6SSbmt4fh6LLvS2jk5WzvSxY5fFY/s9mzYmGIFlXf3ooAJuWU0ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl5QtACPB0ghmU9hR70yJsJcDNIfAvOI6nofz9XryiAvxB1GM5
	YIxdjR5lV2NT9cxS5STIsPhTnsRIOaqRxCla+CpoYlPGZaeoWwMubEaWyLUn/LcVavnktKM4QuH
	ik7o8QNbixd6MX6Mu1r1ld1v8YszwnkXtXlSG
X-Gm-Gg: AY/fxX5K5SYnXqfVeT8FYCjsHPX+6Zc/lNx26Tk5FF0gQMlD3RyJsebCrWjFnE/MwTL
	m6OcSLex9OC5N8xhSdm7NSc6N5ySsDDRZiq5MEe+7+U2aN+soSnuLpHQOmwT3rMF25an/Lg73AW
	6hZbm33wsS5g7tr9f5PC5u+3xTI70IhMFmPnS4LunxJ+cDkT1mDLW6lScfYDLFPZQ2zPxDWgzcX
	hxkRe+Yt4Pzi3IHrlmRMd6G7o7RngEiGzfgyLPmGPlWM8U6nREEFGeQyWOU4voxh98CvlTDOE1K
	K1GIvecsCFn3ADznNvBJcmBJrV37jF7OuQaUh1v9CpY6H18w1hCvU6ZQ9FvaTOo9SzG8Ftzv9Pw
	zaffzuqpQPOxrACdNNH67YH0=
X-Google-Smtp-Source: AGHT+IGZNGJXWeGUy0qD/2ZZlBLns4S640emjlxF0i1BMJssLEDYehJ0Tyk52/9hDWEGz80hiiY9y6axy5gmUTKV/qI=
X-Received: by 2002:a05:7300:c695:b0:2ae:5f73:1968 with SMTP id
 5a478bee46e88-2b05eb7b6d1mr15977856eec.2.1767526831057; Sun, 04 Jan 2026
 03:40:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104060621.3757812-1-sunke@kylinos.cn> <20260104060621.3757812-5-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-5-sunke@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 12:40:19 +0100
X-Gm-Features: AQt7F2oEoZEFUpXfnYcIBsrd_YW6Vf92sLDWAC2rt0GMlus4l9UQhJ5Etusj34M
Message-ID: <CANiq72=tk1=qM_KMOKJeWj32T85ogJUZbFpiSZkABaUPrwB3Hg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
To: Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alvin Sun <sk.alvin.x@gmail.com>, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 7:07=E2=80=AFAM Ke Sun <sunke@kylinos.cn> wrote:
>
> Add Rust implementation of the ARM AMBA PrimeCell 031 RTC driver.

> The driver uses the AMBA bus abstractions and RTC core framework
> introduced in previous commits.

Cc'ing AMBA (Russell) here as well, in case it is useful for context.

> +       depends on RUST && RTC_CLASS && RUST_BUILD_ASSERT_ALLOW

> +         This driver requires CONFIG_RUST_BUILD_ASSERT_ALLOW to be enabl=
ed
> +         because it uses build-time assertions for memory safety checks.

While replying for the Cc, I noticed this...

One cannot require `CONFIG_RUST_BUILD_ASSERT_ALLOW`. If you need it,
then it is because some of the assertions are *not* true at build
time, in which case either you need to fix them so that the optimizer
can figure out that they are be true or, if they are intended to be
runtime assertions, then use something else (likely normal error
handling).

Put another way, one should always assume
`CONFIG_RUST_BUILD_ASSERT_ALLOW` does not exist, i.e. assume it has to
always be `n`. That config is just an escape hatch, and one can
consider it may get removed at any point.

Cheers,
Miguel
