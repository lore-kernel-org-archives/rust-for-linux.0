Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1512D6E75
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644564; cv=none; b=WSpkFs3OcEqsECXcgs2+o86DEDCzw00YXzcYIKWULQ9NkqB3nzsGs85QaNvlK88A1zRW3n8ryOLqRWpTEa4plakXMl/YlUfapZ+6cxlHcFRzsRBRRk+9BW0YQLLKXnvfM9bPr960aWbNAERYTyFf3NVHSVW4GZD65G/rckWNkzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644564; c=relaxed/simple;
	bh=x68kyFMcXCVl2ap3eh7O4CQGneM+mz/6DOkFyCpzqd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYzwxbITQ82BRWSifSWB/WMgB8SLUMIwkI3fO18V2jamT0pukG0VN4VQGKHNPx3X7dX+LSS7+jLZJISEJ5C/u1CMtGxLvhtx/vQCl6xTfBZj5gdDiUp76oTEY9e2KY0deMNDw02rCDPH/2tJISdkOeOKC7bteJ5cuO2C8qIhvjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NT7ZxMxj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NT7ZxMxj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c2af7d09533so201006a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 15:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769644562; x=1770249362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kr5A9uFY8WKbxdwaztWr2I99L6qNUiDvl4AMlkp9MKU=;
        b=NT7ZxMxj6gSR7gbbVcYmn0dwHZOkgveVmLD2z1mbz/EJguI8wyL9SlM/v5lwgE2NsT
         BphkzdSjncPefOnx5xXxV5p+7F37hT1V+JWZ1kJVzhOrPI8LClojNLmZx6JMIJ42y+Fz
         bsuPXRGnd5EWmuAxVESnkPdNohEhFlW4eXN8/CWyLE3l1cUVBF1nHBSZ/90kQ/dj0+rb
         hC6RYJ7zwiv8LkF5HuhwhMIrfgtxHXbvpgS0UPQx/zGy6VZlalcLRB5vx4G6SxYinW12
         Z+Cn1oE9Cy1sDQvMiaPf0qZg6lyJh6QGiwChA6zUFJ+NUjGBlSskjriQDnOSess9Gps5
         8uVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769644562; x=1770249362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kr5A9uFY8WKbxdwaztWr2I99L6qNUiDvl4AMlkp9MKU=;
        b=TFYp6WzjnQgVm6ZPjWoJhtjJgZfFnzcx1OQXuFe0sKKweJi8ztaZPtekIS2r56LR2Q
         3W77Vo95+5H7Qo5kWmZzGdcHDyeKlcC9sq6mL4YtwbHeDuPgu8KLNSoGlX6rEyELyBfp
         8dygfcz33awuLyiyA9WjntlCHFqFILXLfFqZGrpDSatusQZkXiMktVGqx8+zLOwsQunt
         iMaZT5xLMpfooa47QduXbYGgg+5mF3BQ251eK2ps2nQZT+OqrBz8G/Ngvl02o95tsFcB
         glwUNUh8AJ5x4p8umrtLADadoptKQM2qIusjmjg6iZOmaJFwu/TWBw7gtjphhQcAJv7X
         JaSA==
X-Forwarded-Encrypted: i=1; AJvYcCWOeuPzCVDkU4svYIItbe3m1AZZFnSo2cjvGIMQMq6v1xCRzq1tue1JccTrW/tk6kRqud7A4aoU3fVl8uINKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/boyO4DfNUExOTPnpx2f4yYOPDQpiMGPMad8tyd5WD05QFwIc
	qrtHq0nHXtgSASovkrrUepvno4NfRs1uSX8oLrL8juwcIZcDAAUmvOD1
X-Gm-Gg: AZuq6aLW5umfZMH9bFcwS4Alm2o221esPjC0zevwPSkQ56EWpXyzjn+ubQPJqdCdG5I
	Osv9DQ66jiijQaDIUO8bUbseFqPkAr5sF4GRCg/Mscd/Y01uxK1ZWBCO4yw+kmnFMez9OAXUXDT
	5PR8+zAjLDlnLfjoSaEuBSuDi4Tr6/tGTVQ8lwztZxDxyILa8ups7CiwNj0J7l20wo0IG9iYbBa
	bqI8Ho51/E4Ax60FITp5BZdDxVgc7wGvwAyLgDpoI87lySY2Ko3N/YIHOeay618JM/r8FzgZLko
	WLYv3TBl9aV6ryaobg9YYRs/9a51MIffPDs/+bymNDeSCsQU+N2YcdEbJyxRwbKrZRdhQ/LWyXy
	0zJDs1Zl1FC3sYFYOJakMSUU8j2OcPVtASscuhkmLgX12UP9urjMaoWAVMsOe35LzyabtyD/qpY
	u7QRwHYbeu1RX/dYUDyziczhuhD+ssma8ulcwXs/8YB6hWqK1nYdN6ySOGcyjTE00/jZisWtmFg
	PKqVcJmxKQQN7w=
X-Received: by 2002:a05:620a:d81:b0:8c5:310d:3b3a with SMTP id af79cd13be357-8c70b8f6964mr868040985a.70.1769637219381;
        Wed, 28 Jan 2026 13:53:39 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d61c6fsm263878285a.47.2026.01.28.13.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:53:38 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 09698F4006C;
	Wed, 28 Jan 2026 16:53:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 28 Jan 2026 16:53:38 -0500
X-ME-Sender: <xms:YYV6aTrMexQM0tXBJO6hzRhyRnPl6FkOnkf1bshnsPnMb2oB0bPeLg>
    <xme:YYV6aTGmQlScqKPOHaNl5y8v4vsG7EP8VPu9VOqw3C-MpOaYb7VGvRhzb31qMofjh
    cdBmy9GKAUzQkxqwH9-sPgKoy15yIIw4U5R1OUE1tfP1filVlOI>
X-ME-Received: <xmr:YYV6aU_o40f4n60mcLkqgzWKog-VIG3oHAS91MnM7SXQpajV1SgeVOgarv9WZkPyHxf02KnKcZ6k-iffAE51gwAiAFqadb_3>
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
X-ME-Proxy: <xmx:YYV6aX1MCE43sV8GtrhFe7qXbmbJNm1Pjhqg5H49AjG5tE9e0GMlaA>
    <xmx:YoV6aQaGKiqoaxRoblcuaOuEWYRcZnTLoEgMrLTnqtNrSnr3TznwjQ>
    <xmx:YoV6afZknyxbw4ywC3wunHF-BkE72kuXPFRN6DHiRhkUOxuXxWW2Pw>
    <xmx:YoV6abk1C2_GQ6CfYuqXwu8HUilt40w1U5dyzlp0Z5Id1LbjNjTJiA>
    <xmx:YoV6aahjmePqaZNaBpkdOa7CwCOqimS69gXzC9VIgP3trKJXiWRJqP6X>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 16:53:37 -0500 (EST)
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
Subject: [RFC PATCH 3/7] rust: workqueue: Add HasField support for Work
Date: Wed, 28 Jan 2026 13:53:26 -0800
Message-ID: <20260128215330.58410-4-boqun.feng@gmail.com>
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

Implement `HasWork` via `HasField` so that manually impl_has_work!() is
no longer needed.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/workqueue.rs | 60 +++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..2dcfd3eace39 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -34,19 +34,17 @@
 //!
 //! ```
 //! use kernel::sync::Arc;
-//! use kernel::workqueue::{self, impl_has_work, new_work, Work, WorkItem};
+//! use kernel::workqueue::{self, new_work, Work, WorkItem};
 //!
+//! #[derive(HasField)]
 //! #[pin_data]
 //! struct MyStruct {
 //!     value: i32,
 //!     #[pin]
+//!     #[field]
 //!     work: Work<MyStruct>,
 //! }
 //!
-//! impl_has_work! {
-//!     impl HasWork<Self> for MyStruct { self.work }
-//! }
-//!
 //! impl MyStruct {
 //!     fn new(value: i32) -> Result<Arc<Self>> {
 //!         Arc::pin_init(pin_init!(MyStruct {
@@ -76,23 +74,21 @@
 //!
 //! ```
 //! use kernel::sync::Arc;
-//! use kernel::workqueue::{self, impl_has_work, new_work, Work, WorkItem};
+//! use kernel::workqueue::{self, new_work, Work, WorkItem};
 //!
+//! #[derive(HasField)]
 //! #[pin_data]
 //! struct MyStruct {
 //!     value_1: i32,
 //!     value_2: i32,
 //!     #[pin]
+//!     #[field]
 //!     work_1: Work<MyStruct, 1>,
 //!     #[pin]
+//!     #[field]
 //!     work_2: Work<MyStruct, 2>,
 //! }
 //!
-//! impl_has_work! {
-//!     impl HasWork<Self, 1> for MyStruct { self.work_1 }
-//!     impl HasWork<Self, 2> for MyStruct { self.work_2 }
-//! }
-//!
 //! impl MyStruct {
 //!     fn new(value_1: i32, value_2: i32) -> Result<Arc<Self>> {
 //!         Arc::pin_init(pin_init!(MyStruct {
@@ -188,6 +184,11 @@
 use crate::{
     alloc::{AllocError, Flags},
     container_of,
+    field::{
+        Field,
+        HasField, //
+    },
+    macros::HasField,
     prelude::*,
     sync::Arc,
     sync::LockClassKey,
@@ -349,9 +350,11 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
 /// A helper type used in [`try_spawn`].
 ///
 /// [`try_spawn`]: Queue::try_spawn
+#[derive(HasField)]
 #[pin_data]
 struct ClosureWork<T> {
     #[pin]
+    #[field]
     work: Work<ClosureWork<T>>,
     func: Option<T>,
 }
@@ -534,19 +537,17 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
 
 /// Declares that a type contains a [`Work<T, ID>`].
 ///
-/// The intended way of using this trait is via the [`impl_has_work!`] macro. You can use the macro
-/// like this:
+/// The intended way of using this trait is via the `#[derive(HasField)]` macro. You can use the
+/// macro like this:
 ///
-/// ```no_run
-/// use kernel::workqueue::{impl_has_work, Work};
+/// ```
+/// use kernel::workqueue::Work;
 ///
+/// #[derive(HasField)]
 /// struct MyWorkItem {
+///     #[field]
 ///     work_field: Work<MyWorkItem, 1>,
 /// }
-///
-/// impl_has_work! {
-///     impl HasWork<MyWorkItem, 1> for MyWorkItem { self.work_field }
-/// }
 /// ```
 ///
 /// Note that since the [`Work`] type is annotated with an id, you can have several `work_struct`
@@ -559,7 +560,6 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
 /// - `work_container_of(raw_get_work(ptr)) == ptr` for any `ptr: *mut Self`.
 /// - `raw_get_work(work_container_of(ptr)) == ptr` for any `ptr: *mut Work<T, ID>`.
 ///
-/// [`impl_has_work!`]: crate::impl_has_work
 /// [`raw_get_work`]: HasWork::raw_get_work
 /// [`work_container_of`]: HasWork::work_container_of
 pub unsafe trait HasWork<T, const ID: u64 = 0> {
@@ -627,8 +627,24 @@ unsafe fn work_container_of(
 }
 pub use impl_has_work;
 
-impl_has_work! {
-    impl{T} HasWork<Self> for ClosureWork<T> { self.work }
+impl<T, const ID: u64> Field<T> for Work<T, ID> {}
+
+/// SAFETY: Per the safety requirement of `HasField`, `raw_get_field()` and `field_container_of()`
+/// return valid pointers and are true inverses of each other, hence the implementation below
+/// fulfills `HasWork`'s safety requirement as well.
+unsafe impl<T: HasField<T, Work<T, ID>>, const ID: u64> HasWork<T, ID> for T {
+    #[inline]
+    unsafe fn raw_get_work(ptr: *mut Self) -> *mut Work<T, ID> {
+        // SAFETY: Per the function safety requirement, `ptr` is a valid pointer.
+        unsafe { <T as HasField<T, Work<T, ID>>>::raw_get_field(ptr) }
+    }
+
+    #[inline]
+    unsafe fn work_container_of(ptr: *mut Work<T, ID>) -> *mut Self {
+        // SAFETY: Per the function safety requirement, `ptr` is a valid pointer, and it points to
+        // a work field in struct `T`.
+        unsafe { <T as HasField<T, Work<T, ID>>>::field_container_of(ptr) }
+    }
 }
 
 /// Links for a delayed work item.
-- 
2.50.1 (Apple Git-155)

