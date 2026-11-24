Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795532685;
	b=5D1KsgppY7pU0RS2F+vfHOXtnGKAGeCL+dd/+LDl9boNE69JzRlLgo6q+xS7msiH4XD1
	 Aj/aFS2RBl+eeKVVEiX86Wv/ut1/dQy2OLSA1LChNKQwJRouUbc/fU8ENuARCOQBmoaV+
	 J09A/YUSmEWs+ledF16JFJaKPSFb/IfpR00dLW+JtKLJ5zZYuGGkhqGUMHk4wxITuJlC4
	 t8GYmFTvmcqCW3CngAbwrBDoZuPlHcjjD/W3WWOP+N+n1go0u2Y/37EHtj65P5f1r+wfS
	 nBt00WDVBRhdvVP+1ELNXsbzxXEkhi86knh4qFuQWcJch7w30JNKr/WnQBAMxSuyC/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532685;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pQG2u7GpihDLeHJtDCHNqVBOqAGAO0oSaKsE49Jf8SQ=;
	b=oG5YbybWkXgjtgxRgs1dLPNSi7s98RDHAaxhUAxSgcPfUgQTo4VSd7P5sNd0Q/vq5ZOZ
	 eUOXLxtbLCuswrNgJZg6WLrFmQ3+YZWf/fyet7CC2f8AsHmu9L+akZovBAk/XMT/Jf5mZ
	 0peq9WalrlgDy1CS0YnzKVP5OH+rIBFpBMKVXZZN0eNTOA5fGqE5nIZrofVmRowNJLgFA
	 8W8JXh1mqbw6oLNET/ld4Y1DA3EXUwbv9mJk+jeDeALKikqf0ofkDukQo9/mLtMoYtGsu
	 /gY49ID+IYMZkbivh4G+uSuNrjbRXUIkQ2z6DJvBFQHzog6GZ5UDntGKc7AqX6RuV0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4S1M44s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E09606A321;
	Tue, 24 Nov 2026 15:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F4S1M44s
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795532685;
	b=Bt5xqTZRQv8bVn/zmwNG6D5qmjC1KwkSw8+b9r3WPCinvarsPtx/Dg5BXUBpOZWjq6H3
	 w0FuHA79eTsFBfe2eDYP7nzsDU3a167WzoVv0zObwROAQCh02lfgMWTaaEnr3bUXnrbsv
	 euPnuJlWRj95nh0EQlAZE9tsFqzH//PZzxFOaxn+DVJSy9NhY23zmaGAsHcMQfF3j1puJ
	 I38hR5ibVewRo9jmWJ0jS5bs6N9DI1+29yEz4LSpGA630QVzRHYavvRgH+6P1hzkZROZL
	 KB12XyZ/kE09jK4JASXH2M3hye2EDo5BgfICe0eLFudmx6CE+Bu1Xyx1Y5pIlY4K68A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795532685;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pQG2u7GpihDLeHJtDCHNqVBOqAGAO0oSaKsE49Jf8SQ=;
	b=fkRFOCY8Zrwlb+z2TJ+/Z19C6PvTGiubPbeh7jBnRZRd4gij9aiyMx87UU1iNVz33Cet
	 7qZ78nYJPeo8TODoP9eqDeapV68I3GCsJFtmFp7Dn30iwsmWxV5ZvJlf3lv+ddM3A4U0a
	 54zy18ZTXIbAp0cp3oWOt3KTi675ke/brT348RwOWBap+Ct6292okcPuctoEL9e9pyazq
	 pdObjt04FDvpSqJ5Umetgk5lqDZj50Ysyq6CrGBrcwcW/lLCfR9acWZVGru+UqhPEN627
	 QdSstX0pYN6a3uKP74rHGraPeRZthm2HFbWG8ySEQwQPocfI33fM22ct3wVtsymhaOA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0ACDB1F000C0;
	Tue, 24 Nov 2026 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532685;
	bh=pQG2u7GpihDLeHJtDCHNqVBOqAGAO0oSaKsE49Jf8SQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=F4S1M44sX1poDihMKY+TahX12Ilh/YcFN3GNLlxapEg3lPecXDL8vjhLGm18u/tWi
	 3O7fzNXnAPu3azCk+eAYD078k0kiz0ge45QJOLzDsU+CDIGpKHcmVIq6Xm7QO3bkte
	 DSRE5w2pHckJz5kyZB4Mp14ebML3fpYhz27V7ZCrm9BM1SaTzhTFiXEwTuXLpZ8iR1
	 FycBp+C/nLxK77XUCCvsG0XKvhj5hV9mvYYF+8XgD10m5/o/2leEdbXfA5K3gWPbUT
	 0OCw87mGhWcMP/aKVoqbPc2n2ceTk7fJf/BR9RUTaCT6vpsKPV1inaDJ6oae7JHPJQ
	 q4fFQ9qQ9nRRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8C3BE4CA8A;
	Tue, 24 Nov 2026 15:04:32 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 16:04:27 +0100
Subject: [PATCH] rust_binder: Reuse the thread lock in get_work_local()
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
Message-Id: <20261124-perf-binder-local-work-lock-v1-1-bd8de1a840c1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHqnBWsC/y2NwQ6CMBBEf4Xs2Y22Con+iuHQLousYCFbVBLCv
 9uqt3mTyZsVIqtwhEuxgvJLoowhgdkVQJ0LN0ZpEoM92MoYe8KJtUUvoWHFYSQ34HvUPscez8R
 lY9pjVXqCZJiUW1m+9mv94/j0d6Y5K/PCu8jo1QXqcpVx/5ene8WHRMLAywzb9gEAY4CIrAAAA
 A==
X-Change-ID: 20261124-perf-binder-local-work-lock-9ce5d1f365bc
To: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795532670; l=2392;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=k87ZI/+ha75fn1g5XBGLfDU1bztuNUMRFI6wDLR16zM=;
 b=Dh/KftYuXr4qIUN9KM7ma0M2n+MUTiROu6hg1VznFEVOG0WMQNP23FDNCR4pJeN0L5nkyaeYX
 bnX2104jrWpDe1rsEBESM0eVqI+ylB56Nq8K6Qyvnnean6aHQh/40IU
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

get_work_local() takes the thread lock to check looper_need_return.
When the flag is clear, it drops and retakes the lock before trying to
pop work for either a blocking or a nonblocking read.

Keep the guard across the flag check and the first pop. A blocking
read that finds no work still registers its wait before the condition
variable releases the guard, so a producer can wake the reader.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
Reusing the guard eliminated 4,013 lock acquisitions and 4,013 releases
on each of two x86-64 KVM hosts. Each trace covered setup and 1,000
synchronous Binder echo calls. Both kernels passed checks for empty
nonblocking reads, signal interruption and waking a blocked reader by
closing a duplicate Binder file descriptor.

OpenAI Codex assisted with coding and testing.
---
 drivers/android/binder/thread.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 54a208caebe12..8efda6e9ded1e 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -549,20 +549,17 @@ pub(crate) fn has_current_transaction(&self) -> bool {
     // mangled symbol names.
     #[export_name = "rust_binder_waitlcl"]
     fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRead>>> {
-        {
-            let mut inner = self.inner.lock();
-            if inner.looper_need_return {
-                return Ok(inner.pop_work());
-            }
+        let mut inner = self.inner.lock();
+        if inner.looper_need_return {
+            return Ok(inner.pop_work());
         }
 
         // Try once if the caller does not want to wait.
         if !wait {
-            return self.inner.lock().pop_work().ok_or(EAGAIN).map(Some);
+            return inner.pop_work().ok_or(EAGAIN).map(Some);
         }
 
         // Loop waiting only on the local queue (i.e., not registering with the process queue).
-        let mut inner = self.inner.lock();
         loop {
             if let Some(work) = inner.pop_work() {
                 return Ok(Some(work));

---
base-commit: 917fcbf033154a6c8d83cfa6c88f012b71eb37b2
change-id: 20261124-perf-binder-local-work-lock-9ce5d1f365bc

Best regards,
--  
Peder Bergan <peder.bergan@gmail.com>


