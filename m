Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9806C1C8618
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739969924; cv=none; b=QOK3btSoGL4jvCAfedUWhhGddaH/kuUQ0pDkkUg7dXmfG9uYi0W90WQazDdrTgwpaIC1YPpYtA9yFzLlt1MctvPX8+NU2aa1M7BCRN/KecHDIVvotxV4myl4RhqvXLUeZGbugWs4QxtPALNU7GmctCzv6m6aGYE5o3Pt1OV3MYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739969924; c=relaxed/simple;
	bh=mFyDWsE7J9ZW8FmEHWh+K0Jf/vn8Ov7C5joVUJWT04s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUKAQinUMtuM9XGy6mFSL1aLBA1OwQQ5DusHaQ+PziTMoTwQ0nPyM/hc9GxBNo6arlLJhlDt65GRpI6awWSTD+ifb1dlLHxajrj4qrTEWuWogIqN4C4n7hgJnW0Jm4QRHiU26Y0aemf33NUat5y9amTEyjIYEyfty5D1BWeumpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=PUcv/jhy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PUcv/jhy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-438a39e659cso45936645e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739969921; x=1740574721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34sVOinnrdUpopDeZt0X3vBKN/d5vCnq4SYbVGcMLpU=;
        b=PUcv/jhyl3Oz6a/O1c1xGJ+/KgQnUmo4aS5WPqLdqL2WlkrIn/d+/EVQlccO5XTQob
         cHeZrc52ut8+SfxHGobx+afvEacmOi9L8BbMJ8Lldcco3Grs7QKdI45xyLC/G29NYckN
         lvbZ+nJ8J9VPLZZyXCqQfOk6S7fXWlQyUDtiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969921; x=1740574721;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34sVOinnrdUpopDeZt0X3vBKN/d5vCnq4SYbVGcMLpU=;
        b=nfFWVjMB6RxCjaYApvPAPSaDnSpWPKtTOH8iZPyGNuwnS3JVIfFmDZNNkod/IWqpxZ
         YX4sq44XB/RmnrcJ0vnP/U18oaK4c7ju0WLoh6TKq16VmHRcC4CfPlh7AoYWYWAvi/Q0
         VU4VkXTfLZxNE7GNtqdAZKqTyYq11jajSClgJEX+WCRLegxJWpJs315PZc2c843a1vxs
         UiMhZecNZqi5p4FZgmXUMWESMZJI2xVEj7/3OFX8c29RBpS/u7Umlz+dt/8Y4jMlOmf/
         2TdR0hS/963oJQTE07mtz3baMn6A8/YnMfbaBYpycH9G1WlOhaqFDDs4I0tYQfKuifiM
         Hrpg==
X-Forwarded-Encrypted: i=1; AJvYcCWhg5XlsjZPvDaGdKMK6Bqfoa2jEE3KhMC7I4EFQpCzLxyFPD992G2pqxqQNisZ2qeS5DgOvntczaZiJg6QKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuqQy4vj0ChaYdGgN/qZucaGcDlgvpLx6u1VPeVZ8qMkBrw54q
	3FJ/fHq6nns3DEyXSHfqjxXJi14a5ZZUB5fLs7cQ4149jbzZjmOQpI59x2xBLck=
X-Gm-Gg: ASbGncujIjQRXbT893boG9M0DJobcdwuE039cP/G49yb2f3Bxa0Ix+NCn8wl98E07Ju
	669ljchw70oUZSiaV2HxV601tjeIuygLxCVvXLZ/fD0/yD0TGOZAZV/oOy03q2cte/HMnK+wqXt
	EGVTg8pQsFSppWnttmvx9qHhHqO5+39CQdv52l/c6SQF3DDx/C1xOHzrtuP7GtYRxORvVy2yzu4
	Or994+3Ac035DAnhhJUbnj0nm906DXb6ee/x687JFjGSClsw1LTmcS6gSgla0vxfb0JMIkFENyI
	bbBbfIbwwKuXlh7bGdwUOPhm94E=
X-Google-Smtp-Source: AGHT+IGzbUBUg/56lBAekqPCOphT5RTECYUG5Q84fY/+IOL0ZwxmdTe8Ny3WUiTLHfIX8hhDw7t+4Q==
X-Received: by 2002:a05:600c:1c98:b0:439:88bb:d026 with SMTP id 5b1f17b1804b1-43988bbd48cmr104447115e9.5.1739969920700;
        Wed, 19 Feb 2025 04:58:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7c7sm214383535e9.27.2025.02.19.04.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:58:40 -0800 (PST)
Date: Wed, 19 Feb 2025 13:58:38 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7XVfnnrRKrtQbB6@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
	Dave Airlie <airlied@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <Z7RgOd_57wcSUyB0@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7RgOd_57wcSUyB0@pollux>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 18, 2025 at 11:26:01AM +0100, Danilo Krummrich wrote:
> On Tue, Feb 18, 2025 at 11:46:26AM +1000, Dave Airlie wrote:
> > > 1. How to avoid unnecessary calls to try_access().
> > >
> > > This is why I made Boot0.read() take a &RevocableGuard<'_, Bar0> as argument. I
> > > think we can just call try_access() once and then propage the guard through the
> > > callchain, where necessary.
> > 
> > Nope, you can't do that, RevocableGuard holds a lock and things
> > explode badly in lockdep if you do.
> 
> Yes, try_access() marks the begin of an RCU read side critical section. Hence,
> sections holding the guard should be kept as short as possible.
> 
> What I meant is that for a series of I/O operations we can still pass the guard
> to subsequent functions doing the actual I/O ops.
> 
> More generally, I also thought about whether we should also provide an SRCU
> variant of Revocable and hence Devres. Maybe we even want to replace it with
> SRCU entirely to ensure that drivers can't stall the RCU grace period for too
> long by accident.

The issue with srcu is that the revocation on driver unload or hotunplug
becomes unbound. Which is very, very uncool, and the fundamental issue
that also drm_dev_enter/exit() struggles with. So unless the kernel has a
concept of "bound-time mutex only, but not unbounded sleeps of any sort" I
think we should try really, really hard to introduce srcu revocables on
the rust side. And at least for mmio I don't think any driver needs more
than maybe some retry loops while holding a spinlock, which is fine under
standard rcu. It does mean that drivers need to have fairly fine-grained
fallible paths for dealing with revocable resources, but I think that's
also a good thing - mmio to an unplugged device times out and is really
slow, so doing too many of those isn't a great idea either.

Ofc on the C side of things the balance shits a lot, and we just want to
at least make "no uaf on driver hotunplug" something achievable and hence
are much more ok with the risk that it's just stuck forever or driver
calls take an undue amount of time until they've finished timing out
everything.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
