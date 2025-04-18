Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682572101BD
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 16:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744995082; cv=none; b=TpucO5LeW5K64CgcDnurZtNOi9Wg5NtsgJZoKc4fOBAhL+C1qZP9XOy6N+vq58HBYET0mxI0rMAijwMrq0z+tf246e386mNfUsGesmXbWjpNVIvbs+9mzGqgPgzlnKqPELiWY9qcwyt52HTylei+oK4WUa8L9aXAmFjoKTPJxdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744995082; c=relaxed/simple;
	bh=W4azDtolEx2FB6Ye1wNRzhR79fC/vn4DDoTpF1ATYc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=mZzmPVK4vWKXdQYxEI9sQR8odUUkZNevpNhv5IV9tcNX/En5VDghEkQP+PTRm/88DmK4K5if3xCbypoQcVgRVcV2XXhmUJEErlRwfec1DNgI39cX1qMKfQEXuW6H/P952ot7NUBs90y4wWgIVGq1daWFHFopBM91dj2/8hGiGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9Rr7Ysy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9Rr7Ysy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744995078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Jc22vPjDGeO+zr+AJ2vzRyryOfSK27EryZ/lo0anPI=;
	b=D9Rr7YsyLKuqHkhubzE5OmnCcoYiNyKSN0jOLAd5N9YE0hCJjvl9GUTcTppq+MVm6NbcdV
	HPsoZ0TjW3XbJnlTVn1WKtsHs/TLWsyOG9+4bt4q8AjD/7jXQQiF7jxFAuRMtnWGDZrxOc
	Y14LLYkJoHiSvt+Ga1FiGWKrjlLZgBo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-J4wB9MzXMvi_sdC6eLbTQw-1; Fri,
 18 Apr 2025 12:51:12 -0400
X-MC-Unique: J4wB9MzXMvi_sdC6eLbTQw-1
X-Mimecast-MFC-AGG-ID: J4wB9MzXMvi_sdC6eLbTQw_1744995070
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE98B1800370;
	Fri, 18 Apr 2025 16:51:09 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.226.83])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA7701800D9E;
	Fri, 18 Apr 2025 16:51:03 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Miguel Ojeda <ojeda@kernel.org>,
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
Subject: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
Date: Fri, 18 Apr 2025 18:48:16 +0200
Message-ID: <20250418165059.560503-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9YjTgRM1ImQ_EbnupbSsPjzsXmXQnq0IY9IHGczKwwc_1744995070
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
to use a simple fifo with decimal digits as u8 instead.
This is slower but should compile on all architecture.

Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 6025a705530e..dd55b1cb764d 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
         SegmentIterator {
             segment: self,
             offset: 0,
-            carry: 0,
-            carry_len: 0,
+            decfifo: Default::default(),
+        }
+    }
+}
+
+/// Max fifo size is 17 (max push) + 2 (max remaining)
+const MAX_FIFO_SIZE: usize = 19;
+
+/// A simple Decimal digit FIFO
+#[derive(Default)]
+struct DecFifo {
+    decimals: [u8; MAX_FIFO_SIZE],
+    len: usize,
+}
+
+impl DecFifo {
+    fn push(&mut self, data: u64, len: usize) {
+        let mut chunk = data;
+        for i in (0..self.len).rev() {
+            self.decimals[i + len] = self.decimals[i];
+        }
+        for i in 0..len {
+            self.decimals[i] = (chunk % 10) as u8;
+            chunk /= 10;
+        }
+        self.len += len;
+    }
+
+    /// Pop 3 decimal digits from the FIFO
+    fn pop3(&mut self) -> Option<(u16, usize)> {
+        if self.len == 0 {
+            None
+        } else {
+            let poplen = 3.min(self.len);
+            self.len -= poplen;
+            let mut out = 0;
+            let mut exp = 1;
+            for i in 0..poplen {
+                out += self.decimals[self.len + i] as u16 * exp;
+                exp *= 10;
+            }
+            Some((out, NUM_CHARS_BITS[poplen]))
         }
     }
 }
@@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
 struct SegmentIterator<'a> {
     segment: &'a Segment<'a>,
     offset: usize,
-    carry: u64,
-    carry_len: usize,
+    decfifo: DecFifo,
 }
 
 impl Iterator for SegmentIterator<'_> {
@@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
                 }
             }
             Segment::Numeric(data) => {
-                if self.carry_len < 3 && self.offset < data.len() {
-                    // If there are less than 3 decimal digits in the carry,
-                    // take the next 7 bytes of input, and add them to the carry.
+                if self.decfifo.len < 3 && self.offset < data.len() {
+                    // If there are less than 3 decimal digits in the fifo,
+                    // take the next 7 bytes of input, and push them to the fifo.
                     let mut buf = [0u8; 8];
                     let len = 7.min(data.len() - self.offset);
                     buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
                     let chunk = u64::from_le_bytes(buf);
-                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
-                    self.carry = chunk + self.carry * pow;
+                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
                     self.offset += len;
-                    self.carry_len += BYTES_TO_DIGITS[len];
-                }
-                match self.carry_len {
-                    0 => None,
-                    len => {
-                        // take the next 3 decimal digits of the carry
-                        // and return 10bits of numeric data.
-                        let out_len = 3.min(len);
-                        self.carry_len -= out_len;
-                        let pow = u64::pow(10, self.carry_len as u32);
-                        let out = (self.carry / pow) as u16;
-                        self.carry %= pow;
-                        Some((out, NUM_CHARS_BITS[out_len]))
-                    }
                 }
+                self.decfifo.pop3()
             }
         }
     }

base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
-- 
2.49.0

