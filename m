Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED343F20EE
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997609; cv=none; b=XBdVryCVy9FNU6SaPmxf0HLihoirL3zDIeSOqUly4jR3z1I7lyvFgmUu9uD4Tg2C28qP4BXzFU3jYqLgT/aNPWmn9K9I2m2FNvZ154GqsWVcel3Cr2BogUKOIdrLwFTrdiS3pVHAmoi6OQQBnBLaDS/249binItGUVtZ9s/PElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997609; c=relaxed/simple;
	bh=VibeCWJP7CLzw6oJwFgI2q1e7QZeqUSaFos4WRC2Lr4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uDG2uuwH9nDgXOqWMgabKxtngjMAYRrJ4JVf6ha3dqHUuT8kc4RzQdIxhFgE62GRjg6GzW50HGmsfGf5cptTLArd3wZdxecy1EYkUe5r1t3ABJhBChum0aSfhZYGAqgwjrHjrqa9ya8h4S9AspITEkVU0JfOQJg5imcRfQKCKl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Stk3wFpj; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Stk3wFpj"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b9318944so37355585e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780997607; x=1781602407; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xzKhLyD/l/6xsGgOU+UlnscvYNTC7uiogexaTKtSdVI=;
        b=Stk3wFpjEelvYUM5R2C2LqQdzis6KOxIO+xP6Q9evqUv6sWG0SQkLdrVlF7AQzyQpW
         58Nm9Y2mwwiKJ0XE8aeDSbeyzuOau50pk2CXRGgy96LC0g0cIaNH/AzvxrNHhvxRtVAS
         8XcD7EFovVcnLmT2geunJ9CynTsaNvi7CmHecX5+Ap34iG6V06rfAM5iMlGQRpJx8KAY
         QPRu0fSTYF2RPYwLCY3QpY84Qhj6UG8psbRA6T+H3s0jJUOfeWV9N1berRduyHLcyxuC
         jkASgiCe+efMJxgnftrx+Er2TOMOHelwLBmrY4velnrk2/LFaIOCNtT3xAV+6inaXeP0
         ZL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997607; x=1781602407;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzKhLyD/l/6xsGgOU+UlnscvYNTC7uiogexaTKtSdVI=;
        b=D/vunz6k2RWkt34eswzVgrunz/tHyK1fbjINHTYjs3yVKJYaMjRWR4ahnK61fV12Z9
         ZUR/R4RMrqQLEX2OIGsSL+9W2Bs35lvrqUx66wIvJQDKBssK+RobmVqvPsy8Qk/ZXuQH
         q6Gu92lJInQw/iQbKd70Vze7xrmJDlH/Y788gplEOSJkZFU3NOiYNNmpbBMZV+iEAsJY
         DYggUb328CqTPA+iwkB/pFgH7lIyRADXBhAF4dDVINjEz0XPjIJE+1OoPWRZpKtr/z9d
         Lgn1AMD1/+5poDXkpmSFrxW+Fm97ekIqITj7XWgwtYgHyb8YjiVau1GozoT3iCotaqbO
         ZKfg==
X-Forwarded-Encrypted: i=1; AFNElJ9zDEfGh3RIfMQVkcBMZmklbo51V50hvSjOjH2L/lYKRJ5lHoCe0Z7dIEkiGP1vIXTuBrVbSoCX4UkI9DC/xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIjfLnawxKR3mg96Fv4B6aHSBW3WJ++HVJVV7MqCp8rIMLqDU5
	hWz4f5pKlaBefkORLMXGwdBGitj+v25mWmEYtvm2ZxlDnwz9x8cU5jx7Tz3A6kk7ivqj8XIVPmX
	HzjSacchKIy/2gwecUA==
X-Received: from wmpd18.prod.google.com ([2002:a05:600c:4c12:b0:48e:6f63:7624])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0a:b0:490:9d1b:f088 with SMTP id 5b1f17b1804b1-490d71ecc2dmr24052355e9.2.1780997606779;
 Tue, 09 Jun 2026 02:33:26 -0700 (PDT)
Date: Tue, 09 Jun 2026 09:33:12 +0000
In-Reply-To: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VibeCWJP7CLzw6oJwFgI2q1e7QZeqUSaFos4WRC2Lr4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqJ93bs4x3o621eyN0KM3tY6jPXmyqSEl+HpG3r
 sN95dNBCtCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaifd2wAKCRAEWL7uWMY5
 RpbuD/42dWmlN+dlMIfuNeSm3HW6KIkmFOHTPNdujfUvnDBP0OuI73k246Y5CoSTrfkadR2ErYU
 3kiMaIC1Z6Q7tcyspGYj3aHnSBJNJalukdfZWKchD4WN/FfsRHQQPkrKTCTjox6qWL4eNxsD0Bv
 61ggIEkT+YtczMfEhsrR4SXs8Dz8NMlHDe4Hhzshq+47+VodMt4Ypus1p9wfMnesKz3GMjXTf2V
 BRMkKK3bCJ7mQQNHOJ9MoMysc6rT8T038w/3EjbU9TjDtWu1nwnyYxti7flWmaV0rasGU9bQ+CZ
 ER7C9NjyC8EzMlk11Ph9knav/d0Qd/bgJqCng8P7H/biP6XIk74t7f0fqXNI9KXGDZ46zdheMXn
 sL9+a0M6A4Vfq3CUcj5p9OYLE8fu0XAGUP3wq8b++1Vi5XVREHKGhurv6JlkSmkeL0PKBfvWJnk
 cbDRUz7ZeiN0lioRTXnEOHyuTv0hueksMlDbf9QtXbJ1gA+ZVayIX5400EcSNqx5gmhJa5sGK77
 eb94P/nPjsD86i3geGNoaqkbq1JcArygt8Bw98xlAlybdOY6xIE+k6QLg2e5/Zc6QhJLy2kOXOe
 nOkTYMlEF/c1SkZn4CSzhSKUKiY7nxkbyhBJeIjfhdcljoVn7GEmBFhN0fHBHPQwXZU7tH81hy7 IkqnvDFzsKuMvRQ==
X-Mailer: b4 0.14.3
Message-ID: <20260609-binder-noderefs-spin-v2-6-eafde2ff376c@google.com>
Subject: [PATCH v2 6/6] rust_binder: update Process::node_refs to use SpinLock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Unfortunately the current use of a mutex for this lock leads to priority
inversion. Traces have been observed where a process is trying to obtain
this mutex for 22ms, but it's unable to do so because the thread holding
the lock is scheduled out. Since this occurred on a UI thread, that is
an extremely long delay.

Code paths that might sleep under this lock have already been updated in
patches leading up to this one.

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
2.54.0.1064.gd145956f57-goog

