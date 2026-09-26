Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C335C6A4
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444010; cv=none; b=E2gHQjln/idGN2Ejrs2f/aMczwwjtictPwxiUlwgQSFHTDg7tvs3oN/WfdFqz0tyd1UdWvLq44ST6TPU0aXUFNFSE5GIkDTG3pvJ6z1+j2q0lqPKvKgBnIwk7dEZwEI8+V2vEHBMcaD3mslP08eI5kHBo8Prf9TCzfPddsbxLrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444010; c=relaxed/simple;
	bh=homsJuCQjKnZ0xNxouQDRH+hnm4JjTgYjqEZCArzYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GM692hBNm5QDtGVlRZh1SIfP5RqTa0WCRi3tEuglSN+zgO8aO+SKe4w61pDHCfCQ6lBbmXfUk9qWKie7U6Ye1U4E3PTwpqVVOzexPSeLsuFqg4ieTWauO4jSY9MQwOczYgNEjEGroAw87+QsTUWcC8bjGPss3bOnI65bjc/AQ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DH8kiDZs; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DH8kiDZs"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so9763385e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790444005; x=1791048805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSUQA8gq1RkCRhOMqlGaEY8nMSV691WlNynGk1mNlWM=;
        b=DH8kiDZsinWXHkuLDmdFp6BNs2gcCQ3SwEmHQz366D6QpjmhArX04KpKOGHWY5gug8
         IQW6LSGK+TcWwZxyQ6lhpWhWq8JKLyXxr7SMvBe9ZnxUoFiHSIS3hM8b69QZ+t3LlwKJ
         37Gz1wYm4t2sKqde82rBY3ayLJ9cP6OGzHyHa38Le5xsfJpNmQgYrsOMZGeINICs88+3
         FCv7ZQEbRBIc+6c7s/xsQttA2mazzVU/QKZkgFvA7l/ZJ5RsHI/ALG8mhA/CZeE//v4i
         nOJT9AX+pIjLpcAohRbp5mmX4YCx1SJIoSIYmE+068fUUhGsMF0pQLt5sG7P4Tns7faF
         c7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790444005; x=1791048805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSUQA8gq1RkCRhOMqlGaEY8nMSV691WlNynGk1mNlWM=;
        b=oy0v9iReVZFpdcgSeVRy9kMLzPRRIE5HAxiphZeL7rdCuvWYKuoFih91zhyoJw8wpA
         FHdZJBQUH3LcYaHLgimWsl9gUFuyU0Zf+JX6fLX+5HDvWwJhXEE6Y3rPOnmvbAT8Bl79
         soAxSSIyR8YFPE+8nohv+fAdUQL6sv8+pFkgkrFaXq23GxdAIDzd9DxExSIp84Z2QErS
         vEE6kXfBtkB1s/jfA1A6/Sd5O93yF4f1HgcYn+VhIajANSaVJViFPek3c6sYwwG/OD/3
         dvL6NgUNIrIZCP3p9pPm8T0VUvBfCVEkTxfg0sWKJZyV/FRek9PBADOkIrj8JREBbR7N
         fPzA==
X-Forwarded-Encrypted: i=1; AKwUvBwtozuNB7y7e9muIxc/I72XqXmtwVeoM7rfQyw+pLSLXFNjk2aVuMGw6zJcPbQOTYy5Aj5G2KWIsbg93KXdWA==@vger.kernel.org
X-Gm-Message-State: AFuF++lMexEZwrrbbJK+nDjizuEivRQclHtbiEY9t73WPajXByygMH4a
	Avxbs1KZ38wlAl/8oF/cda17uvYQ/7yaxJZ+pJPoe6f2TS7D2wpjIOkh
X-Gm-Gg: AYBFou2KgCMUWy1vtcrx5Wv9TnSO8d0CqmMih6vO5qXrX5SfH3SfE3api+GIJ3HTlkT
	iu4SDDcFTwCbrqUKDxgIxvJc+PWhF6D27lCdBxsLtE4mKLocK+N6p6I7+77yqwP2RDSTPHWf8+l
	LKsxuFn0j9puUBCW9VQdzjsM91gvb2NLxrm2m3NEvLG+KOX6W0OCD7FZywR99hmvtiywapTooUt
	hmp8+Rpj3NnZVG5rI86ng0TIADQMlFB96D6JmD+aV5ogQOkFwsDxN5SsMaDNZvhYPX/Hi0lhzRh
	98Yaylqj3LqBvHnaKicL40iEdhr4vifAVkbyeZGxAGk7fRkU3mLk6rNzhXMntdal3iC9wa0iQfv
	5cn/yeX4atYsgh2qRmGZ+z8XZFE2JX5Hqyt0Nl42BU3kHkY6Zo24As6IeKrCSS2tnC0Jd/yaMYC
	NSqeH39u1NMkKatS/7zoeoEIFFGjAAft9R2uYJKuN6GCz0W4WAeWpQ3/ORcP0UrcePZNTBoj5Cj
	Nye0rioEmVT6YN5E4BuZRGXWIKl9oNX/1Wunf2C7+iSpZiC8MQhOFN3LmSh8v0UXJc=
X-Received: by 2002:a05:600d:6409:20b0:49f:f099:6f8c with SMTP id 5b1f17b1804b1-49ff0996fd6mr68193415e9.9.1790444004921;
        Sat, 26 Sep 2026 10:33:24 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm246200495e9.8.2026.09.26.10.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:33:24 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] rust: serdev: use DropGuard
Date: Sat, 26 Sep 2026 20:33:14 +0300
Message-ID: <20260926173315.56772-5-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
References: <20260926173315.56772-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ScopeGuard usage in the serial device bus implementation
with DropGuard.

Use DropGuard::dismiss() when ownership of the private data needs to be
transferred without running the cleanup callback.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/serdev.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index 17ca504b7f8d..dd43b159b461 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -13,6 +13,7 @@
         to_result,
         VTABLE_DEFAULT_ERROR, //
     },
+    mem::DropGuard,
     new_mutex,
     of,
     prelude::*,
@@ -21,10 +22,7 @@
         Mutex, //
     },
     time::Jiffies,
-    types::{
-        Opaque,
-        ScopeGuard, //
-    }, //
+    types::Opaque, //
 };
 
 use core::{
@@ -174,7 +172,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             }))?;
             // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
             let private_data = unsafe { sdev.as_ref().drvdata_borrow::<PrivateData<'_, T>>() };
-            let private_data = ScopeGuard::new_with_data(private_data, |_| {
+            let private_data = DropGuard::new(private_data, |_| {
                 // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
                 drop(unsafe { sdev.as_ref().drvdata_obtain::<PrivateData<'_, T>>() });
             });
@@ -204,7 +202,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             drop(active);
 
             result.map(|()| {
-                private_data.dismiss();
+                DropGuard::dismiss(private_data);
                 0
             })
         })
-- 
2.43.0

