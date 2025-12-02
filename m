Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA12FC89F
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704312; cv=none; b=L2gpSQtyWGvChyAxTWFxzWTDLM8aAWePEyrE4TO76FoxEOVb79EChLw5aO7juOhn3WdS5rnOcEKCXePyius4uAZEFQeD4Km5jtcBECMuuGkSwr/+DhEZbd6ZZpTB/uRLIEYKlklQx+A9fcl3FuBrfZBeejS2gGwmC97wUxy6gLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704312; c=relaxed/simple;
	bh=xiSvIF5M2v/o/jV45RTHiR7AzByrL2xh1a0T2ZwMloQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WoqYhUjvIw4B8rJRqlvHLc9ZFSRGqPLTVz8YbutAQpeYu55sB5xpoOdorXOUrgPsaPeM7MRdwruSYlkmbtryW8Wus7g3/zKKZUE9lpu+G6Ay67Y5mjxdL7UAsxlATcy5hL2jLjECJ09/gVwoa59GaBQMFw3pGw1OArwO7oUAYDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C5HlLxRs; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C5HlLxRs"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b30184be7so3081784f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704309; x=1765309109; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EZ+yuqOOTtnQ/NJL+f9iYWWqL77wa4Wqu/WdmElzms=;
        b=C5HlLxRsD+9zijoh9F8M2ZT2GlPMmB9AI42TmJ4AEzypzNMC82gjophD3sRG7tw7GR
         eD2XDvROzycks6lnbOE9gCeBbbszx/CFfxb0ELh0kzQWGlwDAr8iTDnPIAVCbVpbTyZR
         TfleBEGbwoBL2a2kbnNk2t1a0JsF5H3J/keTJRYovOadRBb/XQU3Bxe6zqAYrX22cm5m
         pz2MjY5PTWZnuTKEJiwsIthS/iA3H5VPsLLCAnmGerwjI27zzQqbu0AqXv5xpvnJl4Z6
         BfJpZgPNiXc0j98N1EnvNq3lwN/NVGjm2XO5OOOiDdSFiBckCC4z/uh6XUAnLKJW6GiV
         0Qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704309; x=1765309109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EZ+yuqOOTtnQ/NJL+f9iYWWqL77wa4Wqu/WdmElzms=;
        b=WKGJepfY3iQru3I6ILOzKrjQ3xnYk3So4ri946KmFzeOjrDnpB2986uBl+dm8AI5uf
         TqORJmmKIhzzzfcyjpwI4FvpGO+XTQpCad0OZXpHV1ThUBzU2ke4ZIkvI7XFk78JCx6Z
         mMbNnP1YwHshIb/AkDrmGEyW7oMjKtpbIOtkwoBZEmlVVIOroOv4k9BR49IUL35kni0u
         L0QFlSrX9W07uCn5VrBo4VVDoxY0/qT2y2bVyfU5R3f744sdaN7mRLg78k6ddrV21lOB
         rLdC7Rd/8y05i1CwpotNuNrqcKfDjP9LVpN/HuBIPM4LpbTz3l0yqmiW8nZAFBeuMvU7
         DLuw==
X-Gm-Message-State: AOJu0YxFFtY0OixB4JnbSlcZr1fuj58wzoVXqrkbA2zd21Ky+1OEAJrr
	vNtR0eLdDC+duLF2A+kfGc7rrk8E41euXTjr5S24sJAo+dHeH8saHuIqWza0T7WuP6g6gJcc20t
	seKVpRKzjoG0Mhji1kAM3VBlYuzq57Jri7LWKoTyU75Jwy8YWr8MrN61wNhLxc91g6Lb86DBelC
	UsuZZ3nl5TXGaBcnMEiBjJfH1gb2++W1V/XyQaKkn/abCW5KVn5rZi743eKOLRawk=
X-Google-Smtp-Source: AGHT+IFgw8oQkylVOLRrXsrqC45NxuzH07rkiaCMIUiPQ0IG5ERn4DqU43KCn/T8QaryJXKQNzRD8M2pH4p0McQ=
X-Received: from wrmp8.prod.google.com ([2002:adf:e608:0:b0:42b:2aa2:e459])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4382:b0:42b:3e0a:64bc with SMTP id ffacd0b85a97d-42cc1cd9b05mr43590267f8f.8.1764704308826;
 Tue, 02 Dec 2025 11:38:28 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:56 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=xiSvIF5M2v/o/jV45RTHiR7AzByrL2xh1a0T2ZwMloQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AKPxlLkkc0R3rTp64JWIa3zr18o65zul/eo
 q1lbestvDaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACgAKCRAEWL7uWMY5
 RsRwEAC0yYF+Sw9joplwIUcXbkDPbSARdbcvrL9X1AFLin+Opdr+YKWiUr0ALlUVt2TLuyCvFtQ
 DtlNSv/wcAKENDZA0rT+jhizKEBc9qKL0UJxaC6IQfMry2VsWt3TnpKeEelan1M5JhXTEnCcZKS
 L5O2TIHo1O0oiIlaLQYokDOj4zK6IyVaPFaIGxUyjTgIowTbVzHYW3YMu7v8bBbZudWKHYmyiE4
 7At5LQ9cnjww4ohd1YEC/vyLkYWX+8kgXjwDbKXTY11BPgpQoYpsFuuz/kjCGM7f/ei9Hyt28l1
 ShSCumBiiM1xFawyi3gxKOYetCMJfcH84ApRLCj1T6W4kh3lMSUm2SwMJgkjfkMKqjzrMCXXdDT
 OpsZreAfGrbVG6ja6oWNPUOXvpg1eEFyZZ82N/vKafOiJfLqj1bUydanwvXtLATGYAX9wfddIbR
 dqJuhd+6EFyesqAqrCTsGbzKv4vROnvdF2qyr+cqGiz0CYV6EsTmlafBloCwjprmv8NO9ROKqUB
 Id6ci6fHzTGdNjHUK5JbUjU68qVyxMxA0znOAmqpn+IxBXZ/z7Ds7sWFEpTXtxT5a4icLQphK8o
 RS4bfrZxA8UTN0+DtZ6q1X/hst9Nqq+Ia3sCBsCWOO0xEbf/kQ3Jp7te1WMQ3IC3AzrABinwK97 NUn6GTFqMAFZquQ==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-32-a2e13cbc17a6@google.com>
Subject: [PATCH 32/46] rust: rbtree: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/rbtree.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/rbtree.c b/rust/helpers/rbtree.c
index 6d404b84a9b53990cf7b301cb501f3b3332749e9..025f80a37203e3cbf05a42947047a58035018735 100644
--- a/rust/helpers/rbtree.c
+++ b/rust/helpers/rbtree.c
@@ -2,8 +2,9 @@
 
 #include <linux/rbtree.h>
 
-void rust_helper_rb_link_node(struct rb_node *node, struct rb_node *parent,
-			      struct rb_node **rb_link)
+__rust_helper void rust_helper_rb_link_node(struct rb_node *node,
+					    struct rb_node *parent,
+					    struct rb_node **rb_link)
 {
 	rb_link_node(node, parent, rb_link);
 }

-- 
2.52.0.158.g65b55ccf14-goog

