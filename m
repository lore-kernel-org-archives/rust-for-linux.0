Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7B186E47
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616746; cv=none; b=RourfNaIyX0WC6Mleri0hLlf013P6bBCXLPkP5LhIg71pWx/v8vA7v/XgKzCBGUBOMJFphRKUo+cCS9pa+AwgztFwtD+NxU1WFLr1ivGa47iylrTa8XL2swCMOwy1eXnHnJ55KDw72v7iXPjb9P/LXPvYqAL3eeR2ZivLjSYmPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616746; c=relaxed/simple;
	bh=LNpuMpWjAfWkh2SBYhoHHVU/hSaGGKXWVCOL+iHaXFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=FqC3LcT0pigxlef6EP8byIGL+pdYH8XVLPEInP1TFx68WGuwc/zw0Z0NLtMGps1dX0zl9GXAtzFoZBzFxsZsXEXAk2xSbxD+kf9X/1Ba4BmB4wM4tF9c96vlv4DMszrkrpxaBn0uhu9ye2PGhgYNa5KjqpCxmWw4+3VZ3eKa8hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NsA2sAEk; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NsA2sAEk"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebd421a931so40408731fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616744; x=1719221544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vn7FXPTC3oDopyoLncz961C4PZuJpHX/UbBJ99RzoDs=;
        b=NsA2sAEk71wuHm5WFsAbG7POHkdrQsEtiQrg1pd8RQ+gECuIZVHIL/zTDinJLfiC5k
         62HmjDWpAR1qifJd3N45gIuRwuLxb+M6kk3y0Qvbs/1mSkMQ0TxEDf1fywIqfRVVKm2u
         kCnM6tBYKAwhgpG/iorbYxQ26hDHwmBlRbx0QgYCRZy8xwX0Fi2LY2NojrE3XabJYPNm
         WCQesg/Kv63+9JW36AWikHRc8ZcZaUSxAnXZ+PFlRlopzT5MZG6Lo0YiJJ9Ug58GeCnB
         b2695PPR6qsCWQX4iMRm5kSxiDzvrLCD38TIut0GGLO5Yzg3MTHynbzcHKEZSbcUqi2w
         /7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616744; x=1719221544;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vn7FXPTC3oDopyoLncz961C4PZuJpHX/UbBJ99RzoDs=;
        b=IH0CYDYyxNj33YfW7tvk/iVuYoz3qt7hak35yUR0uZAAmNMc4U5ks/SUM+CTQF3Wsz
         bbmvuKlNpMvlIeX64YRBoMw0g4zSAH4gC1+WzlPtgOPj5zEoovRnBW72oa16cPi+ZYoA
         kXRyPUOY96V3pCwF1w7SoyZtQJ9VsGRGX8t5wriFwHF5pHOeE5GbEbC/tRt8QL89XDN0
         XjUsA+ckcwnHFcirO1aJ5UwPrcjWv1lu9uJTKhDnoo4kwhh9jGXIJ45CTSijltpjAexf
         TmR/Olq7JeOr6GTT+MTMrr5wfEC74pMqm98g87BLO5YldABrmICF9yi3ThmhWzKKqrLr
         b9KA==
X-Forwarded-Encrypted: i=1; AJvYcCUgv2UvEwQa9xKg4Mfv39l7poJOxO4aMj7/24xW7aW8CY0e9rVvvIPOc2gJjAC55MVI4CAIsbGBLSUI5GrVmf40CpcyUImJuO24p2K4APM=
X-Gm-Message-State: AOJu0YyPN/g+mV+piYQWQS9/b/I+0mLQsbitySuvowIhARMh2tnp4T9E
	pStihrK2W3EzajmuZMlvs/15G5Y1c42bOaX2aVhICy40cqyqvLnoEqv8eH0m54M=
X-Google-Smtp-Source: AGHT+IERhDJHkxzaQFPoFIV6vwAY64N/UErLLjS6cy8dGj9JTOjmTCXvGH8sSNVbXMq4F7qYoO+BSg==
X-Received: by 2002:a2e:be05:0:b0:2ec:eee:f198 with SMTP id 38308e7fff4ca-2ec0eeef74emr70338751fa.1.1718616743544;
        Mon, 17 Jun 2024 02:32:23 -0700 (PDT)
Received: from meli-email.org (adsl-33.109.242.225.tellas.gr. [109.242.225.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104b45sm11408120f8f.109.2024.06.17.02.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:32:23 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:23:12 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Bj=?UTF-8?B?w7Y=?= rn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH V2 4/8] rust: Add initial bindings for cpufreq framework
User-Agent: meli 0.8.6
References: <cover.1717750631.git.viresh.kumar@linaro.org> <8a53d1e0bf52f02027ff4be2296bf59088bbd163.1717750631.git.viresh.kumar@linaro.org>
In-Reply-To: <8a53d1e0bf52f02027ff4be2296bf59088bbd163.1717750631.git.viresh.kumar@linaro.org>
Message-ID: <f7x5x.0h3ihwj957m@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Fri, 07 Jun 2024 12:12, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>This commit adds initial Rust bindings for the cpufreq core. This adds
>basic bindings for cpufreq flags, relations and cpufreq table.
>
>Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>---
> rust/bindings/bindings_helper.h |   1 +
> rust/helpers.c                  |  15 ++
> rust/kernel/cpufreq.rs          | 251 ++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs              |   2 +
> 4 files changed, 269 insertions(+)
> create mode 100644 rust/kernel/cpufreq.rs
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
