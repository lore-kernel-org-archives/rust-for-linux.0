Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE442773E4
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232044; cv=none; b=aaBkaFZDiSRIXAd7+dn4Y7EpqK398vVT1ukSwEEyZ8a44OAc0YcSseUn4PzU4kUfX8OupVvt95KXjpJcWgdEKsz/SVkvwsBgC4IgFH/wgoIF5Ax3NyA3DoaWOWialBxALs30QIpBftVQ+zDM+bczzWOrMtEpmCQh5m1q8w4jqzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232044; c=relaxed/simple;
	bh=7rey5aOxAQx/0LrCuq/8cm8rXfoQtIpMUaEE3HnXh64=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aOoBQ0R4pPksBdjOkccpDaDeWMDpVlYNggCmCE4eSReYttHCMIY1nSg5LOiXlmyg/g9/UQs26nu0tBI4aqZojnJNN9qgmOAhtjAErZDSO4ensiqBcy1JVhWn9AtcI2ooWGupoT/b6Z1cPXIegdDz8ANTA7k8n0JLmR0FO0h8oPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RQmTJY6p; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RQmTJY6p"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65a1b27b84cso2818884a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771232042; x=1771836842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zS4jfvZRcJonWqgB+wt0EbsUJ/SxDBZm7B6KVfmZmxY=;
        b=RQmTJY6pFSb4QzX5/irt93zvsciZCMF9cebFvhL1Y2xpTqwPKAz4rhb9xeNGFnP7rI
         TUs/eDQlnoQunw775FSTQlXobvjZPYZWdSTjiyp9iUNGTYUzRUhuKxjLv+eO7nFP/eAN
         EGQwJQZuAWtn3R/Ywq7NrsrAyiOw9B6ZzmTSk+HlACD1z+2r1Pl/hgprAgrNAled7VIy
         Y8asyyQeYcKb6VL7T4jdukiKoVu/VE6Auc3KIn6qZp8gFNpInLh6kByNxLXOwlt7n2tH
         8+FJ14ktKLfBOM0wOBja8LhHDku4pGqPonxmzKv42wD46daCFDz5BdJwJbEnw3AbDsFV
         qdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232042; x=1771836842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zS4jfvZRcJonWqgB+wt0EbsUJ/SxDBZm7B6KVfmZmxY=;
        b=SrEwBrv1ywtkdrl1/Wy4cNHigdqe27lUHqYw+qfs54TAoMtGBaA2glRmxSQTWcSfbZ
         ILtiRpV/rLEgItLg9W4IMbM4B8fqFr0oQfRxUVwXOaZU8m980/UVWxJDnBCqWDP2iYNX
         i3mum1t74KP8OitbC+bLkgs/eJBOgYCiC0AFMJ5k5/0HiGYARK1vr/IahOTkwEJgzgso
         jEUgmuI/OI7WfzqKOMSeEFHcOBBeIyY4tvcLX6mSIVg9WKBynpcA0NgV+LaY31OWj6aU
         b+Bk99UiYU1UETJIynibrVGR04eIexkyy68bSCOSqGT8PR1HVN+TS02x4sQHfZwyrbjK
         aHmw==
X-Forwarded-Encrypted: i=1; AJvYcCUp3zeQ/l9NSsuuBR2p457Y4Wm7cxpaIwdXDoQg6nEwjZlXLkAW5MVCbfgpyCaOCbh/UNeTbrbA6m8OxAvbNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeqEZz3PrKY8XD871x9mWQy+Ei9A+lzv/j2cLaMMTrk4iQRGwt
	lyH6n+iA6FJaqvMEOuLrxUYGOxE/myculo0GgKVFWAJa93utVWo+aWdUjp08neFuLuOTrb/he+i
	vpCxcNr2HHmU6V0htpQ==
X-Received: from eduw19.prod.google.com ([2002:aa7:dcd3:0:b0:659:314c:bcf2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:50c9:b0:659:428f:a6c0 with SMTP id 4fb4d7f45d1cf-65bb129c72amr4699972a12.20.1771232041734;
 Mon, 16 Feb 2026 00:54:01 -0800 (PST)
Date: Mon, 16 Feb 2026 08:54:00 +0000
In-Reply-To: <87bjhpdusd.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-export-do-unlocked-v1-1-f5cd2203b20f@kernel.org>
 <BxsdI3LiC3yEHDsTew5ub3OiQyxjWc96V0V3r6yM2zIKD5r7xDUOXvvaLPxUHY9UHsy1jDZ0Y_yJjGHVo_RDgw==@protonmail.internalid>
 <DGFX8MV58WLM.2UFDGEIRRYWLI@kernel.org> <87bjhpdusd.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <aZLbKPym_VxwZ6-I@google.com>
Subject: Re: [PATCH] rust: sync: export lock::do_unlocked
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 08:14:42AM +0100, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
> 
> > On Sun Feb 15, 2026 at 9:15 PM CET, Andreas Hindborg wrote:
> >> Export lock::do_unlocked publicly. Add documentation for the method.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > Reviewed-by: Benno Lossin <lossin@kernel.org>
> >
> >> ---
> >>  rust/kernel/sync/lock.rs | 26 +++++++++++++++++++++++++-
> >>  1 file changed, 25 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> >> index 46a57d1fc309d..f390cd7ba0762 100644
> >> --- a/rust/kernel/sync/lock.rs
> >> +++ b/rust/kernel/sync/lock.rs
> >> @@ -235,7 +235,31 @@ pub fn lock_ref(&self) -> &'a Lock<T, B> {
> >>          self.lock
> >>      }
> >>
> >> -    pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
> >> +    /// Temporarily unlock the lock to execute the given closure.
> >> +    ///
> >> +    /// This method unlocks the lock before calling the closure `cb`, and re-locks it afterwards.
> >> +    /// This is useful when you need to perform operations that are not allowed while holding
> >> +    /// certain locks, such as allocating memory (which is prohibited while holding a spinlock).
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{new_spinlock, prelude::*};
> >> +    /// # use pin_init::stack_pin_init;
> >> +    ///

This will show up as a spurious newline in docs. I would just not hide
the imports, but if you do, then don't have a newline after them.

> >> +    /// stack_pin_init!{
> >> +    ///     let lock = new_spinlock!(())
> >> +    /// }
> >> +    ///
> >> +    /// let mut guard = lock.lock();
> >> +    /// let mut buffer = KVec::new();
> >> +    /// // Temporarily unlock to allocate memory, which should not be done while holding a spinlock.
> >> +    ///  guard.do_unlocked(|| {
> >            ^
> > Spurious space.
> 
> Thanks. Code formatting in comments is a problem in my setup. `rustfmt`
> is not much help.

Unfortunately there's not much helper to get there

Alice
