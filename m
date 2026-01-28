Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91EB2BE03D
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 23:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769643447; cv=none; b=nPL6b733hC4PhaNwDrR+DB43LOThrTjmp39Qn4gXjZZBqk/pfvzU2eS7W+vuzsk+cCkvHowsobN97z9IcTtybVVItwziTEzjwv38mcycVURNXn/qHrabD0PcJbCtxLEICVYUcvq/lDuW3740HAaJ5b3IVTKarIdQLwtrYd7jmX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769643447; c=relaxed/simple;
	bh=OUnhhLpw0G4jfOUrV0sIe5rYFeDBYm/rgYAQew5ALOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBhaGybDQ66nkCWqP0SCFXk/nCblwJuESs2VZKdCtq64L5HJA86qSub6AhPQnaTMKV7FpDDrmlpOalAepMy7jWczUKgmGg2VBj/r34H2FZslxhqGWN9hykuKRvhhkY2KbO3WWUj2Xi1eGJ8/brUEfMHmOreAXskJED8iMDGIesc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7/uDBpl; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7/uDBpl"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so229004a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 15:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769643445; x=1770248245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZwleCKT0WC1y4r31KovKxSZY4leqC3/LnghDg5OFIfc=;
        b=K7/uDBplxwPaMky8a1ZlY3OKMi1ZzYN1JuDlWyk3nBUdp5ySxXmVuqQjoEBzw9dc2L
         BZ3PGkrhKvmmYBcURQshLK/wEsZNzXznLbBwHA4KudxzULQr0sf11wlr+c4+uv/iOznb
         9WXgBsXD8As5sOHifo+OIpIGzmx5WWc9xr4XEJ0Wuy10GUMNlrx+KU86Ud/diqipz2bO
         cS9mpNzrq5MY7Ied0sUwu9QekIU7lijdBJD/nE+G6ZzFXfgN7jf5rlqtjUoLgVVGdMnD
         OZ1U0kTHJ/dYGSczldBklImk0LiYybR4JP9Cqtb7X6GjGt5U9zMXdwQvO+WkteCiILAd
         5n2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769643445; x=1770248245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwleCKT0WC1y4r31KovKxSZY4leqC3/LnghDg5OFIfc=;
        b=fTFcNiWFxWWK4kuBeemh0tsetMC68qjGWh6a3OOhksF74o5XHYj4f6/5XjrX5mRO+n
         CMF6QazPPiOgoMnxw6tIxI46QpqtrcR5zv+LiU7GMXWWUl1b23gzXvoryaUPhYDvYOlM
         QCTREVUG3qm4uRILvpjXdwSGPl/F6yJADxddJlqE6ZMugv2VRUn7Jca6Z6BxY3XoyXCD
         SlyXGU2qlLMNjWsSJrRGwMGZO4mqyP3o9/+AGT/vPY5qx3GotPOabRePgFlidTSATZ+e
         AQnnRBL5nKVMyYBB149j1ifHh17GwiQyrvRnQCXVT/4ZK14hhMxiMjDHsgwEaeGF7OmF
         9NlA==
X-Forwarded-Encrypted: i=1; AJvYcCVGwb1rqRgJMnx8p2t8RVJv4LqC93YAiAcZqsj727ZBMp0r9swrD//zzGalQs0TBrVgH3nauakUMriikStQNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzpSLJJsXEUCx5Tej5QjWX6alqySgUNbr3nzpdSiSDugC6fqq
	KvybMjWlrD7vgbhOgwIRWt0YLkPVT8/kOR6jao6LdiVZE/KLZG6HkprvkwFqYw==
X-Gm-Gg: AZuq6aLM1It211SXGh4PanST3gAI2l2O51xk1A5jCd9WkubRISeZOLege2Za6jhP9Fd
	CNOE9Bj0kp8QMu+yTXHMK8FauA7vuji+wvnJFcFnZz977vRNJECws4scNWimrjvvlR9BmrihOFJ
	xfScEUk4c12de9b4DJkpBPfvob+KDLz14cc87oc4leGgCvTn/NHNLFDxAkn/sGHgagHH/dn1K5Q
	i0I8m3RV3adjTDwvBe/jACvyw36IeT9zYNDLmEJWXyWGdTaXa/Nj6E7dgYT6QIDfAtZ7HAk4aPO
	hS9zGsJ+QUYaOHA9eofN/80AL80JPr5/djQccARJf8XaPkuMtikdVUpxORdIiMBBY5pHVGKy8g+
	kETUCVn0iLmVpguqfDDoUiQ2Q6xgE+r9xz+Hx93EnLDu4AZa4DEBALJWBb+MBNrJoM6SeacWqrT
	MsOcbQ+r8jMjBYsqCc5SIqIX6mSxuagdDtm9HG4A4as7bg6H61USUmCX9zpHJMwz7CY+r7rN5Pr
	Z5T534YQxeOUig33hqlMgiCmw==
X-Received: by 2002:ad4:5f0f:0:b0:888:3d1e:f95 with SMTP id 6a1803df08f44-894cc8c97dbmr102202586d6.32.1769637217348;
        Wed, 28 Jan 2026 13:53:37 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d373fe92sm25727956d6.32.2026.01.28.13.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:53:37 -0800 (PST)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 28E16F4006C;
	Wed, 28 Jan 2026 16:53:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 28 Jan 2026 16:53:36 -0500
X-ME-Sender: <xms:YIV6aaFIVqu1vzme2VW38MSlOBHLiWRQSF2V-SxUhc3r0IpLwI384A>
    <xme:YIV6aQwoAtzlJQ97cyCGHjaHsUHLIshlyuDQAsgvGa4_xaJAGJrbLp7ol10P2h2n2
    KRcJOewPjkHj7OBTEqqOPjBSe-7JG8oGRCw73AHQcYhO4F9E-AYvg>
X-ME-Received: <xmr:YIV6aY70_MKwCKmidquhUATwoM2PDGliV-3HHvE-nK3U1-DDGddTZRIj9XQj4Wm-lQ6NIehIQf7meG_WZ-_jsIbVQa-bVHC0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeggeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepgedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    rghrvhgvsegrnhgurhhoihgurdgtohhmpdhrtghpthhtohepthhkjhhoshesrghnughroh
    hiugdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegtmhhllhgrmhgrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghlih
    gtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:YIV6aVAdxyRI7i9c75UP1OKe2Bv8wm04aNI1gBnt75x3dzu1jwBuqA>
    <xmx:YIV6ad0Bi4W7IBwGOHhDjdvikuuIKESqCxIDuYSKttGvHo5Gr__1ow>
    <xmx:YIV6aYFJK2BsysJTkEA1w5-cd_XOkGa5sdtjL_AX74OFQoIQ9LsjUA>
    <xmx:YIV6aehmFEta2df7Jvcc7N6UslnRiAKLz-OqBem8zcQcA_7lilXCtQ>
    <xmx:YIV6aauOB-9wVOKHl12R-2qAcnd3syYeCTCudza0yHA3zUH-pRv8Hcef>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 16:53:35 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,	Danilo Krummrich <dakr@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lyude Paul <lyude@redhat.com>,	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,	Stephen Boyd <sboyd@kernel.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Tamir Duberstein <tamird@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mitchell Levy <levymitchell0@gmail.com>,	David Gow <davidgow@google.com>,
	Peter Novak <seimun018r@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 2/7] rust: time: hrtimer: Make `HasField` a super-trait of `HasHrTimer`
Date: Wed, 28 Jan 2026 13:53:25 -0800
Message-ID: <20260128215330.58410-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260128215330.58410-1-boqun.feng@gmail.com>
References: <20260128215330.58410-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This decouples the hrtimer mode part from the `HasField` part of a
`HasHrTimer`, `impl_has_hr_timer` also gets removed, as we can do:

    #[has_field]
    #[pin]
    struct MyStruct {
        a: i32,
	#[field]
	timer: HrTimer<MyStruct>,
    }

    impl HasHrTimer<MyStruct> for MyStruct {
    	type TimerMode = ...;
    }

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 70 ++++++++-----------------------------
 1 file changed, 15 insertions(+), 55 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00..eef6d60f5adb 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -98,6 +98,8 @@ unsafe impl<T> Send for HrTimer<T> {}
 // on a timer from multiple threads.
 unsafe impl<T> Sync for HrTimer<T> {}
 
+impl<T> Field<T> for HrTimer<T> {}
+
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
     pub fn new() -> impl PinInit<Self>
@@ -417,17 +419,7 @@ pub unsafe trait HrTimerHandle {
 }
 
 /// Implemented by structs that contain timer nodes.
-///
-/// Clients of the timer API would usually safely implement this trait by using
-/// the [`crate::impl_has_hr_timer`] macro.
-///
-/// # Safety
-///
-/// Implementers of this trait must ensure that the implementer has a
-/// [`HrTimer`] field and that all trait methods are implemented according to
-/// their documentation. All the methods of this trait must operate on the same
-/// field.
-pub unsafe trait HasHrTimer<T> {
+pub trait HasHrTimer<T>: HasField<T, HrTimer<T>> {
     /// The operational mode associated with this timer.
     ///
     /// This defines how the expiration value is interpreted.
@@ -441,7 +433,11 @@ pub unsafe trait HasHrTimer<T> {
     /// # Safety
     ///
     /// `this` must be a valid pointer.
-    unsafe fn raw_get_timer(this: *const Self) -> *const HrTimer<T>;
+    #[inline]
+    unsafe fn raw_get_timer(this: *const Self) -> *const HrTimer<T> {
+        // SAFETY: Per function safety requirement, `this` is a valid pointer.
+        unsafe { <Self as HasField<_, _>>::raw_get_field(this.cast_mut()) }.cast_const()
+    }
 
     /// Return a pointer to the struct that is containing the [`HrTimer`] pointed
     /// to by `ptr`.
@@ -452,9 +448,15 @@ pub unsafe trait HasHrTimer<T> {
     /// # Safety
     ///
     /// `ptr` must point to a [`HrTimer<T>`] field in a struct of type `Self`.
+    #[inline]
     unsafe fn timer_container_of(ptr: *mut HrTimer<T>) -> *mut Self
     where
-        Self: Sized;
+        Self: Sized,
+    {
+        // SAFETY: Per function safety requirement, `ptr` is a valid pointer and points to a
+        // `HrTimer` field in a struct.
+        unsafe { <Self as HasField<_, _>>::field_container_of(ptr) }
+    }
 
     /// Get pointer to the contained `bindings::hrtimer` struct.
     ///
@@ -731,48 +733,6 @@ pub fn forward_now(&mut self, duration: Delta) -> u64 {
     }
 }
 
-/// Use to implement the [`HasHrTimer<T>`] trait.
-///
-/// See [`module`] documentation for an example.
-///
-/// [`module`]: crate::time::hrtimer
-#[macro_export]
-macro_rules! impl_has_hr_timer {
-    (
-        impl$({$($generics:tt)*})?
-            HasHrTimer<$timer_type:ty>
-            for $self:ty
-        {
-            mode : $mode:ty,
-            field : self.$field:ident $(,)?
-        }
-        $($rest:tt)*
-    ) => {
-        // SAFETY: This implementation of `raw_get_timer` only compiles if the
-        // field has the right type.
-        unsafe impl$(<$($generics)*>)? $crate::time::hrtimer::HasHrTimer<$timer_type> for $self {
-            type TimerMode = $mode;
-
-            #[inline]
-            unsafe fn raw_get_timer(
-                this: *const Self,
-            ) -> *const $crate::time::hrtimer::HrTimer<$timer_type> {
-                // SAFETY: The caller promises that the pointer is not dangling.
-                unsafe { ::core::ptr::addr_of!((*this).$field) }
-            }
-
-            #[inline]
-            unsafe fn timer_container_of(
-                ptr: *mut $crate::time::hrtimer::HrTimer<$timer_type>,
-            ) -> *mut Self {
-                // SAFETY: As per the safety requirement of this function, `ptr`
-                // is pointing inside a `$timer_type`.
-                unsafe { ::kernel::container_of!(ptr, $timer_type, $field) }
-            }
-        }
-    }
-}
-
 mod arc;
 pub use arc::ArcHrTimerHandle;
 mod pin;
-- 
2.50.1 (Apple Git-155)

