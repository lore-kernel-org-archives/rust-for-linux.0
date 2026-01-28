Received: from outbound.qs.icloud.com (p-east3-cluster6-host11-snip4-10.eps.apple.com [57.103.85.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D32D7DF1
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.85.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601148; cv=none; b=ZyZa6XyOGQ5YENgx4X0QMu8r2Uzsd2caXOSbo59rRsfDMaB+N94ANki7n35+Xzsi8CcvmklAGeAfQUwKtNy57ABobJSJGhyhgtj11KBAYYAbRPcmMTHFvL3+FzLCICrYeQ652iicCwXLnGLmV5KjM8uQWxBzrVvg5LD2dpB7qXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601148; c=relaxed/simple;
	bh=LJuZ5OC3AV1TywFLwOXSUPCyDHzt6aq4FaRt5tVaycQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fInS3+b6miML4kTxpwmyHpBLS1D3wla+phNu7r4TInfVT0CIm7jE+/9sLFKLUarX3E3+lNwrZROLF1driMRdYDipXWWNtLjcBsqkPNctgmEDJSlVpHOcC8dRqcqa1u6O0KhXTu65UkY6gtwRLtvlAQdo962ieiCJMwa27NE6RJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=Mc6LfTUT; arc=none smtp.client-ip=57.103.85.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="Mc6LfTUT"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-15 (Postfix) with ESMTPS id ADFB71800167;
	Wed, 28 Jan 2026 11:52:22 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769601145; x=1772193145; bh=WFc7bQDflTEteFCBkcEqooIeZoxpdYTogh2ubqHuvqw=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Mc6LfTUTFnCizEyeC+Tkf4C9Wn0tBI8kmp9LJ8HS2cXlcA0lF0rf06ukgWTRFMPnNTA9D5VXaSpLb+SE7qbwHAtyc1DJGycVD3xncSn5vZ2ufo/b9/RjfUDgGPJ5hunJnZRIlOlVSpIIaUkJDWJwChhbCmnvBGzou53kmnef3enOvW5JrRHbAyb2fJ93iXMKj9A0wba6wrhPHzlMyAvqs4sop3/ui21Rbf0++o32YSq8FCx5Xsi64d9xv3YP+esIy0H87fP1RFnpcUEbXG4GkY0Foet9nG4ZE1PW9CphtB9a2HehDrRQql2mAx0U9A9TB7GDrT9JLFSXJFtcN7l8mQ==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-15 (Postfix) with ESMTPSA id 4AD9618000A6;
	Wed, 28 Jan 2026 11:52:19 +0000 (UTC)
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
Subject: [PATCH v1 2/2] rust: list: Use AtomicFlag in AtomicTracker
Date: Wed, 28 Jan 2026 20:52:00 +0900
Message-ID: <20260128115200.3820113-3-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128115200.3820113-1-tomo@aliasing.net>
References: <20260128115200.3820113-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NyBTYWx0ZWRfX2ZiWN6M81qqj
 OGenIdKZ0lH5Qs/g7HbVvACW+/LRo/tn4dRhcwKx//ETQHdmhntDBLwkjFmPoY3A/pQ4wlw+aIG
 jiqpwVcYw9P/6tK4rNUStyAYDsbc6GjJYVZDOPhicNMl5Goaz/1bVaYfVRaeRTjeiUz63mXgNnU
 RkBJ4Z8jLLLBI3/r3S2G3zmw8HzvG8mHo6V6c4UCMwgmrheOoGnUfOA/AEDdsZAQlVNtIsnIwZq
 GPrTrC8q64u+XGx2w4TabU6n6R+ffbOVVywt/k6ajcMvAUHmeRDSOPIKIIHhCrey4ksT7kc/WmR
 XxqCKVXcxau/2sCsXhWUPLdna3Px4v3ug0m85qwk35z+KCuMv96ChvwULhhaDk=
X-Authority-Info-Out: v=2.4 cv=L8kQguT8 c=1 sm=1 tr=0 ts=6979f877
 cx=c_apl:c_apl_out:c_pps a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=_2yia0w1AAAA:8 a=haVVJi4SGN7caT7hu4gA:9
 a=4yAS8WwzZ1jAEY03B-5r:22
X-Proofpoint-GUID: j2xR5eht1sJagpVRR1Pht0v0nqGQa1T8
X-Proofpoint-ORIG-GUID: j2xR5eht1sJagpVRR1Pht0v0nqGQa1T8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 spamscore=0 mlxscore=0 mlxlogscore=959 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280097
X-JNJ: AAAAAAABROsUhsIaGEPN/RQ+hLTV8NTDsT/ayAdHWGcxQvYlYYqQcczGsDONRLSYU4dVKpfruOcSw0La9zA8EG1sPjTUIsWzsozdetoaeIuhJgT1RvMo7miXNf1LvOp3BFltadVYV6Fndhfnf18IDKBhun9/INS7QAP6ESjjixSgtJ50rQITB5O5txse8MCNvAV3Z4ItpczjAJoZbMWp7TGWQPnvbTlOCWrY1DecKN+kDNSXT6fVyqHucSnnGGItXXOe9DptLair5onavh8DvX9dy0E4NW0kVQNfC36cb/4PVioh0BZDOn86JVLBE3T2BAW6z4aW7E//ivLsi84q9ALNg5bP2lUexwnZJP2mp20DpMi+k3j0uupomlnUxvSpJ70BYoO6sxf4Qcbilt+h8HKQCukB6a2Nln1AN43FrPaSFSqYefLLThlUhuQ3BPaQo3RAmLZxyH77meiY223MrHVtVtS7c1nQUwLlsSBSwmVY9GdNQn+mM08ZfGW5UANqldX0uiGcjBg+D/q+XzVAo3i8IwdfoN26keOWUgEQvoPnlqgQOGQdfoRvpoftBbkHC41D5uziwY+yYYF0eq1n/qPG6kArJ84QdJmRxB8zCx1EQVK/M/gqakqvksJSUgZcq9OzJHF97Dt+zdAwjZoEi1l10GnC5QADKBou4UwuYKuxBlIN9aOXpM+6jB/6lnXbZtLY/6xkY9TbPtn0Xt9bycW9agx0lhLDie654w1y0e0gDIQUgdo8dREWOwMsqb2Hiy5t8LOYLj7QxT9k

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

