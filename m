Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA95352039
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 01:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017575; cv=none; b=aeylN0kIiycOmcTBURMVv7WMtItqsEtJwRunNQs8HVlq1JO8QJ0qHq4c4Tj7fUlKl66L1IYG6ZP7j81fa16J/ychnaRSy3EWK/X3XERcFGcB+0ztbFiO/sHevzZQYl5U6EvxrtaWIAAAdG+EK5dAA5PahZL3npr1fCr6AnaERj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017575; c=relaxed/simple;
	bh=9+5tF0J6/VIAoz29m+zdLF6hSRtmeSnELRVfUP1Q47c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=spZVheCXjIhNexc4dWZA8ayF4HJucXM1kTr/wZIszICGCf2zeS4gFU/6FnsYMNWEplJb+fkpcg4q0Mg/p1bZDwxPL6gZ8WIWgWqZRm0GCAa3wjX5GKefPO4L7tjuE9pzcyZ7WpsC+L8gAA6CmxyaeiK1tZNB33k6uBel3LSUJRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4S0loMQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4S0loMQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-83537a80ab6so9476030b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780017572; x=1780622372; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIjpzaojjPAZHKihdp6RPFa2Tfe6qCRbgRVNDw+LS2c=;
        b=h4S0loMQ50rxVdUCadzO/8AKEv8cRbZkXW02Xok2Adjt17yK/wQ3GrTbR1D8D0Wph0
         cu4wTR2J2o2MxJb3RCQALxAUYY0BJQd7cUAzKw6msD9Pic9pVMCEpqttxchAdnNzdei6
         IXhm0YNWGPsPH99ZhpEp3CMSipxgT0JWk06y1FqYfv+8UZ2l1MPfC4IO2ZF8iMiIeHKW
         NKvmUbTkAncAbJyy/W6N+QXQ6zaKUwOBDSYIlk+8R8bsbTgBksUIYeSmsWg66bRqn/GD
         hYmSbYHkMS5Rmxm4SzlM0drZRzhPqFRBs+gOI7ytDsmOa3fnLunugVGqWlDwLY234ofZ
         gccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017572; x=1780622372;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIjpzaojjPAZHKihdp6RPFa2Tfe6qCRbgRVNDw+LS2c=;
        b=tRgrWcKspRDemKmeZi8om9kRjJRJchIcIrIpVz2Kj/pbVkOTCBEfyICJeVAzMRgdpV
         bMKk0e795I4oMNXZ/YLyhslMm2EYi9ACDg76t175fMpa3q/CIXKV7HldKNabP+bVd2vm
         lV57f/aW4SZCmVofk3DRyWcKREl7eM/Q9g3TOXmsviPTun+t43C1CSg+FKNA2/3OU5yd
         suEv0Mc/9v38JOgHwFi0txIhYMcdqk+cVKIi3LlNjqnq01mpatIiFO93v8zUVUmnNc8N
         R6P9Jwc3A5VsgtA/gPv0pqTzhmyoUpycZrvnHXJG7EbK4LxT/Z0ApAt539DgXaHwX75O
         FyRw==
X-Forwarded-Encrypted: i=1; AFNElJ9smADtoo6bkPLkiLsrkcNtHMNj71wt/s9t57rDGYOK5DZpv5nrGCgc9OaQTSo9NOvOoMElJ8zacHGuWHT8uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzydhZb0aiq/TiA9pJTGedgl6R0PdLxeZB8Xc7Msi5LTLoNYMCh
	1HrLS3nq+7wSVQCefxJ5IFRGoxHovT6xo/uPoK+FVuI/f2nyHPtB91gA
X-Gm-Gg: Acq92OHBzebVRMQ8z/oj9+MiTgiNQqrPsG7sFqeLtNSrIvqjGo1/YPYDMMb8o5+qq0Q
	+no+FFkPtQ5zWOUeGwWZ4CXf9malli+erczrx4TL2LlvilXZzYjllouxMsQryGWsOCT2Z4qLoWs
	tvkFBNRpZp8/QfRwybtks1rW3YaO9kfRDCIU1NjzKV919E5vMKs67S2mcIL3cMoN/wZcgYgAYWj
	QokFOcyZDWgcYYAElSbLINtvEs358QAqZwKxc2ue2pju42r/fPkErltOIGOvcpBPrSz86AIGi8H
	/DenUcWXinVUsGvy49+t3jnhKX9YV6bqXouG++v6JIF8AIfy4QGPExmvsmkHwv0eSkFo4/KkVXJ
	jFP4F/ikYbkPOGZQ8kA9TqhDUqH8Y996dz1Kn4q/vKxAIL6TpRz7cGpQVKAq2K/SR3ITK9a4nzY
	/N51/SZ8mz/bs99t2zXZ+49XMGWGs8HqDldgUy1+efgskM9eyTKoWnSg==
X-Received: by 2002:a05:6a00:4f86:b0:83e:2c38:f5d5 with SMTP id d2e1a72fcca58-84212b81ad5mr662298b3a.28.1780017572235;
        Thu, 28 May 2026 18:19:32 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cec0d9sm35920b3a.55.2026.05.28.18.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:19:31 -0700 (PDT)
Date: Fri, 29 May 2026 10:19:27 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, cmllamas@google.com, aliceryhl@google.com,
	mo@sdhn.cc, wedsonaf@gmail.com, Liam.Howlett@oracle.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org, imv4bel@gmail.com
Subject: [PATCH] rust_binder: use a u64 stride when cleaning up the offsets
 array
Message-ID: <ahjpn-3WQTywTdyj@v4bel>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Allocation's Drop walks the offsets array (binder_size_t = u64 entries),
cleaning up the objects, but it used usize instead of u64 for both the
stride and the per-entry read.

On 64-bit kernels (usize == u64) this is harmless, but on 32-bit kernels
it walks the 8-byte entries in 4-byte steps, iterating an N-entry array
2N times, and reads the always-zero high word as offset 0, cleaning up
the object at offset 0 N extra times. As a result the referenced node or
handle ends up with a lower reference count than it actually has (a
refcount over-decrement), and binder's reference accounting is corrupted;
for example, the owner can be notified of a strong reference release
(BR_RELEASE) even though references still remain.

Change the stride to u64, and read each entry as a u64, narrowing it to
usize with try_into().

On 32-bit ARM, when this over-decrement would drive a count below zero,
the driver's existing refcount guard refuses it and fires:

  rust_binder: Failure: refcount underflow!

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/android/binder/allocation.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 0cab959e4b7e..f4ffc57a8cb2 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -251,7 +251,7 @@ fn drop(&mut self) {
 
             if let Some(offsets) = info.offsets.clone() {
                 let view = AllocationView::new(self, offsets.start);
-                for i in offsets.step_by(size_of::<usize>()) {
+                for i in offsets.step_by(size_of::<u64>()) {
                     if view.cleanup_object(i).is_err() {
                         pr_warn!("Error cleaning up object at offset {}\n", i)
                     }
@@ -412,7 +412,7 @@ pub(crate) fn transfer_binder_object(
     }
 
     fn cleanup_object(&self, index_offset: usize) -> Result {
-        let offset = self.alloc.read(index_offset)?;
+        let offset: usize = self.alloc.read::<u64>(index_offset)?.try_into().map_err(|_| EINVAL)?;
         let header = self.read::<BinderObjectHeader>(offset)?;
         match header.type_ {
             BINDER_TYPE_WEAK_BINDER | BINDER_TYPE_BINDER => {
-- 
2.43.0

