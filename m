Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015B23BB40
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532361; cv=none; b=NyLIz5GxFIIolU6rFREYHbh0Gep1uLLl65IjYKZIWjFtZ0QJsq2IEiUmtWrMom1AeQkzpfoz9FGRv81KdER5J3ndydhh0QMR+aK66WYhlpNd9+MlkN0i4/dCn3n5aMu6BUqxgX+azs6k5UZE7vFX5P3T2oz5cpz/UEglBy+6Suc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532361; c=relaxed/simple;
	bh=ytETLMqnK1km5YgW7IIjhG91PABjfpJG4iBBH+tfBjU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=niVP9mynC3b6s7ELMsPhZZXrV5i2p5/WGjoXgHT3vU0qvaV54oDwX+dJUFIuGcnaHtjkrPYCx82aFaJLVa7Uwn018J5UZ/725ZLyOGZ2no4/Tlj4meoIGm2bwkDAaXYBjtlot88+BZ4w5/rvlrNkJ8V7vlRXXkd5GbMKpc18J9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=vnRm8xnL; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="vnRm8xnL"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so6103846eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 08:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769532359; x=1770137159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZg99l5T6Nvbs576/aecVX27BRBVhs2ng1JODgSD32U=;
        b=vnRm8xnLfNO3I7/KspM/b7xSX5WYmlLvAgHJsdPBNhk/R6c/PUzA08atMBSyAQoqmF
         F4olH5yrZHhqp52PQ4wT3WnLNqr6QJRSiA8b51qhzqQCqsCcc96Uc5LFwzK67TCnhqfN
         FOhKxvS2sbWInQi55l//523il9F6WbhkjMAEntG4YKUJI5rb7EbCZo/OzjEQeioTayVh
         pzFe6FwSuRJAe7cShjaugVfQ7UvtDoQsoAuHb4gXH3HuVKpV9FNgzSvEBO/cA+/LMWQW
         YWkCwofcCif5w20JK3h/ZD1MTp0qnw9T6Ouh0YGWfMJb9HzXGDk3iq6/oQP4bKkgsDaJ
         HyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532359; x=1770137159;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZg99l5T6Nvbs576/aecVX27BRBVhs2ng1JODgSD32U=;
        b=uSyULOmj4DPi+SiAUc8a8hMGpIH/jBJMp9AE8Xm08ujEp4XMcxpY/P2lXE24BqKYL2
         IV1N/I+2h8AP/ILdOEJKWsWO+UXC7cuPXmXOJxmMI7mCZ1ZSl42z1q7WG4Wc+keVoUck
         NfMJ5+rzPNinlwYyzo3S4Yf91js674t9gzrYH2cy9Oh0ANpXJsQ/u+klu6JgSDXaEXgX
         0vQOy7qoauUiu6FnufNSYzvfi6ycv50bA+pN5VXpYD5t4zA8ovuFnknKtU5xMkqEKqxc
         EO3rhe9NgyYzmbNT8LFl3WAbsnhnO8VxHJvh8TZTlrv40aeDcxPuuTaWqO4aoiZXIjW5
         egsw==
X-Gm-Message-State: AOJu0YxuR0iZ8u/GoD7X1//d/SWM6RSuVQ+XiaApnJP+59g+ZPT9EmaE
	VgEEP2cMzlnkMZM9vLLlAIqWRY6ZHkDEAgIjw1/tz5xBmrGUT55p3wzkYtewrbGc/so=
X-Gm-Gg: AZuq6aKdzgZVPmxbM4wuQ0IRE8gZI0zi3k6cDzLXiGw0A3AVYq73Ez+l9YgOS1yyuoZ
	TbubN2wJzEPaiDuN+PuaYBh9WMGVt7ziArKjD5NUkVGuj0U4AKZS+NzpCkEGaUy9Gj5GDeSIDnE
	SEdV/HKcXAOF5eymo9YkRVeLvqOpLZK8MtRz3K82HEBGAmHBKtDM8dUaUvE8CegsGsk3xhjqMoE
	dXjaRLUKmhuEKzXasb59+tt7o+V1prN8g09ptl7FwEDBo3xvFmuyNiYq1gHRHgYEBH9Eo62f8hD
	dHAjK059OuAdnLuTY6wziWG3zVOWdDRfxNd2YfopSJnNOyCzOuvzeEYMCQxtokVHyuVbXNnInCy
	3a3bqh/cN1lTckokSdVV/xqwPwDGQdLGqaiAe8x3v87for3Jltvv6zOsap5Ic8j+tDYxWZ5sFAQ
	yT5KXPZgqJ4n1jcEnu2re8NLS3qAT2geR0O+pvl681poY2EStCiVT8Ml6gRVE4
X-Received: by 2002:a05:7300:80ce:b0:2b7:17c4:be27 with SMTP id 5a478bee46e88-2b78da70ddemr1408827eec.42.1769532359014;
        Tue, 27 Jan 2026 08:45:59 -0800 (PST)
Received: from [127.0.0.1] ([2620:10d:c090:600::cedf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a9e1bc8sm17496617eec.22.2026.01.27.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:45:58 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org
In-Reply-To: <20260123172007.136873-1-gary@garyguo.net>
References: <20260123172007.136873-1-gary@garyguo.net>
Subject: Re: (subset) [PATCH 0/3] Remove redundant imports of items
 re-exported from prelude
Message-Id: <176953235809.14203.223038623552325483.b4-ty@kernel.dk>
Date: Tue, 27 Jan 2026 09:45:58 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 23 Jan 2026 17:19:39 +0000, Gary Guo wrote:
> We had a few occurrence of these redundant imports and up until now they're
> mostly checked by human reviews.
> 
> I have now implemented a new lint in klint, which is able to spot these and
> advice on using prelude imports instead. It caught a few existing cases
> that slip through the review. Thus, fix them.
> 
> [...]

Applied, thanks!

[2/3] block: rnull: remove imports available via prelude
      commit: b2b2ce870651db659247f34636e6243b4547e8af

Best regards,
-- 
Jens Axboe



