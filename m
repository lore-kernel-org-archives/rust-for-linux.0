Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521844063C;
	Tue,  1 Sep 2026 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278957; cv=none; b=ZhZsBEzDg8nVrIkVkSA0nqHTuJxXnso5YNg4+/IVz/bUqzhRyDE+jAx4JrUi8P+Hl1wDO64ve0NnobJXCcx/D29eo7EMf/8Wnbq3o48vOp58k+mzwSmZHAOAdOIk7YAN2onJxeKfQI1Y+xYI2YeLDEsri21wvI/+yuoN/sWDINU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278957; c=relaxed/simple;
	bh=HasbAbiscgkB/JlAaddXUmrmL9X8xBNF+D/Mcih0n8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cdl/Ptiv5WtaGvFYE5W6/X4RGYR6/uPoT6RIPKjib551b/piyelO77ja/7FhI6E6CFXRDYOh/qyjCTPUwseiA/895eL5l3b92js5IY8+s4gmNklUsV8N+z8+VI09O9xHCZMi4G5l3vniVTKM9WJueM8gVvkrdmjd+IJ1fl08e7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDvXcKZF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDvXcKZF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98C79C2BD01;
	Tue,  1 Sep 2026 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788278956;
	bh=HasbAbiscgkB/JlAaddXUmrmL9X8xBNF+D/Mcih0n8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IDvXcKZFF+vOqq/a8se+Fwjyyj4ZeLXSgNdmjkYAZwbXFaXOraDptqSv4a4vAnn3f
	 6o3MM8H5Kdg+mlZngaSM1nNzpdcngSqgPVlwMqSELFnSZORwGJOvo1a1w1BlScVFUg
	 G2hyzPoEVIUzT0rvy8C2RDxDERdaoWADKxXLpue1dsc6X9AJXwKn9uTy3CJxGONBj1
	 vLKkgsdNQ5xhbCrJ0jN6sc/m0AaNtoDyMbZt3/aRqRwDYwWqzV/umUQz9B2ZkdxkfB
	 NDaXnsHJxweTIqJ99ckAyMiOmmLT4vNWKPc+bHaa+0mHQZfWejQSFPcWB3zxC2FUyZ
	 6V8mPS1T2fpFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85208C624D8;
	Tue,  1 Sep 2026 16:09:16 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Wed, 02 Sep 2026 00:09:05 +0800
Subject: [PATCH 6/9] drm/tyr: add BO creation and lookup helpers
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-tyr-ioctls-v1-6-e0fdbf8bd108@kylinos.cn>
References: <20260902-tyr-ioctls-v1-0-e0fdbf8bd108@kylinos.cn>
In-Reply-To: <20260902-tyr-ioctls-v1-0-e0fdbf8bd108@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788278954; l=1841;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=abNwTjK9PrYCz2ItiXXIoKFGbxiH33YuD8UYsvPqLiI=;
 b=Uex/3W0EyxB0gcIL8eWYA/sjQXzaCiLpc+HrvugLg0hsDIo+bbu6Hon1FX9UroXbEfvMh/VHJ
 pQSLU4FgRc6BySPUkPs/8YHeEOfNFFzyRJi0GtpBOWJGbhyaWeskyvR
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

Add the new_object() and lookup_handle() helpers.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/tyr/gem.rs | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 3bf3787f5c3fd..be1affe80db1a 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -9,9 +9,11 @@
 use kernel::{
     drm::gem::{
         self,
-        shmem, //
+        shmem,
+        BaseObject, //
     },
     prelude::*,
+    sizes::SZ_4K,
     sync::{
         aref::ARef,
         Arc, //
@@ -23,6 +25,7 @@
         TyrDrmDevice,
         TyrDrmDriver, //
     },
+    file::TyrDrmFile,
     vm::{
         Vm,
         VmMapFlags, //
@@ -53,6 +56,30 @@ fn new(_dev: &TyrDrmDevice, _size: usize, args: BoCreateArgs) -> impl PinInit<Se
 /// Type alias for Tyr GEM buffer objects.
 pub(crate) type Bo = gem::shmem::Object<BoData>;
 
+/// Create a new GEM buffer object.
+pub(crate) fn new_object(ddev: &TyrDrmDevice, size: usize, flags: u32) -> Result<ARef<Bo>> {
+    if size == 0 {
+        return Err(EINVAL);
+    }
+
+    let aligned_size = size.checked_next_multiple_of(SZ_4K).ok_or(EINVAL)?;
+
+    Bo::new(
+        ddev,
+        aligned_size,
+        shmem::ObjectConfig {
+            map_wc: true,
+            parent_resv_obj: None,
+        },
+        BoCreateArgs { flags },
+    )
+}
+
+/// Look up a GEM object by handle for a DRM file.
+pub(crate) fn lookup_handle(file: &TyrDrmFile, handle: u32) -> Result<ARef<Bo>> {
+    Bo::lookup_handle(file, handle)
+}
+
 /// Creates a dummy GEM object to serve as the root of a GPUVM.
 pub(crate) fn new_dummy_object(ddev: &TyrDrmDevice) -> Result<ARef<Bo>> {
     let bo = Bo::new(

-- 
2.43.0


