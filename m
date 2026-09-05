Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7E37AA9F;
	Sat,  5 Sep 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598544; cv=none; b=MHpmsnk27q3s+EX0/4mQyjEAddRtZUR+At5LYHVuLgduAeGD2yNt6MfqwqG9OjNWNjy9HyJUYxQVcQHHWswYAsYC6+4i+qo0WIkzq8OJFX/M++TE1VFAtDmFqPmUahNrWMMjTNe3SdcI8o8KValkgaWlNo473YdCgYdDYiJfTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598544; c=relaxed/simple;
	bh=EO/DauOYW4TtZT2a8/moYn9E1EV6Pnh1V5d1nsVJNSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g0OjcoSoTMfb9yD9YXYJE3CPevDK7uVjJ0n7pekGY/fNDe9ZeupDY58GQZPt+gbsYgRLWvQS3oK+ejud2KRDrf24wnARvkTGdq2DeD25WjCfESfj4mckdX97m8Qsi2Llnlt3K2H9UHYRmEtbQnIP4zyrlFN6b1iqxnKzKCBTr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EC9TjBFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC9TjBFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2390A1F00A3D;
	Sat,  5 Sep 2026 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788598540;
	bh=0Mylv/zjucclPhSFWD9H4kpgBfaJoJIM1JbCqsv9PYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EC9TjBFTQIQLUsk0iIGli6uRHfd/+cw5DbG2qtso+MfnUkRxSMepYHZhjpm+0mntI
	 7g/VVps0SwoDr9ZCs1VeNWtDkWdreGKZGVCXQAxW1TJqyp7sCswd7nv6hrp3VrqjAs
	 +53U9ycaYy2pncyWk5GfEJTAhlUQj0FvhYzqs2FAQGiutrHaZTBKyHHGfV0b+63tBv
	 VRv0HX07kWlgebWUoDWVjd/GK9Q8EIu/0Xkebep6h06rI14iMi38wMneqSs1I0O/bF
	 szCRrjAwW0l6eb8NOAd/OyNu9X0G4l97ooBYSzt6SmTPhAR3a0+i8dr+4a63WC2giT
	 OyjyEAsesnV0A==
From: Philipp Stanner <phasta@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Burak Emir <burak.emir@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v11 2/2] MAINTAINERS: Add entry for Rust dma-buf
Date: Sat,  5 Sep 2026 10:53:43 +0200
Message-ID: <20260905085343.1827305-4-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905085343.1827305-2-phasta@kernel.org>
References: <20260905085343.1827305-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rust does now have abstractions for dma_fence. These abstractions are
quite complicated and require expertise with both the C and the Rust
side. Therefore, using the existing entry also for maintenance of the
Rust code appears reasonable.

Philipp volunteers to help maintain the dma_fence abstractions. Add a
corresponding MAINTAINERS entry.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..88db6fb06042 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7680,6 +7680,7 @@ F:	fs/dlm/
 DMA BUFFER SHARING FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 M:	Christian König <christian.koenig@amd.com>
+M:	Philipp Stanner <phasta@kernel.org>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
@@ -7693,6 +7694,8 @@ F:	include/linux/dma-buf.h
 F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
 F:	rust/helpers/dma-resv.c
+F:	rust/helpers/dma_fence.c
+F:	rust/kernel/dma_buf/
 K:	\bdma_(?:buf|fence|resv)\b
 
 DMA GENERIC OFFLOAD ENGINE SUBSYSTEM
@@ -8697,7 +8700,9 @@ T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:	drivers/gpu/drm/nova/
 F:	drivers/gpu/drm/tyr/
 F:	drivers/gpu/nova-core/
+F:	rust/helpers/dma_fence.c
 F:	rust/helpers/gpu.c
+F:	rust/kernel/dma_buf/
 F:	rust/kernel/drm/
 F:	rust/kernel/gpu.rs
 F:	rust/kernel/gpu/
-- 
2.55.0

