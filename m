Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011D2268690
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804315; cv=none; b=uu+fRYK/0F/g//C7zWmTcwdvs0XtlyWo8pvCh0kZtnXq1rR47+uRkjueKMb8j/tp9hzYWzV5frQGBvujhLTRP6aVL0VjpC/2pj+6jwO23tmbeS38w6M7EzYV0jhq2FdVxHaaubGAy3s0HpNC8iBo0KQL1IgJNkZjd3PpHWcCPXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804315; c=relaxed/simple;
	bh=Gn49IRYvjd7zylSVbmdIOWMcvcA9dMxwDiV/gmLwnoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2v9VWwxdb5KYNIETITJNpM1SY03bjKl13V2G90IIJHIhtJ5vVKtScUHFanyjxLyGp+LdL890zbPidORF9YsL5zj7QcKZO+XfuacPxpi8pvfC0TJJi5Ut9QiZm+MBJuKsMVbw0gmzcxNXwE5/Hqgpe9KV0e1Of6X0md/1ZnUs0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWD8pqsj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWD8pqsj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so39317555ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 22:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768804313; x=1769409113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPHtzoxpbYqg0cbp21Q3Gc3HE03qe7OQwn+Q08MeyKY=;
        b=eWD8pqsjU3x8WrhhKFUNa/m0h5yijyqVdcXedGCyMp1JgsTBvQEyq+xFEV7igrJkCy
         mT2eSv2N5YaX2G8uRww6lNrwemL0Mj+dzR11sdVvmilcRKiO0GAgYU/Q4+q+JRw7pRx1
         3r9qLMmGLpsgObhvi+5uF8kAHnqxSzzD8Ypak6cttb31iLYJSf/4Mvob8R9f0Z+WZNev
         CF+ypeUYuSpiG6/l2Cc047kxo5Apur+a0G5NU+UFzA4jCUaTuaSECayN+FSex4dtFag0
         /qUkR4LgbZwrmq92Biued7t+tXwfAbsibRD9W9Gg2rG7wcp0GLcgBXGQihQt28/9L6oK
         /jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804313; x=1769409113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPHtzoxpbYqg0cbp21Q3Gc3HE03qe7OQwn+Q08MeyKY=;
        b=U49hOto3Gh/0GofjnoJ3FlJpMpgjYvid+Bcnw2q2Jh9UP3k5EZj/IYst/01SAL+95P
         KXmjRwiattNamGklfYvix/WcxciTrt/T/PVh7jWse3+P/Ash4XpP9szR/Yz6ac0DDwA9
         /+vlUuy95czQ+fHQJfyizmdw657nMES9nttYW990vPh6JKPcFuOziXJ3dNSIFGMqEDSB
         WXQM3knBfX1wCm2FXxpx4fEn9sqKPVLEYw8oKttvquaeEbkg0va7v1PIX3yzpVLfCRPT
         1o37N2Un/7lZ/xVYm3bTHUeAUdgvp4O3+HXDI0pE+UGRXt/xy3ySJs5P/fKSuZ2GcpC6
         7tvA==
X-Gm-Message-State: AOJu0YyYZ/YIif7U5Qpx0pUhDf3z9BBeNsj/oWP59aFhsQsdKzh5SDZ9
	9L/VYjXSN0E0y++561suS14rpRfhI5oS/N0kySiSpT4/4SltsqwFqjmfb+rbrQZF
X-Gm-Gg: AZuq6aIH235GY2RuR1FbeaLwz62DqPT9tImvsh3GCIGlxWEZLTYZnbsVyf7Mxq7Kdc8
	3AVOn4w4beFLOnHUeAiBX3xtJaggU8jTxrDFh8rwnoXymFbENMy6r+NYK4pEoVjwu6a5PtD+3X7
	uO8dLhclD7QH4toKZc8siWcm982iz7TwntNjN1cYwHjU0lPAhioK8Uxph2jW4JsVZKUrI85jyZd
	ZNwYsje7GpbbLHkDDK/dqLqT2HdaymssslKhLKdj1hrIZ0QgHJVlJtd5ZPdXMr0rvnYCO1280Dj
	uBc9Q08k9h/oGq89DJj8GrrTKtJF/RbDJ+pvyQtgnHImKngUD9+v+uYIxm8eK7d3bnU2zMBSjuR
	4OjulDqJqz2B5kFMeRFXQQNdYmC87GyXSI9uC5NCWfqHcEpOfrTna2VirZAjD7XsHLRBS/DXw4r
	vEu3jtIlKh9r6rbD/XYVjwMgbhL0I0F/+w9FAdXbP2GkpuPuDwfxo=
X-Received: by 2002:a17:902:ea02:b0:2a0:d403:a2e3 with SMTP id d9443c01a7336-2a7175a248bmr103631265ad.37.1768804312770;
        Sun, 18 Jan 2026 22:31:52 -0800 (PST)
Received: from ubuntu (softbank060152129044.bbtec.net. [60.152.129.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9f0dsm83572755ad.31.2026.01.18.22.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 22:31:52 -0800 (PST)
From: Nakamura Shuta <nakamura.shuta@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	gary@garyguo.net,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	Nakamura Shuta <nakamura.shuta@gmail.com>,
	Kane York <riking@google.com>
Subject: [PATCH] rust: str: improve safety comment for CString::try_from_fmt
Date: Mon, 19 Jan 2026 15:29:25 +0900
Message-ID: <20260119062925.1647-1-nakamura.shuta@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve the safety comment for the `inc_len()` call in
`CString::try_from_fmt()` to clarify why `bytes_written()` is
guaranteed not to exceed the buffer capacity.

The current comment states that bytes written is bounded by size,
but does not explain that this invariant is maintained because:
1. The `Formatter` is created with `size` as its capacity limit
2. The `?` operators on `write_fmt` and `write_str` ensure early
   return if writing exceeds this limit

Suggested-by: Gary Guo <gary@garyguo.net>
Reported-by: Kane York <riking@google.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/936
Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>
---
 rust/kernel/str.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..d1fb79c38282 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -828,7 +828,10 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
         f.write_str("\0")?;
 
         // SAFETY: The number of bytes that can be written to `f` is bounded by `size`, which is
-        // `buf`'s capacity. The contents of the buffer have been initialised by writes to `f`.
+        // `buf`'s capacity. The `Formatter` is created with `size` as its limit, and the `?`
+        // operators on `write_fmt` and `write_str` above ensure that if writing exceeds this
+        // limit, an error is returned early. The contents of the buffer have been initialised
+        // by writes to `f`.
         unsafe { buf.inc_len(f.bytes_written()) };
 
         // Check that there are no `NUL` bytes before the end.
-- 
2.51.0

