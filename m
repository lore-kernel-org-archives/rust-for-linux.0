Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270374;
	b=bTzOpEx/tvtPYnUodoKXjgEnCUYpQ6fAAYiAMXks63RxFx8AlffNonZfiZ53Xr6Qbsqd
	 FdxpZ4PP0+6fj6y/phVYOxp21MB4iF7IPPAWSEz9Xb0Qgx5Rp1uFs8N6Hw1jG+0UxqP5G
	 2EcYiRpJa/uQMZmKNrPpbqVdEMhNlAMaviXyMy0jvfPFisXTBedXMPGj8dZt2BlESt0Gu
	 KXGSqkIjvZVfXbcjjH79tbcTWMUnNZXFC4veW0WNdueunaESJaWcuHG3Wwi+B+3UfAPA2
	 uo/VtuXWaNiLgtRH/f+uhtXhhZSBeaRy3RwPF/d+7S8aNBARKr2Fo0XnBQpiVaRQoUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PuHKHlqLNR2MksId4LLRNrhrnwLo9yVhdzo1ZqEJWls=;
	b=Gdg6VQiF7RnB0VX1VrYbui0FuHNxbyDApzcz2Sa7hvbdFZqMlNygivf+mpfB2Fm59gX5
	 COFNlaNdi16KOV0FaV5DfJx3OUmt+/z2EgX9yvWRgTuzyY43Md6Ku9TaXnX3S7VhVSzK4
	 NNgV308ZqP42nuDicPAcUNEvB3H9CW2ioXzwZ7r40JnAJv2gcoZAD9YYvKQpwG8RZ9SUE
	 v3PF91ogQ3eFgGHqVnLLOzIzgmxFV9zp9uwEiH6QnZSqDvay6FOlgyJCE0ivRyDIDuhVh
	 akcSlDyaCyvob4/NAJM9HsdTYx2kUPAuxxGM++epxOBZM71Ag3aNprDIZmbjdxzppSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AjadA13+;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8E2606A33C
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 14:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF8E2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AjadA13+
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48fcb657f32so1038286f8f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795270372; x=1795875172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PuHKHlqLNR2MksId4LLRNrhrnwLo9yVhdzo1ZqEJWls=;
        b=AjadA13+1JWdiMR9IBnGjh6jjgCZzjeI67CBHj9DENQCFoed8vlm1ErurhrjpO8ygw
         qIugUFCaI6UDjd7BVvmv5wZKQ5S0bOn9GlQvJkIRfu3eJcqTnoyAKAwGb6WLMFvsA/Zx
         bpJ9IhnK6R9aveDR7iLdMACp9V5A7AGK35wAQQMXPTloMpTVlODxEb0EI1tpBA3yl33V
         /x+NBWi4tXLbMhWYcCk97klit5X1GzoCroDNjS3r/HW0OF3t/DmynpmsGtaX7+Rd0b/k
         pylgQgKO8E+PQjLjSL1H4snABZMrHiUU9Zsad+jic1w14vBsuDUCZJPCLthjyHcwVqAB
         jS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270372; x=1795875172;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuHKHlqLNR2MksId4LLRNrhrnwLo9yVhdzo1ZqEJWls=;
        b=rDQSKDosyQdry0CJJVUz40LWE+IEEBXnySp1Do8RnLhxO+PdO9psame+CIR/NTcTha
         R306fju1gzDLa44hCAbf3aCc+acbxSbJHDUQQoHLrf+Tf1a8WSqiuPPIFdhxL1sZ7sEx
         XkR/7zel+jjIueBVbvuAUVJV7bKZzyX8mjgm3kZQ54dPDwGDtUBtB7NbfmifIiXEDBFO
         BxhSDrv2vIlJyPPCHnv/ktyH5HjmdC+wO/vqr+x+0M9gBk0lX/9LQHTrN9WqP1YSpwca
         Qs9nOX9ncbRjL8K5b5FJX0oBIzMgshMwIYY+jGBZ5nV4AFKgAsb1O8nFlRQR+tekJ1Be
         NdMA==
X-Forwarded-Encrypted: i=1; AL+hErFZ6/C12FgCV2DGSM7I1OyrLjsxz7PMVM7mPYjBIb18ZO1LM0EA92fGnaJaA6iotWFVsXf5dR/MHafmwYwEqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7mR4Mht+FNBobaFtlglo3TdiSSEEfKyD3N4Yg3eOtwoIZWNr3
	XXuuJxcL5cdhKSx58CtLJeBgmeSUvSZ9zIZ+dmDMLCmOUkSHhviYu68tcO2oKvkmFU0xm+sdQoO
	5o5T6t/A44sqMQsheEw==
X-Received: from wmcz23.prod.google.com ([2002:a05:600c:c297:b0:4a1:e780:89af])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0a:b0:4bb:840c:72f2 with SMTP id 5b1f17b1804b1-4bb889323a1mr136801365e9.25.1795270371975;
 Sat, 21 Nov 2026 06:12:51 -0800 (PST)
Date: Sat, 21 Nov 2026 14:12:47 +0000
In-Reply-To: <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev> <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121141247.142001-3-aliceryhl@google.com>
Subject: Re: [PATCH v8 1/3] drm/tyr: clear stale IRQ state before soft reset
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

On Fri, Nov 13, 2026 at 05:32:26PM +0300, Onur =C3=96zkan wrote:
> Previous reset may leave the reset completed IRQ set which can make the
> poll return too early.
>=20
> Clear the IRQ first so the driver waits for the current reset to
> complete.
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Applied to drm-rust-next. Thanks!

I added this tag when applying:
Fixes: 6ea52b6d8f33 ("drm/tyr: use read_poll_timeout")

Alice
