Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C42F99A5
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Sep 2025 16:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758127883; cv=none; b=FyAHqAZBA7xtNoosKLaHfR6EojNyz+zUekwzYTkHmORwx5PZlSNWhZWzXEP6KNCJN+/FLSqxlSAGZkdcozSdHfT+VNcXHMN+4/lMgwZw0ZB85siWdH23UzaA2MqjaUJ26XaoxS5gCCWIXIqpEBSvBWjmBgfB7zuhPpJe9t3LZNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758127883; c=relaxed/simple;
	bh=5CHAX/eFWIie6RcVxAtrIKJ7zhEjDBgEC9JG/XZEo8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fxDSsc+P1Vd9/Kajt0KAQ+YHBmER+EWm7EEWbKj86C/dFjbMhEel8CdU+nQ6gM85BnEHSh2ZJv1xn2XgWNKqzh+vmF0dK93Bow/ypVwEAvXSb8Rfm9WJyfkpTKHTpcrS+TsHkzRRa9cnd80S+l0Qs8jxFIf6jsv0ofxyGdwS/gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1pvPFy9; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1pvPFy9"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5229007f31so2207a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Sep 2025 09:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758127881; x=1758732681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V5/sfcYMmxKdZz4FohXf1IpKXn8Gn6GevqVRpmEVs50=;
        b=V1pvPFy9QIZfbvuBSrOLgaPn1TyV7Ls9YzObwVNlqocs91d8+0McMrQMXMF9OGV7YE
         knABoLYVCq4in87LB2hRJTjCCsJ7vZ0ok6nvjO4R7Rd1qPcs8OuxZxAfxglB4vBT8YLc
         i72WenSdTBCRhIZwGEsqp1mX3Siiar56OktWc7NGCZg9r8gBlI+Uf9/bhIM2RCVksVSx
         7aQNdaFauxO5fkKFyB0Xw/WANmvMLOnAr/NcV1wk0pniNBaXVl2EkTgPAxsfb1hSFfNN
         PvJWmvV+3Xza+4OwG19SpA6LNrZVewA83d0ijZJb88oWgfo+iEQ5DPTjnsz+PfQZLdXV
         EC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758127881; x=1758732681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5/sfcYMmxKdZz4FohXf1IpKXn8Gn6GevqVRpmEVs50=;
        b=XwGPZDBU3Jw9uO2SEUHA1ngcWn3SVLqK2iRplG4hj7D74I97JhfBBS4YZrTqCCm6Ja
         m0ZgShcpcoGHAEuz21lUZbplcMhHNrLbp0btSbV6/MkkRWP6A7PoDSKtQV6876K9Gief
         dbn65wbS97kelX72kgUaKCJB3Ca+HaYM9dvriNXB1vRTd6aXjFMYYYJn2qv8COWWJBZt
         js/5VOKXQnDgKjFl1LRMzvAUPlhLKDgWMEowgt8yCit1/8cnlhUlFUlkwLSXt0PztFEU
         Ab4HeocTHeZ1/ntHo8djvp6WFNJP/seGDiGZExqfp+iEStDqI3EZ0gYLBZnvM66B4NT4
         XcoA==
X-Forwarded-Encrypted: i=1; AJvYcCWlZ1vthcX1QW71xBMSEM0xc+qVHWXq0MCrbdsLG++ZLQqHgonih0YPX8SGDNv24xr6X0Iv6dVSQ6LghaB0UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlxS3nJlVGnJBACfBLgcHamHKkRgFzPpK6NJ9yS65mbaY3ntGG
	Y3f2JFoXzbkakGv5Im/IEs+vAiHg/VpRfNK/1gJv3cf06jJ/lriu9ycm
X-Gm-Gg: ASbGnct8ZfHwt42un+YatLthwIE6TTbjOmpYdT4z1Gh7zHsObKwGb2jy5IJZoCODJlU
	KBHesvtDKOj1zNK/Tvn9Yha+Z96Vxtk70fvSBWcZ852HmSNHXczF9nzvNpAgwzOAfp+QcoYibGj
	vEiZ6GT8tjUanvTiRpq6MBVj2jszMYGl7jUeq9ObdhvE6En0EjF0H8p56S0ijSuLqmSYXkOaQIs
	QxEmUi1z0repr1GgEADXHJDcKPgSxF/ey9dUKAi0Cq2O6ESx+V3KQfp1Jfyo3QL/Ivmn0o2HTWH
	YJQyBmZz1nmh4ebkux5JLEx0X8mzbEh+eSywfGrMnd+FRzWFDHZ0YUcObOPhkYI0DPAnZ51PdH6
	CTZKpTs1eVs22muRvZF0Dptjv4K6r
X-Google-Smtp-Source: AGHT+IFm8FE3BSR5+gXsvt5+56cKgJkHI6zUkJnv5mR/WV8vtAeVCagIoQZ92DZuSp+qmtL7Ky0Cmg==
X-Received: by 2002:a17:902:d2ca:b0:266:2e6b:f592 with SMTP id d9443c01a7336-2681217ae3emr34230875ad.25.1758127880709;
        Wed, 17 Sep 2025 09:51:20 -0700 (PDT)
Received: from LAPTOP-1SG6V2T1 ([149.40.62.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531f4sm1003615ad.25.2025.09.17.09.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 09:51:20 -0700 (PDT)
From: djfkvcing117@gmail.com
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Onur <work@onurozkan.dev>,
	gregkh <gregkh@linuxfoundation.org>,
	lossin@kernel.org,
	gary@garyguo.net,
	Tong Li <djfkvcing117@gmail.com>
Subject: [PATCH v4] rust/fs: use intra-doc link for `EBADF` in `BadFdError` docs
Date: Thu, 18 Sep 2025 00:50:59 +0800
Message-ID: <20250917165106.22262-1-djfkvcing117@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tong Li <djfkvcing117@gmail.com>

In rust/kernel/fs/file.rs, replace `EBADF` with [`EBADF`].

This helps rust-analyzer to resolve such references.

Suggested-by: Onur Özkan <work@onurozkan.dev>
Link: https://github.com/Rust-for-Linux/linux/issues/1186
Signed-off-by: Tong Li <djfkvcing117@gmail.com>
---
 rust/kernel/fs/file.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 67a3654f0fd3..f3153f4c8560 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -448,9 +448,9 @@ fn drop(&mut self) {
     }
 }
 
-/// Represents the `EBADF` error code.
+/// Represents the [`EBADF`] error code.
 ///
-/// Used for methods that can only fail with `EBADF`.
+/// Used for methods that can only fail with [`EBADF`].
 #[derive(Copy, Clone, Eq, PartialEq)]
 pub struct BadFdError;
 
-- 
2.51.0

