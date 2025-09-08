Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96502E7F30
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 08:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319978; cv=none; b=nuqk1g/sBQjNHMY7OZf4GV98RL+jjQFYhFIU5oZaJFFJfbkoOWWZ25F58ylWSQJrhrkK5bLQWn8v+RCxUlr1koNMyDxgTclSlRkOlWXBmCWkCmxz6zdymze6ERZz9jGUpX08e+OX6cOrFxYzlKsdVyWXMb9vhefxS8U5XYOhiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319978; c=relaxed/simple;
	bh=NfChDlPQciIC+1B7OdZ8eNEFWh03PC9SN3/pspEyN5g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TjEfaFAX3+Vu2O9VcnCIQzBz8Pkkbf8833QN2/yAsWxLtV5FzaQG/fZcXDQDAbeDW1iofBzKSCD7nWs8Ai4Q23ebEzCr+8LWPeg/O154+AxKk9MRPlD4Hcxg5e+70aNvn4LGaBCDE6wUKfGVJJC9zCV7A8KQ200s7SlEsqaQhCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FqI5+QRv; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FqI5+QRv"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45b96c2f4ccso24185895e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757319974; x=1757924774; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OnHARbdkEp4PUIEXLxBi52Eid01cJA5Jgk1L/pOVvBU=;
        b=FqI5+QRvlo5tuLzsO9oDlBChWUTwzfi05FpKgG7/9wybeieaRguh79dHozcqL+Dhbh
         ANLbWhPtadbEzN13GcHWsbHL+hdOWPHouPFjnr85my2bYb8f9HmN2smUYGNafccOPQc0
         82V9p9z416kOeC0yH8ZInfGy7NkwTIqUCQ/5hSaMelcI9Bxp8kq+/rJIJgQHZ9IUVu9m
         AjSWkeoL3GZJPsZZzFQhzJb0d8LCXJceB8pW5DZMOhdtM1FEOGrvephHG6TGTjjXAoD4
         AW+k0rI9JtDeIkk5aTgSGnMTA3GKCQny/p5os01n3BXXFDS8xAlYlRElxYv9ghjWrMjF
         NCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319974; x=1757924774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnHARbdkEp4PUIEXLxBi52Eid01cJA5Jgk1L/pOVvBU=;
        b=bZbY/nLzW6JwJTyLmAEaQlvbWjdN9eZuqJgNz7YeeQChk2CKAHQw2aotyQoPp1msQx
         qoXIF3dpWpzapTdAr4mdoxkmEu3fu0Y2TptcM3zGcDdZadDYIuI+tbXUJha5W9Eo/kVm
         VVZwtcG3iLGR+1g4WTPWAr6o8J9TI7fktOUzHKCEwqFYm8VTspaB1ZflwY1/1FFlxOtR
         yvxlJJOg/7xRxrpoXcWwKKB1heTcy+Gxj7i/kJVm7t7PzxtJT1IG9/jO8AkI6IjTOdnG
         4Rynq06U4ZQwh0P+JcYEaTyTDBtdqskpTlr6jNqyWqGRJErSlETdcPYZcVHCAsx/1qv3
         tK9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPwETseu0aCQV+liyyODRHnBzuURizalJ/DfUpp98R+FVlNgSKnT713XWVU6Bwq6dbgNGcT9b3fkjmyW9xQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZqkXWXr6he+b9ARnPPCRb1SWYlOlf1r924gJwHxKJph/IDoa
	9PkDsb4ibvwLBMlpItn/tRTMdhUTrT1YMIflTPG3rmdSPm91RdW7JinotbpX9xAWES0SYsfo/mx
	Xg3JliImMq4achY4l/Q==
X-Google-Smtp-Source: AGHT+IHmAGS9iw5p+qpRXfi08CMknpisf8y9SJ/Rv5N3Oluu+SFLgdV4jan6x32Afnezxx99GFjYRiK5SIRpfUE=
X-Received: from wmon9.prod.google.com ([2002:a05:600c:4649:b0:45d:d1dd:6750])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d24:b0:45b:7185:9e5 with SMTP id 5b1f17b1804b1-45dea7a561dmr4688775e9.5.1757319974085;
 Mon, 08 Sep 2025 01:26:14 -0700 (PDT)
Date: Mon, 8 Sep 2025 08:26:13 +0000
In-Reply-To: <20250908091140.44856fde@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com> <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org> <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org> <aL1u_YxOkuj1kIq6@google.com> <20250908091140.44856fde@fedora>
Message-ID: <aL6TJYRmWIkQXujj@google.com>
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 08, 2025 at 09:11:40AM +0200, Boris Brezillon wrote:
> Hi Alice,
> 
> On Sun, 7 Sep 2025 11:39:41 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > Yeah I guess we could have unlink remove the gpuva, but then allow the
> > end-user to attach the gpuva to a list of gpuvas to kfree deferred. That
> > way, the drm_gpuva_unlink() is not deferred but any resources it has can
> > be.
> 
> This ^.
> 
> > 
> > Of course, this approach also makes deferred gpuva cleanup somewhat
> > orthogonal to this patch.
> 
> Well, yes and no, because if you go for gpuva deferred cleanup, you
> don't really need the fancy kref_put() you have in this patch, it's
> just a regular vm_bo_put() that's called in the deferred gpuva path on
> the vm_bo attached to the gpuva being released.

Ok, so what you suggest is that on gpuva_unlink() we remove the gpuva
from the vm_bo's list, but then instead of putting the vm_bo's refcount,
we add the gpuva to a list, and in the deferred cleanup codepath we
iterate gpuvas and drop vm_bo refcounts *at that point*. Is that
understood correctly?

That means we don't immediately remove the vm_bo from the gem.gpuva
list, but the gpuva list in the vm_bo will be empty. I guess you already
have to handle such vm_bos anyway since you can already have an empty
vm_bo in between vm_bo_obtain() and the first call to gpuva_link().

One disadvantage is that we might end up preparing or unevicting a GEM
object that doesn't have any VAs left, which the current approach
avoids.

> > One annoying part is that we don't have an gpuvm ops operation for
> > freeing gpuva, and if we add one for this, it would *only* be used in
> > this case as most drivers explicitly kfree gpuvas, which could be
> > confusing for end-users.
> 
> Also not sure ::vm_bo_free() was meant to be used like that. It was for
> drivers that need to control the drm_gpuvm_bo allocation, not those
> that rely on the default implementation (kmalloc). Given how things
> are described in the the doc, it feels weird to have a ::vm_bo_free()
> without ::vm_bo_alloc(). So, if we decide to go this way (which I'm
> still not convinced we should, given ultimately we might want to defer
> gpuvas cleanup), the ::vm_bo_free() doc should be extended to cover
> this 'deferred vm_bo free' case.

I can implement vm_bo_alloc() too, but I think it seems like a pretty
natural way to use vm_bo_free().

Alice
