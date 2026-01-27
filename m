Received: from outbound.pv.icloud.com (p-west1-cluster4-host4-snip4-10.eps.apple.com [57.103.65.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA00A34DB59
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518396; cv=none; b=FoXyEE0dXmR1DIZiLLfHnby43ejYzQGvpcul286FMvdy5CfYlZ5pnYVKiHFlonga6CwA81pu9ZATMzSkXsNldqVKcqtteHXSnc9YOHZBmpXwdRWqmZ/K0988RrQWIVtUTCYsU0ti2yIc6ooaTs8737S8AMdAwx6PF56Wn+8Qzn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518396; c=relaxed/simple;
	bh=YIDBEiMG6T7TVreiVCzbBlJda5t8ckNZUfIct4miKVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjGM9JSCsMQwh+fPoeoc5aNPcBNLejH1+nIgAK4CA4kYtkysCLjitLA0e1QovpMTaCmbJsA0+yAH3gMW6NxjES61g7B6HDznlPHpaD7+LPbAHIYeXNC4skMqmyDjctTBUhBnpkhD3nEv47+ET6Aw3/Gjnq+T+wX9DMQSqOjIxdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=Vjy6m5Z5; arc=none smtp.client-ip=57.103.65.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="Vjy6m5Z5"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-13 (Postfix) with ESMTPS id 4C4A718006E2;
	Tue, 27 Jan 2026 12:53:13 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769518394; x=1772110394; bh=QArI52lq3ZrCqaEmB0GHhcVYxYDqL9XDhDksKUV7WIs=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Vjy6m5Z5WPheikC0EYNX2AMrccZEWisMSSUWvZd99DBEjql/fA/47qH55iIFYkuGv+9WFZ6Bj2G2aqa0T9P8Su2dTEh8wiYbUJXj4zbxyrxaLkMOSqdo7XYdsKlGBY+VEet3l2RqcEJaMt7UklMIyLn5dtId7sH2lUJBIOmfcleEM4DF5E0hbSlnC7ADk54q0ltUlrNOuKsdmoNLEafhf7OjpOli6bbmnBEljA8XghJn3adGyyEbNkWmQ6EkwU3JKDahHSjRuuWbLRRVaXAlEgaecETfM+BJVQ0KOyiKTq9+bg160Ghd3nSKYX7XsvaZCyTZZb2582WMUb1LhnuFaQ==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-13 (Postfix) with ESMTPSA id A05B618006D9;
	Tue, 27 Jan 2026 12:53:10 +0000 (UTC)
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
Subject: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
Date: Tue, 27 Jan 2026 21:52:59 +0900
Message-ID: <20260127125300.3656544-2-tomo@aliasing.net>
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
X-Proofpoint-GUID: LECaQsBgFPEDekVuny9nrOsD6_Z9LzMN
X-Authority-Info-Out: v=2.4 cv=GMoF0+NK c=1 sm=1 tr=0 ts=6978b539
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=0fZ0V6VmMsrEkdd8rU0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNSBTYWx0ZWRfXx3GTZU81CEET
 QaRuqi7zsXU1a+wg49kXIlI6Idw+EVxQkwsqQ87xH91KIXXbngAigs7ps8xbpOtxTNPhYuXchrx
 iq5+7bndE2E/qtfsA6ZY4fWrbKruu0J36bGDY40J1Y7GsIKqsaDyKPUYfUnMZAWOzZ5NSXUArIi
 qAzw4fFX7FuPi1EhM6BpzeHnqpj159ZlJOcx5nn3ohQS/OgM1FLqSM7Rgn0/iK5BUHgm1yFs/ij
 rNMxYJmbf/VOHSLNM329+7P8pnQXoCXgSKlOabnaSTw7nC2rA7hFZmk7KbSqWK+7NbwKKRPjFOf
 57ND/zcOx2IGT0eqDxe5tApIWcD9H9FIi5K/ZbVWJHjehh8hLMMUGklyRivI24=
X-Proofpoint-ORIG-GUID: LECaQsBgFPEDekVuny9nrOsD6_Z9LzMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1030 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270105
X-JNJ: AAAAAAABcEvOa2cPfo6D8X0BKkJi/UyD0lkwo3bBTYUAl1kZr45cAwKCK+B03vw8U3RdwItbRr13/M5kY18o7KG8kapb8gxYet0szbMdW1G5RGhPfW5jMkRO6KhUz2IMzWQTHEj6SYfm+SxhMkNoV2GT7tT1lkNtP/bLg2JlrRC9n6Gy0eUZzvyg2EFBhZM7wdxLMvnav2vhWiecgfw/xaZCxLLM5b5etG05fhEmWLMvvxcBL1IgJtC/eCnAopNOaIg3yT1cBDzwsAP6ci06v5AfMgnHGIU4RJ4RcPxAA92kLI2lu56h1CeLiLamqgyGBM2oFo4v7t8TufFO9a6ZkIw3SiVo6V567+z3qTCfvA+hlrfcN+S5gl0B08IxmFn7Er8oTJNhOJQbo16vc9eBDOLs96/4p0H2AnJ0UQYw0ZJ23y5he4MqLuKeMKmLwYkQpTLEJYlOv5IZ3Q64/0lvHMyH2Z3mH7qgqFcQZNxcL1CJVPzE2eF9mC6JKtHh65Sa4Hu0XZtBl/Ff/IdzqxOHrG5O1/3N3lMXeJTFTtM5K7Ocs6ccAupgMQl6AsshvDN1jg3ob3UCtYz2iFttRS3l1blnFx4cHM8vmFzKbrHwJ9MyxiRru9Y/SBgJpeaYWKfVmP46nqMlueI6/D79EWYTkaEv47cdLDd5URlmb5u9W0DrihAj51YC7KNijlKoClQGhqunA3M4bDMS0Eqn/SQcnyJuFMcPnD2bqK1wpdo1Od2ZUgV0um+8R9NM9622ngk+6wPwJmlzosRLkKj+9EMC/NfAYc0rgSkop5G63w==

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

AtomicFlag exposes a bool API, but it lacks a get_mut() equivalent to
Atomic<T>::get_mut().

Also add kunit tests for AtomicFlag.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs           | 20 ++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs | 17 +++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 6c46335bdb8c..b6c01d9f3a46 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -591,6 +591,26 @@ pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, b: bool, o: Ordering)
         self.0.store(b.into(), o)
     }
 
+    /// Returns a mutable reference to the underlying flag as a `bool`.
+    ///
+    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
+    pub fn get_mut(&mut self) -> &mut bool {
+        let byte_ptr = {
+            let ptr = self.0.as_ptr().cast::<u8>();
+            let offset = if cfg!(target_endian = "big") {
+                core::mem::size_of::<Flag>() - 1
+            } else {
+                0
+            };
+
+            // SAFETY: `ptr` is valid for `size_of::<Flag>()` bytes; `offset` selects the LSB.
+            unsafe { ptr.add(offset) }
+        };
+
+        // SAFETY: The LSB holds `0`/`1` for `Flag::Clear/Set`, and `bool` is `i8`-sized/aligned.
+        unsafe { &mut *byte_ptr.cast::<bool>() }
+    }
+
     /// Stores a value to the atomic flag and returns the previous value.
     #[inline(always)]
     pub fn xchg<Ordering: ordering::Ordering>(&self, b: bool, o: Ordering) -> bool {
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 11bc67ab70a3..e413b9e9fe21 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -351,6 +351,23 @@ fn atomic_bool_tests() {
         assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
     }
 
+    #[test]
+    fn atomic_flag_tests() {
+        let mut flag = AtomicFlag::new(false);
+
+        assert_eq!(false, flag.load(Relaxed));
+
+        *flag.get_mut() = true;
+        assert_eq!(true, flag.load(Relaxed));
+
+        assert_eq!(true, flag.xchg(false, Relaxed));
+        assert_eq!(false, flag.load(Relaxed));
+
+        *flag.get_mut() = true;
+        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
+        assert_eq!(false, flag.load(Relaxed));
+    }
+
     #[test]
     fn atomic_ptr_tests() {
         let mut v = 42;
-- 
2.43.0

