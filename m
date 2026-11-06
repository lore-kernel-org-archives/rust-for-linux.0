Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974175;
	b=CvcltAingCoChtGvR9xF4hTAyqo0YRYRIYydKOnJcPHmnyyawVNDWhovZxvh1RPRimCE
	 +J4wPJQxxrVq80zZHa9X1iySa0zW3RFur0ZR5iAJ1JHx3i7dhPTRhgaLUHfd5poOktSli
	 u8kczjr2LHSm6YtLMG6w9Gpn/eSJIfEj0s7BDJZg7O17qkeW/35hLgwR+Wjyyrxvj+Eg/
	 wjDu4TRNAcDPJzaEGwRJl8ObsuB6oROyjjgrsNOXavuqxgEgSrB7YbRJ3o1OFRYCR/3+/
	 iKCoOkbuo9g638tAkcgvYdL+wB3f5criPUBK9cJSA9a+H8SvJfCw7+u3l5LdjGFFwww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974175;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kFO2o9d1HuvRpw65wW5KNZGSLKA1liz6URUAihp77/E=;
	b=nXx5B2Pk+Gwy1riDCiVigZAy+LqpaYQFHikHblq3el9gUYKO8Z7EpvtTJSz+2ZpV15ES
	 9k75U2PJgdX8BQacuYO0dhe7bg7XlVtNmYGnmYGZUuAdcCmE2LBc5Q5U5W6ClPlQLU2Tz
	 qnKMOQXWVfzPYusHtnyXw5JmDYGZ1QAO/oYLKtmWjmXRAut7Bm91i9QlKrA2kr9/X0aBh
	 kMxlYb8l8H8twHUDv3/m6kjUUhNZb0sEyyIWcDvyROYJ/YFBKuEiVu0OlnGrole5kc0R7
	 pNmQ2wTFecD5QEn/Whg+2bQ2JVxo+v/c2woEoCgzHVxhNLvRzCeSviVOWeFwH37FrJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFDLlN4B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5A5606A339;
	Fri,  6 Nov 2026 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFDLlN4B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3253D1F008A1;
	Fri,  6 Nov 2026 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974174;
	bh=kFO2o9d1HuvRpw65wW5KNZGSLKA1liz6URUAihp77/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FFDLlN4BlZiTeMoIWuJrMO6dBKt1DPUypnPGbSNiulXI9JTxqOSE2qZn4VNOQQR3p
	 D3uExnaXxrvwo2yFi7auHN7NJIqKvb52iFVLXHWs52LGstNoEwgLKeFodmwh/ygdQv
	 2B638xYB6ATokDR2+gVtiKvZOpJDVGrYL/CYlmZJ1E4Sj+bm3iHr+5qJ1MwgeJuJ5A
	 X5kVvKGhuL78ttYNMA7giLQ1Aw1bHSXJ0I5Um4mXsB1RWmqKfhC7dvOSphFaq1KimI
	 W5WrNZ34Mh1j7siqToFEI8vIBQ2nsPNpAuzymLhvW584gnTrl9PD5NOO6vafDsKKMT
	 2IatCtZxsZQ6A==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
	Matthew Brost <matthew.brost@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 2/8] rust: DmaFence: Add ID accessor for FenceContext
Date: Fri,  6 Nov 2026 15:07:47 +0100
Message-ID: <20261106140752.520386-4-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106140752.520386-2-phasta@kernel.org>
References: <20261106140752.520386-2-phasta@kernel.org>
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

