Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281481922FA
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Aug 2024 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723133809; cv=none; b=NxkAIvJIONxERLxxL6a//vObaxy+vsa6huwytmAqqyfszHrHvb/gnPvzaSXGbbScglbHVlVnUZCu1/FuVWuPQSVcQ326M6UJ+w8+nRLQtwrRhy/lpbvCRo72rqRn/GuKdO1oWsN1EXzPAQ4TA+faR5WO8A0YJ9P17PY+g8tNyNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723133809; c=relaxed/simple;
	bh=bqzWJChdAg7lHPNiFP0jGirLPKKFpGxKrsuLPYcDmvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IaEfW/sRMH7myrQahLz2513AUNEiPmr1F1pR6AfvQqkmG0Bq9YJeBDIeK9L2O+nPNP81E9klS1Tvn6Ho0J9OUmU2l1AaFepG4ptLGGQ8NBUjbuadNVUPy/gTdBW05HU9CNw6rHBeFsRnKlMtcHgK5T83OpZnmoYK5v1mkm1ZnEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=snGZgyfd; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="snGZgyfd"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-699c81a261eso24733617b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Aug 2024 09:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723133807; x=1723738607; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mgZOQPECBcPtyO9Tuml8rLU+VtW+J83utu9PE84sJFg=;
        b=snGZgyfd6CkZ6Ey+FmEXqa66qXrTvBHqHsiqzESsiTuogSP1EXW1ch5KGB+rWKe20J
         1+XLoT0of41Lx3POk4t/Pk5Uy+D48HY01/sjY/H4/PZWjjRYUojRd0yDKaHlcW7bNLM9
         qryamCKwkzJP1hk158pmSwBryGtmtGb1c+t6oqBRt1BFQarUxDVFoAZD6AiuOk22d5Hk
         J/sw1Q5ibETECg7sM/eUnHB8Gz+sL5VMSmt2/8co4yICt57dp9HmcvVirolghoJtoMAL
         wWHaUHJl8zg8VDzTgYxoMV+td3Y2ow4Fk8BFq23CLrok6gLx9eGRVu1vj686zLgvOB5+
         L56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723133807; x=1723738607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgZOQPECBcPtyO9Tuml8rLU+VtW+J83utu9PE84sJFg=;
        b=lxVJADfq7rkRIwTND5Ycqptdolxm81PdYCxuciLG6gwQbRn/6lU6ci7rlYdXJYkPcN
         kjWuWy1GUzqA/1/2EDZlIqXvqmhBXTsE+U/C8zsfXzipZw6Gx8E3nIpmVbUBP7OSNcIr
         XYaPYhlfiq4b4lDG3OFf/0T9O2Efcs+lZiyfSnySlk1/BDszEgX5Pd0ReABQf4WTrF5c
         g76PyNyi42eX2Xfaon+h+qyt/WYF7Z2quRMfVhRBlx66VDIu9Q9wx3bitDi5HWfY3N4f
         7+P8glMmwbStwM8zdobHGMilQgJ3GLYuTaPbtWe8bAb2vipJbRjmdrTMD1Gu0TjA9NNH
         rvTw==
X-Forwarded-Encrypted: i=1; AJvYcCXf3kFJXkJNipOOBb+14dyzmq7HqxQJbsizOhW7m5plnSGO+pKg+5kIzrvKagvxknFzYVepsiLeb5DhqZS7gEAZcMPS9m/w8+4YctNYzwY=
X-Gm-Message-State: AOJu0YypbhEVBbtMn7wJp4nz/Mte1MZK9vi2YdaQDRLMRlKDi0r+h4U4
	HZDI3d4YbHOiTI8fgqJZFHjcxVB0oSOvZqD+mNTF1d3yUhPWDwsDdBFmXNnfX2BQ/loZ7515WHU
	sL8kWiC2bpWQUGA==
X-Google-Smtp-Source: AGHT+IFqHzUb94bbUZPgKWOUfadLCPmMGJwGpS9/jGmGXpeXlR5ildauu19lk1VnR2GS7JUSQ5tN/Z3wwhHrxpw=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a0d:d087:0:b0:648:3f93:61f2 with SMTP id
 00721157ae682-69bfb5f8bc6mr349197b3.6.1723133806987; Thu, 08 Aug 2024
 09:16:46 -0700 (PDT)
Date: Thu, 08 Aug 2024 16:15:50 +0000
In-Reply-To: <20240808-alice-file-v9-0-2cb7b934e0e1@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240808-alice-file-v9-0-2cb7b934e0e1@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7804; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=bqzWJChdAg7lHPNiFP0jGirLPKKFpGxKrsuLPYcDmvQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmtO9ZIM7QOHWa1SVfw/68dk6IXxKDJHOQ3HLUt
 pGxn/RTB2qJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrTvWQAKCRAEWL7uWMY5
 Rr2bD/92IH9YWW1s1K6XtjBKvnjTHz2EDM1bcVmjxTXZ0r4jvZ+C5N0Q7NFrFLSSeTSe0Xhl1d4
 h+qVfnSui3x7DmEhDDnkH8PAb8IML11qENgbMAmT1EqH0jA51B/f8jShdm/Fa+rcDc1zllE1jbx
 3Iqe/5JoOPYdywEp5h7UrsP12fzLqB3yN33O0cqfddtT6I5w3Q+gxw6vl9cJZBZ7UUtInErlK2Z
 cjthH4TkjZsKTjZLSv0jp7fw67p/lvhlHOrwDnqAHcdk4Dkf0NSGEv/i6XMcuFrAo/iwlIW8Dn/
 VSUgMj3Wg7kKrZxM6I/y0X8O8XhLx10xyFXgsjtbAxg3oAMHccPb5RFJCLYM2DZcgKw1/xBYxng
 fLkJq67Hqmm0Kr9Cf/eH5h7eowqAghowuuPcLkQ0o9XvaQOtF0g2gmZnND6fhyoyfCtuLfzN1uU
 oKXeAxp8TUxUoGrFSsR7FSa6ngZCL00++PMdOyNqMEnHgEYBzj9QAC10p5eGnMd6SBlB1f7os8O
 sbS3+X5TToLVzoXmMVJwdmOb6wcBP6zDRhwIX3qjseBANui29FQ0oegQ4Xhi7GrlDDuHnWfYJzR
 4rpNfj9a38eWYpPSTtbJaDdX/t80u5GRbznpZGZZuRfbrJwpgxP/EMvxGaFJdFS1gCCSzV1MVbc KXIsApw89FSTD5g==
X-Mailer: b4 0.13.0
Message-ID: <20240808-alice-file-v9-7-2cb7b934e0e1@google.com>
Subject: [PATCH v9 7/8] rust: file: add `Kuid` wrapper
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="utf-8"

Adds a wrapper around `kuid_t` called `Kuid`. This allows us to define
various operations on kuids such as equality and current_euid. It also
lets us provide conversions from kuid into userspace values.

Rust Binder needs these operations because it needs to compare kuids for
equality, and it needs to tell userspace about the pid and uid of
incoming transactions.

To read kuids from a `struct task_struct`, you must currently use
various #defines that perform the appropriate field access under an RCU
read lock. Currently, we do not have a Rust wrapper for rcu_read_lock,
which means that for this patch, there are two ways forward:

 1. Inline the methods into Rust code, and use __rcu_read_lock directly
    rather than the rcu_read_lock wrapper. This gives up lockdep for
    these usages of RCU.

 2. Wrap the various #defines in helpers and call the helpers from Rust.

This patch uses the second option. One possible disadvantage of the
second option is the possible introduction of speculation gadgets, but
as discussed in [1], the risk appears to be acceptable.

Of course, once a wrapper for rcu_read_lock is available, it is
preferable to use that over either of the two above approaches.

Link: https://lore.kernel.org/all/202312080947.674CD2DC7@keescook/ [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers.c                  | 45 ++++++++++++++++++++++++++++
 rust/kernel/cred.rs             |  5 ++--
 rust/kernel/task.rs             | 66 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 7db502f5ff5e..73a133b92017 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -19,6 +19,7 @@
 #include <linux/jiffies.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
+#include <linux/pid_namespace.h>
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/security.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 33d12d45e4f6..69ed229c32c3 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -178,6 +178,51 @@ void rust_helper_put_task_struct(struct task_struct *t)
 }
 EXPORT_SYMBOL_GPL(rust_helper_put_task_struct);
 
+kuid_t rust_helper_task_uid(struct task_struct *task)
+{
+	return task_uid(task);
+}
+EXPORT_SYMBOL_GPL(rust_helper_task_uid);
+
+kuid_t rust_helper_task_euid(struct task_struct *task)
+{
+	return task_euid(task);
+}
+EXPORT_SYMBOL_GPL(rust_helper_task_euid);
+
+#ifndef CONFIG_USER_NS
+uid_t rust_helper_from_kuid(struct user_namespace *to, kuid_t uid)
+{
+	return from_kuid(to, uid);
+}
+EXPORT_SYMBOL_GPL(rust_helper_from_kuid);
+#endif /* CONFIG_USER_NS */
+
+bool rust_helper_uid_eq(kuid_t left, kuid_t right)
+{
+	return uid_eq(left, right);
+}
+EXPORT_SYMBOL_GPL(rust_helper_uid_eq);
+
+kuid_t rust_helper_current_euid(void)
+{
+	return current_euid();
+}
+EXPORT_SYMBOL_GPL(rust_helper_current_euid);
+
+struct user_namespace *rust_helper_current_user_ns(void)
+{
+	return current_user_ns();
+}
+EXPORT_SYMBOL_GPL(rust_helper_current_user_ns);
+
+pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
+				  struct pid_namespace *ns)
+{
+	return task_tgid_nr_ns(tsk, ns);
+}
+EXPORT_SYMBOL_GPL(rust_helper_task_tgid_nr_ns);
+
 struct kunit *rust_helper_kunit_get_current_test(void)
 {
 	return kunit_get_current_test();
diff --git a/rust/kernel/cred.rs b/rust/kernel/cred.rs
index 92659649e932..81d67789b16f 100644
--- a/rust/kernel/cred.rs
+++ b/rust/kernel/cred.rs
@@ -10,6 +10,7 @@
 
 use crate::{
     bindings,
+    task::Kuid,
     types::{AlwaysRefCounted, Opaque},
 };
 
@@ -61,11 +62,11 @@ pub fn get_secid(&self) -> u32 {
     }
 
     /// Returns the effective UID of the given credential.
-    pub fn euid(&self) -> bindings::kuid_t {
+    pub fn euid(&self) -> Kuid {
         // SAFETY: By the type invariant, we know that `self.0` is valid. Furthermore, the `euid`
         // field of a credential is never changed after initialization, so there is no potential
         // for data races.
-        unsafe { (*self.0.get()).euid }
+        Kuid::from_raw(unsafe { (*self.0.get()).euid })
     }
 }
 
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 367b4bbddd9f..1a36a9f19368 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -9,6 +9,7 @@
     types::{NotThreadSafe, Opaque},
 };
 use core::{
+    cmp::{Eq, PartialEq},
     ffi::{c_int, c_long, c_uint},
     ops::Deref,
     ptr,
@@ -96,6 +97,12 @@ unsafe impl Sync for Task {}
 /// The type of process identifiers (PIDs).
 type Pid = bindings::pid_t;
 
+/// The type of user identifiers (UIDs).
+#[derive(Copy, Clone)]
+pub struct Kuid {
+    kuid: bindings::kuid_t,
+}
+
 impl Task {
     /// Returns a raw pointer to the current task.
     ///
@@ -157,12 +164,31 @@ pub fn pid(&self) -> Pid {
         unsafe { *ptr::addr_of!((*self.0.get()).pid) }
     }
 
+    /// Returns the UID of the given task.
+    pub fn uid(&self) -> Kuid {
+        // SAFETY: By the type invariant, we know that `self.0` is valid.
+        Kuid::from_raw(unsafe { bindings::task_uid(self.0.get()) })
+    }
+
+    /// Returns the effective UID of the given task.
+    pub fn euid(&self) -> Kuid {
+        // SAFETY: By the type invariant, we know that `self.0` is valid.
+        Kuid::from_raw(unsafe { bindings::task_euid(self.0.get()) })
+    }
+
     /// Determines whether the given task has pending signals.
     pub fn signal_pending(&self) -> bool {
         // SAFETY: By the type invariant, we know that `self.0` is valid.
         unsafe { bindings::signal_pending(self.0.get()) != 0 }
     }
 
+    /// Returns the given task's pid in the current pid namespace.
+    pub fn pid_in_current_ns(&self) -> Pid {
+        // SAFETY: We know that `self.0.get()` is valid by the type invariant, and passing a null
+        // pointer as the namespace is correct for using the current namespace.
+        unsafe { bindings::task_tgid_nr_ns(self.0.get(), ptr::null_mut()) }
+    }
+
     /// Wakes up the task.
     pub fn wake_up(&self) {
         // SAFETY: By the type invariant, we know that `self.0.get()` is non-null and valid.
@@ -184,3 +210,43 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         unsafe { bindings::put_task_struct(obj.cast().as_ptr()) }
     }
 }
+
+impl Kuid {
+    /// Get the current euid.
+    #[inline]
+    pub fn current_euid() -> Kuid {
+        // SAFETY: Just an FFI call.
+        Self::from_raw(unsafe { bindings::current_euid() })
+    }
+
+    /// Create a `Kuid` given the raw C type.
+    #[inline]
+    pub fn from_raw(kuid: bindings::kuid_t) -> Self {
+        Self { kuid }
+    }
+
+    /// Turn this kuid into the raw C type.
+    #[inline]
+    pub fn into_raw(self) -> bindings::kuid_t {
+        self.kuid
+    }
+
+    /// Converts this kernel UID into a userspace UID.
+    ///
+    /// Uses the namespace of the current task.
+    #[inline]
+    pub fn into_uid_in_current_ns(self) -> bindings::uid_t {
+        // SAFETY: Just an FFI call.
+        unsafe { bindings::from_kuid(bindings::current_user_ns(), self.kuid) }
+    }
+}
+
+impl PartialEq for Kuid {
+    #[inline]
+    fn eq(&self, other: &Kuid) -> bool {
+        // SAFETY: Just an FFI call.
+        unsafe { bindings::uid_eq(self.kuid, other.kuid) }
+    }
+}
+
+impl Eq for Kuid {}

-- 
2.46.0.rc2.264.g509ed76dc8-goog

