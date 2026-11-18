Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009678;
	b=g8eI7p1d73ybTiKY3+cd1hax4NdcTNTPzjld0vJrO74pdRzBUMwn/dZ3Fjcq0lYqaR7T
	 vzhcWz2TRp8jcOqXbRQouL9NEXWzy6SVBaacJ1T7L+7jWHpb6cOZ3IP5EXfg4UZkNUlR4
	 MNOSte20B6rmDcgILeXiS5bGTPpZlPAtlRH0HC69vLc5V6NxHNxQ2y58jzrECjm8/vf2v
	 D7kn29Qc8xk4yw0fuYrMGqnesUSoQKt0A3eGK0VVtafyg0vMxtwKvd6iZmomNj31RqfNb
	 lRq6ECzLi9AcSYbBa84EmnEWZJlA5pptEXd3pGaAsaXEm3Xv/3mbCmYPqkTG2sWffmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fp5kGNyd0eTmZJulttSFuV08XJjVgnvokjb06RGq2vw=;
	b=ks+DG+gIx41VZEWn15p1e6J2IzaHu73tOLTStW/b8uvsq4dgoLWJc8OdK2QHqi55zCpm
	 uRaybqOAXYCcGl3yxkOQjrG784Lcorek8Tl+wL/5drGz4GqI/sCWevKONlDxoju29vZjX
	 JKbwdeOR9OFv4lTO2YyWaOuBdrLS62/KOUKQrBfkbtFuAA21/buPRWSEnBQyaB5xt88eR
	 4UsIdFuyVa1f7F2cOsINRfCJcGZFyINzhZU+Jc52ZOHtybf/CdmlTpKdAZefOTh9q99Yf
	 NjkGS+43Sa+/UTM7h9AoaBkczpbK/dku/FTPQ/YuRg6TunQW7LK/Jd7grGkc6Y2J2jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dNmkEaEl;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEA5606A339
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 13:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEA5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dNmkEaEl
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a589b28bddso584780f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009677; x=1795614477; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fp5kGNyd0eTmZJulttSFuV08XJjVgnvokjb06RGq2vw=;
        b=dNmkEaElbn7W0RsZzP/CYzFGmyEkXFAnBJjALAYfOzlk5HKf4yBZkElycb3wOmea7O
         caAf+vkZXidQ/di0XnDTfCdqbUOHcyPxFv9vqY7Z/bNPLvL70J5d1tHYO8ykNC99A/AE
         IBC4avKCzgyHpAPYrXcC+Cv78m3zCcxC+bAIZklOa9Vtn6dRcyBR5i+fG1R5s9nJXSSm
         JdNyGZJQhYb3mjD+yjh3nq6zr1VKvAtBWf9uAHjJUBG7g7u0s7jWEDRIIxYC9bbo3DPg
         qIC24zC2EllAlbIaFfpivJ7b85mZTeQzPkJdMKExuftIfOVe0pX+yVbikwHF7SxWdf+q
         MQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009677; x=1795614477;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fp5kGNyd0eTmZJulttSFuV08XJjVgnvokjb06RGq2vw=;
        b=SlWq1fQR3mzcJwDENwxz1gvmxNQzLD4sdTzkdAT0loDFyoOSjDCFRnMzTlk0TGhFxn
         XCQIeJo3XMIYZ9I/ZmS1byI8DwBBfZH19KbEjCCC+R8g1Hxkdfr/npsqI4wVAG9QsJcK
         Cyn4lhTa7wyjTia6RJHqm1l5MTRw/LAEs3aj7Q4Mfz1lzEJzKjfv5LJ4K9SBk+FBnEQN
         slPWX9+bIAJJxSzlhRSQzt5oFOVPIVSULvcfzh5FJEcp8DR/am/u4A+j2GAUYcP1KbM9
         Paw3q8ekd9wbBgf1fpIEYQdXx/gy1l3AkGFCxDHuoYuxsG1ZL0V0MJwseRs/JjazN2Qt
         EHaQ==
X-Forwarded-Encrypted: i=1; AL+hErEM6PayyY5b3EAOokCoaR0AtFeiPAo5IJ9m1O8O5w4nqYyrSuVEyAiZzY/8INlkkf8wH1iFCQxMTZAFWVKzGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/S9tBt/u9P1BkEvHZ3i8qW6gnrZC7emcfCFTy4bl0T7XsNXZ2S
	vLsOU9+au+Ltf6PRQ+BENUotmyhoyRnCG++gPOeH6q+zb/D2l8JRzrVKK4FnwgqVeQj8sUwl0h0
	nkK4bI2JFrNVh5LiPyQ==
X-Received: from wrbay30.prod.google.com ([2002:a5d:6f1e:0:b0:49b:ed87:ac7b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e002:0:20b0:4a1:a2ed:bc1d with SMTP id ffacd0b85a97d-4a63b6fbe61mr4560158f8f.43.1795009676739;
 Wed, 18 Nov 2026 05:47:56 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:55 +0000
In-Reply-To: <20261013-clk-type-state-v6-5-a5e9977b3509@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-5-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134755.658603-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 5/7] rust: clk: add devres-managed clks
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2026 at 02:07:44PM -0300, Daniel Almeida wrote:
> Many drivers only need a clock running for as long as the device is
> bound and never touch it afterwards. In C, devm_clk_get_enabled() and
> devm_clk_get_optional_enabled() cover this case.
>
> Add devm_enable(), devm_enable_optional() and
> devm_enable_optional_with_rate(), which wrap the C helpers. They return
> no handle, so the driver keeps nothing in its data and cannot change the
> state of the clock. The clock is disabled, unprepared and put when the
> device is unbound.
>
> This mirrors regulator::devm_enable() and devm_enable_optional().
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
