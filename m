Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96587081A
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823697; cv=none; b=Wg27/rRZaOcFEYtYyjR7qBkFC3hzKSDdgkOSQuPU17eazy1CqE8GSoDHzVFFmFgVUDITXMSr3ZO7se0X6lQ9hrUfaO7o1/mepmJWdRxWUan9Au3l2sx5bJq/y1QM+11W44Ia/WmabAus9qj+A2wEtbEcMtjbxBdQ74BWMa9jPvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823697; c=relaxed/simple;
	bh=aO8W9arBSFeTzB/wHZF3Gt2mXxw0rJsv3DyUpwy8Zvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fD8vEecUkiWlO3EmC2x5OqpxYCVyfyVLV+3mJEko9ZkcxKE74pV8SJl/n+tgpZ3ZlDb5m5rfENjjR6+JQlb8btCANv/yQKdb1jjkcAULlDlbTQS4zDsXqYhn0QLOzxnpV0jFT5R2Hj5UgyNq5TW6ugkoFGCDh9U7ymJ36BD7eX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eHus+8Cs; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eHus+8Cs"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43768e2aa4dso3214584f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 07:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770823695; x=1771428495; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7wCBvgeAuRU2AgOY0dYBW2S0n/KzwtQfSNAU31kHXk=;
        b=eHus+8CsZEw0WuUT4a+AGRiwXsN8LkUsn13qV8r8ZsCN42tQmDd8Bx97/hBPuVf+K8
         lo+5E3uGG24KBqCTw+mKMYhPN33kgPmE1wiru/xA2LtDwlUg5AfCQxszSD1HTXsfbEQx
         KGRh49+LLklWGrevYAA3Ve3CMUDYuk4lyBUXxirHq6oTT49SlTYlbhwEsPSjaxgKdYtx
         dDLssAeWHZwMRlc+gdUoNiEmDCHkvTwDRIrWrw5Ruio7Cg4YJPhuUVP3+200i5i+5c3A
         klsQuJmxM88IwG9wyun2KjkTGupq/GxIWQAf5QWnqmgqIrIZudFql2WGek0keuedMo7Q
         4Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770823695; x=1771428495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7wCBvgeAuRU2AgOY0dYBW2S0n/KzwtQfSNAU31kHXk=;
        b=oNMf+ZpvEOBB479OcHuUzDjjYT8cjKYVoHZyt8xT/1S8ZN/6KLAiqSf6FuwUoFqHN2
         igsyA39bOg/77VJkw1yHPVRtGVUKFHqHJFONHJWiCA6gDu7EO7n+vR73jQBa3zS5xeik
         4LlYsSoEZBh/eRoDNuALz/ZNPG5oIF85JTOr5auUmICRIxY8S7O04Ihmx1Nj8ONUmysP
         pnIXtBIrFccGcuMyjQIWOvB9IqWTVxg3I0/aqaxjXvxwIOGXG5H3CU8ixgjZXfKCi1fN
         5phABNTLoDV2aETTmxnHK+L6uyF5czuQGAAmfQ3AVv5o9Hgztcir8gqdV7AOdOb3yMfC
         KApg==
X-Forwarded-Encrypted: i=1; AJvYcCXrbnWiHXsjaO+x63P2Bg19QN8nWT6DG+/2t0C5s9Un5TUKPmpyDhObIHaTK/4Q14TBClSb3exI/U7vEHTCQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJbJfqaR/uxQ+R6Jm4oJ9UsbXzCsylC3oLZXSxp/rZxCVEbfgG
	RZBlPj+oVoVkfnvykR6FB0Y+wjxZMFplwDEM4AyHPGZgba6Mt1whvm6hdy2Sw1Ebb+qcK1285Wc
	UOYx9oPoPizaWIg+1HQ==
X-Received: from wrbgk4.prod.google.com ([2002:a05:6000:3104:b0:435:c099:c167])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:61e:b0:436:3267:3edd with SMTP id ffacd0b85a97d-4377a531914mr9582059f8f.22.1770823695071;
 Wed, 11 Feb 2026 07:28:15 -0800 (PST)
Date: Wed, 11 Feb 2026 15:28:14 +0000
In-Reply-To: <535d0c8637319f14f2d104a928a75ae872be8786.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org> <20260203081403.68733-5-phasta@kernel.org>
 <20260210155750.5cdbe6cc@fedora> <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora> <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <e4f3ff81338dd738e1c6d81e255c129c07e9c7fb.camel@mailbox.org>
 <aYx7d21_hIWP93XW@google.com> <535d0c8637319f14f2d104a928a75ae872be8786.camel@mailbox.org>
Message-ID: <aYygDtrcQjwamJIJ@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 02:53:49PM +0100, Philipp Stanner wrote:
> On Wed, 2026-02-11 at 12:52 +0000, Alice Ryhl wrote:
> > 
> > Yes, many people assume "list widely used in kernel" implies "list is a
> > good idea". Unfortunately it is not the case.
> > 
> > > > This applies to the red/black tree too, by the way.
> > > 
> > > Can't fully follow, you mean that RB trees are supposedly overused,
> > > too?
> > 
> > When I first suggested adding red/black tree abstractions in Rust
> > several years ago I was told by Greg that I couldn't do it because the
> > red/black tree was deprecated and no new users should be added.
> 
> Do you have a link or sth?

I could not easily find it again, sorry. It's been several years now
since that discussion.

> First time in my life that I hear that RB trees shouldn't be used. If
> something is deprecated for good one would hope that's obvious.

I'm not sure what the current status is ... it may have been somewhat
walked back and is now a "some people do not like rb trees" rather than
a deprecation.

> What's the justification? Should everyone use the B-Tree?
> RB trees are super widely used in CS. 

The justification is that every time you follow a pointer, it costs a
cache miss which is really expensive. Using an xarray or hashtable or
vector is much cheaper under most circumstances.

RB trees are used widely in CS because they are one of the simplest data
structures that provide O(log n) lookup. Such analysis usually does not
care about constant factors.

Alice
