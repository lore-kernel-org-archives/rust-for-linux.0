Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284446;
	b=Hw4oJd5uW67wxZ6AxnIwqlxQOcwKcfdj68gS9Yd3jnOLPoEgIgTfD71A2DbYBeXi75lK
	 5hFthiw+129BSHAscCdVRjxW1WIzefjmcwfWaDWTly0BPN2BZChIevH3gfT9g27wE1DGx
	 AMv/s3IhE2lei8KgSyD1EkQonOCgo8egfbj3kFc3V8CrlvmA//+zjBjKBX7HaLUd6OSku
	 Upg8gVagiLcwhJz7FiPymZyuxVG9mn55Kk0Xd+qKukxCq5WKvpOsRlwIzxJRiL9mkNfN0
	 lgwY1H8wZ7ZCnIgkqeoc2gWR+K99nb57+dg/emEZAsEmjrifI92mZO6ZTs1iLazdSaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HrFSDojbDaesV6HtIZlkvVOjVzmaKFDGfU9+ooggeTo=;
	b=sanlhJFgGpfvRPEb9vkUpO2K6wMbHfSaFWGulHZOC7QcSm1dSqMJ709ydoFpDvJd5TPl
	 4aRzfqdBxRKKK4tqLCdzKE6VMgU/hXIDxNhjYpe+Svv3VO5SGzFR+6z0hUo6uQ0MKIOiz
	 eXr4xygYLtP3nvv5IW177IdieyBqE+gWWXDwlwR6e36wegd1djuNKcvpQ6lXhFef+kJes
	 LmmNQAtV6mE5XBq0NL5V1oRgTQ/skKHLyizrLL20dPQXToXsy6tz64eJlw+tgqK5pDrqY
	 m02+Jy/qJ8pdagpPQaMlK2CmGSyiH7WsTdMCW1q9+byLLKIHWKrzbsK8zFex+L5KAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvHnrrV+;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15EE606A332
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15EE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvHnrrV+
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso2159189c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284445; x=1794889245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrFSDojbDaesV6HtIZlkvVOjVzmaKFDGfU9+ooggeTo=;
        b=wvHnrrV+iHBiBk55YGEa0ghkA4ON3iG0KnpRaeNYnUc3LWAEL1MhcCp6XyE/oM3Qbi
         rqDhXLl1963Z71WxHgoMgjEe4Si1drYcO0JCFwmF1Pl3pgDJZsfYxLbo2NT+v9v77i12
         AhLlZwFaazZgmmP6RaBkoTqvQ6s1O//IsNvp9VyXs5npUaxz9Vhl4qms+vGLJZujN7to
         2oXi8EVN8PPOfJ9h7Du7gMp+P6govTwuFCEMg0gFkc0NXeHGselD3S0/+cbDjl5UNIcQ
         HNMh+C4Y3x596IFpNTBeanyi4wO4/PezEeIdb+ly3m+EMvpFLJUfk1i+97YK8gkF+2ZE
         uGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284445; x=1794889245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrFSDojbDaesV6HtIZlkvVOjVzmaKFDGfU9+ooggeTo=;
        b=W9oxCOOt1oDpIPy9LST9RGxtrC/RGWR2ZJVfaPZmlSxLfOE/jLjVeTLsIvZQXK8Sez
         4vVQHuY1+UnhSIveVBMhUdp0C/Tv61Q/9qVQKwXzzlTyVKk3JoaGgz9ilGFniQtnyM5W
         UCUlTAFmvUA2E1tJ+HpcTmFVHO8SXjtB93xZnePwdTBrXPaFD/XDekOCUyycc8ZgzUgy
         mIabMF4NZzD+WbmjPfafGYYpYKT6UZtz2lnncTnjfb3M5ja/T68MVkGy1d+xnYaeJ9qB
         4ehSE8lgxhUH5HUoL1AnEGR6BHy5mOBho7g+wo8EfliJktSE2blVPe00q0m5ThzYLQlY
         4DZQ==
X-Forwarded-Encrypted: i=1; AL+hErGjSt9aN4f16yX3I02S35gN9qBq4A1i1dIUT/j1IRHDuKw+T8rTq/QdYHWXab689/WkIx/xeS1gZ1jWbmN0fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/yZBog/UKUyvVcsPTxuzJ0VaPPgrTuN9pV9+szOPpQftqhsw85
	Tz5/BrOW8A66b1H4FThdNoVnwAv/8/owCdiB7RG8sILL/kA3LQzjx2CXy/PIsA==
X-Gm-Gg: AYBFou0760ENA/h7/myYkQkpaIu52g3278fkws7vr3mMYeSFwYfqtqt/s3s6NtWkjdQ
	AsTPwETtruupsugO8kL8mBFcZMfgOlkcLnLIyvdrLEwP+8hSQYh29Ej2fn/AGlqQvCc+p/SNuTz
	TC+GqJWHTse3pFWNK2ZkoVAvajQyRQmG/2hVwyPacv+pKfCRZXMOlFqcFoNLomnWp1/+UTFQ+Nh
	dgkI6flfB4ShpCxcnkhJgJ9yTjoQXVcZk5EZALAUZVWcGiN1C7dXMk7OsQGmwOc51Yr2qCMBXef
	JEFU5b4qj8RwvXdxnL2xP+1KQsmJeLEm6ENtPNOdht1jpyPp9u3uf4aqqYJFrthf1ZNoq8CSqgJ
	W5+h+a1Khos42iKpK+MCS01UhYQWFNFQ2hxSgqUjCYbRMH+ULegToDLSUlC/ZgQvWvCBJhbniF/
	H/q1QfEsAPGN1waqgnTPBEeUNcz7dvu9m433GJSChM93i3pbcxs/bhZrW3OXdOosbBM3L3kin1l
	MdO4Knb2WcXeLsLebJJlVkPsKX1vR+oO4R9KMAaaGhKJNdK8e8OtB4PIho5l/SbnBbE1L0nuAC0
	qBZQ8YxN/ESo8DqgYXelYg8Q9O9o9lL5O6Tg7QjMv5MyHbE=
X-Received: by 2002:a05:701b:42cc:10b0:1a4:3fa7:adef with SMTP id a92af1059eb24-1b3b619eeb8mr2108583c88.47.1794284444835;
        Mon, 09 Nov 2026 20:20:44 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:20:44 -0800 (PST)
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
	Alistair Francis <alistair.francis@wdc.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v6 14/25] lib: rspdm: Support SPDM get_version
Date: Tue, 10 Nov 2026 14:18:21 +1000
Message-ID: <20261110041832.1730924-15-alistair.francis@wdc.com>
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

Support the GET_VERSION SPDM command.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 lib/rspdm/consts.rs    | 17 +++++++-
 lib/rspdm/lib.rs       | 25 +++++++++++-
 lib/rspdm/state.rs     | 50 ++++++++++++++++++++++-
 lib/rspdm/validator.rs | 90 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 176 insertions(+), 6 deletions(-)

diff --git a/lib/rspdm/consts.rs b/lib/rspdm/consts.rs
index 6fe4dbdd67204..2470c7ac5e4d0 100644
--- a/lib/rspdm/consts.rs
+++ b/lib/rspdm/consts.rs
@@ -7,14 +7,27 @@
 //! Rust implementation of the DMTF Security Protocol and Data Model (SPDM)
 //! <https://www.dmtf.org/dsp/DSP0274>
 
+use crate::validator::SpdmHeader;
+use core::mem;
+
 // SPDM versions supported by this implementation
 pub(crate) const SPDM_VER_10: u8 = 0x10;
+#[expect(dead_code)]
+pub(crate) const SPDM_VER_11: u8 = 0x11;
+#[expect(dead_code)]
+pub(crate) const SPDM_VER_12: u8 = 0x12;
+#[expect(dead_code)]
+pub(crate) const SPDM_VER_13: u8 = 0x13;
+pub(crate) const SPDM_VER_14: u8 = 0x14;
 
 pub(crate) const SPDM_MIN_VER: u8 = SPDM_VER_10;
+pub(crate) const SPDM_MAX_VER: u8 = SPDM_VER_14;
 
-#[allow(dead_code)]
 pub(crate) const SPDM_REQ: u8 = 0x80;
-#[allow(dead_code)]
 pub(crate) const SPDM_ERROR: u8 = 0x7f;
 
+pub(crate) const SPDM_GET_VERSION: u8 = 0x84;
+pub(crate) const SPDM_GET_VERSION_LEN: usize =
+    mem::size_of::<SpdmHeader>() + 2 + (u8::MAX as usize) * mem::size_of::<u16>();
+
 pub(crate) const SPDM_MIN_DATA_TRANSFER_SIZE: u32 = 42; // SPDM 1.2.0 margin no 226
diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index 7d87d19c9b782..61f0a1ff4a1ca 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -244,7 +244,30 @@ fn from(code: SpdmErrorCode) -> Self {
 /// `state_ptr` must be a valid pointer returned by a previous call to
 /// `spdm_create()` that has not yet been passed to `spdm_destroy()`.
 #[export]
-pub unsafe extern "C" fn spdm_authenticate(_state_ptr: *mut spdm_state) -> c_int {
+pub unsafe extern "C" fn spdm_authenticate(state_ptr: *mut spdm_state) -> c_int {
+    if state_ptr.is_null() {
+        return -(bindings::EINVAL as c_int);
+    }
+
+    // SAFETY: `state_ptr` was returned from `spdm_create()` which used `into_foreign()`
+    // to create the pointer, and it remains valid until `spdm_destroy()` is called.
+    // We only borrow here (rather than `from_foreign()`) so that ownership stays
+    // with the foreign (C) caller.
+    // The exclusive `&mut SpdmState` lives entirely inside the lock guard, so
+    // concurrent FFI callers serialize on the mutex and can never form
+    // aliased `&mut SpdmState` references.
+    let mutex = unsafe {
+        <Pin<KBox<Mutex<SpdmState<CTransport>>>> as ForeignOwnable>::borrow(
+            state_ptr.cast::<c_void>(),
+        )
+    };
+
+    let mut state = mutex.lock();
+
+    if let Err(e) = state.get_version() {
+        return e.to_errno() as c_int;
+    }
+
     -(EPROTONOSUPPORT as i32)
 }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 4f87441e84a67..e06578d204e74 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -18,10 +18,14 @@
 
 use crate::consts::{
     SPDM_ERROR,
+    SPDM_GET_VERSION_LEN,
+    SPDM_MAX_VER,
     SPDM_MIN_VER,
     SPDM_REQ, //
 };
 use crate::validator::{
+    GetVersionReq,
+    GetVersionRsp,
     SpdmErrorRsp,
     SpdmHeader, //
 };
@@ -99,7 +103,6 @@ pub(crate) fn new(
     ///
     /// The data in `request_buf` is sent to the device and the response
     /// is returned as untrusted data to be validated by the caller.
-    #[allow(dead_code)]
     pub(crate) fn spdm_exchange(
         &self,
         request_buf: &[u8],
@@ -145,4 +148,49 @@ pub(crate) fn spdm_exchange(
 
         Ok(Untrusted::new(response_buf))
     }
+
+    /// Negotiate a supported SPDM version and store the information
+    /// in the `SpdmState`.
+    pub(crate) fn get_version(&mut self) -> Result<(), Error> {
+        let mut request = GetVersionReq::default();
+        request.header.version = SPDM_MIN_VER;
+        self.version = SPDM_MIN_VER;
+
+        // Reset all negotiated session state as we are re-authenticating
+        self.data_transfer_sz = self.transport_sz;
+
+        let mut request_buf = request.to_bytes()?;
+
+        let response_vec: KVec<u8> = KVec::from_elem(0u8, SPDM_GET_VERSION_LEN, GFP_KERNEL)?;
+
+        let response: GetVersionRsp = self
+            .spdm_exchange(request_buf.as_mut_slice(), response_vec)?
+            .validate(&*self)?;
+
+        let mut foundver = false;
+        for &entry in response.version_number_entries.iter() {
+            let alpha_version = (entry & 0xF) as u8;
+            let version = (entry >> 8) as u8;
+
+            if alpha_version != 0 {
+                dev_warn!(
+                    &self.dev,
+                    "Ignoring alpha version {alpha_version} of {version:#x}\n"
+                );
+                continue;
+            }
+
+            if version >= self.version && version <= SPDM_MAX_VER {
+                self.version = version;
+                foundver = true;
+            }
+        }
+
+        if !foundver {
+            dev_err!(&self.dev, "No common supported version\n");
+            return Err(EPROTO);
+        }
+
+        Ok(())
+    }
 }
diff --git a/lib/rspdm/validator.rs b/lib/rspdm/validator.rs
index 2898b4c5ee412..234398734a536 100644
--- a/lib/rspdm/validator.rs
+++ b/lib/rspdm/validator.rs
@@ -7,11 +7,16 @@
 //! Rust implementation of the DMTF Security Protocol and Data Model (SPDM)
 //! <https://www.dmtf.org/dsp/DSP0274>
 
+use crate::consts::{
+    SPDM_GET_VERSION,
+    SPDM_MIN_VER, //
+};
 use crate::{
     SpdmErrorCode,
     SpdmState,
     Transport, //
 };
+use core::mem;
 use kernel::prelude::*;
 use kernel::{
     error::Error,
@@ -31,7 +36,6 @@ pub(crate) struct SpdmHeader {
 }
 
 impl SpdmHeader {
-    #[expect(dead_code)]
     pub(crate) fn new(code: u8) -> Self {
         SpdmHeader {
             version: 0,
@@ -41,7 +45,6 @@ pub(crate) fn new(code: u8) -> Self {
         }
     }
 
-    #[expect(dead_code)]
     pub(crate) fn to_bytes(&self) -> Result<KVec<u8>> {
         let mut out = KVec::new();
 
@@ -90,3 +93,86 @@ fn validate(unvalidated: &[u8], _context: &'c SpdmState<T>) -> Result<Self, Self
         })
     }
 }
+
+pub(crate) struct GetVersionReq {
+    pub(crate) header: SpdmHeader,
+}
+
+impl GetVersionReq {
+    pub(crate) fn to_bytes(&self) -> Result<KVec<u8>> {
+        self.header.to_bytes()
+    }
+}
+
+impl Default for GetVersionReq {
+    fn default() -> Self {
+        GetVersionReq {
+            header: SpdmHeader::new(SPDM_GET_VERSION),
+        }
+    }
+}
+
+#[expect(dead_code)]
+pub(crate) struct GetVersionRsp {
+    pub(crate) header: SpdmHeader,
+
+    pub(crate) version_number_entry_count: u8,
+    pub(crate) version_number_entries: KVec<u16>,
+
+    /// The actual length of the SPDM message. `raw_bytes` might be longer
+    /// as it includes transport specific padding.
+    length: usize,
+
+    /// Entire response, used for the transcript hash.
+    raw_bytes: KVec<u8>,
+}
+
+impl GetVersionRsp {
+    #[expect(dead_code)]
+    pub(crate) fn as_bytes(&self) -> Result<&[u8], Error> {
+        self.raw_bytes.get(..self.length).ok_or(EPROTO)
+    }
+}
+
+impl<'c, T: Transport> Validate<'c, Untrusted<KVec<u8>>, &'c SpdmState<T>> for GetVersionRsp {
+    type Err = Error;
+
+    fn validate(unvalidated: KVec<u8>, context: &'c SpdmState<T>) -> Result<Self, Self::Err> {
+        let header: SpdmHeader =
+            Untrusted::new(unvalidated.get(0..4).ok_or(EPROTO)?).validate(context)?;
+
+        if header.code != SPDM_GET_VERSION - 0x80 {
+            return Err(EPROTO);
+        }
+
+        if header.version != SPDM_MIN_VER {
+            return Err(EPROTO);
+        }
+
+        let version_number_entry_count = *unvalidated.get(5).ok_or(EPROTO)?;
+
+        // Entries follow header (4) + reserved (1) + count (1) = 6 bytes.
+        let mut offset = mem::size_of::<SpdmHeader>() + 2;
+
+        let mut version_number_entries = KVec::new();
+        for _ in 0..version_number_entry_count {
+            let entry = u16::from_le_bytes(
+                unvalidated
+                    .get(offset..offset + mem::size_of::<u16>())
+                    .ok_or(EPROTO)?
+                    .try_into()
+                    .map_err(|_| EPROTO)?,
+            );
+            version_number_entries.push(entry, GFP_KERNEL)?;
+            offset += mem::size_of::<u16>();
+        }
+
+        Ok(GetVersionRsp {
+            header,
+            version_number_entry_count,
+            version_number_entries,
+            length: offset,
+            raw_bytes: unvalidated,
+        })
+    }
+}
-- 
2.56.0

