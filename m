Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC81218851
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750328484; cv=none; b=ESN8B4DvU+emNT28X6fA6OQ63cUZaoh4xrbiIJoCzCeH8gEJlLWJ+vI8BUVYe079IXlIY1Myk89azL0LIotZvxhdtqxFVOs1iWPduDaW9mbvD42flN2mFjqDM5pZ5hhL1rl8PoOhEMHT0PlJg9Twe0nFPAq7bpndIWoGooRakI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750328484; c=relaxed/simple;
	bh=qUZR5lgHqcPpgjeAobNpTm8ZVpspQlqknfyMVXj1SLU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dsf0CDxPbSUZbT7FCK1cKyoIP3QJxrU8i2jzzndm6/wF/RovowYtMbHJs+qQafVBgjlnFZn0XNL4+Ati2r47a6yYHkJQiPRfsQx/lHZPCmvDUxBBRs/11/A3vva+4VYn8ZqAB2TRBNB5wUBQ3fGX8+QtRmlj9FuytkTzrZ1Q1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 964B9113E;
	Thu, 19 Jun 2025 03:21:01 -0700 (PDT)
Received: from e129154.arm.com (unknown [10.57.67.185])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 230573F66E;
	Thu, 19 Jun 2025 03:21:17 -0700 (PDT)
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
Subject: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Date: Thu, 19 Jun 2025 12:21:02 +0200
Message-Id: <20250619102102.750668-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the Opaque<T>, the expectations are that Rust should not make any
assumptions on the layout or invariants of the wrapped C types.
That runs rather counter to ioctl arguments, which must adhere to
certain data-layout constraints. By using Opaque<T>, ioctl handlers
end up doing unsound castings, which adds needless complexity and
maintenance overhead, brining no safety benefits.
Drop the use of Opaque for ioctl arguments as that is not the best
fit here.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---

 Additional comments:
 - UAPI types already automatically derive MaybeZeroable,
   so it probably makes little sense to add any verification for that
 - FromBytes is pending, but due to the orphan rule, adding verification
   of it being implemented for IOCTL args here is pointless
 - Verifying pointer alignment could make use of strict_provenance,
   but that one is unstable and I am not sure what are the exact rules
   here for using those. Without that one though, verifying alignment in
   some cases (i.e. pointer tagging) might require more extensive changes.
   Happy to deal with either.

 rust/kernel/drm/ioctl.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 445639404fb7..12b296131672 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -139,7 +139,7 @@ pub mod internal {
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
                             let data = unsafe {
-                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
+                                &mut *(raw_data as *mut $crate::uapi::$struct)
                             };
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::as_ref(raw_file) };
-- 
2.25.1

