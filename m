Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5210643D4E8
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629804; cv=none; b=mLOtYV/bbIvo4VXLRxoMm/cM+3mbzRfCsB8cY7OBOWZ4WC2OOhXJ/KuDql4DcsPlDN7uxPh7vNMwjz+oSKa3HoQnwfXwHrRc2fSjN4ayekIm9tjVrycicdjkBi0dbFGd/YgtEytxVjt/HqZmzq/3/4T4Dztfj2Y57qToLHW1i20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629804; c=relaxed/simple;
	bh=XkJ+QYOMqSq/GfDKueJn3bt3LHJRt2w9rmS1zxfVKDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHOooBx/nqRJgyI41Df5vY/BrFnQzpXOmkN5jikulGAMOhsd3bMIGU+sltGlit0hZpR+uf+83wzrr6GdokJ6YlgVy+Ky5ooVh7uxFcWDEAC2TFgORFPZxpeoURkbSv0+lystLotFxWN2gKdfocJHV8wXg3/fiCpc40qJnypurzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVUqTYKA; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVUqTYKA"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7fdeab38240so5307987b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781629800; x=1782234600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Os1HnDVkJjYg7iFSDHrla1kiV+DW8fRuw2Er3Lo9eas=;
        b=lVUqTYKAC2ES5KPrEWoho2/JH+oK6EA5734piw3/t2gnarSUw/Oy/RXrcejY/gGsMF
         CY9r8jU1xQ98NnTJTcuEebbOP3JU/2wrs227WIk8RhcT/tHq1w08JHzSfvI8dwaVPf1O
         VRTOwBrCUXINKr+XFFc/baTPdVgrrN852Q35SxTGYIRh4O745R+MBCumR9F2T+ek+Sno
         T5gyRfLk7gzWm7MDJJSetnV8RBb++wYRQHkRVNPYZ2SDP/iwBopfOkDDM87HEOgMmqd/
         3Yn6gIoI+MhJtJLwVOoB6SDilrqQpI/2zEElV8aV2pFxK/mgReUEBtiXr2sbTkLinw4n
         h0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781629800; x=1782234600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Os1HnDVkJjYg7iFSDHrla1kiV+DW8fRuw2Er3Lo9eas=;
        b=U89RjdXlccAzgaduNLFkwfu14rgrZxAKe5njchBry+zuzAjOuENp0+bJJCXh5/rCE+
         +hhvPtrAwbc8oDS+iE13lcEuDSkpolzcatG2/gM3rwxO6hcMMId/i/3IkS6H9Yazd58O
         TU/pZ+0hP2GSnB/A4spNFFHMx6p/YZUvIcbRYwmAKdojn+wXCQCjyaMsM1EF7dsgXxt+
         eBZ+dKmkVBWe7Cxh87X/PwAi5KcEWqoe2q8TKXC1IgBu54/+0y7a5yxJ9Qv5PiiVBqVc
         PVqmTvsXB4gZ++wCnMgkzP1RfHBbKEPTykFQEMZZG1KWpNSOrN3Ze/XYYnOPb5sDz3rt
         1b4Q==
X-Forwarded-Encrypted: i=1; AFNElJ88Ltt2BlmvcOpkJIo8SxDUNoI43Ozsf+RMys87eaeUvJZpKb5XKdYK8Gs04KLlxXEPXAecVXgmhCFw/z8k8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGouR7axlYlqKkgrYJpTG+YCRikBGofEzPB4devj+yY/2uKELV
	jkI8m4OtWxRcjADZQKHgboRLqnrl+SpCqWs0YqjVd2XHlcHoliW/IhBD
X-Gm-Gg: AfdE7cm2xp8gZwGExHBIojFS+jhbUW8sIPwSiaMqMknyCSg4dpd8Z598xXuFT0n5r5X
	VVc0IGBs3iEj4VSnw1OEIi/0oWbnY5AbGtS1cj6ox5xpf/cFJOTaOXIZ5m6Hs1Zke2maZfNahvk
	d+wk4N6BAyMRne7hSQOK/1kYEnZTq5WXTM05rfgTxS6ZRNqU82EBFPx1j/WCQyNKTyUY9usLj/w
	eO0PARbC1TYGvjnmapiMzjqVvhiP3xlWT1hoYuLjyvV38p59q1ud7/NIH/UH+mKND4Cu7Rzd6qe
	2HPouukfPgQ6MmIeicznfL8RaLowiYBhBSe/rT/qracTeaPt1hd8RrhkGWo2jBZNB7seVniGppQ
	hE0rcpp2TV1g99ZFvJYl7dVwETvZ5wMZAE0QU6oapDIfMSvDDHs0XEhMXWFqHNPgpHJ19w0tSKh
	Kwy8RL5EKCNu3aE7HrBpFEOA==
X-Received: by 2002:a05:690c:6882:b0:7d1:dd7b:b736 with SMTP id 00721157ae682-7fcff666ef1mr47467267b3.37.1781629800238;
        Tue, 16 Jun 2026 10:10:00 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7fd33743bc6sm16157567b3.18.2026.06.16.10.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 10:09:59 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: gregkh@linuxfoundation.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	paul@paul-moore.com,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v3] rust_binder: add ownership assertion to Node::add_death
Date: Tue, 16 Jun 2026 13:09:56 -0400
Message-ID: <20260616170956.2580772-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610133241.374115-1-georgeandrout13@gmail.com>
References: <20260610133241.374115-1-georgeandrout13@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `// SAFETY:` comment in NodeDeath::set_cleared assumes that a
NodeDeath is never inserted into the death list of any Node other than
its owner. However, this invariant is not enforced by the safe function
Node::add_death, which inserts NodeDeath into the death list without
checking that death.node == self, leaving a risk for future code that
may miss this implicit invariant and cause undefined behavior.

Add an assertion to make this precondition explicit and catch potential
violations early.

Link: https://github.com/Rust-for-Linux/linux/issues/1237

Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v3:
- Reverted to assert!() following feedback from Alice Ryhl.

Link to v2: https://lore.kernel.org/rust-for-linux/20260610133241.374115-1-georgeandrout13@gmail.com/
---
 drivers/android/binder/node.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 69f757ff7461..20eaaefbd4cc 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -333,6 +333,10 @@ pub(crate) fn add_death(
         death: ListArc<DTRWrap<NodeDeath>, 1>,
         guard: &mut Guard<'_, ProcessInner, SpinLockBackend>,
     ) {
+        assert!(
+            core::ptr::eq(self, &**death.node),
+            "attempt to add NodeDeath to the wrong death list"
+        );
         self.inner.access_mut(guard).death_list.push_back(death);
     }
 
-- 
2.47.3

