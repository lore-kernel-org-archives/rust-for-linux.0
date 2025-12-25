Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF122B584
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 22:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766703443; cv=none; b=iWg/vpQv6J/FuRFLDjy6niH3TrI1q/aiI/D90JrCUuCHwDF/gB8UDlQyzB2i9Cg46AM1SsIL+F7yzCR74Ky9v+Mn/ityMa5DsRB7Jc24X1H2cv6Egi6cCy0G5QiWZLtq4O2RYTt7jBVZxlN4YkHGtb/WOuRGPCt08CaQabcQvt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766703443; c=relaxed/simple;
	bh=IKl7/bfakQ+mbir6CzVUYw/mbCd9b8LMYnzXc1fYSM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhF/iWx5hbx8EeO64Z0gTYH4leF4gb/4FzP6Rva4s9bdQ6ZkxFfROEvzfNMBNVJTCRgdpydOCd6ZFgaq60mltTe1DrQB9ALHMNKpJQrqIDT2TZ+3fl7IDkPjHbeh7g8rjWqJwt7gwpSrIEZHTTkbZH8x280VRviT+v2rykJa/i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29efd139227so91140925ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 14:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766703440; x=1767308240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rsqwhJopFC2L1zbCm9XHJhqD1XcSvq6YgpMNLvfdsIo=;
        b=M9nv4a56ExGlB4s83pMsmVq5BsmEzP6QkidNTOT91Ngt8U+dQuCQLwPzvmwY6SpQND
         E9mvsIxKazfidGuPrnuPt9E76XzOD/xHu+2UMKuVcILKQDV+SPuFIeNoJYxbOPhI0kZZ
         qAryjnfYw6lbWmYdwtX4/hV+wua80Jow2YmnG/MBUKT7zWuRf0Fu2+Pc366xw3yqm+pI
         s0KMBf/JTP1cXqzoQTjst8wSW28MA9qlU8iX7mkyyq/ssbTT/etODPI3MMWCsuEEjbbz
         bZesLTLhHXvinjvKbaXk+qzfSOw5Bzesv3KDKpShiXjuKnKVC1NUaM9v7qkQJBcI1Nhw
         plVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgW+phDcUSURZbjWNYZl75OdBFII+Kg1Qx2qJUkyb5XL3y8wc7kS/tGGm5sOubmhySx0v+XS5Npf8U/Rrdng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxj5BGb5P8JV2+hrlP9baQWf72K5fnpLvmp0Qw8yZAduIha7qV
	xYsJYuJPrIMZwJJg9VTkRUsdU2yYr8583u1Xu+zUH7pjKRl7Dxl364Ir
X-Gm-Gg: AY/fxX7xp4jnCGwLRy+56jGhBoBAYbTsAy0o6ixgpjogKyIe0SuGVhhA/dR943zgqBn
	HcrLZuExqFIhmG5/65AAQO0UMMwpD8RNIsz6nTQD26ILwslggj9OuW4CQ+CMn1GS71Fm8rmETT1
	ONqSEKhkJxD612uRz0+tbh9w2DcQdIoqGev/69M610tUEJnuS+aXdAyCskZuphkoV+cQE31Bxe7
	woyT6q9W+k/H5T/bFSOk2EPKrg2yR1Ie/j7BUDXJGqM+1tkAtPM8eichaMnHtCZFC/4V5HidKu0
	Z6Viixp6IbkbgdGS24KzKz4iLewHQub0nVv3RanpxQQxWK2AoG9QnbYt1Dpfk59gyIqwoakHz8k
	HqYrE+lAt8gPjaVfmPw9VB4wwxbjSww3OpXEfz+DDOIm9x3FkGYkOPMtov2Qupp9IlJ21BD3qKQ
	E040md48r33SsHfWojUYQ=
X-Google-Smtp-Source: AGHT+IEMn7Hu1V46QXgTmMU675dW+pvXi3zN2d/RNkTHv8zphuMXbYEd2ajN86ejmnwgwjyQkbRfQQ==
X-Received: by 2002:a17:903:1b6c:b0:2a0:be7d:6501 with SMTP id d9443c01a7336-2a2f2329b6cmr193776815ad.27.1766703440380;
        Thu, 25 Dec 2025 14:57:20 -0800 (PST)
Received: from localhost.localdomain ([103.56.52.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm187308755ad.44.2025.12.25.14.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 14:57:19 -0800 (PST)
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
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v4 1/4] lib/vsprintf: Export ptr_to_hashval for Rust use
Date: Fri, 26 Dec 2025 06:57:04 +0800
Message-ID: <20251225225709.3944255-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225225709.3944255-1-sunke@kylinos.cn>
References: <20251225225709.3944255-1-sunke@kylinos.cn>
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

