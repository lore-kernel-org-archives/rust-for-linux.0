Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082BD3AE718
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450785; cv=none; b=eeosfzouvZLosztu70zw+7/S6i8MEwY8720IfZBBbyj0j9O3Fw3KqOwZmuBZyyAFHpxFkg6kMH2yIdkgMDEtnPw4PdcxaPACZcYJ9Y775mUW0QIhzu4INJdP4QqEY9Ag1DY5XPK0esYPphKuDlg0tHedp8xD4qdZHqacRgFQLKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450785; c=relaxed/simple;
	bh=LKuJpN2pB2b18H9F7deuXynJaKf97/KH2/2YaImR7qI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uda9Hmh7XbeHCVHNcAhRcgL3MKZx8GdmhkDhZmMIhQSYOMuYtTq16g5bMb81PFmSUf1mp5Mdm2+ryYactgKwH6+7uuaGXq8QiTi9Coo2kiMMGwJG2jLzW35cnki7YbVzfuaI0LH+zyZb+gpx6ZOPiv2+WgRMov5UwK3aL9bp5Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ci+O2VoK; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ci+O2VoK"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43ea7a5da42so6987346f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450782; x=1778055582; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UnWFkQyHgeOIkEs/wIKBFV9O4AMa1adBSTGrokeVPN0=;
        b=Ci+O2VoK2jGzPgGvfJ6aDZjwjXW1WdoBX8qfbSULAjO22b+Cwc7x12Rho4Clfkn9bZ
         mvW9AP7/TWXu9OLyFCPY6+9KyLglvR6LTr4y8LFJly+q9WsKu1h+y3LtfTJFqfamE8I6
         iviSR4Y/78bpqF0tACTfrX13VLy3IMaG77JYxuCltGMXrafIEz0JuYdb5tAP4YMoKJgO
         vxiuMmz2NjnxUyusCJSHWOOrqJezTWp870bd3PDY6sFP0AbtrP42yAKP+sxW3ewxfFS3
         OhpNMbcfmm7q1P0q1PxVITJPm9FflJMfGir/+JX5TqJzxOtzZ1MqwJJAuHTgQ2Vhx4Ey
         OMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450782; x=1778055582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnWFkQyHgeOIkEs/wIKBFV9O4AMa1adBSTGrokeVPN0=;
        b=s62oS2tAwEYbBln2ZFIlqqj7/QmsfG4hRHNMQj+z5w0iJR/5ReJHlzb6GA76eM4HK6
         x+b55toNVhs0dm3IUMQEIDVHgSjo4dSO35pimFEPy0aYUeAsNG/nFnZKAQCaVoTnWfKo
         np9zMdISYz+DXGeKbI0dGvGX+inkLOmnTCnrYKcqKGlX+dx1IKc8HghkOQLVZZcR31vx
         gnp35BgcrykjoZN/dpigFDIsNI60q3DK+70qwZOcaXZtwdcOn3xFT12pRZrI3sjp1Pod
         5pSze68wV+Z4FMZDLSGu++h9fyu9n42yvLklDt8ZKm6julve4yBXNSkcrenJfSjPaNpu
         seow==
X-Forwarded-Encrypted: i=1; AFNElJ8jkl9UzOOgJWTILMnohtFFQBC4zqo2Oi6O9YXxHX/4PYdv5eP2veB/SPRTT1CCQRaPPacTDPQMifMmky2OFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweZFE9xPE3A8/0zPkPLPOSeMWHoXhLzP72jq58OW+80414ZMKB
	z79Gkw/ItjfRp3B1bY79GoX4zgTVlhMwZAnFq9ZLplN4gBAVV2p2WDNS0xOBaL+78nL1Y0nDkk+
	SNPlRU7CP/rUSV0cZlA==
X-Received: from wrve6.prod.google.com ([2002:a5d:5306:0:b0:43c:f94d:a0b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:616:b0:43f:e43a:d85d with SMTP id ffacd0b85a97d-44648f28d2amr11438300f8f.3.1777450782265;
 Wed, 29 Apr 2026 01:19:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:19:41 +0000
In-Reply-To: <20260428190605.3355690-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com> <20260428190605.3355690-5-lyude@redhat.com>
Message-ID: <afG_HUjCMH2qKjPS@google.com>
Subject: Re: [PATCH v13 4/5] rust: drm: gem: Introduce shmem::SGTable
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
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org, 
	Asahi Lina <lina+kernel@asahilina.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 03:03:44PM -0400, Lyude Paul wrote:
> In order to do this, we need to be careful to ensure that any interface we
> expose for scatterlists ensures that any mappings created from one are
> destroyed on driver-unbind. To do this, we introduce a Devres resource into
> shmem::Object that we use in order to ensure that we release any SGTable
> mappings on driver-unbind. We store this in an UnsafeCell and protect

Outdated? No longer UnsafeCell.

> access to it using the dma_resv lock that we already have from the shmem
> gem object, which is the same lock that currently protects
> drm_gem_object_shmem->sgt.
> 
> We also provide two different methods for acquiring an sg table:
> self.sg_table(), and self.owned_sg_table(). The first function is for
> short-term uses of mapped SGTables, the second is for callers that need to
> hold onto the mapped SGTable for an extended period of time. The second
> variant uses Devres of course, whereas the first simply relies on rust's
> borrow checker to prevent driver-unbind when using the mapped SGTable.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

>      obj: Opaque<bindings::drm_gem_shmem_object>,
>      /// Parent object that owns this object's DMA reservation object.
>      parent_resv_obj: Option<ARef<Object<T>>>,
> +    /// Devres object for unmapping any SGTable on driver-unbind.
> +    /// TODO: Drop the mutex once we can use Init with SetOnce.
> +    #[pin]
> +    sgt_res: Mutex<SetOnce<Devres<SGTableMap<T>>>>,

As far as I can tell, you don't need this Mutex. Also, it causes
problems like requiring the reference transmute below.

Alice
