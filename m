Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FDF199949
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Jun 2026 21:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782075709; cv=none; b=Aov/iRTO+i6+BUWeAFeI+y3S3Eptnmqil6ZNCfHAmFb4fafB04Bymc40Y8c09IslAEicSeOdnGIWTIMn7kl5btRjW4ujXsplzVPUqjlvsCBNHzSDCKPUMyEQdS4ah8uxM23+ZHD/+AdGzNgYdrXquJvRwA5IQHejmMMxci43d3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782075709; c=relaxed/simple;
	bh=0TnD5hSjI2UjPKSmZ34NSIk/3tEVd+0DQKrYcC04prw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PybMT4byU44KxlymOt3R38U4WW6MxZHSPbOhnGWse/cxLFQryHtm4WtCMvDJnkoOMWInJZRjZ1C8TAZ0Haxql3ussZSts6DQmSpLj+vgUyBd0+nf7fb4YGe3fplqKFkhFdsQO4QjIaF/m//+/ZfZEpoLxOjuWhoB/JDz7Xv7tSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LI8YwR5D; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LI8YwR5D"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c858961a8efso1548543a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Jun 2026 14:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782075706; x=1782680506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVmHWu4gUHmoFVaOocuq7P9vzfoU8l1/yfPGeSQ1cTU=;
        b=LI8YwR5DcYRKzxLFQxKaeNFfWmk0oF4gBsTXp7fYV8JDQsC2um/NwOKEuQTwHsFzFg
         F8MJht893WZ4cibYole6BhAjIUEKnp+BWnukM6pMbkLklVzmW+SradXJJxbrhf6uXsd2
         0fmzViqJLd10Y/Ge1NTioC4/LJeerROsI6+Zk8RCtDnfANHRwtJ/HZWFJHjrj3jooTYY
         0YddB2GvjIT0SA+lnvlHQN1dL0TyyoBK0QoP1puIBRoR7FearRTdaJ9aPbSE4OwbCyr7
         1f8cDMdM7AIb7e1a3CKBqjs8xlBl616MCH8I1ov0hdY50CK1rEBmtrqtv4X32V+BL0Se
         NNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782075706; x=1782680506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVmHWu4gUHmoFVaOocuq7P9vzfoU8l1/yfPGeSQ1cTU=;
        b=IrS3ahbDI7y5WZZq+3hpB82Gc4NhSFULOacgjNS6Xw5NqJ6vO7wxb2HrS0z/GQAj4F
         nl0sy9fIe43k/20Q2c/Gjt0Tg450eTNfEXv9yJH9/JjCAdWtKntZV6d5rwgYs3RHGVIW
         vCOFw2I77ZQswO24siXaQHyVRacH45KnlU/qZiag5dssdg0stUdD9lJQJaQ5ZNtzTZ7i
         Y1YF6NBIwG+O3W4RMNpcUY0/eYmJtq8j138BM0zBJhcipZdI7kAw58mFUoioAI5Q3PE+
         u27LkrbpRRlYLElLTbzAQqSeNHt57q6MCTAiASoUjKTplNQTx79Wm6j5UQMmH5rOG/Lz
         kVyg==
X-Forwarded-Encrypted: i=1; AFNElJ9gMBYAMbMjwH0JyTrngE9T5bMIgTWsjbTeSwWknhJCYhXY5WCizWv1b5jNF5KO9RfY1KwlDXQjtvqupc7fMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7sGGrkbULGvU+va/N5Eqa0FUjFxvW3PnKUe159J2/v2ngYPfG
	8oVPlpH2NpFCozl5dBZ/2y1Tx58FTvdLljz++orDoNd7wDxTi8LJ38tI
X-Gm-Gg: AfdE7cn5mxPt79RcZnq/JJB9EZ2z5KsSrdoELuEhw3n+FHjCBley0cJxknCDsOVKk5C
	V55LyZGl5xCFvY7JaNWs+qpHmTaMPK6I5e/RG5ZDAyrrhbOutaB+YB2Ip/teYbpyAEoqZ6ywdGI
	StyHlBZg+R3sNXPHG57K8xat3rJ9/3G6584v1BIC4lHGoZN5PB4NzNRN/SLHvFjhg9EalaBo8P0
	BdKwP9ZDRnhHHCwTqiVaJEQhHYdyiN+SabSFM95+4h+F7leJW/IMDEv62KMK1EfsE1msUzUGoue
	QPWyeYF7mreFnqlJ4O4k6qtka8Ri67el8xkXo096U34e518MaQkDixMrvp8DQlerRAMTbdDTepT
	so5lBoGG3AK1pUfWvI/7YZfW0SOWLbIuo9cb10bLNC7/+qAJWT3jO7JAx+3y9IEFzjYTUVro3gC
	2oUIuTtk7Qv7rHoJvHGiXvP+VBDKktqhjp3w==
X-Received: by 2002:a05:6a21:a45:b0:3b4:8c3a:c336 with SMTP id adf61e73a8af0-3bb32f13ee6mr13456097637.10.1782075706431;
        Sun, 21 Jun 2026 14:01:46 -0700 (PDT)
Received: from LAPTOP-TMVMP5FD.localdomain ([106.222.250.238])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc3172827sm5017406a12.9.2026.06.21.14.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:01:46 -0700 (PDT)
From: Keshav Verma <iganschel@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Keshav Verma <iganschel@gmail.com>,
	stable@kernel.org
Subject: [PATCH] rust_binder: reject context manager self-transaction
Date: Mon, 22 Jun 2026 02:31:34 +0530
Message-Id: <20260621210134.441-1-iganschel@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust binder resolved handle 0 to the context manager node, but it does not
reject the case where the caller owns the same node.

The C binder driver rejects transactions from the context-manager process
to handle 0 after resolving the target node. Match that behavior in Rust
Binder by rejecting handle 0 transactions when the resolved context-manager
node is owned by the calling process.

This applies to both synchronous and oneway transactions because both paths
resolve the target through Process::get_transaction_node().

Cc: stable@kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Keshav Verma <iganschel@gmail.com>
---
 drivers/android/binder/process.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index d09facebddf6..5befff9cf5b9 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -901,7 +901,11 @@ pub(crate) fn insert_or_update_handle(
     pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult<NodeRef> {
         // When handle is zero, try to get the context manager.
         if handle == 0 {
-            Ok(self.ctx.get_manager_node(true)?)
+            let node_ref = self.ctx.get_manager_node(true)?;
+            if core::ptr::eq(self, &*node_ref.node.owner) {
+                return Err(EINVAL.into());
+            }
+            Ok(node_ref)
         } else {
             Ok(self.get_node_from_handle(handle, true)?)
         }
-- 
2.39.5

