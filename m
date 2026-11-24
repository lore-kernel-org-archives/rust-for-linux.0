Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523431;
	b=crl1STDLb6HODlPMxeO1On53XvRcVkmeg8Cio5Xw9JOcoTMiMC3iLiQ5zp08gZOkvMJ1
	 qjX1dwwWvsw6546MMHYdZnQgyEQ6x5bD87j5aOnlL6HOVv+1zZJEZUho4BwbEGNafrJYt
	 vPn2NLrO46NnYpZiVxLvwD7rxkZOPsMivU4atufeEYspWiQi4hFoSkX66R1nKUkRhbrdr
	 xowCPVp1DtXoTiOSWWBVoT5CAx5ZaRgZSFFwBo+Cewe1/0YIT6KacvQfkgm2ANT34vjoS
	 LM/XpAoq6v2VAHKyX1h99IFggWLsY81/npUZ7bYC5wx7sgBJSM9KnvUvlrKD0YQzGNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523431;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hCaz85cDFZY8PRCRoBf6lstsxdUOIDLvnMndMBusOQ4=;
	b=RgDXG+D6Jlb/JRsAsrgPXKGmghWhR5IfpJz334s6AqDr/551XDAB7jHz6s1JtvKMqQAc
	 BJPtwPLvhAGIbK7IpOUSDlUDA+ejpPhUdnZZtWckR3BGocFmDlX5UgnKCV82BI7rfiLX8
	 w0heIBOHbOJarvDv6fINuvkYx5be4jBEauNqBB1yMr0YgxZJbNnImP8cdE22r/t1uBVwi
	 bQE+RTafZ4/5oLbG02xhRhckQ84xSqYGpMz+4TJVjkYe4lzR+IdePDsXCzSgrU393A3Pj
	 WLTaZ6O+Jr/cAfyOLJMFDZ9gpC/3womXyHoC6AK/BsAHAu6gC9NZ5Zvt5Bg5VmiFJtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emGqIgl6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD01606A321;
	Tue, 24 Nov 2026 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emGqIgl6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102861F000D3;
	Tue, 24 Nov 2026 12:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523430;
	bh=hCaz85cDFZY8PRCRoBf6lstsxdUOIDLvnMndMBusOQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=emGqIgl6jBZd3OPnc+B72Xls/N/I1ZRcUX53W23ZEvDwm3nmXTWN0eCvwcmL+HTge
	 +Y+uuSYuzplq6ja7r+KaYGI6dNVrp13G3g8LFqD5+7LgFjeWGy6rS1M7Cm1eJxbdVW
	 vGiaFJLzGV7VvgzBwSD5Fg+HbccBRaoaaJ4YCqUHlETQzwbFFGvU0u3vWi4LBsEm/1
	 9OEtA8FqpehGgjXnE2jsbTPlyRmQbAMc8UE3qGxLA2QC7euAJz5ZJQgkEowk92n1VH
	 8WZV8GHlqhQqQrhsLoDvkBQMMYDoxgJ8LGfx7SlyA76eIQNcfJwrE+RbXvqZud1DAE
	 28g76d37T5QhA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 01/10] rust: rcu: Add get_state_synchronize_rcu()
Date: Tue, 24 Nov 2026 13:29:43 +0100
Message-ID: <20261124122951.878199-3-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124122951.878199-2-phasta@kernel.org>
References: <20261124122951.878199-2-phasta@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some users don't want to perform a full call to synchronize_rcu() if it
is avoidable.

Add abstractions for get_state_synchronize_rcu() to obtain a grace
period identifier.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/sync/rcu.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index 0daa1ac87d81..7afc78b34759 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -86,3 +86,13 @@ pub fn synchronize_rcu() {
     // SAFETY: `synchronize_rcu()` is always safe to be called from process context.
     unsafe { bindings::synchronize_rcu() };
 }
+
+/// Obtain a cookie identifying a grace period.
+///
+/// Returns an identifier that can be used by other functions to check whether
+/// a specific grace period has passed already.
+#[inline]
+pub fn get_state_synchronize_rcu() -> usize {
+    // SAFETY: `get_state_synchronize_rcu()` is always safe to be called.
+    unsafe { bindings::get_state_synchronize_rcu() }
+}
-- 
2.56.0

