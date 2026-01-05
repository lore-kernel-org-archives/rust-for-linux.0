Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E9233BBB4
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616991; cv=none; b=UX2Qo8aKXE7RsloZYMmeMzaWS9nFOCxJypOPuW4LnVun0pujcAzA2joTAcQamnT7DqhHHpWZ1Q0tsg6gE6Wc6t/b3iTQKguCGU81WhOA3hdUe/w2TVXFPVPIkOGMXvRuaItLY49MBM4DkO4kP3+E4Z3B5VW2p0mVyfnBpGuEnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616991; c=relaxed/simple;
	bh=qyf0wLqvyn+zk6WB03kFSGlGF0MlVf9aF3acrw3ZIyc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j//3tbb7yPQkLFx6N5aBWgKPhd+zMDPf5oDAo6VQVsT11A4btLJb6551/cWMz3v+9bE6DTX4n1XDHN2chg3g5noZ2CHitsdpaDT/C3prWrTpALnZRhsQ7StNYMuUPI+gEaEZpu5nTkcwy5Yqq0/16UFNlC8QmNF7EBkQIOQbgsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jeFnqpey; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jeFnqpey"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4325aa61c6bso5512522f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616984; x=1768221784; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=On+1RbTF6HcF+1VDooKrSy2gO7UJOg/A5CNCVs7TB70=;
        b=jeFnqpey52I2hMEJRixpyuVLwxKhgkf/uMl4RFzi0NwBCRovguzYTv1BF+dVHZ2pU8
         Wx58xWPUUNvGBFFcnz3H14UQ+Iv78NB89d0B/XOUh2IZnYT1IPS4kj/xY1rsT3IQQ7w4
         rkGvi813ybllMYGFBVHom+ljkviIxJUEQYCCiFmM5lY4ToFvc/ipWVr0pBlEtskw7mbV
         XlK9jwtAG18m6pfdvAMtTlT2L8yKcGHJg+OHrgp7cDlK4WRbgNOcGfbY5/ZPaRCD47XG
         rLrSJYGHWBjdlX5Zao+IPRM7yB3A9ZdYGSHyRMJlqEwuEt8bkZ+9gn2hJpFEK7xdG35p
         Mxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616984; x=1768221784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On+1RbTF6HcF+1VDooKrSy2gO7UJOg/A5CNCVs7TB70=;
        b=JUNACUYaT4ZnLdQXejHnhfMwSxkaS/tu56tvw+BRkXMvd6nWlQZ28eKTlqzswud07y
         5TXaLE7LEnekLAl5REKwKgCyAp8SaipxCvrrGe651Jmn16lc6bBXsQkf5A1RUXEz+dN3
         C/Pf2SYFgf6actCweXAZ67WxxR6TwquLkOC2EUdeFQawpEgTeZn79oLYgD5ONLcMubWZ
         RP7m3vuKSswdKQSwUetm0YFTx66EssJj2GM9WWAuV3zgBLSPNht9itO7Wu9jKjm78YXx
         QGAjH53GuruKikZlWEtAVUh4CHePgq3aC3oTsWpO6fTamBDb1L87h8O6DwqOiGoEfEWy
         aB5Q==
X-Gm-Message-State: AOJu0YyyFMT6yksP/2fzGM52tsPnUQOyeQDI7fJEhIzmDqkxBmJ0woZC
	PN+deInJlOIr5JDoToRpK8mL9ubcdYpx79jqlm6RqvBYb8CvBp0jvSvlxuG3ucKdLVnDx0h+057
	90bdXRJco7e6kiZWqnSO9rbOEpuFqlVcmslITYZMcisFDK7zGz+VVT2mz+N4YgVZbOOlCtD74Bl
	rg6pubaiDRA+wVWwMPbjTUjXEmR2yonuioaHfxQgrulW5dlwx81fCpYEPXZSgaKTE=
X-Google-Smtp-Source: AGHT+IF71QstugUaxLNkQQ8i3V0wKaCpHcTsBX9edl73omyP9c7CJW/LEDOfqYoiRu3CoubJ7GFNOkVVwbZRdCo=
X-Received: from wrs12.prod.google.com ([2002:a05:6000:64c:b0:42f:bb46:77bd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:610:b0:430:f58d:40e5 with SMTP id ffacd0b85a97d-4324e4fb259mr61294692f8f.30.1767616984235;
 Mon, 05 Jan 2026 04:43:04 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:32 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qyf0wLqvyn+zk6WB03kFSGlGF0MlVf9aF3acrw3ZIyc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G8CMoydJ/p60V1Q9TMKPQhgtVEqYa8R4zst
 jLsslLPts2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxvAAKCRAEWL7uWMY5
 RjY/D/95vJXJOQU9HhNI4/6ONFJEwZZefbxW6DyuEIdYe+4w4F2FBOPrWqTsFKCLQ7dvFqK4GiQ
 u6KNp/6CSS4xWm9y7P0LSqz/e2kNva6MIpejsLWWsaQ7hhRaspgPWYDNfIXrM4ukWPu1mZ5cben
 AJHzxKky8hw+m9W1S1IzOA16h7BjqLMQCjeIZQnze0CbXlPv675BUjLzvroFYOZwgI6SazHGao9
 MCUfPYw1BXtEBV7u6DmkRkmaeX++EIDCOxdO1B47yYRKtd/jz1rIx8Dxxi9Uht2vH9XIDz+KK+X
 65QVxKSqInLKSUgPF8FWgujUh4s9F25w8Ggg1kJgJrN3gRKOGcJ44JFDRIFitmeuTeX+62Ewalx
 kjAEBODl93bFMfUXv8G2becvM29ZTiGrC0iejVUG9QOyFRUsiJsxN+NgvVdnvqIzJFU2pn4XA/6
 mAXJdIcRbmp/qo13p9MAnTPpOZhd8wl5tSPC/DVzQc6mzG+ta2t2yvUrpF+37kPfBKnC4zqK+LV
 OqQOB1WP3fUoXI7wQ6z4fD8xxbfUM8M5L9iAO/xW/f54xmgbnCoUWiBteY27B4oms0x7awGmFoK
 jyKSOqCoKmvyad9wAIaLslHMZxgqcP0c9H9AbdIbifgG2rj9j+COaP+c1Xoq7eRhgzQ4BzDs4Ci VS+9PEImVvJge5w==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-19-51da5f454a67@google.com>
Subject: [PATCH v2 19/27] rust: slab: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 rust/helpers/slab.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index 7fac958907b0a7cbb28ef3a8a56e0cc10d39288f..9279f082467d896381e34c4333492a92d626da2e 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -2,14 +2,14 @@
 
 #include <linux/slab.h>
 
-void * __must_check __realloc_size(2)
+__rust_helper void *__must_check __realloc_size(2)
 rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
 				gfp_t flags, int node)
 {
 	return krealloc_node_align(objp, new_size, align, flags, node);
 }
 
-void * __must_check __realloc_size(2)
+__rust_helper void *__must_check __realloc_size(2)
 rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
 				 gfp_t flags, int node)
 {

-- 
2.52.0.351.gbe84eed79e-goog

