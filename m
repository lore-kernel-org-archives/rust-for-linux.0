Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9012BD02
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 04:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783311833; cv=none; b=Dh9wezG2h+0R5JYRrlkXMLdt+2O7xZOFI6QfiWtE2R35enHt1sQwnu2ZKcw0FnLwy9lHoYWA9hADwnWseey4o+NrqGSegs4WEGiJOn4IEPB9rOn/NdxWKJxjWF1CGsnlcsaP04tQoUFE4HxdqYTb2sOdfTek0oZzTFgSODxL4rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783311833; c=relaxed/simple;
	bh=1TKuHPQG+qr2jHO37e/ykaCNi1KxsSiB0AU530is9qE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDaGbnEb/LrKnq3V9iwmrin/vBanGNyFo/P7eEmAYvP4LWaBW/AEROY7GbDHreyVIjL8YK2OpsJsYRbeJKLua5rnHGtMC4BbNJGmxaxcp0htosZ1CYvyGYFOgUnxjrfAh+43g6K6TiMXdVhwuMOb8/SEI7ZFe52Hoe9ClKILwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTE9mQSr; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTE9mQSr"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c89636920a3so1097785a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 21:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783311831; x=1783916631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lu1iu2s3AKXtUtx5SwXHLJCkf9NPTK5qEvHPLW7RRqc=;
        b=mTE9mQSrVIPWv3QkUedR1mG/Az8wg5ydFlWXOmDO4Yv3cdv7gYxyCO9oXWPL/w7N+6
         AAYJGYDBjF27GzHORH0dfA4YDXfG6f3xKsW1plI5cdYjwo1bI9f3lMiqFkAeI63YdmIX
         1nFNRozVDcFOX0xi+HYKCx39pfoRoF2UTRO0e6bUsrV028fi9aHuKZm4vGwExSN5oDDO
         fP5E8dnfwmkvSZsg1Q0+TaHcnddogwuLRjgFOP0Bi7UBWejz2R5A20yBEOuti9dU8w19
         H/apkUnTl4P+zrIsFRpdzRqHLf6qweOAh009ifQUxVc3u7j7BZwK/bEsS3z/jN2c6oM+
         YaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783311831; x=1783916631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu1iu2s3AKXtUtx5SwXHLJCkf9NPTK5qEvHPLW7RRqc=;
        b=D5wAX90fIOFQPkiLrOuYJ6Ao6/EshkmwSnIlZGj0BrkLCE7yvs+pfcB6bZxELJM18J
         BR3rSad8UgBlbKHBLNpgsW2j8anuxpr/FoB212u8jpb1wcxZ7DC8+ZwZW8Hfo+p2XE/a
         URmN0nqt01fKkuqGhQi7bQfpKk4HsSYbWHHunYYIY24+xjbR4ToVllIwjTaagOGiOjeh
         DdTEMlBDwDBbWV7S2h1o/KD2ONHO0tygYaN14evTaskxxCEWRvcLJQGP8hKQVEsI0TZR
         YyZdtxIKfpoKquOl+heoG5jeNsjr3MHkB2sGK0uCT4TV18ak2ku9WzXX8SnQ847YxgQz
         P7qA==
X-Forwarded-Encrypted: i=1; AHgh+RprAiLLoh+aAUz0UHIzS2y2zgUBC3KuJOPNCyPhJS2RezhsUEl8GHCf2dbVl3oo3hPP414kgf/2/VesIv705A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpLB8SV3TdYeaaES41OvpTK20WNbHXWV7yVyJ36QcTfEuTzX4U
	RgGsHLR6zMNuifqmqEmrz06aCW/kYuTTbedjgb8Yef2IEqzJo8jCOdCMCLVaPagrki4=
X-Gm-Gg: AfdE7cnWP0LsNmG4o3Qaw7mC33g2IoZIWgPTyBD/z74s/IkKRPp5zlYLaZUl9i92Yde
	PEMW3pvfSy4kCIVgt31d0Il3EWoxqORKkU2O2Ro1cdVDSMrkGuM4ETHDdO94eev5LP7JyfZ3tj6
	Tuvn2ZoZ+rIWbMBPbxvn0mH1twLNb4+Js4V6SLsiBqFwA2Ko9x2EJ7X+uYVKAK1giGK/JVlldcL
	RDuzFAsc5hzg3+qY6IoZNkYYo5sOG9v2x+GteggzMwZl9QEJmSd+XGjsX+nWf+scowZeJRvuj0b
	uVmZ/rBhexTvlPhqCya9KpDcZxgakDTIKx6vkD6BjitBbKIFG+Zg08vYvH+sEnrIhyFVKyoULKL
	E5fIdQvd8yRItjhrESptL98DmDZbSA+2HiQwzTMr5k2uztn2N7EF6HnDJTny/aNLDk5hn2+Rm7m
	em9f8b7GC4j9Lt
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:7189:2d1f with SMTP id adf61e73a8af0-3c03e50a981mr8627508637.31.1783311830982;
        Sun, 05 Jul 2026 21:23:50 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3b252222sm30443173eec.23.2026.07.05.21.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 21:23:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 09:53:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: rcpufreq_dt: use vertical import style
Message-ID: <ennffugbsqhojfeplo7u7qjoeho473jg636jvfuxst4jq4jmda@7a2v5unjj5up>
References: <20260705-pm-rust-vert-imp-v1-1-8aa778c32d82@gurudas.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-pm-rust-vert-imp-v1-1-8aa778c32d82@gurudas.dev>

On 05-07-26, 20:08, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
> Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> vertical import style") and found a few more locations that could
> benefit from this cleanup. No functional changes.
> 
> Separating out patches per-subsystem as per the review feedback in [0].
> 
> Tested via:
> 
>     $ make LLVM=1 rustfmtcheck || echo "fail"
>     $
> 
> [0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
> ---
>  drivers/cpufreq/rcpufreq_dt.rs | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh
