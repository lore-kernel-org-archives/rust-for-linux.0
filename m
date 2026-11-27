Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783340;
	b=bFOWj2wYgyBVAVnE8iCYiodj3UNkFitLwvH9PnTXviGDNTmxNRqmXuiwMlJ3/k8I5Fzd
	 5WRS+0KMnioq2b+zy0jcBMnqe9K30dj3KHAo55Wx/h9kKwxgrQJwnmcgUBaPsU7awbyKD
	 il/TYeQCN/meV6OVlM0L0GeGE3s6FMhqO1OBfYxxYzWgIAx/e26J9xzxJTqV0rCgawkgn
	 lChV9tjJh+UY8IG3fBHg85hKBoJgh9ZIsphogx+yWf8UDTuTKtJCoycxcpYj4VNEa+/+3
	 oIr5ELwpo9cpKRUJrviUIqftKKpje28LqIPxJ+Um98LDrZVDnSXxP7YB0Yb9uqT2ssw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783340;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=sUvRVtw8ImDh3X9R69Cm1MAr63hHzccbWqjyDbR8Clk=;
	b=FzKRmVR0+Oy0GxCT1zbQLTR5qVBMMPm3YU/MxuOlje8wCDEPu04BFTCchbJQRmzSvdMI
	 pm36onw1zDRB2sfqzx7GL2zF6D0K3z3FaX4NFBPkNSWMZBfp/5CQbDuGRtv8ZT0wgQQQK
	 NRsj7VwQehMMW+dHjX/lye4F0fYWDQ3dRmpsrI1asQ80p23Tis64yGk08mIbv1KxeEeyt
	 tnn/10SooStWWyeAa8PjG1OpxVSzkiSnQhtysZtIl5/t5hjTQm1bzXo/Oc6Qc1vUfvHKG
	 TJ9MVMG+ExZgkeI5hi7VdtrfD2gSo5eUjbRZjO1FNrUWx77gm8z/f/Ii9NYeLw3y6Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=SIWnw434;
	arc=none smtp.remote-ip=220.197.31.6
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD78606A31E;
	Fri, 27 Nov 2026 12:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD78606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=SIWnw434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sU
	vRVtw8ImDh3X9R69Cm1MAr63hHzccbWqjyDbR8Clk=; b=SIWnw434uR+3Pz6Vxe
	C4IriJwH6VIZcoanpu8l5Vt/QNlIWsyiFHqNMxIjTtA82buj4NUfzD8Z3+ChwR5T
	4c9kGl9qYdNyqcSid+MXSBav6CUM87V7c5h+aOmJHpCHfmdeyheMLmwZviXmWrtN
	9H4K8v+oNxjvr2CmZxK/g3VM4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnN5N+eglr4NvRDQ--.48926S2;
	Fri, 27 Nov 2026 20:41:38 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH] drm/tyr: fw: fix integer overflow and inverted range check in Cursor
Date: Fri, 27 Nov 2026 20:41:07 +0800
Message-ID: <20261127124107.1782-1-AeeSec@126.com>
X-Mailer: git-send-email 2.47.0.windows.2
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
X-CM-TRANSID:_____wDnN5N+eglr4NvRDQ--.48926S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw48GF1DZFW8ZrWDurWfKrg_yoW5JF43pF
	43G34vy3y7Ka1rur1jkF17JFyUZw17Za10yFW3Aw4kCr13KrykG3y5KF9a9ry7A3sxJw13
	tay29ay7KrWkZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziXAw3UUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBrQPbdmsJeoOxCAAA3h

In drivers/gpu/drm/tyr/fw/parser.rs, the firmware binary parser `Cursor`
has two bounds-checking bugs that can panic the kernel on malformed
firmware images:

1. `Cursor::view()` checks `range.start < self.pos || range.end >
   self.data.len()`, but does not check `range.start > range.end`. An
   inverted range passes the check and panics when indexing
   `&self.data[range]`.
2. `Cursor::read()` and `Cursor::advance()` compute `self.pos + nbytes`
   without overflow checking. On 32-bit systems (or with large `nbytes`),
   the addition can wrap around to a value less than `self.data.len()`,
   bypassing the bounds check and panicking in `&self.data[start..end]`
   or corrupting `self.pos`.

Use `checked_add()` in `read()` and `advance()`, and reject inverted
ranges (`range.start > range.end`) in `view()`.

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
--- a/drivers/gpu/drm/tyr/fw/parser.rs
+++ b/drivers/gpu/drm/tyr/fw/parser.rs
@@ -75,7 +75,7 @@ impl<'a> Cursor<'a> {
     ///
     /// This spawns a new cursor, leaving the current cursor unchanged.
     fn view(&self, range: Range<usize>) -> Result<Cursor<'_>> {
-        if range.start < self.pos || range.end > self.data.len() {
+        if range.start > range.end || range.start < self.pos || range.end > self.data.len() {
             dev_err!(
                 self.dev,
                 "Invalid cursor range {:?} for data of length {}",
@@ -98,9 +98,9 @@ impl<'a> Cursor<'a> {
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
@@ -108,9 +108,9 @@ impl<'a> Cursor<'a> {
                 start,
             );
             return Err(EINVAL);
-        }
+        };
 
-        self.pos += nbytes;
+        self.pos = end;
         Ok(&self.data[start..end])
     }
 
@@ -144,7 +144,7 @@ impl<'a> Cursor<'a> {
     ///
     /// Returns an error if the advance would exceed the data bounds.
     fn advance(&mut self, nbytes: usize) -> Result {
-        if self.pos + nbytes > self.data.len() {
+        let Some(end) = self.pos.checked_add(nbytes).filter(|&e| e <= self.data.len()) else {
             dev_err!(
                 self.dev,
                 "Invalid firmware file: advance of size {} at position {} is out of bounds",
@@ -152,8 +152,8 @@ impl<'a> Cursor<'a> {
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

