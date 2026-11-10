Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284539;
	b=L1xbn/RPXWUyOk782Bl2KSSet0dZv01NLJ7u0thgdNCfiZ/2AVlQXrBvJL09OoVrDA/V
	 Zmebw0HT3FiTkwF18s32HPM/iJ4b9xXvashhQXf3kv4gJcSuivwP6X2GQVS8JArHDjHDL
	 obLV4Wk7uRCBssfoMVmU0KfDKgnS3CwiM6JQMtYfN5qLr6zxGIWn9VBnXIAvqMVBYNlzU
	 FkEPdPQWerpefWJllrO0eewzYs9YLCBLXhNTKOIlIeD0cqhtSQxvljWaxf/NZG9l9YbH+
	 S+udX+Xx6O+XeGiPCgihI8vtUgzrH7HCr+PKgUdm1144G3OeuB+k8ZhQf9JHLTUOhwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
	b=YEhSY9LTD89f/XyiDWOD/BLzoGInAbPUbtvAftf9vOH2g1+Eifsj3TVufJ1SweiH7Fcm
	 G3ZSLJKKfpqiZHtQF5TV82KONJUZ9ENS7BUErulmNd3f7zMBtxhdS921XBDadoC8uLHQL
	 jGUB0PcdTcDa6nrOVtAuMcoZna8CuICUpA6Jfrrq+UnzzcG77BLTTxt31YvokOBJfGXUn
	 EhpPhCmEb32cX2a5YCeo3JJbSSqugR1Ei3T69hTINd5dIvz//wthZ7Mdo36O1aSq8q/gX
	 5e5/E1lYQBJGYk8q69FfSjUC7uRyrSGW2TfAQ95kdbAW0WfEekLLX1raiZJCDy3ESQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6GcAIoM;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B31606A731
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B31606A731
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6GcAIoM
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a3c08d6928so2883157c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284537; x=1794889337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
        b=Y6GcAIoMky3oeSIHUgB2Mjm010BlPmVQ7t0ba1wxD4W/1igjfnN3/JlTXkToWSFml0
         ptSyuFK2E1l5miKEorIz2pgNYUJoq0fEtnt26LVxvTM8Qe+BfKtQjzV7Z0iNTw6E8yG2
         CVqoAmzAf2FUiL5HMEQhKo0lFFTtr560hbQblk0AOZVH25CD7COwhtYObutS+4k1azhG
         lAMOIRxuiXoo6udBIn9pguQULxNKBlZV0nMNhCCELShYjJlth6FX6nBJh+XmjMs5nLU3
         pmZNpyheJdNuFvjLptOu+HQde5wVjpqTRn6suCUh0DV6+yLUK8R12xAtehl45jFtw/jK
         4UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284537; x=1794889337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPNBoQQW3WB02TBAF3BzFuV2QfVhO4wd2JVa30h/5s0=;
        b=GR0ASwizkqIn8F102DNbEMi1D3p9Bv0eqFQWV6pd+DSfz9DqK7G/ln34wXw/oflrm2
         jg4IGyTwoZopjJZeaLDz0P8NI/3kflV0lTIVnCywgz/h/GRxCRIFficBlN8N0pPIchHU
         Rj0My8uxEQwomX61h628n9P881I4EtWaSgpDQH6EEBDdqL+hfaqt1WOAIZeA5L+/pFc7
         L5hHYkTcoMe5PGxG6eJe9om2HUDozoqPHVh3z/5wCN1opglV58M8TqUllF0XuufnV/NR
         AgX1xpqcXDO7cetRmfcUc0Yuig4zcudExCZdOvZ8e8NtoVuNlvtrR8IRSu5tLSoCQ6Ix
         Mm8w==
X-Forwarded-Encrypted: i=1; AL+hErGeO27IdKKri7bhHQWPCPI4knZzF6PhX+9jbEz/9L+o3dce2YtiGbO4gPWJ0rG0bH2Yxh4nr4MunBTnryuKXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HM6Ha6v8qJLyFu/11QmEhJTiNpJzCV9uuYssKPTuh5XFbjGHl
	NmHWnaJDCfhnIeaXJ6InPY7JkzUuR3U+Hvo5U1lusiy3vNHmGGbZOkW6
X-Gm-Gg: AYBFou1QJFiOpTfV+1PVp2gQSL/WI1uiJvNyBQcLZwns3yJYmSIZ6F7iHYWmwaDQBTM
	GWFdz8JbuFlif4ZLl/zp2k8bFkg+gE5rcRzpbJIRbT1LTEswtr9vNC/fV3SQMykPyUkFxlRqvlW
	k3NObG3TiVfxW8cVj73W81mskx//Jne1CB3fmfioqWU3SyA2JF6PHSnZjSRWkaVzY8QUwReJehm
	wd41EBxrnoFwjWzuwjZG35uVotcHGbcmyL+68XPqNsQQoTFPZw16Z+2b8zSHHy2TksU9DzjJ1lt
	jCVfzYL7cGHTDGpOuIDlLZYs95+e5miE8PvRe8nk8hjkzmBGMwnJa/Wwq9msznisVMwsIXU8+8e
	Eo/lh/p1sWSyh+7IbRNp8xxLtV1RtJQO778DFVa8VF8qwUWXXbbJ/lPWV+wlAsDvUV6L1GPMLzr
	/IoxrMa9JBD/oU65tVNmA4wB1xFzTiPk4xuBd1PRJ8w50fCKUL+QfXWDh+VNBYZTWAbx/Hhyfhe
	cWOzcPmd0NtNGRdSiqHZDLNyKYH/iH+LgMAtOpkvSoLh1jAnELzkSBcr5syxw9IIGl1dNtFMfcw
	RWXBiv6vZHr9NYl7xxIzgF40suxMzZdJ626Sse3ky4fBwYw=
X-Received: by 2002:a05:701b:270c:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-1b3b5fda3bfmr2024081c88.13.1794284537372;
        Mon, 09 Nov 2026 20:22:17 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:22:16 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 25/25] lib: rspdm: Expose public Rust API
Date: Tue, 10 Nov 2026 14:18:32 +1000
Message-ID: <20261110041832.1730924-26-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

Expose a public Rust API and an example that can be used to authenticate
an SPDM responder.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/rspdm/lib.rs   | 69 ++++++++++++++++------------------------------
 lib/rspdm/state.rs | 43 +++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 49 deletions(-)

diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 6bfe1eedc4121..6b1f864fe7266 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -9,6 +9,26 @@
 //!
 //! Top level library, including C compatible public functions to be called
 //! from other subsytems.
+//!
+//! ```rust,ignore
+//! struct MyTransport { }
+//!
+//! impl Transport for MyTransport {
+//!     fn exchange(
+//!         &self,
+//!         dev: &Device,
+//!         request: &[u8],
+//!         response: &mut [u8],
+//!     ) -> Result<usize, Error> {
+//!         todo!()
+//!     }
+//! }
+//!
+//! fn authenticate_device(dev: &Device, transport: &MyTransport) -> Result {
+//!     let mut state = SpdmState::new(ARef::from(dev), transport, 512, None);
+//!     state.authenticate()
+//! }
+//! ```
 
 use crate::bindings::{
     spdm_state, //
@@ -30,7 +50,7 @@
 };
 
 use crate::consts::SPDM_MIN_DATA_TRANSFER_SIZE;
-use crate::state::{
+pub use crate::state::{
     SpdmState,
     Transport, //
 };
@@ -263,51 +283,8 @@ fn from(code: SpdmErrorCode) -> Self {
 
     let mut state = mutex.lock();
 
-    if let Err(e) = state.get_version() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.get_capabilities() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.negotiate_algs() {
-        return e.to_errno() as c_int;
-    }
-
-    if let Err(e) = state.get_digests() {
-        return e.to_errno() as c_int;
-    }
-
-    if state.provisioned_slots == 0 {
-        return -(bindings::EIO as c_int);
-    }
-
-    let mut provisioned_slots = state.provisioned_slots;
-    while (provisioned_slots as usize) > 0 {
-        let slot = provisioned_slots.trailing_zeros() as u8;
-
-        if let Err(e) = state.get_certificate(slot) {
-            return e.to_errno() as c_int;
-        }
-
-        provisioned_slots &= !(1 << slot);
-    }
-
-    let mut provisioned_slots = state.provisioned_slots;
-    while (provisioned_slots as usize) > 0 {
-        let slot = provisioned_slots.trailing_zeros() as u8;
-
-        if let Err(e) = state.validate_cert_chain(slot) {
-            pr_err!("Certificate in slot {slot} failed to verify: {e:?}\n");
-            return e.to_errno() as c_int;
-        }
-
-        provisioned_slots &= !(1 << slot);
-    }
-
-    let provisioned_slots = state.provisioned_slots.trailing_zeros();
-    if let Err(e) = state.challenge(provisioned_slots as u8) {
+    if let Err(e) = state.authenticate() {
+        dev_err!(&state.dev, "Authentication failed: {e:?}\n");
         return e.to_errno() as c_int;
     }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 059398e95b92d..0fe99caf27958 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -96,7 +96,7 @@
 ///
 /// This trait abstracts the bus-specific message transport (for example
 /// a DOE mailbox for PCIe CMA) from the SPDM session logic.
-pub(crate) trait Transport {
+pub trait Transport {
     /// Perform a single SPDM message exchange.
     ///
     /// Send `request` to the responder and write the response into
@@ -115,7 +115,7 @@ pub(crate) trait Transport {
 /// it does not need to stay bound to its driver. `T` is data and an
 /// exchange function owned by the caller, so the borrow checker enforces
 /// that the transport data outlives `SpdmState`.
-pub(crate) struct SpdmState<T: Transport> {
+pub struct SpdmState<T: Transport> {
     /// Responder device (reference counted). Used for error reporting and
     /// passed to `transport`.
     pub(crate) dev: ARef<Device>,
@@ -194,7 +194,7 @@ impl<T: Transport> SpdmState<T> {
     ///
     /// `transport_sz` is the maximum message size the transport can carry,
     /// and must be at least the SPDM minimum data transfer size (42 bytes).
-    pub(crate) fn new(
+    pub fn new(
         dev: ARef<Device>,
         transport: T,
         transport_sz: u32,
@@ -232,6 +232,43 @@ pub(crate) fn hash_len(&self) -> usize {
             .unwrap_or(0)
     }
 
+    /// Authenticates the responder through a sequence of GET_VERSION,
+    /// GET_CAPABILITIES, NEGOTIATE_ALGORITHMS, GET_DIGESTS, GET_CERTIFICATE
+    /// and CHALLENGE exchanges.
+    pub fn authenticate(&mut self) -> Result {
+        self.get_version()?;
+        self.get_capabilities()?;
+        self.negotiate_algs()?;
+        self.get_digests()?;
+
+        if self.provisioned_slots == 0 {
+            return Err(EIO);
+        }
+
+        let mut provisioned_slots = self.provisioned_slots;
+        while (provisioned_slots as usize) > 0 {
+            let slot = provisioned_slots.trailing_zeros() as u8;
+
+            self.get_certificate(slot)?;
+
+            provisioned_slots &= !(1 << slot);
+        }
+
+        let mut provisioned_slots = self.provisioned_slots;
+        while (provisioned_slots as usize) > 0 {
+            let slot = provisioned_slots.trailing_zeros() as u8;
+
+            self.validate_cert_chain(slot)?;
+
+            provisioned_slots &= !(1 << slot);
+        }
+
+        let provisioned_slots = self.provisioned_slots.trailing_zeros();
+        self.challenge(provisioned_slots as u8)?;
+
+        Ok(())
+    }
+
     /// Start a SPDM exchange
     ///
     /// The data in `request_buf` is sent to the device and the response
-- 
2.56.0

