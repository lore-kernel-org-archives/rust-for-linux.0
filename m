Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D73A7F6F
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449960; cv=none; b=g5VrBgTRlZsJLN+rvWdS2M7glU8jOVg23bD2MEaP0CS2Teu7POpCWtcmm3lv0fHNZz2Qwqz5QXE7auIkMNYmSUDS+CUhKAkM7RnIK1Udf5eK9efz1OEWLl6ATBkCG4ySDeFdak+99KSXDk7GFGzlrIyckA5qZeue9HzqEWRHE3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449960; c=relaxed/simple;
	bh=7PKamtfmq5JClsXy15li/SjWhFAvdUqut66TbU8qjjc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cf33wLKECL6Hj+P12hzoCnTIg9J0ln8M5Lhz/r+hhuJ5rymEPW3cF9ePpr3fR1VRZvZIysH9BdezYYKGd34vxR4qDhizdigX4iQaFZtHRuNaHJ1zdOW+kv9mh5/CaqNsLD002d36AcA1EKBq61t6uILC/9BllIFXPbehczFLzAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p1Wsr0XN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p1Wsr0XN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48a589c7879so4276315e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777449956; x=1778054756; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6Sri/DxWYhekkoJhKaFCAGZ5nRi8N5LN4MWLa1I+oA=;
        b=p1Wsr0XN9r8hw6Xc3Tc73Ouyx6KJzolyn+dIRO8DR9s2G35Zs+4fhY803DnC/gAfGm
         VhGkYrYyPYjP29V3gR+ADRsaLKVo+dxShewfuOVC0pe9c4EmD6Xj3LDAPtOg2iuDEoh6
         F3w/Rxgs/FKIdc+KiSNw2xb5mgmLAuXNHgT5ji649O3VFiELCNhZaa48wAvLx3HhwYeN
         zeGDCwE4Tet76hCbjSWRD06Ys5sIOJy+zI3bpttBAAR20xkghWfvLkyYYhvkLJO5+u/Y
         CBXl1715Y6/wdXBS6/RIxff2o6ceCBiBWI0/X5Xy8aejhq4BAt2IWQ/IigBXYd4NzFI+
         +YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449956; x=1778054756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6Sri/DxWYhekkoJhKaFCAGZ5nRi8N5LN4MWLa1I+oA=;
        b=ZYZdMKG29/p/GGKX21TSTrz+0axx0YYtn8iki6hUYr1235N1cRMHpJYzNVjDUEOXQE
         K6Vqsts0EPvv2nNbyUbrk3xdw9D6vO6bk5Hg3LOIRfeM6XScPdfS55jJV+tzTI5oTm57
         Tbl6+ZyAI0BrPUv6xqaoJA7HJnWMX4SsYoSGphG59K8xQUEuQT3rSO0/p4ulJoBV4oDj
         FAJlV3zD5o4XRQlM6XY2ILm26YAz4okJfbbF9kO8pQ6UBK237oO6x/eDpnATaHfk5CDE
         j5npy5ixjjXe/JMZBZ1KUGtAcnHEOGVMsl72OEVFl+OkMurOj/OiN25UdE9ch96ymbPT
         Xsnw==
X-Forwarded-Encrypted: i=1; AFNElJ/sRgkB6ucys94W0CPuv28JEdsoHUDFpCxTqXzrj5WVPum8/AysQ8CwCjaGZqhlyNmqEhlhBxl+shdj66nQoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhIIhSifeNCzY+52NXSn9QJieTnf2e74GlR5nmh3QtQ/nFA145
	G20ILXKwuPcTHeAlmWNM5qMvMFUuS+yceteKxl7zdA17YZn4//uWhODpcDkNvL4Fi7OzYEjfyeE
	PtmRjIhR1GgaREhEbCw==
X-Received: from wmkz21.prod.google.com ([2002:a7b:c7d5:0:b0:48a:5351:7e80])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8012:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48a7bfb4564mr34552015e9.10.1777449956055;
 Wed, 29 Apr 2026 01:05:56 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:05:55 +0000
In-Reply-To: <20260428190605.3355690-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com> <20260428190605.3355690-2-lyude@redhat.com>
Message-ID: <afG744xkGUZBgNth@google.com>
Subject: Re: [PATCH v13 1/5] rust: drm: gem: s/device::Device/Device/ for shmem.rs
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	Matthew Maurer <mmaurer@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com, 
	Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	linux-media@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>, 
	Benno Lossin <lossin@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 03:03:41PM -0400, Lyude Paul wrote:
> We're about to start explicitly mentioning kernel devices as well in this
> file, so this makes it easier to differentiate the two by allowing us to
> import `device` as `kernel::device`.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
