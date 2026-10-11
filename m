Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC93502A8
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703355; cv=none; b=sS7f6+yod+h7ovp8JGSVPCsOq5/0ux3x7rwg9CA9ECXelI4uaCWqJBMLnOUj3mRjHdd+lu2ZphncCT10DMSjnF4+g/BlwqZX17qZsoxbfBk7QjpiE7EDt2NsXewE484aKK9VuYCBSJKUMHUz8IBBPL0sO2MQzxDGabTANqcdyNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703355; c=relaxed/simple;
	bh=ziT/zq8KkzNVIsF0WWx+lXTJdR2Ix6V6zIRJw4f+Xsg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=a76eTSnzMlAHCTdHIDNB3K//Z88qIgWCL57WYKWwJFV57Wgb5EgSddtTRBVRJYUPuf8UK2kJ/k8AvLVESOCD5VkNlFduxmH0Qyy2mMeUwWc9rwD0TzjVI888+SZJhgEto0uYbzd30gHcTjboiucdwtjVsBt3bZJFBHivInIN2HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gPE83poW; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gPE83poW"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1721559b4so11386595e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791703352; x=1792308152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvbrsW1mo/6FXW+04W7eG9GRRwc1pm+Fzyrx7oUOUKY=;
        b=gPE83poWEfQNOgTtmRD5IhFEaNJyLndy43YK8PuEDnvPstCG/+Sy51wBDeviCdWEeW
         y2FRx27HiUOgIFOH6b4brkEQYF7WUaHDipHIqC7GUxlD/OX0mDtxAe7FauZHYNa0xMTA
         1vb6aQOzE+jhIxQ17zl5Fhs6WcG0gQYfeA1Sw3oe0YyB1gBKi2erN0oq7mfdxPoFDxSn
         ovsElIrSYmOH2RFVqSwjuHoORAuAWUqjr6NMKKzGBB2qEE2p9EF/7U9rBkH1XPIv20Qo
         PJRxTM1VyG8zeI4I2jiucAwTZVTo8snQYCLlE56MK4HxLxrli2Z7meFVWl/eq2L81oA7
         4fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791703352; x=1792308152;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvbrsW1mo/6FXW+04W7eG9GRRwc1pm+Fzyrx7oUOUKY=;
        b=pbIC1qRW6jF1ZP13u9NEzELK3iLCO0NoXqbddvlmKvKuqKY+/by1+dQT7RDRvix8gq
         Ly7pvF2FixwqX8ZTVfQTz1ukEgXkkfEGOsdl+AqpZn0gdYP16waeSPiawWt1ouXiv9ua
         ZqHj+WJb5PZiZL0+X5ljBc47h/x2g9MdRFJBEYer1EoRx8R1JKr8IQ36DVbJ3sOiMCak
         UG8ghWpFW4G0xaWrOtcapa6JlHJaS2BEFqK/osw4EyLeXsAxEVB7L0nknNcnJUIbj28n
         uIvB0NkVhDwZXF5Zn+DgqBuhZlE33crmP1/12CN6HPF2E+DSjg/pzrKh4CrsinAAbznr
         APjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBdOyEN6s5BXO4P6WgUxWvnWMStbUc8YeURYKwMUjLYhJq9yW1ZXXY59x3rb/M0zz6sNMM70h0tgd6UOmLuA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLhitHlSAyW4fCPmpm59dyPiWy4R2Sq5RrsGyZiSzNI5/mB1Rt
	JPu37aIDIXVR9G6GAAADBwSh0s1eyrGYYlD6m92oLj2nr449irFSTc1CxRBaiujCBKJL2zY8Dob
	upsTY2BHUE+cvc2T8gA==
X-Received: from wrvo9.prod.google.com ([2002:a5d:62c9:0:b0:48b:b2:a375])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154c:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4a18e4a9b88mr129872505e9.13.1791703351428;
 Sun, 11 Oct 2026 00:22:31 -0700 (PDT)
Date: Sun, 11 Oct 2026 07:22:22 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC05y2oC/x3MQQqEMBAF0atIr21IAjrqVcSFo19tUCMdjAPi3
 Q2zrMWrmwJUEKjJblJECeL3FDbPaFj6fQbLmJqccaU11vJ8nHFjRXIR7CN0Wv3FxbdwZvyUVVW DEj4Uk/z+47Z7nhf1Ku0NaAAAAA==
X-Change-Id: 20261011-gpuvm-reserve-overflow-5b520d76889e
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ziT/zq8KkzNVIsF0WWx+lXTJdR2Ix6V6zIRJw4f+Xsg=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqyzkyOJ70AQD13qV9X0DzlJkRrhzWP3pQIVWBZ
 cQOWHFsopKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCass5MgAKCRAEWL7uWMY5
 RihfD/9agbFtirssrsDUXcyn9UYZDRBpdwjYrwBBnCDaKKxWc/EDMmuVPTolahMPyyev4ryitR7
 TlhCOpZ92X5HOj656cEaQfEQJE0yqRqQPh0aYZCBuQXt5daDucF/hSFIBSsnuuT25s1Fjlw+oLw
 J3vuaUzurS1lC9AZjrV6HcSpRkGH/lMC4KExhiI7ibmTOi5erlqAB/JoZhUReMUjGEzCNIntuVn
 +TbdF1c6+6kJZAWY2bQiWsjwR+fw2EvOJhtBtR2JXKEDSmegM2y7G+FUk0iZDHnvFIf7UAf0XqC
 h2oRAPZEozMUpbgLYzRNDIjxZ81ZjsfmEMRAPKGh6WjWrAh9Cq5s43R3SZSxGbcvD0zJQQM+Njz
 x429P4lQH7CagQ8LQ/PYXUgWuxBHY4xR1t1p85OG697TmjOtC1F4ZfS5WAMTK18j+88Kv2E/3/W
 4GS09ILc9NKQVtOBCiazMVYaWVg96teChsQCIryV3VXL4o+YbQmZaiUlu6SoYTII86oNO+5VCJ7
 8hD4G6vAOq6OZrGuIykTyECpv2xiqEHaiwQuyl8m4br/T6c15p7+rwH1ArmWlbx/YPxPGMhyWfi
 ikJVsqJRfHq0lCDCIhyNhNZU+ewzHhdXPRb1UR8H8cNtWecLTQRPWR/Wq7zFwLl2ObwAEDceB64 U3I09HoDW086s7w==
X-Mailer: b4 0.14.3
Message-ID: <20261011-gpuvm-reserve-overflow-v1-1-9c0cb23d7409@google.com>
Subject: [PATCH] drm/gpuvm: skip setting kernel_alloc_node range on overflow
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	Boris Brezillon <boris.brezillon@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When the reserved VA range overflows in drm_gpuvm_init(), insertion of
kernel_alloc_node is skipped, leaving its vm pointer NULL. However,
va.range is still set to a non-zero value, which causes drm_gpuvm_fini()
to dereference the NULL vm pointer when removing the node. Thus, only
initialize kernel_alloc_node's address and range when the overflow check
succeeds.

Note that this fixes unsoundness in the Rust GpuVm::new() abstraction:
passing a backwards reserve_range (start > end) when overflow checks are
disabled causes `end - start` to wrap around, triggering the overflow in
drm_gpuvm_init() and dereferencing NULL when the GpuVm is dropped.

Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d1c80ad3dead..626985743943 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1127,12 +1127,12 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 
 	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
 	if (reserve_range) {
-		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
-		gpuvm->kernel_alloc_node.va.range = reserve_range;
-
 		if (likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
-							  reserve_range)))
+							  reserve_range))) {
+			gpuvm->kernel_alloc_node.va.addr = reserve_offset;
+			gpuvm->kernel_alloc_node.va.range = reserve_range;
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
+		}
 	}
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_init);

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261011-gpuvm-reserve-overflow-5b520d76889e

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

