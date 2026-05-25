Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48CD30E0F1
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 04:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779682277; cv=none; b=Q9TjnrcK9bpWtNFznIBDuaDSKCqn8wtbIP3ZpT7EIuphYqMybpoVeMWDPVijH3zHP9LvzIrp9GV9npVbYlWx1ZeN3Xr/r8CYfyeaZciwsXW/Xeni46lGwfBxG6aKbGyFOoGqXfNg3E17OXIWCYaoWWo9cY9/GQ5q5NOQiFKqAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779682277; c=relaxed/simple;
	bh=90KiPH5wu+OB60NJOaE/lO7jw2+Vkhq26oSz5fKdhcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyDDCjNCt2mKZAKTFUN6oP+EH7VnPXRID6KR1LSrYQXLp5yXCpfp5w3t60PaQXFFUiV6jfQHBJ/d5ISq8tBUKDppAemDltF+KM9UnaLKlhzgUZvotaSI8kD8ONLNpHEnpSadUJHFusvD+pK4nGmSK/u6PoOR7m831v8CxDwItJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eoHJqWRX; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eoHJqWRX"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-83d31ac4017so4499737b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 24 May 2026 21:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779682274; x=1780287074; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ScHNbeCee/w7umvaJ+NRNHLFZVnAolMY+JanvXrnXj8=;
        b=eoHJqWRX9j54g4m3T8gBQogwRChKkOBmmerjPTVvxeedDivDPmUev1Ui6vOnQxbdu4
         8OIM3wV6RzI8k/m3Mg6vdpFGyDULTBUKutJbCYSYi5Z8u2LZk/Oawuoj5eSz5cm+gyR+
         2cOk0brDp7b3D7Ehn35Zc1krGfHznrqEcrOn0P70oycqnkSj3urx1zgtm6cI5IZC5tcf
         tpjSwHSkgfRijngxp79fO5I2Xv8zRuYfhPC0jsHAYMnHonu0upg+FJFSy/lsZnPLpnFG
         +kfzgkQZ4gWKaz1RZl8OIGZaSBvF78xiUXrPct0pqMtUlMwFuQK2GbeLIeWM2VM9eFcu
         t8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779682274; x=1780287074;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ScHNbeCee/w7umvaJ+NRNHLFZVnAolMY+JanvXrnXj8=;
        b=AXyfBQCpZWTFXh7Ffs7jOhShPxGrtGKb+MIxuauvoYk+NEXxQeszB+F/78WJo7d6D3
         uxDLod32w/1ndNv+ty+BVlHoal+qLS2Km8Skza+COjX4p9ILjBzbZdViBNxY76oMkJ03
         L8mBeFos/tamKiy4nsMpXhyh21hJSFwPM0y8Ia4GryqAO2M8A4g6lYBKpnwK+nZoynRT
         sD914skgqGVx0Sq43lNaTO91ILSU1WKHpKHup6Qk9kwV7/DmZENmdMSHUNNBCI5vPSOW
         qKEVFUHBGj5XQ+ZtREos9kZiKJrIliWSNpv8oCOTUnORA5xyfmLXm24hDjrDfAyheqt1
         cjOw==
X-Forwarded-Encrypted: i=1; AFNElJ+uzNzeBBtZMtl2CObkLz0jYhBbfwtymPEpWlqhZCn6blfOP6n4ECP1TfwQXE1aWDX/YKmPb2ny+z461yZX/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxULAx8BvtQqbldJhW845MSFafM61tlpXDJyVcBBNl5+yJ5GUUL
	j6O1LomMuIZfR8IWBURdAdunCeS2Ki5N3E0b+Kaxh1nkeDynbK9i2O/0GLiG6hK9ya0=
X-Gm-Gg: Acq92OGtZ7GYsteFjDSEwPCfJ2et0wSRLX5umxOYZKGeKJVQMEo2ooV3h5RBuxyWM+6
	Yka3oEFgeBEmCwBH1+Fukcij35cPU2z7j5cwbbCX7Xqo2VEJCYjCl/Ygb08I7yfLlxob+dY9A2V
	uOvP9Uqd6M28u79WgGZKRsr7QguwrSKxHkcd6PQgAf1HVLaFXjxpfwBTnmSyv/wN7fg5pOyTZll
	qbiunQQYM1j2y2pV5+sbyNdMoup8RgdjJaZQZB7cFudp5nOnoMG26yGdvGK+RBLBf0adpG6Vhk1
	L8WHI2t58H0VeWm8KA6BKHHBXpt6iXsxqKW0vnp1lqYfhHr3qRMsoVcD/EwxWvF51vUUC3XaySw
	UQdX5k/uI+NSCAumDAKihbghRFiLKvDvG4GB+k++0Yp/1H7JOm9TCTfE3Aq2178P/avdRcpyNYg
	n6V3YTehIADyHtDzFHBoFCDoI=
X-Received: by 2002:a05:6a00:240b:b0:835:3f51:72f8 with SMTP id d2e1a72fcca58-8415f5db6c5mr11688239b3a.18.1779682274145;
        Sun, 24 May 2026 21:11:14 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aca86asm7982833b3a.7.2026.05.24.21.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 21:11:13 -0700 (PDT)
Date: Mon, 25 May 2026 09:41:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?Q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] opp: rust: mark OPP methods as inline
Message-ID: <uh2ygvuuzgipledqoooivdfkbxi5i6j4ram764a36xanxfndtt@oqg57uovhkwn>
References: <20260524154021.34096-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524154021.34096-1-nico.antinori.7@gmail.com>

On 24-05-26, 12:40, Nicolás Antinori wrote:
> When building the kernel using llvm-19.1.7-rust-1.85.0-x86_64, the
> following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*OPP | rustfilt
> ffffffff81801560 T <kernel::opp::OPP>::freq
> ffffffff81801540 T <kernel::opp::OPP as kernel::sync::aref::AlwaysRefCounted>::dec_ref
> ffffffff81801520 T <kernel::opp::OPP as kernel::sync::aref::AlwaysRefCounted>::inc_ref
> 
> However, these Rust symbols are trivial wrappers around the
> `dev_pm_opp_get`, `dev_pm_opp_put` and `dev_pm_opp_get_freq_indexed`
> functions. It doesn't make sense to go through a trivial wrapper for
> these functions.
> 
> After applying this patch, the above command will produce no output.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---
>  rust/kernel/opp.rs | 3 +++
>  1 file changed, 3 insertions(+)

Applied. Thanks.

-- 
viresh
