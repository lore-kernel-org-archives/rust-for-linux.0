Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646919;
	b=X/MSA+zTZDGGOk1RsJ9b/pNFP1ORtQ3tl1VOr79YuCiUDoou4tTh7dgZ+a2jWZ/YrT0F
	 Rnb7Q9YVUUIOUUwW8Rpr6ePxsyE2DHuN3S/AK/wJU1tj0Gw/A38CjKe+QXkguJHltfUfd
	 muq+G5n4DFf3fHww9ijQroaAoMkdnfc5IU1GX7ZjQL//n1qmsYyvJ89Wc9P3pklSS3QD7
	 qBAm636TKqCWPVVCZDxi2ZDEILOf+SGW0Rp1VCkLPFAbXI41k0EomXPziaHFH/7qKtygq
	 QOh3HsDem6O9maN7ENnplo1MFgcWfFpNrZJDprlXYczv5+Zvm//2MsrkvZCSfxIeAkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646919;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=OcoNfhRzueM4nmkVOl/eWUDadIuxLOkb0KKg/ezBuXI=;
	b=lWt7fyWGpZs9t7lu4EhaC4TakO/fU2H311vMTos4p4w6p60Gbvyq2c4WFObIEniFJwF6
	 akpM3JZiUk+JzEjsig3sfc45FDj/ksbRZd1oM3aa73SEMqbFZL13K4UfxisVV81AAQbSK
	 23JWQRzPyZsNJ5SKuVafkM0NZGuxmf+4MkxA5LZrgj+81HmszTr4Co8Q71MO0+RVg1J/U
	 FQt9egi6iKjxeFG5Vh0SvcP4ezLJPPNa7LHgr9N3U84BuUkYkD888gOxxAqrixjHFY+0c
	 Cw7uy9Khh8wyhPIIwsiHdyp1W+m1MtyznRxOyLf2Ib7HkO7neCpo5F/UHSQvyzDn50A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=CnGDaOZ9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17FA606A6A1;
	Wed, 25 Nov 2026 22:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C17FA606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=CnGDaOZ9
ARC-Seal: i=1; a=rsa-sha256; t=1795646874; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T1977zerzDbblLEHB4lmzINsgZqTNhXd9pMx0tT03WNNIG8gHYTUDNw01WzGruglpscBYVuOvCzVgw8LW8sOcyJxzqcdLOCiHMnNdK6gg46IpivZhHGseQ/xCsipNUu2o6gUIsLQZoNrGbL77YSneUehVpuKfjhriOT1a8UCVD4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646874; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OcoNfhRzueM4nmkVOl/eWUDadIuxLOkb0KKg/ezBuXI=; 
	b=GJEw8elqYtGBNmuL6467K5u2S3gutYtca6xXGMXGX/kegX66mG0XQmclz+E9LlL5dKlGzPTAGoy83pMfBOigtGVDzqgZsdWkRK65HpynT0UU6DT+p6SfhnIy/RNYs2Yt2c2Kfg+bZ9SFSYw/rz9+FWSWlLiwZRfpL/VYSwUl1ME=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=CnGDaOZ9OyvERxzenT1Sk8r0lUExIS7ZKfAH1mcXZv6wL6uSxpxvOmS+7xERTPPPGF+GPzLdxCOuGWRE84HTqtSnfTaOYJ7aGf8JABsLZmgKEt1A2X1z1yrE3fUNngOj1lFM1A+lQmm5eettDpWuo34Dhxej/dn7cn/X1CbI6rY=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=OcoNfhRzueM4nmkVOl/eWUDadIuxLOkb0KKg/ezBuXI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646871124918.3804823342383;
	Wed, 25 Nov 2026 14:47:51 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:47:00 -0300
Subject: [PATCH 09/13] drm/tyr: justify the casts of enums to their integer
 value
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-tyr-as-casts-v1-9-2b2f53164d86@collabora.com>
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

An `as` cast silently drops the bits that do not fit the target type,
and nothing at the cast shows whether that can happen. As part of a
larger effort to reduce the number of `as` casts in Tyr, justify the
casts that convert an enum to its integer value. These stay, since
`as` is how Rust reads the value of an enum.

Each of them gets a `// CAST:` comment and an
`#[expect(clippy::as_conversions)]`, so that the lint can be enabled
for the driver.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/fw.rs   |  2 ++
 drivers/gpu/drm/tyr/regs.rs | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
index 14cfe2884d5a..2fa9852e0b83 100644
--- a/drivers/gpu/drm/tyr/fw.rs
+++ b/drivers/gpu/drm/tyr/fw.rs
@@ -98,7 +98,9 @@ fn from(value: Bounded<u32, 2>) -> Self {
 }
 
 impl From<CacheMode> for Bounded<u32, 2> {
+    #[expect(clippy::as_conversions)]
     fn from(value: CacheMode) -> Self {
+        // CAST: `CacheMode` is `#[repr(u8)]`, so the cast is lossless.
         Bounded::try_new(value as u32).unwrap()
     }
 }
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 49e4adf2231d..443e9a1e7a21 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -251,7 +251,9 @@ fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
     }
 
     impl From<GpuCommand> for Bounded<u32, 8> {
+        #[expect(clippy::as_conversions)]
         fn from(cmd: GpuCommand) -> Self {
+            // CAST: `GpuCommand` is `#[repr(u8)]`, so the cast is lossless.
             (cmd as u8).into()
         }
     }
@@ -279,7 +281,9 @@ fn try_from(val: Bounded<u32, 4>) -> Result<Self, Self::Error> {
     }
 
     impl From<ResetMode> for Bounded<u32, 4> {
+        #[expect(clippy::as_conversions)]
         fn from(mode: ResetMode) -> Self {
+            // CAST: `ResetMode` is `#[repr(u8)]`, so the cast is lossless.
             Bounded::try_new(mode as u32).unwrap()
         }
     }
@@ -313,7 +317,9 @@ fn try_from(val: Bounded<u32, 4>) -> Result<Self, Self::Error> {
     }
 
     impl From<FlushMode> for Bounded<u32, 4> {
+        #[expect(clippy::as_conversions)]
         fn from(mode: FlushMode) -> Self {
+            // CAST: `FlushMode` is `#[repr(u8)]`, so the cast is lossless.
             Bounded::try_new(mode as u32).unwrap()
         }
     }
@@ -434,7 +440,9 @@ fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
     }
 
     impl From<ExceptionType> for Bounded<u32, 8> {
+        #[expect(clippy::as_conversions)]
         fn from(exc: ExceptionType) -> Self {
+            // CAST: `ExceptionType` is `#[repr(u8)]`, so the cast is lossless.
             (exc as u8).into()
         }
     }
@@ -465,7 +473,9 @@ fn from(val: Bounded<u32, 2>) -> Self {
     }
 
     impl From<AccessType> for Bounded<u32, 2> {
+        #[expect(clippy::as_conversions)]
         fn from(access: AccessType) -> Self {
+            // CAST: `AccessType` is `#[repr(u8)]`, so the cast is lossless.
             Bounded::try_new(access as u32).unwrap()
         }
     }
@@ -772,7 +782,9 @@ fn try_from(val: Bounded<u32, 32>) -> Result<Self, Self::Error> {
     }
 
     impl From<CoherencyMode> for Bounded<u32, 32> {
+        #[expect(clippy::as_conversions)]
         fn from(mode: CoherencyMode) -> Self {
+            // CAST: `CoherencyMode` is `#[repr(u8)]`, so the cast is lossless.
             (mode as u8).into()
         }
     }
@@ -814,7 +826,9 @@ fn try_from(val: Bounded<u32, 2>) -> Result<Self, Self::Error> {
     }
 
     impl From<McuControlMode> for Bounded<u32, 2> {
+        #[expect(clippy::as_conversions)]
         fn from(mode: McuControlMode) -> Self {
+            // CAST: `McuControlMode` is `#[repr(u8)]`, so the cast is lossless.
             Bounded::try_new(mode as u32).unwrap()
         }
     }
@@ -857,7 +871,9 @@ fn from(val: Bounded<u32, 2>) -> Self {
     }
 
     impl From<McuStatus> for Bounded<u32, 2> {
+        #[expect(clippy::as_conversions)]
         fn from(status: McuStatus) -> Self {
+            // CAST: `McuStatus` is `#[repr(u8)]`, so the cast is lossless.
             Bounded::try_new(status as u32).unwrap()
         }
     }
@@ -1050,7 +1066,9 @@ fn try_from(val: Bounded<u8, 2>) -> Result<Self, Self::Error> {
         }
 
         impl From<AllocPolicySelect> for Bounded<u8, 2> {
+            #[expect(clippy::as_conversions)]
             fn from(val: AllocPolicySelect) -> Self {
+                // CAST: `AllocPolicySelect` is `#[repr(u8)]`, so the cast is lossless.
                 Bounded::try_new(val as u8).unwrap()
             }
         }
@@ -1095,7 +1113,9 @@ fn try_from(val: Bounded<u8, 2>) -> Result<Self, Self::Error> {
         }
 
         impl From<Coherency> for Bounded<u8, 2> {
+            #[expect(clippy::as_conversions)]
             fn from(val: Coherency) -> Self {
+                // CAST: `Coherency` is `#[repr(u8)]`, so the cast is lossless.
                 Bounded::try_new(val as u8).unwrap()
             }
         }
@@ -1126,7 +1146,9 @@ fn from(val: Bounded<u8, 2>) -> Self {
         }
 
         impl From<MemoryType> for Bounded<u8, 2> {
+            #[expect(clippy::as_conversions)]
             fn from(val: MemoryType) -> Self {
+                // CAST: `MemoryType` is `#[repr(u8)]`, so the cast is lossless.
                 Bounded::try_new(val as u8).unwrap()
             }
         }
@@ -1379,7 +1401,9 @@ fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
         }
 
         impl From<MmuCommand> for Bounded<u32, 8> {
+            #[expect(clippy::as_conversions)]
             fn from(cmd: MmuCommand) -> Self {
+                // CAST: `MmuCommand` is `#[repr(u8)]`, so the cast is lossless.
                 (cmd as u8).into()
             }
         }
@@ -1476,7 +1500,9 @@ fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
         }
 
         impl From<MmuExceptionType> for Bounded<u32, 8> {
+            #[expect(clippy::as_conversions)]
             fn from(exc: MmuExceptionType) -> Self {
+                // CAST: `MmuExceptionType` is `#[repr(u8)]`, so the cast is lossless.
                 (exc as u8).into()
             }
         }
@@ -1508,7 +1534,9 @@ fn from(val: Bounded<u32, 2>) -> Self {
         }
 
         impl From<MmuAccessType> for Bounded<u32, 2> {
+            #[expect(clippy::as_conversions)]
             fn from(access: MmuAccessType) -> Self {
+                // CAST: `MmuAccessType` is `#[repr(u8)]`, so the cast is lossless.
                 Bounded::try_new(access as u32).unwrap()
             }
         }
@@ -1575,7 +1603,9 @@ fn try_from(val: Bounded<u64, 4>) -> Result<Self, Self::Error> {
         }
 
         impl From<AddressSpaceMode> for Bounded<u64, 4> {
+            #[expect(clippy::as_conversions)]
             fn from(mode: AddressSpaceMode) -> Self {
+                // CAST: `AddressSpaceMode` is `#[repr(u8)]`, so the cast is lossless.
                 Bounded::try_new(mode as u64).unwrap()
             }
         }
@@ -1672,7 +1702,9 @@ fn try_from(val: Bounded<u64, 5>) -> Result<Self, Self::Error> {
         }
 
         impl From<InaBits> for Bounded<u64, 5> {
+            #[expect(clippy::as_conversions)]
             fn from(bits: InaBits) -> Self {
+                // CAST: `InaBits` is `#[repr(u8)]`, so the cast is lossless.
                 Bounded::try_new(bits as u64).unwrap()
             }
         }
@@ -1703,7 +1735,9 @@ fn try_from(val: Bounded<u64, 2>) -> Result<Self, Self::Error> {
         }
 
         impl From<PtwMemattr> for Bounded<u64, 2> {
+            #[expect(clippy::as_conversions)]
             fn from(attr: PtwMemattr) -> Self {
+                // CAST: `PtwMemattr` is `#[repr(u8)]`, so the cast is lossless.
                 Bounded::try_new(attr as u64).unwrap()
             }
         }
@@ -1735,7 +1769,9 @@ fn try_from(val: Bounded<u64, 2>) -> Result<Self, Self::Error> {
         }
 
         impl From<PtwShareability> for Bounded<u64, 2> {
+            #[expect(clippy::as_conversions)]
             fn from(sh: PtwShareability) -> Self {
+                // CAST: `PtwShareability` is `#[repr(u8)]`, so the cast is lossless.
                 Bounded::try_new(sh as u64).unwrap()
             }
         }

-- 
2.56.0

