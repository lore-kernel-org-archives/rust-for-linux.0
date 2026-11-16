Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794853536;
	b=k8yfaiUaNJ1wVGOBx6iW5VgCgYtYixad41UFyj8S+fcMLc3gA+00AYGaFCxHPpEShxTw
	 4grS0nH8q3UbhQ8Xh/I974os6Je+ATErz62hDKIT3dLIdsNaqHeSsbAHNO4We2w4AdO2d
	 MlBq7bEJ9AWY3orZetVe6kn43mcO87yDiJvQpQI6tpJyKglxxb1ssBBeIWgLZrfGtx8Sr
	 gL2eLlezSKLeOqR4VJrZ8t+QrfqpAqUa8JFz3KLLWFOgHaGdKEUu5tnsotGd4CJ5pSskF
	 9gcIbNqML7BuwSQgwbMQIfhB7K/3j5gEroxFe12f6J90OWYFbDO7lQe8+1QhDXLybWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MmvRB3XET/e4SxvoROlmDCe5qG23SqnwRokKlHMZoeQ=;
	b=vItjschfuTd2XUWPwwnFNPkLC0lk/Ma2CvLl+b6tCV0eMS/lgLPNuGrVXUrcEryuwPZh
	 hE4CpcpDtRWNyLkm+NU9sPpMN2m7uL/KGZ3CN+h3TY6uJCp4HoUvrqI2XNz3SnHsyMkn1
	 1Ywrb0000JRqyA3WMX3gPKA7bD54ZXdjkemtWwsbJQf2W5ntDjkHWU/8ll2npS2s/PGZo
	 yXtV0HrKJa6kh7j+HWOQOwnLKTROptGNmYD2NGn+kqsIXRS5yL0g5qB7o3CxBnk1xRjNT
	 LuKvw8c3SA+BkzVUrDcJQfrS89j/+7fv8WMOL1yCMFKot88+j3iL0cudBpZ4U2/HWaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lV49A7wz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF949606A31C
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 18:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF949606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lV49A7wz
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4090211fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 10:25:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794853534; cv=none;
        d=google.com; s=arc-20260327;
        b=jTUjQmqL8CMUAqjNnwRL4aQxduNRLHboAjc/QA4XPWQk1jUtW7xoLD+U27h3cA9n8h
         TmiiD6TvuZx5uV/+k+I+GRguJzU6nyEVIE0iM5XgZdZn+HWobMSSVbJIrYH/KDs/wW62
         /oLWZI09foU3NLWzsyYSmg5wvV0Hfl90EkKzN1J4uhIdfVqPsxOEIY6uS4Ncyb39y1Rd
         Z8AzQLEbGksQi2dD2RhuFv3uZCwizYH3eQFaxCCuookTLA4OwmrAXmTNz5/x0qyZ5Mm7
         a5LxZUWDB20+K9GkLrPPNvtqOFgJCsjBhBSGDaySnrzAUGD6Mx7CN1RzZtLzN6AHkdo9
         tFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MmvRB3XET/e4SxvoROlmDCe5qG23SqnwRokKlHMZoeQ=;
        fh=0p45U+EO2UlIffLtNdHxn6E3e7l3k3MkHW3EXBofm88=;
        b=W84wlSK2qthEvTKsAiE/qNWnPU+qP9hNUvD5URktY0CmJq5fq1j9T8kddkhPg5P28L
         GKz1f4uL7peOeaLnKXNwCujaWA45hnMOUu53NVPJeojsVsDbJD3IJ5nEr1eirWe3cIOl
         SoMLspIgTl/uBNYMUdiUU8XW2xrsOG3IwXTmQ6a7rbFkaxE2DGeUU2vk5nRq7zzumD/e
         TivQFB/Cg1pDVXx70jDPLIAUFvuRH2+OEgjn/2YDmMIC0/o2KI0Drf+KPV12YI4rqKY1
         jHtBtq8kCjDTX0NnZAxdFcI0ELcXWJDZbkUX7nZ36TI+nbss3gK/ngk6WZ6N3CUUaF+K
         Usdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853534; x=1795458334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MmvRB3XET/e4SxvoROlmDCe5qG23SqnwRokKlHMZoeQ=;
        b=lV49A7wzomsZqR8kiAhUUO4KY4cqfBghHi42jDCtjLcwddNEXzn3+we0WVIyLa6NaM
         rEDvFzIWrRI2EyUL/1o0NkWi3J0I/p+1J2TBujOoaCJUN8rl+D0d2O9hfhf5jmEM6mYL
         UZq3v2IMxgOMAKYJuy/HcP2nEtUJ4O9Rcc3RzZ+Z2ZWcCmDqPbpldH6xI81uZAm+bL2+
         OEzheyX2lOblF/iXoDIEj5mk0IG2eLCxXJEL6IFYaBMResQ9FFej3cKhX5uTPvIbrQOb
         NpfyZVdr+i4exhyG0A425X+83YzxPpbTlLmUI7gvjyXN4BmWCl01eI5DrD5m6+StZzqf
         7Amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853534; x=1795458334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmvRB3XET/e4SxvoROlmDCe5qG23SqnwRokKlHMZoeQ=;
        b=sRUd6pxbZ/WXhgvqyLJgGlZc5vwoukvsw9ZNuEnNnWTJ07iY3FA9GqZjkYtdbhVhcc
         uJziXlVlGC+f7bZtppW/joXNxVY6MMO/wcU6+L17gURzAFYDyy+xzzq3V275bMQNIme6
         DSdYHbZPk4N/ocq+6vDFOnGSwbdDh+edpJFZ0cR6Qeo/8y5tfpFp5x7MWM2anyIqi+OE
         TaavuUb+H7CV3d525E4+7NZrG+uvAiutUgXTNhtUB+UQChg2E9BNaa+aDbXMZgwfATEH
         8Dn7NULpz+SbMf+HxhB19obhPgPG4yYCGfYZVe9p85d+obVKw2gf/5+qKcBPr74+3nzc
         mARA==
X-Forwarded-Encrypted: i=1; AL+hErH6YGAL3BRsSWtBo5zf8IkjEcKmburc9DZZcNpyK6PHF1ro84FAXDQEiJ1eahX6zHV+8umuXYVjmTKXYpLkIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/rV2HVOIK5UxjUirJWX2d/YUuPV9LXOyyZ8Dwi/xvh2GeeucxP
	+Qo8BaJFfpJdwYZjb/pLdMNBC6YfxYgeUK5qmwLDIlh99/L4M+J2ZuE5Z/poPy4Q53kBoF8YomU
	5r8LpobaDpdJetjJ/i8slh6ByYtWVAq0=
X-Gm-Gg: AYBFou2NDe6rix5Hq0xMxVLl2gIOzjdNEQH3enFz2y0mcgtxeU+ceu+te14oXIOhx/D
	arzBfX/3nnbcPj12IwLryUREHPNaN5Ne66AH/ZuhjnRpP/wA4UI8gzLOw+jp4MDh57Zz7O32wPZ
	/2QSYy6qZPDU00wiJg43IdFRk4PH4nVvLn4y2UQF+FbL4jfOMK+DQGmgUod5aGkxzcC88ejtSqD
	7MBqVmIHk40mFvUcr8SHlmT9lWxC8pTC7o5bFPisQF9ZtrT9JCLIu8+rZLiop453oUeXSDPCJ7p
	wxHeRa1KbJI0gXUto1A3MdcTJ1bPbk9G0o1taD/LZbzH7tEkizLMzVm6TV3X/BJ8hoBHCeuEbUE
	OPCg7pNv+7P3m0M1+M5YDtSl2Km7q86oyEN6MuufK88S+R78kSQF26NZbELDEwCQ7wAG0eNhKrz
	MwRnvChudSLdqqeU4hkUDg1MoQvdU0cJgxkkeloLM6K7Po9+XpEZMa4SFHjlM1dgydocGa4UkPW
	lst7Zt27TDAXJJ9vZ/ZEsuuotj+lvckra+OXJIKMyrshvJr4n2/7OI2WY/NQGFOJxsNZfQvvvX7
	I/fDSO48b9dzRewneEA=
X-Received: by 2002:a05:6512:3d20:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1709e0a05mr4430696e87.3.1794853533682; Mon, 16 Nov 2026
 10:25:33 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111205204.481923-1-afd@ti.com> <20261111231053.529616-1-afd@ti.com>
In-Reply-To: <20261111231053.529616-1-afd@ti.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Nov 2026 19:25:22 +0100
X-Gm-Features: Aa3M54rVRyf4es6TqziTYOUJHmL_VeIv9Dh3QTOWmj0uc-rB_srLGsXruXgTUXQ
Message-ID: <CANiq72my47EZMwqQ7+esPjYv4rcuawhXJVuptPUF-SOWWe5c6g@mail.gmail.com>
Subject: Re: [RFC PATCH v2] rust: i2c: Remove use of bindings::i2c_match_id
To: Andrew Davis <afd@ti.com>
Cc: Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:11=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
>
> Well Sashiko suggested I take the easy way and just re-use a different C
> function instead of trying to open-code the loop in Rust. The C function

I noticed this series while going through Lore threads, and yeah, it
is generally better to avoid re-implementing logic in Rust if a
suitable function already exists in C in the subsystem (unless there
is a good reason to not do so, of course).

By the way, while the maintainers may already know about the removal,
I would suggest adding a Link: or commit reference to the patch
removing that C function, i.e. to give context for others.

I hope that helps!

Cheers,
Miguel
