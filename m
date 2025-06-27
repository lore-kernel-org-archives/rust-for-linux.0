Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756262676D9
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027956; cv=none; b=udArT8Sm64pUCSS5JnSr1IHsjf8K/0YDg9dCA97YqozlzZ1ASIIUHAHFqwWuAiGj6iEsxNYSytqF/wcKnNUh+ezf1fcNAOGxRUuCqdEjbwp4hQbkvHHt/NalQNhKxkWGF3BE6hPxgJpfZP+eR5QWpCEfcWgRI5dPPuDMR1vM3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027956; c=relaxed/simple;
	bh=JE0fbYCVQfhoNvqRMtSNQPr0HOaCdA0SHkGC5HCZaWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=dT/3RefIUhXmg1VufQvnozdFzJWak7Xwvd9+Y9I6htdicdQJOPO2yiwgzLATNn4/WeQMenbYTNTpWr9GMEBdYgfDDVSV+OD2ZkUq+/YZpP8mP2v9Fyg0RC2PdoE8D4RCHMmogZW8aAY6cGZFR8ee4qj2Zr5/jbO/Q7pmeYbeKGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1Hiw392; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1Hiw392"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751027953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8DYuVG3WR19JLL/U5qiVW2XDLvRqb0poGxi7BPvVraA=;
	b=f1Hiw39214lcTMf+STjAOyii75yGHCzQdWqxctKQK6Y1tMfpQO+jlbtfUzWg55rd3yZYEt
	dIXFDS12i7+Dv/6i8CfinZXVSGbkqRrujmAnkcDbUEC5bkCAUmGAJI5kyR91OijZk0rzpV
	FGKr6g4PN06sD7jG5SGlCW5XLLOiCV4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-222-ETJ4gQI1P82S1oTDBeJ5Mw-1; Fri,
 27 Jun 2025 08:39:10 -0400
X-MC-Unique: ETJ4gQI1P82S1oTDBeJ5Mw-1
X-Mimecast-MFC-AGG-ID: ETJ4gQI1P82S1oTDBeJ5Mw_1751027948
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BDC051801215;
	Fri, 27 Jun 2025 12:39:07 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.209])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 17C02180035C;
	Fri, 27 Jun 2025 12:38:58 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
Date: Fri, 27 Jun 2025 14:38:19 +0200
Message-ID: <20250627123854.921704-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1jKJIJCA4v00fMei66yAeWRhs2mPS8EZAFAds7FMACc_1751027948
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

On 32bits ARM, u64 divided by a constant is not optimized to a
multiply by inverse by the compiler [1].
So do the multiply by inverse explicitly for this architecture.

Link: https://github.com/llvm/llvm-project/issues/37280 [1]
Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index dd55b1cb764d..774a17de4f2f 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -381,6 +381,26 @@ struct DecFifo {
     len: usize,
 }
 
+// On arm32 architecture, dividing an `u64` by a constant will generate a call
+// to `__aeabi_uldivmod` which is not present in the kernel.
+// So use the multiply by inverse method for this architecture.
+fn div10(val: u64) -> u64 {
+    if cfg!(target_arch = "arm") {
+        let val_h = val >> 32;
+        let val_l = val & 0xFFFFFFFF;
+        let b_h: u64 = 0x66666666;
+        let b_l: u64 = 0x66666667;
+
+        let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
+        let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
+        let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
+
+        tmp3 >> 2
+    } else {
+        val / 10
+    }
+}
+
 impl DecFifo {
     fn push(&mut self, data: u64, len: usize) {
         let mut chunk = data;
@@ -389,7 +409,7 @@ fn push(&mut self, data: u64, len: usize) {
         }
         for i in 0..len {
             self.decimals[i] = (chunk % 10) as u8;
-            chunk /= 10;
+            chunk = div10(chunk);
         }
         self.len += len;
     }

base-commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38
-- 
2.49.0

