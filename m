Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99AD2FFDF4;
	Fri, 20 Feb 2026 08:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771574798; cv=none; b=O6UvYO7aZr/yzGUaftETe9EZ3XSgVNWr7ngJSwOx0EJtQtk+tj9SyIQ3R5gy2T9XLfd+RHtGLW3oMI/uZ9uXpp2JYeG0H/qg6MfBMI2nGCrk0BzANxKlm4VGsE5eXjh2/AIf0SL9PNK+Amdl8ZCvVoQTiTIohD7URufsHQP2WgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771574798; c=relaxed/simple;
	bh=m+6QBkzuJzFm/2DPq8oIAn6XLWd1kELDmu++OukzS0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsssRtDj5TZBkDBCxWwi13IxZP+tfEwTGFzYI3mxXYh7xAEhWbjQbLs2DKSFpDgMY/A3cVGz403yPLGS0cNErEgUFimtUzB1THJADKoWP5GW0duih2YHYbdnGGey9AlNjGXjhdcKYePHu4CEiKE9/f+b+g3gcrQMcaxU5TeUGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpDIM9wy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpDIM9wy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9B4C116C6;
	Fri, 20 Feb 2026 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771574798;
	bh=m+6QBkzuJzFm/2DPq8oIAn6XLWd1kELDmu++OukzS0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bpDIM9wyNNdO30QRBcNiBr7w6idqXlwSpbrs591iE3hQfrZDYvQJQU4SY3IQxuF4N
	 k2w1VgTkNtu9SyCLTNDc2Mxcn9wWfab6GSs8Tp9LzDFmPqt9PIPHpn5p9cohAIhOgM
	 0bVliI/9nPz31x/G912F2qKy5EslzllXKkGYu2jOsq9OZfcUSmwvhDG1vwakgPPbs3
	 SOMeZxmsvCuLI4WJW86NGKHKgqJ0muYO3w81kTGFtBM7rxiU5ycgRz5axd1wvw72mD
	 fEjgDGma32zKQc6aSu4/k+/fBQgQiB5D++xpzD2Lqy06+NOOkBYop4t8RwIyMngfvP
	 YitUYlVpaRg2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Feb 2026 09:06:21 +0100
Subject: [PATCH v3 2/3] rust: atomic: update documentation for `fetch_add`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-atomic-sub-v3-2-e63cbed1d2aa@kernel.org>
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
In-Reply-To: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
To: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=m+6QBkzuJzFm/2DPq8oIAn6XLWd1kELDmu++OukzS0E=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpmBYBQ/BEgmkJUPIsZBsuX5HNzHmeNs5zFwB2u
 TvSsnjpU+mJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZgWAQAKCRDhuBo+eShj
 d2PfD/98EW+2FtjO06NLkdcJRB1tLTpqncg6RHmtQ3Et0+A3FSsLO6aIGJV9GMj3wL0grRTAHY1
 kCyoySKkhShwKFVeO3WCv7A1M0MVucu+CsBbhpNaUZhhtbcESRxnH41cA2rAhkW5qss6Ci9QKSv
 mMGhNMA0opU/ECUk9Tli4lTdK79iJ2WwY7a3PkvJLg5mRg/IHwYBqxkOok1tMuM3OJEOrKtli5w
 BWxrMSmLLuD/FfTEtZoQ9h6YMyG2ql8FM+Sjcyq0Ggnju/xZUXQQeF5w5Ljz7XePMP3uewhGcE1
 gjj0OSiS0l9TE2p2nIy3MmQ39NqVZScHClTHIudn1IvlOfjSvs9YybqD6BnQWy5SX5CW1oRyEb0
 +hpURuiS2eNjujCbSpngH92jatDA63gwrt3bNXLLjMNicBpn55KoWYOw9BYU+G9Gzh+bROKX0Hg
 cGUZCaPyWs4a4Bv9+Fvd/8NBdZwFLtOhKRlDCvj0hlcPhaAn39ClxSgKZzPhvh4Gvq1LBHe6Vm9
 DCmEyinrYKxHgvOjvM9W2+0HutkydWF03KBd0wvz6P+VrZU3b2B22sSjFOvb5V0pS8C+CgLRBkK
 6OHPwvcZlMeCN+QZStzV8I5VUoDL/RT4gVoXxad+hQQcaS0TxQhDytiE9XfS7gC99TU8DBFcXbW
 iuHEXJj1sEh6Ebw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The documentation for `fetch_add` does not indicate that the original value
is returned by `fetch_add`. Update the documentation so this is clear.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 83e03bb7ecd24..774c0c9f1c9c2 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -527,16 +527,14 @@ pub fn add<Rhs>(&self, v: Rhs, _: ordering::Relaxed)
     /// use kernel::sync::atomic::{Atomic, Acquire, Full, Relaxed};
     ///
     /// let x = Atomic::new(42);
-    ///
     /// assert_eq!(42, x.load(Relaxed));
-    ///
-    /// assert_eq!(54, { x.fetch_add(12, Acquire); x.load(Relaxed) });
+    /// assert_eq!(42, x.fetch_add(12, Acquire));
+    /// assert_eq!(54, x.load(Relaxed));
     ///
     /// let x = Atomic::new(42);
-    ///
     /// assert_eq!(42, x.load(Relaxed));
-    ///
-    /// assert_eq!(54, { x.fetch_add(12, Full); x.load(Relaxed) } );
+    /// assert_eq!(42, x.fetch_add(12, Full));
+    /// assert_eq!(54, x.load(Relaxed));
     /// ```
     #[inline(always)]
     pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering) -> T

-- 
2.51.2


