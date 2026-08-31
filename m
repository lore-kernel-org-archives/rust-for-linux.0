Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE23D35C696
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 05:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154015; cv=none; b=QFgKk5XLnl0eZZl7rVe7/wES8msqIKslku1df07gcPGMkRlndhe6xMx6QcLZ16l+2BgI58qdI/qBsdb0ecVXL9nZkfjpjqQwxxjHwkKuXhqMkioqbWHm8Mgho80r8DinA5pdyS0Z8OIACC9vCe1UkzqWgUZaHsYEj+ylWWPdnqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154015; c=relaxed/simple;
	bh=yaCPKmrS/9NPR5VEMkALI0bq8i+JN8UC58RcBpXumdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VUsxmWxgjvpfgU26oXbZDMRKuH0qyHUzIFyzrdo3d+J11vY2ouwFw41nT53hycdbqbLvuvEw1TAeot/OGpBeSzKLpRY1QoH0DLmNM5SnE6rkR1JfrgTmljQ6NRjpxCyIEM/Dx7ncOjiVVejU8m2JdjuFfz7vNxgeFHgwtyZEq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbIz/urS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbIz/urS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so29068165e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Aug 2026 22:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154012; x=1788758812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn2YXo2p6aZBKHPFyNwPPOY+eiki/TgtZlctXUmhiOU=;
        b=VbIz/urSFkAVFcyz9uskomSLrsRRa/J5sHqSu1AHMZQxmlJm/wCLw8NfrOTXs+LvvB
         LI9v1/duGn/6VIGFckGyVG3jU/86d5jzXXEySe0iPH/Q1Antzel03vlxihahohPsr3aL
         NljZiq6kNJNshqPE+h/g6zqLSmqo4UFJH4pkQQgEMDPAAanYsMT+eryR8aE+iAijaczi
         QwKU1RRuCqdcVVx5xk3y2BWCt8qU9Gh28xbF/yas4wl9FTbYxH3AcbnQjoGkPOBLf4pj
         JbPkfJd6e922ZqglQgZxXOVvVwKOhTfymhlTU2mhRNP9w4+t9P2vXFRiNfRzd5SjPEEQ
         Ew/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154012; x=1788758812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn2YXo2p6aZBKHPFyNwPPOY+eiki/TgtZlctXUmhiOU=;
        b=TEC/M55rkqqKGdXV+syhMdZxuPziw76mBRO6cxX01n5PM3uxrLDI/LJmira6pACmtu
         zfBQsd7CRU4UzqM1PiNmfSb6AZTGBBGoSijoqgGtjeFmNqFiF/6hvT/skPGw11Rx4ueA
         0eHWcZZK73bAfzRjXVttJwSD8I6SbKhVNbkwbIjsb25vgII35qjwXPdvEjCYMSEG3vYx
         9xPjo5462RMsNK628WwyxUQrHSbjXi8MVNxOnuX5W2KSS5M8yXWS7nWk/mOG7nWd6Tgd
         Uu6RafSUXX7kmCvcLfE1ANwakEA57h8/G1kpTJfalynhR1AIQ0QsCHgAS0Mi6o7n2b3T
         yvlQ==
X-Gm-Message-State: AFuF++m5D0/IazDUVTQsIECpOGHZNKULw16Q0Twrri+E7imZyLcIhoGI
	Ghuuxv9o3n04yz6VS+YTD2DeN0dOWCEySWs1P6XkK0E4Rp52804Idqjg/IyCeTTl160=
X-Gm-Gg: AR+sD13KTKx3Y7uLaPRTG+65GVzpgPeViH428NwECVgeZH9eH2jfqqiKsHpf8P2ZVyF
	3ii8s5r7XqrphP969TOX4jPCLO/08Ly6lqtEcPXiauuuWH2MJut559X+Aw7uP1gQO6RboRtnvuJ
	ATTjLno2LUGCEEjo54a34EpBWI0pAcYEVHse1v7BE9itBrxoWoyv6KYTYAnr9D4GHScg1UAY7kj
	5r1he/19iPUwlmoI2YZOIQBuW7BLqzXFS2zPGaBfhqWvIn/WP4uz8UP/Zx5KbSoP3wExGLyS+ug
	i4fLi9ZF9TXUMLP9hAKMG7CkN4sofmEQJ9YCy37houx9MI0JIrFjwt1wm6dRKAwj9JMnk8soJDp
	yLxta2xP8134eV5UvVrQY6rFLIMFLuIILBKAK20boABIOTCaQ2yYdQoapXqr+quzHZieuuCYc3k
	w4uUEW3BQi4TEPfmCFwrZTGS6UTm9ItO1vTrvn8rJ+kbuLsmm/1AoTyV3ml7z4IXmJSrd2TlIdD
	Hop6Zu8Cw==
X-Received: by 2002:a05:600c:4443:b0:499:b3f0:ff05 with SMTP id 5b1f17b1804b1-49b91c56f41mr322660655e9.13.1788154011654;
        Sun, 30 Aug 2026 22:26:51 -0700 (PDT)
Received: from DESKTOP-OL07BOP.localdomain ([87.116.179.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccae954f9sm193293185e9.13.2026.08.30.22.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:26:51 -0700 (PDT)
From: nenkov2004@gmail.com
To: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	ChrisX101010 <nenkov2004@gmail.com>
Subject: [PATCH] rust: binder: Use lower bound for node debug lookup
Date: Mon, 31 Aug 2026 07:26:35 +0200
Message-ID: <20260831052635.42417-1-nenkov2004@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ChrisX101010 <nenkov2004@gmail.com>

The Binder node debug lookup currently walks the process node RBTree
from the beginning until it finds the first node pointer greater than
the requested pointer.

Use RBTree::cursor_lower_bound() to start the lookup at the relevant
tree position instead. When the lower-bound key is equal to the
requested pointer, inspect the next node to preserve the existing
strictly-greater-than semantics.

This changes the tree lookup from a linear scan to an O(log n) search
without changing the returned node semantics.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1249
Signed-off-by: ChrisX101010 <nenkov2004@gmail.com>
---
 drivers/android/binder/process.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd9..8e7218ee0 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1208,10 +1208,14 @@ fn get_node_debug_info(&self, data: UserSlice) -> Result {
 
         {
             let inner = self.inner.lock();
-            for (node_ptr, node) in &inner.nodes {
+
+            if let Some(cursor) = inner.nodes.cursor_lower_bound(&ptr) {
+                let (node_ptr, node) = cursor.current();
+
                 if *node_ptr > ptr {
                     node.populate_debug_info(&mut out, &inner);
-                    break;
+                } else if let Some((_, node)) = cursor.peek_next() {
+                    node.populate_debug_info(&mut out, &inner);
                 }
             }
         }

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

