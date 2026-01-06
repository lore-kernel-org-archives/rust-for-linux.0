Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E3430ACE6
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 07:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767685321; cv=none; b=Nod/zHNB3yICZYCCSWY3hf/QgKguGo3VlS52MR0Xg1aOnU/b6QWDSQmRb6b67/XLAqHRG4ilchVA++lcpLYzf9BGLU3T1bVsjjEuSYNwwfvyuUfXhAS6jntGp2p0Am/YMaV2fkTnAwWC5vV/dgTafH6NKRy+nug0FRHf6SokMjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767685321; c=relaxed/simple;
	bh=Hphfbtc2MHIAmRuXaqvQIxip8ijKFhRE+MI9ASMBHDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJlzNrWoIWmrCFFhTFOI1W0bgHOLdSTMiaUTrB5/Vaps9yYOUQba4TAHadbvPj5R2HlBWGUChlcVG4ge8DnPwGD3aZSUrN5ki3Zj3jQ8BPD/7IT/G2qvm4X/0LVefsPAFKhhg8wGEdi4XRReApzqx8lbE8OAgJ154v3W6fBi804=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6J6gd3I; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6J6gd3I"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c7aee74dceso327828a34.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 23:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767685314; x=1768290114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pwfwDhqpeGk19TmwTm6HhHDgzhA/lFQ/uiV0WkdPuR4=;
        b=f6J6gd3IVMLuNtEfvZgLfWpBXoxJM8pqE+JzfER1kur9P7Pqnn2/DHjwsH+zWpNvcQ
         jU44scW1jiL68nCmUj9ffDZ6J6umlWnys6OUtgRmpBLyTSCHoYEirsHKB4fsR4FgBJmF
         i9BKYaXIF5o5ubZeVqitrYcGYpUWTGQL9mD/9itJ9N7pC368tQv2SPBN42ixM/dPoYaj
         oaxxqjU7yhjOo2K49oRG4aVCW5SAtK1OpEl+qFHKh3oO4rx1nqEKlIXz4eNMOIWfIa8z
         eWac/hiY5vGIiBWGFnV1lfii1TWRpy+Jk0x2f50mqYs3sm4NcVz9P5m5JoiOUKfqirn1
         QwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767685314; x=1768290114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwfwDhqpeGk19TmwTm6HhHDgzhA/lFQ/uiV0WkdPuR4=;
        b=RsiwdAGY194BF9Ul+jsxFwLX5kkTB/yf7YoJWrMXjBQjV2nFdKAUdJevPPELAhXBKp
         LWv6VeUTTpxL+R4ron004FCijjcTCm6awd6uEz4T9BhWTvzIJw/okRvH8OTnATxBjEDt
         F95VxcULIgIL11WLfj1MyTl3deZ3/6pTZYSTDaRhtGHo7zzkofd0ccf6UBkAXIYkx8R2
         EDupNnWQgGtAeFKl6w+GWkLXpo3ELOU5AUVrr1bpc7N3tI5MP4JNwJRd9iL6GLQh5vWM
         wky87o4Db0CMdnbqj756I6oAFgIIowhoruV5Nh2A2VjLyRpCG4OE7+h9C3nXVbh2faSI
         gnDw==
X-Forwarded-Encrypted: i=1; AJvYcCXl1yKb12ofwnbqPlDilykulLDU6GMY3KnY9ZrT3v8BpBepaCb+jbM573Rk+dyuJ5MQWGVWcfJd/EoZKpoG0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxedFp2eRqHqeTXXY/PQCiaOFVQh6vLgewcKtbHWOrkX4ZHJcCd
	Uobxfefa99/2y6SuOIrmFn44riE1FrN17SjeW1S+dd7UeGyS2SBYum4SfIZksHTe
X-Gm-Gg: AY/fxX5e+StwQqVU0AXRIu/XNdEvkDXfS2Y2ROHUxar01IkkIIBAO2aYXGw8yyRtPFc
	ESUR4cNR1BxlGryOVfrJ2wrElaNsQcS0dzBczN97Iz2M8Sm1It8EBQkvNZjp80M1odQFRUhKAZs
	4p0dpyIWxEDfpJ6Kv9Xp3+KpNO0dALZYO+6pYtQyNqG+aYVlDIaODFpaeRthFJOzjJNhpBKhF8D
	joustkuiahfFRkrBSFe3S9kX/SYIAuskD83lsVZk+OMzmcTgB+Swlljjw3llGBBe8SnzSru8Z89
	1wB2XMW+b/5S6Nmd8j+VvcKP8261SNpH38TnLKW3W0oABARknihTRydFgudxbESoaxIc0cUx9p0
	+eI7oCvVz4dr8LbFuLPjjuB8TsC5qQiN8cf7b2K0nm0MZzrKKcuATdPw+sazMxlk5Izs6qtN9bJ
	/i1Yhv4IMNc3kQ1TyBy65uBnqk267e2auzwV1O4NjcZkbrNAopZp7dcXDK
X-Google-Smtp-Source: AGHT+IGf9X4pR6oyuy0u03RRMpC6H16q2I3einUJMh5KqMpOwoa7jq135LkN8n+YtJkha1wFxLDmSg==
X-Received: by 2002:a05:6830:4522:b0:7cb:1309:5b64 with SMTP id 46e09a7af769-7ce4674865emr950662a34.36.1767685314406;
        Mon, 05 Jan 2026 23:41:54 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478ee668sm999150a34.29.2026.01.05.23.41.52
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:41:53 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c75fc222c3so417559a34.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 23:41:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHLX7dEEXe+KCnHLHdX2BitOm6Hoiuj9Kn9U/PwfE5cxQJIospqrrTF9F+KMv90a7jiYaXdITmzhGWeKb07g==@vger.kernel.org
X-Received: by 2002:a05:6820:518c:b0:659:9a49:8e58 with SMTP id
 006d021491bc7-65f47a16bdcmr911392eaf.40.1767685312559; Mon, 05 Jan 2026
 23:41:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104060621.3757812-1-sunke@kylinos.cn>
In-Reply-To: <20260104060621.3757812-1-sunke@kylinos.cn>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 6 Jan 2026 09:41:41 +0200
X-Gmail-Original-Message-ID: <CAKBF=puv6tXX-CfsM68Q8C1oU4WkcGZvaFCW21rNn-yGSt=1Jg@mail.gmail.com>
X-Gm-Features: AQt7F2o7oyWmJKdfg4043_cIdEZu2Obid0oDdM3mINzPMEpcdBXgB3IFLJ3SZIU
Message-ID: <CAKBF=puv6tXX-CfsM68Q8C1oU4WkcGZvaFCW21rNn-yGSt=1Jg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] rust: Add RTC driver support
To: Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alvin Sun <sk.alvin.x@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Jan 2026 at 08:06, Ke Sun <sunke@kylinos.cn> wrote:
>
> This patch series adds RTC (Real-Time Clock) driver support for the Rust
> kernel, including the necessary infrastructure and a complete driver implementation
> for the ARM AMBA PrimeCell 031 RTC.
>
> The implementation provides a generic RTC framework supporting multiple bus types
> (Platform, AMBA, I2C) and demonstrates its usage with a complete PL031 RTC driver.
>
> ---
> v1:
> - Add AMBA bus abstractions
> - Add device wakeup support
> - Add RTC core framework with multi-bus support
> - Add PL031 RTC driver
> ---
>
> Ke Sun (4):
>   rust: add AMBA bus abstractions
>   rust: add device wakeup support
>   rust: add RTC core abstractions and data structures
>   rust: add PL031 RTC driver
>
>  drivers/rtc/Kconfig             |   11 +
>  drivers/rtc/Makefile            |    1 +
>  drivers/rtc/rtc_pl031_rust.rs   |  529 ++++++++++
>  rust/bindings/bindings_helper.h |    3 +
>  rust/helpers/device.c           |    7 +
>  rust/helpers/helpers.c          |    1 +
>  rust/helpers/rtc.c              |    9 +
>  rust/kernel/amba.rs             |  234 +++++
>  rust/kernel/device.rs           |   35 +
>  rust/kernel/lib.rs              |    4 +
>  rust/kernel/rtc.rs              | 1710 +++++++++++++++++++++++++++++++
>  11 files changed, 2544 insertions(+)
>  create mode 100644 drivers/rtc/rtc_pl031_rust.rs
>  create mode 100644 rust/helpers/rtc.c
>  create mode 100644 rust/kernel/amba.rs
>  create mode 100644 rust/kernel/rtc.rs

These files needs `MAINTAINERS` entry. It depends on maintainers do they prefer
that these are added current ones, made sub-entries or make new [RUST] one.

Probably easiest is just add to current ones and then it easier to discuss about
this in PR reviews. Then at least `MAINTAINERS` entry is not forgotten.

> base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
> --
> 2.43.0
>
>
