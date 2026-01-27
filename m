Received: from outbound.pv.icloud.com (p-west1-cluster4-host9-snip4-10.eps.apple.com [57.103.65.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4712FD69E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518398; cv=none; b=FOHHqufoXdzYhCrltJXhLDuuhIU6iEtPNS3yOAXxuwKC+QQ+GCJk7VGewzsJXWfJSwoYFCAV3gevKFO8ayajY2fy63HELuCvMVFfhh1pbuDr3OPpCENBC5Fwiriig7gqa5kC0e1f+9o4IK7z74DXeXpffnm6mGvW7d6VBf50yZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518398; c=relaxed/simple;
	bh=G1vK1WTbpwl4hg8d8kOUCO9bjhce5lwCbQBY7RS0sm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjIk9pyDvE/xzChzJjnjfofipQ7uP7oh7FtHgeiwArMnGL0/ZW8Tptc5W06NfKZwmnkgNGhlSOi/T/Lt1t4b2TNkvpuJHs9XOV512loW8K8vTtSrwqh5928iQrrUD3jaeFeMc9aSlPO5pWYNSVU7nODC2EvO9enfFAPnE0hpzSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=rrHQuIxk; arc=none smtp.client-ip=57.103.65.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="rrHQuIxk"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-13 (Postfix) with ESMTPS id 27D0618006CA;
	Tue, 27 Jan 2026 12:53:16 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769518396; x=1772110396; bh=mDglJ6kLLeIdqQE5nAlI285hMd4ddL4PR5qoSn869io=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=rrHQuIxkc6SXB+PYkBPz89SyaSLibAy3cWKGH/wlv7PPBv5Pntt1YF2wrqQpjXLoQoEyKHzjePVfS3U7ErNif4GvlCsSlkrhXzcjDBMb+E3jM7D9pF5XeNrG18DDK/PtITmUJFlsEJgmnJZqcfgzMpdt52rv5r7WQaIMkfdnLDsUYOn66mehgqu5exmxzhUZiJfgWTPmULt8x4xQ5vREof0+jnRNXcpdg6imEBxYIEpOz2CKMcquQ9WdTH12MzMpSrDPEN5OEygdr/+9lslC0+rkoUwL9UMoa8KALukBBeDNLMZ1s/GcwQTZnjBOI2bSc7oi0P+lztqookbb7J2NUA==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-13 (Postfix) with ESMTPSA id 788E718006E7;
	Tue, 27 Jan 2026 12:53:13 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: boqun.feng@gmail.com,
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
Date: Tue, 27 Jan 2026 21:53:00 +0900
Message-ID: <20260127125300.3656544-3-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127125300.3656544-1-tomo@aliasing.net>
References: <20260127125300.3656544-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Authority-Info-Out: v=2.4 cv=LtGfC3dc c=1 sm=1 tr=0 ts=6978b53c
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUDMsqly4THW3T8X6KQA:9
X-Proofpoint-GUID: HnK2aoywNtppr72y8tlozz9zfGgDLs7K
X-Proofpoint-ORIG-GUID: HnK2aoywNtppr72y8tlozz9zfGgDLs7K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNSBTYWx0ZWRfX9WrcHXJrXsgM
 13JiQZyfqAX/WiicWZPq+vNzhhAa2aG4fCYkFwTXA+gPPUE7wnJuIqUxv9hKbvg8UAerH0bF9BE
 69djZWGH+aCN28BK+1wtrAkCMvE2kZzAXWLgvNT44PDWlpXw9riq+xxdlagbTE5PYhsC2wcCy8/
 NljibafHueRi9lxT6h14SDdaPG1lLM3GDKljxBxGrqgay5KZSFBorF6sK+lx63K8BMMmlzZ/WIO
 sjdeMGCQUg1M30LkGIm304MObkmZ6ZNMuy17nNP2Am2temex5XCc1WVtyPIKuvPpYwjdxocwQD1
 1qD21862E3EHIt3PVYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxlogscore=954 clxscore=1030 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2601270105
X-JNJ: AAAAAAABeBGOcbsnYo95JlsKOD1g+x1RhoVqtUepzmgdWFHnBbe2a6BUi1baJnb5xhsGdwwbD9Bx6QMhLV2YVm5eSEGxasaAVuTpHdVmMy4sPKCklcQX83aU3w+wJuJN3Q12QwPSE9xn9pPDnXSvn28YvgHnmMYDWBkfQoa7xKVOmNmW5A2U4UJHTST+5r37Lu+Y4QaHfmiTSOXJn1MmymNUxOA3lX2zYdsotPqxfpl4iOLKVJwXplnGgUcqOeQYb5MGrs9Yq55aquD1f8NappbWqfgBQJD/ipT1InyeZiDiAOOeFj86lBPyLv8H7dugTqE0ir7VBsAQjF1mKBijvoWcOmpxOjrHWL6SKINYlkyANAAxgx8oN2rlIvwH1p3+V3BCo/2W1rYRsWVBxZFy0crmtNocMkYvjGDtyj27SquUsmPAtucgL7ZpjlOUi1irwEKl+xbKF0gACLj78clBQhrepiY80oltjoRsSGamXv2wu35OhNqT89lHQKKCdacPi7EnhmeTaX6OtcaiAgtzcAN7zFAvSe7LJZQERkQzLGzSPrnEVN9bocDcd+6mixprl+AVQzh5Xd9V73VNQDKZXz/P1CHdFWq+boqmZY9KkpZpYztQzFnevtaDULGjxLwe96Bwp/jO3JW1wjghtrY4a8vn8WPMQBCFPTJXca1RKG0ummH6JBqM2WzR9Aml0o7UqhyVLdOF4ZLhcYwHCITdxi0I5uZ5NCms8XCC3ZtJa4Whcog9wrn1ucg7TJjCUdKkYnmMcUL0KKj7wc8bw8XDnMiiQxvZNjs=

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Make AtomicTracker use AtomicFlag instead of Atomic<bool> to avoid
slow byte-sized RMWs on architectures that don't support them.

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

