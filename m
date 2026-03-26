Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A4940244C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540560; cv=none; b=WHQe13L9pNf2iFP/bVEhK5BELsGTL5VE6V2FMqAC4x/1K4MxsUcam0kLwosVCn+eVq7Azct/A4njk7KS99SWkwjjHbeW+uUr5H3QB8E9aD+93w5zfgSY4PHY6yAEq7Zm63oX8Cy5R6rM77T7RV6zmtXUoWSzLLMTT8SSGabaOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540560; c=relaxed/simple;
	bh=DikEZ7B7hq2/GYDhSCsPDeB2AcUuNksNirtYZehrxmA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ig2V+dptsHRJXbEwlgWl33DT04Lw5cXlfkAZah6ihocrJAPIrebHetlCnaxgu68rFUNNInXzIXR3WlGDDVu9q9p72Zafv3VQuwudT5M7mVyuq1gzaPBfssu/4sL17uIZKAVkpZ7Qo9yD857uCb1yg4Obyq+/qfLOax+L7HUqGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NnwTb9B9; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NnwTb9B9"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48722073bd2so5907915e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774540557; x=1775145357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=92aI30dHVxWTjN/LfnKmLTPU0BYok68bxkN3Q6QaYwI=;
        b=NnwTb9B9UP05u7G+vA6B2qvR+Km0BhyvSqFn89qs0Cah9yVsc/t6ro7x2IeW4G6vol
         rbhc26PLXSwet8Nft4CZSgP5vA/jTQvg6DATd8jv5UyKTh+46suOxTdgAKgZ7X02U/OK
         mkBRBDbgCpvGGRMMxQOQ5xEGzrfj6yJuQMj8S8WXZvGnltK1oCaZjK+JMdyD38UmKerf
         S5jJq7QTWXbOh0opvr2Is4DX66o12I0cHpafcPuNLNTjZxUokGQB8SmixNll6tK6E7Xu
         TQOZp4KA1cpdq+sZzlHCoaZoq79o/ius8gRnJAp87Yl3QyTsgv2nzLrAG4atFtp6G+AE
         BI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540557; x=1775145357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92aI30dHVxWTjN/LfnKmLTPU0BYok68bxkN3Q6QaYwI=;
        b=qN4alzv2XC0vcmrpbMYB7LCgTZoDOSYeMm3DtBM4xBybg1KvnXgFS+UnI3IzagXyd3
         zfjFOx9VVJPTCmPsMdP/R71+HH6yORxxOHvJ+ZRODk/NENc/gf3PjvHKE6aAKUc+1GBR
         wd+RNMM6hgLolabjM6fvPRzWQdBbuXJvs/7RdaoJcYVdm18NEj3Reb4UjshogbhPBnhz
         peq+9NRpxnalNDcraJ/UyILT0JAma5U91O/u+BI4vDU7iSGiRSRFOKvvqKbgU1W5ZIM4
         NBdkHxbHo9qbeN7SApA3BqRW3chSFe+AGvsUB8BP3BHhkZRxFQ1+zpMOidIMrGtbPfvO
         N07g==
X-Forwarded-Encrypted: i=1; AJvYcCXSiGF3+/T11FlQUXqqQxq4W46AvKxda0MCS1fxkUiAK1+vNiGL6Qu8Vog95bufqIa7Un8ZU5i/6kBonNqxeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxowrrzBUpJYq4P6EZJ+U3fmlli8BPDfh/z5suyn8qHR0k7WhKw
	qEGNVORtsPbI8GL5ZWL7Mzn6SjSmL7zO4wCXYSrRIHNIoegBGxR+bHb0jMM1A88k3+L3se2JUk/
	XlrI+lz3jaUUb6H9KCg==
X-Received: from wmbh25.prod.google.com ([2002:a05:600c:a119:b0:485:2cf0:2668])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b85:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-48722ba914dmr32054575e9.5.1774540556778;
 Thu, 26 Mar 2026 08:55:56 -0700 (PDT)
Date: Thu, 26 Mar 2026 15:55:55 +0000
In-Reply-To: <DHCP6NB4HWXT.2L5XXIX1HNPRY@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260323-cmdq-ub-fix-v2-1-77d1213c3f7f@nvidia.com>
 <DHAB9Z571FPB.25927BK1RGNGL@garyguo.net> <DHB3CGY1Z5HF.1KSJV8SP8YD8A@nvidia.com>
 <DHB40HKJD3OC.OMC04LASMS4G@garyguo.net> <DHCFJSHKE4ZB.3M1FFI3K5R670@nvidia.com>
 <DHCG03J1G63T.1A973DEM7DHQ3@nvidia.com> <DHCP6NB4HWXT.2L5XXIX1HNPRY@garyguo.net>
Message-ID: <acVXCzMaykipt9Dx@google.com>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: fix undefined behavior in command
 queue code
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 26, 2026 at 12:03:31PM +0000, Gary Guo wrote:
> On Thu Mar 26, 2026 at 4:51 AM GMT, Alexandre Courbot wrote:
> > On Thu Mar 26, 2026 at 1:30 PM JST, Alexandre Courbot wrote:
> >> On Wed Mar 25, 2026 at 12:15 AM JST, Gary Guo wrote:
> >>> On Tue Mar 24, 2026 at 2:44 PM GMT, Alexandre Courbot wrote:
> >>>> On Tue Mar 24, 2026 at 1:44 AM JST, Gary Guo wrote:
> >>>>> On Mon Mar 23, 2026 at 5:40 AM GMT, Alexandre Courbot wrote:
> >>>>>> `driver_read_area` and `driver_write_area` are internal methods that
> >>>>>> return slices containing the area of the command queue buffer that the
> >>>>>> driver has exclusive read or write access, respectively.
> >>>>>>
> >>>>>> While their returned value is correct and safe to use, internally they
> >>>>>> temporarily create a reference to the whole command-buffer slice,
> >>>>>> including GSP-owned regions. These regions can change without notice,
> >>>>>> and thus creating a slice to them is undefined behavior.
> >>>>>>
> >>>>>> Fix this by replacing the slice logic with pointer arithmetic and
> >>>>>> creating slices to valid regions only. It adds unsafe code, but should
> >>>>>> be mostly replaced by `IoView` and `IoSlice` once they land.
> >>>>>>
> >>>>>> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
> >>>>>> Reported-by: Danilo Krummrich <dakr@kernel.org>
> >>>>>> Closes: https://lore.kernel.org/all/DH47AVPEKN06.3BERUSJIB4M1R@kernel.org/
> >>>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >>>>>> ---
> >>>>>> I didn't apply Eliot's Reviewed-by because the code has changed
> >>>>>> drastically. The logic should remain identical though.
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>> - Use `u32_as_usize` consistently.
> >>>>>> - Reduce the number of `unsafe` blocks by computing the end offset of
> >>>>>>   the returned slices and creating them at the end, in one step.
> >>>>>> - Take advantage of the fact that both slices have the same start index
> >>>>>>   regardless of the branch chosen.
> >>>>>> - Improve safety comments.
> >>>>>> - Link to v1: https://patch.msgid.link/20260319-cmdq-ub-fix-v1-1-0f9f6e8f3ce3@nvidia.com
> >>>>>
> >>>>> Here's the diff that fixes the issue using I/O projection
> >>>>> https://lore.kernel.org/rust-for-linux/20260323153807.1360705-1-gary@kernel.org/
> >>>>
> >>>> Should we apply or drop this patch meanwhile? I/O projections are still
> >>>> undergoing review, but I'm fine with dropping it if Danilo thinks we can
> >>>> live a bit longer with that UB. It's not like the driver is actively
> >>>> doing anything useful yet anyway.
> >>>
> >>> I want to avoid big changes back and forth. We could use raw pointer projection
> >>> today, which could be fairly easy to convert to I/O projection:
> >>
> >> Thanks for the diff. I have adapted it to work on top of Danilo's
> >> suggestion to compute the end indices first as it works just as well and
> >> is cleaner. I have been running into a link error with this conversion
> >> applied though - let's discuss that on v3.
> >
> > Mmm, I guess this was because the optimizer could not prove that the
> > slices were within the bounds of the command queue as the expressions
> > passed to `ptr::project` were too complex with that version and this
> > makes the `ProjectIndex` check fail. I have better luck when doing
> > something closer to the diff you pasted.
> 
> I'm considering switching the projectiong `[]` syntax to become panicking
> instead, given that the slicing use case quite often is indeed hard to prove
> (and also, we already have panicking comments).
> 
> One option is to just change `[]` to do that, another option is adding a new
> `[]!` syntax to denote panicking projections. I'm more inclined to just the
> first one to keep consistency with Rust slicing syntax, but the second one is
> okay to me too.
> 
> Thoughts?

IMO you should just use [].

Alice
