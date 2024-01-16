Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11B139C
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 02:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIWoa6Hq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5f2aab1c0c5so81518837b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jan 2024 18:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705372142; x=1705976942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nflN8NAphN7HqhleGwgwl0ipwLEgLSpIOkZn82KlVM4=;
        b=QIWoa6Hq4OaxM/WdUSzyeaK1NnGYr6K0PA/Sd6QGdUa0LeWipgRymutePvC+dhPwCg
         II5A/t37RkGsQpAT80lAv+p4QnskR0d7YZ6zQ/dNjfFIML//0gwUGCCaq8h6gAW00mSw
         a88yr2lYI2vigoPPv68dqI0L8DjgPJ1oB8bIfC5kRlPLQR+iLzFE3EHPPF1crY9BlK7E
         mEVTHD4H0pXrXu+YWMzLCY+0UmYxRFqYLhEcR0fKY4LvUi/YkBKjbZEWhBXpheFWzAS0
         rdKQBYfXrea8fgXAREl/9NTMp5860QwmfoPXQtunaC4w00Wev9+JGRSkVVmzRNz9J+i7
         lOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705372142; x=1705976942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nflN8NAphN7HqhleGwgwl0ipwLEgLSpIOkZn82KlVM4=;
        b=Z+5vR4wxcfBl6Hqd5Hu8BzcSKzrFwR2IiVvdjEnPkLeYfD8XL8IDL17DtAaKlMRR3n
         XfZS25hmmqFvUsIjBXvJfP2bZLfJ4KIrirO/jhmK72MPEhwRZYIJcpet91N3tn73aITp
         LOZ2eZMjfQTK5o93MN+sOXAH/KdWpsoEKvC8QSAcLRknHuho8Ra4/9VfJz/OjRgBlThE
         5L40kE5xI0IePt7g5e3dspi+wfEb69D8M7DgJTFIettxkhThWYC8XhP/ssvWN/TGEQU/
         MXlQbsHFOwIDB8PpEMUE88CCokxW3s834vsOZdnU/HYVCjn2i7P1h7oJmg0UE+NjAhZw
         z2Zw==
X-Gm-Message-State: AOJu0YzkVOT+ASHQogpwdq8IE88KSxS7OiZT5Ja2iSxcADXZEN0n/1kS
	UGZG3CuiusEk9QHXeB851GM=
X-Google-Smtp-Source: AGHT+IFwot2kowiJfs7d60ntPbYwEsJ368+BH5PYMh6QWIGDDT/vFQR13f5+d7KzmXOYB7CMBO2lrQ==
X-Received: by 2002:a81:c14c:0:b0:5e2:af70:4f11 with SMTP id e12-20020a81c14c000000b005e2af704f11mr4491070ywl.38.1705372141744;
        Mon, 15 Jan 2024 18:29:01 -0800 (PST)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id fv9-20020a05690c370900b005e3d45a78d2sm4422135ywb.75.2024.01.15.18.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 18:29:01 -0800 (PST)
Received: by Machine.localdomain (Postfix, from userid 1000)
	id 267F46A40038; Mon, 15 Jan 2024 21:29:01 -0500 (EST)
From: Antonio Hickey <antoniohickey99@gmail.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	Antonio Hickey <antoniohickey99@gmail.com>
Subject: [PATCH] rust: task: add `as_raw()` to `Task`
Date: Mon, 15 Jan 2024 21:28:22 -0500
Message-ID: <20240116022823.64058-1-antoniohickey99@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added new function `Task::as_raw()` which returns the raw pointer
for the underlying task struct. I also refactored `Task` to instead
use the newly created function instead of `self.0.get()` as I feel
like `self.as_raw()` is more intuitive.

Signed-off-by: Antonio Hickey <antoniohickey99@gmail.com>
---
 rust/kernel/task.rs | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index d2f2615fe4a1..72737f5d86ab 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -124,11 +124,16 @@ fn deref(&self) -> &Self::Target {
         }
     }
 
+    /// Returns a raw pointer to the underlying C task struct.
+    pub fn as_raw(&self) -> *mut bindings::task_struct {
+        self.0.get()
+    }
+
     /// Returns the group leader of the given task.
     pub fn group_leader(&self) -> &Task {
-        // SAFETY: By the type invariant, we know that `self.0` is a valid task. Valid tasks always
+        // SAFETY: By the type invariant, we know that `self.as_raw()` is a valid task. Valid tasks always
         // have a valid group_leader.
-        let ptr = unsafe { *ptr::addr_of!((*self.0.get()).group_leader) };
+        let ptr = unsafe { *ptr::addr_of!((*self.as_raw()).group_leader) };
 
         // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
         // and given that a task has a reference to its group leader, we know it must be valid for
@@ -138,43 +143,43 @@ pub fn group_leader(&self) -> &Task {
 
     /// Returns the PID of the given task.
     pub fn pid(&self) -> Pid {
-        // SAFETY: By the type invariant, we know that `self.0` is a valid task. Valid tasks always
+        // SAFETY: By the type invariant, we know that `self.as_raw()` is a valid task. Valid tasks always
         // have a valid pid.
-        unsafe { *ptr::addr_of!((*self.0.get()).pid) }
+        unsafe { *ptr::addr_of!((*self.as_raw()).pid) }
     }
 
     /// Returns the UID of the given task.
     pub fn uid(&self) -> Kuid {
-        // SAFETY: By the type invariant, we know that `self.0` is valid.
-        Kuid::from_raw(unsafe { bindings::task_uid(self.0.get()) })
+        // SAFETY: By the type invariant, we know that `self.as_raw()` is valid.
+        Kuid::from_raw(unsafe { bindings::task_uid(self.as_raw()) })
     }
 
     /// Returns the effective UID of the given task.
     pub fn euid(&self) -> Kuid {
-        // SAFETY: By the type invariant, we know that `self.0` is valid.
-        Kuid::from_raw(unsafe { bindings::task_euid(self.0.get()) })
+        // SAFETY: By the type invariant, we know that `self.as_raw()` is valid.
+        Kuid::from_raw(unsafe { bindings::task_euid(self.as_raw()) })
     }
 
     /// Determines whether the given task has pending signals.
     pub fn signal_pending(&self) -> bool {
-        // SAFETY: By the type invariant, we know that `self.0` is valid.
-        unsafe { bindings::signal_pending(self.0.get()) != 0 }
+        // SAFETY: By the type invariant, we know that `self.as_raw()` is valid.
+        unsafe { bindings::signal_pending(self.as_raw()) != 0 }
     }
 
     /// Returns the given task's pid in the current pid namespace.
     pub fn pid_in_current_ns(&self) -> Pid {
         // SAFETY: Calling `task_active_pid_ns` with the current task is always safe.
         let namespace = unsafe { bindings::task_active_pid_ns(bindings::get_current()) };
-        // SAFETY: We know that `self.0.get()` is valid by the type invariant.
-        unsafe { bindings::task_tgid_nr_ns(self.0.get(), namespace) }
+        // SAFETY: We know that `self.raw()` is valid by the type invariant.
+        unsafe { bindings::task_tgid_nr_ns(self.as_raw(), namespace) }
     }
 
     /// Wakes up the task.
     pub fn wake_up(&self) {
-        // SAFETY: By the type invariant, we know that `self.0.get()` is non-null and valid.
+        // SAFETY: By the type invariant, we know that `self.raw()` is non-null and valid.
         // And `wake_up_process` is safe to be called for any valid task, even if the task is
         // running.
-        unsafe { bindings::wake_up_process(self.0.get()) };
+        unsafe { bindings::wake_up_process(self.as_raw()) };
     }
 }
 
-- 
2.43.0

