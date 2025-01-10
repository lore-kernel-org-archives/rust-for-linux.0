Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B891211293;
	Fri, 10 Jan 2025 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540238; cv=none; b=PgPNnuXtWL0tFMLq3PU1ijAyKD/ugnVovgCw/vxgu6v+jMb7PFAHH1K9DlIXWuzL5yo36Z8qx2jwZiUcgDMDnNKabDje/8CUobEJm0Fp7KtNkIimr16yAeftjUs7Bt98+fUwoc2syFR26iuJfsHfOPIZSqn2ezzMwpFzVNO1Zaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540238; c=relaxed/simple;
	bh=LCgcVTcyzsEKe4YQ3SqZUDNTdG+7NYQXBadOUqn4/2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HhovZ4KqiFqZ3CVYmswNjtYk+O9YYnBFeae6zHHpkNzzdS7DmO6SOSaVrqsKypSy1k+nEFbgAacVPHfAjeHzY21sPPgfvundpUCNBMwiBZ55ilNq1NiptLTWs/T9zaOs3fdLWYhcitTwSqWVJ+FM2I1sT0GaijYvOgaiWb7ydjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WU2YPOMV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WU2YPOMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82624C4CEDD;
	Fri, 10 Jan 2025 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540238;
	bh=LCgcVTcyzsEKe4YQ3SqZUDNTdG+7NYQXBadOUqn4/2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WU2YPOMV7x7qhBHP/xo1Pg8nVMQcLPZOfRKVpmRpUOTjOIZY7PRHRMo+1hpGUm/EY
	 bQWycqkto4lhDstgQVsGQwsSVKjK8FFF4DxC1V9hBn8QXpFbjC4G3iAaWFz76deMRr
	 5U3SWjtuyfsykywh/KQ4lQFrJJg3veW98bSiocd8Xg7L1aYcePnu0ZpxAewul5FjRJ
	 HSgb0jTykmGCfzyKOTDPhPi14C++EXiXQ6A3DIbd9qmCEMEnt9t4byix4InfsG15Io
	 VwwnG/BqMavN+D4ZkQ0//F/YXP5oxqTtC9Bjb7DRZXr+b7Mu+2nFx4bjj7zSD4+Us6
	 zB24R3pURYn2A==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:29 +0100
Subject: [PATCH v6 06/14] rust: hrtimer: add `UnsafeHrTimerPointer`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-6-f71d50f16482@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=LCgcVTcyzsEKe4YQ3SqZUDNTdG+7NYQXBadOUqn4/2Q=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/kij7Y6DfzKBNgjNnODHOQNarvbZpxQUU+w
 ahfabMpwM2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/5AAKCRDhuBo+eShj
 d1enD/9Hgf9hRb45eW2Iru+exfiPAAydRq0JMc1jDkPXIhfe0UiQSwQSSre6FIJ52oyK7tjps1E
 r4ThLJIeG/nphiWNl9CMfDjL2IeObAkABKnA4toNNFvHdc+wJ9bEv8AzQbmLB4ZOAj4Juw+kraX
 UkzGytJokoGRHR1cCJPPcOksPHxBZ5Vlc3WIbRza0/iFymrJ4hMJ0bZNlIYHWGI2xGP7nE7Quqr
 0/78BgzVndLEiQDZjGB8+yNn9/1mVHjF2lPS0h9Xreu8pPz3ysGvLnAEWCwxcI0SXp9zu/dlT/a
 cH9q01fwGNV+EurxFGhSPfHBaxmDUSwtGjJ1JN6+bcL9xYi8erehQNaw8JHS78VMX4zwYDSpYDU
 ePOLavpE42g3WFNqT1XKHLsSR0CKIy9PbUXVJYBqBbbxqfNofSOywwE0zqSB11QwiCoRdFvPGFH
 M8sbR5k/VO9+qqRaHwD93HkwgJAYiUQD19Bo1tf8rkS4tjDxGW5N/WNBVLNHsSgjUlQtLOR4Zte
 2yK4IAygfHQ8IZa9bSOnbfjDSkSyNW5oJ4NtwHO1lo0lgrXREvodDvkHRRq6P7ItorjqeuW1t+T
 OWSbtLT/kokqeV3/sn+dK3q10p9bYL28BnhxA4G0IgZMoG0UKhWX5n2rXtFmzSZKivSgufk4bKB
 4ogyRVOr2GzkRUw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a trait to allow unsafely queuing stack allocated timers.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 50e8c23578b5cf7196893ac88d9547fc027f1f04..aab998b02f19b774d5b04ae2c89b669f13c4b0c7 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -142,6 +142,37 @@ pub trait HrTimerPointer: Sync + Sized {
     fn start(self, expires: Ktime) -> Self::TimerHandle;
 }
 
+/// Unsafe version of [`HrTimerPointer`] for situations where leaking the
+/// [`HrTimerHandle`] returned by `start` would be unsound. This is the case for
+/// stack allocated timers.
+///
+/// Typical implementers are pinned references such as [`Pin<&T>`].
+///
+/// # Safety
+///
+/// Implementers of this trait must ensure that instances of types implementing
+/// [`UnsafeHrTimerPointer`] outlives any associated [`HrTimerPointer::TimerHandle`]
+/// instances.
+pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
+    /// A handle representing a running timer.
+    ///
+    /// # Safety
+    ///
+    /// If the timer is running, or if the timer callback is executing when the
+    /// handle is dropped, the drop method of [`Self::TimerHandle`] must not return
+    /// until the timer is stopped and the callback has completed.
+    type TimerHandle: HrTimerHandle;
+
+    /// Start the timer after `expires` time units. If the timer was already
+    /// running, it is restarted at the new expiry time.
+    ///
+    /// # Safety
+    ///
+    /// Caller promises keep the timer structure alive until the timer is dead.
+    /// Caller can ensure this by not leaking the returned [`Self::TimerHandle`].
+    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle;
+}
+
 /// Implemented by [`HrTimerPointer`] implementers to give the C timer callback a
 /// function to call.
 // This is split from `HrTimerPointer` to make it easier to specify trait bounds.

-- 
2.47.0


