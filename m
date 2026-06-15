Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560563E7BDD
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527029; cv=none; b=pQ+5ixfmqKpKwZKgpQrA3He7krEspBNSZ+ZXUEeRagVaqZeprFukOkXzFSH0zUO+PQIjSJYaNuUMzdwxekL/GACOphDLUy8GxiK9iaCYIUSjhPBFB0h5xk6G5YK5VsfKlmCLwvpIsqxugTuaNJukdUq9HJ11FFqpKOQGj2qNXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527029; c=relaxed/simple;
	bh=pRWHCKfc9EIDv8OD6Ag8tpxvHh3fSgM2IuS8g8uBlKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bgYLcRTSpubNrJI5EHK8wz5rbeCeujP7bXciNqHU3D3k4AP+ARj4uVBmqmlIcXa3qArq5LZpDblnidCfkFeuiH0yNNPj9buZLHmvNaLtqNAg5m1uD5SPu5pL6FVEy6iuxstdADorZ3Qs2+LlHAJ3vw3IvVPEy6toJtQFxAeGvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IRk11mmp; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IRk11mmp"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b7959b9fso31972415e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527025; x=1782131825; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNmtccmn4gsPTWx69maePoOlG2Lp/iRYXLRtIHek0ps=;
        b=IRk11mmpW3WN5aaRGKMI32OmiaOoTe+w1si9RNkfx7sWN6tT8jVeNN9TVu6f30Meaz
         sOYhrT4T2HNopLchQxChtVCYGnpUfR/f6glzsw9gOKTqSiBJOlzEU31ijeDtO/zpmMQk
         VXzYQpflbtqFs7kP/W5j8LW0KxBJ1sogpZvHvsLUaLG+R5AUQfT7zOTUmPEzXoWWHbfK
         KvSfL1OEQuIUGGrY4ZRO67L1JenKPbmtw38qOrWNDFyM0kLdB5veR5mpx6nu+LtwkqKu
         A8+5HMqRZTHgn5uf34Pdg1C7ICf2kmKWDHNXPYsdSYMKX9+VfgCcW7t4RqWWwGixy5++
         529Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527025; x=1782131825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNmtccmn4gsPTWx69maePoOlG2Lp/iRYXLRtIHek0ps=;
        b=Z3OsgwrJW2WogQ4gge/Hf+KkHnevBy+sx5yUoHqrbdWEZUWKdevEaf2GFnEcU3q2od
         7Uyj0Y7oFBX9K9oArmdHRCarnUSw6wGrRNCHOskgfJMrFDzg9IsXrTzP3qDIMYMkMRJq
         pWNFJBP/r4mkkmpO60uqGlubGBN4GvniVWVbrcDoy1AlQTz9vg7ICFS56obAdS8Dsqvl
         QOXb6cdNVrYGRt+oFbQOe1PMXkzg2l5WDn/ZFBB8ATFwx4EKbtFwECLjGkmKcfZ2QnQ3
         bB0nFXWzlFP/qo+1B2teC7jA229n+3Oyua7VqSqu+1SH3BcdRfidABCUAZCr/d/0X4qq
         coqA==
X-Forwarded-Encrypted: i=1; AFNElJ/G9vg2tPtbx5BxeI31JmaWCHxQAjpZn3mXwx0/8Kt54KV6SsE4X6i9TLt5o3Yz3XGjj3KcLrAtM+tFSqGzpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8VBT0jzl3TcS2jOxmBEe1Dn1WNV+T9eRr3R6jX2EQtOAVBsf
	V6BNJadOJsfEtZO8f5zOpfMSgYm6KkUotB6vdjhUVJUSSGgsWjsY/m3PnuLyjCUHejZrMs3+Mh+
	2CV7M00pguCNBcwOZug==
X-Received: from wmv21.prod.google.com ([2002:a05:600c:26d5:b0:48a:79a9:335c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b31:b0:490:e5c1:b8c6 with SMTP id 5b1f17b1804b1-490ec4b58ffmr188426625e9.8.1781527025206;
 Mon, 15 Jun 2026 05:37:05 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:36:46 +0000
In-Reply-To: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2264; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=pRWHCKfc9EIDv8OD6Ag8tpxvHh3fSgM2IuS8g8uBlKs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqL/Hl1X0RgSrcndvnol2F3a+0v017sD4BwkVDB
 IvSuIzXN6eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCai/x5QAKCRAEWL7uWMY5
 RhkuD/9/jr/IWWLyIfB5WJ9HV4oxIJfvJfIXimQpjmIYPf6oVPGOuoepGheTKSca2MSBwG6intq
 nleqrmRItTGEkk13zaKX+pLFVrww2Iem+hQHk+AllCePeqxQy215WF015iBMlKPIvN5U/uv6og4
 bLxdPUDjYsuv6Vfwj3QDCL9R7UbBkQDbRuzwoKigaioxqUKmB9ZwY9NcTZS3pZpuQvb9y6iUzgs
 p/mOux+Z+sy9cm6j4IVjhW3ACf+x9wT/B3SXs2t20PbZtfbM9nnwYeaZdK2dVXxzLjI9osLIt2W
 Zd4ybvvfNbtnoh9vW8YWVVGH4F/I7EZs0etMXjU2DTum2oQMGEYP1c20eFIeC+qxEo8mdTeuId1
 6fGArzKft28cMhtJEl6wPLANeiI3F3B+/Ye9PlMTjjGbK7BSJ3nJtZLsAUzcgn7yJ5YmmLjaRH5
 SdxLzsIYfUhGKu65IIWY16Wrd1ooiRIB8oORwvu25oZpY/FEjLbW9c0YSWr8ghhaAwB0QM4o8U5
 D6jWrySdUP1lAYmit99i8HAKX59mlzbUGF8Mn7KrNa6gwWOOm8KPx2GmRf73YuUuU1lVBdTrHKV
 OO9wziwV7qlw5M9cdZCTo6mhIFFTMPAybhWb1wO+1m2BQV8OPoIdjU1psB1joUNllzJ9fMu4z10 X7GY1/wOJ+Cwsjg==
X-Mailer: b4 0.14.3
Message-ID: <20260615-binder-noderefs-spin-v3-6-3235f5a3e0a0@google.com>
Subject: [PATCH v3 6/6] rust_binder: update Process::node_refs to use SpinLock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Unfortunately the current use of a mutex for this lock leads to priority
inversion. Traces have been observed where a process is trying to obtain
this mutex for 22ms, but it's unable to do so because the thread holding
the lock is scheduled out. Since this occurred on a UI thread, that is
an extremely long delay.

Code paths that might sleep under this lock have already been updated in
patches leading up to this one.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 268d78f8cfb3..82c34a93660e 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -30,7 +30,7 @@
     sync::{
         aref::ARef,
         lock::{spinlock::SpinLockBackend, Guard},
-        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
+        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SpinLock, UniqueArc,
     },
     task::Task,
     uaccess::{UserSlice, UserSliceReader},
@@ -455,7 +455,7 @@ pub(crate) struct Process {
     // Node references are in a different lock to avoid recursive acquisition when
     // incrementing/decrementing a node in another process.
     #[pin]
-    node_refs: Mutex<ProcessNodeRefs>,
+    node_refs: SpinLock<ProcessNodeRefs>,
 
     // Work node for deferred work item.
     #[pin]
@@ -510,7 +510,7 @@ fn new(ctx: Arc<Context>, cred: ARef<Credential>) -> Result<Arc<Self>> {
                 cred,
                 inner <- kernel::new_spinlock!(ProcessInner::new(), "Process::inner"),
                 pages <- ShrinkablePageRange::new(&super::BINDER_SHRINKER),
-                node_refs <- kernel::new_mutex!(ProcessNodeRefs::new(), "Process::node_refs"),
+                node_refs <- kernel::new_spinlock!(ProcessNodeRefs::new(), "Process::node_refs"),
                 freeze_wait <- kernel::new_condvar!("Process::freeze_wait"),
                 task: current.group_leader().into(),
                 defer_work <- kernel::new_work!("Process::defer_work"),

-- 
2.54.0.1136.gdb2ca164c4-goog

