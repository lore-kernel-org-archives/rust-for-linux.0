Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7A35A92F;
	Thu, 18 Dec 2025 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073176; cv=none; b=uFVF/BI5ASMKK7aMkFZZ5NoQ7e7jVer2rFpgMBX2agGRZ2bSWDB/QmRXI9gtwi8kDMZYO9uKTWhld5gD86Ar8bb7lah9RaWMeJVXLKlkCh/3bx+NX9ubKa4YyY4I12r3Y8WNIZ7omHGS8rQCS8gVuh1/hs6+eM0zTgD5RB7b/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073176; c=relaxed/simple;
	bh=gP/NY4VcXW0E9tzTPCUNhKx98dDbfmaXHBU2kHHZSmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsSbQfxNKFt9ZRiM0ajMI7U6sqMV9z14hFZO8WwZfbOGrJ91ElDK4RssK6Ru+gLEKumJtnjikq9Gh58eEwyWDoWEE1Xn8gkzrsAhYw11bQauagqEPJbr7eZjc+8kFzkg9yzihgceStrAXqOzyG8k+GTB5CR9ge79J8WpZzP+Zp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkBB5tBA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkBB5tBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01138C116C6;
	Thu, 18 Dec 2025 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073176;
	bh=gP/NY4VcXW0E9tzTPCUNhKx98dDbfmaXHBU2kHHZSmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkBB5tBAZy+q0QB7G58o/DIVVEqWtHlvApA7ZlCNKFSoUEZB/enREzDJvK5oEdPLF
	 lX0E0ZJ1rH39QIlitGkG/zbItC7yOx+f99rI65VVCU/4xTI9iKvIrTO/G0RoF55YR0
	 MH2kdsUoJDIBNFrMUJDsUtbju/g+7WgBYU0fw9YpthJWXEEC9V/BVw4M5ZFkuEjNam
	 MuGgVTKGVbUavh/sp3ZINz0Cu7sogP4V77TLNiCVd8linj5dXmiCAUf0dSx/wF9u2Q
	 c+R41M8hG0VVSYev2iUNxkhxWu2ZdUXbqnG8jkwzTJ1qQjXcqSthMJGIclmNqtrccf
	 1PGd5OXHDc6iQ==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	joelagnelf@nvidia.com,
	aliceryhl@google.com,
	lossin@kernel.org
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/4] gpu: nova-core: fw: move appropriate code into pin initializer
Date: Thu, 18 Dec 2025 16:50:49 +0100
Message-ID: <20251218155239.25243-3-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relocate the code that technically fits in the pin initializer into the
initializer itself.

While, thanks to pin_init_scope(), it is also possible to keep it as is,
moving appropriate code into the initializer has the advantage that it
structures the dependencies of fields naturally.

For instance, intermediate data that is only needed for a single field
goes into the initializer block of this field, making it obvious that it
is not needed by anything else.

On the other hand, intermediate data that is needed for multiple fields
to initialize remains above the initializer, naturally indicating that
it is needed my multiple fields.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 34 ++++++++++++++-------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e034268be3c5..da97814cf859 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -159,18 +159,9 @@ pub(crate) fn new<'a>(
         ver: &'a str,
     ) -> impl PinInit<Self, Error> + 'a {
         pin_init::pin_init_scope(move || {
-            let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
+            let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
 
-            let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
-
-            let sigs_section = match chipset.arch() {
-                Architecture::Ampere => ".fwsignature_ga10x",
-                Architecture::Ada => ".fwsignature_ad10x",
-                _ => return Err(ENOTSUPP),
-            };
-            let signatures = elf::elf64_section(fw.data(), sigs_section)
-                .ok_or(EINVAL)
-                .and_then(|data| DmaObject::from_data(dev, data))?;
+            let fw_section = elf::elf64_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
 
             let size = fw_section.len();
 
@@ -183,9 +174,6 @@ pub(crate) fn new<'a>(
                 })
                 .map_err(|_| ENOMEM)?;
 
-            let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
-            let bootloader = RiscvFirmware::new(dev, &bl)?;
-
             Ok(try_pin_init!(Self {
                 fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
                 level2 <- {
@@ -227,8 +215,22 @@ pub(crate) fn new<'a>(
                     DmaObject::from_data(dev, &level0_data)?
                 },
                 size,
-                signatures,
-                bootloader,
+                signatures: {
+                    let sigs_section = match chipset.arch() {
+                        Architecture::Ampere => ".fwsignature_ga10x",
+                        Architecture::Ada => ".fwsignature_ad10x",
+                        _ => return Err(ENOTSUPP),
+                    };
+
+                    elf::elf64_section(firmware.data(), sigs_section)
+                        .ok_or(EINVAL)
+                        .and_then(|data| DmaObject::from_data(dev, data))?
+                },
+                bootloader: {
+                    let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
+
+                    RiscvFirmware::new(dev, &bl)?
+                },
             }))
         })
     }
-- 
2.52.0

