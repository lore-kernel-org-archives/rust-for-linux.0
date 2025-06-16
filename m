Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434B127CCC8
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070194; cv=none; b=ewLF7o7htkB2ilPv1/MsRIGk6Xe2tsXtayyPd+EN+Hrwz2/BFocn/ZHW12chKjpB9ypYh41s66OwRvtQgJLVzn97w7XP7kCrQV2CDIItfDJfmoSyyZWn0Eijzw9IZmW3XS7en7/P8NbWZU+T18k/21ZIBfiPXQire0GILP4Ugzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070194; c=relaxed/simple;
	bh=gVihsEkhSJhiI2pYujACptGOSQXIKNBWtFSmOiUqkgE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XjkGiqYt9uie5v4M8p2YbrZILEX1FDZzmjZyXEVfqlfGFZbPACMVYO+iaWTGBoxYGjX6AbwdwjhNjmEDR/GF9BIkTw9PtfM8cai2/CWfnpGGol96P6LYHpfvSuBMzMtjP6vPa2Vm4GaFVkxNUtJ3+7vaoHIuTMySdadkhDoIytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xM9x0UWW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xM9x0UWW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so25853725e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750070192; x=1750674992; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hiss5ihr37HezsXrsEfI4Lz996ZbeuImgyLoj8wVpjc=;
        b=xM9x0UWWXLfABeK0u4U9d8SR6Buse2VePv6z45sPsmxV93XT85WR1nU12JUsvx+/ff
         04mNNhOL7E4rkamOv7+HbyaMv8iKzhiKn4rMaI9cuoqMXOieY+uBveTTBtSpGBIqorpC
         Klzl+iqUxSW5+MZ/0Y1qoPU6jd53OVms1pMYpi8V2lZd4OrffjB9bS0JXcezJuLsymrr
         DUTXTtN4NTAFESmng8T4vu1Lbi0n9JZ942VzuhBWFGGfjxHQBUEvYz0zgTScyTIKX8vE
         nsyexOXxVTXccH4Z63PeGavfRb1iaB08YclI/b/+ddBlJ0dcWy/qUczeX/t3Yqr2yqbe
         yWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070192; x=1750674992;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hiss5ihr37HezsXrsEfI4Lz996ZbeuImgyLoj8wVpjc=;
        b=Kq36/kSW+4xUe3tLeIXoaPvKPMX0sn3O2PcqzbsEkMZzoJmBd20Gsuy2h9/T57lQ5q
         G0xoAO9ZlYT1bc5plXws6IwPL+2L82HBhl62GvBcXCAE+ZJVnE+NHfhFJ3kdeBRYhKZT
         6zW/TLWBXijLaaPJ1APQF3ERdLFo9ghk+SM7/OZXUFg0s/qtNPvzGbRoouQD2mbGra0a
         Oa0T+oBgAxwUuRNNu/pTOx9/+Kh8HXXm+VtCuzNOFLQk70LkVFFgV6Em0S1IM6GgUb5N
         digpvXTAAIjZkkcNE2CCMGw4EoliRrY8sAKGy+gmVYIIZZ9HvhJZ48qZqYrS/9GYREi5
         jxog==
X-Gm-Message-State: AOJu0Yy4H64KTN2Pd477hD6vCDszTKX8uRKpj27Xis7n8EBxQx5iwMJ5
	1pDTi0r2QUKmzKqBZo5EzMWiEp3XrgGQ6QkAJX9/fdVCopAI9TXryt0OtYKo1SuajlVv4qsrRkb
	wkEsicugNF0JYvMplTg==
X-Google-Smtp-Source: AGHT+IEe+NGRwyzIVBGaOXJd+JjEOsMuYq2wMo43vhSk6WwVZAZFAeSvsdAvoGMLbOd64OXop7r7LShg+AbCX80=
X-Received: from wmbfa7.prod.google.com ([2002:a05:600c:5187:b0:450:d244:bd2e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c12:b0:450:b9c0:c7d2 with SMTP id 5b1f17b1804b1-4533ca8b101mr82056445e9.11.1750070191808;
 Mon, 16 Jun 2025 03:36:31 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:36:21 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKTzT2gC/x2MywqAIBAAf0X2nKCCkv1KdEhbaw89WCWK6N+Tj
 jMw80BGJszQiQcYT8q0bxV0IyAu4zajpKkyGGWsctpJDoWx2ixxPcotTZusTjEG70eo1cGY6Pq P/fC+H6K2N5hhAAAA
X-Change-Id: 20250616-rbtree-is-empty-28f51fccb99a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gVihsEkhSJhiI2pYujACptGOSQXIKNBWtFSmOiUqkgE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoT/Oogfg8E3752+/euiuXrXoPJHL0ZgbsNy5x/
 F1qFs7ZlvKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaE/zqAAKCRAEWL7uWMY5
 RkMRD/4iLYBvlMGfISSHIit0SZMEpEPRnlDk9Ek63xEsF1Ec31pyvDYMIJzSDitHUd3YD9ZI6TM
 cfJqGzx8ZsmrQyBf46GYCdKt98Gkycu/llmGdsEQwl7lY15KlWErw3vgS36yVpdKY/XQBwT/R8S
 tuKHrathiY0tps3WfcCg00gPaxLH4Eaf6WjLJq0VCd/3uHl3fP3OBtr4rq0LXGIdalsKBl0Hslk
 NYEnKpmsjCV+IcRcNgJf4NAFIDCeqgCZT9GJkPwwm/o90yYd5iHwFHr/nTt8GMYWgrWpx4sRR5a
 yfNfixnw9cgxkpSnOWERJqGYQ5dDJTZsrSQ9krUEf/H35aEmo9wN0uggxHDm47QOgnRorIRKLuy
 srlaPd1pWhPWYyXu9hAaMRP5ITMh7uI1MZYRYjHOqUp8ycx3zZxm/rTfLy5GhV/D12RTGeBompS
 etDWclOtQHxhHqwS9DfdaIhC/+Q1Dom2tt56NwCgEGPvpPf/1PFNhmxbwLLwL1uejJn7/v03qVk
 ciBKx+/IwMxhfeEAJsam+Q5WESZ+ji8cpa+PltOZrCBrjwM9+rQfg68O9M9SX0Wflze5AT3wVsy
 52WTDCfYmZIMvDzU8XD9PUbp4wHrM/4FeTDUI/Ri3NbPDmStLb9GGlM6zn0RAz635lv36qNOIDh Iv/HGtUgJMH3qeQ==
X-Mailer: b4 0.14.2
Message-ID: <20250616-rbtree-is-empty-v1-1-61f7cfb012e3@google.com>
Subject: [PATCH] rbtree: rust: add RBTree::is_empty
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

In Rust Binder I need to be able to determine whether a red/black tree
is empty. Thus, add a method for that operation to replace

	rbtree.iter().next().is_none()

This is terrible, so add a method for this purpose. We do not add a
RBTree::len method because computing the number of elements requires
iterating the entire tree, but checking whether it is empty can be done
cheaply.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/rbtree.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 8d978c8967475cc2631b50721798f7e8cd1551fd..9457134eb3afdf7a214a28fcbe2e6b8065cc9a86 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -191,6 +191,12 @@ pub fn new() -> Self {
         }
     }
 
+    /// Returns true if this tree is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        self.root.rb_node.is_null()
+    }
+
     /// Returns an iterator over the tree nodes, sorted by key.
     pub fn iter(&self) -> Iter<'_, K, V> {
         Iter {

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-rbtree-is-empty-28f51fccb99a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

