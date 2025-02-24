Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2524A053
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391199; cv=none; b=CFNYUy92WtM3Katvxg7PJrhDDK3R2zIB6SiMXKOUAOy+jtagExQ1Kd8ivvuHbTATQN2tClG1TurVlrEJB9ZYbAt3A1ZBQqtkXSDVPQdvbIUYn57ZU36sdrKxhgHkqDhrh5i2p9NgRFPvq0g7ooSTEp4BQUrZ9KUJry0BnaqaMwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391199; c=relaxed/simple;
	bh=gkcWo6CbuipnuwBWmiERHV9pRVv4+yAvrJkF5cLVnqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GE2KoUTT7R2O4QKG9v1C3Pln9zSU5qSJz0TeqtApM0D96QPx3Kmzp55qjueFwWltKhgevDwv+b8EEu7jzz7c4zvu0k2UsPZ/FxRB+31S7AHQjXEBdMRKOMvJ9xOo6yvwH81HZ1STHGky5P0x+GEVDU29JuuHyso3u31YVM3w8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xmfp9WQS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xmfp9WQS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fcce9bb0ecso8222926a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 01:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740391197; x=1740995997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5m/misXjt0Q5BUlaADzuQsIymnQ6d4dUSOqiq4YJRiI=;
        b=xmfp9WQSnKiUHR/OQ9XeMlpxl/W8kLoEFW24Zc1zxPooalMafc5nahHvVIwhB0hpGJ
         klpdF+2aOotaZoA4ycsOTXN7pECOh3qEWvE+usSXy6e9vYUWwyFd+UJz1zy2A+uKXaaa
         jTUJhLp2zh6GjhhtgfLShWG0zrZdNRxncvm9w7tgy7EkojPD0rtpjAvVYMZkLVzN7zWd
         gp0UC4IhgOFz2dBNali8fAUayQMUVRzNYQz9vWrSHQ7LSI3c4C02bFmwXHfXxoH1tiof
         LSOx5eJZodjKuFtVufo0PUKDfet5K18E6dtyJp4rG9WlHvXU3zGnpWh83NaplXszcF/9
         H4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391197; x=1740995997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5m/misXjt0Q5BUlaADzuQsIymnQ6d4dUSOqiq4YJRiI=;
        b=fQmWN1jC/MdHvBwTojBg4iNha1QSbu6nZJvhApH/kNCwn7B9GOXLaM3vnUrgRsaqfM
         YJUkMwqk4wuvr2Nq5dLrgMBKCL2h3WZ0M09bbm7fAP1j4EJGsLUfpi5kCIjxeZPRrM2L
         sbbvsDZWXgEw/dRwZBOvJFaUCymqTJK2qyMhLkXBcHOxV0uDQoWO4i6j2jyNknCHVml3
         ye5DJ7t+HxsogiVCYm6VfxxZpXckx6gxb2a8E1sOY4jOW2PEcxt0NCMmuCiaVt1PJQnb
         5Wb+OFYWDtu+c1Jn7PThKY5CpdOQ3dMbTDtdlxhB5MhQFu8roLuLIDAVcwpB7SXETkJk
         UT9w==
X-Forwarded-Encrypted: i=1; AJvYcCUAIvi+2Ewv7DxHzQhWhPmeJ84c5wQ6V9XOJlD1iCtvpKOZJDKu7MiXSaxiRDbnD3201I2sq5seUNcZlAiFxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Jvf6VJYivFNNkFXYSWK4iSdDnmEq3KF+lXW5u8D2A4QMWJn5
	sikJyYzPKO61Jk+WRwHMLAYuD21nURTh7TO7ajy1rs/cj3A/CYnx5KIKhMGfg9I=
X-Gm-Gg: ASbGncuLkaX4UZYf8l7e+J2rHQzKIc07nDiMdeWVcjhBKbOkZXieMlhtN5R6eGCq0XR
	e8QsWGxgqcutsI3Q4yBEy5bU4PCno8Xsnli4w4yHgKo2cs6zGRlBhr0e4qyE1hEpkPi2ko3fQiP
	A45k4fjfIVIRiYQZ+2TM+slt6dw8WWoL7sQ9DVFg0ZYLotcAuC4i5l/07skTJpphuUYa1OqpdCk
	ntfBJ1kgD2Wa4xKPbkBEz6FLURKHwH3T2cNj2g8zn8fBiNWlysmx+NJMMV+2tpvtc7Moin3jo18
	re2EOfu0Sw9R3hi6ZbzYGn8lYSs=
X-Google-Smtp-Source: AGHT+IFGXKt2Ne+312FHQKlsxHl1O51sDX7kIoA6jMtZwlTfC7DlPo6BokxDsPaa+yv/IacOx2QUMw==
X-Received: by 2002:a17:90b:2644:b0:2fa:d95:4501 with SMTP id 98e67ed59e1d1-2fce78c90damr24754674a91.18.1740391196814;
        Mon, 24 Feb 2025 01:59:56 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb10fb5bsm6054636a91.33.2025.02.24.01.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:59:55 -0800 (PST)
Date: Mon, 24 Feb 2025 15:29:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V2 2/2] rust: Add basic bindings for clk APIs
Message-ID: <20250224095945.xjcjwkoqlgcsd2np@vireshk-i7>
References: <cover.1740118863.git.viresh.kumar@linaro.org>
 <a0a1ba4e27c3a0d9e38c677611eb88027e463287.1740118863.git.viresh.kumar@linaro.org>
 <Z7iGHiQcqa-_AXli@pollux>
 <4AD8A8F3-EA7E-4FBE-9F0D-58CF7BB09ED5@collabora.com>
 <Z7iSHR0F2QpiNpMZ@pollux>
 <aoprvojsnmkbzmmpgx5wxjqtamnr3jyhyqfcqnwhxulp34gn32@aau57u4cotpe>
 <20250221215931.GA134397-robh@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221215931.GA134397-robh@kernel.org>

On 21-02-25, 15:59, Rob Herring wrote:
> It would be nice to handle the optional case from the start. Otherwise, 
> driver writers handle optional or not optional themselves. The not 
> optional case is typically some form of error message duplicated in 
> every driver.
> 
> Every foo_get() needs foo_get_optional(), so let's figure out the rust 
> way to handle this once for everyone.

Are we talking about adding another field here (like below code) or
something else ?

impl Clk {
        pub fn get(dev: &Device, name: Option<&CStr>, optional: bool) -> Result<Self> {
                ...

                let clk = if optional {
                        bindings::clk_get(dev.as_raw(), con_id)
                else {
                        bindings::clk_get_optional(dev.as_raw(), con_id)
                };

                Ok(Self(from_err_ptr(clk)?))
        }
}

-- 
viresh
