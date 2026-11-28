Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795831341;
	b=YBqym91ugdNzVnjDaiIyTJYfExop2oY/LAXKdy/GOMdFreDyYP4iLON48JLtVEIhA4Wt
	 8aTpDOwxAHZdVsoWf+3b/Vu29wIjy3vNpSgsFGUInJsQ+fRZvpZ4jzFY+zgxdayTTuPf8
	 5z0+unRm0DQaWOnoq2L46nWZna5UGEfnZqr0Q/XtauhS8JnekWYvtKNwq+sdAaPOnzrAp
	 hvOQDcAuXdejYDW50ttWiyNVpy1BhV1bXfBv0NhHc+BySgdvRek3QUHE0E5o4xwHwzViH
	 vZZCkpTc1WWxCkGo2NOF1Yk12cJMJ9N/zomXR++wB8PDVI2m6Of5ZSiGd53DKCGjgNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795831341;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qOsfYdl2fZw6R1RRVzY5eBqAX2mNgq4GFjIvwLEGdYc=;
	b=p6Mrec3uvzLEkHLCyKrpjFdFekbWYHiakWdUQWWUbRRUtGlsDEq/AiYqpYGislTysuce
	 e+bDTdzhVGfqTT6p+18l6ukw5YLcGRktACfjOk168lbfia/sKLSrSTSLmqSI8O3qO6oSY
	 4Q8bV0Ck5l4Qj+p4itPWGr7sBbYhUTMAhNCtw4XFuH5cI10qQPSDWbS4i6INXKWIdZEid
	 Gu2p8H7TNXkgZfPLBC5p0a5JxD64NfM1nmrV74MFJNYQ5V2574X3b4BEr4tyElkZuazZr
	 B+KaT/Ha77mUT7v1PhUKmFfm5MIffhJ9aX1IF4PPVjHe9u6DGKPPhrNI0IAjPF2+jVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=nyZX6+Nq;
	arc=none smtp.remote-ip=220.197.31.6
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06130606A31C;
	Sat, 28 Nov 2026 02:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06130606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=nyZX6+Nq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qO
	sfYdl2fZw6R1RRVzY5eBqAX2mNgq4GFjIvwLEGdYc=; b=nyZX6+Nq57XxLLhtg/
	rwOUf/jRKY9HAs+0N1cHpHL1jVGW16iMzBXvUuzkAmgiAPinGI4cNpgOgt1/LLgS
	bdVRtCfAGwM+9+5jwxpEFgX2gfrP12VOG5kZo5TZVzB6PPf5JzMt5rdOASWL9+32
	OMmzVO/NR6dTsOaEfzp8+ygZE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3F+oBNgprou_QDw--.19088S2;
	Sat, 28 Nov 2026 10:01:40 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH v2] drm/tyr: fw: harden Cursor bounds checks
Date: Sat, 28 Nov 2026 10:01:08 +0800
Message-ID: <20261128020108.834-1-AeeSec@126.com>
X-Mailer: git-send-email 2.47.0.windows.2
In-Reply-To: <20261127171532.2097157-1-aliceryhl@google.com>
References: <20261127171532.2097157-1-aliceryhl@google.com>
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
X-CM-TRANSID:_____wD3F+oBNgprou_QDw--.19088S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryUWw1xWr48Xw1kAryUtrb_yoW8KFyUpr
	43G34vy3yUK3yF9r1UKF1xJF1UZw13Xa10gF43Aws5Cw13Kr1DGryUKFySkF9rZr93Jw1a
	ya9YvayxK3ykZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_kucrUUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBrQTrhmsKNgRmQwAA3y

In drivers/gpu/drm/tyr/fw/parser.rs, `Cursor` currently relies on its
callers to uphold non-inverted ranges and non-overflowing sizes:

1. `Cursor::view()` checks `range.start < self.pos || range.end >
   self.data.len()`, without checking `range.start > range.end`.
2. `Cursor::read()` and `Cursor::advance()` compute `self.pos + nbytes`
   without `checked_add()`.

Although current private callers in `parser.rs` already uphold these
preconditions, make `Cursor`'s bounds checks self-contained as defensive
hardening by rejecting inverted ranges in `view()` and using
`checked_add()` in `read()` and `advance()`.

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
Changes in v2:
- Reword commit message to describe this as defensive hardening rather
  than a reachable kernel panic (per Alice Ryhl).
- Format `advance()` with `rustfmt`.
---
--- a/drivers/gpu/drm/tyr/fw/parser.rs
+++ b/drivers/gpu/drm/tyr/fw/parser.rs
@@ -75,7 +75,7 @@
     ///
     /// This spawns a new cursor, leaving the current cursor unchanged.
     fn view(&self, range: Range<usize>) -> Result<Cursor<'_>> {
-        if range.start < self.pos || range.end > self.data.len() {
+        if range.start > range.end || range.start < self.pos || range.end > self.data.len() {
             dev_err!(
                 self.dev,
                 "Invalid cursor range {:?} for data of length {}",
@@ -98,9 +98,9 @@
     /// Returns an error if the read would exceed the data bounds.
     fn read(&mut self, nbytes: usize) -> Result<&[u8]> {
         let start = self.pos;
-        let end = start + nbytes;
+        let end = start.checked_add(nbytes);
 
-        if end > self.data.len() {
+        let Some(end) = end.filter(|&e| e <= self.data.len()) else {
             dev_err!(
                 self.dev,
                 "Invalid firmware file: read of size {} at position {} is out of bounds",
@@ -108,9 +108,9 @@
                 start,
             );
             return Err(EINVAL);
-        }
+        };
 
-        self.pos += nbytes;
+        self.pos = end;
         Ok(&self.data[start..end])
     }
 
@@ -144,7 +144,11 @@
     ///
     /// Returns an error if the advance would exceed the data bounds.
     fn advance(&mut self, nbytes: usize) -> Result {
-        if self.pos + nbytes > self.data.len() {
+        let Some(end) = self
+            .pos
+            .checked_add(nbytes)
+            .filter(|&e| e <= self.data.len())
+        else {
             dev_err!(
                 self.dev,
                 "Invalid firmware file: advance of size {} at position {} is out of bounds",
@@ -152,8 +156,8 @@
                 self.pos,
             );
             return Err(EINVAL);
-        }
-        self.pos += nbytes;
+        };
+        self.pos = end;
         Ok(())
     }
 }

