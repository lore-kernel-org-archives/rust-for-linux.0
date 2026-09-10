Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D24A4828
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 15:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054777; cv=none; b=fT4d4J6FOzMwSZbtVROm98piDNmkSvdeY0FIieXhOnQn046RudLZNHCrbhaRl8mdE18HVCd/Nw8Jc6iRGDFPNNJwplnDjK6daoweMnKyhgpA+QRUX/vnmnvmCBmbWy9VjDmC82EmSS0pKqXPDh5t5LKPYPpusmtBYMbzSbCyA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054777; c=relaxed/simple;
	bh=yWG+hoDEtLJ/6H3nP82927cNZvMVB+giKJZJxO/9hwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXGoeja69psxrJV81EuZpON/rkaIfoO2KX4wUI1h5B2FyU/mqCDOIi786bKlyhyjUSwP2T1bs8lIOQUr4y7uVWll3M4QhIW9kPJozuAnVL3PJkn3GAsVQomY5pvSFnXWBPL9i+YZ1TtBWPVBZLF0btIu1FlviYLnL65Kcm9AvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rn6XOEe5; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rn6XOEe5"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5308fc4b67cso14493981cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054774; x=1789659574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LVg0q1Ig+XeCRC/Adf+hBiNx1miS6vJUHYevs12aWqM=;
        b=rn6XOEe5eR3CvGtusW2Y5oWYJ861I5S8DHjNeP4uo+jnGfHopfHnA6OjxpzYXScrNU
         vVfbp/0NQ0JyEFs1vVX3tb4Ee+vKJ5ghkZesChZoQZnYFOx/8YM+bh9T9b+O9zDS22aZ
         jxxks++bcrge+TR6WBtRlJjuBksCT4vnJBLB6isM3wSigWQw0j1bCMCgjg4gahzwa+3j
         jI90g9ThbT9cJARel5CRBBbii3LJzj8gbvBCiqRq6CDzzNV3Lb40iCVP65eh3LfjbKdG
         1pD0NP/U7dQbdJPT3Dq05g98sogLNOSvZmMr2tdvcIH+cre14K1JO6O78PSokjVBV0Ad
         SXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054774; x=1789659574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVg0q1Ig+XeCRC/Adf+hBiNx1miS6vJUHYevs12aWqM=;
        b=sMu9X51ltLviO13AenZmMKCH9nz+WV/dx0haAlGXbANduwudoyMoA4QUrGG5QHV9D8
         Fz4qBX3UUMcQXg4nbAsdImw/2ghsTAe3ARd7rXji/98WI2yd4WbQ+dxx6ww3lmYObHkV
         XMXDvInmJU3CYyCYPpZzolwYbJcSfOApCNzyIAYTRW1IcflWxAm6D4WKOnoJvqLJYXQ+
         IaSkVMmMR7P0IqdYbI3UaEKuN3SoLDjLo3tis5y3Dmcewhh21VEIPvQu5DAlWtwuW254
         sDGwuyillk0k4TO1GSvfZpLfaLVSiUiOEX9mgMMpyLFfKBJeuefLUKEXdA+fwDEJyR+d
         ezcw==
X-Forwarded-Encrypted: i=1; AKwUvBx4b68QVyf82T5igaKYGgVYkYit3CG0M/b7n0pntkx0I26qpXfI4NUBf55z30WR5/rWcvjOc0vEQHAp4tvDRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l5qUzObcWg7NB1o3I8vNr7X8IB7PwM68bbqwQFuWv4YJuCtrrk
	ynlsT8mqOYacoIhutSRm14m2EttwgE2MbJDX9+fr4RdiqEaWKrt/6ZlU
X-Gm-Gg: AYBFou0oHzZ8oXTZcl/QttN8Xs21T/hFjlp8N7hliiGz0u9zLJx07JtVROh6p7dSqmM
	eqIPhx9V9oXe0s/BFf0qeMBgdvf0JCd9ySm7LMRwzEMS3okdKvlT2wMHruQy0L+WBn18bjOnlwS
	y91mGcd3FPI+wsB28OpaJ+AbFRX70s/CZeF74n8s1Y6xZgL5CuF2jRPGjb71j8qz8YlYN1Axghd
	2LPN0InL6S3JeYJ6GNnzRqMHbQ0rSkTUrWoFGicE9tEKOcm4arW0nVVB/GWiyhUpsattGb27iHe
	hJU51QBRO/jaYeSxRIxrdeshax0+OxWIeAsj27IAhbxEKtAvoNwDeJKOLWxFkTBAU5fKFNoF8vb
	+hSODTVja+VUQcZKjoeGoaz2ynLfNmOQHBAa00rfLp4wjU/ORhTt9IrKVY9sxXgrk2Kx8n+KKm3
	Ud2pUqDJEGOVm9HG0WcWNB05sxXs7QuJK/XSnfuXtEySnkKQaFNvKt3ncTTBdzNPy+yZEsxmsiu
	4/sdsfz
X-Received: by 2002:ac8:5a8d:0:b0:530:6ffd:1ce8 with SMTP id d75a77b69052e-530aedb7cbbmr100110721cf.41.1789054773862;
        Thu, 10 Sep 2026 08:39:33 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm170860171cf.11.2026.09.10.08.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:39:33 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <iweiny@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust: auxiliary: validate DeviceId name length
Date: Thu, 10 Sep 2026 11:38:44 -0400
Message-ID: <20260910153844.3987791-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
`auxiliary_device_id::name` array without checking that they fit. An
oversized name is caught by the array bounds check, but the error
reports an out-of-bounds index in the copy loop rather than the
constraint the caller violated.

Check the invariant explicitly instead, so the failure states the length
limit rather than an array index.

This should only be reached when constructing a device ID table, so the
failure is a compile time error. Document that intent.

Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Drop Fixes: following feedback from Danilo Krummrich and Alexandre
  Courbot.
- Replace the `# Panics` section with a note that this is for device ID
  table construction, following feedback from Danilo Krummrich and Gary
  Guo.
- Reword the commit message so it does not suggest runtime evaluation,
  following feedback from Alexandre Courbot.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260909033246.2779303-1-georgeandrout13@gmail.com/
---
 rust/kernel/auxiliary.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 60dfbec8f330..2ace0428e45e 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -137,10 +137,18 @@ macro_rules! module_auxiliary_driver {
 
 impl DeviceId {
     /// Create a new [`DeviceId`] from name.
+    ///
+    /// This is only intended to be called in const context, when constructing a
+    /// device ID table, where exceeding `AUXILIARY_NAME_SIZE` is a compile time error.
     pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
         let name = name.to_bytes_with_nul();
         let modname = modname.to_bytes_with_nul();
 
+        assert!(
+            modname.len().saturating_add(name.len()) <= bindings::AUXILIARY_NAME_SIZE as usize,
+            "auxiliary device ID is too long"
+        );
+
         let mut id: bindings::auxiliary_device_id = pin_init::zeroed();
         let mut i = 0;
         while i < modname.len() {

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.47.3

