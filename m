Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795723898;
	b=h9m6XVuFr/c7N66yhWXysywsg7bu9iwgf45ZVVMb7rVusp/jr/8bIGPNZnefDumG79tA
	 ctSkc1tgYnysDBcRd50a0bokhQcq0IURZy+PIW+xQ9kT0PCubqIsQglFWA0ilooNnNxoo
	 FjJyO0kCThrm6RGONqo7kHTNMMjy7wm6qmszPW/Y6Ofb9S3M7hAuNcKJe/FqDH9s1ZXFv
	 MptrntnvRxPZPuHjpBV/dlxveUydIcm1EITIPAO63ESNGuuOHcl8C0FcRuB7Rt9Zu0lIf
	 6AV6U1Dia9um5wJsZQWnPtbPiVlm4y56MMHlDTw0LFRGaK3XSNU1gnQFxBgNhpLV5jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723898;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=M34/GtpbqrU7stmPg/LOgYPbbWH4imamaV+LT3Pbdt0=;
	b=FZnrLiZfyn6b3Qw2w7dJVmfV97EHUARQ/wdn92RGge23Q7ppETndDHY3l+9BD/G5mh6s
	 BuuEBNCi+/6WOIq/6q/T0RjKvYk7MyTFVyQ/rFDTXtu+bDwBip/NORw14jj1eSRJmdkBH
	 xWyhp9Oz7aG8Ft2hkTX8sf+TtiDIeIn8FavjLb9FazyrSCJyWHFjh4CeUsOYhDoQ+NgBW
	 KL63va8ZRsXGQF4zxYkiYqVMpyL1I/peI5CNXayp9CeKJS7cwVpy5KO441Bd5oEfNtojT
	 lHGOqycjODuD204lLFGOzJAeVJxFT2+dnfy4nkXrd50pRi3iDA3s2OxK5y9gxAv/ZYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TNbKfNHG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364E606A686;
	Thu, 26 Nov 2026 20:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2364E606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TNbKfNHG
ARC-Seal: i=1; a=rsa-sha256; t=1795723856; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AxzcyqSujngf7qqVJPtIniK3GvwUWvd0ml1PdqlB1MQQJaM/MFTakIZAsak6xSssDVZgfA2VItBYX+HxBw7MST2Vc+0FmKWOy1nJXVrk6xvh7bZ7hwBqCG7eqtP0KTrtMwdHFPMdV8eOmSqX2QKoL2CAORxuOUAI25SLTBLbJz8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795723856; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M34/GtpbqrU7stmPg/LOgYPbbWH4imamaV+LT3Pbdt0=; 
	b=iuz6IbASQFGlqGdojyuHg0V2Bl9zlOL+nB43FNhiT8oeStlRfYKfc3Y7XMX7zIFSATkh+5AoBY9nRiYIGC0PUJq4aZQQN5GisEbQqQ1GWHKRcUXtOgi/eoXW6If3a4jAX0wmX/QN1Ttr6YA3TYGYS4XugKOLFfbo0PFgon9DOvY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=TNbKfNHG7BNUkZQFcfAjHBDSwqdGnl87ZKCfN8/tyXP4FvU016u/wPov6nwuab3YtjPTAS0dE1C5MUh8IRNG9oqbsNW/Kcgl38fkasmBthydezNZOhSiYRXvOM4kWlcq4kszoixViFTjQFzaEmwWnPsSo5YoXOfDfF2fFdML5Bs=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=M34/GtpbqrU7stmPg/LOgYPbbWH4imamaV+LT3Pbdt0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795723854444629.9098421832166;
	Thu, 26 Nov 2026 12:10:54 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 26 Nov 2026 17:10:43 -0300
Subject: [PATCH 1/4] drm/tyr: use the conversion derives for the
 GPU_CONTROL enums
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
Message-Id: <20261126-tyr-enum-derives-v1-1-a487b0e1bee3@collabora.com>
References: <20261126-tyr-enum-derives-v1-0-a487b0e1bee3@collabora.com>
In-Reply-To: <20261126-tyr-enum-derives-v1-0-a487b0e1bee3@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Kaiqi Guo <chaoji_xinren@163.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

An `as` cast silently drops the bits that do not fit the target type,
and nothing at the cast shows whether that can happen. As part of a
larger effort to reduce the number of `as` casts in Tyr, derive the
conversions between the GPU_CONTROL enums and `Bounded` instead of
writing them by hand. This removes the 8 casts that convert one of
these enums to its integer value.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 199 +++++---------------------------------------
 1 file changed, 21 insertions(+), 178 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 76892a911227..35656a81aae9 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -63,7 +63,11 @@ pub(crate) fn read_u64_no_tearing(lo_read: impl Fn() -> u32, hi_read: impl Fn()
 /// They are involved in GPU configuration and control.
 pub(crate) mod gpu_control {
     use kernel::{
-        num::Bounded,
+        macros::{
+            From,
+            Into,
+            TryFrom, //
+        },
         prelude::*,
         register,
         uapi, //
@@ -235,7 +239,8 @@ pub(crate) mod gpu_control {
     }
 
     /// Helpers for GPU_COMMAND Register
-    #[derive(Copy, Clone, Debug, PartialEq)]
+    #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+    #[convert(Bounded<u32, 8>)]
     #[repr(u8)]
     pub(crate) enum GpuCommand {
         /// No operation. This is the default value.
@@ -248,30 +253,9 @@ pub(crate) enum GpuCommand {
         ClearFault = 7,
     }
 
-    impl TryFrom<Bounded<u32, 8>> for GpuCommand {
-        type Error = Error;
-
-        fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
-            match val.get() {
-                0 => Ok(GpuCommand::Nop),
-                1 => Ok(GpuCommand::Reset),
-                4 => Ok(GpuCommand::FlushCaches),
-                7 => Ok(GpuCommand::ClearFault),
-                _ => Err(EINVAL),
-            }
-        }
-    }
-
-    impl From<GpuCommand> for Bounded<u32, 8> {
-        #[expect(clippy::as_conversions)]
-        fn from(cmd: GpuCommand) -> Self {
-            // CAST: `GpuCommand` is `#[repr(u8)]`, so the cast is lossless.
-            (cmd as u8).into()
-        }
-    }
-
     /// Reset mode for [`GPU_COMMAND::reset()`].
-    #[derive(Copy, Clone, Debug, PartialEq)]
+    #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+    #[convert(Bounded<u32, 4>)]
     #[repr(u8)]
     pub(crate) enum ResetMode {
         /// Stop all external bus interfaces, then reset the entire GPU.
@@ -280,28 +264,9 @@ pub(crate) enum ResetMode {
         HardReset = 2,
     }
 
-    impl TryFrom<Bounded<u32, 4>> for ResetMode {
-        type Error = Error;
-
-        fn try_from(val: Bounded<u32, 4>) -> Result<Self, Self::Error> {
-            match val.get() {
-                1 => Ok(ResetMode::SoftReset),
-                2 => Ok(ResetMode::HardReset),
-                _ => Err(EINVAL),
-            }
-        }
-    }
-
-    impl From<ResetMode> for Bounded<u32, 4> {
-        #[expect(clippy::as_conversions)]
-        fn from(mode: ResetMode) -> Self {
-            // CAST: `ResetMode` is `#[repr(u8)]`, so the cast is lossless.
-            Bounded::try_new(mode as u32).unwrap()
-        }
-    }
-
     /// Cache flush mode for [`GPU_COMMAND::flush_caches()`].
-    #[derive(Copy, Clone, Debug, PartialEq)]
+    #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+    #[convert(Bounded<u32, 4>)]
     #[repr(u8)]
     pub(crate) enum FlushMode {
         /// No flush.
@@ -314,28 +279,6 @@ pub(crate) enum FlushMode {
         CleanInvalidate = 3,
     }
 
-    impl TryFrom<Bounded<u32, 4>> for FlushMode {
-        type Error = Error;
-
-        fn try_from(val: Bounded<u32, 4>) -> Result<Self, Self::Error> {
-            match val.get() {
-                0 => Ok(FlushMode::None),
-                1 => Ok(FlushMode::Clean),
-                2 => Ok(FlushMode::Invalidate),
-                3 => Ok(FlushMode::CleanInvalidate),
-                _ => Err(EINVAL),
-            }
-        }
-    }
-
-    impl From<FlushMode> for Bounded<u32, 4> {
-        #[expect(clippy::as_conversions)]
-        fn from(mode: FlushMode) -> Self {
-            // CAST: `FlushMode` is `#[repr(u8)]`, so the cast is lossless.
-            Bounded::try_new(mode as u32).unwrap()
-        }
-    }
-
     register! {
         base: TyrRegisters;
 
@@ -421,7 +364,8 @@ pub(crate) fn clear_fault() -> Self {
         }
     }
 
-    #[derive(Copy, Clone, Debug, PartialEq)]
+    #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+    #[convert(Bounded<u32, 8>)]
     #[repr(u8)]
     pub(crate) enum ExceptionType {
         /// Exception type: No error.
@@ -436,30 +380,8 @@ pub(crate) enum ExceptionType {
         GpuCacheabilityFault = 0x8A,
     }
 
-    impl TryFrom<Bounded<u32, 8>> for ExceptionType {
-        type Error = Error;
-
-        fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
-            match val.get() {
-                0x00 => Ok(ExceptionType::Ok),
-                0x80 => Ok(ExceptionType::GpuBusFault),
-                0x88 => Ok(ExceptionType::GpuShareabilityFault),
-                0x89 => Ok(ExceptionType::SystemShareabilityFault),
-                0x8A => Ok(ExceptionType::GpuCacheabilityFault),
-                _ => Err(EINVAL),
-            }
-        }
-    }
-
-    impl From<ExceptionType> for Bounded<u32, 8> {
-        #[expect(clippy::as_conversions)]
-        fn from(exc: ExceptionType) -> Self {
-            // CAST: `ExceptionType` is `#[repr(u8)]`, so the cast is lossless.
-            (exc as u8).into()
-        }
-    }
-
-    #[derive(Copy, Clone, Debug, PartialEq)]
+    #[derive(Copy, Clone, Debug, PartialEq, From, Into)]
+    #[convert(Bounded<u32, 2>)]
     #[repr(u8)]
     pub(crate) enum AccessType {
         /// Access type: An atomic (read/write) transaction.
@@ -472,26 +394,6 @@ pub(crate) enum AccessType {
         Write = 3,
     }
 
-    impl From<Bounded<u32, 2>> for AccessType {
-        fn from(val: Bounded<u32, 2>) -> Self {
-            match val.get() {
-                0 => AccessType::Atomic,
-                1 => AccessType::Execute,
-                2 => AccessType::Read,
-                3 => AccessType::Write,
-                _ => unreachable!(),
-            }
-        }
-    }
-
-    impl From<AccessType> for Bounded<u32, 2> {
-        #[expect(clippy::as_conversions)]
-        fn from(access: AccessType) -> Self {
-            // CAST: `AccessType` is `#[repr(u8)]`, so the cast is lossless.
-            Bounded::try_new(access as u32).unwrap()
-        }
-    }
-
     register! {
         base: TyrRegisters;
 
@@ -769,7 +671,8 @@ fn from(access: AccessType) -> Self {
         }
     }
 
-    #[derive(Copy, Clone, Debug, PartialEq)]
+    #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+    #[convert(Bounded<u32, 32>)]
     #[repr(u8)]
     pub(crate) enum CoherencyMode {
         /// ACE-Lite coherency protocol.
@@ -780,27 +683,6 @@ pub(crate) enum CoherencyMode {
         None = cv!(uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE => u8),
     }
 
-    impl TryFrom<Bounded<u32, 32>> for CoherencyMode {
-        type Error = Error;
-
-        fn try_from(val: Bounded<u32, 32>) -> Result<Self, Self::Error> {
-            match val.get() {
-                0 => Ok(CoherencyMode::AceLite),
-                1 => Ok(CoherencyMode::Ace),
-                31 => Ok(CoherencyMode::None),
-                _ => Err(EINVAL),
-            }
-        }
-    }
-
-    impl From<CoherencyMode> for Bounded<u32, 32> {
-        #[expect(clippy::as_conversions)]
-        fn from(mode: CoherencyMode) -> Self {
-            // CAST: `CoherencyMode` is `#[repr(u8)]`, so the cast is lossless.
-            (mode as u8).into()
-        }
-    }
-
     register! {
         base: TyrRegisters;
 
@@ -813,7 +695,8 @@ fn from(mode: CoherencyMode) -> Self {
     }
 
     /// Helpers for MCU_CONTROL register
-    #[derive(Copy, Clone, Debug, PartialEq)]
+    #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+    #[convert(Bounded<u32, 2>)]
     #[repr(u8)]
     pub(crate) enum McuControlMode {
         /// Disable the MCU.
@@ -824,27 +707,6 @@ pub(crate) enum McuControlMode {
         Auto = 2,
     }
 
-    impl TryFrom<Bounded<u32, 2>> for McuControlMode {
-        type Error = Error;
-
-        fn try_from(val: Bounded<u32, 2>) -> Result<Self, Self::Error> {
-            match val.get() {
-                0 => Ok(McuControlMode::Disable),
-                1 => Ok(McuControlMode::Enable),
-                2 => Ok(McuControlMode::Auto),
-                _ => Err(EINVAL),
-            }
-        }
-    }
-
-    impl From<McuControlMode> for Bounded<u32, 2> {
-        #[expect(clippy::as_conversions)]
-        fn from(mode: McuControlMode) -> Self {
-            // CAST: `McuControlMode` is `#[repr(u8)]`, so the cast is lossless.
-            Bounded::try_new(mode as u32).unwrap()
-        }
-    }
-
     register! {
         base: TyrRegisters;
 
@@ -856,7 +718,8 @@ fn from(mode: McuControlMode) -> Self {
     }
 
     /// Helpers for MCU_STATUS register
-    #[derive(Copy, Clone, Debug, PartialEq)]
+    #[derive(Copy, Clone, Debug, PartialEq, From, Into)]
+    #[convert(Bounded<u32, 2>)]
     #[repr(u8)]
     pub(crate) enum McuStatus {
         /// MCU is disabled.
@@ -870,26 +733,6 @@ pub(crate) enum McuStatus {
         Fatal = 3,
     }
 
-    impl From<Bounded<u32, 2>> for McuStatus {
-        fn from(val: Bounded<u32, 2>) -> Self {
-            match val.get() {
-                0 => McuStatus::Disabled,
-                1 => McuStatus::Enabled,
-                2 => McuStatus::Halt,
-                3 => McuStatus::Fatal,
-                _ => unreachable!(),
-            }
-        }
-    }
-
-    impl From<McuStatus> for Bounded<u32, 2> {
-        #[expect(clippy::as_conversions)]
-        fn from(status: McuStatus) -> Self {
-            // CAST: `McuStatus` is `#[repr(u8)]`, so the cast is lossless.
-            Bounded::try_new(status as u32).unwrap()
-        }
-    }
-
     register! {
         base: TyrRegisters;
 

-- 
2.56.0

