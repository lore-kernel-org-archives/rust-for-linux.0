Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86072D3221
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564015; cv=none; b=TsCpsGyaPUz9ODuyaJh/aI2MMrnpzqdCX02Fyf2b/AXwDUZ+vqgh8tNhDA2La2SeXquElYhQcy+q7lk25en+tNiOOn5BRmp4kCBPIcem3xvl/4v4b2q6pVonrNxETb9SlZOcXMu9N5Q5wb/M4fwfpHadW6LLnh2a+m6U7unzxu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564015; c=relaxed/simple;
	bh=IKl7/bfakQ+mbir6CzVUYw/mbCd9b8LMYnzXc1fYSM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFapYoTYwgu9Tn+ayYvYRoiSsSz+scjjtLjiW+9GIb/I6sutDbwJ/fMqpvuOCnM0GxFv3oM9FNzLCwhNcDeUSIOdvb8Ipy2Ka1MYZ/t7KscDbbMJwO8gup364KNVcH0AqKK2wCUndwtFf3xtn4My2hR9kROMG4uDfmMNdhgAYIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0c09bb78cso41574785ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 00:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564011; x=1767168811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rsqwhJopFC2L1zbCm9XHJhqD1XcSvq6YgpMNLvfdsIo=;
        b=Ry8LwqcPYhh5AA93kBKGclBQgm7qOiKtriyeaNoKU1n7n8jVz1P9HEpw7UbDWltguS
         O5vaPzUE8HlDEAIUiUtaOGVep05wSMiPaIxVyyFunEgBvNevP9gba3wFu9FFwvsp4cyU
         veszmjQKdtELsTrmu+GEWzkpSHNeIGZf83v0O6S63SAIye7FGHwS2Bq0KoF91fCvchfd
         JKDlSxFNxaStPDKkS9kxYTebYVYox9tzMnke0emISjy0hQDb3E1/khPVGev+Ic+vNpiQ
         LmzI9S+g+/V1zfxx5Yb5RA4le5Asm4YSUS07hTe7X7hRxOUck81S41Tuh89WQiY91J4+
         P14g==
X-Forwarded-Encrypted: i=1; AJvYcCUr0Vkey78ZbUExA6mjQ2+OruxmU1hucCyR9Cxjvf1ysiRhUwat4rliG16jOQf8RCdV+5ExNB6Z2AMjspCyeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKAQuwDy6A60uTvK1/n9BJvf4a1Ww+q+yOCblcGClUFUUfLqqU
	YRN13BcPXG95P/zXF8RfWAwCnzeqEpsYFbOtPsfqEKY2VJpYlE1JMWES
X-Gm-Gg: AY/fxX71Oonmj0RS+wUu4WvNhIl2nJd0+WhiIedEHtbLROe6Ft1rv/w6+fQjRnn0dYb
	/FNMpLTvd1zAB6znSQ73u/gdVLHAsruo8PmGnYuUxDw+28LbHlTzC9R0qTUPoMElrw4hLwEufXg
	vd/b0mumWhRyPFATz925jfQmS1TndDYCz7R3MOMKwIBpu+1s1FJ1abkgFpwNcPDx7OUjvvBS+4O
	5J6hANT10ypDb7D0Q8m6+xgvciot+N1OfawpMu1En/Z+sHXh+4vHcu0bQx2ct+CX8wqySLscV6Y
	QMPNuaoaIHOyKbSvzx3aOMQkkqdYvWU1psSKAELP9wmBrkuBYDlXUPjTnZ4VJTnBJzxtzSZ0ysM
	DfpX1wTcHYaIqZOMlt6dc8P5q9Zn4XfGtZV623O1/Zqv6v91ec4PXMoRlhqRd5HPJqLxc0h7rYi
	N3q6c4SuiwT0A/aV5pFXiR0yU11UJl1Y1vGswe6SXvmBY9n7hLu1QODHk=
X-Google-Smtp-Source: AGHT+IF1gx4gdVxrPiPn/7HnuJXN8IfvUWW6SODoDsIhdI2EC3jgbOqLXrP6nL3Enz7pRWD8ahPPjg==
X-Received: by 2002:a17:903:2452:b0:2a0:acb8:9e80 with SMTP id d9443c01a7336-2a2cac7e29cmr208437145ad.29.1766564011084;
        Wed, 24 Dec 2025 00:13:31 -0800 (PST)
Received: from localhost.localdomain (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c88d0asm146462895ad.40.2025.12.24.00.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:13:30 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v3 1/4] lib/vsprintf: Export ptr_to_hashval for Rust use
Date: Wed, 24 Dec 2025 16:13:10 +0800
Message-ID: <20251224081315.729684-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224081315.729684-1-sunke@kylinos.cn>
References: <20251224081315.729684-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export ptr_to_hashval() with EXPORT_SYMBOL_GPL to allow Rust code
to call this function for pointer hashing, which is needed for the
HashedPtr and RestrictedPtr wrapper types in rust/kernel/ptr.rs.

This function is used to hash kernel pointers before printing them,
preventing information leaks about kernel memory layout.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 lib/vsprintf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a3790c43a0aba..d1c682afd792c 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -811,6 +811,7 @@ int ptr_to_hashval(const void *ptr, unsigned long *hashval_out)
 {
 	return __ptr_to_hashval(ptr, hashval_out);
 }
+EXPORT_SYMBOL_GPL(ptr_to_hashval);
 
 static char *ptr_to_id(char *buf, char *end, const void *ptr,
 		       struct printf_spec spec)
-- 
2.43.0

