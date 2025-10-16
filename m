Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087002641C6
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 20:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760646314; cv=none; b=TPJDTdCvvsZRlLLCaJ8LTqorzzYmEzuGrbs+MsJ4WvO4EYWojBd2DIewUsQIEOuttD8kHfYsG3qiPbB/ZWRn3eKluxYUSriBmclBuY872xwsNX3FzG0xhkCX5/mA8sx3fwHrUNIgmGIgvBIaL7Ie++aKPqJFjRZi4WDpAMXtttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760646314; c=relaxed/simple;
	bh=YSzb4KmDToZj5w4vMn5aAWpnoNWVsQl0pD/l1/0gPBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNGL/pv/2Q0S8EBdLzoTyy2J6xjmUU5QDeOClDYmd8xGNHvCdvPlHgW2ElKb8NF/Cq4l0kNmLwDgsTjUeWQ/oorhY5rc1ZkAnr1oC2bwe+dYsiHM8lieBDI7c3kwVgTlsKhWOTu1j48e/l4nhjCv9TuA2zBKcLoQtMMIW5rj0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXVICUMI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXVICUMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760646311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3VuXIGcz/r2zeKQR2M44CEMWNcOxAJOoKMcLC5g8uJE=;
	b=eXVICUMIpbgafm30M3BIcn14ZxAQLnRufP6q6eAOUFtLwGZHgKp6Gpqz3AXUD7ArfWBSTT
	AHHlJpzUQ6VMtF1uZ3e2APUAqH5ZVtrUH7RRyC8M/le598rf5fQ6YVlQYpaacG5kqkM+9f
	nqdM+T99vDdWOaNPBDQbsZuvlS1VMgI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-_dl4DnHEN1CP2xMtHN0itw-1; Thu,
 16 Oct 2025 16:25:06 -0400
X-MC-Unique: _dl4DnHEN1CP2xMtHN0itw-1
X-Mimecast-MFC-AGG-ID: _dl4DnHEN1CP2xMtHN0itw_1760646304
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 402111800D81;
	Thu, 16 Oct 2025 20:25:04 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.252])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D64F30001A2;
	Thu, 16 Oct 2025 20:25:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org (open list:RUST:Keyword:\b(?i:rust)\b)
Subject: [PATCH] iosys_map: Make dst a const in iosys_map_memcpy_to()
Date: Thu, 16 Oct 2025 16:24:55 -0400
Message-ID: <20251016202455.2750217-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A drive-by fix I discovered when writing up bindings for iosys_mem for
rust: while iosys_map_memcpy_to() does modify the memory pointed to by the
iosys_map, it doesn't modify the actual iosys_map struct at all.

As such, let's add a const qualifier to this function.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/linux/iosys-map.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 3e85afe794c0a..0ececbba04b3a 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -278,7 +278,7 @@ static inline void iosys_map_clear(struct iosys_map *map)
  * system memory. Depending on the buffer's location, the helper picks the
  * correct method of accessing the memory.
  */
-static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
+static inline void iosys_map_memcpy_to(const struct iosys_map *dst, size_t dst_offset,
 				       const void *src, size_t len)
 {
 	if (dst->is_iomem)

base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.51.0

