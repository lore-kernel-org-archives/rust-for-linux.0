Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103074;
	b=aIftS7OJYVQbYLCfNAahvww1pmf7CshlaEbUprZGYjlmqjc8jddXCsSXaLe4ME6bRfkm
	 +DRcLjXvkxeu1VLJCMdzajIbz8IXIFXg9/8zXRjrSxJORs/0zjY+nrO0el+DuPo4e0Btv
	 Phub/VAqZwseXv5XRvjNrHK+f4yrHtgQskfOtI8LJAtqaOuVxyoGv0teySsDRZxYGpK+0
	 N7+gFibHNIjG3W+INbtSaniSvrkg59Wt83CgeNqwz3YDQFySx1YTYNm7NruMfH6DJJQ9L
	 x3g1Va6jqGByvtI0Qu9YxmgMJvffZTrgeVfoczjacYFSq3sXvATMJ7IPGLLvjYx3iXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=plRJXSHLssMK20rYzYBE8Y5/bfsmM0mbLiVQroO7VYE=;
	b=BoaEYnIItaNtujBQK/ojd8G7WawDFNu8xyglnBV9JS3P4DP26s4yPZU9yTctm+LtYiyR
	 KyGh16RXvU7etafdAxsaqGlwQDqcbMuOn6TZkT391vpgUmhf++CqaeMCcN9hJhuRHLYDG
	 EUmbkZ1PKwQPH3X5bIkqW8+wiWHBq5JiJzioPtA1eFghuvMSAAF5hJqyPoQc2ttljbsGy
	 f/Bfoivr93xD2TKH5/73e8SatO26NIxDbx26blbzJv6dBVOTfjMpVxaRh4PP21WnDiA2U
	 2EDMfdSinURZ1MGQi2Bv6ZhXfvej3K4aR+k9VHD+NSrK9Tzmo7BysPC0GbcMCeF6Msw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dhYU2RLR;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A712B606A32A
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 15:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A712B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dhYU2RLR
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so1573327f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 07:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795103072; x=1795707872; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plRJXSHLssMK20rYzYBE8Y5/bfsmM0mbLiVQroO7VYE=;
        b=dhYU2RLRhjRMFqZMy8elmtfJ4dXKwFU/92H3dNdgTsuJ0MQFIT6TsYnnB/S2AILL4R
         ayus790DzrpTP+WsKc8ZxWnhLyONg4f/mN8VxMWpN0bmy1OEWK0qUUpFb1KFFIQGvVHq
         I98dQCEO0+yhPUXDFDUHnUlE19s8inIYRYCdcT4ceOaonhaVzcQfVigDyPNSs+8hcZPK
         xTEtKnm8+iGwU9hnFIPWRe9Z8lcpwBiBQALO+s8ndlTbbso6IBsIVch2yKy6ZMqirNV4
         3XpgGmg1be6TzNoLBHWy7chJp25wqGkblPOXOGqBVMmeoIpGBIqEiY5nweDY+oPUVVR/
         /Fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103072; x=1795707872;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plRJXSHLssMK20rYzYBE8Y5/bfsmM0mbLiVQroO7VYE=;
        b=UthYZEYhjTsP5qSugbwRnkLJkdCYGdzNMKFMdD5CErJCLZk61++DiwYnoaVm2l3mKV
         KpkCiYFSDYMZ8+6h/pQ+yNjqp4thl98eIUxkKIw9PXUuEJJt1BNPi1lSEbuf8SLA/vIz
         7dp8+sGkFAyIhqimLlSSAvvQLXRZtTR1ubKgEfKHYf9jsggsG8+4XcUDhWSrVTiHLZD3
         1+NZLyAW5FMhflRBwac1Ny8BvC7sMtnJGOsGkpNXgR/BDjUXd+NkFDxTcNN3s+5tjXXO
         66M2JvIXZ3Pj7+b7ZDYCD9m74L33+tTI40+Ddk0UkUot1P18vMBUUG7wMWxBD81zv78U
         2mow==
X-Forwarded-Encrypted: i=1; AL+hErFIiaCM7TJyREumpsAaJ5yIRmiV4qcBngIaaQ2OEjegNZMhebbqVCy91BeFKvXjPPENaqND6C5TTgaVwMndLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ua8AbIZ2PpAhhNgeuAlcusEyThWCpKWw4dvGPXwiU76vVULAW
	2Tsr5NYtVH+znP+QYe0vH+tKiTMr9a+bTakC6SOoPJ+g6rRLKuov8kNdzSioKyQ3sefdvPn8mDL
	FXIuoYbUGB2BaXTkOMQ==
X-Received: from wrsr11.prod.google.com ([2002:a5d:494b:0:b0:497:e67e:6f53])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f93:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb7da1c549mr137461195e9.16.1795103071706;
 Thu, 19 Nov 2026 07:44:31 -0800 (PST)
Date: Thu, 19 Nov 2026 15:44:30 +0000
In-Reply-To: <DMZ8NNSPL36I.15O2JQR7M65T0@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118233727.3147222-1-dakr@kernel.org> <20261118233727.3147222-2-dakr@kernel.org>
 <DMYTKRS80NRC.18PBQHK9SZ8K9@garyguo.net> <DMZ4C3GGD9U0.360KJBSFLEK61@kernel.org>
 <DMZ5HM326EKD.1I8KUFD65L91Y@garyguo.net> <DMZ6RL5X2UXE.33EY9MDLO2AJA@kernel.org>
 <DMZ7CHWBWU4O.3EA040FFBVCLG@garyguo.net> <DMZ8NNSPL36I.15O2JQR7M65T0@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119154430.918072-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/4] drm/tyr: name resource lifetimes after their types
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, daniel.almeida@collabora.com, 
	airlied@gmail.com, simona@ffwll.ch, lossin@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 02:57:37PM +0100, Danilo Krummrich wrote:
> I think in the end it comes down to personal preference, so this is fine with me
> too.
>
> Though, I'd use a generic name in the latter case too, such that it doesn't need
> to be changed once a second resource is referenced later on.

Agreed, using a generic name like `'a` (or borrowed-resource names for
invariant lifetimes) sounds good to me too.

Also, when updating this for v2, note that `VmAsData<'drm>` in
`mmu/address_space.rs` and `GpuVmData<'drm>` (along with `VmMapArgs`,
`VmOpType`, `VmOpResources`, `VmOpRequest`, and `PtUpdateContext` in
`vm.rs`) were still left using `'drm`.

Alice
