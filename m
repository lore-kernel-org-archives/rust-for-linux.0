Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E091246B8
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 21:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733695099; cv=none; b=dl2xH76XmIBNIWRp5afek/YV5t2wRxvslf4Msv3IPXVxjMacjuSjdT6FYjFXzPvynHUKLKfvkLEdYymUGN8wvTKj93w2JUJGsAbKFNu8nDZgcq6DjfLAWhz5CxhVLNL4+DwJS5brzAmK2mJEWX0qn4MDHZU2RdVrzeXRfYixYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733695099; c=relaxed/simple;
	bh=0L0K5Zd8wAgLn9YSjmPcUaD02Ps+SrN2lIXWxExPO+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpguHCyQxYvNkk2wHJNcx9XZP0HrEVVRHeWL5m4YglimaU0mKr1R8zVUcGiW1+/NWkFDl5IQq6QQaBCUe6+mncdSzckSrTp2b3fEbwCE0wknb++6ljtBtCENwi/oEW61CONj8Zdnz3kxW6ypoJlVVIZzW1l87XWzXGlGHttAn4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJTnvqAb; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJTnvqAb"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30227c56b11so857061fa.3
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 13:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733695096; x=1734299896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L0K5Zd8wAgLn9YSjmPcUaD02Ps+SrN2lIXWxExPO+o=;
        b=LJTnvqAb7P5XifkY82OL1VY6bYHcFyMm7MICBR9oW/hj7XI83sM+veGymyWBvlp7lq
         uySEEdPknREhO9GXAxXJ+aIHZn8+yUzujnHqgxXnpXO4cGoaBs2hKrC7w9lvWC4Gdzl7
         U1Xg6Jb7adXjqNgZaEmBRntT/9PaOfLqTF9fe6mrgmRTf2C23gVD9EQoUzAtJjntg/ob
         vvAUB4xbU8He2b2Mfo87VIwLPpNpmi5saqLRypHVKgNVxdCwQa07byidS9k8exS8Zc/d
         gi9ITlZ49KeOMRlz9ZoAQb4QFlYDG+S6W3MvF8eIkFL02bviJxjBhgfVTT37T9L3fLRc
         rRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733695096; x=1734299896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L0K5Zd8wAgLn9YSjmPcUaD02Ps+SrN2lIXWxExPO+o=;
        b=XCf3R8LJ8Z/zdo3pshZczDGirq67UJwc7nrwfwNYXqPaxgOCLAbvL7Qa9t7+P/6lGC
         3Rc5/CmHvdF4nqHLxvPZR6lyOdtXf8NaDJSq9IHEoST7P5RPa2NkTAYyopi8p4y3LbPV
         /XeC9+IW6OJ1Lj+UXceoNFCzKBZDxUGxcPHDreptdRf3I0NrDbNXfWyRh+JMzqTPuUTZ
         827yvIeDGykxB+nNsGAVWJQwpYrDQgQOUtP3/SIQJC2hHCIDOBtX5XBHvGLwxzz5aQqe
         MUjRNt52iLU6oI2TGPqwT60jYMTCHDf+jPMc17f4UqZjG5QFW2FWFb2BwPPhd7Qf7kDW
         Dpnw==
X-Forwarded-Encrypted: i=1; AJvYcCXvVRJmF1tIdZv7dfQo40NgHMp2CIDcHC18u1KRj+7rx1yclrojb7mfDkN8Ksx1I2DdNxkh4zUENyeU9+m7iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGqLYDy3MiuOtIBtwmb+ecDK+k7/jGDQ9YyYNdm8qaplMk3oLG
	rhllONWI+/wOa++CahE0UA713daNphRutwvIeNx6KznYfqTrEvsqq3xxPtu4H4VuRsmJOrIZ5n5
	2r4QNIL8VZOSY85zwL79oqBrfjPY=
X-Gm-Gg: ASbGnctulIN7ex1l6vVx1X/frTEnB4rTlO1z0vbnCK9em5XNMr9CgO/HusFevOFEHkE
	VAHz1p5OFtaEjui7wwEDLE8PvC0HKo5lgbKm6PLLqGcY9+FFNJqDoXG70+wFSzphj
X-Google-Smtp-Source: AGHT+IG7FEVZFQ+9BES2XdxcY9NaC2NNcIFw/vzBBF8OAWwdpbYD5IxCSVjopbaX2DnG6kaRd+MK7hX8ZZbb4tMkmEE=
X-Received: by 2002:a05:651c:887:b0:302:2598:dec1 with SMTP id
 38308e7fff4ca-3022598e321mr2554141fa.19.1733695095722; Sun, 08 Dec 2024
 13:58:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z1X7ZO0wd5XEFFvC@tardis.local> <20241208205018.52930-1-dev.json2@gmail.com>
In-Reply-To: <20241208205018.52930-1-dev.json2@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 8 Dec 2024 16:57:39 -0500
Message-ID: <CAJ-ks9k-b01ohLZDARpxx+s+cOFYqpfojOgU_0Pdp_0-MO_QiA@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 3:50=E2=80=AFPM Jason Devers <dev.json2@gmail.com> w=
rote:
>
> The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> currently does not issue a warning if the return value is unused.
> To avoid potential bugs, the `#[must_use]` annotation is added to ensure =
proper usage.

It'd be great to mention in this message (and perhaps in the code)
that the reason this annotation is necessary is that `Option<T>` is
not `#[must_use]` regardless of `T` being `#[must_use]`. It might also
be handy to leave a breadcrumb pointing to
https://github.com/rust-lang/rust/issues/71368.
