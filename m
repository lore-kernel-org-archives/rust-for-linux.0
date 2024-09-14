Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C5C13A26B
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Sep 2024 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726303958; cv=none; b=h8o1Ns9yDGe9DxnpIpI1efTc+LVEJA50Z4NOVTYowf5nLL38j/HPHU0znfTerA4A6pT3jsYFNjwDA+E3wLXCyhzqfooEDOrvM3pR1/1S82zG7fWqhXb/D4WDxFzh/NpKKwxVwePldSQ77otvMFrF11gqgvQMHrFN5g/ThCJCND8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726303958; c=relaxed/simple;
	bh=ozMO80z+jlaDS6Fvvhq2+MR9Mq6RA690VY/VVdqPgn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnYCWeOxaBXNSVMK8k+OC5xes/TJHDQkXNZIX6iGl7yKR2R5pdmmMiHaVNSzkdnT1bfo3RyA+kBsHSyXdwziY+YOZe/wDeDpFED1/WDnUsy09C5nXInQ0grVHhjYng6uYpHZw8Yrhww2Uo5R7bfVadKF0Bwfd7SPJh09u784tc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=onJiFq0V; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="onJiFq0V"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb806623eso25919045e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Sep 2024 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726303955; x=1726908755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozMO80z+jlaDS6Fvvhq2+MR9Mq6RA690VY/VVdqPgn8=;
        b=onJiFq0VdNHuztxHQhE24AWxKrVl9MuIujfaVDpn76Vl6Rl+AZare+5ooq4GMxv5Pv
         5Uwpwbmp1eui5PIj1IWpnaotXHMOGbevhgTV/acYJT0PsV2kcsHjUiuGIX8P0Ozo20e9
         7xhEAvSJI2TQVl9xYTHQqVniPkTMHt5xaxutPKfRoJCRjyp4BNLcMon8QFSpkJJOSqOn
         ZxmangFyCF9UvHFky5JYV/bRScFC5ur5/m3huGuEKhto/Lo/WxETeXhmcQd/bfc82bmP
         pK+UJ0qyBFwCCi5TSp6tpMRaXQZuxTm8L4fj+BH2hEND5xLIPfcc+nwuLbFDIvgO76QN
         TjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726303955; x=1726908755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozMO80z+jlaDS6Fvvhq2+MR9Mq6RA690VY/VVdqPgn8=;
        b=CVql6FXNXoQlZNKr4Z0jstdozubJ9+3lYl3jOLCFsAX4vrSXs7CnSXQc03qRRi5/Ql
         nWzENtRq1adxg3+3rar7KU5/taLXCYV3FH9cxfjYKQ7MR6JxKHxSQc0xWy2d7OxOvH57
         h5Qi4t/qgdH6OVuOvbUKud5V1o59cRkRpHJvvH2xvb77TBzlLRdlYD8IUQKSSajYzUqm
         3FylteckA5vLuqUU+OUtWpvAEjtyEGfADi479n1jEMNUKm3karhdQTwf/Vq+PpNn8KGg
         KoBAAiY7oikUhcp8sEjvhd+oi91rGJ3Bj1E/kKnJGz3hQiHpafBpGPBYrfqv1nP54iRP
         ZUBA==
X-Forwarded-Encrypted: i=1; AJvYcCUXBc2J2OtgmfMxS7KDDGkcOUUImG9Tjd6HJTkzngoqO7hPCxALBrOXySv1me5lPwUSww2G9tdZF2D1oVND6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsvsk92OGNsgkc2gm/rI0wDxabl3Cxhu9pI4PoZDP3ZntutIm
	4zztGG7qHFZUGmyCUyaWIg2tEQV1ChjxRUhzyx5bZzVyDaA6bhiKK67XeYUnxuy67NGE7XTZHbl
	hmd1rnhuANwynPuZNFiRskPYTbkhHdzHYF7tv
X-Google-Smtp-Source: AGHT+IFUTPfSBDFQnpGz2Br1YanzXRnMioHfouAqA9KRQpEFi41ht5RmajCPi2yYaZYYnmejsMzVF3SlxJdsuf3X3Gw=
X-Received: by 2002:a05:600c:468a:b0:42c:b309:8d18 with SMTP id
 5b1f17b1804b1-42cdb53be54mr62773115e9.19.1726303954696; Sat, 14 Sep 2024
 01:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <14389f99-dfa9-4646-a24e-e5eef1beacf0@proton.me>
 <CAOcBZOS6BAJ1FTFkB3x6jdag_hL7zrLbFy7TxkvZWKxRZ_+ggA@mail.gmail.com> <CAOcBZOTcoPEk2Bo05gj66cHiqKxTR7j1z9U_j+Jeh1oCjtOKXg@mail.gmail.com>
In-Reply-To: <CAOcBZOTcoPEk2Bo05gj66cHiqKxTR7j1z9U_j+Jeh1oCjtOKXg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 14 Sep 2024 10:52:21 +0200
Message-ID: <CAH5fLgj7vcZ3iCyR1ZZCq0JTL1qYiTxn_5fE4anQRhyOHsJd3Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] use custom FFI integer types
To: Ramon de C Valle <rcvalle@google.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 4:51=E2=80=AFAM Ramon de C Valle <rcvalle@google.co=
m> wrote:
>
> Since we're doing this, may I suggest that we use
> https://crates.io/crates/cfi-types by reexporting them as kernel::ffi
> instead? By using those, we would also avoid the granularity loss of
> normalizing integers and using the integer normalization option
> wouldn't be necessary. I could accept any
> contributions/kernel-specific changes that would make it easier for
> the kernel to use them.

I've been wondering about this for some time now. Is there any way we
could improve the language to allow #[cfi_encoding] annotations on
type aliases? It would go a long way to make this kind of thing more
convenient to use.

Alice
