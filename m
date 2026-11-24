Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523450;
	b=1R6Zg9Tk9uXV0SQSTkPC833k8D4eh+fve/8x6k6B/la2HE1FOiC2LcU81Z+5vKYIM5Yr
	 GBo/YKEi3gXayB03jdHMd1GMFRSUL/mSpOIFB3MmzwG/az5FzpzZM1w54foBoBB6V7t7g
	 JRWdkQtCVeJljGJf6Y8jC2aT2JjECUvOMk1p1sxOZXOnHNUxbzVrB3RG18EY8dOvV3iNX
	 Ch2omCDld4CEWH3PZ4lbL931HQINLIir0vAcHsTr8PmbAl/0VTW/LVGcwqHcL0VF134PD
	 1VUyWqtU4ExBvpmPx887dteaY1tjKchMRrBlsNOn1FG41MEc9BXBtUEOrStmJut2kiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523450;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kFO2o9d1HuvRpw65wW5KNZGSLKA1liz6URUAihp77/E=;
	b=EGylHCc7dRdy+Rp5jmLkG5dRPpkeLTmkEnRrvBJOZh4myXqoKzMNuw+FIw6QqlO4ukkE
	 07FKaZp+uVAj1qnJuCf1yygenDwAhn44SONIKHNgsC2y6Jn6s4CoK/qLPqFV5iaYP05PV
	 No/7qcTl4vSP7trIvbv0hmJp7NFINjHygTmi/UIrEr74pH3zVWtE3Ua81Lt8OMrsxPCJs
	 nr5xdaAr27udtFBcYeMkQYQfitFk+gDWjGeuJYaYWskQH4bA3HbJBmOCqyvBgKIEqCqzN
	 JNV0XnXn7inobbMZDOFKcG0cG292BQ9DNAUSP/+cERi9DQJ7gBwRfXaX7cUI6uxUuQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N85LW0uK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0DC606A334;
	Tue, 24 Nov 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N85LW0uK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF6B1F00A3D;
	Tue, 24 Nov 2026 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523450;
	bh=kFO2o9d1HuvRpw65wW5KNZGSLKA1liz6URUAihp77/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N85LW0uK3x4lsIph7va+G/rg6OWdGmC6hG5Js1yZ9iDQ4ZmH7M9jXp3wQnNXLE1Ep
	 KZF4XqeohfmqS0ePkxm/FpFAsKDwWTmPUfy2DUkTMhhFd1RJcCoa1L9nxV8pYY9Ogr
	 UCwzDI5r0HihmlUkx9+Xr+2Oy4HLI0DjpvnTqyUAxEJT75LSFU/a7jVvf0qqUqeYfm
	 cB17e6zKx5WfyA9bErzp7Y5iL5UQ0+z4gcJS/OludTcAP4/+LNjyq+f4ct3kbKzshs
	 fBiYSjJ17OsDzVZQmcznjy4FEmfxEVMiKF6yarEApqv064d0jJB1BCRnTKJjEAj+kc
	 1gljHQBuBh08g==
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
Subject: [PATCH v2 04/10] rust: DmaFence: Add ID accessor for FenceContext
Date: Tue, 24 Nov 2026 13:29:46 +0100
Message-ID: <20261124122951.878199-6-phasta@kernel.org>
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

A FenceContext has a fence context number, which can serve as an ID
field. This number can be useful for owners of multiple contexts to
identify them, store them in an XArray etc.

Add an accessor for fctx.nr.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 5300448882e7..897308f60dd3 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -135,6 +135,12 @@ pub fn new<E>(
         })
     }
 
+    /// Obtain the FenceContext's ID number.
+    #[inline]
+    pub fn id(&self) -> u64 {
+        self.nr
+    }
+
     fn next_seqno(&self) -> u64 {
         self.seqno.fetch_add(1, Relaxed)
     }
-- 
2.56.0

