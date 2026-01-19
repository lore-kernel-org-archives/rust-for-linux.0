Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589713959D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768785736; cv=none; b=kLRYKeZWgGGmiIbpwDbol8W2kdyoFaOnbOSy668yw0r/6ZWbAqeI/ZS4SmcdhnK8aSzwKKvkjnpMf1SGiDN2OhA65q8PEzdXV6whg4LsWe9MOi/ZLUoXssGWhr/OKhAO5x1pCHhK8OQ/MlsCjSFbLz6294f5K/rH5g5ifKDY+lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768785736; c=relaxed/simple;
	bh=vuW+CudafzU2CvzSSHzu5xK7N/iCyYw5eWTv9Mq5uWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVUWFJa1zlPPpoXQ/bzw8BuWda0VAKrr0KAu8jHTK6Fu5kVdlkSr7WVA5hAyrEjafkqr2uVsDj8a9xaQnr1xbHxs4JAfBD3tEZYmjj6HUB9ood+STgDF+tmSS7DCMZa7oI29mHf5LQeObjduH5IlNIkFws2csyrwng15kokY3SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ex1HOhqV; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ex1HOhqV"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c6a0702b86so379790085a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 17:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768785734; x=1769390534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGz6FuKBmjYeyYa0RGlbcxGdzo57ReF5kcK750bH3i8=;
        b=Ex1HOhqV2UQAlzVfopMDIQE3eLsDnCSX+Nu1vKj1sYnLTr1B7E6V46BpiVhC16TPrK
         LCsz1oOAMbsH2nbpVYM0zIkyBdNBwlq/M+7n3dKQsgFpbTt3pVGoyvbZxePnYeoJzPi2
         jnvVIkUPBXv5jIoSGJEn2UkC+GhvvF/b7EsCYtNDnw2BDjLSSbkvDNZqbSZS9xLv1X5e
         kFHY1d/xp3tRKLQM7B+DYERmnld8iP+1G8EDpLPuTUuxgQ8/Iijy8bu06nJ384/Bm7oB
         +PRTDKpuXSBrIiJ839qP5d+uARjvccBlE1L+9rFQ0soDLsTBxo+CsM9/whrO8IbIsj1Z
         myvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768785734; x=1769390534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGz6FuKBmjYeyYa0RGlbcxGdzo57ReF5kcK750bH3i8=;
        b=PSaHr//jXepYaEKdwX1KiiXCNIpsT9tSa9PjLKVY/NCGEmDdpVA5yKu1kUe+frkK9F
         vxIyGkIWPG+S/pKuZ+UhOqH34X1mP3J6+kFDmj7J/l0uISiOhtprR3LzZD1ri0RGfhyK
         cruAHmeQasBjlK9mRwZLSJxGGwW3sI5TssxaZHPYCD43ANUa2yY1e3fyDSyQWv1Q92cH
         MbJDf23JD6laoSKQySD+QerqBhYb6nw9Vep2fGrmyIxcxIlgzv+sQwmhISJYEIGytZsX
         gXFdEOIQSmOaeocGlZai/8zY9UR52xcyM+G3ESLNh/FXgjmnMGSwXAFCIaF9U54TP3iF
         6kZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcZxfQ2uqByqzxzHNZ8ungxx1Tq9G1jWyPYMXZlvYowgwlde7hOnf9zLs687wGv5UiuFvBszvwsmpzV49CUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOVN4ZjcKHJe91oF3ldo3qUDDpCzZ9lRkgnoLoOUGk6STIVFcQ
	xPf/8WbSLh0ZU5xm6bVvr/MYjc+KRFufbuju+viqEuTp11Mjnrzw4CBJ
X-Gm-Gg: AY/fxX7BtZFVoZWoR7k/KDisuTa82KxGYyfx5H+RYwrQFDtd0Q6/6msKKka4Yyp8bNW
	nivtl6FVfxv4HuzxCS4nTIaVQ5Omj8HGlOh2OiedjRkqb+kK4G3PjletnsbK7swquY2xbSIS7v4
	LjT0B3ipbIIvYxJXWhgvjbxdImBMY4MONnXv5586SHsujKrJQmJCq8m8XRUpHzR9KoESqYZsdR4
	ittiYe4gMV98n5id9L4YG5EAQvN/vMOAAUOACfR96VUo73HTrfEAVrF22/RMNBcoZDW2KbyLixK
	P3AnPf1AAbuJX5VmbKcbbdAVrOJqx1Op/z26IZ2AYzACbqIRZK4590wRKJjfZMlsmDpl/vPshUP
	c4OZkUA3tMxjuB3/PRbtGaTKQE2J8374QTqYlm1e550OGWoz9flJuPhqW0Vq/coJqBJsDSLwtq3
	XbS7+0BjEX13esbGjVuUu+ifnTdc5ahqBu5V56K2fha/qjlo0lIyLnVJG+WXL1wQpNCU9v0Fd6m
	ZdzMaQIfkIQj9nT8CzjUk+bZg==
X-Received: by 2002:a05:620a:1a86:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8c6a66e449cmr1273808185a.23.1768785734087;
        Sun, 18 Jan 2026 17:22:14 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6b22bb7cbsm421467685a.39.2026.01.18.17.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 17:22:13 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2D5A7F40079;
	Sun, 18 Jan 2026 20:22:13 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 18 Jan 2026 20:22:13 -0500
X-ME-Sender: <xms:RYdtaVMtzKnjrbqgqjvvtetAYrM5_uNsZu-zyxfxbi3BzViMHQruiQ>
    <xme:RYdtabrR8RzNU_zLVqQPuAySr8Qf4eXAto3blabamw1j-4eoVXnLqLkWJ5Il41lAu
    xJRvQz6pbiMmHu5OlzBwPmJ7P2XBaYva1u2fCaGXatiym8xUJaJ9Q>
X-ME-Received: <xmr:RYdtac61UgARV1skWcaU9Sf70f3ULztSRTAkpYDo-yqPnCtJKJ7pqJwK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeeivdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtdekvdefgedvkeefffeiiedthfelgefhkedvhefgheefveehffejgeehfeff
    feenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhujhhithgrrdhtohhmoh
    hnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusgho
    rhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:RYdtaTHE9uBt2eGdv3UMT3YSyZ8e7aWXg9dPKn82Ks_-DE1eF--Ylw>
    <xmx:RYdtae0W7PcLf6rEsvXLqNuo0IgfDJ9pRYSR5I9GTORmmV2yhxOwiQ>
    <xmx:RYdtaQrwuPIHT7u1azQ_EkHWt5Ul4NqLe1C7DAAFlMuV7Qh045Lqhw>
    <xmx:RYdtabPDGljLKkBNK5LqdXNSBTsM0cmdDkBJYR_UBK61gw4WSpyRxQ>
    <xmx:RYdtaSWlHHOaJSd0k_k8mxPIfc_Gnk6CEjXPcOo816zEp34dNyuVGUe6>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Jan 2026 20:22:12 -0500 (EST)
Date: Mon, 19 Jan 2026 09:22:10 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/2] rust: sync: atomic: Add
 performance-optimal-integer-backed Flag for atomic booleans
Message-ID: <aW2HQvo2h46WecQ3@tardis-2.local>
References: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
 <20260115021230.3297420-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115021230.3297420-2-fujita.tomonori@gmail.com>

On Thu, Jan 15, 2026 at 11:12:29AM +0900, FUJITA Tomonori wrote:
> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
> users can use Atomic<Flag> for boolean flags.
> 
> The backing integer type is an implementation detail; it may vary by
> architecture and change in the future.
> 
> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
> particular, when RMW operations such as xchg()/cmpxchg() may be used
> and minimizing memory usage is not the top priority. On some
> architectures without byte-sized RMW instructions, Atomic<bool> can be
> slower for RMW operations.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs | 71 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index ca9cab77abf0..58f57903460f 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs

I prefer we can move `Flag` into atomic/predefine.rs, I queued in
rust-sync with the following version, please let me know whether it
works, thank you all!

------------------>8
Subject: [PATCH] rust: sync: atomic: Add performance-optimal-integer-backed
 Flag for atomic booleans

Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
users can use Atomic<Flag> for boolean flags.

The backing integer type is an implementation detail; it may vary by
architecture and change in the future.

Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
particular, when RMW operations such as xchg()/cmpxchg() may be used
and minimizing memory usage is not the top priority. On some
architectures without byte-sized RMW instructions, Atomic<bool> can be
slower for RMW operations.

[boqun: Move Flag into atomic/predefine.rs]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260115021230.3297420-2-fujita.tomonori@gmail.com
---
 rust/kernel/sync/atomic.rs           |  1 +
 rust/kernel/sync/atomic/predefine.rs | 71 ++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a..915c625a8bc0 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -22,6 +22,7 @@
 
 pub use internal::AtomicImpl;
 pub use ordering::{Acquire, Full, Relaxed, Release};
+pub use predefine::Flag;
 
 pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
 
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 42067c6a266c..261e6d7f5341 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -122,6 +122,77 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
     }
 }
 
+/// An atomic flag type intended to be backed by a performance-optimal integer type.
+///
+/// The backing integer type is an implementation detail; it may vary by architecture and change
+/// in the future.
+///
+/// [`Atomic<Flag>`] is generally preferable to [`Atomic<bool>`] when you need read-modify-write
+/// (RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) or when [`Atomic<bool>`] does
+/// not save memory due to padding. On some architectures that do not support byte-sized atomic
+/// RMW operations, RMW operations on [`Atomic<bool>`] are slower.
+///
+/// If you only use [`Atomic::load()`]/[`Atomic::store()`], either [`Atomic<bool>`] or
+/// [`Atomic<Flag>`] is fine.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::atomic::{Atomic, Flag, Relaxed};
+///
+/// let flag = Atomic::new(Flag::Clear);
+/// assert_eq!(Flag::Clear, flag.load(Relaxed));
+/// flag.store(Flag::Set, Relaxed);
+/// assert_eq!(Flag::Set, flag.load(Relaxed));
+/// ```
+#[derive(Clone, Copy, PartialEq, Eq)]
+#[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(i8))]
+#[cfg_attr(
+    not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)),
+    repr(i32)
+)]
+pub enum Flag {
+    /// The flag is clear.
+    Clear = 0,
+    /// The flag is set.
+    Set = 1,
+}
+
+// SAFETY: `Flag` and `Repr` have the same size and alignment, and `Flag` is round-trip
+// transmutable to the selected representation (`i8` or `i32`).
+unsafe impl super::AtomicType for Flag {
+    #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
+    type Repr = i8;
+    #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+    type Repr = i32;
+}
+
+impl Flag {
+    /// Creates a new [`Flag`] from a [`bool`].
+    #[inline(always)]
+    pub const fn new(b: bool) -> Self {
+        if b {
+            Flag::Set
+        } else {
+            Flag::Clear
+        }
+    }
+}
+
+impl From<Flag> for bool {
+    #[inline(always)]
+    fn from(f: Flag) -> Self {
+        f == Flag::Set
+    }
+}
+
+impl From<bool> for Flag {
+    #[inline(always)]
+    fn from(b: bool) -> Self {
+        Flag::new(b)
+    }
+}
+
 use crate::macros::kunit_tests;
 
 #[kunit_tests(rust_atomics)]
-- 
2.51.0



