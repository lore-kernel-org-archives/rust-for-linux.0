Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC5EE56A
	for <rust-for-linux@vger.kernel.org>; Sun,  4 May 2025 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377059; cv=none; b=ksJNZg6SiNGcXPLnpgxxohOlJAVBhPpeiDcMXJ1J7PCxf04+L2ErkEvT2lssnVMOeimgzjK9ZB6eZ2GvZ5e9PkpdxtqhxCDMqA2CFiRTSHqkDElBcyE2hsYOAxYQF+3uhpS3XJxC/zPPxyI7RNEnTNreivmcXJsUj1AWI+F+A4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377059; c=relaxed/simple;
	bh=Mfqjk2b9zIS4VNeL9x9PgrtdJr57Dg9oDS36D97N7Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bvUDSlZbuBuihlJ0IVj1xAkzd1gsRVO0g4qU+7lth5h3Qp7zPqz7QG5gqukuI/YJBms+JV7y4OFLM8wgIrOmRwC81uriNVf1WBZkKWJVxZleqCK6VO4IpE788T1PFsWX+Yu4r49iPoOgAo8N/F5WD0HjvekISBr2C24K1+egUrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=MEDfMJVF; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="MEDfMJVF"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-708ccf87fdbso23940467b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 May 2025 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1746377056; x=1746981856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ohjEn9zknykaCwIzFS/zvBTBkSuuqmStVXsFpg1eelo=;
        b=MEDfMJVFkkgi7gSy10J7Glr808HIYhiCOx68ql4nDi4OaJT5sAdQRQS/Od8pjkQP0L
         Lsq4NDqmKsJYmH58O6IT+QWmHmo3jVx/qTYvrnUmyK12TJWr71X/YRtEE8NTiwyQACkW
         CSlioEc6zSFwcj8VlXKWEeyou7I3hyUx7OX0BDOBzEgM1qIVuzffF84dlsRdH29A3PlT
         wVbVyeCpwyepYVzg+taWF40vsPPCF+V0iQmbzoG42sGV4Gqt8FqD1bMR1OyK6ayvGHUT
         Q/0iYIW58tCJFunZMTxcIoLtlHuX1hHaDk0Bfz9UN6hx8ex0MXzR0RBlLphI6JjTjMoB
         vNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746377056; x=1746981856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohjEn9zknykaCwIzFS/zvBTBkSuuqmStVXsFpg1eelo=;
        b=puoH+gng51b3c+SNl5sL7Tv3HAwMfSwzzx0A+w4w9ih37mZdCgo/3iQXLPRPME057G
         6ZIfBT3+gUdU6zhreiRbtrXTN/wmOrKY56KG1Ck0yQFExwIYIP18qsySMgeVOcJcXDM+
         5wZ6d4xxTXbJFeUIOlEdhPPY4UH4K/dwWEfGVUa0OVC/xsyxNXecrJg9wcg2jUiY2cmu
         n8mUzM/+TexPdpELcLYb4BVEOn+kN06i2x2aXzSpjVGV1TVAFEMp7p7kP6KQQsD8bpMx
         Wg2HDxKWeLj0JXzpSFcoQxV55aja2LRYJsryEstXWBxL4QgYqV/W2Yk+djf63hIheH1d
         RShA==
X-Forwarded-Encrypted: i=1; AJvYcCXs0NT9kDDToReawS+8FJiApNAjEhwmiWf2Tr6tc4+q9i1nUTfApnsAm57ZVnTUCHPoL659H/oQ7FYLEYJzzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZNYZsgy40aOvsjugzjQW7Cz4ZA5m1Q2+FpyAWmIvh3g8Izh2X
	kPnJvT9RWHIdyy4ODFzXmvdELh/oJA+q+OM6Ku6OAl77N2RN7/DNvHw9L+hKK78=
X-Gm-Gg: ASbGncv/onXtnCC03wr689YOqVmeuzx+8mTSVdBrFuksJx8Kuw2jqQdpGnnwCn/dgrN
	c3fTIUMQeU1aFwbo0sfXG25zlvXpy2HG+eLKgP8MGiqd+z0XvwiSgvUmAdCC0g5wkAtz49dJbFJ
	Ix10xy6mP/dsSvUpxk28XmJkyTSPXJYR9mmcuF/TIQiHV6exgLOABngksCQnGmZtKQJ5qUxpHNL
	mEfpP5ZOZHgcB9paQ1UctFSymkdvdrzezbzdy+ltRDdkt3T73U5Wuu5VxFwo6iTVQT5mZ7bUO8x
	NGDvn/I8KrQA4Zy81yyWTfa9TnEsDUjcT6sVOci+Ri0SUCDQ7dAdEgWQ5RNyEdRbLXRw7LaCRmg
	RH/4W5YOIXTxnbltLUz3RvM/0vQ+LjcKzMXT1
X-Google-Smtp-Source: AGHT+IE6crcaBlQL/WIFgwdR1rmZkL+Suu5WMsk2ecGJ+st4J+YLF/J+obloWnbgHswWRdJKQDn7cA==
X-Received: by 2002:a05:690c:7084:b0:706:cc34:daaf with SMTP id 00721157ae682-708eaefed5fmr62288497b3.20.1746377056391;
        Sun, 04 May 2025 09:44:16 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-708c3f092d3sm17932047b3.20.2025.05.04.09.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:44:16 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/1] rust: kernel: create `overflow_assert!`
Date: Sun,  4 May 2025 12:43:48 -0400
Message-ID: <20250504164349.84149-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set introduces a macro for overflow assertions, the use of
this macro will avoid local `#ifdef`s by encapsulating the conditional
behavior to the macro. In addition this macro allows us to document
the intent of the assertion more clearly.

I also intend to add patches that add use of the assertion and 
transform any existing asserts that could make use of it. I just
wanted to get the ball rolling on the review of the macro itself
before getting started with these patches.

Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Suggested-by: Miguel Ojeda <ojeda@kernel.org>


Antonio Hickey (1):
  rust: kernel: create `overflow_assert!`

 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 42 ++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 rust/kernel/overflow_assert.rs
