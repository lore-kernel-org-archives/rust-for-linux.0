Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5512A349AF5
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 19:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219129; cv=none; b=P9erG1LaCw6FbX0XMra9YZrCmrfPEn1Vp4o7xnwC/sIjt5wirIC3UpFTxijfTSMIuFCygCHumQqHgdHqF7bOj8c95dbYcAPUCG9neFr5mBQaQV/poCdSwEyUYmLDrupdhkkPm723FkjOK+HEiRWI6fht1AjnbiXOCaLccv1nslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219129; c=relaxed/simple;
	bh=mRI42A/KJodvD+27BzCr9+bgb9ZsIAZvL+st7xYBGOw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mLjjsebdDPpIYrk3E8DdWwvojnngn1ucRDWmpxTc/DEwUNmXmEiAGq0yl6i4GBXpYXxfC5VDBE2lpy3wC8nxjv6py7pYQzqFaYbyTgHekVTZzBNG4QbIj0255pHVa73C6wpM+x4qAv2omlRyYye15bFELicIE3OBYp7WXyf/DAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KU4F48NW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KU4F48NW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837907ec88so26333825e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 11:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772219127; x=1772823927; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pikDANfbE4Ok0e2Gfb8emUSEkVp07jBYXIodBMXISOU=;
        b=KU4F48NWX0z+2I85n8W8o+fl8Fql5qswzTsWHQiSMETPxx/G6ePTPBwFHtg1bfywNl
         tXi8ZVyRwM40pWWCb4Ex9crYg/M3ouoDZoUVBWhjNgw3XZAhCdByXNMoDQUGtcb4refF
         qTENpvZCA964Z8Xhxfsrl2O9+LuL3D42iFSk/pMIwm8Lnsgs6JU7+8tCMqw7uMWcBqjX
         xX0W3VLyynbZ8LyKGxC/dJ8Tx15TNVTtXVW9Up+a75uRA9TQ54/rTlo0XSCLBMecCEoh
         d69emx2cVJHoT8GqKKmLRsWohogHsi40asJs5g1uLVtASEQ34j5cv3jEQrKW+vM8wfoe
         LFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772219127; x=1772823927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pikDANfbE4Ok0e2Gfb8emUSEkVp07jBYXIodBMXISOU=;
        b=bYsOaI1KUneEwURcdVKmAhwxGRKx2sr2LmChKN24JuqMz7GxMmwEPHUtds2H6rSJ4P
         FzhR7dUReHs8maCqUgT/lDTcJBeyDVywx2XsCMJgCEbci0z+lbru7kgGkc6lOePtN2Ni
         GBD4jTHpZxmqRX6Qfy4Hs/ln4LcNMcBPxX5LRvCUpvocdwACTVu4Cfy2p3n4GOyHfpIa
         GYG+X/1t587/Pl/OyjSdze+jjETGLVHW2JQBmNUz4s4FDczuk7Ic+5zcsgQGs9P5Km8s
         d5DtO/PVheF8zIKIwkOa8hEDTCSHjN9BR5Sq4DsJ/j/bzBKl5tybTBfqCD1MYOxCBRv3
         DCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHOKpw64xKp19rIq6JfSC3ot0Cs+7ay/4DQdc/PHqr0jHJYd4PYzcvfcZDAfu6vhsDiiRF/TncO1439e9Y6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRlXxjKHfeIgMBSxuCalYQydAVZi4vMELOHOe1mNlYu/feFZX
	W7O4H4M3iFXF/z6Gp3ijXhw6H2dHKz+7Yy4tvcaTBqhbFF9kQTXavih2wdV+XAgMR+NyNleT5xm
	JybO0epaJWddLA+PRbA==
X-Received: from wmnf7.prod.google.com ([2002:a05:600c:43c7:b0:480:1bc3:e23c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8106:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-483c9bb6559mr61267115e9.4.1772219126395;
 Fri, 27 Feb 2026 11:05:26 -0800 (PST)
Date: Fri, 27 Feb 2026 19:05:25 +0000
In-Reply-To: <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-2-87de133f7849@google.com> <DGPUOSG5I4GM.1N5AWMP5ZFY4M@kernel.org>
Message-ID: <aaHq9VpaVN4_hchW@google.com>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 27, 2026 at 04:30:59PM +0100, Danilo Krummrich wrote:
> On Fri Feb 27, 2026 at 3:53 PM CET, Alice Ryhl wrote:
> > +    /// Set the maximum number of active cpus.
> > +    ///
> > +    /// If not set, a reasonable default value is used. The maximum value is `WQ_MAX_ACTIVE`.
> 
> Should we just mention the default value?

I can mention the constant name, but I'd like to avoid mentioning a
value that might change.

> > +    #[inline]
> > +    pub fn max_active(mut self, max_active: u32) -> Builder {
> > +        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
> 
> The workqueue code prints a warning for max_active >  WQ_MAX_ACTIVE. Maybe use
> debug_assert()?

What's wrong with just making use of the C-side warning?

> It's also a bit unfortunate that alloc_ordered_workqueue() becomes
> .max_active(1).
> 
> At the same time having a separate ordered() method competes with max_active().
> 
> Mybe a type state, i.e. Builder<Ordered> that doesn't have max_active()?

Sorry I'm a bit confused by this. Why does an ordered() compete with
max_active()?

Alice
