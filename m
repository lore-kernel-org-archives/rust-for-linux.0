Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464735B65B
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524075; cv=pass; b=Qe2cgCmzZ0mO1AHFI8nUso8LLXTYz32Jj3bvTOgN/A7PAnV+B4Gp9pKqPQJ2qO9cW87MdhVbvyOC9MEd+DkQvJvuPfUNs1mT4UbdjTAxA1+AA9Ve03UjthxXX6ZUcm+ELwTuwKJ2Jld181z/Snriv962Zu+Q/qXuVgjl3jJxfKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524075; c=relaxed/simple;
	bh=7jXWc5Y1W0r5wnDCFnW+ABKB1zQfFFLJhRvMaBRGPng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyLpTIodFiHYUhnTSMNBKdXwc9Rrg/QH1QCpNVAAiSBy6zCXij4QjB3anHWocRoT3CJXXh9FOHs9w+1umdS8HHP60Ubsjk23tkY0z5V4yKIyUEGTmbmExXZVlepmR/eZgSmmR04LfcdZQpC66k2K4Ejv2zYVdrIF4VlTZofMDv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5lL26S1; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5lL26S1"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1233608c7e9so648849c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 06:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524073; cv=none;
        d=google.com; s=arc-20240605;
        b=GIQSM4mIKq0UEmMxfUXgqPwNuX8oNU06HCAsodKf1Yhklnf1RrgXUauxnG0K3K8SHx
         Bw7L0wYJNw4X9Dv6ef9bIzQz4U8GvBDxm2/JAalCGlkeVfBXfq1fRYJAu/F3Lg8bdS/l
         29j5MHH1CLPsKwj40pfnVdy5KDi2IYSqy60bxFhSBdUI14cm8BtapuyGl/nKtglXG4P8
         +NUAlwXZ13FJ8ZYRb+TXatCEA1AvgMD8N616woBt9npj/p82hXTIMpgfrCOagwVfW8gY
         2aWfTxU2jY5hgmk1RoA2yNGJqPmSvrnyf4LaO7rLkvq4HIAkJhQpM8XFk0kvWRgm6DQp
         ZFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jXWc5Y1W0r5wnDCFnW+ABKB1zQfFFLJhRvMaBRGPng=;
        fh=yPMXOOKfj5MzMSs7kEg3CmpQx2f8Oq4bcaCMY6bYdHc=;
        b=fTcg/Fr55sHB0CfscTE5SvUVxnuF+xo/MVnnM9A7h69tKmyEGptTRtGaXe6jVo++DE
         3nQLlZNwZMccrQ6bU1Tuos1SeTPrlddC8fyP1jOofqdDs5LgclvgJUBLSRhyQl3UD1Rf
         5qUTotqlnmHLQrYZwn0GC1m2ujtfhgnuKM71kZmEyzpEMSRklST3qPsDtCNRyEYxzsKQ
         1JRfIP1G0r461Cvb9xgT09s18GToBbCLi6ZmCD4bry1RQrtxjjLeDW7+KUjSTd4eHr/U
         mFiDG+4d8Zjvud4NY/xczNW4v/Zycq6i0N/KTgJATqXz4pwEq8fxQNYL2E2u1DyqiQS3
         4T1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769524073; x=1770128873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jXWc5Y1W0r5wnDCFnW+ABKB1zQfFFLJhRvMaBRGPng=;
        b=W5lL26S1PQvsxl1axYxVbQq9Puo85xOommOTVgHHwA5gME0kzmxBL23mXpQXFbPZPF
         Yc3mAg7enjm/ozzqqAVT23ox8tTY06yJG5oPKxTGNRibTQaynOZM6RkNNB/pQb/Qfd28
         q7n5KBmEXiRVjDTB1cER+Ql9deKCZYc1gopAPBbHyTS7YPwOFMD19uDy+bH6oo4EgOwk
         Go0hXlNDfIqNsXT4Fn5InRtxN9/IFRN9rfxyxlKjW0/lvCrfh8tKEq5uc0QT84S3QJLc
         50ehJjzgsTe/vQY7oUSG8b26iwCpb7Ws+owIsKoeq6NGelQxibm//Z2CXyk5uN60dO9w
         Ddzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524073; x=1770128873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jXWc5Y1W0r5wnDCFnW+ABKB1zQfFFLJhRvMaBRGPng=;
        b=DwqD0sZbYdaxiOlPzJ0iqVOdQMJoXtfqMz73JeutROrQPkY5ll5JapLwuY+DCTifN/
         aeiXUcuyvP1CDdySBGY57wMGIV0/UqklXJ+M6vbG84Z5w9oXBIbIgKefrIKZEYPEwR9m
         jykQgYjnRkAQGDvNqt031ut0IVZTf2pAm7ie1RPQQFKlPXaWKQ+d7zoqiygoN5bkR2z1
         xk6Y/wnNBqBv8SZPfXgu6R9/6OAIPuGnsK/iMoI754ycVCgBPjCqhAA5XZqmVOrlBBUU
         1Mwc5aZTzTqYirKEZmkDi4l66CbAhDhVPyaG1wU53EIk5k2Jke2xpBxMHS5ZB5jT7rCO
         cpEw==
X-Forwarded-Encrypted: i=1; AJvYcCXio1Cx1fVNRhRe8Jj0TrHc0QwoaA1DgxV0pnLkWPkCtusnG7SmGNHla5HliEn3K4vkD3Yf5XeKrynYgM+22g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNUbUIWR/vkMhAFyzjov8GbbuoFzw3TffhjR2O7GVVcMUWjqn
	wB2vlk4bKV/vMEvZlVQ+AkVWEv/WMvsU0iyXHVKWOHnHEop35LwPTo+Xnd3ihP10kFY9UZupAKd
	j/mfoJXG7cCELxO1TbanTV8KMjtl6gV4=
X-Gm-Gg: AZuq6aJ9YMPXGEnIG+Q3oWNDtQbTuxUXByrTrlEYH7kigQ2XenPLhDgZHwR09NMePGx
	XmoWwrZ/AG2ifLCAoyc/5FZHpUARjrGM9tl2UXr7IT2t1nZDLojTAek5aoH0qocQ3sYsJvuWDYh
	AfXr79P3WGlcYJqgtS2fX8f1rOhmK8lK3Fje8b5s2XkY26+6HEEJijeEV8q6SMHVyTCBlvgwj4J
	2NZyW+v9/SPNg6NvpeyAW+cvRA68tCT6fmIPQ0cNVZu275e5gLzVLCMAWFMv5/8O6Qi6zitbmB+
	WSrnIzLe2YGCTa8ZtMRsDySOMuHmGGnnItKSYXbS+pYIZ5U1JWys21wPS6sXz4D3In/YgAl2t03
	DBEtXk6GFB9qd
X-Received: by 2002:a05:7300:220d:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b78d9bd5e9mr651106eec.4.1769524073350; Tue, 27 Jan 2026
 06:27:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
 <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
 <CAJ-ks9kn=0Sm2_1WV4xyzunzcGG1VZDKy8L=_SCCWyV2OkJTDA@mail.gmail.com>
 <CANiq72krt9De1+WgMh0y8XX5K9RrU-_1FuSp+sKO1Ya8EaVoUg@mail.gmail.com> <CAJ-ks9m-0C=hOdYC_z9mNH54fXjnaWpYgZSPaWoJC8rnQ4Kgkw@mail.gmail.com>
In-Reply-To: <CAJ-ks9m-0C=hOdYC_z9mNH54fXjnaWpYgZSPaWoJC8rnQ4Kgkw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Jan 2026 15:27:41 +0100
X-Gm-Features: AZwV_QimCOYUz3SKZDNlKheXS8HWk9yG3Ey67VA1qou3jr15MiIGw-t2u0Nt8dc
Message-ID: <CANiq72m0TCPTEn=HkMg19Et7JFeRc-fqP+MxP1gaDosSF42iww@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 3:14=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Another ping here, folks! Miguel, what can we do if we do not hear
> from the clk maintainers?

Stephen already Acked-by this one, right?

So I assume they were OK with me taking it -- I will do that unless
someone shouts.

Thanks!

Cheers,
Miguel
