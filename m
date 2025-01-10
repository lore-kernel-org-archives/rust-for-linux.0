Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEFF215195;
	Fri, 10 Jan 2025 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540243; cv=none; b=LtHp7rG/HFobqJ23T0xO6G3MUkmJQKrmAwIApgR6W1DY9pjfMQ72J7WFealr4FtbAYVu3Isgk5BG9ygH1zZ/NC63chZtRoPg6eemrkpqNJlRFObQzp0Gxyxc3CETg0O9DrYtJPyoyGYG1u1/3DH7SV/YlX4r+6XPAmeKuuXdTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540243; c=relaxed/simple;
	bh=sDYU+nUyIdb+VKBxdBiq95UuW2yrY3C0WdXaHg/sCFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a+abWYDwEYl3f4LuE+nSAHz9x/QS1zBjuNAXfLe6M5JXuDyOINtlar5W0rG8RuSqfaHhQlH+8c/oA/YEUfYZ8Co3fDZiq2nHKQNQc00kMpOG+LhPTO7x5MKXxiPQenyQzMwMm3qb7HTodjAJffB1Z+/dJCPi7nsQFH0PogrT504=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhE8DQuB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhE8DQuB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AED2C4CEDD;
	Fri, 10 Jan 2025 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540243;
	bh=sDYU+nUyIdb+VKBxdBiq95UuW2yrY3C0WdXaHg/sCFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FhE8DQuBLTtcNQjXaiqiiZo7JaEaYbgz9du35lr+/wLfIf8DkkTWDCBGc1QT6TyZT
	 tnz7Fe64lhkHN0xzTd0RVuOq6xsdjOwWKTuFv7fWpQq9lmdbX6Y0OdVxTm/vPBlwOe
	 vC2FJxVmquF2UYbuHw2hnkmZCCdtw5M79k9Ssm4KsgG2Xtn34Lw2HW+D6c8GbscalQ
	 s8F1LZR3KMiyFR6kl6+KXPSwIIQt85nXTPb0DS6qjiUi0kwRKuqxDyPifn2Nd2H2xc
	 +p1/PDuOaQfaI/YqxM848vVsaFi3l1VjGST/B1cFEk/+GJSNefX8ct/KC36GVMyFsM
	 XvE6di/yo5gow==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:30 +0100
Subject: [PATCH v6 07/14] rust: hrtimer: add
 `hrtimer::ScopedHrTimerPointer`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-7-f71d50f16482@kernel.org>
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=sDYU+nUyIdb+VKBxdBiq95UuW2yrY3C0WdXaHg/sCFY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/lLHotfFxCxaeXyuMCPCBwvrv0+Z18x8VDh
 itk8VuZLbGJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/5QAKCRDhuBo+eShj
 d8ZgEACE+rzW+PC6YjBEj3iFjB7Jx+5XVpAEsipwVgNJN6BNWS00BFvH2gxgpvq+03WkO/2tMSc
 kQJ5FIUo4KcPIg6jHz/LA+trGlvWe+4birklpSd8XjZg2Bz404Q9bS8MWfkUOHSQjT7S1G7nysw
 QHl0/JXQFlbNZj12Ts0y+7wb+oIYlw8laFmDoI/fHnVkAqSOvhTyNCXfSoIpDb1VBZ0kf/nHHuJ
 A8iV7QzvEt5TfaekK2PYmjgvCdnMCbdHH9gUsFHrmS4AllTsdtJCYjSQjsPbivSCYPDRd4HwEIS
 dLYAmi1mkXt8V/YtIfHm1OVy2Ya5jACxs+KZl+d880ResFCOiE67iOUFYuO6hY9Um/ovpOMly5J
 xAtAxcwHfD6LkbO6EGcaVOSprFPnU4Si4mpIaAXnbNvgxR3YnLRIMpLuvI13bIA+6IifVbzZtpX
 4lNxURyvHMaJwKV+cABPXzVa7dXie+TdWzX68Rgrf+NjXE6Z3W3FeY4yp5JuLRvLGxDVtm+U314
 ac+ptqBjwjS07pKRXoK6IzdUZf27ndNMKLM4z1AQaDbYXaatTmWV7tQO1LT6+EIjx760/7iIFQA
 fU6W4PxjS3VU38DZA2+TFZc+kY0pwmsWp4xdkAdFQuv5R8XOxGD1V8lYQs/DIj5NF6D3vehDxRa
 p5MXr6rajRepS3w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ScopedHrTimerPointer` to allow safe use of stack allocated
timers. Safety is achieved by pinning the stack in place while timers are
running.

Implement the trait for all types that implement `UnsafeHrTimerPointer`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index aab998b02f19b774d5b04ae2c89b669f13c4b0c7..3cf81b5bb4c7071e095948f3220232a15116ed5b 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -173,6 +173,39 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
     unsafe fn start(self, expires: Ktime) -> Self::TimerHandle;
 }
 
+/// A trait for stack allocated timers.
+///
+/// # Safety
+///
+/// Implementers must ensure that `start_scoped` does not return until the
+/// timer is dead and the timer handler is not running.
+pub unsafe trait ScopedHrTimerPointer {
+    /// Start the timer to run after `expires` time units and immediately
+    /// after call `f`. When `f` returns, the timer is cancelled.
+    fn start_scoped<T, F>(self, expires: Ktime, f: F) -> T
+    where
+        F: FnOnce() -> T;
+}
+
+// SAFETY: By the safety requirement of [`UnsafeHrTimerPointer`], dropping the
+// handle returned by [`UnsafeHrTimerPointer::start`] ensures that the timer is
+// killed.
+unsafe impl<U> ScopedHrTimerPointer for U
+where
+    U: UnsafeHrTimerPointer,
+{
+    fn start_scoped<T, F>(self, expires: Ktime, f: F) -> T
+    where
+        F: FnOnce() -> T,
+    {
+        // SAFETY: We drop the timer handle below before returning.
+        let handle = unsafe { UnsafeHrTimerPointer::start(self, expires) };
+        let t = f();
+        drop(handle);
+        t
+    }
+}
+
 /// Implemented by [`HrTimerPointer`] implementers to give the C timer callback a
 /// function to call.
 // This is split from `HrTimerPointer` to make it easier to specify trait bounds.

-- 
2.47.0


