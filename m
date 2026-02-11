Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745AD346E66
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780681; cv=none; b=kN1xYxjyqaWb3bc+Ha8JAxg52EPkM75Wwl0iJGBqAMri6xwBer7faHp/P+UHNCcAwWre0tnTm3QUhAsjmxgx7Z78W3iIHhZPzXI/8SQNzGFomzTbfxHxdQASNNxFVuEXNVByV8ipj1NiV53qU8eB6eqzLTanZJ16G+lhs8ATKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780681; c=relaxed/simple;
	bh=toTNJudqEcjkoiXvBRgz/9Q2oWXvwkah3SRR3afs6KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUrGoeuS3bEVZwAgLc/ZkJvHHEdGo2t53fSqLZ1GThZbPTQ1z5mb+7Sl9NLrX5WjlqdEwvcJc/KwGqCrwnDb738KhZIYntV5n8yZ1Gge8G5XdcukQ+/yhvZL2Tz+TmrAeeahMwNswv2KUh9ahEcWOhUQT6NCs3SoIyHuotawCTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUUNuXzp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUUNuXzp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c6dcdc955a1so1774729a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780679; x=1771385479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fSuzEVVGWU561gVbAJ53yu4VEf4z/D49690CUVMVKw=;
        b=XUUNuXzp9NUrPSsN3S5OsIVrX4vywggMJ+Ya08MjOEvbrw58iABYnbWmxy/rFqrhup
         PqX5d977fftNlbb/eXLBi/AaGCzkUPyrmVSe2fUUP0h01/M+sLZNQR89WgPdpu+H67gh
         O2Zr2hXOZJww4sEstmienYh3cyrN6qipu44o2nFy/8O7KlzEzWxZ5IPS1SF5UiQwPe4K
         CIiavm3OqLR/jr9LJMkKdnulxC+ENzS0SHVE+iXvYEpDvorsDqnzvn6ahMyb5F+7OGUX
         7ikc/g/88W4o8U7L1zsPw37XfN0WDdo7ljFG4MQmR+mibVZE2+R47yaFSkHLlTfOloO/
         ZhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780679; x=1771385479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fSuzEVVGWU561gVbAJ53yu4VEf4z/D49690CUVMVKw=;
        b=s3ZoMX8OIfX1MpeQmntnOB/Q6i5NE7Kx9ubw8EFc/8lnb1uCtNSzRUIht7XvaYyPbJ
         Mj2ZcMDsZULzuvnGZITquVvWheMO3JESDxl0as39OyDwq3KkxKUcVdJuipYp50cm1m0q
         Ui6HKVYeBKps/sZ/z7YNHk5Vl5aQPMxkO99gJPhhJuw8pCMmjfS8G9Yf8g/4Qr8Uq6mH
         KO6xRtZRnH2ogJ3zM8P80P9RV7O2iIKL1SzDApgoE5MhEGg67UlbsLdmRH1+QE1MKXkO
         dstnq4sYAhbQJMLBwcFBi4rEf3IuTKY8W7Lr3CMO0BizGMKGBqEtaGEVIhUYkP/9idLu
         QnuA==
X-Forwarded-Encrypted: i=1; AJvYcCXs+e0T3weNdE8JRn99taVQWsmyU1qbeD05kQVSXUnyi7RXXg3dYiCAo3MqGwDpcSJ0kCN3YEfl2wJjjQ4J5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Ljinx4IfjGj7V2RyILBQUmRrdFB2xHr60m2gik6F+TVtoyvt
	1w3lXvgW4qs7dp6Menic31gyxiWICjTtpm3lQg62qwLjvjIFSW8Jy4idjniIOuqnaDI=
X-Gm-Gg: AZuq6aIVZghXN7MBzVjx0v/LYXbQE1ZIlu0BsoV89qjBC0yJWgELIVp1YCHQRuHul18
	qY6ozOElJ2wCpUCFreYhKgy5VAxUGcUfUhcCzx6vlMOxIL2AWfCMsFufQhZPYypV0lIkWsN/tNm
	ig92/9f/0J1rt2LJPexJnD0mtAT8oW0ZVUU/j4HebDdghuN2GSgOu0n+NAWDuGGFVMdbc/EsAUw
	W6r4QlvtAZZLxTx56SNknyudXZe/gbAO2NMjGRxVC2wpzfSLAUdYxgY0WL9yKacP+sDo7Ol9R09
	t/u0xSg2H99bC4t7QbWodELq/ZaVlZJ/VEGpHZ7paRlejzHipCQAJeDIbYVyPojmq4oYtwz7wdE
	/PfmDtioXPCgxhw4N1Tnto6DTLVhyYWBlqOJv0m7qf4UdlBvS0/zIbXMkQvS+aJwwgLoSR6pxI3
	g4AbrW8Ymdx/d1lgAVAK1w2Fh6RY54u3Ztu4jo3ywEF1jQ3uHUraXO
X-Received: by 2002:a05:6a21:4d17:b0:392:e5eb:efe with SMTP id adf61e73a8af0-394324b73c1mr799709637.78.1770780678809;
        Tue, 10 Feb 2026 19:31:18 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:31:18 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	ojeda@kernel.org,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	Alistair Francis <alistair@alistair23.me>
Subject: [RFC v3 13/27] lib: rspdm: Support SPDM get_capabilities
Date: Wed, 11 Feb 2026 13:29:20 +1000
Message-ID: <20260211032935.2705841-14-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211032935.2705841-1-alistair.francis@wdc.com>
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair@alistair23.me>

Support the GET_CAPABILITIES SPDM command.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 lib/rspdm/consts.rs    | 18 ++++++++--
 lib/rspdm/lib.rs       |  4 +++
 lib/rspdm/state.rs     | 68 +++++++++++++++++++++++++++++++++++--
 lib/rspdm/validator.rs | 76 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 161 insertions(+), 5 deletions(-)

diff --git a/lib/rspdm/consts.rs b/lib/rspdm/consts.rs
index 38f48f0863e2..a6a66e2af1b5 100644
--- a/lib/rspdm/consts.rs
+++ b/lib/rspdm/consts.rs
@@ -12,9 +12,7 @@
 
 /* SPDM versions supported by this implementation */
 pub(crate) const SPDM_VER_10: u8 = 0x10;
-#[allow(dead_code)]
 pub(crate) const SPDM_VER_11: u8 = 0x11;
-#[allow(dead_code)]
 pub(crate) const SPDM_VER_12: u8 = 0x12;
 pub(crate) const SPDM_VER_13: u8 = 0x13;
 
@@ -132,3 +130,19 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
 
 pub(crate) const SPDM_GET_VERSION: u8 = 0x84;
 pub(crate) const SPDM_GET_VERSION_LEN: usize = mem::size_of::<SpdmHeader>() + 255;
+
+pub(crate) const SPDM_GET_CAPABILITIES: u8 = 0xe1;
+pub(crate) const SPDM_MIN_DATA_TRANSFER_SIZE: u32 = 42;
+
+// SPDM cryptographic timeout of this implementation:
+// Assume calculations may take up to 1 sec on a busy machine, which equals
+// roughly 1 << 20.  That's within the limits mandated for responders by CMA
+// (1 << 23 usec, PCIe r6.2 sec 6.31.3) and DOE (1 sec, PCIe r6.2 sec 6.30.2).
+// Used in GET_CAPABILITIES exchange.
+pub(crate) const SPDM_CTEXPONENT: u8 = 20;
+
+pub(crate) const SPDM_CERT_CAP: u32 = 1 << 1;
+pub(crate) const SPDM_CHAL_CAP: u32 = 1 << 2;
+
+pub(crate) const SPDM_REQ_CAPS: u32 = SPDM_CERT_CAP | SPDM_CHAL_CAP;
+pub(crate) const SPDM_RSP_MIN_CAPS: u32 = SPDM_CERT_CAP | SPDM_CHAL_CAP;
diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 08abcbb21247..5f6653ada59d 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -113,6 +113,10 @@
         return e.to_errno() as c_int;
     }
 
+    if let Err(e) = state.get_capabilities() {
+        return e.to_errno() as c_int;
+    }
+
     0
 }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 3ad53ec05044..0efad7f341cd 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -17,9 +17,12 @@
 };
 
 use crate::consts::{
-    SpdmErrorCode, SPDM_ERROR, SPDM_GET_VERSION_LEN, SPDM_MAX_VER, SPDM_MIN_VER, SPDM_REQ,
+    SpdmErrorCode, SPDM_ERROR, SPDM_GET_VERSION_LEN, SPDM_MAX_VER, SPDM_MIN_DATA_TRANSFER_SIZE,
+    SPDM_MIN_VER, SPDM_REQ, SPDM_RSP_MIN_CAPS, SPDM_VER_10, SPDM_VER_11, SPDM_VER_12,
+};
+use crate::validator::{
+    GetCapabilitiesReq, GetCapabilitiesRsp, GetVersionReq, GetVersionRsp, SpdmErrorRsp, SpdmHeader,
 };
-use crate::validator::{GetVersionReq, GetVersionRsp, SpdmErrorRsp, SpdmHeader};
 
 /// The current SPDM session state for a device. Based on the
 /// C `struct spdm_state`.
@@ -35,6 +38,8 @@
 ///
 /// `version`: Maximum common supported version of requester and responder.
 ///  Negotiated during GET_VERSION exchange.
+/// @rsp_caps: Cached capabilities of responder.
+///  Received during GET_CAPABILITIES exchange.
 #[expect(dead_code)]
 pub struct SpdmState {
     pub(crate) dev: *mut bindings::device,
@@ -46,6 +51,7 @@ pub struct SpdmState {
 
     // Negotiated state
     pub(crate) version: u8,
+    pub(crate) rsp_caps: u32,
 }
 
 impl SpdmState {
@@ -65,6 +71,7 @@ pub(crate) fn new(
             keyring,
             validate,
             version: SPDM_MIN_VER,
+            rsp_caps: 0,
         }
     }
 
@@ -269,4 +276,61 @@ pub(crate) fn get_version(&mut self) -> Result<(), Error> {
 
         Ok(())
     }
+
+    /// Obtain the supported capabilities from an SPDM session and store the
+    /// information in the `SpdmState`.
+    pub(crate) fn get_capabilities(&mut self) -> Result<(), Error> {
+        let mut request = GetCapabilitiesReq::default();
+        request.version = self.version;
+
+        let (req_sz, rsp_sz) = match self.version {
+            SPDM_VER_10 => (4, 8),
+            SPDM_VER_11 => (8, 8),
+            _ => {
+                request.data_transfer_size = self.transport_sz.to_le();
+                request.max_spdm_msg_size = request.data_transfer_size;
+
+                (
+                    core::mem::size_of::<GetCapabilitiesReq>(),
+                    core::mem::size_of::<GetCapabilitiesRsp>(),
+                )
+            }
+        };
+
+        // SAFETY: `request` is repr(C) and packed, so we can convert it to a slice
+        let request_buf = unsafe { from_raw_parts_mut(&mut request as *mut _ as *mut u8, req_sz) };
+
+        let mut response_vec: KVec<u8> = KVec::with_capacity(rsp_sz, GFP_KERNEL)?;
+        // SAFETY: `request` is repr(C) and packed, so we can convert it to a slice
+        let response_buf = unsafe { from_raw_parts_mut(response_vec.as_mut_ptr(), rsp_sz) };
+
+        let rc = self.spdm_exchange(request_buf, response_buf)?;
+
+        if rc < (rsp_sz as i32) {
+            pr_err!("Truncated capabilities response\n");
+            to_result(-(bindings::EIO as i32))?;
+        }
+
+        // SAFETY: `rc` is the length of data read, which will be smaller
+        // then the capacity of the vector
+        unsafe { response_vec.inc_len(rc as usize) };
+
+        let response: &mut GetCapabilitiesRsp =
+            Untrusted::new_mut(&mut response_vec).validate_mut()?;
+
+        self.rsp_caps = u32::from_le(response.flags);
+        if (self.rsp_caps & SPDM_RSP_MIN_CAPS) != SPDM_RSP_MIN_CAPS {
+            to_result(-(bindings::EPROTONOSUPPORT as i32))?;
+        }
+
+        if self.version >= SPDM_VER_12 {
+            if response.data_transfer_size < SPDM_MIN_DATA_TRANSFER_SIZE {
+                pr_err!("Malformed capabilities response\n");
+                to_result(-(bindings::EPROTO as i32))?;
+            }
+            self.transport_sz = self.transport_sz.min(response.data_transfer_size);
+        }
+
+        Ok(())
+    }
 }
diff --git a/lib/rspdm/validator.rs b/lib/rspdm/validator.rs
index f69be6aa6280..cd792c46767a 100644
--- a/lib/rspdm/validator.rs
+++ b/lib/rspdm/validator.rs
@@ -16,7 +16,7 @@
     validate::{Unvalidated, Validate},
 };
 
-use crate::consts::SPDM_GET_VERSION;
+use crate::consts::{SPDM_CTEXPONENT, SPDM_GET_CAPABILITIES, SPDM_GET_VERSION, SPDM_REQ_CAPS};
 
 #[repr(C, packed)]
 pub(crate) struct SpdmHeader {
@@ -131,3 +131,77 @@ fn validate(unvalidated: &mut Unvalidated<KVec<u8>>) -> Result<Self, Self::Err>
         Ok(rsp)
     }
 }
+
+#[repr(C, packed)]
+pub(crate) struct GetCapabilitiesReq {
+    pub(crate) version: u8,
+    pub(crate) code: u8,
+    pub(crate) param1: u8,
+    pub(crate) param2: u8,
+
+    reserved1: u8,
+    pub(crate) ctexponent: u8,
+    reserved2: u16,
+
+    pub(crate) flags: u32,
+
+    /* End of SPDM 1.1 structure */
+    pub(crate) data_transfer_size: u32,
+    pub(crate) max_spdm_msg_size: u32,
+}
+
+impl Default for GetCapabilitiesReq {
+    fn default() -> Self {
+        GetCapabilitiesReq {
+            version: 0,
+            code: SPDM_GET_CAPABILITIES,
+            param1: 0,
+            param2: 0,
+            reserved1: 0,
+            ctexponent: SPDM_CTEXPONENT,
+            reserved2: 0,
+            flags: (SPDM_REQ_CAPS as u32).to_le(),
+            data_transfer_size: 0,
+            max_spdm_msg_size: 0,
+        }
+    }
+}
+
+#[repr(C, packed)]
+pub(crate) struct GetCapabilitiesRsp {
+    pub(crate) version: u8,
+    pub(crate) code: u8,
+    pub(crate) param1: u8,
+    pub(crate) param2: u8,
+
+    reserved1: u8,
+    pub(crate) ctexponent: u8,
+    reserved2: u16,
+
+    pub(crate) flags: u32,
+
+    /* End of SPDM 1.1 structure */
+    pub(crate) data_transfer_size: u32,
+    pub(crate) max_spdm_msg_size: u32,
+
+    pub(crate) supported_algorithms: __IncompleteArrayField<__le16>,
+}
+
+impl Validate<&mut Unvalidated<KVec<u8>>> for &mut GetCapabilitiesRsp {
+    type Err = Error;
+
+    fn validate(unvalidated: &mut Unvalidated<KVec<u8>>) -> Result<Self, Self::Err> {
+        let raw = unvalidated.raw_mut();
+        if raw.len() < mem::size_of::<GetCapabilitiesRsp>() {
+            return Err(EINVAL);
+        }
+
+        let ptr = raw.as_mut_ptr();
+        // CAST: `GetCapabilitiesRsp` only contains integers and has `repr(C)`.
+        let ptr = ptr.cast::<GetCapabilitiesRsp>();
+        // SAFETY: `ptr` came from a reference and the cast above is valid.
+        let rsp: &mut GetCapabilitiesRsp = unsafe { &mut *ptr };
+
+        Ok(rsp)
+    }
+}
-- 
2.52.0

