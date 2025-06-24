Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867AF27AC28
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757565; cv=none; b=i+fdaysJnW0U2+DB+4ECKghqhENMAwUPFyHuq8YiZoED44R49kRngK4lUK14ZDc4fGvq0LwELQz+/7Mu50KweKf2P0g+BcBsggRs1bhGGLanLtOP31hnGbfEkRoIFMMj3xMrIryvjWngUv6ezIMNjOhwlSPDxZzC5KeTiGyQhEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757565; c=relaxed/simple;
	bh=WGhlAQVRf1+1cMfeAegdIY6u/5eJ4EVhEKifLqd1Q/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VkzhoGINwynSQHM+ryFKjI4GuqmJBJV+u7iBwsbxVW0htPMhwuOeBrd4WPR8ukJa6yNiBto0bO/qWa0+QJL90pzviHkda4pqrE6rQJ2iMpPoE5JGm+X710QSgwxvDxG2KOmyVe7uyCfpbDbhv4fOn5KmSKgfkR3dveUGo/BErEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF224106F;
	Tue, 24 Jun 2025 02:32:24 -0700 (PDT)
Received: from e129154.arm.com (unknown [10.57.66.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38DAD3F66E;
	Tue, 24 Jun 2025 02:32:38 -0700 (PDT)
From: Beata Michalska <beata.michalska@arm.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	alyssa@rosenzweig.io,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] rust: drm: Drop the use of Opaque for ioctl arguments
Date: Tue, 24 Jun 2025 11:31:59 +0200
Message-Id: <20250624093200.812812-2-beata.michalska@arm.com>
In-Reply-To: <20250624093200.812812-1-beata.michalska@arm.com>
References: <20250624093200.812812-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the Opaque<T>, the expectations are that Rust should not
make any assumptions on the layout or invariants of the wrapped
C types. That runs rather counter to ioctl arguments, which must
adhere to certain data-layout constraits. By using Opaque<T>,
ioctl handlers are forced to use unsafe code where non is acually
needed. This adds needless complexity and maintenance overhead,
brining no safety benefits.
Drop the use of Opaque for ioctl arguments as that is not the best
fit here.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 rust/kernel/drm/ioctl.rs | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 445639404fb7..3425a835f9cd 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -83,7 +83,7 @@ pub mod internal {
 ///
 /// ```ignore
 /// fn foo(device: &kernel::drm::Device<Self>,
-///        data: &Opaque<uapi::argument_type>,
+///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
 /// ```
@@ -138,9 +138,12 @@ pub mod internal {
                             // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
-                            let data = unsafe {
-                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
-                            };
+                            // The `ioctl` argument is exclusively owned by the handler
+                            // and guaranteed by the C implementation (`drm_ioctl()`) to remain
+                            // valid for the entire lifetime of the reference taken here.
+                            // There is no concurrent access or aliasing; no other references
+                            // to this object exist during this call.
+                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::as_ref(raw_file) };
 
-- 
2.25.1

