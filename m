Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0D519DFAB
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771681232; cv=none; b=pStZe4LjRoeIGWTM6MblhfhvYV7jXVDfW0NI3OvANeN7rmsgQP5J1e+3DfCjZ9kWTBjbkWchAU6r9s6ocFDKYRUSiuC2ispNRS7aTZiO7hnka12gM46gHmU6LIDUsABbD1qJRWLuFQ59+oQUhi0SyR5gTK6X6zooa5igU/NYMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771681232; c=relaxed/simple;
	bh=Vhhdppl6PXRgu5oic1Lg2m5BEIK/ZSgBtlaghG8FF5Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tXNQnky/6jH/5xTsmaCOBtBe8IyhBbZFM/yZMpVroDA8b5wtXrSAR4NZyT/tdQSbXwIYdKXcxaAnridGtkrYJRBgHFybzHEnFgMUZgGrmI+Lr1y1sDPaxFFw9U8bDWyoO7S3kYt8GcBodZPcaHd1wdIhHcUEhTHAB1BGBS0MkOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lpCobC9e; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lpCobC9e"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65a43295689so2736876a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 05:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771681229; x=1772286029; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/f6N+ixFwHqdQwhwMZ2WjnEQYVFUNTbw/BLHS4peY/4=;
        b=lpCobC9eVTbEXRqCBoP8D0EQ7eR5i4sPQwmO4XS7dkMH4KDN4bFAK37jZp8wbMrfRz
         amLUyu0jK7HEG01fkhqlHVqv3eI/uu0WendXg2FOVNm11hTzw7Lgb1riseBXSe2Qs2E6
         /4U25HUHV5RauxruPqscqcP0Q5CGs6JJgxN6EU2fHxSQ3erm3u2vqG/kfFItLn6ppICY
         j2c+K7SM0ZLwjrQ+SZl3/KhYrGxUtLe58orSJ5DX/yHwaoGvrXdlUcwzk5n1dgBLWnJk
         zF5eYCijuO2sG0R0bCrjKHLrbwo57LAsnvUw8BA5LE9cYG0rmX/Zw95mKb1N9yt+KUAz
         AxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771681229; x=1772286029;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f6N+ixFwHqdQwhwMZ2WjnEQYVFUNTbw/BLHS4peY/4=;
        b=ioDLCytDcdid6DkF6IzxSOg3uEPNVGneux2HpKOOp2+pxFIgdF6YuBnrzUwkDgt5rT
         tkXZyPj8H4FbIApx0Kic5BfQIjr+cxthAv1MeyHdl2KUBLpzvqcL8XJL2GCvr+37GWZT
         Zaq3KdkTr+66gaU7qLESGQP/z417GmAM1GA+NmaPfFddfZL3//ye5JGjYeSYtvbbQqrQ
         oNKDPmupEpzdhgE9E2UAaV4NF/7PCcZrQ4wUsCxmVcLMQDbZ69gE4uQSkNYJ5u0nL+N4
         VaJQnQDXbxv8KpLnqSHU+a7jRNlMkdUuzJ/gU3YBi0xe2Bmv17Ecs99y5WyMgnLzpbs6
         8+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXbqNR1Vx8OfJDBi2RtZt5QEskVyItmkkA0anDIzsf0ZOM8OzhVkZ7zWZ53KwvGNsf4wH2bb8p0PdzYjdq6kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycrYRu+JuAUIu0zW/X7oxR5GlB44jTJjxD+8DoR/o7HPLHR7WE
	mSCoXIlrHhOvguFqqu06AHdyF4D1/4LDziinneQhQY2SLYx04pJ1Z+yQyGCmVsxBQF1IjZUS+Dp
	bZnfjAJ9Nx5sr1C+w8w==
X-Received: from edbev27.prod.google.com ([2002:a05:6402:541b:b0:65a:10ff:4ab])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:380e:b0:64d:3b22:a5c2 with SMTP id 4fb4d7f45d1cf-65ea4f24b94mr1700759a12.25.1771681229064;
 Sat, 21 Feb 2026 05:40:29 -0800 (PST)
Date: Sat, 21 Feb 2026 13:40:28 +0000
In-Reply-To: <4A56F56B-7366-451E-9B65-09B2EE16075E@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aZmUJxyZM3taMvAC@google.com> <4A56F56B-7366-451E-9B65-09B2EE16075E@collabora.com>
Message-ID: <aZm1zL1nA97zur0v@google.com>
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Sat, Feb 21, 2026 at 09:44:45AM -0300, Daniel Almeida wrote:
> 
> 
> > On 21 Feb 2026, at 08:17, Alice Ryhl <aliceryhl@google.com> wrote:
> > 
> > On Thu, Feb 12, 2026 at 11:11:13AM +0100, Boris Brezillon wrote:
> >>> +type LockedSeat<T, const MAX_SLOTS: usize> = LockedBy<Seat, SlotManager<T, MAX_SLOTS>>;
> >>> +
> >>> +impl<T: SlotOperations, const MAX_SLOTS: usize> Unpin for SlotManager<T, MAX_SLOTS> {}
> >> 
> >> Do we really need to explicitly flag this type Unpin? I thought this
> >> was the default if the struct is not pinned (and it's not AFAICT).
> > 
> > It may be cleaner to add `#[pin_data]` to the struct and rely on the
> > Unpin impl it generates.
> > 
> > In general, the default Unpin implementation is to inherit from the
> > fields. When you add #[pin_data], it's changed to only inherit from
> > fields marked #[pin]. By adding #[pin_data] but not marking any fields
> > #[pin], it will be Unpin unless any of the zero fields marked #[pin] are
> > Unpin, i.e. it will always be Unpin.
> 
> Why do we need this if all fields are Unpin?

Its fields are not necessarily Unpin. 'manager' could be any type,
including !Unpin types.

Adding #[pin_data] without marking any fields #[pin] is equivalent to
the explicit impl Unpin the patch has now.

> >>> +        // FIXME: Annoying manual copy. The original idea was to not add Copy+Clone to SeatInfo,
> >>> +        // so that only slot.rs can change the seat state, but there might be better solutions
> >>> +        // to prevent that.
> >> 
> >> Okay, I guess we want some inputs from Daniel and/or Alice on that one.
> > 
> > You could consider only implementing Clone. That way, copies do not
> > happen unless you do so explicitly. Or add a private method on the type
> > that has the same function as Clone if you do not wish to expose it.
> 
> Please check my solution where clone is not needed.

If you do not need to return it from the function, then that's fine too,
of course.

Alice
