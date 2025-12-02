Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26942F4A04
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704300; cv=none; b=p37Hio0R9i9fd86xjsRIZJ2R/OhnulRqYqqIM3ZVOgKzANEF2qHW7z4ZWHlL0WgPh6QwcKMf+kWe6GgdxlqlQh4J8EawX8WXhZ0rQ2Sp5Ff41fuIJ0M8HdfyIDMYZhEMg/WD6KCfcfD6zIzMbjDN0mQFQaCZme2jF0W5B/9s6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704300; c=relaxed/simple;
	bh=XEQRtG4ngq8j4eZKlMeUQVFI7+jbBl0S1gcS78Q3lKE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jCq8bhS7k0u9eXPLKQC+e5SalHepGIrpzS7rxNFvwA1Co4rmjQ8nJw4eYSFN/uLsw9LJ/dQNGW7FpQXwLUCOZDx76Vap2UETuW7H7IM75V9Gf4d10awn5Tjs7AUKBCQUVc2heSb5ztPmDuZUTI9bDQWEPgeje9WlpBz3nKz2J3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r047Ww7Z; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r047Ww7Z"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so53760485e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704297; x=1765309097; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cY6zIVgs8oj5wBS1r8U63RsVERdgroiyYEhYKwsINow=;
        b=r047Ww7Z3nD1hLHHTzzgkhiCUbDFWEqUjxUMz2mB6dVt3m8uvnru5vrZ8Tt9oehv7+
         bUr6jL/lbM/yc3NYN03vsiFqpjokDNVJhsbvZr3LfXkEj9EU78JYjG1TtQ/OjDp7yOJo
         ixfIibg2RX24DP4mVPh/eKmxe4BYN4n9RWkfppLOlYhvq2+HVbN0IijpWktwTz4K/obR
         0wZx9ExtBQur2+IrXeh0Ggo3Dsy5Um6otyo5J6MecOdEIDTmdeZZKC+188JHcIfDXDPM
         NSImxFqAbbPTRihlCygdIeYvkNVqiNE3KXq8a0WfHDdaA3MhFfWTwdfDZBxQ0ii4xJVq
         MDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704297; x=1765309097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cY6zIVgs8oj5wBS1r8U63RsVERdgroiyYEhYKwsINow=;
        b=IXTv5HFBMOAwNZqYm9eQB+kCdJGltejLysB/L5im9Iz/TjyBouqau7lEFw1NaP4Dom
         2szyyfyAUI6XwnsV7Bb7/JprkuiQ7dMJB5Z9d3gO9wNCHDjvIEw+1lr9EI/l4REt+FWF
         8I6dfMZktZcYk74RpV3PxDlMtYvj4d4FS/N8C63BawJqvd94VG6BGgQ2hkTxFuCNYW4W
         QhYd56YXX9vFI9mzMYdqlISKJfhul1gzvlMzHUbk7gAJTswORJkar8f8AcYr9Rw4n28i
         hD5TBhNJMR4DKhnqoeKBd/rf3ak9ivPjtVwf+tNto8oh8LQfoBhLMyao0Im/0ECfo3pc
         Mpxw==
X-Gm-Message-State: AOJu0YwuJy2EVe4F1UzCYPv6OCVZuv0JgqqZdh3SjqJOGY+VZ7g7+Fsn
	dmJWrp5Dg2pgXMZsx5IB/E0Ch2Zllj11zlweNiE+A2zBgP9mRAJHiNpiRTfg87n6sTyAYMWTVWR
	iXjAoIK/VtLCiew4AXxHaI3W4Z8mBCWQ+590gAzr4TA9FFbsjvdfoeBuQXivTZht8vNF90M/EcO
	7B1Hhp4EHuDBFPPv1jlgN7BIf4hVLf89nrLpWiE3HR674ya6qUj+GHNeC/GeS4S2c=
X-Google-Smtp-Source: AGHT+IFcwWbMYlcRexEdOE1jDvEmEKwihlP9NvSbx51wpfs2n41agdwJLpO0F/fYzRDb2riuwhzLO80opasVOCE=
X-Received: from wmkz11.prod.google.com ([2002:a7b:c7cb:0:b0:477:9654:b44c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fcb:b0:477:557b:691d with SMTP id 5b1f17b1804b1-477c01eea7fmr401133835e9.25.1764704297175;
 Tue, 02 Dec 2025 11:38:17 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:47 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XEQRtG4ngq8j4eZKlMeUQVFI7+jbBl0S1gcS78Q3lKE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AJP35GVKABLJqVHhSfe4YaZmYI3EO+6htmH
 wgxD5vup0yJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACQAKCRAEWL7uWMY5
 Rk4SD/0WnfGtosH+E3CoFEpZy4BInOO22qAAUHaIIYRg0qldDVoF5v8cNx0xIEutblsjTOdGLl/
 ynKu1+UYXtJz59WovPFRKeLmjwCtGiLBXqE8Ko5auf9sogK7TsOwQERHIzcSgyZEUrynyfNYXAJ
 7oiJmoUNXmTPkc2rIQ0pFLq0Lxuzu+j9q15n7ekvBoLIFETw/hDUmtCAZ0WP4GehXxsFqwB9SoU
 xsSvqWIVjtlxgm24rp/cj6jmZ5F0ECT3VhBna6a0IJj3VK+/YQ0pA6Z8QGMJHxXDRXXmqflBxJl
 1EIXyRyegvhcQuqAKYh3MpWSK+jsbnvVOn3/c6lMWbJGXj2E/qREGc9fXlmDC4OTDpLBIRzCmWT
 St/+9gD/6WqIyj2pEMarUhya+o7bk4TbqbB5izGAp/cU0Md/DLRurq7uEWIvsyNpOoEOwrH6S7n
 920XrgYGI5qIP7s50tL6MhDrYU6yh5UVVm3ey/h89cUWSSsZprN73mExdl3JjyBLTLWH60Bmq1K
 mMi75sUZtORA8cYpijsB2G84gtNfDqgplfrUcxKFJbRqxnWHNSVT077fKViv3nj7hLjlNVkMqy8
 IlT9hReYjGbdoD3ns1UXt0NhKK+79OVK0z1z5QVVbSnE2R2GjmxrCWHIkfDcW1XWsBhn2Ax/XwX ksepAqcYlargbwg==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-23-a2e13cbc17a6@google.com>
Subject: [PATCH 23/46] rust: maple_tree: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>
Cc: maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org
---
 rust/helpers/maple_tree.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/maple_tree.c b/rust/helpers/maple_tree.c
index 1dd9ac84a13feed53c0ed5eec6805517081d0673..5586486a76e0de60969af1510b4b0428392920e6 100644
--- a/rust/helpers/maple_tree.c
+++ b/rust/helpers/maple_tree.c
@@ -2,7 +2,8 @@
 
 #include <linux/maple_tree.h>
 
-void rust_helper_mt_init_flags(struct maple_tree *mt, unsigned int flags)
+__rust_helper void rust_helper_mt_init_flags(struct maple_tree *mt,
+					     unsigned int flags)
 {
 	mt_init_flags(mt, flags);
 }

-- 
2.52.0.158.g65b55ccf14-goog

