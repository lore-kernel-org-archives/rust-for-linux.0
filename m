Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337957;
	b=TKQR60i77JQy+sAVe66hwop9j3PcLrqc0XX4DcjUC1QReIE5HJMGLqVeZXY2aKerq/yt
	 dwS1kFxK7ygSHQFwpQ8Gtm00PVzUVWeRycbMfaICZ7/yVOdcXeXDsGHJwDUR4xKfmTXF0
	 ObJgeTZ17+vO4ghNQIh56LfOGeBdMAk1pONA041JciJbD3zmG+31kb9eqk7yvMd9pno9I
	 XRDAoWyHATikezLpHN63KFSls2xZlYmm8gd4g1BiH3qms/zuN4svsr9WiWqQyAyh4EI6v
	 asGwmStYcHlrr6/3HH4R0S6pSTjwfGQOaPs2uyVGEL2f33E+KAEsNBkrfRi+cMfxwFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=bt+vNC5Ck7Tec+thZqwOgrn1YnZYE8U6h78l2ePZXOA=;
	b=ZBIHFyVlGpmqEnMJb9jBmd8XgsLCj10RjL3xB3fHNBh1KDQP6X6R0qG6p2rdPSJBNou2
	 KhryZelSDJyZTGE++rh3w+qBF8exOOCBuX1l/GqbB5BfkNuyPs22pH3VYCP6AE+Ft8RAL
	 ++IASrHwelqAhVnLLEMJ+OLIW4BPd8OticTPW/yVNokzR6dta13kT3JNWC3xYoBC/peO8
	 OSqtBB0zojBj+L9BaMjXChbvW6tMW3L61pFOYck8T+oHmkZnjpzuu439AzEK9j8/Aeyk5
	 RHC0FlucKN6FEU/lW4b8AwfcMvelXam7VN4hWaZyaWZci+ctUBOXeN6i9mSJHKcXFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QFzXp/q7";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6D6606A320
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 08:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6D6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QFzXp/q7
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-499ca65ae87so937561f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795337955; x=1795942755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bt+vNC5Ck7Tec+thZqwOgrn1YnZYE8U6h78l2ePZXOA=;
        b=QFzXp/q7PjWMZ28Y5Lr1/zoEik8SAq7sQPaC2qab1BUi7I8P8CErBtSXnqgJ6bfcAn
         qlWesCnZGgYG57AyXZcqgnUxXJCjdDOpHNcpbxl/crBBZHC3M99jWrlapZoLe9ovnPZs
         D6UBasDTgAbTtS+SMr8QHOAYbjrxluF3EXNkd/fUhlAYuXV7JagRA/4PGB52eijAHMxm
         hME/U6XOSwQBdF7nlokjH+HzR8KP96cNyzFc3c1F6hcqcMslUh/CVAatsXUvBuV2jR2N
         KXq41sSuZdGvpOpHW799q+JV5dKhtf1kRMALmBRee64ppY9+zrXrsnS/L2auAvu116Vp
         V/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795337955; x=1795942755;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bt+vNC5Ck7Tec+thZqwOgrn1YnZYE8U6h78l2ePZXOA=;
        b=V1UC1ghYWNSnV14RZ8Xq12G5BMgA8y2MpWViiXWeefr61QN/A3tTmEMdiZoldyr6FX
         Kp5vhVqc/PrgP0KFvSwiqP2T9Z+KK7dndWKtlK4HTyqtA0o8L5qgMqs8wK5Z+dZk7rgx
         YNKHBGVE7WBDLHwjShCAKDOHi0//vJghqIC/szBz6DGpmd6CvNBx7QitIkpqH1f/153u
         AD0AHyM0gWJlLgCH6MyV03lMFZTfxNQECdY5WNARt1B/yr6XwNnMRpDvtRonh7P7N8pv
         B0tninBb4bDSzN/gx2PoNY3hFzLiX6v8gPGo66Wwdfwz8u7CVL66MGBdlFB/NTGJIt0m
         K0vQ==
X-Forwarded-Encrypted: i=1; AL+hErHfUB29ajFsBV+b87gWVKNGw8uauB6sb9dMeSxWm3RSpWFzIruRh6qIhmosK1eyGqK0tdcfNZ3G85VEjtMvng==@vger.kernel.org
X-Gm-Message-State: APuU4Z91LuNQzXSaD2S3eIvViQeZNlTa2+xF+PhzPORJTmwwz8ObPeRd
	cT8WmU/vgtlGQaPDTJk0D4CDNNKpah1ggdVc6ciIWop3Kddx781zfnq8m7rLpLA0uvBEVeOOZj+
	RR5n1YNhWz4LPqEG+vQ==
X-Received: from wrrv2.prod.google.com ([2002:a5d:43c2:0:b0:48c:4566:c9eb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1e50:b0:48e:60a7:e0bd with SMTP id ffacd0b85a97d-4abb2ecf9afmr12805799f8f.17.1795337955311;
 Sun, 22 Nov 2026 00:59:15 -0800 (PST)
Date: Sun, 22 Nov 2026 08:59:14 +0000
In-Reply-To: <20261122-tyr-reset-impl-v9-1-ed42d8f513ec@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev> <20261122-tyr-reset-impl-v9-1-ed42d8f513ec@onurozkan.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122085914.1094403-1-aliceryhl@google.com>
Subject: Re: [PATCH v9 1/2] drm/tyr: add GPU reset infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, airlied@gmail.com, 
	simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 08:40:32AM +0300, Onur =C3=96zkan wrote:
> Add support for scheduling GPU resets on a dedicated workqueue. Track
> the reset state to avoid queueing another reset while one is already
> pending or in progress.
>
> Use an SRCU based gate with mutex-protected reader admission to block
> hardware accesses while reset work runs and wait for current users
> before resetting.
>
> Stop new reset requests during teardown and drain any queued or running
> reset work before releasing the device resources.
>
> This is the initial reset infrastructure only. It is not wired to a reset
> source yet as those will follow in separate work.
>
> Link: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/28
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
