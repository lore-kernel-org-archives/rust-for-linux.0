Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045089;
	b=1XwjUY6bxrPsxR3KiKZpap3CEk9CetFhZLl4nG1RmyzOLcfdtCFrs4IP2h8wE5esrj93
	 0AMBoYmaPzJaNqc1miWcHzjvJdXyopy1iNIwocLkZFIXO6DHwumZTtzcZr2XJ5PRcn8UB
	 YtTTl5M/cAvt77zlvTKEcAtld1UHZH6BgrdT8E3FITdwEE2n5YPvLuORFolTrnyfS8SOp
	 hml8UXP/JgS2yKCAKBiWsEKOlolngIr7y2sk91OVxsw8wzkiZQEKRYWIA/zgCNrA9ykxl
	 aXvpr9+qouKfwjL9Vg2KZIxuv8vCWvPKVtRXa3aew5lvYi1VqsrYd0DQMVUiCcEXbEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045089;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=I9QM7AcXN+NGEFCpZazq539bp5laPCskln3LUMmzQl4=;
	b=hKM3Qgl0NyaKT+6U1mZ4sW1f1uWDCEHqVVwK2BVQsbsnouRH/yxg09KgBhVBBFbWvIdx
	 4yYm+QbJmrgjoGJcakIlD225L2AD0Co+XwMAqbvKy8Q85+HHh+iLai1pJTfHji8PZpfQz
	 GAMMpn3X38hrKffdiEkfvzCEbl4eEE6c9SkiR5vqybrfvRDpp18jFv6dxd1P6OYv1MCr2
	 XCVXJi7NWLXf6ugVG97c8Dh2DH81HCh1P/WPKfnrCnKVR67+Cyx8zES2Ns+48VYcBjd0z
	 it9xOZzAfxoLox3MGrt3C9OhKZN88kfQOLcSg1MuztnKyfjdHnxXV1C46W67aB6R5Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ko59BP5j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D1606A335;
	Wed, 18 Nov 2026 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ko59BP5j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4444D1F000C7;
	Wed, 18 Nov 2026 23:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045088;
	bh=I9QM7AcXN+NGEFCpZazq539bp5laPCskln3LUMmzQl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ko59BP5jz/U6b9VEqglkh310lLLTn+q/iGtd8d+hM8z4tdHNR+vYAO2/IBF/AZ5Fs
	 wnIjhs9ufGpyTZtqM6T3nTWaN5/G9+COOOSbS0i099SZcH8w12gu7nO5XQCuTfOwdL
	 UJ43mN3vxxPY7kYtA5bij9zZ+6SNjvhQDSceO6WKnKmIl7yef0sStl9Y6Ab3wQhg8c
	 vFRgXkDotWe+VS7lrAB05Xnh94K5EgNvmW2pcNn7CC04As+3JUZwmqSY7fNkNXEKN6
	 d5/x7qj2u0BOVcIu2efgCuLWO8VVn2kgJKLCnfqdzRtB7isawJgU4LuiRHe+ncTHdc
	 W2vLXBkArpdvA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	lossin@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	boqun@kernel.org,
	bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/tyr: use ScopeGuard for firmware loading cleanup
Date: Thu, 19 Nov 2026 00:37:05 +0100
Message-ID: <20261118233727.3147222-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118233727.3147222-1-dakr@kernel.org>
References: <20261118233727.3147222-1-dakr@kernel.org>
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

Use ScopeGuard to call vm.kill() when firmware section loading fails.
Dismiss it on success, replacing the nested closure and explicit error
check.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/tyr/fw.rs | 59 ++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
index bd377875778b..755112959ee2 100644
--- a/drivers/gpu/drm/tyr/fw.rs
+++ b/drivers/gpu/drm/tyr/fw.rs
@@ -29,7 +29,8 @@
     num::Bounded,
     prelude::*,
     str::CString,
-    time, //
+    time,
+    types::ScopeGuard, //
 };
 
 use crate::{
@@ -228,46 +229,40 @@ pub(crate) fn new<'a, 'res>(
             sections: {
                 let vm = vm.get_ref();
                 vm.activate()?;
+                let guard = ScopeGuard::new(|| vm.kill());
 
-                let result: Result<_> = (|| {
-                    let (fw, parsed_sections) = Self::load(dev, ddev, gpu_info)?;
-                    let mut sections = KVec::new();
-                    for parsed in parsed_sections {
-                        let size =
-                            u64::from(parsed.va.end.checked_sub(parsed.va.start).ok_or(EINVAL)?);
+                let (fw, parsed_sections) = Self::load(dev, ddev, gpu_info)?;
+                let mut sections = KVec::new();
+                for parsed in parsed_sections {
+                    let size =
+                        u64::from(parsed.va.end.checked_sub(parsed.va.start).ok_or(EINVAL)?);
 
-                        let va = u64::from(parsed.va.start);
+                    let va = u64::from(parsed.va.start);
 
-                        let mut mem = KernelBo::new(
-                            ddev,
-                            vm,
-                            size,
-                            KernelBoVaAlloc::Explicit(va),
-                            parsed.vm_map_flags,
-                        )?;
+                    let mut mem = KernelBo::new(
+                        ddev,
+                        vm,
+                        size,
+                        KernelBoVaAlloc::Explicit(va),
+                        parsed.vm_map_flags,
+                    )?;
 
-                        let section_start = parsed.data_range.start as usize;
-                        let section_end = parsed.data_range.end as usize;
-                        let mut data = KVec::new();
+                    let section_start = parsed.data_range.start as usize;
+                    let section_end = parsed.data_range.end as usize;
+                    let mut data = KVec::new();
 
-                        // Ensure that the firmware slice is not out of bounds.
-                        let fw_data = fw.data();
-                        let bytes = fw_data.get(section_start..section_end).ok_or(EINVAL)?;
-                        data.extend_from_slice(bytes, GFP_KERNEL)?;
+                    // Ensure that the firmware slice is not out of bounds.
+                    let fw_data = fw.data();
+                    let bytes = fw_data.get(section_start..section_end).ok_or(EINVAL)?;
+                    data.extend_from_slice(bytes, GFP_KERNEL)?;
 
-                        Self::init_section_mem(dev, &mut mem, &data)?;
+                    Self::init_section_mem(dev, &mut mem, &data)?;
 
-                        sections.push(Section { data, mem }, GFP_KERNEL)?;
-                    }
-
-                    Ok(sections)
-                })();
-
-                if result.is_err() {
-                    vm.kill();
+                    sections.push(Section { data, mem }, GFP_KERNEL)?;
                 }
 
-                result?
+                guard.dismiss();
+                sections
             },
         })
     }
-- 
2.56.1

