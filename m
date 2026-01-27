Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6B2344D87
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512234; cv=pass; b=KkooECJEhLq6z5MnD3PHq9/petp+umiXR1zz70UrfvTk7IMRe26CoQ6//byqt0uCCWCDeN1nbwXL3s23w7zWbIQIjmXL6AYiNDe4Fuzyn76nkMB9gmUBMExM61z/As2rNah8IWKqnrIFCO/0mrA+Sq4HABC6hP0pTPRDiurOIRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512234; c=relaxed/simple;
	bh=oVpARf5fV3Pdw3csIWzlbxEF9n3s3jV1BZOOLZow/jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCslBjcFlbKyXYIFlglwq2xU8lXHnbZIIRXpFYEJ9gYIqpXsn0dxLkpugerzF3oQun+wN4WM59kgN52P84xi8Irit3oE5fCP7sT+ESu6LiLleoqGNChSSFHy3ef13xv7/AQOTiKZO/wesqcTViXeouUHoaymr+MkWAEUoXYFhAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7LafKzY; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7LafKzY"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b70b21ce0aso221392eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 03:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769512232; cv=none;
        d=google.com; s=arc-20240605;
        b=DKcGk0xNqduY91dwIemSpdPwHVcJJ4YyYHIS3x9/sGgE4Xf6fvs0l4B6MGJVH2otYM
         wXHC20i3KLp6ANKaIJdSNjFe7mdd/cDhTQlIE8cDNiHa0S2wcWmzux1pgPCiXswWO+Cj
         Wp2fwENeUTqG0J5kpQPa+/bHVyjTdMDyPD4rihplo7dl0nhAT/f1Xvt5p5SzEf650EGb
         gFs7JxLDP8JRSY5CV4Zuwv2tgwrB2NBPBszhzGR2Ts5UupDc2zAELPtejckshRl0UlKl
         mdxAXyKvO0ZNux2/Vus0BbKcA7MyjE8C2UePG4r+XK6xRYK4hEwn+M3Bjjy10g1RvAt1
         BXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oVpARf5fV3Pdw3csIWzlbxEF9n3s3jV1BZOOLZow/jc=;
        fh=B7M+jA8UaHlfM1t0yrH1irYHAElwzf9ujJ7hqgigfx0=;
        b=ctie9vD+Mi2kPf+41Xzj1JUNQ//mt5e1mkt18kOAh+mcaKnnDBjktWY90QgeftOmlz
         jRj00D5FL8YpdwuW6Iz2K4uf7GdhaSTEXBe+OyxMvW4iBCG248fGfFsdVoyoOpBivql1
         ybXgfKP08etmK0303HXiN9i7lAXmvNJOronh8QXGCh9WoYFXijqpcWM+ahc+qm28NbXW
         xQOIcNbXmfWgKdDDCZw236fTQrdRnnAozSEdY7sk3BmT/DDhVFcfw70RmgQKD2UBOLop
         jsm9ony5TRmH7Zfat0qIufP8ztoFEB3T+EXIMguH1tTysEf/30rgFBqznSYw/Uc2vLub
         8EiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769512232; x=1770117032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVpARf5fV3Pdw3csIWzlbxEF9n3s3jV1BZOOLZow/jc=;
        b=i7LafKzYTX3J01O+vA0spLX3aj8IkQlYMl3LMPpZ0bOSi6MJ47crvxFeekk0/ZLoH8
         9Ok/q7oljBvEpPwTSd32L7elaaR1CAAyLyh4mYWOdRIMWnbvFBTf8wkPQGcrmk0dIupK
         fwUbZmfmKUKF3Tx9g2xVeD9fy0ymS+IW8nY97IOUJs36pL2qwKOmuK2qpcTUquETXHtA
         C9pB2Y8X6X4+VpT8kbRYE8uWdxq7uON6CTjm3cyisf5+eaSKIrPCY+jefMh1NY+RkPyW
         QRu5+daX9iUGYtD3nhI0d3sY4RLqfQkV0n+JDR3H2CHDGK/yd3sFsCGy9CwKYBj7xfbv
         7mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512232; x=1770117032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oVpARf5fV3Pdw3csIWzlbxEF9n3s3jV1BZOOLZow/jc=;
        b=od+nMnSv7PkJZGSASR2lPidjT6LCU2h63OL/qV8nhSmINDcMwqkYcU2QHUS3mt82aT
         FOF/jMKASvjSpMX2cky29ZRRur/bY0+mWGKc5o+PTJ717cUgJIVqMsDBwZQgP69MmCYZ
         dkHg4ZgBuTYdBYrYNh156mkgFIHjfJOZDSRDoGbbTz62a1hv9G0jajc6gSUOS/sI4gcW
         D+pdjyRZU9eGzlJasy8K2D1xhg/w7OfuiKt9dyxd7w38reoevcg0CVH3yorhbDSgQWzp
         rNRDflourkE2J4Qytpv5NoxYI4PqG7zq29yvOq/Al8hxxvwgfQsuJ0/4Dr2ANLm8QxZa
         sA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2mOA+0a42zlXOqnzH4csVTus9NMImEED9ffqc8PMaqxVp/tq5aZBTtbT/qk1dWs8A544LGP7LjMcBZs5cug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjotp+6z9/qFA4lsjVi/7tdXL2Vnfzi7CsACTkt77ActQLAgSD
	sBQfX3ji5Hxsb8fkR8J+UlFQurRjHuXr+ElrXL/QFggMyoVHPyXjvWaa4Gok0R1umUEYldfhXy7
	zhgyF5GY+70juXRJEIXkyH7I7m1VkTcc=
X-Gm-Gg: AZuq6aIIqMcleVW6dg8SulCDlMMXTutYPLRiQ5MTGkEh++L3Vj/UUuujAiBgZBtn/UK
	bJBHcvvDJallxW+ujUeLRqH3YLrMWi7dVK2LIdoCfv6uBKnSqCdHnLXAj5jxhuYHyZ9pT06Ro0p
	Se0LPo91Mh+bDe67MdrI5pZYBWr3iNc/ryLPD6AtOweS0/SoVixJM0tkExyH5KE7gHz4xgC5Y4q
	LwbRKA2WQeVxPZQJ+f6Co1HTzAay04n2aGMgWCNUxJdS7BReVPXEFzIaImvKmplX5EwuLk3JG59
	pe/ZTn662ifzhhhePzJvc7BZ6nMKDiLzlkCYlbFAKFLl4SkPFtLMNbz9d6ChCoxumbvLKii98ze
	cTIEuI0I5bfAI
X-Received: by 2002:a05:7301:3d0a:b0:2b0:4a1a:657 with SMTP id
 5a478bee46e88-2b78da2f5b3mr456725eec.8.1769512232009; Tue, 27 Jan 2026
 03:10:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123172007.136873-1-gary@garyguo.net> <20260123172007.136873-4-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-4-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 12:10:19 +0100
X-Gm-Features: AZwV_QiIYNAQXUMo1iS1chrHUW9bxTCjCJvAdXnsPk3pLlwsWkfKyXessJXLKM4
Message-ID: <CANiq72kwRdYbs9L1hrX_0SdGHsycMi9fz6+wh+qGgWiOsFZZiQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] samples: rust: remove imports available via prelude
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 6:08=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> These imports are already in scope by importing `kernel::prelude::*` and
> does not need to be imported separately.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied (this one only) to `rust-next` -- thanks everyone!

Cheers,
Miguel
