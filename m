Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741A383C96
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654218; cv=pass; b=WkiLXrp6t/zJmc6mjpVyRXLdZbtTsW0pDPsoX/Jb1qIOuEpwTFoK9VwAS0RppzB+2YXNgS7BT2JI8Nt0GCmK73Psini1FcelL3B/P4wo/XYcVrdLx3ZloUbua2iWJeP9L6xtVGPZR7LOgqOXUrt9vO3vCkn8LCQsA1leN+Tgeo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654218; c=relaxed/simple;
	bh=wxGGV3yt2Q6EmyQ26c5uVU9tDd8DZtE2r5+ZtTHtmQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2rh0khi4tUh3Q+KjcNYeA+XqYr2+0DPLxY3mYhEiAGVRXBSX2lIiRKr4pEgnAOgBZPnnTD9Fm4ca8Jce44Bh2SD1j1UbxZYIXglZMHZUljMTDuckxBKQ6mPli+AksSdukl4K50R8NgINFHZJxDJ9QFB0f2na4IjuskIq6TI3FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piSDbHEi; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piSDbHEi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ccdce28edeso524145ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786654216; cv=none;
        d=google.com; s=arc-20260327;
        b=YS5gg9b1hanlwFntGY/HtI7r09FkHE9X0d2UAFMaqDPNbC07sUnGn8HFZHVExtfzO3
         wvTvsqTa5XhBaN8X1w+GG5YEhtAKWXjabHVcWVjALSjGuO082GToJa64fY8R8ImOIQqY
         a13kMQ250mtaexUc9OYvACF3NFEPw83UiV5pm3Z75/6OArpE4r/+0bWK83zry3wj8RzU
         HzHnqfjpb0ntWR2PdjxmKDSZH7Sp40FFh55eALoFRRaMlN4PaICQxAMQP37D9JUL6Rxz
         SeVBF670YzgG+ZOIOWARDffHODmIt1BaIYZ+91yljMP+AQDEC1W61dZ9GRWkgHI6WbI0
         26oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dip5u0UdscDRK9p0ZUYp/tR+Nn8PiAsp9ZVSGJsvsb8=;
        fh=Nv4BCUBVvUsZ9tWqiqf0Db3TrKZ66IXP2YNZ5IpKG4k=;
        b=RdD9BGxiNPcX0yZfm+fceyniorn8NoLuJZQ87yazeHjUdrrEEnatMgUzba7IfOhZVn
         jO8IXQD5Cm4E4/oAY/p6FwW7C7BNUHw6ZLTX+5G8xWDD57GSR1pD87a7S1h+eSVlo8Dt
         xv5Giu8CQ1FFZ6N0euMeYNp8jMbtRP82R8vEXVgEOilX1tRVROpykXhFVYSAUPHqkVmg
         i+bsmIbYOjF25BgdDXkx06yPmSYM/IyR5wQjw/dXlkR1a6KyHepQ2fjMt6mVD+Gl4N6L
         D6uwJ65OHLFhcLtp72M7AE1FAJvaXPKLaC1hE6I5x/XRUJRAGLUbhm2Ze16zUEKkR41U
         kFHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786654216; x=1787259016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dip5u0UdscDRK9p0ZUYp/tR+Nn8PiAsp9ZVSGJsvsb8=;
        b=piSDbHEibwycbQ1b4LWhuYTNM40e+UBWUJUR4GPxBRyY1vPuc0myz9JJmN9fHw9TGt
         zf2LkZ2QAM2Ggakhce6Gk9beGo5DH7ng3x8j7u2Tn/M/Utoi3ZQEcnFcxlCZhPqQLP+e
         fgNGZayp7FzSEIXlQoO1fxY5an5HeIF+6AYVC2ZzBbxVxUH85lXFyWOk4tfJmcgUKNQd
         mB5MzR/lBrq44DIqLyw4xTqmG2RQEVy8nPGDf6A+zsA2xKP5Ln4qZ7pR29ey0i0Xaqrl
         r/V9yEOXOA6Rw7mQlcaoi28dFoXGZLo8eZ9oDDtwvr9bMp9HolJvAaLFvlDJjeNIc0G1
         7pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786654216; x=1787259016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dip5u0UdscDRK9p0ZUYp/tR+Nn8PiAsp9ZVSGJsvsb8=;
        b=LynDqPK0JJIKMKfzI+WtjNLkBm0BtKicD8gAU8iK+0a3mbFvkZtLP+2f999dxiyMQ3
         ab6zAxVkLMifwWSKdvtU9ivz5tb19LxsC8y791rJUIGDwBAAVlTDX6Fnvc8YoKtHBCfL
         /aiusd4mBvtZg1xNlYUpbBGXLETDErNdZSxTZwj4ndZxNo8rdqMsLzr3P77KvUyBUenp
         ANnuVIBpvHKPC9qgrnPqK+gk+bsmdGGMzRrw89XiF3IxuZk2fybh/6wP3bV7qzWJZirh
         fPTxHFI0vX8sfaqCrAIGiA9E1tq/yKFLWHAC+M7iKQlwgHauZtkkbiCBPoXJWmX4dJDF
         aw2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqEHDygduuKdDoTonnhwgIQiMy3etf7/4PYnPIcgrV8WaHHujBEfi8htQDRYxPFAoNqxzteX+13NKpnlVMfqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiFne4d49TAOXcS/MpjosHaebIig0ZJAUIuj0O1Ksif5BIScI
	fZIEZF5YYXoJYxp3F59CbFZ8MZ9ArC6VJWwB5qwcVUn4X2sUFXJ+W9DqclDUg0fECQWDwi3xkqW
	Mx6QGbZ74SA+ffpYsnZvCoKf6VGcDXWY=
X-Gm-Gg: AR+sD11XpRJjShH4YdbNjxafyhPcrRN6jnZ90zLvwFifeoRgQcINIQRMUh0lpw+3xzs
	7FSPOZo4SEunECy/er5xtK2bw8CWb6OqaxcMW0SnVwGXYn/bgTvP5BDyzYG819ydiq+yLEWvCHi
	4HEdqvlDuwBjY8fE+eU9n4BNbM4jCjlsGz+/JsN/izPlclqq6qD3V6ON13ip7VfHLcR0L8NGCnQ
	74kYaVn5a9wAlCkYo5hdcr1IKnfg187s7+tyEoQ3nKJ4Nf5qvGoy9vJE+Jr+JjRGKhlln3tBc1y
	rwBfZLNd2MSmR6kjlDPzYfDDt81qPSWHWcJM78rHPrG4IA9bV46jiBiw4houSDyGIXz85ICw4qf
	yfPLJqsYRyb4zeKz/MRj9r5e5HxljNngtKN9fQKCrD1IryzLcI5X80ipl+bHL
X-Received: by 2002:a17:902:f651:b0:2d0:2741:f31b with SMTP id
 d9443c01a7336-2d3b0edea85mr5707295ad.4.1786654216106; Thu, 13 Aug 2026
 13:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <gaVV23pVoQuUbm5qsnhQShsVZfOivBkIjMB8yfwrQCi7DeMizBafFVFI0bol4_aolii89peid2LdkWIBA9nMig==@protonmail.internalid>
 <20260807233039.1091842-1-tomo@flapping.org> <87h5l22ptn.fsf@kernel.org> <20260812.225915.1358235872335365762.tomo@flapping.org>
In-Reply-To: <20260812.225915.1358235872335365762.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 22:50:03 +0200
X-Gm-Features: AUfX_mzwjkbZ_U8tELUzD_KS06s5jfJVyaGmG1cL3TRD01RyTCve0MkXCunuBoQ
Message-ID: <CANiq72=-UwRzsa7xTTrKN90nyjoz_TTtHS9b7pZizcRwT+ByUQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: hrtimer: Restrict expires() to safe contexts
To: FUJITA Tomonori <tomo@flapping.org>, a.hindborg@kernel.org
Cc: ojeda@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com, 
	sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 4:00=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> Miguel, on the missing bullet Andreas mentioned: we agreed to leave it
> as is.
>
> Is this still fine to pick up for this cycle?

For context for others, I pinged Tomonori, Andreas, Boqun and Gary to
discuss whether this still had a race or not.

Andreas decided to delay the patch for now, and Tomonori sent this so
the discussion continues there:

  https://lore.kernel.org/rust-for-linux/20260813134834.1562995-1-tomo@flap=
ping.org/

Thanks!

Cheers,
Miguel
