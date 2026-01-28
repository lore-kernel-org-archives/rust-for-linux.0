Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFEE2D8795
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609524; cv=none; b=fC8F7KuMgNgh26LX7uMRCgk4heHoyXFxbfFyyGzMQWYaW0Xf49QnWx6riOzBjq2VA81/BWnruoUfBrAR+iIlWt5uuTWqSW1U/Q0H8mC7a3uo5DiKW/sWMo1hmcQSzm9MMHM1sVBxdo0Mz1gw1o1zluUiCMOgB21m7DpbkFM64gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609524; c=relaxed/simple;
	bh=zm6aAyMyfRmjFdEtKzqCzUsHqv2OVWcRzj00dlmo860=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hT3gxKLL/64tIvTF51ESzlZ2+n0R4KzpNCUXdH3nWm5Hk48o5y1JRMLxBhqfQVazhY6fdajF/U1DmKLYD0CmTkJuHvlMTbIGVJ5nNT9TupTyxqRINfikzFUfHtDiCxndBg9t02QgbBtJUX+2RU4w4drjsyg0l8C+1ADtes+ZyTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JU8GHUqC; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JU8GHUqC"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47ee9a53e8fso59156255e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769609518; x=1770214318; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QygJ7rcy8FtB5SESMxjbezj8q2qqNGjS55737xR9DYM=;
        b=JU8GHUqC95ryzqqJGYeo0bMn/kIEdK2kDNqBfNDGfsa1ll6HiETj1O674cJ2vfMVtm
         JaVeRe7mhPuV8pGyZ/aaNGkDqmC0qtYFGWn8bvmTGOrczdrMBLioP55z5S1XvxzvXqd2
         No8V3BjlazfKNDHz4y3/mdf5ScqXvQg/pM76JXE4bIg5FR6JEDRpY6gtOLfEBKoBlnxe
         AIcdVv5OvDD/BbYDqH3lfhsaWYWQr8BrHT3dE7LGMkGdBwaAZsUNOIr6scuL8xS6f6ng
         bp8PWdPBKl9HJZh0k3tJf4HpSQD0lfM+5vSrsdsCFHb43UtF1mWlB38R6xYnMsYNiYa1
         vNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609518; x=1770214318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QygJ7rcy8FtB5SESMxjbezj8q2qqNGjS55737xR9DYM=;
        b=a+L5n+w+hFGjZrSmPMycUbQmEh5eq18ChXFQ3mPYQVY+nyFtomxrI2wrpy76OpgwG2
         89Aty5cZvUzGhVCSj1DbwXuG8h8wgysrTmqZFMwVgJATWPGaQdq8LUcw1/igTlYJjXi8
         DW/X8mrB1TaVsFuKW+wXho1iwHMbNtZTxvqkVHj02bzX6j5HBZsrJ6gCvUBQuvZMVGeq
         cbfLZXcl26rUSvBrmx+M6HMaT3wec2quTkaF5jE+iJgbOELxCh1QBWPRpW18uLwUpktP
         m+98mG+hGwz/GlIJ2Dbthcgh74iBD5uNLZu928wWxenzNI6WFj562MkwZQtHSDoCjLZx
         Cdcw==
X-Forwarded-Encrypted: i=1; AJvYcCVyZn22wfZVwvwgnZn0sLMBSY5w3YVMZs9Q2SvYRxqQL2n3SHxjZbiKxjXuxdTsT034Mnj1H+/RjG2gKKuV1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+2iKUSMQ3UHgMOtYUp1kx3mJz49M54WVVJln4bK4F/HX4Kw+
	LOz3A+2uktWyTiv/R25AhzgFRvocyl86fnwheyv14ycrFpbF0yKEzeJ56q2aWgrQGjpgL9Gpkh5
	KOtc27aBPEnpjk6buYA==
X-Received: from wmpx5.prod.google.com ([2002:a05:600c:1885:b0:480:4a03:7b7f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1994:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-48069c788c5mr71472505e9.21.1769609518651;
 Wed, 28 Jan 2026 06:11:58 -0800 (PST)
Date: Wed, 28 Jan 2026 14:11:57 +0000
In-Reply-To: <20260128135320.689046-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260128135320.689046-1-beata.michalska@arm.com>
Message-ID: <aXoZLaVmOWIlBp0U@google.com>
Subject: Re: [PATCH v3] rust: dma: allow drivers to tune max segment size
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: dakr@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	rust-for-linux@vger.kernel.org, dirk.behme@gmail.com, 
	abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, robin.murphy@arm.com, 
	a.hindborg@kernel.org, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 28, 2026 at 02:53:20PM +0100, Beata Michalska wrote:
> Make dma_set_max_seg_size() available to Rust so drivers can perform
> standard DMA setup steps.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
