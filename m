Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC4D2DFA25
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704275; cv=none; b=n4EGIrNtJmTe6n9x8KC+fVeHL8rzPkt7StULxwdQQAtT0TQltDTInM8uQxvlQ+sNA9FXhxJoAmU/13fSI8M8Y88WOTnYGaihWioTTAKWYfCTQvaBNWDlRROAyZTC6ERSi7Dw0rRbuEJTGZN97RVokXajopCybDWwzwuo/aL4zlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704275; c=relaxed/simple;
	bh=1NgpNp9EMSFxPD8Sg6/iDL86PIYw0ffRVg3J2fh+fVk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JWErknV3NSP6s07xwjukXgbTvNnps7KLRWFEXdYnHt8AuyPvefD2KqsVGzgo5ZuMgwLe7oAMbrqiZa0aYBHSMTRlLqWsddkTeBFhJUjthgd/qFWHDJ7WtJ8dPNt8lyRIJ1IqNGevFIgJsfgDwjiVjg2U/l2iNoe+jfrdk+fdNWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x6n5OFFq; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x6n5OFFq"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779b432aecso33979105e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704271; x=1765309071; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwCYyp24SdF7h9VKseqDU/38E/OiCNQBttHgpWFmplw=;
        b=x6n5OFFqLhVjSHimR4Q1i6dhjG9nfS0qZDLpg59/A5GsOoyVfKUTYqnzAvEVZY355P
         Tp7TixEVtVpnVZHggyiYoVUgfnLaXWJIw80eHdJ1GG/ihpbtMpizJ49nq9aegmRUqRTm
         xIFxxjMKYlvolsXGwzh+cyOfBlj+oc6vuJV2oPyrNXMP/5spbNJhhokpsDOY3aiTLdXB
         R5ARynOY1tgxK5BLmh4nh9Lt92Fj/aEfY/Q4Zx5+edOfTfzO2oypTWHlcHqsFh4YIPoc
         IeY9HoqV6/KT2teflmEJEnzfCpxdFTeruo4AUDJW4ybUjMVv7J230toL8vyxNZ4FYIbO
         a3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704271; x=1765309071;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwCYyp24SdF7h9VKseqDU/38E/OiCNQBttHgpWFmplw=;
        b=oxZLa3mJ+mYEBXmDoWTn7/Nkw/7CcCpTvOI1igjj391wOvQAcVWtNBFct+MSnrDTmx
         Cf0SNHP7LTg7vEQ4RR7LBwMnOhBOxFyD2BeKW1Tea06tpdg+91KKXGP7nMoI9otOubNH
         KGmeKS+sWUv4v3oRfMTHAnOZy29836qTGc4EvZjJzlhPo6GCSQnQg2D+Jut72VFcLRKQ
         sY923Fd2xT4WwvjpSxD6xqFMschNe66unpi7OOUAIje35MWNXNLRhOnqWfNJ23pBmtIZ
         cFGTPfGUtBGy66ErjbRuN9VNPYhNAKUjbpyMdtwuPsZU+Nvy2ESCVcT7ADUaaB1HMKM6
         lTeg==
X-Gm-Message-State: AOJu0YzjLfnYvuxm69hAfW8pj6/3g6Pj+lCa+/8OL77VQ8dQkFTI5pKY
	Fstzx1hfj5hMUivzI7RZrpCw2cOms/+lH/xuuD/7y2Y4LvLQDIFd2cZhWL/PP4+XkcNd3FG1h6I
	2+9VY9aBiiP9e9LpOf4xtb3UAdvJ3OwpSmVzSlKv1a1n+2OhPZrcs2/mGF/d3jd/fO9OxzRBSj+
	NY9u67K8YSvvNGiVQW02AZybyqP8jmAFgensrFvTJfcOHAlnsMOnCtY7cT2jFYh68=
X-Google-Smtp-Source: AGHT+IEXA+5E3gD+NJOCvfgF50BJNZCaNXDPSKbCMUp92cE4C4Xar+1BE8tubajjA0Pc3tk6zlXcYArvgfyLwxQ=
X-Received: from wmqg19.prod.google.com ([2002:a05:600c:4ed3:b0:477:a1f9:138c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c0c:b0:477:3543:3a3b with SMTP id 5b1f17b1804b1-4792a5ddbcemr6766645e9.6.1764704271475;
 Tue, 02 Dec 2025 11:37:51 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:26 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=1NgpNp9EMSFxPD8Sg6/iDL86PIYw0ffRVg3J2fh+fVk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AG0rCjQD0JBEGmKS5X0Vjnz0TcRPX2GZv/f
 1bzlhg9sX6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ABgAKCRAEWL7uWMY5
 RlPrD/9dtwChc5XcWGTSH3PenkcJtaHG0JU20v/5vjFnhONQ+8sMMh2BXgktl4szbVOWlge2+rE
 4HXIGi52W+G8gLRkSSapScRBJSg4BAn614Y5Z7qtT6VPn5kNsxDtJ0tW7DNwXk7IH8T2FHQFmTq
 JbWW9uD0UCwdzdHF7svqeVcqCxrX5PlZ+LxjUglXsnEhJCAdofrh+qicBIA1YUjS6ceBlEpwz1H
 RoWkPDYkFaggM91AVUSjBoeDPDfBTzhKzNSQvLZKRBBKTA9OYt8i36zbK4Aa5VLKm+Fu+HGNt27
 OF2wMkeOC1xY8ATwJMKaxHSACD5s3YXY8KQgcezhotCc447GLNSU9t/kxwUPwvFu4Iz8l64yd4Q
 JRTpsbXjOjW5Q5eKGjWPiK4hu6yFswHIKlUbovUGGtWRCtl7ZmnboCqrIXiRTXwrEOlrwQDx6DP
 IjRnpVYoI+pZK7v6mIHNykpPmb6u4twTPYO5hhDGGy72JgmGhtfaUQom48/PTCGvlIwS136RqpY
 wO5mMbb+62pdHxze38aoLo7DSOfdqVFo5i2B/OHIPgXLaeeq3QiECUeX3WoZw8fio26BpUM/tcS
 RM9aEOJqW1+B6vXVyVPRZAXX3b2U+5QJw7FnLbSlIb8Y1ug8oB7JF/79/FPn0hQViyLnJsZ/+7u f2729H44c8054Sw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-2-a2e13cbc17a6@google.com>
Subject: [PATCH 02/46] rust: barrier: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Elle Rhumsaa <elle@weathered-steel.dev>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Elle Rhumsaa <elle@weathered-steel.dev>
---
 rust/helpers/barrier.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
index cdf28ce8e5116728c97e24893cf12ef41578d3ac..fed8853745c83639c32f79335e40b9494db11e98 100644
--- a/rust/helpers/barrier.c
+++ b/rust/helpers/barrier.c
@@ -2,17 +2,17 @@
 
 #include <asm/barrier.h>
 
-void rust_helper_smp_mb(void)
+__rust_helper void rust_helper_smp_mb(void)
 {
 	smp_mb();
 }
 
-void rust_helper_smp_wmb(void)
+__rust_helper void rust_helper_smp_wmb(void)
 {
 	smp_wmb();
 }
 
-void rust_helper_smp_rmb(void)
+__rust_helper void rust_helper_smp_rmb(void)
 {
 	smp_rmb();
 }

-- 
2.52.0.158.g65b55ccf14-goog

