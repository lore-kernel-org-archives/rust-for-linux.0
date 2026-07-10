Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17F2428842
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 12:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687980; cv=none; b=IJPcMoUS3oqmJR6PPAEHaGuhf7n6TaLMdPX+q+NViqnz9nXf2alFD+HfqJKRW5XIe2aEsptR2VugliVb2RqlPP6Bo7GBqVR5CwrYPYaLmH5LV4P3l2VqdnZR1qSC5d7Z55iRoJdu+vGK1MKS6O6tl/RkZ7hZTIoAyLM7r7VSYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687980; c=relaxed/simple;
	bh=DaEt4E1/x3kN3AM4451QA94A+SItPCjJO2fyZpXvV/Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=galYrA8AkOu9pSfQLIl7r39EjUF5Vhku63GOncV7iyTh48CUqu50yav43rHVSPSI807Plq12qdYGpolpmqvEJDb9KSUGwSoHuSDlJBKHI+9daVSPmWYJNypFB3TImcavU1F34zrnwEHlEqO7kE83umy8YkYZqFYL+0e1UOp127c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hR4Bmf1O; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hR4Bmf1O"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493e260e62bso4409535e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783687977; x=1784292777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x3lCNoZTmgh04ZNdzEkqqU/2EclNOFFBVlshG0boG0o=;
        b=hR4Bmf1O0xk9rVNiQuNVHdIV2YGr5VeloQVNWrT2m0NOUr03WcCgpYLg4RQhjAIVcx
         UUVo67C7FcPjTk8Ui89dWucHCSWl+u/Pub4WdhDm7Ag+OiCvQB2ACTvu4QfJQcT7u+Iu
         4enkxS1rqQGaj2zxbOngqYyLGK0KxqKe3FITTQDZDfsq2ZSFaQeLLFeLqmX7nWdCTxjl
         2ZMjlM3PzrWFNy3NbGAHtP8NC68aDvU7eZhFeuoExGl9m7m3dPNUGxmGQk89G2uOZ28s
         n6+r9qKDId5BewtHyhb//r3UxXdaW9Zq3GVZNrnudMJamuIuZlQr3GHB3AYQF7fn0ro0
         JgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687977; x=1784292777;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3lCNoZTmgh04ZNdzEkqqU/2EclNOFFBVlshG0boG0o=;
        b=RpkJ0NkbtZCFMxgc9BIepAO4WrN7dhneGqgabTwkhyCdyPZ6PtPrJbsU0mf2aompdI
         Wl6Ln6r0sImhg3u3wUc7nwsaHleExKLqKPPqg7BondGNDe8Q8jrjr0jGIly8+jyL7Utu
         yJb3sftMNc/kGrXbQMsWEAGd1BG2W4hz5wlYCmNR+qE/Stqaz7z+jYyU0qD9HwzBWBHJ
         iVAVjtOzd4F21/xaRrFvOy4Ch7hYJofFEwXBIuts3pP32CQ5XeRtjPVKfrY2xzlYjqL0
         SV7z8B7CoKO83iSAlO8LOtVJFFMawCwfVjIXerYDb050ObAwBKmFwMySKBzXB8YT1+TG
         gZZQ==
X-Gm-Message-State: AOJu0YwL8Xawjikxga96kHsAXQnJgaWsGxfV+ZkhOhOegyRyIJwjGR/9
	G/OoQABwiDB9eUbY4Vhq6EuDJBcc0RC3T8/zfde+OCDI3YaBawNeoYWLq+9y64Vwf3crHEiwQIi
	fbteQ8g+ERbg5fatnrQ==
X-Received: from wmqt6.prod.google.com ([2002:a05:600c:1986:b0:490:b258:4672])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a0d:b0:493:c389:d434 with SMTP id 5b1f17b1804b1-493e684a968mr123492705e9.15.1783687976776;
 Fri, 10 Jul 2026 05:52:56 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:52:55 +0000
In-Reply-To: <20260103073554.34855-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260103073554.34855-1-work@onurozkan.dev>
Message-ID: <alDrJzJTcRo2xMXH@google.com>
Subject: Re: [PATCH v10 0/7] rust: add ww_mutex support
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com, 
	felipe_life@live.com, daniel@sedlak.dev, daniel.almeida@collabora.com, 
	thomas.hellstrom@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 03, 2026 at 10:35:47AM +0300, Onur =C3=96zkan wrote:
>=20
>  MAINTAINERS                                   |   2 +
>  include/linux/ww_mutex.h                      |   8 +-
>  rust/helpers/helpers.c                        |   1 +
>  rust/helpers/ww_mutex.c                       |  45 ++
>  rust/kernel/error.rs                          |   1 +
>  rust/kernel/sync/lock.rs                      |   1 +
>  rust/kernel/sync/lock/ww_mutex.rs             | 444 ++++++++++++++++++
>  rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 172 +++++++
>  rust/kernel/sync/lock/ww_mutex/class.rs       | 139 ++++++
>  rust/kernel/sync/lock/ww_mutex/lock_set.rs    | 370 +++++++++++++++
>  10 files changed, 1177 insertions(+), 6 deletions(-)
>  create mode 100644 rust/helpers/ww_mutex.c
>  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
>  create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
>  create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
>  create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
