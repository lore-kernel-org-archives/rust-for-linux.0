Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4C421F10
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574294; cv=none; b=Jtwn16BH7Ve/HqXvQJJJNpJhsQhzMDHeME2epTzklUHu66DiUa2svAgDqR9BV6G2kCHCAD3/Sg/TSPqcYBZ5uYugHx8KGVlMP7d3JkEHHYsCa5MYVp4gfGOC3YG082SPPZls19SxFnsJ1+4X3fJo//iRYksOfGPzAp9p6SxPwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574294; c=relaxed/simple;
	bh=UVIqVMclZDr4qxCyNWMZ/qWloEXWIhQNsmxjFg/How8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ftSIXn0rXzNbCLhADKORHveWz7zJr9u4eDMowiciSQ0o1fEUMnlN7OuMTgf5swu2YEAeQy4XEGLeqrG0eyozMKX9cYte0YLJUBIhsoXPn9W6yrCOj/cZhTCQBML6EoeJf70+tVWmTwqc9lcPZdSq+T0nAXJJed1mEb4PRDjrQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KpP0bCD2; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KpP0bCD2"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-68cdfbad902so666282a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780574291; x=1781179091; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
        b=KpP0bCD2b/xDSQtHVikC8bBAVEkCDL8VxDlAKFX+lHSFzR0z81IFlJ+4uzRY/2Hgdh
         2inHTu+MDyzjmAaaTOzIWGTkU1fXI5fI3HBEuaXTBUMwvIRRJ+4ekBhknPlqKD37mxGx
         Le3XPZ5kcn1uVcxkXfDzMhg8LvjCM3c+7p6Bly6Pt3MpzHjj0wmaJYDbLkEkS2vWU2bV
         7i+QERjYZPVCQkqgiRkLy7ucx6Ln5Ss9F2TY5VL2t4eTx4j2/W9qzKt64/tmrN69UK/w
         6YD296c1YccmGZ3pvIeyU9oeaLG2h1YIlDzmbZfWfati3tijexUr+megDrQB24YwjofU
         y0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574291; x=1781179091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
        b=QCHjnX1FVyzDYRLJQxdvH45Qrwcsa1lnh9mNi6hxmNln1TgukhBn9reZQnoUuMBjo/
         QzfNC83fm3ilXG8MOR2GSFtOsqAV+K9pOSFn3IHyQJisczvbNZM4SFkIlq8X/KOeAAVN
         ImGx/8aMaR0/ViKhwCZ52QiAIs7DShSs3cZ7LGxYkQaWANn63aea6EJi1XGTKkFjAg6J
         29qMCnNkBWBCoHAxkzm6gM6z+YIGLl+6S6DuboRT0kK3TD8fK83H1MCLgTetwKl2Riz9
         XQ53gzUOgh0m+U7BQl7UV2aDSBFyi9f4LLWA2UFlgoW/sY8+8szrbdHU9wRwJwovik23
         AiRw==
X-Forwarded-Encrypted: i=1; AFNElJ9nqSnejoAHmrk4+ciJAoatfoZRgGdsV5CEY1oCbZjGoqnFrm89GPmZEGVPqJrfRNcN23eTef1+Am9IhZeorQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTJ+3pSglDgKKb/X3c5LkxiWagkT13uv89JCcW6X7mSU23juo
	JD04WC9wsJFaS7wCRDp5fcL+/7x8XDseBzsmLqBS9jx2itpw61kSa1nYsfiLqyKA2HagPuscGgc
	Af41mS0HAwe+0ReYsiw==
X-Received: from edrm6.prod.google.com ([2002:aa7:d346:0:b0:68b:163d:99f3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27cf:b0:688:1d5:44c5 with SMTP id 4fb4d7f45d1cf-68e6f79352amr4016032a12.2.1780574290900;
 Thu, 04 Jun 2026 04:58:10 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:58:09 +0000
In-Reply-To: <20260603195210.693856-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260603195210.693856-1-lyude@redhat.com> <20260603195210.693856-6-lyude@redhat.com>
Message-ID: <aiFoUauWYLz-Oyrx@google.com>
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 03, 2026 at 03:42:34PM -0400, Lyude Paul wrote:
> This function simply drops the contents of the SetOnce, given a mutable
> reference - since that proves we have exclusive access to the SetOnce.
> Additionally, update the invariants for SetOnce to make it clear as to why
> this is safe.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This isn't needed, you can just do:

unsafe { (*this).sgt_res = SetOnce::new() };

