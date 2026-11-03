Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719963;
	b=NgayWnQFAoDr+OoQZWAfXESGLXMRIP2u8Ryx3MklUbPgXdZOa3aC5uZDwkvDALeOB/Z2
	 I4IVaOTA1+WLxujftauj+ILQpNdlU1T6lNtINXQP/Z5H8LRDTl0E+I0qoOWVwMp1Zng+9
	 G1FmvzV58fb3UF5ovhgDaECdUgGu3oyRyqw9FmVVjf1TJeLMicHr1YNGz9lenA6wFFbXb
	 KQNfO9leuNiQHNblqyIPWXgxCyl8Q3Z8yHqqUOu5/beTUw6QYc8YLgbJjNqSbI2AnelER
	 zn+TG+EYac+eeYuc1eg45StAIC1tJer+xRpPMzkQaOWty/32HlXZTfj2hzq/jSnRtnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719963;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kFO2o9d1HuvRpw65wW5KNZGSLKA1liz6URUAihp77/E=;
	b=EUaKlnhdNspf1Lz7OeiyHAA1crDmoQxFvHhk3+ac50U5KqA8vKsO8szrDz5QJ4BQuKpE
	 zdYE5PPhBCzntF03yuwAy5wR4xwxtxlDU3dQ1VcmU2F8NJXRrDvCNQxIyuleKfWNgqL8J
	 xuL2HG/1OZerjvEXj4sb/cU9nANiMW5ppiGsydlWh8BNOFyTh2ldVLw9AnGFFjf/RE4uz
	 hpaHyFyWde12SxXR5867Ag9asfuo4IcIwekipLEf5og5QNeUhQJ/mEZxc3FcGyzasdVhV
	 LQBckqd6VFgc0FKbLdoKWdHS8OiQ9P1nMLJ2/VsbXok9bwSXh0vyhbG1as/ijga+2Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DCtFjDG9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE9606A327;
	Tue,  3 Nov 2026 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DCtFjDG9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0238E1F00919;
	Tue,  3 Nov 2026 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719963;
	bh=kFO2o9d1HuvRpw65wW5KNZGSLKA1liz6URUAihp77/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DCtFjDG9eV+fa59I6iiRc3Jh1cm0vdF7xBOyfm+1PZYgyfmCC2M1jcJBDIKq95B71
	 kTnroD6VjHT9elzS+w4M3SCwmQHfyDe5OwyNSqbP3JntanU5KRb+hvN3RZPTzZyEpu
	 es27V97O6J6flpnWbHHDLSGojWL5dWatMxK4Diln5wTg2YM4mAXvCSeYVAvD29WGM+
	 xgkAD9eYB+KyeXEtqrLnXakonyM5+WtSrEHCHXhPRDK151YYkbQnSZD5Hhvn6t6lKJ
	 Wa3VtFH4vYzkswqDFpeR1bQVaonVGWMsQH/dFbU7vJcaRGS678z13pgeIl75yn1/WZ
	 PG/zAWGwOiTtQ==
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
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v7 2/8] rust: DmaFence: Add ID accessor for fctx
Date: Tue,  3 Nov 2026 16:31:32 +0100
Message-ID: <20261103153138.1087330-4-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103153138.1087330-2-phasta@kernel.org>
References: <20261103153138.1087330-2-phasta@kernel.org>
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

