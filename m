Received: from forward202a.mail.yandex.net (forward202a.mail.yandex.net [178.154.239.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BCB38838E;
	Fri, 13 Mar 2026 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393920; cv=none; b=edj1Mse8THmCmjrjvRGfvgUYevJ1gRy/GK88ZYg7Q2da89c2XPTSZ+7D9mIh66O7PeJZs5YymtZNItFHEl1pWWh+g6UZ66giAk0ImSi3i3mWvUo5tSZVqpyB4W/BVCLiaLqbyykBfL6yutQBOPJhJ3jOSDk3n8Vja/RaQvFAzHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393920; c=relaxed/simple;
	bh=rvm/cuYhtXHic2YIzGwAshEiwloJulsPUxFUfu0WHmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkMNOjgp4xrTrkDM035wRoWwBtK5h6dNxRIb3F8ZEjRITcep+Sc40/yQsJd4hSBbJP1dsE2b7F1Kup5PLaKRN+CDm1XkFYTlRfTeCzWeIS36uDpdC65JY9TJH+IlCbgq9oPkUtufOIPi5mUyYOAUoQwrHVyvnt5kXUgMa9ntZg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=cPa6NVKt; arc=none smtp.client-ip=178.154.239.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="cPa6NVKt"
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward202a.mail.yandex.net (Yandex) with ESMTPS id C56ED8B939;
	Fri, 13 Mar 2026 12:17:58 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:571a:0:640:23e3:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 6AD42C01F9;
	Fri, 13 Mar 2026 12:17:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3HEusrTGkmI0-oTA9aIN3;
	Fri, 13 Mar 2026 12:17:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1773393470;
	bh=296Sx8eOcmyen+kU5beNbjuR6rH7VCIG+e4tSjMIXSc=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=cPa6NVKt8iG3PHz9TchJYe5y1/ot+M2RswBlrdx3pkecqLo52GUn6vMSBfRaCZySv
	 QTcpW0qyH4BvsRmVCynJhslr1lX03YTJZwca6Mbo6CxpSG4PUpeq0Cs8fZEcIeaWoa
	 NbFMDBftw67jzg3FVB44fJSQKT1Gq1jkcwL/Xt1U=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v1 RESEND 2/4] rust: add Work::disable_sync
Date: Fri, 13 Mar 2026 12:16:42 +0300
Message-ID: <20260313091646.16938-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260313091646.16938-1-work@onurozkan.dev>
References: <20260313091646.16938-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Work::disable_sync() as a safe wrapper for disable_work_sync().

Drivers can use this during teardown to stop new queueing and wait for
queued or running work to finish before dropping related resources.

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/workqueue.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..6acc7b5ba31c 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -530,6 +530,21 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // the compiler does not complain that the `work` field is unused.
         unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
     }
+
+    /// Disables this work item and waits for queued/running executions to finish.
+    ///
+    /// # Safety
+    ///
+    /// Must be called from a sleepable context if the work was last queued on a non-BH
+    /// workqueue.
+    #[inline]
+    pub unsafe fn disable_sync(&self) {
+        let ptr: *const Self = self;
+        // SAFETY: `self` points to a valid initialized work.
+        let raw_work = unsafe { Self::raw_get(ptr) };
+        // SAFETY: `raw_work` is a valid embedded `work_struct`.
+        unsafe { bindings::disable_work_sync(raw_work) };
+    }
 }
 
 /// Declares that a type contains a [`Work<T, ID>`].
-- 
2.51.2

