Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534360;
	b=MM0omhUxCrZ76QpjdzPZco23Gm5BEX+F55AIqakPYwb1Qrv/FBpcAIK/wvJXKRFV3fPA
	 Mv1Nszzdp2VmY4arkMHz9hdH2d4orKEvwZzltY+3DmKpB6rxCPSzUX7Ey57Sgajok7R4E
	 q9pnLXVNsGegPwNEOiwNtSTYvj4+pAUa2tRCNwJVqgc1T2vm+UUdlnlI1c+gSVIwRPznY
	 3wJB47yPl6koFNXqy3ZN4DUPhFt69ii0eW7fCdQtppv13cRxcrShfYg+46G6LvJVGDrJo
	 U6hmTWio4UvHTJEUgWxatEUnhhTmm4hNjSmOGqoB9uuGiy+u8mTzVOB4gGeKlKlsi6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DViz0C7Vglsfa0BWA31WXXyBe46zwLDFGwOF1Bp/uI8=;
	b=LMOQfylgKiWFSAdpoLi5L+zZ+aloWOujbUI9QgYxn5O0BLMk/KcpI5hlE0Zix6gaBPyo
	 5/wVUlZj1/4FIjWm/ComNLqlsN+fs6owKHwwi+B0L5bq8jmCQZUbBqy/8g7UXEoqFEGgi
	 8XipotkZdAYvoGIOgAUsa7rvhGEzHyj9XsaQe5Qq4n1sQR8P0f0Q85auJclMp8g5j3TLM
	 l+sL0+k1VPcwdeJZrLZQ100KkSNdSvfiECe4Vgid7lZirTxYRcRq6nBBhwFrd0EvlaE2m
	 4xdRG/7Cple2YaL+z+wZZuC9EwAJup7KKCqkoZZ1KjUv0tSc1WTCe8cElOA/FsPoC0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJzrYcmZ;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0941606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 15:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0941606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJzrYcmZ
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adfc004920so43712621fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 07:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534358; x=1796139158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DViz0C7Vglsfa0BWA31WXXyBe46zwLDFGwOF1Bp/uI8=;
        b=fJzrYcmZJONlT8oIxwWHNrTRHRSWFxqFD44/4IyrV6uPv1CbWQ5izNqXdOhQNc4d5H
         4+FgagpM/KG8HBAY3AMIYzbDjKkJn/rbY+wXadODA1ciwZZJ8yC75ARJdZQlSGTKebgV
         kfQLHUe+J0pw7i2bQnPUTBbNiCbVvmzhAnp4FtNjRj1kdio9OIWk6nOiHqO6CHq/bFJ0
         I3781jFQA6LtZ1jmhSzCuB8K+gloja89p8X+nsDM2NNPZaprloDYPDmKtWWONW/cZYZe
         1wPDOY3cJiY+zidT4HJQIMhwo/wcGwJUAnARhGecDLuzNfsXENDXLjvu5ueiWdo11emn
         G1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534358; x=1796139158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DViz0C7Vglsfa0BWA31WXXyBe46zwLDFGwOF1Bp/uI8=;
        b=0oRnszb0YO+odc68pf45V3hCW+g9vUZJKN4aur1nbQq+RLm6M7JgdKOd65bL/2YAGX
         6wlCrxSkqzo29Qt5Mlc50/qL95d9Hzd35ns35kR574L8P5HrdwGw1gBkuCxoNTf+PRFu
         5qOQugZDiTrUpIeXKc7zCEIIPGPCc7jRVyNIMUpYiUM2DUTUmGYVcLZqeONIbewVBYXD
         AQE6ywGWv5coor0YmEnEaVT0tIq5sNw3id++iLG19WeizDMKnHMhhKLYrFbqj3AUVBcc
         dOkjPtWUA9HElsyuDcdliiZDVxcz2dfiiOHpx5KohIg+AtdsB18RjMf/3aKchqjyzsCo
         +FJA==
X-Forwarded-Encrypted: i=1; AL+hErGX3Mf8QED581ZAReP1ZeMGI/ESX8bqMsO8HH4HImAieDEmAi1nV6a1VjnFLGg1eLJL254kkHseXnxk96ZqTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8oLISv6oYQB0VrTvOyDwU+SFk3G1Q8r42z56e3oC2Kkf6eJc2g
	i+Wgc29irRBFi6DHkIPxUsgM8nO5tCGJ0WU7WaMHvQo/6qMqdqzLINVv
X-Gm-Gg: AZFdTZeRubwLn8asgaOqCai6+CnDQhR9JGjKEO0xDdtigQizKHRUme1ijC1kJF/jIfB
	P1X/rbbU+NkrNRq35tLAuNN1lMBIFnXKTjb7psUk6r96uAV3bH95XMgdy1UzW08UCT8wcP3H90W
	YxeZOqqmsaA6g8YMaYjq7m8pR111Uh5Yt7TTN4h7h5vQnOUtVWKTgvx5NN0MG2+K2GnjB+lUDZF
	aNY6lBxXuzqspZjdTJYTYlY2n3c+TzVbvk+3GVpMuVAyiuSiigHH7MvS9HB+UvEbzRxxFAWqsf7
	oezFrafqnTJACIFAUPTo2Atxqd7Hx4evExAst//9HBd/QvLcXQLllKCcPmReqX5vi4bXWakHx3h
	5sM5QlVIDXKw7q+QPd67ZXlUMmAfFX7jLsXWl7ft61YahJjgXZ2xo/4+hhNqo7xw0Eqxlnxb4wZ
	t4dbYf6Bt62MUqx2ILeXSqftDLdoRaPmTRHbBwaWLwYZA+N6Fsnd3VDA0Y2yFZm8p5fiCiRYp8z
	fUg1XVL18rMdw6Nf2pUHdIIibQ7UdfvOn9+UA2tdBmnZoux9uR+lfnbc2IXLxth3oAUZAu7NtHm
	fR3xXzC5hRkY3Q9AieR8adu1TqKiBhm858zW
X-Received: by 2002:a05:6512:3086:b0:5c1:ac37:caf8 with SMTP id 2adb3069b0e04-5c1bc7c3b81mr4720023e87.10.1795534357650;
        Tue, 24 Nov 2026 07:32:37 -0800 (PST)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33312sm3925086e87.4.2026.11.24.07.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:32:37 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org,
	Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Subject: [PATCH v2] rust: mm: warn once on invalid VMA range
Date: Tue, 24 Nov 2026 17:32:28 +0200
Message-ID: <20261124153228.134723-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124132609.101657-1-mbkchelofficialdev@gmail.com>
References: <20261124132609.101657-1-mbkchelofficialdev@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use `debug_assert!()` and `pr_warn_once!()` in
`Vma::zap_vma_range()` to report invalid ranges.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
Changes in v2:
- Drop the `warn_once!()` macro and its KUnit test.
- Use `debug_assert!()` and `pr_warn_once!()` in `Vma::zap_vma_range()` as suggested by Miguel.

 rust/kernel/mm/virt.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
index 63eb730b0..1a3a990c9 100644
--- a/rust/kernel/mm/virt.rs
+++ b/rust/kernel/mm/virt.rs
@@ -115,8 +115,9 @@ pub fn end(&self) -> usize {
     #[inline]
     pub fn zap_vma_range(&self, address: usize, size: usize) {
         let (end, did_overflow) = address.overflowing_add(size);
+        debug_assert!(!did_overflow && address >= self.start() && self.end() >= end);
         if did_overflow || address < self.start() || self.end() < end {
-            // TODO: call WARN_ONCE once Rust version of it is added
+            crate::pr_warn_once!("Attempt to zap invalid VMA range\n");
             return;
         }
 
-- 
2.56.1

