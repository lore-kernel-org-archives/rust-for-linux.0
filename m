Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95538B122
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529866; cv=none; b=uUSIziIkAa8ixEVR2Wre8IElvsFza/AsucNxwPABtGuJh93ecuut/87wJThSAUUM9LvTuJ/PHrEbNexndAuLP3c7KoLFNG+aMJ5OQg7cGjlLTax1D5JucM4MnAuF1eNBp+SqjD8tLtltoOrL9pwJNlj9ZJH9hgb91qQP7DZbWyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529866; c=relaxed/simple;
	bh=SpYxZzYJtgYKNTwiRkmIxqD8f3+jPDEFECfuuq08OzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVvCWzEbUpUKuBfiXLbrF6VSHl8HGaQy9F2JYuF+u0ZtjbpF0mBq1wKmiKCt7r0ROSIb5ZU4l02gQUcCNYEhc5CXN8wtmIjc23zNbTZqi3SLPknNXsP4NNmExORhuTjIpXhgcU3bMcOr1llHMfQzODsgyZgoGj6zO/fd2Z8gYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cL780KQ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cL780KQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB111F00ADE;
	Fri, 31 Jul 2026 20:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529864;
	bh=0jIqDwRD5BghLbZe9tkUQQ4LGbP7l8lz0sl+eROKvDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cL780KQ2yfsWzkw/fi+xTF4SkorGQ8R7mL/YeabnWaXGsT43eyoUQ1JXHbl10YwW/
	 WchjjP9paO7T0InlGgjCZHaGTHz5hHkb3XM2DXF0Pwn6I/0uF8OnmwLpKqBE/OU+3b
	 WSIAvctvssf5DUuhZ6dolIisKMw4d8MOcJ9xmM3pTmgtD629Agy3mP6Vd0gt/DCbQu
	 Jsc2R/kAh38MJB8qOUjLL20tcQUAQnDqmMbdDogsOGMCq7Rw66ptaXvv9OO26WHRKL
	 eh1Lh24IGB0DjhDr/R6yITydP3XAy45NUULJbs1GaunXvua6qMLlB3fYEdqLOotrJl
	 Zoe7j9p27kttA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 05BAEF4007B;
	Fri, 31 Jul 2026 16:31:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 31 Jul 2026 16:31:03 -0400
X-ME-Sender: <xms:BgZtannBHQ_KzyuN-sPHBz9tL1VCNTv58SoG4EHGMeT99w9ZwyVHPA>
    <xme:BgZtagBeiqU_l0nnvLGjWlneulU02NP1L6JhfbDOZU1_PTXOvuPYiWxPA6e6Ybl9y
    89X3uV-GMr8bRTEDmH_Y5LZS9DD5rAFveEXwqwS4m3bk8kyDNJk7BI>
X-ME-Received: <xmr:BgZtahCOyJOdsyrB__PwZ6SngzaVZxNHhu89EW_NQub8blq0ESyBBMBokzaNffOIOWlNyU-AFWqJ9T7PiW_EdbWugeSkMzsR>
X-ME-Proxy-Cause: dmFkZTEbBIfeSlo9prBcK5SQKPeqygxB1v/cLTVgZ5l5/ASlZ9vahSgThT0iqkqsNP7FqK
    9zw6YF1XG3UNmEM3u6nsEDmLcFtKi/7cfe9xQqiaIubHunNfY02XRK8wlY6K0FXtf9SRo/
    1VhrSN/M5RNZuHROCh24ulCrPMyClee0/fhnnz4fOUOZI3q/RLZ6x47wJ8LNHHXBj1sqg0
    b5NEuj6hbqItE5byv8n020XMXAOwtwYIaLnMGB3SEjNqrhWWOtqs6CUvr8EJZH2Eus7heN
    HM0Lm9s3y2ZTjZXTsYc0ZE4AKwqpvayt6n7d2o32foshM6FX1uxJb77wm/zD1mFUlsqelQ
    HxbPBLWhYLCHjRoXv9i6XrPX5F1uNRywKOBBe1ZU+G7TXnPfJecbqqVODRW/I8jzx+Smmt
    jxiESh5oGkeAa5STnrq+2UQUDvf5MTf202FsivzwhAE4lkZhzRA9Qu0LpRcAPd2uJN4ZZj
    vKiQuiBSKK6YnR16vMQ84qCIn1hX1B85aQQ+wYC30AIvGRjEqrTT1MzK1xk2rtIy86m9Fm
    COoLpeNymX5vcfTUehte4qAUFhFDu8HJK8PYdRF4N0W+pRcnQnNseXojyDE//KtU8F9juv
    rWOif2MtYYRQVYjEh4prxw9DL40jY/oJ5PxZxzaOZnsOWIKFLFmAfhCxK40A
X-ME-Proxy: <xmx:BgZtavEb5ZBwgfAxOQV97mj5UU0eJWbtHFHxviNLHg-3U_Ew_3eMMw>
    <xmx:BwZtag7_TivwOqf4ms_rsff5uPyV1o-02hPTtqbUytstuIlNO67sQQ>
    <xmx:BwZtauSske8dH8u0eoyf6bhVMnJW74cybpvLMn6IGdsDu5NIPiniPg>
    <xmx:BwZtaj4GRz-2WW2cEZBXevARUtjLLwfXuXMwusdhndUDndK5JzLH8Q>
    <xmx:BwZtajRxNs2DVO18csZyqNskEYOPtnMj0NAzaB1E3oWznI3RGnjakAvs>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:02 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH 16/24] rust: sync: use super::* in spinlock.rs
Date: Fri, 31 Jul 2026 13:30:17 -0700
Message-ID: <20260731203031.13679-17-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
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
Link: https://patch.msgid.link/20260302232154.861916-4-lyude@redhat.com
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

