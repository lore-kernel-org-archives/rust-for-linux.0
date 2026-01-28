Received: from outbound.qs.icloud.com (p-east3-cluster6-host7-snip4-10.eps.apple.com [57.103.85.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF0A24B28
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.85.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603629; cv=none; b=jp/frHRFCYZYn17fZd4pLTTf9IhtB2A7RURb87AediFb1OXMnzEyCu43NUp0I6GZbNR553InBLmOxEhXST1Z/+dDfXD/IDUb7R8XwHtxvXbXHQdHn/ky6CzmYhvNVHQGNbK8KHnwq8XqcoXEEUr54A34JpA9WR7Xgy7OIvoqJcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603629; c=relaxed/simple;
	bh=SaYA8zSu7Tvk0/tjSce/I/qtjtLTHDLtsebZ63tOgpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JODIh08Ri5/Owk9pTKEsiH6keG5kmbem4GQsLF+EoiIcnI0W8eNK2kqJKW7tHJ4YBpP8YL1DvcMHNvD5gYgCOMQ84c10cGTt5+FWPfLhKJOv3R1WsruLuf/PBkJ1uVOi2FHhGWU0aNnLL5WdH4U3ko6smNcNC3/k+BrIBZVaOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=Dz+QO5fP; arc=none smtp.client-ip=57.103.85.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="Dz+QO5fP"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-13 (Postfix) with ESMTPS id A4D77180018F;
	Wed, 28 Jan 2026 12:33:42 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769603626; x=1772195626; bh=kmjbp+4C2f3qLITO1i/vpzrOWnK0Nfi9UodHBE0qHX8=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Dz+QO5fPWzmGuJ13CZSxKHpW5eJRbL3ptIfQ8HdFjMFJZh24/CyoJsRWdsHVxYTBH9F4NATMWEQWzoZRzHrDWDQK+SrGUYNrztWHbI2ZmBLI4DwWPPpNodklsWbivHrpBrPxttQLlx17UMolVBurcB1rpwfau+plbUnc7o8Cr2uMHxhhoWg2bYdlZU7cAW4vWQ7C99TmTGCoyQTxhZy3Jwu/oJvX8+mrU9CtP3LglntVvAYUqB/mQy2Wos20tniw+DZArhYIQl0v6LP+sic9/fP/N3s601cUe3/CQmlu7RJwGrtEj1bnYmn8OW3k56Go3zCrH+ueLTrmQQdhuTEkvg==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-13 (Postfix) with ESMTPSA id 0E64C1800193;
	Wed, 28 Jan 2026 12:33:38 +0000 (UTC)
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
Subject: [PATCH v1] rust: sync: atomic: Add example for Atomic::get_mut
Date: Wed, 28 Jan 2026 21:33:13 +0900
Message-ID: <20260128123313.3850604-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A3FzfuFATMnkyW74CZ7gYC7E2Adb6ZU0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMyBTYWx0ZWRfXxhXR+aT5+0Oq
 kLqyn9FFU2IhLnJ1AjaNb+RD2L3WIc/S4CwRu4NdtSWrWeFXIGIyRBPoseCIh1F6Q4rUbBILhRY
 r1uZy7Mr/caDz6ALDkcj89Dtz18YnO5Edd5IatxbAetQK1keshbwPrxN6Qd8HZq+L8Z0jICxuWO
 6j7n/DPhnsGhfENO9pyGR43x0SsrfdKFk58ALmAg15mYqLHswQc2/qlI19Ls0kim03Hxa6+tCCv
 LS/52I1JCPNUZkoqYPtT0Ty92TSODEC0WjBQBePjGXBFIEG+vA985L2RKza08innI7NOPYqvddy
 8nYIgSV8a4X5ub/mBi7K+PXv7T87gSU47m6VwggQ7SIMihFYjwYY3jCIggWdRw=
X-Proofpoint-GUID: A3FzfuFATMnkyW74CZ7gYC7E2Adb6ZU0
X-Authority-Info-Out: v=2.4 cv=cIjtc1eN c=1 sm=1 tr=0 ts=697a0228
 cx=c_apl:c_apl_out:c_pps a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=OaoIkNHggA8CxHHW3IYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=940
 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0 clxscore=1030 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280103
X-JNJ: AAAAAAABP7JIBUlWnSl8n6AGlXIXeG1ec/f95K0Mp8QwkOJ/fCYPjA6CR3A54jZdYoMgjq/ktDOR3NBtziW1/ZicZf0Cm/Kon1rUxdp0QUwZNKMhUBf3QozuGhjLn1JtkHkd4jHTV4gxTSyyKVB/9Fxe+zT+ggsAFGD6DbKKacdZFUUtu/BiCl6V5HGcBvXhw1/j85fF2h/raF2TWtoA2UUX8qLTZpC6kfswW09cHVhdkU8jibrYKXzICCiCaz43jj46fFi8yhI7lTC5yDc+3eonS0jGb8+KqzHvL5FZpGCb/TM5NZObQ313SnWsiWZnGuLF9GpZbnDwT+GRWKsoHUB08YrZ6GNifTyhN+FSxHksV1g8E/+2LjcXXvvLgEBG5JTEDezLomuemc26U1VqCNRV/sm/MHKjoVGi+EVg7doj81Q2KqLdR1Dc40TuGwdL/oPYxtM0soxw9XailHclBi5D3tBlhsVmGQDBoChfnEzJCs8Zt3QPZhWNqUbKX42KCIte5fry7BsrFhopvvoq2B5mFP1iDkKfClSIE9Om8uO8lTyaoJG+k8Vz9qkKfobGWcmPgz9EoL0vo5NP7qZu1Kohfh/PAKXX+9lk24bsFwSmtbtaYZbhC/s4lmXjY6RIZHxK4E/q5jBeZvU7V9znmScpn06one/oBkvou4a9+/hkCRaC2bTaI5F4SytJJq4vO82YeureYAp8KVbuKlJxE4VDGSV6qBLq6hGo4P1RqiDNE2naNk9LA44R9pX8yeEMHo4MiDIB70SeACmeYqQ=

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add an example for Atomic::get_mut(). No functional change.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a..d44550adb0d4 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -235,6 +235,17 @@ pub const fn as_ptr(&self) -> *mut T {
     /// Returns a mutable reference to the underlying atomic `T`.
     ///
     /// This is safe because the mutable reference of the atomic `T` guarantees exclusive access.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let mut atomic_val = Atomic::new(0u32);
+    /// let val_mut = atomic_val.get_mut();
+    /// *val_mut = 101;
+    /// assert_eq!(101, atomic_val.load(Relaxed));
+    /// ```
     pub fn get_mut(&mut self) -> &mut T {
         // CAST: `T` and `T::Repr` has the same size and alignment per the safety requirement of
         // `AtomicType`, and per the type invariants `self.0` is a valid `T`, therefore the casting

base-commit: 6583920e15fc567109e1c64ca58c917f52f40736
-- 
2.43.0

