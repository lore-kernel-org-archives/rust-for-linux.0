Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C1A2FC011;
	Sun, 15 Feb 2026 20:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187404; cv=none; b=ZGS3Mh6ItOnFHgfXaWWv/LLyOpHQOdw0vXCwd7D1ixiWR0zxAPrriHpA4JeYPgCGeNR/ToBZ8zUgG9k+MNEym01ND6niepHB4wYW4zmJ8ktQ33/IxNFLU0fpAEgi9x4ckqlzXUFuSD6K5LNY2d4OoKv3wHG+ybT0SvewnC38trY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187404; c=relaxed/simple;
	bh=OE39GIM3zPgCCJWdldGxuMygx5gfDnhCPNQfoYdRhI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HtXmw4yNHyqrkaxpvV6gFDB645MxM065xoSXFL3FqRx+SzhtkEjgdllDvWQNDIpuxM5VsKMqmBkXJ4Qz+N6LXSOB2LKJLhwyLMgSvth9Q42H0M070iaEpVXZHXF1t3fUWbajjIdMQYrKTSIYDNGHdFNLfuqFomeXn7hErW46JOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRIy2vqF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRIy2vqF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A416C4CEF7;
	Sun, 15 Feb 2026 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771187404;
	bh=OE39GIM3zPgCCJWdldGxuMygx5gfDnhCPNQfoYdRhI4=;
	h=From:Date:Subject:To:Cc:From;
	b=YRIy2vqF/FkR1aCLMuwaNCaCVbbvuVUcKjUUplHlEVdEr2EtS1VuvdCJ6ktyjdCRc
	 YaeEyiKwXfeOoz+umm1vqBOO3StNIm38WBOTjZKkbj+dB8IW/gYa4ETNf7f3xI3nSb
	 rnoqYNrFUeAIWL1aFuPo9aEWIC80J+gXgXZZFieBnt8cBPSMQXIRk3s7d7y/u7TSrO
	 9EuwtLssGehLS2xEThqjvdq0ByT0m81z0cam/j8N32qV0lK3cCs2XP8Tl2rzGbhDpO
	 baTK2T0HLIG9JgBN4Bm1/NxDJodMP3HQOvkPWy9KNzhwVb0vMT6VDgtjkGKm1KDou4
	 1/qzx0ItsDWqw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:29:53 +0100
Subject: [PATCH] rust: hrtimer: add active() method to query timer state
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMAskmkC/x3MQQqAIBBA0avIrBMcK4muEi3KxpxFFmNEEN09a
 fkW/z+QSZgy9OoBoYsz76kAKwU+TmklzUsxWGOdsdjqKCdvJHryJ1+kA3Z1gxiodTOU6BAKfP/
 DYXzfD7eOeBJgAAAA
X-Change-ID: 20260215-hrtimer-active-f183411fe56b
To: Boqun Feng <boqun.feng@gmail.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=OE39GIM3zPgCCJWdldGxuMygx5gfDnhCPNQfoYdRhI4=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkizBgcn9Xwx1sQ+Th6YymqbtmbpBQ2osb0qPq
 drrErCOFoaJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIswQAKCRDhuBo+eShj
 d68ID/9HoeozpbHMhk4ypAyoDVM9GKjLkro9hTxPmKhB9TCuGZ6hasUbvOVV7xTwQDPRyoSZOZa
 4No7YseuttoWhh8jy7GIZ3t/Nx6qMJnLDxBplnn7aJCWJsKpghNgZTTJNGVOVtWWtBxTH5sMquV
 ixa52K3McENacnpmBSbgQqpQSKAdAAeeLWDbKcFrtNAvJKFnTbV/pDKjFRq4XuQ+FjpRWhki4Z9
 2c4CJ/hGyyF7eH8FyU7bomWh1CUUM/tv3b1FsNGp2mAlJQKfeP00d+ID23WNBZPYKLIGtZSUHh+
 wDd+7n2q8K02lXjaO4bOv67o9aZUJgaIOoY+qgrN95QZLVWpzwbq1M++1zAbI1q42EfQCm5OGd3
 JuNVD5qJHWOAvs6e+FVNYcenfiWcVCvDWTgCFBka7oPac3SQWuUhErh3TLIt+8+PyKMMauS0ZkJ
 yxa7UTqnFTy/IUsUGZ1++m04UzaOyJoOAHJ+BunNXEy+q+27CNiao1keE8sl+Kyg1B60zZIs6ou
 dztu+2+0Gk1YpEiFdm0uIS/whxsOH/wVTDzRxN7RnVon9JBt/wfcuqJTy5to6R1VZ8euzD8gWaM
 lsXhP+1LKOB4GUi6ZLhxTuHMJ4ZocH1yMSZOMbIh1g3feIi5zdBuHe4hHwQkxUQx8eZFkWA12d1
 oriLQQCXh5YFMcA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an `active()` method to HrTimer that returns true if the timer is in
the started or running states. This wraps the kernel's hrtimer_active()
function.

Also add documentation clarifying the definition of an active timer.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a008..b2272b059e504 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -66,6 +66,8 @@
 //!
 //! A `restart` operation on a timer in the **stopped** state is equivalent to a
 //! `start` operation.
+//!
+//! A timer is **active** if it is either in the **started** or **running** states.
 
 use super::{ClockSource, Delta, Instant};
 use crate::{prelude::*, types::Opaque};
@@ -246,6 +248,14 @@ pub fn expires(&self) -> HrTimerInstant<T>
             )
         }
     }
+
+    /// Query the state of the timer.
+    ///
+    /// Returns `true` if the timer is in the started or running states.
+    pub fn active(&self) -> bool {
+        // SAFETY: By type invariant, `self.timer` is valid.
+        unsafe { bindings::hrtimer_active(self.timer.get()) }
+    }
 }
 
 /// Implemented by pointer types that point to structs that contain a [`HrTimer`].

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-hrtimer-active-f183411fe56b

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


