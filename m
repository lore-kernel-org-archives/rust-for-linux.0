Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044229;
	b=n6cn+bdbC8ZCfWOU3r9DVqJ/6zVZnKKcYN3LRobVKlVv5haRr40szYl/bcUJnF5oklZc
	 dqmCce8XPhyqbUaXQW+0FT0dCcUAe3IZd+V56vPts9EbXAJEm/3gyqzjB/Cznz8rwouI5
	 +5dWA+NzuvJEeExr/AN4Vezn4dZXVO7qPIJyWqxqQnUTy6Z1lJ6QGO9b7muyzV9I7a2Ch
	 nEy4Vj2fIgQv19pWOWsWIdnPOngUAudDRCZUWkzEyYW5Igos3NjqAuzfFISdpbzqU8nbp
	 /AWUSe10ZEQqp+A3mngkn5dG3TNIgdvx1Fg2Bui29+Iow2e6xJYK7vhV6oaiYB5vitA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=BNtN55GYuVsPPt5uRpwb+HzLieno6rlFAiQ19PmBpDM=;
	b=defbi5jTCSrFuQOb3ue7UsaLLcXZ0vXObu1BhltiEBDSE4dmjgp6/VtghH0GN2IitHE9
	 zf6z/nG3mxvJjqvTwOslivRI8wkt3oRWP+QSjUkz43Rv61K4Jwj308652d6oOzsRtKTeJ
	 YVlai7My2viS2Zk5KPQoccac2FIiA7DcHycw18D1PqCHAz9PSxRZgWJvFwkFQMUidpZd7
	 I4kBeqWcG4qOBKgw/+7H8YO1CAApucKAB/CULdS6LYRCWDYhtYx6H7gafbHq9M/NLkcLE
	 n20u3bJKz82RgZ5a9yz8igZRN3aUPv1hJTG/p+I3UeBHtomp6tLzti/D6cuErWaHZOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TE7GF2Io;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E7606A320
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 23:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 954E7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TE7GF2Io
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49337a224a8so1061481f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 15:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795044227; x=1795649027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BNtN55GYuVsPPt5uRpwb+HzLieno6rlFAiQ19PmBpDM=;
        b=TE7GF2Io74oN7GLFOgnUS+9NnHQI+mRCX2/LGNqharVkbEV2rcrIoCEBu0a8PAd1jT
         0YWftalTkS6Bhgk3JPapQbWIzID75yquOWxybHPrTlr5Yr8n496NznOhFTUXpa0bivPj
         9wO/rHY+ZJCLxLKc6a0FQp3SB/SEcEmqOuX+AgpJOKnsmyzcDNlamQs5V/g1M/XqT0PX
         SfMVSnwOqprt2jH9gZJYyz5Turj05ne96HpUsoGt2KjkuPkoGZXzAdFO93K3fE342zbp
         8L5i87sLBVzZ9xpqBJjSVt8PLmMDqBk1PqNJs2U/8W+0XkuaLlclpO1q8Vj6jtUnrTPN
         yRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044227; x=1795649027;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNtN55GYuVsPPt5uRpwb+HzLieno6rlFAiQ19PmBpDM=;
        b=MpAXMxjKeQlevbOPU72IJ9zE+jD8AspKUA6g1xgKh+1z4x3uLR2YOFgkFega8OtJwL
         Nsx0eu2vjC+RwmfHX+GJqluXcNxIHb1b9IHJTaumtTGKbUWau+ILIfCBfR/8IYSoc1fG
         aPPB0sPuWhdWJyGbItDH/pMTjcWub35xcijr29A3hdb6DdE1VKXpymEpMKSBfBeMHupI
         37359gNUfwVc7xggjSooFyFjq+uURBxjDLEWjZuPUZgSLLMvGImJ9MTtxFuFIRCyczML
         8rbvA3bH9Uk2j+xMD2idzRmjTI7qpzOWjZgpe+0mLF/mNzTxz7XJmP9c05Pnp8/s651J
         JYKg==
X-Forwarded-Encrypted: i=1; AL+hErFuRJBTcW4IoB8zM9lnLvOwNr0IdC+YYCuui2fnC0KgStjM3bvEA+7+xtLjxoNJBj+0Wghnor/pX3pKLTZv4w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ds6BpRdNWzvx4JB/Cj6VQaPSumCJ3ufPemicxOM9PCsAIiDx0
	OoVOfl6ED7OcmIWUYtJf7xNhl9OvdUz0RGnwITu9pZtCmegMRB2CpKj35f+61NF0mGc40OLaMHj
	oL1cCSJAy+LbXbYy3Yg==
X-Received: from wrqk2.prod.google.com ([2002:a5d:4282:0:b0:4a5:9a8b:7c4e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4029:b0:4a6:d298:832e with SMTP id ffacd0b85a97d-4a6d298857bmr7425526f8f.45.1795044226494;
 Wed, 18 Nov 2026 15:23:46 -0800 (PST)
Date: Wed, 18 Nov 2026 23:23:45 +0000
In-Reply-To: <20261118224826.2491684-3-tomo@flapping.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118224826.2491684-1-tomo@flapping.org> <20261118224826.2491684-3-tomo@flapping.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118232345.1511641-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: Alice Ryhl <aliceryhl@google.com>, fustini@kernel.org, guoren@kernel.org, 
	ojeda@kernel.org, ukleinek@kernel.org, wefu@redhat.com, a.hindborg@kernel.org, 
	acourbot@nvidia.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	chenhan0017.work@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org, 
	m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 07:48:26AM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Fix the following build error on 32-bit ARM with COMPILE_TEST:
>
>   ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' un=
defined!
>
> The driver divides u64 values when it converts between nanoseconds and
> clock cycles. On 32-bit ARM, these divisions are compiled to calls to
> __aeabi_uldivmod, which the kernel does not provide.
>
> Use div64_u64() and div64_u64_round_up() for these divisions, in the
> same way as C drivers use div64_u64() and DIV64_U64_ROUND_UP(). The
> results do not change.
>
> Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
> Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/=
topic/64bit.20division.20in.20.60pwm_th1520.2Ers.60/near/626825599
> Suggested-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
