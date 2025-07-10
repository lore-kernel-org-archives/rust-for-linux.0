Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E14A25D21A
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752153064; cv=none; b=rch0XFeBZ2j+0BZ2lGbj5dGyY7RiADS7RpD+YsrWNh3xTKvcfkbrYqPh0Iff/bIp7eU5xqAv4N4p4trVYKjFczrk+3smS+/3eh0og//1upkYYVhEICHdrATLc6rguVtcDbqYWaClKPKR4S1em/nznyUr8NdTwmcnqlcL3C6GUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752153064; c=relaxed/simple;
	bh=ukrHN5oVTbO3Gzw8zvlKpOme09hGxMxpn1ZsIOQ/5pc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=njLZRgBDLrLVX3YkYYgQwrO/JwoAL0kSRci9wsWLVgWnQSmc9ODyqrtSMxtMHBPnsveNjmEjL+WKoxYYQ5mneLgY5cwJBtqR19q2H0GgC39x48KGx3ot8hmLF+XTXIQ6wTIoj2NJMMKZfrbcUWCsFUquvBl/FfxFqR4tqJnxtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0MJFc7WO; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0MJFc7WO"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6077833ae13so805810a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 06:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752153061; x=1752757861; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqVCS8TY8vj+FVtnSXDaeL5+XpjAZOm45v+d1K9DEFs=;
        b=0MJFc7WOTGuKt+yvExTjl/nml9GAOUOLBS66TIn1l7ujGFQGzcyzNUJqit4dPKPUPM
         3DosBP+LFzbOIS+nHrtV7xjwxyOmqxnqEVeEPGe//J8CZ2K+adpTmcPrcVyqwJRmpIil
         ppJxd29DWc0SDAPaumJ3S1Ffkb8vVq4bz3meeLi26XHy5na+q5xpICcaJjogpsqBLUic
         eYR74dm8y/ZfJQJVIvWu3aBabmbZ+m/NEKN4a36ppKMAlcnp3RQLztiwuS9taCuJX5yu
         4mF6f2Yk8LUSENdV/otk7mrT3VzgMx2KcsEtBQIPoByzQiwciJ/UheL7/hlX7d59itrW
         RLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752153061; x=1752757861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LqVCS8TY8vj+FVtnSXDaeL5+XpjAZOm45v+d1K9DEFs=;
        b=imFjHnfjo+NrGEjuSO3XyLwQ+f+Wjqx/jFhsY4rY/nLXRf8amKKhHXVPuSVSLUQjYJ
         xqY3LjoGbJQf4aOUkt08gNGLkUUemCkMusjTz0qyqjaG/1ilIWlfvcqqI/xpQbC9UWOQ
         VTjWSpFN9LIwEZ5Q2oo4mpHMDnux0C49HSvvnURzz/qMkf/vy4uJoWrC3BbEIq1/AOoT
         RmMFeylDztF6cfJGNxYgYEHfrZ7OrjeNCyqxp0Q3whngi8uSnNQhiQ+K6UxUIvlReG2w
         1jel787Fd+XbA/70wuIuP44xc99QnoV02+JYM7WWwC9W+TYJq0/ZOaqPd0DA6wlFrpHy
         AqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF67H905/jBT0FdipHTENAKfiL3QlA2PerUY81m8o9jUihXVhpcawDkC9/cGMgxRbaayLP7FTMQcJOKu/+/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz18OoppHRXvrRl4eRjiQBS26Eqnj96Db98v2c/JtiM4dFqL1L2
	Wt7sxZw80/RZ2oU2QHBP9XRpyxf/09Pv2vWb5OKewiIBAWDCEfsfaNMlFE/8fnqPxLJ5DQ5mXuy
	u16zTq1CAcCWXyl9uWg==
X-Google-Smtp-Source: AGHT+IHuNA7vEKwVx7/1GodImnvcG0kjW66yBsiqdQmW7BPO6iJF0Z1c31UMA8nBNbbTYWcXSeNyJSd4/epYty8=
X-Received: from edtt13.prod.google.com ([2002:a50:8d4d:0:b0:60e:1b95:f4d5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1eca:b0:609:7e19:f12c with SMTP id 4fb4d7f45d1cf-611a7353c37mr5475950a12.24.1752153060633;
 Thu, 10 Jul 2025 06:11:00 -0700 (PDT)
Date: Thu, 10 Jul 2025 13:10:59 +0000
In-Reply-To: <aF7YWE4bz98Gqh1y@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-workqueue-delay-v2-1-84b046fdb4fc@google.com> <aF7YWE4bz98Gqh1y@tardis.local>
Message-ID: <aG-7402hh4CCN7vh@google.com>
Subject: Re: [PATCH v2] workqueue: rust: add delayed work items
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 27, 2025 at 10:43:52AM -0700, Boqun Feng wrote:
> On Fri, Jun 27, 2025 at 09:38:42AM +0000, Alice Ryhl wrote:
> [...]
> > +    /// Get a pointer to the inner `delayed_work`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The provided pointer must not be dangling and must be properly aligned. (But the memory
> > +    /// need not be initialized.)
> > +    #[inline]
> > +    pub unsafe fn raw_as_work(ptr: *const Self) -> *mut Work<T, ID> {
> > +        // SAFETY: The caller promises that the pointer is aligned and not dangling.
> > +        let dw: *mut bindings::delayed_work =
> > +            unsafe { Opaque::raw_get(core::ptr::addr_of!((*ptr).dwork)) };
> 
> This would conflict with your Opaque::cast_into() series ;-) So I
> suggest that we rebase this one onto:
> 
> 	https://lore.kernel.org/rust-for-linux/20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com/
> 
> and send them together. But it's up to you and maintainers, and even we
> do that let's wait for some reviews on this patch to save extra
> versions.

Will rebase.

> I'm going to review it, just figure this better be pointed out.
> 
> Btw, as a review comment, I believe we are in favor of `&raw mut` now,
> so this should be:
> 
> 
>     unsafe { Opaque::cast_from(&raw const (*ptr).dwork) };
> 
> > +        // SAFETY: The caller promises that the pointer is aligned and not dangling.
> > +        let wrk: *mut bindings::work_struct = unsafe { core::ptr::addr_of_mut!((*dw).work) };
> 
> Ditto.

The rest of the file still uses addr_of!. I think we should stay
consistent. We can update the entire file in one go.

Alice
