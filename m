Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8933009D4
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704319; cv=none; b=CUXd/btnatevax5TwrEkx1qElDR78qJ4Ts/OibWyCNW2zWrXeUYHT8LsmazEuLCMK3yAk+Ryb2x43m9UvHt9j1038xEZCzEeYPC9ge1vrf+Db4LZXiHTe8pbMj+4Ezy+DzO7QyQwH988+UDKBB4sI7h0aHBQavuttphUJPQLjYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704319; c=relaxed/simple;
	bh=BcJjFBIrbnMCfL+tTdUx/9KtBovC7GXyFfHNBnYb/J8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mDhlJ++vFeHivaU/03VbXoGrSchhsPhFMxUL3JW70T8HM3aD5hiWutY9DfGopb6EI8K1OKG1bx1exEzrsRUSLsE2RuRDWT9+dDuFTxGu6iGFDX2EFsfM43xBY33xhor2DVq5zlDEeFpwuddHerOiY11SszN8S2kgIO4NpqnP5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dBwhE69l; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dBwhE69l"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779da35d27so68504975e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704316; x=1765309116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnRlSN3lcoAwyJG7Pqrm4vfFp8J4RfE+zA+Dlc8IdPM=;
        b=dBwhE69l0ri7vlmotibPXrhEycUqfvnuXkBFqI49xJNUUT+kPVg2WnEgdx6o2FFPd3
         8uHLTW1HkABOHpuK6ikM3seenGJn1RWhE6sd0db03MjVH+iuIqMOoHDVlncPq3+UeiHE
         gTFtYN64ukbNdPzUHx98j+UZZBHbmyP4dFlcSpzfORAV5V/mVJPVmb+RrFR6R1t1tyzS
         C6wO4LNERlOOkHLoAp9QTttCp9oiNOWdhXN88eZWLeGQN8zKP0aIwfcd7WMBlW2Oh0JY
         wPq/IcbwHvqEnflNvVhJTO7Za31DZBbPtABgrF12fJZx3lyUTYHFvSqI7k236J6/SFwh
         mcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704316; x=1765309116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnRlSN3lcoAwyJG7Pqrm4vfFp8J4RfE+zA+Dlc8IdPM=;
        b=FR71GwUHKgzEt0IffJbVmu6ufzSmCrEC8qt3jytLfAYe924iL1IecXsKxkONavw0AR
         azUwqPxYgmv2WKIcc5gDghzY7FAEwTZQ3Gy8vhSWZ9Tu50FlKvdwCc3skDLu4fAjOnmc
         1MRKL7ZaxH4VuOW24afn/K80GIife6vFCM31I0Ij5rx2jhe1CKT3Ob4Zd32S2F5K+nSC
         4evMI/NN0Fhl18iw0mLfzq6HcoNb9ysnx7P1u93HmxHnrRoR/EqiPpH7CjraM457QmtL
         8bE7FENT13+HvslU7MlzGUF2mIrEu4gCcD9MedCbSsgIuPhdKpw/fTDapz9xXdo/hGgn
         Oo8A==
X-Gm-Message-State: AOJu0YyS02W9rskyr7uo72i+jqAuYJkUEzyPXWBMRSRY06QVSSSrGWmq
	WGkj3ZzYpuB4JCG7vJfYa/2fSDoCmGLm6PIQESsuS7r/kir7ZqefN4Dn/VSvoVHOHQp8nXtPDwe
	5QIv0juYAc+Fj4fvCBV4M/YBc1cYreobNzEisNSHlkkj+8CiBH3my6YQaoX0nKxLsqOg+Bl1zMA
	x9XmJQ1NGF+nEGWPdVtlz1js2VbcMc6K99SYCkk0YEpt/HvwC2G0/Ztyml2Gi3yYY=
X-Google-Smtp-Source: AGHT+IF3Mc3n09jK6zC18NIN5EfePO9fVy8GVae50srFlirv0oLPDOd3BU+lq2B9kLvdc/JpkYqBb3zsUZ1ykRQ=
X-Received: from wmaq9.prod.google.com ([2002:a05:600c:6c89:b0:477:a148:c6bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c48e:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-47904acef07mr300551705e9.4.1764704316594;
 Tue, 02 Dec 2025 11:38:36 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:02 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=BcJjFBIrbnMCfL+tTdUx/9KtBovC7GXyFfHNBnYb/J8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0ALrxym/CbT+Rtp3yjFFGVsBVg4V6bf/mEnS
 WqrhwhFM3+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACwAKCRAEWL7uWMY5
 Rm4+D/9G+yVyFHcHjKA/A/hdrLXUxuemrQqGUmxPJI2NuQx9XD8NJLB1KB/knpnRZiTFkQKV4PY
 qADjp3kpPMfPRkPYc/a5mX3CMCTk3LYyBk/QJipWAmsrSf1mPBQS6hHPCn0222+o2a9AHZHuuor
 ynMkXcd3Zj/T/J4pwT7RT0iJbbrDwH1g9pD6pEJPIsuLTAGC4JUPfuQklyo8cTlwku/LyWLABj3
 jUP7tpeUom5qoIXauZbfXg5DLy6wdYdbjhEwA0/O8snqJCMzMFwOddC3ZxqWjNvtAsgBmK9CqZb
 gu6BrvdyzI3oqIjfzp8YfOyMW/HfpUurMSMWeg0PNU61eihQgFZ8DBOGUpn2VppSGzALC/YoDs5
 UykHVTjuVBZH6gTKB8W+bIuxr8vTDlEVYX4qJmokuF0Wp/Pa1ng/R9QpyyrMVb5N/xUfD3/0APL
 9VNkiS1MoiWihP0mJm6SX6hCIldtcr6k0CjbO4SqtWZ0VJJ5z80wx74CqdyDZorw/pLx+50G7RC
 REqerMTRhJLGrG97NEL+524yBjsn3B9eUAJzmVmH6+NatwE9KB7BCNepIm3oZhC2+YTwYMhZMOF
 dIw1QbSdbDlQNyfZeWeg1XtqTG7D5BCrYOplen0YwMlA26lkMGZ3e9vjvhZ4HNLCn0G8ve7C7oi H2lCo7aidQcbb5w==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-38-a2e13cbc17a6@google.com>
Subject: [PATCH 38/46] rust: slab: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@gentwo.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 rust/helpers/slab.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index 7fac958907b0a7cbb28ef3a8a56e0cc10d39288f..970161023d8885935f2116fe81949d0ed622f9e9 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -2,16 +2,18 @@
 
 #include <linux/slab.h>
 
-void * __must_check __realloc_size(2)
-rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
-				gfp_t flags, int node)
+__rust_helper void *__must_check __realloc_size(2)
+	rust_helper_krealloc_node_align(const void *objp, size_t new_size,
+					unsigned long align, gfp_t flags,
+					int node)
 {
 	return krealloc_node_align(objp, new_size, align, flags, node);
 }
 
-void * __must_check __realloc_size(2)
-rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
-				 gfp_t flags, int node)
+__rust_helper void *__must_check __realloc_size(2)
+	rust_helper_kvrealloc_node_align(const void *p, size_t size,
+					 unsigned long align, gfp_t flags,
+					 int node)
 {
 	return kvrealloc_node_align(p, size, align, flags, node);
 }

-- 
2.52.0.158.g65b55ccf14-goog

