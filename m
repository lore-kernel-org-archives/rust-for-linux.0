Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337958;
	b=run8MKuVsC5+XnWlWLa3dyfqKqGYDiNHE2TUrpuThGk78dS5wu8i3vr+cyS8h4VyNEYm
	 5OpiWMcYBQfWEAiBZ8H+8Y4Z93LXFBsRKi8YXXLt6aIK87WhbRX4Xj/c8jW51wKeDMciU
	 co/a8rH05M9c+5jkiMbOgRIsn3xW0+0opwRtpZTmvKjNsHsZDs9TaKmsD8+dSz1+yCfzW
	 mGRSNsJuxhizUV+WGMvfeGrBHY7l+Bs0XG6EWR72weHYt2kUqNS3oo+acyg/smqtUk02l
	 q5OE5lYkw4l7DETAUzhfIfSULpY5x7CDpzjMAUi6ifZKI7YDwKXzTWiWjcKZlZOP8/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=G2sUKEpp9UCq//DjZnGDoTE+Lw96P7JUYjiRFoz38Vk=;
	b=J1n/A6TzWRtBm0+zwVr6gJZxztEwCzv0BRM9vlM4bsma4fERenY0JkB07mBZ13ppQ5US
	 dlpH4PBptDiIj/eAa1GS9UCWp0dh913SZ1fSJr+XQeJuC603Me++NB+CcqJIzb2+2WNoY
	 l9sAZPz95oLHok/dWwMu7LPRqBN0u2wVXbpTn2TdGZVOnQeuThr3XqX3Lqh+ts3LDXPEf
	 q1ltMrFvLZWCd5mTw2Tnbu35mwm6rFjtKI+gbYVl/YW7xaBHYH2ZUVmxsrj1KveQNAxdj
	 61gyKH/QE4BV5vpBg6zPzuJUtlKm0AnLALKoMXLCpci4zg7dTGEB3EAxXlijw3C7ifw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="M/DA+iUE";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE7606A339
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 08:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DE7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M/DA+iUE
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so1318708f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 00:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795337957; x=1795942757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2sUKEpp9UCq//DjZnGDoTE+Lw96P7JUYjiRFoz38Vk=;
        b=M/DA+iUEfZH/RTuJV4mophhfeAOFmY/wKP2WaYyLAjRtxbEjeZ1kirf2SBA88/0aUo
         YSypVD//LfRhnXdqjJNjNX8Fkoh2uYvp2lLQ/EaQMk3TpksjRn/2XUlc1HVrQkRwZ/zS
         FvJwEcIPOXcdw+VLcg9/DWchUzU0IatILZ6uM2PFc8GokZkAX+Zeo3ZfJw9rBv+5Tgpk
         ELcn0+BQdXRghiesPne1hWUo5WCRqAK/9azw9J5g8ah0CDnLRYWS08NIkx0pFm16z8wl
         naRKHqKSYI3B9fdsqf1kAK+p2Hqbxkler90om1+RqtiJW84NmRnYPCvzdhj2x4pLYXkD
         x5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795337957; x=1795942757;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2sUKEpp9UCq//DjZnGDoTE+Lw96P7JUYjiRFoz38Vk=;
        b=047XuloRtAKdskAjlUWwYv05X/hY12xi44yv4crjKUO5Eo488OedW6S2PsU3hhEEZj
         uUXW+JwCZ1mEQefRGT4ODF0xQ5GO9RuBbCNqmhaEBoRyNSRGKwds+hCckOgfuzpnf4iH
         QnI46Jhte5jBo+Z0ndM4tgWrJy/4/N8GT7dN+8j02udNhebQTevuZka+lKBtvscSqeG+
         k//jkK0OYxxUWe9MqOnjtmLZdMfRV0P1i9iwCdBU3XtLjyMFLu7XSAYfzxQH1pFVTts8
         5Kg8Zc6+2ILM0B9iNRFkfNw8oIckaCz0xeiYxDOCaytpxmainOSMlrwJEaYzCo9COyg2
         O1RQ==
X-Forwarded-Encrypted: i=1; AL+hErEn6thetnd9rwE25Ku1enc0PXxXuG4l7BHQS7X3/zjwmsMRd7/alOsrUjpQPrpKB/AEhAslQlFg3R1m2JOO0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9k7sFrzLSJf5pon8k489yn2Vh6IH6U67I0LyaoVJrqx6LqfX6N
	AogDNI583WZx+OBCApNWJmJ9Rkp4JIRvipogUCvqrnUS4xzKKHxOikkqGWH3/ey153Z4vzJi8vY
	G2Rb/Ed7Fnl9DOhdbkw==
X-Received: from wrsv4.prod.google.com ([2002:a5d:4a44:0:b0:4a5:aaa3:3335])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0d:b0:4bb:5c97:f4b1 with SMTP id 5b1f17b1804b1-4bb8881941bmr192603305e9.24.1795337956685;
 Sun, 22 Nov 2026 00:59:16 -0800 (PST)
Date: Sun, 22 Nov 2026 08:59:15 +0000
In-Reply-To: <20261122-tyr-reset-impl-v9-2-ed42d8f513ec@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev> <20261122-tyr-reset-impl-v9-2-ed42d8f513ec@onurozkan.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122085915.1094533-1-aliceryhl@google.com>
Subject: Re: [PATCH v9 2/2] drm/tyr: put iomem behind the hardware gate
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

On Sun, Nov 22, 2026 at 08:40:33AM +0300, Onur =C3=96zkan wrote:
> Move iomem mapping into HwGate and pass Arc<HwGate> to components that
> access hardware. Callers obtain HwAccessGuard before accessing the iomem
> so the reset worker waits for ongoing accesses.
>
> Acquire the gate once per address-space operation and pass the guarded
> iomem reference to its helpers. This prevents nested gate acquisition
> from deadlocking with reset and keeps each operation protected throughout=
.
> Clone the gate Arc before acquiring the guard so mutating helpers can
> retain their mutable self receivers.
>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
