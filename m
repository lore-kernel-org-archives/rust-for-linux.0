Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5931D90DF
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760557830; cv=none; b=UCElJxg1prj2tkZTDJCD1AenTR9LCNfFg2LqsY8mk1VymXJhnK4pn3YFNYtCiUY8iv8ovdub8m755Q9YC56Oegu6xuvkrmjSa2Flvqkcai6ayV2xB7UncmYQBEW1rYK/f8f9VJxMMaQofjBSE3BU61ZzFuF7BnyfU5IWF39cKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760557830; c=relaxed/simple;
	bh=KTkSxAvPRadvij5PEFv0BxxLn58Yt2Myc84E5LCxkv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DS9HLy/UPz6njm3/DpxyfGsqFTaQCl+MlhWI3xta/DEq58l/A66ecNLf4AiwnRp7z5fMSZBBiSfYCWVMrbWXcew7uZj53TTOPeUld46Y+VRTUpe//G0uPoAT9djEYbm00ySNyegMdbdGIDwYKn8NbPj/PtEm3CEJvZXM3IO4MCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dk6hjHTg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dk6hjHTg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso51353535e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760557825; x=1761162625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdStip0PmH8uNxqvUSt7q9Mj9fkGcDmvgx0joPS4jZo=;
        b=Dk6hjHTgx/pTL8vRXMFhjl/VG56wfCuxYYu4rfLjyWsyLNN8BMQ3hOG9QDoY6KUDXW
         xA0PNzSdmdzPxzn4B22V5J/6o3cOdj8poFnCEyLITnYVs0VVoTqcIqqLZ33Zf5vIY0sQ
         gSQJRF17+lHqa+/rd62g4cl82zABiyFCk2vkpng7JmFgp5C2J7Wefw48OJdOVZ1u2sa3
         PlGUd7bNWhObpMH+2LlEbfnGc17o+DS0rDx25NkfjMj9pT3MfKUmYw/zlP7fRhaNqOHL
         Yx2bTXTdDZUgkrjB6kDH4F4ediIw4UCDzAB2aQFyuY6N6bqbjhH3xnCkfwRnWnbQTL44
         wVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760557825; x=1761162625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdStip0PmH8uNxqvUSt7q9Mj9fkGcDmvgx0joPS4jZo=;
        b=uUCDlzJFI6wEZ8ps9r715PtjoZQ/LxTlFJ0aQNGkImfyM2BuLz9t/xLHaFLaf2cb9R
         RHlD2rto6EXSm8dkBp9LZtv0SNjniQni+W23irdh5fLcYpttlXbppfPlqQY9NpAkC48p
         hg8Q8PNJvvwTt8JjDfyNeidgPUrA1iKrT0JDbs6bR5hGTwAB7KupGO8j3wj8uIfgoUzJ
         GsZ5cgePe4SErXpWm5UNhfrhEz2F4tw62dy5xwIg8bI/YkY6nVR7PJOzcN1qu0f6fkSR
         TDdaeOmPNkEPfV8KNH1z4b3DYfFYK1an+j8GBpEp/dD5Mm9TwFs0irg66g+sOc/KmvXg
         HNyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnJ4FUczbsMbuI97HrtlVKeWWFtUOJlls34VQo0zkw69hknnHoeaNMD/OcduY6T1Y3cFDiHoFPEu8+3pWZnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7H02fLL17N7kTvAQQjJ1Odwg5opiWizhEce5M5UwbSOkeM31W
	Y3ExpxV9EYu8Sd7Fm5q7lWfQ4xLNRmExu+UNkp0+uydH1Aq+w3lDIGQi
X-Gm-Gg: ASbGnctumNDay672g6OMdC7bff8TGmJSwLB3X0FActz4w/O8XOsKrjBV3LEdN1h0/ap
	eXUOLR+UI/EhG4l2fjE5hrYDxxU1SNvleHJMiHc8L/BW53gnB1Ytb5/1oZ1vI7SqBwN1ys8gFld
	slMhNuX8P7hg7tEDiqZUD+gyQxaKGU5Dk1+3y1JP+GS+ayWOkNN5kcmONU47rMpZPsOFo8czQqF
	gSp6rjP2c/4sg/tz594VctZMh35inAYpz0mFqxC840X8PDC2q/AWHEc3RgK6tJ6cp9Bg3Vnp341
	ploJMBBiND8lum9c7X7SiPG/hMBPZWnsayhOyPuQvjTfbR2fjfE8TAEo5wwjsjdDl+IpaFxSA9g
	hOYL5/UnqCS8jgdDKCGHF/sebo7qruRedD7jnMxvtA2yMHWYcCSC3nd/pG2/SN84uu9okd2HVZw
	Md9qPcbDZMwJV9wr+XGFm0x+Tg0ehT
X-Google-Smtp-Source: AGHT+IGddGrpCxX7OrSl23A+tvIURBAgb57PvaARooGLmVHLlO5kmYWtSLkEff3kH7Jc2lvzrUziFw==
X-Received: by 2002:a05:600c:1990:b0:46e:37af:f90e with SMTP id 5b1f17b1804b1-46fa9a8f085mr218854435e9.6.1760557824618;
        Wed, 15 Oct 2025 12:50:24 -0700 (PDT)
Received: from archito.cern.ch ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm281464675e9.11.2025.10.15.12.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:50:24 -0700 (PDT)
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Subject: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation` improvements [COHA]
Date: Wed, 15 Oct 2025 21:49:35 +0200
Message-ID: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch solves the existing mentions of COHA, a task
in the Nova task list about improving the `CoherentAllocation` API.
I confirmed by talking to Alexandre Courbot, that the reading/writing
methods in `CoherentAllocation` can never be safe, so
this patch doesn't actually change `CoherentAllocation`, but rather
tries to solve the existing references to [COHA].

Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
---
 drivers/gpu/nova-core/dma.rs            |  20 ++---
 drivers/gpu/nova-core/firmware/fwsec.rs | 104 ++++++++++--------------
 2 files changed, 50 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
index 94f44bcfd748..639a99cf72c4 100644
--- a/drivers/gpu/nova-core/dma.rs
+++ b/drivers/gpu/nova-core/dma.rs
@@ -25,21 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
     }
 
     pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
-        Self::new(dev, data.len()).map(|mut dma_obj| {
-            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
-            // SAFETY:
-            // - `dma_obj`'s size is at least `data.len()`.
-            // - We have just created this object and there is no other user at this stage.
-            unsafe {
-                core::ptr::copy_nonoverlapping(
-                    data.as_ptr(),
-                    dma_obj.dma.start_ptr_mut(),
-                    data.len(),
-                );
-            }
-
-            dma_obj
-        })
+        let mut dma_obj = Self::new(dev, data.len())?;
+        // SAFETY: We have just created this object and there is no other user at this stage.
+        unsafe { dma_obj.write(data, 0)? };
+
+        Ok(dma_obj)
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 8edbb5c0572c..cc5a6200d0de 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -11,12 +11,12 @@
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
 use core::marker::PhantomData;
-use core::mem::{align_of, size_of};
+use core::mem::size_of;
 use core::ops::Deref;
 
 use kernel::device::{self, Device};
 use kernel::prelude::*;
-use kernel::transmute::FromBytes;
+use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
@@ -70,6 +70,8 @@ struct FalconAppifDmemmapperV3 {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
+unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
 
 #[derive(Debug)]
 #[repr(C, packed)]
@@ -82,6 +84,8 @@ struct ReadVbios {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for ReadVbios {}
+// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
+unsafe impl AsBytes for ReadVbios {}
 
 #[derive(Debug)]
 #[repr(C, packed)]
@@ -94,6 +98,8 @@ struct FrtsRegion {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsRegion {}
+// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
+unsafe impl AsBytes for FrtsRegion {}
 
 const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
 
@@ -104,6 +110,8 @@ struct FrtsCmd {
 }
 // SAFETY: any byte sequence is valid for this struct.
 unsafe impl FromBytes for FrtsCmd {}
+// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
+unsafe impl AsBytes for FrtsCmd {}
 
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
@@ -149,24 +157,9 @@ impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
 ///
 /// Callers must ensure that the region of memory returned is not written for as long as the
 /// returned reference is alive.
-///
-/// TODO[TRSM][COHA]: Remove this and `transmute_mut` once `CoherentAllocation::as_slice` is
-/// available and we have a way to transmute objects implementing FromBytes, e.g.:
-/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
-unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
-    fw: &'a DmaObject,
-    offset: usize,
-) -> Result<&'b T> {
-    if offset + size_of::<T>() > fw.size() {
-        return Err(EINVAL);
-    }
-    if (fw.start_ptr() as usize + offset) % align_of::<T>() != 0 {
-        return Err(EINVAL);
-    }
-
-    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
-    // large enough the contains an instance of `T`, which implements `FromBytes`.
-    Ok(unsafe { &*(fw.start_ptr().add(offset).cast::<T>()) })
+unsafe fn transmute<T: Sized + FromBytes>(fw: &DmaObject, offset: usize) -> Result<&T> {
+    // SAFETY: Guaranteed by the safety requirements of the function.
+    T::from_bytes(unsafe { fw.as_slice(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
 /// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
@@ -176,20 +169,12 @@ unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
 ///
 /// Callers must ensure that the region of memory returned is not read or written for as long as
 /// the returned reference is alive.
-unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
-    fw: &'a mut DmaObject,
+unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
+    fw: &mut DmaObject,
     offset: usize,
-) -> Result<&'b mut T> {
-    if offset + size_of::<T>() > fw.size() {
-        return Err(EINVAL);
-    }
-    if (fw.start_ptr_mut() as usize + offset) % align_of::<T>() != 0 {
-        return Err(EINVAL);
-    }
-
-    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
-    // large enough the contains an instance of `T`, which implements `FromBytes`.
-    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset).cast::<T>()) })
+) -> Result<&mut T> {
+    // SAFETY: Guaranteed by the safety requirements of the function.
+    T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
@@ -260,32 +245,38 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
 
         // Find the DMEM mapper section in the firmware.
         for i in 0..hdr.entry_count as usize {
-            let app: &FalconAppifV1 =
             // SAFETY: we have exclusive access to `dma_object`.
-            unsafe {
+            let app: &FalconAppifV1 = unsafe {
                 transmute(
                     &dma_object,
-                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize
+                    hdr_offset + hdr.header_size as usize + i * hdr.entry_size as usize,
                 )
             }?;
 
             if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
                 continue;
             }
+            let dmem_base = app.dmem_base;
 
             // SAFETY: we have exclusive access to `dma_object`.
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
-                transmute_mut(
-                    &mut dma_object,
-                    (desc.imem_load_size + app.dmem_base) as usize,
-                )
+                transmute_mut(&mut dma_object, (desc.imem_load_size + dmem_base) as usize)
             }?;
 
+            dmem_mapper.init_cmd = match cmd {
+                FwsecCommand::Frts {
+                    frts_addr: _,
+                    frts_size: _,
+                } => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS,
+                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+            };
+            let cmd_in_buffer_offset = dmem_mapper.cmd_in_buffer_offset;
+
             // SAFETY: we have exclusive access to `dma_object`.
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                    (desc.imem_load_size + cmd_in_buffer_offset) as usize,
                 )
             }?;
 
@@ -296,24 +287,19 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
                 size: 0,
                 flags: 2,
             };
-
-            dmem_mapper.init_cmd = match cmd {
-                FwsecCommand::Frts {
-                    frts_addr,
-                    frts_size,
-                } => {
-                    frts_cmd.frts_region = FrtsRegion {
-                        ver: 1,
-                        hdr: size_of::<FrtsRegion>() as u32,
-                        addr: (frts_addr >> 12) as u32,
-                        size: (frts_size >> 12) as u32,
-                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
-                    };
-
-                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
-                }
-                FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
-            };
+            if let FwsecCommand::Frts {
+                frts_addr,
+                frts_size,
+            } = cmd
+            {
+                frts_cmd.frts_region = FrtsRegion {
+                    ver: 1,
+                    hdr: size_of::<FrtsRegion>() as u32,
+                    addr: (frts_addr >> 12) as u32,
+                    size: (frts_size >> 12) as u32,
+                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                };
+            }
 
             // Return early as we found and patched the DMEMMAPPER region.
             return Ok(Self(dma_object, PhantomData));
-- 
2.51.0

