Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078919;
	b=OEQ+Vzcf3QVx0ZqLpNWZyO5KMgrdmdPsBnBeD5QLJzr6usEOs6TrGEbWZiB2T06YoyTV
	 heILcbJtjShB7MX4z6OBVWeQhRsY6B1ge3qYvfyF01mM0MI9nQo6A7fJ6U7Bsmg55LZJz
	 XPglV2dUVMIB5CjpJSQYM0eJ2giQQdgCuNYwUhDxKbVVRrMWiwOWGWP+Zm9c8kCdEhbS6
	 eoj2pYJ3a5tsTb1F0WOHzseidpPNKFrmxL0zbLeH49UZ/aKky5qASHDDSj3p8205fNqLM
	 IJEJCV1nMgCYIND0LwR9v2/3eiH+pu6iwT3nH6MYtKNk45oWbCy0csWLKX9yidRFs6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7ULKdw7nG1ai3r4qmUZgbvbhTa7bgBPZLif2ckCL4RE=;
	b=Rd+WcCvnJXQupsSR06CL4yB/SGRftD70OZiVVsDVVWR1sFmCeJn51IpFbmxqQpfY+qMu
	 rDT6e8eIv2jGt1u/8d+wt14fqvV+mjuC35k4w3DUHAMTtojhYyjHPF93YB7BdwPQUlSbT
	 rz70SB5tGdCp+dbgN+zj+QmWBZ4BX4dnip8zBK5UHQbERjlhOMJgQmzGaU2C8GLLfTbLF
	 ngxje2z5q8Y5JZ4T5H0rX1/+PjSUMVR5cUtYOw/oK2JIb4xUuN5Iw//qnMPxjb+79JJBP
	 TmqCzmKZFOgAynjwtz7kBwpxrSt5lGWaBtY+UNE9iqXop+L8O5Bz2nueuDxljoWfhXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="mNp0kR6/";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC3B606A31B
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC3B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mNp0kR6/
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea138a3497so24160145ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078919; x=1793683719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ULKdw7nG1ai3r4qmUZgbvbhTa7bgBPZLif2ckCL4RE=;
        b=mNp0kR6/8+rXV3/wgMuhgo+r7aGb+8okwnoahZdS4XbFD3lPv4O8pfgyykJFkA7zxG
         q50iylJXYUqE1oNkhv6QhRN20B4/V11ggoF1T73+2HewZ96tnn4klnetG+6iUIarHK4K
         FjULIrkHYom2wqihJmjz2z3uU/U45tCfLGKOg8CNJMewERo/LRWUu7sEJUOMArjIEmgb
         Y/4dkoBaSIAMnn3fGQlpovVAsArSytXlUNmST5bBs9GJWA9dFM447fCBluCpZAma8eru
         R4+yrPYRc+oeYG1o6Ou50HewqDYIuJ6TjIyMJNqN2ijTUCJxIP+Y/HuNzYFH7Tar/3v2
         zKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078919; x=1793683719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ULKdw7nG1ai3r4qmUZgbvbhTa7bgBPZLif2ckCL4RE=;
        b=tWrRb/To7WXs8Pz3bhaRcyfjqw0PYJZNUfVhDvwyBFeEpgAnCr8j3rp6/j/Ps4fMSD
         KE35gn3ih7c9bcPW2UB7VfXgCu2fB/602HvqbLtOPG+4MybinQa7ii3yn5/1YnKXMDcR
         LgGlhJNmoAgxnFapLkTjoL7ZG97bnYexuiVhVNDQMubZvyjP6Yj/WtmqAWMcXn15U4Gi
         xTm5F1b8RBmKQ0RZjird+EJTiURMus9VgCfGcE/dz3qUoQHQILevx5iJDCYJYlGm7t+B
         oNM79ou2Z5vXha4phxdE5xVtcubTldfY+BC/999yMOoI3simPCfSXXQBU0k/pEQaFfOS
         s/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzSRBfpL9bUpjXQ9j8rgi3HCetJQxG9E1Lv5A93WzYPyhm9y4NPkXTgKMFUl8DMB6/kklr/DSr3D5994C3U/g==@vger.kernel.org
X-Gm-Message-State: AFq9FYK36ILUC5x0sffBrwfxv2kNPyLOVHEUt4TkqGwEoGYqCa8+pYCK
	hITil0yx2TTlDNWDEBS9bMPMtArNdpgCz1i82z9skBzgxVT7kDj7nMb4
X-Gm-Gg: AYBFou3ZQwEk2UARmhuL78JRb4MnWWbiBLlQqMmZDHnQSoSI11qUQDBipRzEPQN0aE+
	cAmEGwH7Td0cKdG0DxDBHTZ1bWb9xzgK4qvlrKvJ1hepSjwEAFwUlETXkuCSz30Y3Ro6tX5mhPL
	3Yf/q1Vyo7pHA54fPOXvDEPan3UKryv3MwoEMMuj8wdYPAosYWc2Xt1wX4hRkozybem6UqhPIsu
	DzTpjNMAOGOWA9fyRtjxI4p1rZNV/cFRTUOGlyJ+OG+aECo3lVoCYd/kBVUiHVy8FltisJ9V9kx
	hzqs5BzCCgKfXJORZNIJ3Vp4oxtdthEOV1vrGv+r5PirG1XeX+2RUfY2wg3FDK4fXOtBnxEK0yR
	eCXzI5HVmfoJlfFsKeeKU8LwANNVuLgedmqdSIlyacLkFzzK/va20A7RZ2DQ89CvBDKNDC25uON
	PndH6EFdeBcjbs3WhFW0UGNlGlclVJvRbgcxoLOxFR4o3Y7gnICA7e2CtHKZyj2ABbqwSLYnksR
	jaQnsfQk493Zd8mEUiI8gN1vVabFBpejaljw6BGrCvDkDS1N5E8zRGloLkin66sKLz7HXjgqasQ
	kQrPeo6zvX/qDRifYG8=
X-Received: by 2002:a17:903:41d1:b0:2e9:5ec6:bfc9 with SMTP id d9443c01a7336-2ea9c6c82a8mr84726685ad.9.1793078918650;
        Mon, 26 Oct 2026 22:28:38 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:28:38 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 22/23] lib: rspdm: Support SPDM certificate validation
Date: Tue, 27 Oct 2026 15:25:35 +1000
Message-ID: <20261027052536.1722081-23-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
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

Support validating the SPDM certificate chain. This only performs basic
sanity checks on the chain before we continue on. This does not ensure
that the root CA is trusted, we leave that for userspace to check and
enforce. Instead we just make sure that the chain is correct, uses
supported signatures and that it isn't blacklisted in the kernel.

We then store the first leaf certificate for use later.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/rspdm/lib.rs   | 12 ++++++++++
 lib/rspdm/state.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 6b0be0a0303fa..5277fc8c56fb8 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -289,6 +289,18 @@ pub extern "C" fn spdm_authenticate(state_ptr: *mut spdm_state) -> c_int {
         provisioned_slots &= !(1 << slot);
     }
 
+    let mut provisioned_slots = state.provisioned_slots;
+    while (provisioned_slots as usize) > 0 {
+        let slot = provisioned_slots.trailing_zeros() as u8;
+
+        if let Err(e) = state.validate_cert_chain(slot) {
+            pr_err!("Certificate in slot {slot} failed to verify: {e:?}\n");
+            return e.to_errno() as c_int;
+        }
+
+        provisioned_slots &= !(1 << slot);
+    }
+
     -(EPROTONOSUPPORT as i32)
 }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 7799d4ac70c3f..aa36d4ce7b41a 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -14,10 +14,15 @@
         Bound,
         Device, //
     },
-    error::Error,
+    error::{
+        to_result,
+        Error, //
+    },
     hash::Shash,
+    public_key::PublicKey,
     str::CStr,
     validate::Untrusted,
+    x509::Certificate,
 };
 
 use crate::consts::{
@@ -97,7 +102,6 @@ fn exchange(
 ///
 /// `T` is data and an exchange function owned by the caller,
 /// so the borrow checker enforces that the transport data outlives `SpdmState`.
-#[expect(dead_code)]
 pub(crate) struct SpdmState<'a, T: Transport> {
     /// Responder device. Used for error reporting and passed to `transport`.
     pub(crate) dev: &'a Device<Bound>,
@@ -148,6 +152,9 @@ pub(crate) struct SpdmState<'a, T: Transport> {
     /// Certificate chain in each of the 8 slots. Empty `KVec` if a slot is
     /// not populated. Prefixed by the 4 + H header per SPDM 1.0.0 table 15.
     pub(crate) certs: [KVec<u8>; SPDM_SLOTS],
+    /// Public key portion of leaf certificate against which to check
+    /// responder's signatures.
+    pub(crate) leaf_key: Option<PublicKey>,
 }
 
 impl<'a, T: Transport> SpdmState<'a, T> {
@@ -173,6 +180,7 @@ pub(crate) fn new(
             sig_len: 0,
             crypto: None,
             certs: [const { KVec::new() }; SPDM_SLOTS],
+            leaf_key: None,
         }
     }
 
@@ -240,6 +248,9 @@ pub(crate) fn get_version(&mut self) -> Result<(), Error> {
         request.header.version = SPDM_MIN_VER;
         self.version = SPDM_MIN_VER;
 
+        // Clear the leaf cert as we are re-authenticating
+        self.leaf_key = None;
+
         let mut request_buf = request.to_bytes()?;
 
         let response_vec: KVec<u8> = KVec::from_elem(0u8, SPDM_GET_VERSION_LEN, GFP_KERNEL)?;
@@ -551,4 +562,45 @@ pub(crate) fn get_certificate(&mut self, slot: u8) -> Result<(), Error> {
 
         Ok(())
     }
+
+    pub(crate) fn validate_cert_chain(&mut self, slot: u8) -> Result<(), Error> {
+        let cert_chain_buf = &self.certs[slot as usize];
+        let cert_chain_len = cert_chain_buf.len();
+        // We skip over the RootHash
+        let mut offset = SPDM_CERT_CHAIN_HDR_SZ + self.hash_len();
+
+        if offset >= cert_chain_len {
+            return Err(EPROTO);
+        }
+
+        let mut prev_cert: Option<Certificate> = None;
+
+        while offset < cert_chain_len {
+            let (cert, cert_len) = Certificate::parse(&cert_chain_buf[offset..])?;
+            cert.check_accepted()?;
+
+            if let Some(prev) = &prev_cert {
+                prev.verify_signed(&cert)?;
+            }
+
+            let _ = prev_cert.replace(cert);
+            offset += cert_len;
+        }
+
+        if let Some(mut cert) = prev_cert.take() {
+            if let Some(validate) = self.validate {
+                // SAFETY: Call the `validate` function provided.
+                let rc = unsafe { validate(self.dev.as_raw(), slot, cert.raw()) };
+                to_result(rc)?;
+            }
+
+            // The leaf key is the same for all slots (MULT_KEY_CAP == 0),
+            // so just store the first one.
+            if self.leaf_key.is_none() {
+                self.leaf_key = cert.take_public_key();
+            }
+        }
+
+        Ok(())
+    }
 }
-- 
2.56.0

