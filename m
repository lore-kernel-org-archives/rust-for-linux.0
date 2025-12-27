Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C9D3A1E96
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766806820; cv=none; b=gZh3aKhom9dgp7rZiLekR2RD214zr7iSSl+gtopmmPUNKZ7vRt//kq+ziCc43XI51OC+FZL0xf7mOs95nY8bGtl/qOTJaF0L9XwDAo57h0XfyE8/if4+/EuUT/tbEiJ18JsTCn9ioImCeWW4tSUSJCrxAmdTXJMX/Y8stQY/d2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766806820; c=relaxed/simple;
	bh=IKl7/bfakQ+mbir6CzVUYw/mbCd9b8LMYnzXc1fYSM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqFQ1DVg/3rSdWyF4eNm9u3SfPf5/5647IbE22+qVSmRgkLs9FcpiNT5970jPwcK+frPfcWaDVdciK7PDpdtQS0KJi7a2v+IyTTcBsbU/TqxwnR8tf5HWgw/I32efEvZAjbqWw6VO6Xr2w0kMQaO7ugRy7WKK81II+YjMxKQTtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a1022dda33so62349475ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 19:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766806818; x=1767411618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rsqwhJopFC2L1zbCm9XHJhqD1XcSvq6YgpMNLvfdsIo=;
        b=HfhrBqT0xV87MIMNtyH3DkYVEp++hyrkumXd8vV2llUk3UxJJkOplzX67UVvbbfRAf
         Kt1zYab1MNyL7VgsNncfmiBhQGJw87CszedSg8EjX3tnjh6/yrK/7/jUEHT+BPfKkVTu
         kQEAwt4lItk89HZHAjIIwTHo+8D0qD8o1CZOXRHrzL+ISWo//xtsNpikm2NLWPaqyB7s
         4B43KtvCmViaAZSpYl9QpJ3K2ETKFgS0AqyJOZPZOQKUCI5r5p/RRlaGnlJJ8mH4Af0W
         cB7JLZEuVUC+OFC/XbXJbfBIzixPu1FgyD1LkQgL/LvzQpE2Rr/TqhB7Mv5fv1gFPYkw
         KO6g==
X-Forwarded-Encrypted: i=1; AJvYcCWnr3J2eqihmaCpJFIVNSeIh0yDFF+mcNq72CccxhHu/6D5EwXJYt6ttZ5bivIe2Mhr37Rgod6PfstYAG9M/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw728H1k/jFc4vnOj2nl1sZlYhX8ZoWp7VwDLhYLxseJMQf4efo
	sM6qQF41fQJ5FwgUc/eV9PjfTb7ARnoYOv1lbViSlO7Z6s9TVeCs6Av7
X-Gm-Gg: AY/fxX77q+yUXM78cTmdiBAMkCDKEY4+dwChrbVQ4T3PfiOem5PSk2nnIvLrM1P+EPm
	z811bSUtWWiwYfHgvtwBGetdDqsqKCLfePucicPWPvpdtI9Ecgk8cYt8ClJgWZeGLEfnmWeaCdr
	vJo9Y1Ti8t3JQkCIGD56pPSU29pnDNQew8lCXw5bjpgrpFNQKvCEXubEOsi3bSdm7Db48cJxbjh
	hDYkBbtBIBW7IBVGMpIBhEJ4tPefOjDUC8dIGxdTPPNynbexMtm3geGEVtu+zAcdedlFkr2x8kq
	vsSox8BDYSWWg5ttL0vSM/+syLfocNccf2skMVs5EvnCxtq7vs+OJLpLaVBuI5i6trxRXT4btjo
	626XN8uWjZk8p6/kHpVsimLL+yYOa97Mmt1XKOgzX6rjNLq+TRMi2lrzCU15SqKgFEl63sbwyxx
	R4i2LnQwkOPFSlpCdcZaHC6pjaCjp+u6PNGBMcAJOoKwf5KnzCuUMt82frzSF2XyKW4A==
X-Google-Smtp-Source: AGHT+IEPnBlLCFTuhQaIFum5QQa1/5maXsyNwIMFh44qFBc9IbifpNU2n/uN1iaNYlEutQ308cE1fA==
X-Received: by 2002:a17:902:f542:b0:2a0:d596:a88d with SMTP id d9443c01a7336-2a2f2427138mr235226645ad.26.1766806818354;
        Fri, 26 Dec 2025 19:40:18 -0800 (PST)
Received: from localhost.localdomain (61-221-120-112.hinet-ip.hinet.net. [61.221.120.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm215323135ad.44.2025.12.26.19.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 19:40:17 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v6 1/4] lib/vsprintf: Export ptr_to_hashval for Rust use
Date: Sat, 27 Dec 2025 11:39:52 +0800
Message-ID: <20251227033958.3713232-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227033958.3713232-1-sunke@kylinos.cn>
References: <20251227033958.3713232-1-sunke@kylinos.cn>
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

