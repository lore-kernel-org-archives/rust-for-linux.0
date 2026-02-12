Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2F35E558
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770934340; cv=none; b=hcilOB5kDdhgpkxSdrMAA+/Gm+nXvcfbHx+c0ul2Now9sVElH3jDjZMq3ITTss8MtwEokqt+/nADwTlP8Hm4PGskXlAgcrOfsBzCNJmo6c45kt1CitlCPJDeRsEIbQq0lTmfOlMIAF+e4d107JOTmKyn0z/oNgs+wF1S6mgLZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770934340; c=relaxed/simple;
	bh=WLZFrFNJUZZbzdI3MvDzzs0Zz5CI6Ca3g0rhOXh5p+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n0+ZdJsVtQzpmaQDIx8fwUc2n9u/TaKRaYqCFJkhO0ThQhqWHk6Hl4HDgZJzgetgV5wSJ1YSRbzH78xme638sgK8uzTjTP5d7ZHmqu9VIxMioZlfPZXZXDmTcSRs7CtsfeiR6jI/8airMs+mXfXafVbW9f+IcNp4bsFlu0aYIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UM/L+H+Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UM/L+H+Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so10505e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770934338; x=1771539138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq8Akz2Pc6zq198eJ9mNj+KA928E8lN2gMAzGlMh/yM=;
        b=UM/L+H+Y0dj1569uRHlGkuZGhmgDScM9486EZ52mVOaWAS0wWoHb5H3H78AgXYnhDZ
         KTQAszVGvYfaIda3h5IvUliR3E5hJPXpbSn6X0a3INxM4+nDzk4yEgenU1Uh4DShPu6u
         4GbfTDBoyrw/nq8GGgPoXoQEVLP40Nh8bmmUgeNy4KRZ87L5+tMXd3kKA+ja3XXh1dxY
         fwKb6H4SY9xABK+fc/6FzKMFPz0QzrqVKw2UmcjQhppfRqQ9f0UQtXwJ9OItnZ8eeAii
         E96vgZ9bCrF7xYzeU/elNdWq2eZcpeQdGr80A/TTxEbhkBDUcNiYx0dqp1NZrUAlK2ob
         LqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770934338; x=1771539138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xq8Akz2Pc6zq198eJ9mNj+KA928E8lN2gMAzGlMh/yM=;
        b=hdCcbnNLwZMPMLjTCZW2SibpJwKB3FQhk/xLK3rCxmHI7B5cueSGRyWmkZzVUmjCYL
         YmNMvdciNzP0UdW23INAfDfyEIRPfgLn4HpNoQJVlpxUvJJXMyhoiuZofc7eBw2/X32M
         gQ9oREc6ChxzhhTcrF4wegOE2rvQ8HFQpR3vBoUiQtfeIrF+lW5aIpxqCEMkKtvkJ0wl
         1Y5KO6iDLzshBEwc2lLmF7Qu2buxL+IHXw9DISW1VmyTf9XXDBESe014hoh//swWhkYu
         M0dgD8D3/61n99+OmifuCjN1fPMuX2ZvZNCOyx9HHEUzrdyh96Xb4rHLxppcmMLyUOL2
         OASA==
X-Forwarded-Encrypted: i=1; AJvYcCUVRCpBXg//a1SyiqmlD7uigtpMq72p43jSdBo7cJSjtOjln9rmTePnBZABVMBauIgURXDA8frZFXD2XmEcyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTsDn+zOX7cQ8r48a/NXPmCS/C12d6QPab3WVwCONoFriPePlZ
	D7qQFRcu9oaF17dhH6iaKm0tLRJK6dd1fJQw0U9e+2qB+8x73nDw1TnLA5Ce0znCFg==
X-Gm-Gg: AZuq6aJBo34K6tSHyUPqb0wormxMx095B7mP3wrGdpWFaXrJyiZ6ZjZRZHkTLvH937Z
	OPnMMH0uUiifOn8VE+C/uX3lXVOtvYH0VmQRQwn4DM+uClP+MzJlhA+WJO0EIzqQohRIC6xldEZ
	za1CotZpj5PkSySDHYel97B5GVdfg3mZaOzIoEbKpkBm6JtorJ45+2wuf28EX6yA+ASu0CYM5Az
	iq7xJ2s0z52DAxG1k8HGahCn5LiahMrOhf9YKCbm66ugMtskg/jL/XytLjhbQxlPw5+aZEuteJJ
	1uYeHSx7sVqPg7jOfvd738kE8daAgj84V4vrOznp1cWGGRrqP4uz+++nAunIXcxgU6wWyD4ZSDd
	xFSPJyF8HjU/QvqKfbgO3GE01+PUbSHpM8XYIwAu6NcD/pzgU5fJsJJeGAj7klsMTqJqWoc+q5G
	d+FywdItE1Z9LNUgo3OHogSzjgR8XJwaBUsrBShbDy0tmy98TxEbLHGhDycZIP6Q==
X-Received: by 2002:a05:600c:a59c:b0:47d:7304:d759 with SMTP id 5b1f17b1804b1-48371cd4901mr24245e9.15.1770934337474;
        Thu, 12 Feb 2026 14:12:17 -0800 (PST)
Received: from localhost ([2a00:79e0:288a:8:c531:3fec:ad3b:1a8d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796a5acaasm903029f8f.6.2026.02.12.14.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 14:12:16 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Thu, 12 Feb 2026 23:12:06 +0100
Subject: [PATCH v2 1/2] rust: task: limit group_leader() to current
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-rust-de_thread-v2-1-7d274c4fd02e@google.com>
References: <20260212-rust-de_thread-v2-0-7d274c4fd02e@google.com>
In-Reply-To: <20260212-rust-de_thread-v2-0-7d274c4fd02e@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770934330; l=3390;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=WLZFrFNJUZZbzdI3MvDzzs0Zz5CI6Ca3g0rhOXh5p+8=;
 b=7+Y0mIogC+d0XpSQoKvJFg+oEOYeZLmZghkPOS/M3DTG1DGeic1rkKymaB2aA14mlBBXgT71W
 lxuWFaFNKBHARoKuChKuzqhSNg7FruPVrHJ3aYJBGDDFgsSfyHZ2c2y
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

(Note: This is not a bugfix, it just cleans up an incorrect assumption.)

Task::group_leader() assumes that task::group_leader remains constant until
the task refcount drops to zero.

However, Linux has a special quirk where, when execve() is called by a
thread other than the thread group leader (the main thread), de_thread()
swaps the current thread's identity with the thread group leader's,
making the current thread the new thread group leader.
This means task::group_leader can't be assumed to be immutable for
non-current tasks.

For reference, you can see that accessing the ->group_leader of some random
task requires extra caution in the prlimit64() syscall, which grabs the
tasklist_lock and has a comment explaining that this is done to prevent
races with de_thread().

Signed-off-by: Jann Horn <jannh@google.com>
---
 rust/kernel/task.rs | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 49fad6de0674..91ad88cdfd3b 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -103,7 +103,7 @@ macro_rules! current {
 unsafe impl Send for Task {}
 
 // SAFETY: It's OK to access `Task` through shared references from other threads because we're
-// either accessing properties that don't change (e.g., `pid`, `group_leader`) or that are properly
+// either accessing properties that don't change or that are properly
 // synchronised by C code (e.g., `signal_pending`).
 unsafe impl Sync for Task {}
 
@@ -204,18 +204,6 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
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
         // SAFETY: The pid of a task never changes after initialization, so reading this field is
@@ -345,6 +333,18 @@ pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
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

-- 
2.53.0.273.g2a3d683680-goog

