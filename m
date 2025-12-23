Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A531B11D
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481171; cv=none; b=VIjYBI0Ys48CcQ4FlzSCRJUxwrbX8RrsWAV26oBAyBN1jg5m42DsOWl3eVfS6FwR6gXyCG+R6B0u5gEfC4nzB6vTNYoT3ZcvtRGittYct5HMBNeB9FHnbzeoDlClX06+rUON7o+1DG6sTzAgqHcV3HBwUVaIBDdbJHzCeJ4MSOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481171; c=relaxed/simple;
	bh=4FkWXhtu13kD4OyN2bZgoN0a465kXRfMbPSW5tH55cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDd9MVDWd1iCpVTL8lhCulwFr/xd6jpKAoN87hvrLEKlE3GyoM1O51NSJtQh3+nw9fB65MjEA9pH28yLKGB4NxcpaVVoyClm6dqOELuOR5aWCCP7zVIzoxUOBqkEEBsCE6IMSyq4wCCGX9KO9MVyZemb4yoPK0LGaKmHKl1o5mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMCl+itL; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMCl+itL"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso3696813b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 01:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766481169; x=1767085969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0t+U/2h1qjeax+EbR3c7S7/3a3hJALPrbwZw/eEGcbU=;
        b=VMCl+itLhD5vmv4cSD0KXMgALdIoCNkPYLF1X3DpYPU5ws7tOHtjJp96PxZnBWvhSZ
         84YQRJ3whS1GbTJvBwBNBDoVffXn+an5cdZRiTq7nuMIdgtjz9gECpbTL/+k+fg3G4Ak
         Faq1ae45Bn8+9LN0G2F0h1OgXf0m/A6oa9MnNsETBUTgOoHFX3nqS5lw98QyiLmpj42X
         PHd6VFxbHcMPo1Bh/Ry8dan6d1ICftehgUXNrYwdzgVlXFdGC1LiTM+bdIV221AXosNI
         rtEWMu8KuRKdhWYW+Zc6uSrns5wKIGMpgxhNSIwqtfR00JHNB1a7OS+xR52DmLvHf9Mt
         I8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481169; x=1767085969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0t+U/2h1qjeax+EbR3c7S7/3a3hJALPrbwZw/eEGcbU=;
        b=T4XJbRWi7eDOE/LqdbTGjNaaUzFdV8/dG3bnkzRISRBm6EbMOZe74Wd8qcWExJyYFm
         QFTLu0QMzvowq/hQctOEsxy+hQifGEocnDYxNtfW7DtZu6P1nANWaOHuKrzbcAjWLamn
         Txhq37+GU/mTTVJ9DwNl20K9o7LTJlIW/9b3Y1QUwY0lGe8MwfPNvAVkMvKnfbLRgUrP
         2J1oJhgBXmW6Vd/KOTn9YXnx2OCpheR6Hjb7hMXFIczSqEIc1GPh4Vzj7p+UrNi5JjIN
         8uE4PDaa2SkI3uFLpfMAvCyX6z4fKzu6amaOLu8TIql5TCYiLv9R68AlQ3g/t9JhMSnM
         1UPw==
X-Forwarded-Encrypted: i=1; AJvYcCXZYwIaIZ2P736ajZUi5G8BAL5VgWUu1g/uFfzEh+YmVviRYV+Cqm3cjp09VewPqerny3/XFBPmoOchGYvxFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy26xExsmnUQyE7D/YLA265J+3On9rJuGUBKOTQg9wjP7OgoKYu
	uGLkxyWVvtrNUjGWn9vI5lZaKoz0bXh4M1hNIvFQi6HCtcgbCy1i8gi2
X-Gm-Gg: AY/fxX5Z0SSsQXsHe06sofXVgNS7ifz7IUsV9FucmX8GlljmJ2wfSEMX3xQnFHS4v+d
	zcrRwk0gYRipK2MZPvULK3vP/ALqqfSbLa6u8BdUulA6ntH/rBd0T2wg17bMf8YVU4p3NYFU7f4
	q7O1FAEQSxZ1eAe0LGrHEFfC1rtGwLEzKksyjBodX88QyAzqQ8GX4GSDSo1j7YOD0+n2oLwfweZ
	HJvA0KemrFllJjmL6+rWU2ISPbCTNELDYzDo8kkc2kYfnIjgLmiiT8jSQJxx5IyUUgtr0pq+1xB
	LhUO/Fkts32rpVUKcRgVhYywRgROa5TE0RsNh1CECWcqc7lg4UBpIoreXoyFxhseB3qCEe5M/kp
	KaT9grLc2YAQiRZYqkytiFTdW5qKWfejoGmNAguxGYHnqa6R53QGfiEkQYNRG56Ai3UIIC/SuLz
	Q+mPmcswGZap8N
X-Google-Smtp-Source: AGHT+IHih9fiMPujtNcpQFt4xklE4OfZc65ZP5sotp3curLMywWAonhLCK+6CW7QJvWjdlYn/Flgaw==
X-Received: by 2002:a05:6a00:600e:b0:7e8:43f5:bd39 with SMTP id d2e1a72fcca58-7ff66d5fca3mr12418214b3a.37.1766481169024;
        Tue, 23 Dec 2025 01:12:49 -0800 (PST)
Received: from [10.0.10.3] ([195.245.219.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm13017682b3a.39.2025.12.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:12:48 -0800 (PST)
Message-ID: <dd797bde-419b-4c1f-b93c-b0c62a7f340e@gmail.com>
Date: Tue, 23 Dec 2025 17:12:42 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: fmt: reject {:p} format specifier for raw pointers
To: Benno Lossin <lossin@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Ke Sun <sunke@kylinos.cn>,
 Gary Guo <gary@garyguo.net>, Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org
References: <20251223033018.2814732-1-sunke@kylinos.cn>
 <CANiq72nZp-ULXMV9yG_PP=gkr0HUPTcE6ZRQhtgRp5Zk5SR6sA@mail.gmail.com>
 <DF5FTUW7WN59.1YJXZUL5F5LD5@kernel.org>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <DF5FTUW7WN59.1YJXZUL5F5LD5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/23/25 16:03, Benno Lossin wrote:
> On Tue Dec 23, 2025 at 7:41 AM CET, Miguel Ojeda wrote:
>> Regarding the patch itself, ideally what we probably want is to do
>> something similar to the C side, i.e. by default hash the pointers
>> like C does, and then have an explicit way to request the real address
>> when really needed.
> Could that just be some kconfig option or do people want to do that
> without recompiling? But yeah, as always with these things, we should
> use the principle of "add those capabilities, which already are
> available on the C side to Rust".
>
>> For the real address case, we could require wrapping the pointer-like
>> argument into another type, so that it is very explicit and opt-in
>> (since having our own custom formatting is harder, though perhaps we
>> should finally look into that -- Cc'ing Gary/Benno may have some ideas
>> in this domain).
> Well, we could have something like `PrintRealPointerAddress`. But if
> someone would really want to print the address of a pointer without
> using it, they could just do:
>
>      let ptr: *mut T = ...;
>      pr_info!("pointer value: {:x}", ptr.addr());
>
> So unless we also have a lint on printing `<*mut T>::addr`, then I'd say
> it's only useful for people that know of it and reviewers still need to
> be on the lookout for people trying to print pointers. (but I guess this
> is similar to the C side, where you can just cast to an size_t or
> whatever is the correct thing, right? (or are there lints for that?))

Add wrapper types matching C printk's pointer format specifiers:
HashedPtr → %p (hashed, default)
RestrictedPtr → %pK (restricted, respects kptr_restrict)
RawPtr → %px (raw address, debug only)

Require using these wrapper types when formatting pointers？

>
>> Otherwise, if we land something like this, how does one print a
>> pointer when needed without having to manually replicate the
>> formatting? `:?` perhaps? But that is almost as easy to make a mistake
>> with as `:p`, so that should probably be included. It is actually what
>> was done in https://github.com/rust-lang/rust-clippy/pull/14792, i.e.
>> both are caught by the lint. Cc'ing Trevor who was involved in
>> reviewing that one.
>>
>> Speaking about the lint: since it got implemented, assuming it works
>> well, then we could just use the lint, which allows developers to at
>> least opt-out when needed, e.g. debugging, until we get the hashing
>> etc.
> We'd still need something for the older compiler versions, or is it
> enough to have the lint in the latest/only in some stable releases?
>
>> Finally, when the macro shouldn't work, normally we just panic the
>> macro, is the `compiler_error` meant for diagnostics?
> Emitting a `compiler_error` normally is more ergonomic wrt. diagnostics,
> since the erroneous code still gets emitted, which prevents other errors
> from occurring. Here it probably isn't necessary, but an example where
> it is important is `#[pin_data]`, if it panics, it also doesn't emit the
> struct definitions, leading to undefined type errors everywhere the type
> is used.
>
> Cheers,
> Benno
>
