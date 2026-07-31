Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492A3955DB;
	Fri, 31 Jul 2026 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529877; cv=none; b=EZs4fG4B2cxBpjrVbz+aEWSN6Bzzid7QffZKDFAlBt4Jp5VLSt3gSIoefK1ud4G1fgQSdJpTKFE3ufrD3bidiCYPAYIz5p41Vv/1DxFBmxUYUjxmKLZ7iTQeLXIpY9C474ylQnoyPQZ+dYE96cU1uzKMVkpUvh6ruJQsGRwfZ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529877; c=relaxed/simple;
	bh=GrWQGOL3crZsuH45+ZBPVTITQEqIF9Q5mjZVqqOZsZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgQqB52TgPvyxlmgYJdG94247ZYTRjt3ZfEQmdtqe5p6YE/cHo0Q0DXJNkh8DZmS+APrC2gs83E2BX0rGAE4q7u7r3907VIxn64jFS0UkdpQm2Y7ABaVn8CxHcf50YhRWelUzLsYaa/baz6LkYLhvb6sLn4xvYd4zMybluv/pzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxeSpZ49; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxeSpZ49"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219331F00ADE;
	Fri, 31 Jul 2026 20:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529876;
	bh=wVEFpBGWMoM5WsmfsEJRp4HAJRBtzzCQMV8wkIWA9rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TxeSpZ496vh3Yo2pbWR2XzTzeumr3yggH4j+tEVrgn7nH7EMhP59obk3U2ugx/4L/
	 zBU4D4GK0KneF54vFbmC5lYIgP5M1R2uc3dnnKP2KJr6Mm1UT1ZB5Dqkzzc+Is0I46
	 26sU6QCMBLsmbxfDYT/TyM3C7/oKvHThkkZXm6/HbME/6ad3Zlr9w4D42GiGCVT/UD
	 UnLi0MHmbAyqfH6V448qcbxI8y+5/HJ+UmJb1gtMx8Y04uocPp8n8l7FZK/845RaS1
	 1jGB1SDPcipfucUDya5i8KosOPERCdvO5INxi6ugGL1SwOU60cIWV31s1BEQ4/guMo
	 7ePRBofUanESg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4E179F4007C;
	Fri, 31 Jul 2026 16:31:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:31:15 -0400
X-ME-Sender: <xms:EwZtau7uTCjKqxdD2bX4g1Vs8zXjOEzR5wvZnwB-fVVRTJlyuXKQnA>
    <xme:EwZtaiSkCHYOa4AtBHPBOnoSAHfTO9Yf-5_KbRmlT7pp2Z1pw8y3ZdokjCuwuhza-
    7QbrE02PMMTlFk8a06Sw6xSDe2Um61Gm06px9EbdM9AYwYuY3-Ghn4>
X-ME-Received: <xmr:EwZtajnbHDv8jT2prfY88KFpi6s5QGdjIv4fv7xMXD8y77ROkwFwf-Pb6391Nlv6_a2oZWdxRYhEdHtl9Uo53Gh8aSzJegPO>
X-ME-Proxy-Cause: dmFkZTGOnHZUa8WnHr5e/dCZtTVFW9LuLZK8c+qqG3l4XfTIbozZf3AA8IlPWbaPJrJVqp
    nWy7ITIOPTqUi2f0a/VJdkfYNjO5w0jTzFUK85w5FITvZQKodwqJRThBmnyHC0Cie3wi69
    ITHmm+/NEbE/QfmfHsFZ19G2bqZRRrdc6xFMB8o7R63Vm8sJNcJhvF8FFEQ6zjWiUuCXdq
    //OXBuOYSvSsZdaeP/DKCPX5DV8wK62MR2VRd+FJc5tN/aWsAyfghCYhqta/P/9bXeKNSG
    ky2jVCp1qqxDCiPr6HsaFpF7IpKVkoIE+I2nA6kdnfuEbvPsH/252rhfRbSUdXx1DzxxPO
    KnpWTMajU3wteTOHQfea4t7kv8pOleUOzG3Pt/hvrX+GXSpnVzG2ZQFyHA1tigzL5dgAPd
    tZviqdHlfFc1UHGe9h4hQCY6bAdcD1/K3C06F1inGTrlsI4rP85Qx0TonGpliuSui9KkZY
    rf/Mb7pgwWw2ggmq2m/IiIQLDdCYOJEC2R7uXoEbfRQkPw1emTQYoytvflBxTYMiuGIeHA
    JJuZ6Rw+vjscmAYe8F1RtjgS0rav7Hn4CK/bGLfcTNe27ryS3WfzSDT6UohGZwh4p/+rid
    IUuL8z4J6v7o2Jd+AlmVk2SPiqjrv34hRkgHWrZ4H7wwnQKrR0stj33Wupzg
X-ME-Proxy: <xmx:EwZtamSxMbpIH_gh-yKWr4Hpgyb-lfSGw5P2T2jFX_w1C4ClB-rZ_w>
    <xmx:EwZtaqtk48BRgROxSbfp5vsIp-GlyZqHcFHtbMAMD4TkeCxOLj6xKA>
    <xmx:EwZtav7xkbjbOk8w5yYdTItRusbdQiqoZm3xKcM-EYFnTUZXsRSK2g>
    <xmx:EwZtalitmXCdTI8uHI1wU6u4Y2rPi1-5ysVMc0AQXVBDhs6BfAEBQw>
    <xmx:EwZtahmu3XYOtrLcM0dFDqXL2NoRZ_no4zdYnDZNi_Q-Z1l_VNObdhtO>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:14 -0400 (EDT)
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
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 24/24] rust: revocable: Use LKMM atomics instead of Rust atomics
Date: Fri, 31 Jul 2026 13:30:25 -0700
Message-ID: <20260731203031.13679-25-boqun@kernel.org>
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

From: Gary Guo <gary@garyguo.net>

Kernel code should use LKMM atomics. The existing code is `AtomicBool`
with the need to use `xchg`, so convert it to `AtomicFlag`.

Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260716145536.3681630-1-gary@kernel.org
---
 rust/kernel/revocable.rs | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index f539603349f1..0e55e2a0fb37 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -9,14 +9,19 @@
 
 use crate::{
     prelude::*,
-    sync::rcu,
+    sync::{
+        atomic::{
+            AtomicFlag,
+            Relaxed, //
+        },
+        rcu, //
+    },
     types::Opaque, //
 };
 use core::{
     marker::PhantomData,
     ops::Deref,
-    ptr::drop_in_place,
-    sync::atomic::{AtomicBool, Ordering},
+    ptr::drop_in_place, //
 };
 
 /// An object that can become inaccessible at runtime.
@@ -69,7 +74,7 @@
 /// ```
 #[pin_data(PinnedDrop)]
 pub struct Revocable<T> {
-    is_available: AtomicBool,
+    is_available: AtomicFlag,
     #[pin]
     data: Opaque<T>,
 }
@@ -88,7 +93,7 @@ impl<T> Revocable<T> {
     /// Creates a new revocable instance of the given data.
     pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         try_pin_init!(Self {
-            is_available: AtomicBool::new(true),
+            is_available: AtomicFlag::new(true),
             data <- Opaque::pin_init(data),
         }? E)
     }
@@ -102,7 +107,7 @@ pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, E> {
     /// because another CPU may be waiting to complete the revocation of this object.
     pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
         let guard = rcu::read_lock();
-        if self.is_available.load(Ordering::Relaxed) {
+        if self.is_available.load(Relaxed) {
             // Since `self.is_available` is true, data is initialised and has to remain valid
             // because the RCU read side lock prevents it from being dropped.
             Some(RevocableGuard::new(self.data.get(), guard))
@@ -120,7 +125,7 @@ pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
     /// allowed to sleep because another CPU may be waiting to complete the revocation of this
     /// object.
     pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard) -> Option<&'a T> {
-        if self.is_available.load(Ordering::Relaxed) {
+        if self.is_available.load(Relaxed) {
             // SAFETY: Since `self.is_available` is true, data is initialised and has to remain
             // valid because the RCU read side lock prevents it from being dropped.
             Some(unsafe { &*self.data.get() })
@@ -161,7 +166,7 @@ pub unsafe fn access(&self) -> &T {
     ///
     /// Callers must ensure that there are no more concurrent users of the revocable object.
     unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
-        let revoke = self.is_available.swap(false, Ordering::Relaxed);
+        let revoke = self.is_available.xchg(false, Relaxed);
 
         if revoke {
             if SYNC {
-- 
2.50.1 (Apple Git-155)

