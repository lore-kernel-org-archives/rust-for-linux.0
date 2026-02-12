Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880F35EDA7
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 22:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770934343; cv=none; b=HCp6BRcX/0uQrPIlskLxNWcb4Xoc3eWtu893knEtUEzRmKK6shKwowlwuAm2wNdRnF3aM537XmgxaoRSwnld9K6h8iQzofpB/UQP3V/5AFXPBzNeNum6sJ06y9wbbvCZ5lZWfD4F463lqsWqwHnqcUBP4+dGTys40fWNsvAhnr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770934343; c=relaxed/simple;
	bh=7V2N6dp2rjo7koplHKhlgc4XVo2ZSpj3B/T/irCiBIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeYszNWznafZuH/oBhOyC85lLozlkb6ylG3poX3a27V51j7ORYxxL2jdLEZeH+bZG+QsyOpfzYSf7wBaxPpcrmQaAkSSs1V9i8NY/nxl4TvmnuI2SUmjY0azJVnETOHps5pcnNYc394881WarJzXhu9CXl3K2w5rQr0JG7GHeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KJcVylDS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KJcVylDS"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so10535e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 14:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770934340; x=1771539140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fe2Y/SZJ5x/5lMCQoOZFFno/AsLWveHnxx6IJQErxeI=;
        b=KJcVylDSySiSj65nW6r98Ss8e+Jv3XVnwiLIiAb23HIiw8HFl7ARKD1MqWi1ELrRUz
         xBzPpNv66mAAYlPo9GrZz/DpunEkOtrV5iANTx+AN8XmpTk6ye0npWAumRhMr9HPtq3U
         InYnZoP4KjAe0lVIcsXwjodq76tbkB9Nf1iCI4WZkPPbCwRoD2Iq3APp/1fifAPwC0Uw
         zaibWO5GzqrbNzEjqrT7ALS2X3iVZveTk9fURqXdTQo26n1c2TcRBOy2MLCtfXrKzK0e
         hGKwbuEChMyQEqzI6v9BfdGZk96WvyaYRSwiztdcwubyA7loj4jdb53ZBz3xuVlM5Dij
         9Ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770934340; x=1771539140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fe2Y/SZJ5x/5lMCQoOZFFno/AsLWveHnxx6IJQErxeI=;
        b=BBBtHv1pzZxuog84ZQ8zzzl1vQElIvfuKsXDxzg4/NkroDGGFjAsqwx4okHbj3DoLD
         O2PfjeoAn5/K2uDa799ELUq1+Woge6eZcXWrfAHPc0y0M5I0ANIHURitv+D5VstjPNBx
         1475Ed+TTNfjLfbc+fCxNAK4wQ5NO+WqEttdF09AQ+gzUknsugLcGLBPHjNaKUIKI8RI
         hvV++/ZOXTsWWnC1OuzcNhYjYJsF18s8vZAckYv9E60xZ3HLclbylVErYN4AVcpF+ql0
         k5qITKZXcESf41kdgBleTfVePurmfGKcQ/uw/kLsKVLtpUhK80tfjJ8mW30wRXHtUvlU
         G98w==
X-Forwarded-Encrypted: i=1; AJvYcCWNgo90zZAMoBL31Md8regWjiFuJvHTKu3s15d5JuDToZZijs+dmSC10OdKgaCbMntXOYEvjWODHPRb5F/zbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfCkra3lqUDFUU6r1K+/FBRrcxWn+rsFMaw8yxS/GL/GzxLZj
	RG0FkiU5xzJtktTUY/tLqZaNrOw0V4j2b7cMZOBi9aJnrtoH7WfSRJ7cx5wzaXe6Ug==
X-Gm-Gg: AZuq6aJ9wLcGNuuu9BHtEufPzicuX5XFMjwZAb4qcTAfBLaZ5Nd7w0M81GjWsshPJjY
	f3UT1G+CkBr8OxWGcCdGqQNGXc5hqNdbYjjxSCEaajKjJLH8q2CIM5i+S2CMB+xsQkEvJD/0eIG
	phmCyJM2TgaY7JYkCusB9qbWVKZc49egqegNMFp2XrMDoAuehlvRDh/W3dcelh6IqDFn6xR0Oe+
	5R8rCvZEZyngR5SgnTlxpGz+QjeysQ1nBPCS5joiRs354Yc5s0xK1khHZvioDY1WWbWoVQlOCIN
	Oa/D364TD2TL9emnFOlleAIeyNWnFCsIN8pzHhivdXHJkQd6cWhUiyM58dv06/GwlLqA8Nw4yJd
	xOYNOnWgy/gyjPD8GQHMrVdmFiJblngYmg1SnmbpxHEjAZnkND9ZLxoearckRH8uWZl+Bz5MZa3
	J+505X4Q0gk7foY0J1ortDo14pzUCQryHeGQ4prkncJanbJg1Zy4s=
X-Received: by 2002:a05:600c:3b8b:b0:477:95a8:2562 with SMTP id 5b1f17b1804b1-48371cd4764mr77525e9.13.1770934339797;
        Thu, 12 Feb 2026 14:12:19 -0800 (PST)
Received: from localhost ([2a00:79e0:288a:8:c531:3fec:ad3b:1a8d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796abc85csm773992f8f.22.2026.02.12.14.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 14:12:18 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Thu, 12 Feb 2026 23:12:07 +0100
Subject: [PATCH v2 2/2] rust: task: use atomic read for pid()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-rust-de_thread-v2-2-7d274c4fd02e@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770934330; l=1995;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=7V2N6dp2rjo7koplHKhlgc4XVo2ZSpj3B/T/irCiBIU=;
 b=4fc49eYXZWYTuHDde4f87z/If6iB+RrHcXKLQz6Nn0RyvL4RVi6DcHMdRnlpDHtC5kby6UFDU
 LkUtCBYobLwB0b8lyDokLxInpJtyEI+di+sWngPIGzxkb7z2JltPgIC
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

(Note: This is not a bugfix, it just cleans up an incorrect assumption.)

Task::pid() wrongly assumes that task::pid remains constant until the task
refcount drops to zero.

However, Linux has a special quirk where, when execve() is called by a
thread other than the thread group leader (the main thread), the thread
calling execve() swaps its identity with the thread group leader's,
becoming the new thread group leader. This means task::pid can't be assumed
to be immutable for non-current tasks.
(The actual swapping of PIDs is implemented in exchange_tids().)

Signed-off-by: Jann Horn <jannh@google.com>
---
 rust/kernel/task.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 91ad88cdfd3b..de0d90b47862 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -10,6 +10,8 @@
     mm::MmWithUser,
     pid_namespace::PidNamespace,
     sync::aref::ARef,
+    sync::atomic::ordering::Relaxed,
+    sync::atomic::Atomic,
     types::{NotThreadSafe, Opaque},
 };
 use core::{
@@ -206,9 +208,13 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
 
     /// Returns the PID of the given task.
     pub fn pid(&self) -> Pid {
-        // SAFETY: The pid of a task never changes after initialization, so reading this field is
-        // not a data race.
-        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
+        // SAFETY: The pid of a task almost never changes after initialization,
+        // so reading this field is usually not a data race.
+        // The exception is a race where the task is part of a process that
+        // goes through execve(), see exchange_tids().
+        // A temporary mutable pointer is created, but only actually used for
+        // a load.
+        unsafe { Atomic::from_ptr(&raw mut (*self.as_ptr()).pid).load(Relaxed) }
     }
 
     /// Returns the UID of the given task.

-- 
2.53.0.273.g2a3d683680-goog

