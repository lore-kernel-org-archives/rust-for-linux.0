Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6D35D612
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770914685; cv=none; b=gSoSe83ioBQbzDa5MLSqKjGeDRYjKTh/dIAs5jeUm7LXsRuPNRnn3581xclEUGBaZO3JuQ2+HFSCBO5iSPJEqhAWiLkYzTI1h19zKYrv1UolJy9FMwB0C/tlhYozfrTxALoqoNXJrDkGsnotEimJb9aH9A628MazZ9nd+fTzqQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770914685; c=relaxed/simple;
	bh=fnLASdRdlmo9w5vmeFfi3RRSbxD+NZH2u+fYKknSXzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H8UCAbDWSRYf0ZWViI1yXsV8EJ7heePSTlq+N+WivegK4C98K5IN48VUrtgxtH+4BLbgkXmhglZfH7nMnJMeYgH8OLCncwYyeD6flzS0T+3ZZ/bzYPMgasqkZ4ZF0fnzyi8JIe0KvljYh7I0UZggM2KS0jy/8nMOS41IAykt6UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FQHK651e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FQHK651e"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so68175e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770914666; x=1771519466; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn7HRp9kZ1ePRvS2UgqTH5jOXAnJnoqPXBxFpVwue5g=;
        b=FQHK651eFG5AnKq/18Xnt9x6FEOZJeA/rIqnBND1kkxmLLwMHG7csvSkWA6J+kEo1g
         0SwJC7tOMQ5TX91AqIDdABzxFSbpGWIOLL/4ifb411DHbqX1C1JwQZ9ir8nGwCDHUuXg
         sMXcvzu80x/zQMgvYX270KG85VTXvRPTxvfzrmgrF2vUUGoKuY2zzj8TO96FZ7hEAU3c
         F+fmaFNGk0pWVSA0IayxTs8EjJ9303eTEbTo/XnyKEI59P39zhhWB5cwcqdxHNdTATbC
         lve8MCG8M0F9kAv0wHKAeaShVicMJ07u5edq5gDQAeOVX9KgFps45YvFlzlBXxeXBIM+
         q2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770914666; x=1771519466;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nn7HRp9kZ1ePRvS2UgqTH5jOXAnJnoqPXBxFpVwue5g=;
        b=dxDm6wT/Rt/sbYSo3b1PsRu6Fu5TbfR8DTZG37FXWPmfTXKCcotL+omSRzAMt9FWVn
         6rYM/DWZAM2Nn3lfny2KOnasgO14MtXe44g3LSqmzE2Ub4Koz5DxezEWLh+AVfpsAgjU
         3afd2inpYIuW+S4ko1nELynYE/AC6ni6BVDIMdsU2W/cgRVvHfsrauKKrHGqsCtNjxNx
         ZkAcmEWDUe4iHYMD3E1VurJF9G21gtdPxXHrbBLZkG2J2yGXYKqW9Mu5OeE7jdqBduHl
         vmTEqy3qe8zWjRmRz8gRUf6M9XdaFkQuUdmxZWoQylVQ4uBxcEuDrXwE6TKEJ4i7LHWk
         W/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXPnzhuJEBSWiGdsGujIV+yX2ip68yQvkun3ercTyGn1pTJXeQwijek4lTfzQNQ0BVJty9x01OSn2nGK4Dlhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy65cZmZ/VAMlqrDt8iWC3kjdXsLjbnRqFodpcuSZAQHIGMu494
	Id0SKWdl4gRJeFr3djkLpaZM+9yR0Fv2354J9i2np91mf0CeJtuJ0OvSQkTyBKLB3Q==
X-Gm-Gg: AZuq6aIckOPzP2Oz+fKun+ZJrFrWX2j0TYD6r7pfT59wbuI5N1QQiKO1ZpZ2iKFj92b
	D73Rhcur6eSGtbykYRYWXaceVQGGNRwAN+umMSOeowfxTJXQIDldnsF84XrBQpebje3y4qfUrNC
	gb1uso8YvOkabawt7SQidfFQbIXbW1kR8l35yhwU14OsFPCmBGGwHhgSz9yrzxqn+YhOBjCZTGG
	sPT4+WUFp+tTmvub2h1hB/dovVtQTggrLbFZJ3iU7gOQue6VHaFwQMS2/wWHsGlliQGFsFHQu2+
	73yLmiSbcPHjsh5urGjeh7bNZa9AkgFxDVYgbu1KPBF2iymBDSSOeGgyXX0JpNv5ySEWqUAWyvu
	EdeCsFeuWFibuEFo9u0Qmvp5vYkSxtsU827qY52gx8b9ZOc0Jr+KiIaOgPFRpcEuKH76SuAJyum
	ylwxTqIZgdVKX+fQKCh8D2Llgl/ca/XsZR0eNVEDbpA4Xs7U5R7kU=
X-Received: by 2002:a05:600c:8a0a:20b0:477:95a8:3803 with SMTP id 5b1f17b1804b1-48366d58fecmr568465e9.13.1770914665961;
        Thu, 12 Feb 2026 08:44:25 -0800 (PST)
Received: from localhost ([2a00:79e0:288a:8:11ea:f041:437e:7de8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43783e0196bsm14208731f8f.23.2026.02.12.08.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 08:44:25 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Thu, 12 Feb 2026 17:44:15 +0100
Subject: [PATCH] rust: task: clean up safety issues wrt de_thread()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-rust-de_thread-v1-1-948f5b992624@google.com>
X-B4-Tracking: v=1; b=H4sIAF4DjmkC/x3MMQqAMAxA0auUzBbaoIJeRUSqiZpFJa0iiHe3O
 L7h/wciq3CE1jygfEmUfcvwhYFpDdvCVigb0GHt0KPVMyZLPKRVOZB1gRpflYFpdJCjQ3mW+x9
 2/ft+QDGN+mAAAAA=
X-Change-ID: 20260212-rust-de_thread-0ad9154aedb0
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: Wedson Almeida Filho <walmeida@microsoft.com>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770914662; l=4141;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=fnLASdRdlmo9w5vmeFfi3RRSbxD+NZH2u+fYKknSXzM=;
 b=bHU6ABu01nN//km96QLGFubDoobsaaIXah5mXJKYiL5NIDOi9+t7JtUsQcseKhOxncbDLFoSF
 E1oOsakHPGiAONZWR9xD5QAEKXzcjGvKD9XYWuRwEmrMGYCXpKfuFDS
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

(Note: This is not a bugfix, it just cleans up incorrect assumptions.)

Task::pid() and Task::group_leader() assume that task::pid and
task::group_leader remain constant until the task refcount drops to zero.

However, Linux has a special quirk where, when execve() is called by a
thread other than the thread group leader (the main thread), the thread
calling execve() swaps its identity with the thread group leader's,
becoming the new thread group leader. This means task::pid and
task::group_leader can't be assumed to be immutable for non-current tasks.
(The actual swapping of PIDs is implemented in exchange_tids(); the change
of leadership is in de_thread().)

For reference, you can see that accessing the ->group_leader of some random
task requires extra caution in the prlimit64() syscall, which grabs the
tasklist_lock and has a comment explaining that this is done to prevent
races with de_thread().

Signed-off-by: Jann Horn <jannh@google.com>
---
 rust/kernel/task.rs | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 49fad6de0674..989165116278 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -103,7 +103,7 @@ macro_rules! current {
 unsafe impl Send for Task {}
 
 // SAFETY: It's OK to access `Task` through shared references from other threads because we're
-// either accessing properties that don't change (e.g., `pid`, `group_leader`) or that are properly
+// either accessing properties that don't change or that are properly
 // synchronised by C code (e.g., `signal_pending`).
 unsafe impl Sync for Task {}
 
@@ -204,23 +204,13 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
         self.0.get()
     }
 
-    /// Returns the group leader of the given task.
-    pub fn group_leader(&self) -> &Task {
-        // SAFETY: The group leader of a task never changes after initialization, so reading this
-        // field is not a data race.
-        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
-
-        // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
-        // and given that a task has a reference to its group leader, we know it must be valid for
-        // the lifetime of the returned task reference.
-        unsafe { &*ptr.cast() }
-    }
-
     /// Returns the PID of the given task.
     pub fn pid(&self) -> Pid {
-        // SAFETY: The pid of a task never changes after initialization, so reading this field is
-        // not a data race.
-        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
+        // SAFETY: The pid of a task almost never changes after initialization,
+        // so reading this field is usually not a data race.
+        // The exception is a race where the task is part of a process that
+        // goes through execve(), see exchange_tids().
+        unsafe { ptr::addr_of!((*self.as_ptr()).pid).read_volatile() }
     }
 
     /// Returns the UID of the given task.
@@ -345,6 +335,18 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
         // `release_task()` call.
         Some(unsafe { PidNamespace::from_ptr(active_ns) })
     }
+
+    /// Returns the group leader of the current task.
+    pub fn group_leader(&self) -> &Task {
+        // SAFETY: The group leader of the current task never changes in syscall
+        // context (except in the implementation of execve()).
+        let ptr = unsafe { *ptr::addr_of!((*self.as_ptr()).group_leader) };
+
+        // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
+        // and given that a task has a reference to its group leader, we know it must be valid for
+        // the lifetime of the returned task reference.
+        unsafe { &*ptr.cast() }
+    }
 }
 
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.

---
base-commit: 192c0159402e6bfbe13de6f8379546943297783d
change-id: 20260212-rust-de_thread-0ad9154aedb0

--  
Jann Horn <jannh@google.com>

