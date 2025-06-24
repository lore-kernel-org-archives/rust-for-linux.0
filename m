Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6CC202983
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771421; cv=none; b=AKUCHsk9cakW6YC2rCtkZin6S39zuzSWEMbuj/3Unb+FvZBdjNpXRnAGt+7n/5l/RU4PvjZgAvGjdBVoDH0ATFgoktLdg9gNVphp/6qNQFOWWy1Ch14hRlNTmLvPEEBk/T7KBzLN1RqMqJ6mss1u5aMG3gITpz+10iFYRuICsuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771421; c=relaxed/simple;
	bh=h5Vf97QwxyKe+yNcylMxZVkNtzsYZhyma36/1ByXmx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQCI83H9PUevBd8gRf/1Za4CaVcyEAnUbVDLtNZEaHMEymrXMQZT9kX6EwsuSkB4r/fbdbX3urkuak7mtDddgoX0isbxWp3JfRPYR5k6aUE6pPcGZPRIS9u0d44ISofXHw9EkhZgNZyvxj5l6Q1pXEkZ2E4xRwPfspK3cmMfXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJzSrMNA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJzSrMNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8398C4CEE3;
	Tue, 24 Jun 2025 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750771421;
	bh=h5Vf97QwxyKe+yNcylMxZVkNtzsYZhyma36/1ByXmx4=;
	h=From:To:Cc:Subject:Date:From;
	b=vJzSrMNAr9Jc4JZbyJQ6rYcH/6DEeHiMszr2ub56ROFugcPjN40yBcZ2SCll0sYu5
	 0NjHeRrBLD9hTmKJryDOoAN6ZIlGUgVetyn0WYe3G/E0XBFjXz+x3dTwfqAvbTo7JY
	 sAcgl9K+zYys3ftWuOgeDp5/pCx9yMBjgqkPfWiY+WJgjNPYc11oloXllP3s2yfJIB
	 R7WBOWG5segbIgyUoBSTDgPzAHg2cy3fWPu88lnh/sFeTMwQN0d5vvWPtzokdfkQHP
	 RUo2AZCOiids3WBc8AQVFRRKnZUYoV45r8kj4SO77Hh3b8sRZBiTt5m32a3UriPFfU
	 Koz9bpMqMHlUw==
From: Danilo Krummrich <dakr@kernel.org>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 1/2] gpu: nova-core: impl From for u32 for enums used from register!
Date: Tue, 24 Jun 2025 15:23:22 +0200
Message-ID: <20250624132337.2242-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement From for u32 for all enum types used within the register!()
macro.

This avoids a conflict with [1] as reported in [2].

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
Link: https://lore.kernel.org/all/20250624173114.3be38990@canb.auug.org.au/ [2]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/falcon.rs | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 07be1c30668c..1affffb109ec 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -20,6 +20,16 @@
 mod hal;
 pub(crate) mod sec2;
 
+macro_rules! impl_from_enum_to_u32 {
+    ($enum_type:ty) => {
+        impl From<$enum_type> for u32 {
+            fn from(value: $enum_type) -> Self {
+                value as u32
+            }
+        }
+    };
+}
+
 /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
 #[repr(u8)]
@@ -34,6 +44,7 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
+impl_from_enum_to_u32!(FalconCoreRev);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRev {
@@ -68,6 +79,7 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
+impl_from_enum_to_u32!(FalconCoreRevSubversion);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRevSubversion {
@@ -102,6 +114,7 @@ pub(crate) enum FalconSecurityModel {
     /// High-Secure: runs signed code with full privileges. Signature is validated by boot ROM.
     Heavy = 3,
 }
+impl_from_enum_to_u32!(FalconSecurityModel);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconSecurityModel {
@@ -130,6 +143,7 @@ pub(crate) enum FalconModSelAlgo {
     #[default]
     Rsa3k = 1,
 }
+impl_from_enum_to_u32!(FalconModSelAlgo);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconModSelAlgo {
@@ -151,6 +165,7 @@ pub(crate) enum DmaTrfCmdSize {
     #[default]
     Size256B = 0x6,
 }
+impl_from_enum_to_u32!(DmaTrfCmdSize);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for DmaTrfCmdSize {
@@ -173,6 +188,7 @@ pub(crate) enum PeregrineCoreSelect {
     /// RISC-V core is active.
     Riscv = 1,
 }
+impl_from_enum_to_u32!(PeregrineCoreSelect);
 
 impl From<bool> for PeregrineCoreSelect {
     fn from(value: bool) -> Self {
@@ -203,6 +219,7 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory.
     NoncoherentSysmem = 2,
 }
+impl_from_enum_to_u32!(FalconFbifTarget);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconFbifTarget {
@@ -229,6 +246,7 @@ pub(crate) enum FalconFbifMemType {
     /// Physical memory addresses.
     Physical = 1,
 }
+impl_from_enum_to_u32!(FalconFbifMemType);
 
 /// Conversion from a single-bit register field.
 impl From<bool> for FalconFbifMemType {

base-commit: 3606620b316c29e3de8ff87b40828c722086a9c9
-- 
2.49.0

