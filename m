Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4B43F9A13
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663581; cv=none; b=mYQiGZ2/JiiduhW6LGy21F3y3PhWZfUttiLXiPfrEQdt62Z+zP3RWNl9PiYOudzy0/UjoMrljghuS0SbXrhzex+07iVicRdGYPEGYyc5sf+5m1KN1P+L6ha6IZtixO0ZZ5JBmrwepw0hsOMAsZUv4h5Jl3JVMG6wbYexr7blfCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663581; c=relaxed/simple;
	bh=dVXl6lxM0U5IiUrE7TAMJxdP/3mIIyn0R/8BpMKopKU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u/9XuS+mduiZaYMfC+OgtVtAEE4jEyNzMGGogUiFvQvXCKxK4y1EIgsI8ExFm37VLiFF64eAz8+LIsMJFF53RjEQAUh9b22Qv6PIbg9KZGXV9aQiHKiDMBV2n63Gl/V/RZ31thI7gG9NneXUP2YGnQn2UsbZ1cJSloQypHpSimY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r/4wL8nd; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r/4wL8nd"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4955843c6cdso39632865e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787663576; x=1788268376; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXohTk4GdfSVv1B1Vj6jhy4ehfsGqcW+TXrVTAjc0Ko=;
        b=r/4wL8nd05EX8mygL3SoK7PkZKC3LyvPIuQXFKOIW41u01T3Lnvrq7sEo2IZS6bNXw
         UVyuCVhM78swflDgDhf7z/rn/8diRmJiJY31XPj3YKmR2XfqZOBPrB3H5Lw9i0sNjTSC
         /6KtR3w9/NZuaWG2pfQ5qsPDGCW0SBR+PDu1lRwVwX6ldCqmiQ7hIICqGczGRNC/6Y1H
         zEzm5FXAI1pZVgw0kkJL+Fdtvw09mMyI4kWBFDE8OSZ1gxTJUzQtp10QoRLr0faJhOD6
         yQN1HejroFa8R+206+IqBnN7p/xpzje3X4hCzKcAuJ+Sk8UOxwsFrdKBI66a/fr8E7D0
         mijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663576; x=1788268376;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXohTk4GdfSVv1B1Vj6jhy4ehfsGqcW+TXrVTAjc0Ko=;
        b=TfhyEmbOSN/j8MZLZCE3xbM+2Y3hh/y8SOly8Py+7KVI69rHqGRoM1bG/LiOytRohC
         QL5AstH81+yhX2TEzgmzjYm1SwmkFPqzPEDvAzMCEU4R8DDvYfx6cCZgcqpVijwhMTgS
         Gcjq5LYatoojcMRxMokkzhx2PlyOkXLyPZAJgWSk0F9b5KhPOsRxkSvJdEvwO6EfKIgm
         3UcfUlnTuzpjO6PiTQP9iwFvcXWJeKxcYydZhHiXUvKVSPN9BacdVDza8vULR+eSvFZV
         iY6gcCGwoQK8fPbW12Z/Bzq60PnkRTRoXzrP570L18t//G0ys+iZuaflHKLeEvFfOXm9
         4LMA==
X-Forwarded-Encrypted: i=1; AHgh+Rp69zVB1YUZ6WJH6feFlPPQexJlRIDYtJNJIC+bTj4TLRLoZHicSSyq1OgjZ0xSqM2562olamsOscDBj28law==@vger.kernel.org
X-Gm-Message-State: AFuF++mWtVtsCNa8ELEq1BBk9rB2KLZNusTnOoEERAb+Fwh2wDn3TSQs
	KQy8NCcOuTjd1Q7CaxLAcya/v6w9C0muO++pzNsMcbBiocJ2sa8eyJQju9gUeGpPfMDmy4jRKkn
	dt5KYrdJqmjPVZpELaA==
X-Received: from wmoo2.prod.google.com ([2002:a05:600d:102:b0:499:58e2:b51f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b9f:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499d652362amr77858225e9.12.1787663575869;
 Tue, 25 Aug 2026 06:12:55 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:12:54 +0000
In-Reply-To: <DKXZ7VHUCLWL.C6IPHWPTEJW4@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
 <DKUHJF1YTTY6.1XXC1L2SYXEMF@nvidia.com> <DKXZ7VHUCLWL.C6IPHWPTEJW4@nvidia.com>
Message-ID: <ao2U1jNaT7waibJW@google.com>
Subject: Re: [PATCH v7 06/10] rust: id_pool: take a NonZero capacity in with_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 25, 2026 at 08:09:13PM +0900, Eliot Courtney wrote:
> On Fri Aug 21, 2026 at 5:39 PM JST, Alexandre Courbot wrote:
> > On Mon Aug 17, 2026 at 4:04 PM JST, Eliot Courtney wrote:
> >> There is no good reason to allocate an IdPool with zero capacity.
> >> Reflect this in IdPool::with_capacity.
> >>
> >> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> >
> > I am not sure this one is justifiable; `KVec::with_capacity(0)` is
> > doable, so why not here? As long as it doesn't introduce soundness
> > issues I'd say this is the caller's business; a driver with a legitimate
> > empty IdPool use-case would now need to special-case it.
> >
> > Now we do have an actual soundness issue with zero-sized IdPools, which
> > is that `find_unused_id` would panic with `CONFIG_RUST_BITMAP_HARDENED`,
> > but as I said on patch 5 I don't think it should anyway. Another
> > potential issue is that `grow_request` would not grow anything; but that
> > should be fixed there by handling the `capacity == 0` case. Actually
> > that would give justification for empty IdPools to exist: just like a
> > vector can start empty and grow, so can an IdPool.
> 
> I don't have a very strong opinion here but I can't really think of a
> use case for a zero capacity IdPool. Unlike an empty vector, since
> IdPool doesn't automatically grow (there is a notion of a fixed ID
> space), the only thing you can do with a zero capacity IdPool is grow it
> to non-zero. All the other operations don't do anything useful.

It may not grow automatically, but that's only because Binder (which
will grow its IdPool) holds it in a spinlock and needs to use the
PoolResizer and so on to grow it without allocating under said spinlock.

> If such a use case exists, maybe it'd have to be something like you are
> using the capacity to identify your ID space size (and the ID space size
> is important otherwise you would just use IdPool::new() with the
> MAX_INLINE_LEN capacity) but then the only way you can grow it is via
> grow_request() which doesn't grow the ID space in caller controllable
> way.
> 
> Anyway, let me know if you feel strongly about this one. FWIW, previous
> to this patch series you couldn't construct a 0 capacity IdPool either.

I feel strongly.

Using NonZero to prevent passing zero is a very strong mitigation due to
its big ergonomic cost. There's nothing really wrong about a
zero-capacity IdPool, so let's not pay the ergonomics cost when we don't
need to.

Alice
