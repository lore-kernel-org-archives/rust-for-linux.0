Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795723898;
	b=oCSUo5Cuh+RCpkbnDDptfRDP2CVK3DZX8vAwVrzIBc7/wSN5pX2WRM5M47DWOMmJjvUM
	 +svLHx9WPeSjl4P4R9ZvfMiDNytU0quVjFs4vou2dX28HkP4t57tLYuGE/tmhJ6ADJwaj
	 C1FtFaq1JyOtrgOEemxEmxV1pu/os4ewr6ORdoV8tXk3h5LJQH6AC1g2Ah5kvMf26IlrA
	 RWkGtlqQwTshXw6aZq50PjwA7wtjFMgO6oxKxV2+t33+LY+2udp/ZZyksK4i/3X1bEaps
	 Wv0UnO1eiFSxutylwHhL9sI7HHtfW4bszhXXPASnINVS+ZtKJGm1QwQMi9+0NoPrl2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723898;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=zlbrOdjGh6rJLQhVTTpFlPSftbC/tt4b0Sob2yOxqXM=;
	b=3u6NFVWQQp18L0mcVOM6QwNgdSPbz8oC0gYqQTJYOoBT1Y4wZWCdxHzBErKN99NISSXU
	 2Cl8Wll75mBIDq2pAJRsm5cOZ+wPzKLa7e3T/PYBKaDlINUfNc7ZiXAOMiZgTx4vKHY1l
	 zf9vAJ4KPbugrmcdmANTTsmjPqITGOIvWJfsIYSf2M35j7gYnr5+DkZZUi/NZsEA4A+Ms
	 B16F/NoB76qvEnTCz6EJX+DUy27/1QM5pkY1IxQXZfdGQsHFnKPk/qvm4G0pKtns8u+xJ
	 itGaD95y6wzxfcVQF8wFaRenw4KVoMPuwzkripSYc9GV3QVB5JFKV/VDA4w8l3/ruPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Rw1+7xdZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D887606A687;
	Thu, 26 Nov 2026 20:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D887606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Rw1+7xdZ
ARC-Seal: i=1; a=rsa-sha256; t=1795723860; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cGHOiUwMzlb0h3QbpSCprswaknZDb2RqnsoSVUt+QQ/F/2jnFtlk94QcJmPZu5zbyjKdJaRuOEcXU4FJGbEWpVotlzDcoE66tzw3BTw4HWLpLMqWoim78/6Dd0DWiMNaxSGGc6MckVXHtTgjh7oL6sPmIhkklgk9EFtnmVvMIi8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795723860; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zlbrOdjGh6rJLQhVTTpFlPSftbC/tt4b0Sob2yOxqXM=; 
	b=gVgP0qvU22f0uXgobZeARS1dvKUD4sK9n/sOl1do3BuMrGjht4/E+P9J8wZUT//DJ/tTIDMN0V9P7sSBJtc1iE6DgnMZIZxK0WDUHvYiw5NDh8t71NZwr1IOmdBI4/MIpQpdGTeHG77D3XCZ+pt6uyDlxp1wXRjH/IA0LUVNNt4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Rw1+7xdZXLIxZ1hahhTUH9X+mnScEMHFjweu9SrNTQzPhURZXM4cVB3RhcUI/mEVLip2W6I7Ugoi2EZneMjVBIodYyVB3jPDPBlSIEz9wDqCdkqIcXhnE46JfZ2yVnqF3SKDDFUJjkIk+JXmPeC24OG/qBi63Z7LxHnMwbQ7Jys=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=zlbrOdjGh6rJLQhVTTpFlPSftbC/tt4b0Sob2yOxqXM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795723857715252.86387782786414;
	Thu, 26 Nov 2026 12:10:57 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 26 Nov 2026 17:10:44 -0300
Subject: [PATCH 2/4] drm/tyr: use the conversion derives for the
 MMU_AS_CONTROL enums
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
Message-Id: <20261126-tyr-enum-derives-v1-2-a487b0e1bee3@collabora.com>
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
conversions between the MMU_AS_CONTROL enums and `Bounded` instead of
writing them by hand. This removes the 10 casts that convert one of
these enums to its integer value.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/regs.rs | 287 ++++----------------------------------------
 1 file changed, 25 insertions(+), 262 deletions(-)

diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index 35656a81aae9..799384c8fde4 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -858,6 +858,11 @@ pub(crate) mod mmu_control {
     pub(crate) mod mmu_as_control {
         use kernel::{
             bitfield,
+            macros::{
+                From,
+                Into,
+                TryFrom, //
+            },
             num::Bounded,
             prelude::*,
             register, //
@@ -899,7 +904,8 @@ pub(crate) mod mmu_as_control {
 
         /// Helpers for MEMATTR Register.
 
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+        #[convert(Bounded<u8, 2>)]
         #[repr(u8)]
         pub(crate) enum AllocPolicySelect {
             /// Ignore ALLOC_R/ALLOC_W fields.
@@ -908,33 +914,14 @@ pub(crate) enum AllocPolicySelect {
             Alloc = 3,
         }
 
-        impl TryFrom<Bounded<u8, 2>> for AllocPolicySelect {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u8, 2>) -> Result<Self, Self::Error> {
-                match val.get() {
-                    2 => Ok(Self::Impl),
-                    3 => Ok(Self::Alloc),
-                    _ => Err(EINVAL),
-                }
-            }
-        }
-
-        impl From<AllocPolicySelect> for Bounded<u8, 2> {
-            #[expect(clippy::as_conversions)]
-            fn from(val: AllocPolicySelect) -> Self {
-                // CAST: `AllocPolicySelect` is `#[repr(u8)]`, so the cast is lossless.
-                Bounded::try_new(val as u8).unwrap()
-            }
-        }
-
         /// Coherency policy for memory attributes. Indicates the shareability of cached accesses.
         ///
         /// The hardware spec defines different interpretations of these values depending on
         /// whether TRANSCFG.MODE is set to IDENTITY or not. IDENTITY mode does not use translation
         /// tables (all input addresses map to the same output address); it is deprecated and not
         /// used by the driver. This enum assumes that TRANSCFG.MODE is not set to IDENTITY.
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+        #[convert(Bounded<u8, 2>)]
         #[repr(u8)]
         pub(crate) enum Coherency {
             /// Midgard inner domain coherency.
@@ -954,28 +941,8 @@ pub(crate) enum Coherency {
             CpuInnerDomainShaderCoh = 2,
         }
 
-        impl TryFrom<Bounded<u8, 2>> for Coherency {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u8, 2>) -> Result<Self, Self::Error> {
-                match val.get() {
-                    0 => Ok(Self::MidgardInnerDomain),
-                    1 => Ok(Self::CpuInnerDomain),
-                    2 => Ok(Self::CpuInnerDomainShaderCoh),
-                    _ => Err(EINVAL),
-                }
-            }
-        }
-
-        impl From<Coherency> for Bounded<u8, 2> {
-            #[expect(clippy::as_conversions)]
-            fn from(val: Coherency) -> Self {
-                // CAST: `Coherency` is `#[repr(u8)]`, so the cast is lossless.
-                Bounded::try_new(val as u8).unwrap()
-            }
-        }
-
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, From, Into)]
+        #[convert(Bounded<u8, 2>)]
         #[repr(u8)]
         pub(crate) enum MemoryType {
             /// Normal memory (shared).
@@ -988,26 +955,6 @@ pub(crate) enum MemoryType {
             Fault = 3,
         }
 
-        impl From<Bounded<u8, 2>> for MemoryType {
-            fn from(val: Bounded<u8, 2>) -> Self {
-                match val.get() {
-                    0 => Self::Shared,
-                    1 => Self::NonCacheable,
-                    2 => Self::WriteBack,
-                    3 => Self::Fault,
-                    _ => unreachable!(),
-                }
-            }
-        }
-
-        impl From<MemoryType> for Bounded<u8, 2> {
-            #[expect(clippy::as_conversions)]
-            fn from(val: MemoryType) -> Self {
-                // CAST: `MemoryType` is `#[repr(u8)]`, so the cast is lossless.
-                Bounded::try_new(val as u8).unwrap()
-            }
-        }
-
         bitfield! {
             /// Stage 1 memory attributes (8-bit bitfield).
             ///
@@ -1222,7 +1169,8 @@ pub(crate) fn from_mair(mair: u64) -> Self {
         }
 
         /// Helpers for MMU COMMAND register.
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+        #[convert(Bounded<u32, 8>)]
         #[repr(u8)]
         pub(crate) enum MmuCommand {
             /// No operation, nothing happens.
@@ -1239,30 +1187,6 @@ pub(crate) enum MmuCommand {
             FlushMem = 5,
         }
 
-        impl TryFrom<Bounded<u32, 8>> for MmuCommand {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
-                match val.get() {
-                    0 => Ok(MmuCommand::Nop),
-                    1 => Ok(MmuCommand::Update),
-                    2 => Ok(MmuCommand::Lock),
-                    3 => Ok(MmuCommand::Unlock),
-                    4 => Ok(MmuCommand::FlushPt),
-                    5 => Ok(MmuCommand::FlushMem),
-                    _ => Err(EINVAL),
-                }
-            }
-        }
-
-        impl From<MmuCommand> for Bounded<u32, 8> {
-            #[expect(clippy::as_conversions)]
-            fn from(cmd: MmuCommand) -> Self {
-                // CAST: `MmuCommand` is `#[repr(u8)]`, so the cast is lossless.
-                (cmd as u8).into()
-            }
-        }
-
         register! {
             base: TyrRegisters;
 
@@ -1273,7 +1197,8 @@ fn from(cmd: MmuCommand) -> Self {
         }
 
         /// MMU exception types for FAULTSTATUS register.
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+        #[convert(Bounded<u32, 8>)]
         #[repr(u8)]
         pub(crate) enum MmuExceptionType {
             /// No error.
@@ -1322,48 +1247,9 @@ pub(crate) enum MmuExceptionType {
             MemoryAttributeFault3 = 0xEB,
         }
 
-        impl TryFrom<Bounded<u32, 8>> for MmuExceptionType {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
-                match val.get() {
-                    0x00 => Ok(MmuExceptionType::Ok),
-                    0xC0 => Ok(MmuExceptionType::TranslationFault0),
-                    0xC1 => Ok(MmuExceptionType::TranslationFault1),
-                    0xC2 => Ok(MmuExceptionType::TranslationFault2),
-                    0xC3 => Ok(MmuExceptionType::TranslationFault3),
-                    0xC4 => Ok(MmuExceptionType::TranslationFault4),
-                    0xC8 => Ok(MmuExceptionType::PermissionFault0),
-                    0xC9 => Ok(MmuExceptionType::PermissionFault1),
-                    0xCA => Ok(MmuExceptionType::PermissionFault2),
-                    0xCB => Ok(MmuExceptionType::PermissionFault3),
-                    0xD9 => Ok(MmuExceptionType::AccessFlag1),
-                    0xDA => Ok(MmuExceptionType::AccessFlag2),
-                    0xDB => Ok(MmuExceptionType::AccessFlag3),
-                    0xE0 => Ok(MmuExceptionType::AddressSizeFaultIn),
-                    0xE4 => Ok(MmuExceptionType::AddressSizeFaultOut0),
-                    0xE5 => Ok(MmuExceptionType::AddressSizeFaultOut1),
-                    0xE6 => Ok(MmuExceptionType::AddressSizeFaultOut2),
-                    0xE7 => Ok(MmuExceptionType::AddressSizeFaultOut3),
-                    0xE8 => Ok(MmuExceptionType::MemoryAttributeFault0),
-                    0xE9 => Ok(MmuExceptionType::MemoryAttributeFault1),
-                    0xEA => Ok(MmuExceptionType::MemoryAttributeFault2),
-                    0xEB => Ok(MmuExceptionType::MemoryAttributeFault3),
-                    _ => Err(EINVAL),
-                }
-            }
-        }
-
-        impl From<MmuExceptionType> for Bounded<u32, 8> {
-            #[expect(clippy::as_conversions)]
-            fn from(exc: MmuExceptionType) -> Self {
-                // CAST: `MmuExceptionType` is `#[repr(u8)]`, so the cast is lossless.
-                (exc as u8).into()
-            }
-        }
-
         /// Access type for MMU faults.
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, From, Into)]
+        #[convert(Bounded<u32, 2>)]
         #[repr(u8)]
         pub(crate) enum MmuAccessType {
             /// An atomic (read/write) transaction.
@@ -1376,26 +1262,6 @@ pub(crate) enum MmuAccessType {
             Write = 3,
         }
 
-        impl From<Bounded<u32, 2>> for MmuAccessType {
-            fn from(val: Bounded<u32, 2>) -> Self {
-                match val.get() {
-                    0 => MmuAccessType::Atomic,
-                    1 => MmuAccessType::Execute,
-                    2 => MmuAccessType::Read,
-                    3 => MmuAccessType::Write,
-                    _ => unreachable!(),
-                }
-            }
-        }
-
-        impl From<MmuAccessType> for Bounded<u32, 2> {
-            #[expect(clippy::as_conversions)]
-            fn from(access: MmuAccessType) -> Self {
-                // CAST: `MmuAccessType` is `#[repr(u8)]`, so the cast is lossless.
-                Bounded::try_new(access as u32).unwrap()
-            }
-        }
-
         register! {
             base: TyrRegisters;
 
@@ -1430,7 +1296,8 @@ fn from(access: MmuAccessType) -> Self {
         /// Helpers for TRANSCFG register.
         ///
         /// Address space mode for TRANSCFG register.
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+        #[convert(Bounded<u64, 4>)]
         #[repr(u8)]
         pub(crate) enum AddressSpaceMode {
             /// The MMU forces all memory access to fail with a decode fault.
@@ -1443,30 +1310,9 @@ pub(crate) enum AddressSpaceMode {
             Aarch64_64K = 8,
         }
 
-        impl TryFrom<Bounded<u64, 4>> for AddressSpaceMode {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u64, 4>) -> Result<Self, Self::Error> {
-                match val.get() {
-                    1 => Ok(AddressSpaceMode::Unmapped),
-                    2 => Ok(AddressSpaceMode::Identity),
-                    6 => Ok(AddressSpaceMode::Aarch64_4K),
-                    8 => Ok(AddressSpaceMode::Aarch64_64K),
-                    _ => Err(EINVAL),
-                }
-            }
-        }
-
-        impl From<AddressSpaceMode> for Bounded<u64, 4> {
-            #[expect(clippy::as_conversions)]
-            fn from(mode: AddressSpaceMode) -> Self {
-                // CAST: `AddressSpaceMode` is `#[repr(u8)]`, so the cast is lossless.
-                Bounded::try_new(mode as u64).unwrap()
-            }
-        }
-
         /// Input address range restriction for TRANSCFG register.
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+        #[convert(Bounded<u64, 5>)]
         #[repr(u8)]
         pub(crate) enum InaBits {
             /// Invalid VA range (reset value).
@@ -1521,51 +1367,9 @@ pub(crate) enum InaBits {
             Bits25 = 30,
         }
 
-        impl TryFrom<Bounded<u64, 5>> for InaBits {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u64, 5>) -> Result<Self, Self::Error> {
-                match val.get() {
-                    0 => Ok(InaBits::Reset),
-                    7 => Ok(InaBits::Bits48),
-                    8 => Ok(InaBits::Bits47),
-                    9 => Ok(InaBits::Bits46),
-                    10 => Ok(InaBits::Bits45),
-                    11 => Ok(InaBits::Bits44),
-                    12 => Ok(InaBits::Bits43),
-                    13 => Ok(InaBits::Bits42),
-                    14 => Ok(InaBits::Bits41),
-                    15 => Ok(InaBits::Bits40),
-                    16 => Ok(InaBits::Bits39),
-                    17 => Ok(InaBits::Bits38),
-                    18 => Ok(InaBits::Bits37),
-                    19 => Ok(InaBits::Bits36),
-                    20 => Ok(InaBits::Bits35),
-                    21 => Ok(InaBits::Bits34),
-                    22 => Ok(InaBits::Bits33),
-                    23 => Ok(InaBits::Bits32),
-                    24 => Ok(InaBits::Bits31),
-                    25 => Ok(InaBits::Bits30),
-                    26 => Ok(InaBits::Bits29),
-                    27 => Ok(InaBits::Bits28),
-                    28 => Ok(InaBits::Bits27),
-                    29 => Ok(InaBits::Bits26),
-                    30 => Ok(InaBits::Bits25),
-                    _ => Err(EINVAL),
-                }
-            }
-        }
-
-        impl From<InaBits> for Bounded<u64, 5> {
-            #[expect(clippy::as_conversions)]
-            fn from(bits: InaBits) -> Self {
-                // CAST: `InaBits` is `#[repr(u8)]`, so the cast is lossless.
-                Bounded::try_new(bits as u64).unwrap()
-            }
-        }
-
         /// Translation table memory attributes for TRANSCFG register.
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+        #[convert(Bounded<u64, 2>)]
         #[repr(u8)]
         pub(crate) enum PtwMemattr {
             /// Invalid (reset value, not valid for enabled address space).
@@ -1576,29 +1380,9 @@ pub(crate) enum PtwMemattr {
             WriteBack = 2,
         }
 
-        impl TryFrom<Bounded<u64, 2>> for PtwMemattr {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u64, 2>) -> Result<Self, Self::Error> {
-                match val.get() {
-                    0 => Ok(PtwMemattr::Invalid),
-                    1 => Ok(PtwMemattr::NonCacheable),
-                    2 => Ok(PtwMemattr::WriteBack),
-                    _ => Err(EINVAL),
-                }
-            }
-        }
-
-        impl From<PtwMemattr> for Bounded<u64, 2> {
-            #[expect(clippy::as_conversions)]
-            fn from(attr: PtwMemattr) -> Self {
-                // CAST: `PtwMemattr` is `#[repr(u8)]`, so the cast is lossless.
-                Bounded::try_new(attr as u64).unwrap()
-            }
-        }
-
         /// Translation table memory shareability for TRANSCFG register.
-        #[derive(Copy, Clone, Debug, PartialEq)]
+        #[derive(Copy, Clone, Debug, PartialEq, TryFrom, Into)]
+        #[convert(Bounded<u64, 2>)]
         #[repr(u8)]
         #[allow(clippy::enum_variant_names)]
         pub(crate) enum PtwShareability {
@@ -1610,27 +1394,6 @@ pub(crate) enum PtwShareability {
             InnerShareable = 3,
         }
 
-        impl TryFrom<Bounded<u64, 2>> for PtwShareability {
-            type Error = Error;
-
-            fn try_from(val: Bounded<u64, 2>) -> Result<Self, Self::Error> {
-                match val.get() {
-                    0 => Ok(PtwShareability::NonShareable),
-                    2 => Ok(PtwShareability::OuterShareable),
-                    3 => Ok(PtwShareability::InnerShareable),
-                    _ => Err(EINVAL),
-                }
-            }
-        }
-
-        impl From<PtwShareability> for Bounded<u64, 2> {
-            #[expect(clippy::as_conversions)]
-            fn from(sh: PtwShareability) -> Self {
-                // CAST: `PtwShareability` is `#[repr(u8)]`, so the cast is lossless.
-                Bounded::try_new(sh as u64).unwrap()
-            }
-        }
-
         register! {
             base: TyrRegisters;
 

-- 
2.56.0

