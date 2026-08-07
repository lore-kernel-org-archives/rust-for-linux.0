Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F893BFE52
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086171; cv=none; b=kaFDROtGyE+OBH2JuvUV/MVv3SBSItu2a/EG1FFDXT9PhC+Pb3vm/h2Fx9zrEXnyvPBZG0aL4LRf6/hsYg/NGYWwNgJpogvsX2Dqu5pDpKlU9lnbn70wKTSwYImHbXii6mL9yxpUoYmoViRzOHCXaDaZU+RCSWxuYf8WowJe9+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086171; c=relaxed/simple;
	bh=1B574WZxr85tEXgvJ/lsuCd24hw6r0EvD8jaMRrm6yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOXmFHcWMvCgJzzKYEp3cyV1tSE7ebcjhR0Ht3HVEc8uobOheVKTn8hEC5sgbMhd829z0VzDOP/4thFMJ/kyc6/CTQK4NwTZ3wmA6H9SBTckF6oNrZavJMj6vIt6N73ZVicnNLd1n1ewTbihJPlRFvhTULjKKBvY6oCNS7OpntE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfSpFGRN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfSpFGRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F671F00A3F;
	Fri,  7 Aug 2026 07:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086170;
	bh=Ehxr5VUxk0jCrAQvRW8oaPBfKD8Ta2YHENyPPAE1YHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WfSpFGRNtOnD7E8Ub4nlQQ2njm2xJPZ9zPzWFKYVikyVnSmChCuI4wfORexmws6bO
	 qS+sM2gxx0bQeVVXR4kqhtLmGOf3IrrWeBRfDYDaEcYOeEvNaeAqNbDGi8SHPWd8H9
	 JwQZH2ZSuxTOwrxEXWikHnuRmRKuM9rOpIizHMe5v+ifEMOC2l3qSgtwRDExUVpmwy
	 /RVN2DdmWRvEprGm64fvnx5RXYD1mi9WMPNEZ11mifP5Y6WCAOacNM4GraA3O8eegY
	 Hm6EaCKZSBSqIr8xPyj5lj24v6vMNkwT5G0PprD0bspZ7i4TOzLmmhPDx2V1b/Gyoo
	 9V2X8vdTV7vaQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7C8D5F40068;
	Fri,  7 Aug 2026 03:02:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 07 Aug 2026 03:02:48 -0400
X-ME-Sender: <xms:GIN1agdjosmV45P93m37MlBaKrzyIHBBKveqa_JGCNw5hHId39MRNg>
    <xme:GIN1aug9Esl5zhK-bNsYJkhYQ3TAZgopAS_M9zJ1smK2YXhYYsyWSdbFvk_RVpjD7
    2NYs7lwhC1m9MnxLG30RHHEdZ-YE4oXojFn-pwE8DxCuXpUdSg-oQ>
X-ME-Received: <xmr:GIN1ajJuOPzOu7Rpy_GFwxsMaet8COcbeLK-J8mlhqBIMGFAMbuR2WvXHcOdhI85m8CEbY6-B_NuvYBWJHvhyUWGUoubwCiR>
X-ME-Proxy-Cause: dmFkZTELsVbnxrvhPb2j61weS49pxhnQ59QQ/kkvzVAF7RfvMFBahj3W+J/ZYvUaUDGUKL
    rkIpWI9Kqh7tdFeNxTw91APFY2yZOuGFzh0R7L9linn/K/VkHskzHhqZIAbhz+FzEI2/39
    p/Gf/98yNPd7kqv7ASor+gx/DK4WZv4tGUkwpXImaVpTVn9yjG8Hsrc4m1zuPGR3jPjYfV
    aGaWr2EDt/5hU/phchzQPFGxTjKWqqv3f39Pht190FqbXj8fyXB6xLi7X5zcPt/Liyw23y
    b+4UgNbRpkgjQlqdkJa7EiS5FEj8Oxro36Xe5RlI+SlnX1fghWIXGuRondD8d1wH6SlNgk
    W7+Bu5W2iloERZYb04iIiyBWZiQ9IHDI5GiGJTUIAs4C+7cY9pyfDJJWxdZU3vFcBKJ3FJ
    50U+OJeN3bvoL4rA2Mq3y0B+gjfwgHmCGMK/x/Hq5FwEhPZ1o0La/WEYji2pRqa9EfTDC3
    kqixZNwr8ct7CXQvvyQI2n++M2vmB/E7x2/thOCUgE+L9zRlKVEBgCGQ1A4Awqoi4e/w5h
    MS8BNz1qgvc5WDtPOXNxx1gSaD+isdUV6imC2YqlfuX2euAzzZ3v9bckYSH4FH9wA/NEJL
    9HNd5Qv1qITMk14/wi+ALzwsuA3Je1QW5qWA1KN9XZJ66Fq5Ijg0nKbQ60sg
X-ME-Proxy: <xmx:GIN1ajGWZFL5Gl7LWOT_Bt9eI0E9dm8UKrgpLp_imgsSBvYFgYElMg>
    <xmx:GIN1ah2V0SkGmRVwQNZsgUEv3i_3Hgau5wjqQpkRGLaLEIRgqpDpLQ>
    <xmx:GIN1aixkltlmcbtZn_G2q8ypuluYqbnjj0OwAMckGOrcyCXWK4dGcg>
    <xmx:GIN1aojhV1BGPuPh8aeeQrj5Kxwn3pn5aOf-5_9_pzFHCp0ffu5zGQ>
    <xmx:GIN1apzSk6AB1k9_Fq4K6FH4cvqgPAgcKR9dXYGcqhUHmtU74J7JQXWu>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:48 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v5 16/18] rust: sync: Use super::* in spinlock.rs
Date: Fri,  7 Aug 2026 00:02:13 -0700
Message-ID: <20260807070218.27144-17-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260807070218.27144-1-boqun@kernel.org>
References: <20260807070218.27144-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

No functional changes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/kernel/sync/lock/spinlock.rs | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index ef76fa07ca3a..d75af32218ba 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -3,6 +3,7 @@
 //! A kernel spinlock.
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
+use super::*;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -82,7 +83,7 @@ macro_rules! new_spinlock {
 /// ```
 ///
 /// [`spinlock_t`]: srctree/include/linux/spinlock.h
-pub type SpinLock<T> = super::Lock<T, SpinLockBackend>;
+pub type SpinLock<T> = Lock<T, SpinLockBackend>;
 
 /// A kernel `spinlock_t` lock backend.
 pub struct SpinLockBackend;
@@ -91,13 +92,11 @@ macro_rules! new_spinlock {
 ///
 /// This is simply a type alias for a [`Guard`] returned from locking a [`SpinLock`]. It will unlock
 /// the [`SpinLock`] upon being dropped.
-///
-/// [`Guard`]: super::Guard
-pub type SpinLockGuard<'a, T> = super::Guard<'a, T, SpinLockBackend>;
+pub type SpinLockGuard<'a, T> = Guard<'a, T, SpinLockBackend>;
 
 // SAFETY: The underlying kernel `spinlock_t` object ensures mutual exclusion. `relock` uses the
 // default implementation that always calls the same locking method.
-unsafe impl super::Backend for SpinLockBackend {
+unsafe impl Backend for SpinLockBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
 
-- 
2.50.1 (Apple Git-155)

