Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4322248A5;
	Fri, 10 Jan 2025 20:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540293; cv=none; b=hdyVLnehPzGu2dFWTkNpR1wDlK7JLmEsVeMqFcI5fL6xNrnTgi6NyfysNMJCnpyE2ojcrXo4nfE0NhxGTdoPig1ssXUV7rqEofknkxMUz97iLoy4yzs+cDCoamqrn5iTsFbkOBN+dS2DJYAaSJu7ysgW39JcPVPvFVUiqwGPlSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540293; c=relaxed/simple;
	bh=/ybNIO+z0YMt7NQe0O7P3cxsv0vraqHKkL76VnTITTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a8B4W6siHlEKOe3fdK2ODxKRMKNG0B/4/709lEq4ujE+AUqyrVbr0ovq9JxX8XWzZkHUvP3SEjnJCrFJBSRJd+WQ8In75bbls/fgPRYccAqSypJmsZ2z15owXBYhxR4MPbM7nJVeJx3pRElLGcb8+xrah9b60y0ElGTOcnephLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSohGVOO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSohGVOO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9204EC4CED6;
	Fri, 10 Jan 2025 20:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540292;
	bh=/ybNIO+z0YMt7NQe0O7P3cxsv0vraqHKkL76VnTITTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BSohGVOO1IlFdBgoSdYbGJVGszHzfgQ4TwmIBGcHmaTnawezclRTuATOErXyRvBKs
	 k2/U1ys/o9Ko9i1VfiJVVQQ7WFQZ/zJyNZ+uSdpoBYQLdTWw5EGFJ6lVqQsvmPJl4Y
	 5B0CV2ykwFzF33Ls9MBMt5h0opoVJhB2v2FnVEr4AACvTAWgDG8gGEJzKfSNe/HfHN
	 2mcNFwY0WOcJJdkoYWvZwjKIUx5a/DIfRnOZhE3phfedx4BGSF/JyEceh/PvlRLy3n
	 7J5dKuAwVEoPaNsKu2tqOiZS3eGz1/FfCXqIS86QRrL03ICy8htD3jj47T8eKVF/1D
	 /TLRMcCDTW/uw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:24 +0100
Subject: [PATCH v6 01/14] rust: time: Add Ktime::from_ns()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-1-f71d50f16482@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=zvxjVReWexH5OF8VhuSFOtSXv8mRCanz1tBYjzejoHo=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/g4zdQ52qSi4nEXeCOuczc7KAu72uF3omkJ
 xmJ7goW0KGJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/4AAKCRDhuBo+eShj
 dyoXEACvJ/3bmgDymZarAfdrNrlCA1Zoz9YbojSS2MYrJ9wTxn77y0dVeGTwZWv0VY13bO4K8gL
 3ZELSmmvhoQDyAIUVD1XkZAhHJDROh6OEMeGs924SWBN8u2Tgha58ZO2wxKTCKXboyeszSiE6ho
 2u94Lh3buUGK2WfdSQ4AXQVvxOs5CNDhcl2xptUnPl/NNi8+7iN8r5JQa3+DCRp9sBxk+s0tzPc
 F5jE25IexTDA6WFbhJ+s9bnz/CpkvMr+R4dvHNP93D9reIhYbQlMLcBgroOHIRJtwgQbX8QUSRz
 d2V38CYGgeR8iZ3R0rjlKD6xr5/kYosnHD4K4HW35p8elW2eZ/i/a9gCUegga0SbFlyRxlf+lmF
 XXjhf4Vx4wNUvgWMNekhwNKOQFJFkNyII9UKSGuYSpPwtSeZ6M6IWQqG1lqvKfYGLuHUGm8ZpKO
 EzUp3SiBvJ2vBqI6XllCvQDDDhAHb3XXMcf0Q4hE+5OIhi6BFDC34hiBMKvCwbrN8ITJVVtA/VD
 1aM1QIf7gNSPrhBuY05b+MxVP/c/6E1qSKbDjcxn7vn5QLCojfPNvkESPHoTnYoAtYDbCP40Kml
 ktsYeEdyALRuBKxkdyjpcps3tvM0WpYUjsUMe333RxfkV23OCssAICWmk+f6i3dOkCdd0fedNsi
 8vnqfnaBNAeElZQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

From: Lyude Paul <lyude@redhat.com>

A simple function to turn the provided value in nanoseconds into a Ktime
value. We allow any type which implements Into<bindings::ktime_t>, which
resolves to Into<i64>.

This is useful for some of the older DRM APIs that never got moved to Ktime

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 379c0f5772e575c9ceacb9c85255b13501db8f30..f59e0fea79d3acfddd922f601f569353609aeec1 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -8,6 +8,8 @@
 //! C header: [`include/linux/jiffies.h`](srctree/include/linux/jiffies.h).
 //! C header: [`include/linux/ktime.h`](srctree/include/linux/ktime.h).
 
+use core::convert::Into;
+
 /// The number of nanoseconds per millisecond.
 pub const NSEC_PER_MSEC: i64 = bindings::NSEC_PER_MSEC as i64;
 
@@ -63,6 +65,12 @@ pub fn to_ns(self) -> i64 {
     pub fn to_ms(self) -> i64 {
         self.divns_constant::<NSEC_PER_MSEC>()
     }
+
+    /// Creates a new Ktime from the given duration in nanoseconds
+    #[inline]
+    pub fn from_ns(ns: impl Into<bindings::ktime_t>) -> Self {
+        Self { inner: ns.into() }
+    }
 }
 
 /// Returns the number of milliseconds between two ktimes.

-- 
2.47.0


