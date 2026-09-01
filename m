Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A13A6F19
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 01:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788224774; cv=none; b=AOXXmw2nT/ODx88ZItqInL4SrHBB8hmFnmNLUr5yQkuIYvYFQMhDMswoOKswqttStHygu16VUsecHxuNbr97Imbu73+WMLKQzBw8AonrhDY6BPHWFIiENxi5KpUseOAAjYnwywnJGQDGWICO01BHxbkWC1inakczAtZ/+RAMxGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788224774; c=relaxed/simple;
	bh=SsyAyvYVRxyaGbCofbAxsc2u7fXyh+1qL/mHq3d5ifQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biVaOuVmdhmuWZMUCe7YwG1LloTbc7YthYFX/OyUtFjaDV2GYDH+ZXnDYUl1qfqMRQk/URr0iggVfQ4gMfDprD/vFLbb4qYXBBoIHfWhK8daGVH4Fqkf1DkZrmjMdZBwyrq7k+scTVt8HmHabUrYC7WAAFhzP/TDQjLoAfybGgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5dbj5i+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5dbj5i+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so6245480a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 18:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788224772; x=1788829572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Psf3PZaEFVRsSqIrSGCbE3xPeNWSAB3Ycaexf1yJAk4=;
        b=U5dbj5i+CKxFndzGVej85yBIZWL3ROJafEhF1Yj61LDKLX1qp54mnCq8/6wA2f/L1g
         N8+12hK9N9PSdQKMIbxiMgrxUgJ+OWhkqGfnjI/WkYvJG7kbHkY3DtL7ymiIM4i2KrPO
         7X+M1dRLqpbWT+hNfWBYbThiOMHsc6qkuoEznUY2yyM99OdmWNMIQBaEkZcYXkUjd49W
         062OShkZyQiITN/6lynWJkd4JUMw+7qLVA/+YOAZNt/dBLJ3iyqW0lGmvzToiCcrkGce
         qqQBAVpjjur7cYZQAi2kzlX/mHtHkF8bxQc2Gwje+cr0Fw71/kgF7kHkhJ3uezzwh2vN
         sCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788224772; x=1788829572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Psf3PZaEFVRsSqIrSGCbE3xPeNWSAB3Ycaexf1yJAk4=;
        b=GY7BhZBuScc12vRftuhu4uujuj7u5LbXd1Q2BrAl91RGWWPkJ6wk9ckKnrnKw893hh
         Osc7Z/TtnYSXAWdjmysduWcsBZuoB8+Y8P0yl+mXIjXWGmr51BTtrfweJ7kVn1Jp0fQl
         s55NEtPgDP2ojsuWhz6/QHcGix+c+mo8HbIdB81ynEKU85PjQetvld1zmrDPVb8jgXz3
         6ToFhTQ4bxm2BvwHEsFHKXEDDN1hMuCV1iXSwXQmYxWhCpE1fiv4rOIiGOBNT5dIR7G1
         PHv0pzejcIe9MJZrs/71kMTql/39Vsw9MXikNjz/I8XaC4fbDCwXbvHYOwR/hlBvCmjz
         RIXg==
X-Forwarded-Encrypted: i=1; AKwUvBxOEiBDHCN9HHgkHbVbV3zHxSTyMjFYgxe62y0yfkey69B3WfbMk+S5NCrlvexyxtq7edKmEO1oZOSU3gnt9w==@vger.kernel.org
X-Gm-Message-State: AFuF++kewhoH0yLVSsPXSUqr45zI4LIi9KmTP2s5mMKVOFLbazvG1H8K
	Thc0MaFeftbgrxtuJ9Sf5hukEd4Z5kQYmjRqlWHMBieEjLuG/psHCAIh
X-Gm-Gg: AYBFou1aVKobG0D8VbujEiDlteeZKtAwhN9K3JjF5qQOlVWMqx8WJxWlQrashe3tOzA
	XZXx7xT/6RYT34T7K+oTcJ4SuQwge4b2dGaNwmG2Whpnmx1RwLMvY7RREHCLu+GnH4elDoCaz/0
	MOrC/xzeJ08+JK/Sg1+a+gqSQ/Ke9DVal3Fs0+G/MEduMBeSXpzBj2paz07EWoX+sBo+rtuZA41
	5d9ngvdR/VmrFJscLuyEG2YoZr2/M5cXkJ4/okzr2R3muI441fm3gsKBrNjnp0eEOO7JS+Z66Tz
	9oKNIgW2nuPfQ6ZcwVB5u6fDt4DqXobbLPb7W/7uiPCPOkygoH5hiidpysX4jSouZApAx8Jh46C
	N6sbxVF/U4o6TeGtwYO0bNUYU/TJZQ2/HzLy4a61+IFPBqHKfpSu2cBn4g21TjVWn3wn3jp4ed+
	RsRvRyLBRCuNDZ2KLpFbq88tuxrDSqSKT1ATPE9omKGQIycydJqJ1DLyS7CFuYTc/iRJZELt598
	8kmwA==
X-Received: by 2002:a17:90b:3903:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39907bbe018mr5613741a91.8.1788224771878;
        Mon, 31 Aug 2026 18:06:11 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d49e9e0sm2372024a91.11.2026.08.31.18.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:06:11 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	djbw@kernel.org,
	rust-for-linux@vger.kernel.org,
	lukas@wunner.de,
	alistair@alistair23.me,
	jic23@kernel.org,
	linux-cxl@vger.kernel.org,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: gary@garyguo.net,
	ojeda@kernel.org,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	alex.gaynor@gmail.com,
	aliceryhl@google.com
Subject: [PATCH v3 15/21] lib: rspdm: Support SPDM get_capabilities
Date: Tue,  1 Sep 2026 11:03:41 +1000
Message-ID: <20260901010347.2614656-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901010347.2614656-1-alistair.francis@wdc.com>
References: <20260901010347.2614656-1-alistair.francis@wdc.com>
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
 lib/rspdm/consts.rs    |  19 +++++++-
 lib/rspdm/lib.rs       |   4 ++
 lib/rspdm/state.rs     |  78 ++++++++++++++++++++++++++++-
 lib/rspdm/validator.rs | 108 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 205 insertions(+), 4 deletions(-)

diff --git a/lib/rspdm/consts.rs b/lib/rspdm/consts.rs
index 055671d43abd..15d69631ed8c 100644
--- a/lib/rspdm/consts.rs
+++ b/lib/rspdm/consts.rs
@@ -9,13 +9,12 @@
 
 use crate::validator::GetVersionRsp;
 use core::mem;
+use kernel::bits::bit_u32;
 use kernel::error::{code::EINVAL, Error};
 
 // SPDM versions supported by this implementation
 pub(crate) const SPDM_VER_10: u8 = 0x10;
-#[allow(dead_code)]
 pub(crate) const SPDM_VER_11: u8 = 0x11;
-#[allow(dead_code)]
 pub(crate) const SPDM_VER_12: u8 = 0x12;
 #[allow(dead_code)]
 pub(crate) const SPDM_VER_13: u8 = 0x13;
@@ -102,3 +101,19 @@ fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
 pub(crate) const SPDM_GET_VERSION: u8 = 0x84;
 pub(crate) const SPDM_GET_VERSION_LEN: usize =
     mem::size_of::<GetVersionRsp>() + (u8::MAX as usize) * mem::size_of::<u16>();
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
+pub(crate) const SPDM_CERT_CAP: u32 = bit_u32(1);
+pub(crate) const SPDM_CHAL_CAP: u32 = bit_u32(2);
+
+pub(crate) const SPDM_REQ_CAPS: u32 = SPDM_CERT_CAP | SPDM_CHAL_CAP;
+pub(crate) const SPDM_RSP_MIN_CAPS: u32 = SPDM_CERT_CAP | SPDM_CHAL_CAP;
diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 58d86ea06fd9..76325babdff2 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -102,6 +102,10 @@ pub extern "C" fn spdm_authenticate(state_ptr: *mut spdm_state) -> c_int {
         return e.to_errno() as c_int;
     }
 
+    if let Err(e) = state.get_capabilities() {
+        return e.to_errno() as c_int;
+    }
+
     -(EPROTONOSUPPORT as i32)
 }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 9e8c65a12199..5ef14c8ed237 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -25,10 +25,17 @@
     SPDM_ERROR,
     SPDM_GET_VERSION_LEN,
     SPDM_MAX_VER,
+    SPDM_MIN_DATA_TRANSFER_SIZE,
     SPDM_MIN_VER,
-    SPDM_REQ, //
+    SPDM_REQ,
+    SPDM_RSP_MIN_CAPS,
+    SPDM_VER_10,
+    SPDM_VER_11,
+    SPDM_VER_12, //
 };
 use crate::validator::{
+    GetCapabilitiesReq,
+    GetCapabilitiesRsp,
     GetVersionReq,
     GetVersionRsp,
     SpdmErrorRsp,
@@ -52,6 +59,8 @@
 ///
 /// `version`: Maximum common supported version of requester and responder.
 ///  Negotiated during GET_VERSION exchange.
+/// `rsp_caps`: Cached capabilities of responder.
+///  Received during GET_CAPABILITIES exchange.
 #[expect(dead_code)]
 pub(crate) struct SpdmState {
     pub(crate) dev: *mut bindings::device,
@@ -62,6 +71,7 @@ pub(crate) struct SpdmState {
 
     // Negotiated state
     pub(crate) version: u8,
+    pub(crate) rsp_caps: u32,
 }
 
 impl SpdmState {
@@ -79,6 +89,7 @@ pub(crate) fn new(
             transport_sz,
             validate,
             version: SPDM_MIN_VER,
+            rsp_caps: 0,
         }
     }
 
@@ -297,4 +308,69 @@ pub(crate) fn get_version(&mut self) -> Result<(), Error> {
 
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
+            SPDM_VER_10 => (
+                core::mem::size_of::<SpdmHeader>(),
+                core::mem::size_of::<SpdmHeader>() + 4 + core::mem::size_of::<u32>(),
+            ),
+            SPDM_VER_11 => {
+                let len = core::mem::size_of::<SpdmHeader>() + 4 + core::mem::size_of::<u32>();
+                (len, len)
+            }
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
+        let mut response_vec: KVec<u8> = KVec::from_elem(0u8, rsp_sz, GFP_KERNEL)?;
+
+        let rc = self.spdm_exchange(request_buf, response_vec.as_mut_slice())? as usize;
+
+        // The transport must report a length within the buffer we provided.
+        if rc > response_vec.len() {
+            pr_err!("Overflowed capabilities response\n");
+            return Err(EIO);
+        }
+        response_vec.truncate(rc);
+
+        let response: &mut GetCapabilitiesRsp = Untrusted::new(&mut response_vec).validate()?;
+
+        self.rsp_caps = u32::from_le(response.flags);
+        if (self.rsp_caps & SPDM_RSP_MIN_CAPS) != SPDM_RSP_MIN_CAPS {
+            pr_err!(
+                "{:#x} capabilities are supported, which don't meet required {:#x}\n",
+                self.rsp_caps,
+                SPDM_RSP_MIN_CAPS
+            );
+            self.rsp_caps = 0;
+            return Err(EPROTONOSUPPORT);
+        }
+
+        if self.version >= SPDM_VER_12 {
+            let data_transfer_size = u32::from_le(response.data_transfer_size);
+            if data_transfer_size < SPDM_MIN_DATA_TRANSFER_SIZE {
+                pr_err!("Malformed capabilities response\n");
+                return Err(EPROTO);
+            }
+            self.transport_sz = self.transport_sz.min(data_transfer_size);
+        }
+
+        Ok(())
+    }
 }
diff --git a/lib/rspdm/validator.rs b/lib/rspdm/validator.rs
index 5990ff7ada29..42c0b28cdcaa 100644
--- a/lib/rspdm/validator.rs
+++ b/lib/rspdm/validator.rs
@@ -26,8 +26,13 @@
 };
 
 use crate::consts::{
+    SPDM_CTEXPONENT,
+    SPDM_GET_CAPABILITIES,
     SPDM_GET_VERSION,
-    SPDM_MIN_VER, //
+    SPDM_MIN_VER,
+    SPDM_REQ_CAPS,
+    SPDM_VER_10,
+    SPDM_VER_11, //
 };
 
 #[repr(C, packed)]
@@ -159,3 +164,104 @@ fn validate(unvalidated: &[u8]) -> Result<Self, Self::Err> {
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
+    reserved2: [u8; 2],
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
+            reserved2: [0; 2],
+            flags: SPDM_REQ_CAPS.to_le(),
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
+    param2: u8,
+
+    reserved1: u8,
+    pub(crate) ctexponent: u8,
+    reserved2: [u8; 2],
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
+impl<'a> Validate<Untrusted<&'a mut KVec<u8>>> for &'a mut GetCapabilitiesRsp {
+    type Err = Error;
+
+    fn validate(unvalidated: &mut KVec<u8>) -> Result<Self, Self::Err> {
+        let version = *(unvalidated.get(0).ok_or(EINVAL))?;
+
+        let expected_length = match version {
+            SPDM_VER_10 | SPDM_VER_11 => {
+                core::mem::size_of::<SpdmHeader>() + 4 + core::mem::size_of::<u32>()
+            }
+            _ => {
+                // Check to see if param1 is set
+                if *(unvalidated.get(2).ok_or(EINVAL))? == 0 {
+                    mem::size_of::<GetCapabilitiesRsp>()
+                        - mem::size_of::<__IncompleteArrayField<__le16>>()
+                } else {
+                    // Not currently supported by Linux, we don't set the bit
+                    // so the responder shouldn't either.
+                    return Err(EINVAL);
+                }
+            }
+        };
+
+        // Make sure the response meets the SPDM spec version requirements
+        if unvalidated.len() < expected_length {
+            return Err(EINVAL);
+        }
+
+        // If the response is shorter than GetCapabilitiesRsp
+        // (which is valid for older spec versions and when param1 is
+        // set to 0) then we need to pad the vector to ensure
+        // GetCapabilitiesRsp will be initialised.
+        while unvalidated.len() < mem::size_of::<GetCapabilitiesRsp>() {
+            unvalidated.push(0, GFP_KERNEL)?;
+        }
+
+        let ptr = unvalidated.as_mut_ptr();
+        // CAST: `GetCapabilitiesRsp` only contains integers and has `repr(C)`.
+        let ptr = ptr.cast::<GetCapabilitiesRsp>();
+        // SAFETY: `ptr` came from a reference and the cast above is valid.
+        let rsp: &mut GetCapabilitiesRsp = unsafe { &mut *ptr };
+
+        Ok(rsp)
+    }
+}
-- 
2.55.0

