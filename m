Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98033A709
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616982; cv=none; b=kXP16/jqSM/3ZVizWkNopay08ZCW7EAe+K35gGAIj8DQLYAONqRakLMy5vdMbtSwXu7FCHD8E39mYqK3XnopBZhv1pr1xzZmwrC3amgs5Fx8QHkVFEE2mx2P6f/KmV6V0eWAyvVj+naA1erIDNCnw7L3nghTfy0lG1/9l7atUXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616982; c=relaxed/simple;
	bh=znz1eMkO+eoWuuPORIL751u0DpDjzRrKVphFIAoNV6U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rQ29hV4CXELihXDqT2APfhzWnYvNjXO8BfZjQgNiyyc/jybiYi7HQciJZ3u/V4cY5oJRjc83qtw5mTsnYN8kux0/kLhmJXlDSqqYvrpgPkNtSkGnUTmwWTrgu1HDbLZasfpYDhu0jo9vxEiVT6UNqH66iP7T42DhtkrImyjIgD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hBqR7+4f; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hBqR7+4f"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477964c22e0so16229795e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616979; x=1768221779; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zDIgzvnX05pjgA4uq+hdSDSDYKaxyTKYQJRYJ/KEb64=;
        b=hBqR7+4f2RCGqx9gYMXxIBOz7Uo3qFxpRsb6ouU1nWKXh3i3g/mhMSJkWd63zbr5Z6
         lpEd/+/0D0OgGWnXXjexecHz6zSeQHj7X1BVlUSSTA9I8RuZ8ZJ/YqkRVMKejgBnOsDj
         xmttP2x5z9b3NSyuZrVIxeRINbGhjM0NI3nxHpSHJpSdiKoX3RLe0dBkSIzVpvqKxADQ
         RefVhj4L4/A8PfyMCoRb7WBUk3VrsimHWSCNrlMuX4EN1eoBOOIy++SP5+MAvTCXzeH+
         N86ud9Zvfv69PJ/YqwOp8clhQOry7U6HtCz5D8P4RdCOBmCMXyeFbxwWUD6JjAdPsN/1
         +8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616979; x=1768221779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDIgzvnX05pjgA4uq+hdSDSDYKaxyTKYQJRYJ/KEb64=;
        b=myGg9fZsTflCR2akKIoYmto2/yp/lLisW6v/9s+sUQBafFymtBGNKdB14FvqKMK9u+
         9S+lgTIxtvokO4TTSC7QSqU8MBFLxqJ8KpAN8jEZEcRTt7fE70rxzHQfFwShrl+retFW
         I2RX+HHAk/Kuci8cW5pesCZhYY37vToTsuBtzJoNXa+nKMalJYkdAMxLS7L5C46Ler9I
         mCNG3J3+FV/VEJlGh/QBt+Xi53jyve/jaMWbXJY1MJa6/REbkUfcz2KacLaSxjqLycrT
         vqtoOJYCuldpA0nZSzwL6jiJXN6cVq3730/vhqfUlceGmE62nF9BYEiYqnGhYwHH0ePy
         okWg==
X-Gm-Message-State: AOJu0YydEC3BPMDxYyVQr7nb/Ye/njlJ8WgGR/oK7bj8yvu8orNatnM/
	TZm2PGSZ/j5aTbIRuDcEq6Wnp/T4J5k02kcO/viTnAJG3YDXv/Ny8z+cKa5ugpWH65v7SD7KhbC
	FTnhf95NE5d4jVsRNp/m92s2TCPdYDSc3o7y3oSo6p6PF/Lrc5VZeu3CEpnsU9mGAYfmcyqrjUK
	xF2aj//NTKZ4smHaR/a7rk0UZgwkztT0bY4/kLt88kgGs4K6jaGKdVP9RsBrl9tYY=
X-Google-Smtp-Source: AGHT+IGOwQBnJbDKjMATxuhzOSNzV+/iWdd/3aDXm+gozWAlA/94Aw3WV2rp6v5FPDzX0gBFUzEmxvQ94WXnC3k=
X-Received: from wmxb6-n2.prod.google.com ([2002:a05:600d:8446:20b0:47a:9289:c5d8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4704:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47d6ba8900dmr109295785e9.16.1767616978968;
 Mon, 05 Jan 2026 04:42:58 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:28 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=znz1eMkO+eoWuuPORIL751u0DpDjzRrKVphFIAoNV6U=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G8QRsbM7ZhqTwDhncizZbgJxK3vCc4GcAap
 SCLty/325+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvAAKCRAEWL7uWMY5
 RhrDD/9STi/WPvoVN78zQ4124zylngHDLdegU73W2SNzf3eFvoSj7IusULeNgcADl/S7gh+Lez7
 3Ome2LWRqz2nJvG4OqJ4N19FUMK8HKnps3LfZbliwOCzFm/5xgYSFMICNpl4SCj62YyzR8ATwBn
 I2pZhUqpM7pzIuDDUyj6/I4gpFPHeV2Remdq443hFeNzZUITCGuuxGlPhvYt9GxWQvbsWYIDZ9M
 26/dqCigRL1zOaY/sv0W0BjUDhfvcYnP4GrXlFfntetsWK48Caoi9LdxW7IlqCl3ppxVIaPS4Ba
 n9qDQaaq3jxUDnyzEr+3mNeeWKhXCBznETAiZU90hWkh5UFj7fkFE5pNh9vaauVAFyQpjL4FmSG
 CI0RUrNsA3/R81XH/R/mZhbDQy5kfWEOPI++kXxKG695iqiing9SfzWGkP+luwu4Bc9HsaA4RTo
 7dc1K/bMsV7Dvj1paYTvIn08dTdc/+0CfshuLsGJhxod45mnbWTC75Hx7Fsij/sk5Z+RN2qVcBy
 redYGydHbx6gElpRDtlk+66wicgPmLid4gHLcIzkia5CBuElfYJKgmAwLtrDqfHK1qbcoHV5EDp
 RGTfw7AznBtCtk6WZE58lLIWGEk+mMBSdd+JCH0qHuFIvquyuwTO0Fte7flaNa300b5w36WjMZm dxpL6c2ozOuoUdg==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-15-51da5f454a67@google.com>
Subject: [PATCH v2 15/27] rust: rbtree: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/rbtree.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/rbtree.c b/rust/helpers/rbtree.c
index 2a0eabbb41603b0200e051ac5c091a870bd7346c..a85defb22ff7c6d5104a503f4456294bfc2b4756 100644
--- a/rust/helpers/rbtree.c
+++ b/rust/helpers/rbtree.c
@@ -2,18 +2,19 @@
 
 #include <linux/rbtree.h>
 
-void rust_helper_rb_link_node(struct rb_node *node, struct rb_node *parent,
-			      struct rb_node **rb_link)
+__rust_helper void rust_helper_rb_link_node(struct rb_node *node,
+					    struct rb_node *parent,
+					    struct rb_node **rb_link)
 {
 	rb_link_node(node, parent, rb_link);
 }
 
-struct rb_node *rust_helper_rb_first(const struct rb_root *root)
+__rust_helper struct rb_node *rust_helper_rb_first(const struct rb_root *root)
 {
 	return rb_first(root);
 }
 
-struct rb_node *rust_helper_rb_last(const struct rb_root *root)
+__rust_helper struct rb_node *rust_helper_rb_last(const struct rb_root *root)
 {
 	return rb_last(root);
 }

-- 
2.52.0.351.gbe84eed79e-goog

