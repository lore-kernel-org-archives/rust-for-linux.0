Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A69A358397
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774508153; cv=none; b=KbjDqIr9bL/I0vWAgmfSDp2bvDvhaE7uDhRrjzs7E0N5WPz2NVxcP9qyhXHlWf9nxnvG+/y06MCK3ocNK1Bj/IsSi8w1TbC4OONXLte+c3IjRb9HJxr3cU3IvzsVUg54FqnQ5VEC+LfBfsYeESyssTjtAIiJYptcN941kRYUXM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774508153; c=relaxed/simple;
	bh=l+K9zW15YdA7Rr803fNe8iacgAff7Ccyrsy1728ZtCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqCa29aDrNBTBgde8zoVFATh6TxUmboAhixv7Y0UjEa8ybK72trXak6jKWtpn/msWnc/XEh07qBl4k7FzZSjc25DuP7pIa2vIwsgVZcuhImKJZ4nllJh3UDk/Cc/zH6ruYnpofnlI8pDnECvfAwwfmLw0q8pdgBfnT2u7KqTuMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cz8K/L+w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cz8K/L+w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38802C2BCB7;
	Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1774508153; bh=l+K9zW15YdA7Rr803fNe8iacgAff7Ccyrsy1728ZtCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cz8K/L+wrIbWc5nQiNk0BFPTqtXHv9bT4/a0JdKgXiZ1X2DYWGSMNej0L4IB1qLN2
	 arU+Irt31vNlk4zwQfLDFk5NW6sY8sdB6jf6ZdhtiS9f5YqD0hk73po3ZMEWN43avL
	 VmLGaNO1rpiBWbh4DXbkhySnSJhwIlZas7E79fyg=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D127109E55C;
	Thu, 26 Mar 2026 06:55:53 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Thu, 26 Mar 2026 14:53:03 +0800
Subject: [PATCH 10/13] drm/tyr: expose Vm gpuvm_core, gpuvm and va_range as
 pub(crate)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-tyr-debugfs-v1-10-074badd18716@linux.dev>
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
In-Reply-To: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774508149; l=1015;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=l+K9zW15YdA7Rr803fNe8iacgAff7Ccyrsy1728ZtCA=;
 b=Z2102NPJrLYhjTFTHtNjxbwByB2im8luathC5tg30XFDs7fqzPxHYQxaYNfs9Gnk4ze5VU0OU
 m7Np+bRkkAnAIFgr0///hHaP/vbwssLEI4Z2Gx0ewURZ8c5KWShSpXS
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

Allow the debugfs module to read VM and GPU VA state for the gpuvas file.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/tyr/vm.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index 936c3049812b3..ccf4493065a49 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -306,12 +306,12 @@ pub(crate) struct Vm {
     pdev: ARef<platform::Device>,
     /// DRM GPUVM core for managing virtual address space.
     #[pin]
-    gpuvm_core: Mutex<GpuVmCore<GpuVmData>>,
+    pub(crate) gpuvm_core: Mutex<GpuVmCore<GpuVmData>>,
     /// Non-core part of the GPUVM. Can be used for stuff that doesn't modify the
     /// internal mapping tree, like GpuVm::obtain()
-    gpuvm: ARef<GpuVm<GpuVmData>>,
+    pub(crate) gpuvm: ARef<GpuVm<GpuVmData>>,
     /// VA range for this VM.
-    va_range: Range<u64>,
+    pub(crate) va_range: Range<u64>,
 }
 
 impl Vm {

-- 
2.43.0


