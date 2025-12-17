Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7F436D4EC
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765979515; cv=none; b=IUX+2mDthh9P9oYz/sFDq19TRn8KG00GiTBeMz3Bc8MzfHk/XoEl87w3gkR3UY6AQJWv3JyyWOSv08V8R2FYeFZ18+aGXysLHVmXnQNB01P0FYVeqGiTtrEZgVGOShbCE3tSj1FIySeY7xuTCLjAOW+3TdPCVNK8j9lkzb3pioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765979515; c=relaxed/simple;
	bh=B761p5OxnXsb+keUoJDoMwByns86/hRj6jfK8JotrGQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HjaguPTsHc9dpeIDuoaIgT1YVGCoWhgzLOOGrbCgdF1idLnVaI+M8H6NklTvIRP9wchi/ge+p7UM53csn3J1Wg1fwvUc7cymDhyklE6+E68Jfmv6/LsYdwNWv5wZFRh6SYU39MMno5NxwqUMN9y1D9pyjr50XliBT0t9byvGG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gsHsAxp1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gsHsAxp1"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477563e531cso39160835e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765979511; x=1766584311; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=biumxMGdBMrxiqdBND90wOkUf6/zxGBG3GCOTqSkwcU=;
        b=gsHsAxp1HOOoTYJSoY/PVpz06goxe6B6RzSgd+fE62YbR+QXRs719vfSiNiOCUP2J0
         cA1oBPi4d6boIXJzScGReScEgL5YV93QstrRZ6WmqfzYr10k7bMw05H8zyUp/7x5IJFr
         vgWu3hhDsEGEej4SvTDurpx58cJknITcob8qUIuaZ5saVB2Ud/Ok45wvkS39gBYLYsgX
         hApGRBfWvnO0RvBDrh/pVOIyQ75TWj4OYYZH9Ym3Z63dnuSHddT7r5GbsTCgLf/pXHpZ
         9AXQlZxB33u4z5puB3uid1qoUcazIGzIsoNjl5qn2cagjWjPE7uBxPUU4H1z7S2KetVL
         ptSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979511; x=1766584311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=biumxMGdBMrxiqdBND90wOkUf6/zxGBG3GCOTqSkwcU=;
        b=XfqUJmITPTHvl/4JsaiCKG3/XevADEyUMnTD7UAzwS3f9MJ8aNcn3kFaSv5BmXH/G5
         4qQLn/0o0+ayXj8r+2uWi6LtHXVcH7lbSWW04u6CWkNL2Tcws5kloK4j43K+mW8CNY13
         A/cJEjUS522z/2dJRt18J5w8VfMlLzGSUi5RO9NGrFGCLpeDt3u0HgL9vlrYN2wg49JJ
         /eVNeudKzt8mbfpxyZtkh0pOQWms7p1aod3fQqPqHuIBlCSwSvkpv+rq3/vB8M+jSATf
         lOqP79/7LSOavg3LvQRt1S+j7g9EBc4XOoih7misirJrNWYnSYCDvlykx//L0RmJ1OQX
         1lgA==
X-Gm-Message-State: AOJu0Yz+/O+a3Y6d0v9CXJMiaMOx03AVxzRvcYtavcdCjo5Mq8zrq7az
	CeBVWaiqQg2vMDYEE8jKOOmdTUQVfH5iqArAvS+cABjyH74Op7X9qmQ/9OolhNl3tSiL2Qzv1/l
	+1PnBN4OtgmccBPO53g==
X-Google-Smtp-Source: AGHT+IH52jrDqLv0RJzGP7uts2IL2olm50hh8CR6OzSwjWTX69gxWZpS3iCjwaEADJZtgDOiSGfZ7jfsvmvWllU=
X-Received: from wmbf4.prod.google.com ([2002:a05:600c:5944:b0:477:55d3:90d1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5298:b0:46e:1a5e:211 with SMTP id 5b1f17b1804b1-47bdf5f0e9dmr15855455e9.21.1765979511764;
 Wed, 17 Dec 2025 05:51:51 -0800 (PST)
Date: Wed, 17 Dec 2025 13:51:30 +0000
In-Reply-To: <20251217135131.153557-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251217135131.153557-1-aliceryhl@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=aliceryhl@google.com;
 h=from:subject; bh=B761p5OxnXsb+keUoJDoMwByns86/hRj6jfK8JotrGQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpQrU9CPpNf/VhaERyxTXZtsjk5JU0gnULoZ+52
 ImQWuh7ASeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaUK1PQAKCRAEWL7uWMY5
 RvgbEACbeOhtSwISNiLfChd6jbpyLOb6orWB1G4JJsoyV8OSvZKFu4aN31E1Z1p4LDprKFhGDtN
 7cP9ld+4+rHqcXq2P8OCEbb5NdkPvrbkYm9Oy2z6LmfB2bsSEKNvRrtfeGiFW/Dfrv7Sh8sk91x
 DQBqBQ64KlKOrH8+pDHY5arYs//G2E+6TJjJ9HU8Nag2RaWN5cn30zCk+qTpzqLESj8IwYqHiyx
 rjOYP2nSygNdHmJF4KkzupkxfkRHOdXBo4PcU24ctSsJaurpT21SJgFS0jsWcd/vQiBPF879KZa
 rbjc8sJ7mlV9bUicp/As8XE0hdOE9vRk3WWT+Ihvp4mK9MpqeHyfh75yL1sKoAx/chZRAJWbG0b
 zRQfTmlyqn2HcNYwqD8kOEpRkjhttgIXEOfh9n3jG3rVISJeZYolJLCsWbI8mtH1JvyUwP/xSw7
 ox6rGDmTogI7YXASb5AAK/xt+jFigQLCmc37LsBldmGGKJJ+Is1gLRlmFtVyQG944LU42CFWGYY
 aGuWx9kDFIvYPKHxDvXlSflLf1XqfU8FzdWTcjAbLiDBbE+hwPOD8cFw1aqHxLO2onYNMS/U774
 MKhOqPlpnMDnAJF/c7nk+Q0DsdiCwwz3md4jCqLudDXEixt0l91HUpdHbT9Me7r0/mIAnOqoTbl ZPUmAnVHmxx7Qgg==
X-Mailer: git-send-email 2.52.0.305.g3fc767764a-goog
Message-ID: <20251217135131.153557-3-aliceryhl@google.com>
Subject: [PATCH v2 2/3] rust: bitops: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/bitops.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
index 5d0861d29d3f..f875692ead30 100644
--- a/rust/helpers/bitops.c
+++ b/rust/helpers/bitops.c
@@ -2,21 +2,25 @@
 
 #include <linux/bitops.h>
 
+__rust_helper
 void rust_helper___set_bit(unsigned long nr, unsigned long *addr)
 {
 	__set_bit(nr, addr);
 }
 
+__rust_helper
 void rust_helper___clear_bit(unsigned long nr, unsigned long *addr)
 {
 	__clear_bit(nr, addr);
 }
 
+__rust_helper
 void rust_helper_set_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	set_bit(nr, addr);
 }
 
+__rust_helper
 void rust_helper_clear_bit(unsigned long nr, volatile unsigned long *addr)
 {
 	clear_bit(nr, addr);
-- 
2.52.0.305.g3fc767764a-goog

