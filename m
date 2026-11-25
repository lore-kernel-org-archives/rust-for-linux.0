Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646909;
	b=gQt8El2EKe5MriZyXPpQpxngfmgogu9MpEluuJFUDNNcboDoL66Eigk9d18SAaStHEga
	 TZNA2SxbmqFZiSMj5Nq3NTKfUoFXRfz7PaB/SQhwQgO29h4mle0d0pZ9cYbJC6gUdVFF9
	 g2Cf/ZScvwkLGseRUXnR5yXctZHsftqk63evqwK//5iZSsnq/9p2p6Vz+nf3ZzyJKyEpk
	 TLFMdSWEJievNigfGChnsqsDRr2tnPCPOtTVE4JaO7HG9vEbVHZ9+htwduf2xg5Z4fnO+
	 CCAOgqgD6eKzfpj3xypH32qzS8I68/gidHog8w1jjWgiQmMwcdf+VJ9H/IJ6ssAL8ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646909;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=yqwKxt8OioFbTNvyW3TTu1ruDdKhjb30mKOHD/K3wjg=;
	b=jXcDzUqHQo0irMZ1fNuwuAsPcUMsxhBzn+K3lXNuOP+dlkrGyfWf2Lo0xNl1RXVlKdHO
	 4tdZGYPsn3LK9VNF6Mj8F82pCvAafGS/ddkvO9PAYbXvP3JopX3eb0V62OJfCJUFYRMcU
	 mJEFKgyn3xLK9d93T6okp4143PQ41Xt5/Qt31FADXW4Aekt88WlEE/mrMlx5ghotSWZmc
	 43s7ojJV+DScoMO8W9MTSGqRseHug8VNDsXsP/cgL/xFiAya5AB+xLNX7UAorzuM1D42v
	 yYaUFkVDsPF2tUJaCwKA8KyYoNTNUWXWxWZr3wq87aVLt9d2HuWJTDx11bTE2430e/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=f4niqBJi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043D606A684;
	Wed, 25 Nov 2026 22:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3043D606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=f4niqBJi
ARC-Seal: i=1; a=rsa-sha256; t=1795646863; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dFUnqYHdyanN70jS6w0HYREfpzkSoOrdzlSYAC82xruckoXgn2Ni4j47fwE6nunK/VI9//6PnxRf4s2eO2c73alVr7S3TCpnC383RKrKi6qTlugzHtsEproJyzLLpXS9S73KkYMwn9qHXyJnSi0TydJ7Bdxc32WJ5SRU7XhwcnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646863; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yqwKxt8OioFbTNvyW3TTu1ruDdKhjb30mKOHD/K3wjg=; 
	b=cTeIyEr2KFocMqb5Xb8XyWgnq32Erq8TglNhSj5J8YSMNKn14MH+hgRWVVJ8oZRlsfJDDuWpUNfTdGtDm0Ff//v8ZeoWIe66V8FuUL/UOzzkR4YekluzcPXUjst/ktoyw3uvZenuNV4elkgx928dV2gB8Xp57b4yFp8WvYIsOKs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=f4niqBJimjNPLIepxTzclq1QRsUTpL0t36pS+tN/iivKDIaq0wfVgwKyjoz8xr5HZHockLqUeaXEeY2EsoXksWZxD5m26MbOdN8wHIQSneE5VmnvojwYno+Qf8+2/sjqGRow7yrLG/PjndcAewXBA0nu065xAOMOffZCphq6yLw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=yqwKxt8OioFbTNvyW3TTu1ruDdKhjb30mKOHD/K3wjg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646861444544.1512337615831;
	Wed, 25 Nov 2026 14:47:41 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:46:58 -0300
Subject: [PATCH 07/13] drm/tyr: use `cv!` for constant conversions
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-tyr-as-casts-v1-7-2b2f53164d86@collabora.com>
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

An `as` cast silently drops the bits that do not fit the target type,
and nothing at the cast shows whether that can happen. As part of a
larger effort to reduce the number of `as` casts in Tyr, convert
constants with `cv!`, which fails the build if the value does not fit
the target type.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/file.rs | 2 +-
 drivers/gpu/drm/tyr/regs.rs | 6 +++---
 drivers/gpu/drm/tyr/vm.rs   | 8 +++++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 9030e535b7d0..78c2147328e1 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -79,7 +79,7 @@ pub(crate) fn dev_query(
         if devquery.pointer == 0 {
             match devquery.type_ {
                 uapi::drm_panthor_dev_query_type_DRM_PANTHOR_DEV_QUERY_GPU_INFO => {
-                    devquery.size = core::mem::size_of_val(&reg_data.gpu_info) as u32;
+                    devquery.size = cv!(size_of::<uapi::drm_panthor_gpu_info>() => u32);
                     Ok(0)
                 }
                 _ => Err(EINVAL),
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 603a9052c439..49e4adf2231d 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -751,11 +751,11 @@ fn from(access: AccessType) -> Self {
     #[repr(u8)]
     pub(crate) enum CoherencyMode {
         /// ACE-Lite coherency protocol.
-        AceLite = uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_ACE_LITE as u8,
+        AceLite = cv!(uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_ACE_LITE => u8),
         /// ACE coherency protocol.
-        Ace = uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_ACE as u8,
+        Ace = cv!(uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_ACE => u8),
         /// No coherency protocol.
-        None = uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE as u8,
+        None = cv!(uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE => u8),
     }
 
     impl TryFrom<Bounded<u32, 32>> for CoherencyMode {
diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index d15db120352b..9b52f3562004 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -80,11 +80,13 @@
     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
     pub(crate) enum VmFlag {
         /// Map as read-only.
-        Readonly = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_READONLY as u32,
+        Readonly =
+            cv!(uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_READONLY => u32),
         /// Map as non-executable.
-        Noexec = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC as u32,
+        Noexec = cv!(uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC => u32),
         /// Map as uncached.
-        Uncached = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED as u32,
+        Uncached =
+            cv!(uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED => u32),
     }
 );
 

-- 
2.56.0

