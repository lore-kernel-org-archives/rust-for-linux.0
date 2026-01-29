Received: from outbound.ms.icloud.com (p-west3-cluster5-host11-snip4-3.eps.apple.com [57.103.72.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD455385531
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 12:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769689598; cv=none; b=a0ItnzNefdssexY+AWcQhdgRcXTd7QMLCpRB4hfznLV2fsHb0Cqgxs/Lfc0La9i6dKhTC2h/Z+PNh+DMMP8zCtKtVtJn6o6lcLOUAnNhPWx87M/N4euHnn+XaQnCGuLFKkHWm/OUzLlxwsOJO8HNSUS9Pw4DrxcbPfBNY+dE0g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769689598; c=relaxed/simple;
	bh=LJuZ5OC3AV1TywFLwOXSUPCyDHzt6aq4FaRt5tVaycQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cE/nthlkyWwGk+YO/v7I0qEGcFZavruw6r9aRvP0avQoTmCWomRHgwYFP7toy39ZNqIrfcm5QG1UCsjXtTJy3+Duu4ns0xgSLHuKqRf5/+W0VbE8YVeeRSctYsMQKbMrBF9i1rfHTYVG9wgzqdZxRFdXM86aFE+6YHZqRF0kxTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=Sr6PWOBv; arc=none smtp.client-ip=57.103.72.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="Sr6PWOBv"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPS id 0050D180041E;
	Thu, 29 Jan 2026 12:26:34 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769689596; x=1772281596; bh=WFc7bQDflTEteFCBkcEqooIeZoxpdYTogh2ubqHuvqw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Sr6PWOBvgKh3TEZYMOtEBTgZFltgXBaC0j2cuzZA1P5obEvAQvoT9igQgjIi+ozgmErCVkOEpNsc4MRtIZM5T+Ggil2QARYgFexdR971hLWuVhm1kCQZzZNt8PGtYuN7QjFIVgxS6HpY5piZn/OPhmRpPdWAYYPPLneruMSErew/VSYaSzoB4V6U30xC1yADgILfGfP8oCIfUX8ti1orWHYsZ5UTF+ckiN24RVXWgG6xZgWI5P5kAZZp4aTMBPwcR6xJJWJjXR+9cklk7Ywodcs2zOmuzPFRGaeLfuqaugXOokSb7E+zCEF755/g9Q3xM+Yx3SRWrj1lFQoufvNNdw==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPSA id AF5281800784;
	Thu, 29 Jan 2026 12:26:32 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: boqun@kernel.org,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 2/2] rust: list: Use AtomicFlag in AtomicTracker
Date: Thu, 29 Jan 2026 21:26:22 +0900
Message-ID: <20260129122622.3896144-3-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129122622.3896144-1-tomo@aliasing.net>
References: <20260129122622.3896144-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Authority-Info-Out: v=2.4 cv=GrVPO01C c=1 sm=1 tr=0 ts=697b51fb
 cx=c_apl:c_apl_out:c_pps a=qkKslKyYc0ctBTeLUVfTFg==:117 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=_2yia0w1AAAA:8
 a=haVVJi4SGN7caT7hu4gA:9 a=4yAS8WwzZ1jAEY03B-5r:22
X-Proofpoint-GUID: edGnDXDhC_ql3TeeG6tiZ6l4kRMeZLP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4NCBTYWx0ZWRfX7HgFndwaQUsJ
 88pN0KP0rmfEcIbniLIVPLui2sxqfM+jSHr9MP9la8SQmYWWxULV5UNSAROuoThNi9cVZAeS/+b
 VEIXkPaBW0gFE4dwCERAaa7TI5p06BbU1sojLBEyqqVcQBU/wAdRq/eMmve15BXsj4TpA6yIb+f
 R17cdF897vsH+ZNWe0siiKh2vARwAMYVjtop28KqmFe9xlwqlTbgyGDQGvldQGTs7s6WcmSKQKM
 Rd157S0uN8d2Fbxo5VqTjLRlCkxVbhO+6LLD7m8Se7a+4xBJXXG6HTGQIIgFBmaENuqDdGdcGpL
 8uZjmLOqKNlMkyy+2VBTFxQTHfHKkmlaVHDE9V4FL9uMw1qeBgja+N55m6Nxao=
X-Proofpoint-ORIG-GUID: edGnDXDhC_ql3TeeG6tiZ6l4kRMeZLP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=927 clxscore=1030 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290084
X-JNJ: AAAAAAAB053MbLJS9hWjdWB/IM0oYK5J7qx3NGpcr3TFF580b2cTbROYG5qBMRebcaeDtEZm5vfQ7E5u8fMX8T6b/kgR5jb1GlOAksbh/1yE+gjno/OTOES2GXJY4JrB+58i+lvYbDvm9opjqk6LUnlmNG+JAtT+PYcDTgV0/dGvwfiszwCSYf2un+XOJbNQEC/XnCyTRkKiSMcLm9yDFLthatl28Syf3AEo5n2+VsORVOq/3qRxr2CTgNzqmCTYO6nscUnR3IrxAcifF19sKUvDyBp3AEPP4rYBd8ruvcjRgo6VqjDsX5MDp4pWu+iuYkfrwkP8yeWyaPnvR/CUR1uwszWkqYu5D7QHjf87Jr64M60Uhdapq5FnvVS8OmqLARRvhQnXUU+C7Kq33zM1BMZ3Ln4aNDQEcIHGlLhDb8QPm0qZvQQKNGqebulm1RvmzIkM7TjMwQKHNSHzVV2a8vsSw9mHPE8V40lGiO5DmBxZU2fZ36QzKVC8F1kqVVdPk1uIUvUxsqbGMDQk71rQ++xp3/1EY0NIGeHfMsMnA1ivzRB+U8kxWmNLu3bgKC5KLe/kqbW4zRmJoIlrlh3pNr8bJz+Vz9y3G0K4agG0+qhKs47sM3TvfFs9dq2WVGu9QfMkUomfQBCOwbSUo2z0LphOrLDacJrtxDS3UkGqgKr+eZD4pjR3GpWP3YgAldd7hXB1lWekiibfHF3YK0Hk9XcOObgCbu4XkRikTVwoO11Y8Wm5esCgc1YKCLVcagdpViIntq3j46b22jlAD0I=

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Make AtomicTracker use AtomicFlag instead of Atomic<bool> to avoid
slow byte-sized RMWs on architectures that don't support them.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/list/arc.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 2282f33913ee..5e84f500a3fe 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -6,7 +6,7 @@
 
 use crate::alloc::{AllocError, Flags};
 use crate::prelude::*;
-use crate::sync::atomic::{ordering, Atomic};
+use crate::sync::atomic::{ordering, AtomicFlag};
 use crate::sync::{Arc, ArcBorrow, UniqueArc};
 use core::marker::PhantomPinned;
 use core::ops::Deref;
@@ -469,7 +469,7 @@ impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc
 /// If the boolean is `false`, then there is no [`ListArc`] for this value.
 #[repr(transparent)]
 pub struct AtomicTracker<const ID: u64 = 0> {
-    inner: Atomic<bool>,
+    inner: AtomicFlag,
     // This value needs to be pinned to justify the INVARIANT: comment in `AtomicTracker::new`.
     _pin: PhantomPinned,
 }
@@ -480,12 +480,12 @@ pub fn new() -> impl PinInit<Self> {
         // INVARIANT: Pin-init initializers can't be used on an existing `Arc`, so this value will
         // not be constructed in an `Arc` that already has a `ListArc`.
         Self {
-            inner: Atomic::new(false),
+            inner: AtomicFlag::new(false),
             _pin: PhantomPinned,
         }
     }
 
-    fn project_inner(self: Pin<&mut Self>) -> &mut Atomic<bool> {
+    fn project_inner(self: Pin<&mut Self>) -> &mut AtomicFlag {
         // SAFETY: The `inner` field is not structurally pinned, so we may obtain a mutable
         // reference to it even if we only have a pinned reference to `self`.
         unsafe { &mut Pin::into_inner_unchecked(self).inner }
-- 
2.43.0

