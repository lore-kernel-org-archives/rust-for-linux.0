Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F022DF144
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532875; cv=pass; b=RGCcKbTYmWX8yugOSOcuiP8dEnyl3XOyKsCxxT9/bfp0VFnLJjh5tgyiBluXkWjWVJfNCbdxXdtAlqzYjj61XCY26KLwwEuMvDP5q1LPuiFiXCC1W36zOj3IKZmtzUN/WDcEDovGGS+llAhg6JGswgxUKlhRFfeMD42NbhpeHXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532875; c=relaxed/simple;
	bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLvjWVDAWr98FZYJatNSwR01jIZ77g3dBZARk9jr4DOy71FfrmUO6QCIq6grOmCtVdgAv4A+hA0VS19tHBJM8AxjtcgMpNINW9DCCd9UaAQp7UJYdvpSBjxjFFXnNX9yEk21Vdo5Rite7uQ6GPj61VRQy7zV1u/DJPBhj4yeG6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fI2GbrqY; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fI2GbrqY"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c16dc38120so87858eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 06:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774532873; cv=none;
        d=google.com; s=arc-20240605;
        b=SD9slnyPA74NKiKy5ec6N06h4cv9IvyUSq1suwP03g5bYfElkMVkgAx6LqYYL1KHzF
         ANYrnB2w1uSdKL1mLfhXTL2sSjp4ZlJGh5xI4FVWSHLrszgvUHqSDvocrre1EQtpHO9r
         qb8F4XU6NU4vrQM+ty4n+HcufRCziqsGofQ0u3GBKzvYpKGnqQt2jslne5kTKhdIZEii
         shOR28v2+AL0usAuuztzCmgukQmLeTO0mHktmYCV7GkMwYxlt9ZbRP3yG28ZvyKihkSV
         mE/plvB6cmtoGRk6CYNc3fcXIALIgRdSwPPK3In1x6rpkDTxupYAgq7Ap8lHW0XYFyuu
         kXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        fh=0RQd2UHRnmF1jk+vYtRHOC9I7w8RWE43GuFS4E5Gya0=;
        b=YwlDzU1zOqLomd+4VFzRxyuu4DrKAZ/6AhZPYH8Ouja4PQyfNUl0XRLNDJ51mcUEgc
         KDvAYRh/0nsHxT5Ogfdc2PLnTDgcAHt18/91L3kwaB2ATp5oVOTRbAUgKwb5y6+qr7O0
         pwcCbYWKbQrR6GX0MuQmU5XRBRKO2wja/Z5RUqsBOGJAEsTMTGzaT9MMeEblfsyswHXw
         uo7Zrwrs8I3AQw4S9BuEbw9klAxQUBCmJDI0+pp6cJpCzOeGsdH5ODcZQjydLA1pJJd/
         BgJwC6sFgORyNN9dWXJaU6G4JZbZc2/ZT+1s9DOsFsVADjAfGuLcrK5bXbfVR1UYi4rO
         //kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532873; x=1775137673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        b=fI2GbrqY+FKMq/Yhjn1+J7rikfGysJyAQrvZWzvQqfnY75bZWstkrpjLrfSOwvGzyC
         P2nynUMumF69eA3lhgAEBvvs6w7XOjVZUdwCEyu0CqZgDFVp4iuOW1qaFYUzaelrMMmn
         sKunTY9dctcIaFjXGYQ8jPaPevQys7cBNYEDvxaHo5K9ChROR6q2sbVBKqqrmLc8L9TR
         5BMe1zhdk0gujENlUYhbpn7JXmJ+tqvnW5yE5j7OZi8xRskaT8/vThoh/46S1/Z57ChP
         3WGVMYLlXJPJ+o55Xvv90mgX75kczcG7DbtVDOfZ+7acTwN0O1o3lGDeNE78NAWRJlv9
         Wu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532873; x=1775137673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        b=soT3vpKgoigX6q4HVSdN5X1jLKrUOUwwtQBSN1vxt2sbJf2+hNHazPwcHUpNI36ZCK
         m+kPknD0TSZORydgR31YoxEjXn7ISEtRe/6yYHtRi00uWvT2iBMA3pRr2Nj+F/FHBaTo
         eTtT8FHduF40eUcY/cvx5NSl+B4VcK2+uZjm7OV+X/wu5DQodxxk9JQAXfh7xK/vaCMv
         2DjDGphimprRJ5uuln3O3SW9T6kmjnjnHY3XwVuLzTQBgy3C9WaaemXN/NYsDXdOb8R+
         cEyLkXgt1vpZ8vegc6GSfyZdRv9AjWv5Bqn92AA4kSDoqjjPCLs/38eE0pAW46H0yF2z
         XtFg==
X-Forwarded-Encrypted: i=1; AJvYcCXLuC1Ua7yrAVAAZv+wwVZ2w0SKRKlXWslqvpXtx9TNDkT0qupHAyX2HDOmqwc0trdYOI7gRTI9V+TOqtTXMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwygoH38iD4TPRktmdLmk2btcZ/8y0rHwjRaKQjbSOW+aoLHGBx
	SQkHMjlBLA0hIYLo7DIDEetwChUqYqxjemMpR8DEV3lVRqyOk9gYvGofWqIw8//en8fLBaaRTq/
	+1jquldGXeYrJhOFldn3bn1ESLzNM8wI=
X-Gm-Gg: ATEYQzwbrkxV4/alIIZODQKf3r9JFux6Al5hS5pxrW6/UaoZXTH0hqsv6jz/T6VXBl/
	SSiunYMxYnB8mV0uzw3KJSVhelYhLXUBCxSaElbftmygZ3q/NE5EJ39kD5z/xFYDRNVRinkEZ6F
	5JovjLvlG+q8/PSyJ3G5oWS82PbPG3n3ldzlNsxJj7R3jmvKa59wn901QwmWJrpelCKZB9CXt1v
	+X4LvqXZhHjjg/jy5O6/3uuiSlZEX31rhITfvo4KAG+nQKxB52D3iFSP6xLVIlvgt55XP0w4UXl
	iNRsz8FuVoml19SdAMr3zAerefw9qMSYCeTKltr01xapE8hT10FoO7+fAnvMfOrdoPP5PBS0yY2
	aJxXUplfUasxV3+TZm7C7BUU=
X-Received: by 2002:a05:7301:5f8a:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c15d282067mr2176054eec.2.1774532872905; Thu, 26 Mar 2026
 06:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
In-Reply-To: <acUGAsjYvNvTEO92@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 14:47:40 +0100
X-Gm-Features: AQROBzCEnROF6sNSCO8peAhuS8KhaF6UHZKXXIBMm9aT2zIjtnika7P390Hajek
Message-ID: <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Alice Ryhl <aliceryhl@google.com>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
> target. It should probably not be -linux target to avoid this? Probably
> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
> CPU_32v7, so we should not need to consider the other variants.

I think Christian tried several targets back then and eventually
picked that one.

Christian: what was the reason to pick the `-linux-` one? e.g. was
there something you wanted to rely on that target spec that you
couldn't enable or disable via `rustc` flags or similar?

Cc'ing a few folks.

Thanks!

Cheers,
Miguel
