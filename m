Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A102779F4
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717756690; cv=none; b=eKKlXi+gyFK+IJ4px7OxZscNGi3IEOyoQV7VyrFmZd/LIRIgluj0LqQBeabIYLJF+LfZbT2YE1XXrcH5C79ubbeJiGtaiPo/o7WEszkM0J6u4gh0s3ykXZIInhoq4zIMiz9otSbfU03/U8ensqx/tupauTTCR27BDkDEUvxB6/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717756690; c=relaxed/simple;
	bh=Dfhm+Ao2OctkWzCPUlbZo2WPxOBCaMO/F20ozOPjqus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=tUOKxe47MbOkbdu1YZ4/1rkmOtSKSsJJp+ZB5nI91n6ykCM9jRoIvpSWIb6HiW2YHQVNIwTATUT0/LCnN7IADo+LbXadYbNADdt31QE6xlzSGA/7pRU95vqtwfUExJCw7B4xtKjt/Hh3lrBOSoh6mf47G2EZWxSnemAHFtibWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tnaCFC+S; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnaCFC+S"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35dc0472b7eso1800542f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 03:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717756686; x=1718361486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dfhm+Ao2OctkWzCPUlbZo2WPxOBCaMO/F20ozOPjqus=;
        b=tnaCFC+SfWcqaMHB00quB4nInAKRiCZ3/LOVjc287R7qxnZjZpN5e3BPN+ZzlW3moj
         ggk+LgOorn0Q5iL2g/rIOfCT1w16yAeXwxMkozo0R4e/n0J6mkoIanKKU8LSUONCzPdM
         qQzreCyjRcpQhrPlIkhEPo0yzRe8WX2VF4QMHPVmTQa752KibDwCyHufFR8U0j7HDniI
         HSqKGj4GZNiN4/K3d0BTnbzGsyxEZo0K/xEnIMd/gjtqK9Q+RJB3j/2GC+fTuKX5ltsR
         xPytFClmybpR9z/J6wygzscxN6n8s5WuUuL0xUX22m+cfpfTnzwHIz6lesjdetA6VXKI
         MIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717756686; x=1718361486;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dfhm+Ao2OctkWzCPUlbZo2WPxOBCaMO/F20ozOPjqus=;
        b=YtvkqhVq9uoeHTzDA6EenoPNf/ZxuEd1P5rDuMhKLxqA+p5c41WTqjeqfkezvI7TgL
         HFaRtC9pazuKjuqq9fVL2nuoxvtnORabCePhnod8qHOvWc83ZhsTheAIaMCOotgrYhCD
         uywwz2xRXbKItJRguPl9xWGiJZ0h/qAy7496u1NyxTg56Lp08ZYof0+PP8LaU8k51lji
         kYeBh1vHaQhF55ltwCaVk4hBy3c8bU5FXLl+D4i+/GHqMos5VbFSQ1HR9WQ2F8LI2PPq
         lrzSo5eA1OfP9YsxmQOx/toZffQg8M3kpm3MMWIF0e7GcFlrhr0DJS7hkM+KiBJtUzgS
         Gfnw==
X-Forwarded-Encrypted: i=1; AJvYcCVnDzKmc286IXFcJgiGBjpXH2AqRXWLnu8RiK+6Kom4DGbCdfTc8jGN+cTjLhPyz3tbSN3UWJDQT2PtEcB4Nqhhf+Kl8iMP0CbFVL6u84U=
X-Gm-Message-State: AOJu0Yxj7MLY9/99O7pbna/Tfq5yYELQYzCokh8JY46ASJ09H+y9+HMk
	RGw/EN8gi79bYCySgP7Fia6F+lvchNC0R6yamZDJ0nnQK2qqWxQUy8JBgq4mX64=
X-Google-Smtp-Source: AGHT+IEalbWRcpQcRyHzFdufx8s7rTDBgqplrK6U7baTcerM2u8XIM+miaw2LC/2FNTBgh129sR4nQ==
X-Received: by 2002:a05:6000:1755:b0:34b:1a4f:23fc with SMTP id ffacd0b85a97d-35efed1cfeemr1613166f8f.1.1717756686002;
        Fri, 07 Jun 2024 03:38:06 -0700 (PDT)
Received: from meli-email.org (adsl-105.37.6.1.tellas.gr. [37.6.1.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5e96d7dsm3675615f8f.67.2024.06.07.03.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:38:05 -0700 (PDT)
Date: Fri, 07 Jun 2024 13:32:22 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Bj=?UTF-8?B?w7Y=?= rn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH V2 1/8] rust: Add initial bindings for OPP framework
User-Agent: meli 0.8.5
References: <cover.1717750631.git.viresh.kumar@linaro.org> <e74e3a14e6da3f920cee90d32a023ba4805328a0.1717750631.git.viresh.kumar@linaro.org>
In-Reply-To: <e74e3a14e6da3f920cee90d32a023ba4805328a0.1717750631.git.viresh.kumar@linaro.org>
Message-ID: <ephjf.9236xxczfzy@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed

On Fri, 07 Jun 2024 12:12, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>This commit adds initial Rust bindings for the Operating performance
>points (OPP) core. This adds bindings for `struct dev_pm_opp` and
>`struct dev_pm_opp_data` to begin with.
>
>Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>---

On the Rust side of things,

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
