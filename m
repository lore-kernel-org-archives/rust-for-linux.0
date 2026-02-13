Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937043EBF3E
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 05:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770959724; cv=none; b=HX7j7Krs+jbxB2BIeVVInMtkOyP8ms4Bz3DLNc9UMQs1ETYclAJwhdNuPvLSRCiJIe8dbT3WdhfLo59QFd0Y5IJpcJHmPvkg+7ZXvOnNb4j+FNtsC5S3YMrfMrnu+GKn80nInaOHZram3pDaFKnw8Ebq/N4F5KOXJf2OHCjSsqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770959724; c=relaxed/simple;
	bh=E4GSe7+fpkoR1cMQdEpWUJOnfrMN3PLLOqEs4bcYiBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GEXiulV+qRsBB4gFjsxWyiIx8bYTlW3Kh9iy8DUjWXgjHxcKtWFOXeN26D62X0TXfHVqK0zrLDAg9z6gke0VbdQdRy51gju6Fp377DYXHk3dH24joyfWY5Bo7R5Q3TgY/hLrcTS6Q8zSEZdSJp/mxBeyuygDjw/c7WrJQzK4tHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 13 Feb 2026 14:15:12 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.107)
	by 156.147.1.126 with ESMTP; 13 Feb 2026 14:15:12 +0900
X-Original-SENDERIP: 10.159.44.107
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jongan.kim@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com,
	tamird@gmail.com,
	tkjos@android.com,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se,
	yury.norov@gmail.com
Subject: Re: [PATCH v4 2/3] rust: pid: add Pid abstraction and init_ns helper
Date: Fri, 13 Feb 2026 14:15:12 +0900
Message-Id: <20260213051512.13267-1-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aYxdFgSM7lu8iz21@google.com>
References: <aYxdFgSM7lu8iz21@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Feb 11, 2026 at 10:42:30 +0000, Alice Ryhl wrote:
> On Fri, Feb 06, 2026 at 05:53:35PM +0900, jongan.kim@lge.com wrote:
> > From: HeeSu Kim <heesu0025.kim@lge.com>
> > 
> > Add a new Pid abstraction in rust/kernel/pid.rs that wraps the
> > kernel's struct pid and provides safe Rust interfaces for:
> > - find_vpid: Find a pid by number under RCU protection
> > - pid_task: Get the task associated with a pid under RCU protection
> > 
> > Also add init_ns() associated function to PidNamespace to get
> > a reference to the init PID namespace.
> > 
> > These abstractions use lifetime-bounded references tied to RCU guards
> > to ensure memory safety when accessing RCU-protected data structures.
> > 
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Link: https://lore.kernel.org/lkml/aXs3OjlGzQVABAwR@google.com/
> > Suggested-by: Gary Guo <gary@garyguo.net>
> > Link: https://lore.kernel.org/lkml/DG15B78C8IK4.ITL5HKRZ1QKP@garyguo.net/
> > Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> 
> > +#ifndef __rust_helper
> > +#define __rust_helper
> > +#endif
> 
> This should not be included. __rust_helper is always defined.
> 
> > +    pub fn find_vpid<'a>(nr: i32, _rcu_guard: &'a rcu::Guard) -> Option<&'a Self> {
> 
> This should use the typedef of pid_t (in task.rs) instead of i32.
> 
> > diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
> > index 979a9718f153..fc815945d614 100644
> > --- a/rust/kernel/pid_namespace.rs
> > +++ b/rust/kernel/pid_namespace.rs
> > @@ -38,6 +38,15 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::pid_namespace) -> &'a Self {
> >          // `PidNamespace` type being transparent makes the cast ok.
> >          unsafe { &*ptr.cast() }
> >      }
> > +
> > +    /// Returns a reference to the init PID namespace.
> > +    ///
> > +    /// This is the root PID namespace that exists throughout the lifetime of the kernel.
> > +    #[inline]
> > +    pub fn init_ns() -> &'static Self {
> > +        // SAFETY: `init_pid_ns` is a global static that is valid for the lifetime of the kernel.
> > +        unsafe { Self::from_ptr(&raw const bindings::init_pid_ns) }
> > +    }
> 
> This is no longer used anywhere.
> 
> >  }
> >  
> >  // SAFETY: Instances of `PidNamespace` are always reference-counted.
> > @@ -63,3 +72,11 @@ unsafe impl Send for PidNamespace {}
> >  // SAFETY: It's OK to access `PidNamespace` through shared references from other threads because
> >  // we're either accessing properties that don't change or that are properly synchronised by C code.
> >  unsafe impl Sync for PidNamespace {}
> > +
> > +impl PartialEq for PidNamespace {
> > +    fn eq(&self, other: &Self) -> bool {
> > +        self.as_ptr() == other.as_ptr()
> > +    }
> > +}
> > +impl Eq for PidNamespace {}
> 
> This is not used anywhere either.
> 
> Alice

Thank you for feedback.
We will submit the next patch version reflecting your review.
- remove __rust_helper define.
- use pid_t instead of i32
- remove unused implementations in pid_namespace.rs

Best Regards,
Jong An, Kim.
 
