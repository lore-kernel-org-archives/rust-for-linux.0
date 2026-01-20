Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787533431FD
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898319; cv=none; b=uNhn7JezojiAhEylgHOBHGyFqEULstmGvteLOP9U0UJVilqIIPiid6jeP3dbey4GZTU6MtqK+Zh2E1VeXSQomvGmOEaGrFgrgzDueF0ygQobQXemLr9IRTd9VT3q5vOc0lHhvxeGMdtl7hwchm09AZKp8Ds5SZZEdG7yzql0npE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898319; c=relaxed/simple;
	bh=LLa1LQvSAhlvgqMmTcjCxlu3bNuGbAB9RUrYE5s1eS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cq1Ld14ZJm7+WVKZ+7C+tRUI3apy8WazsHaYSbwz/v1q19M0GmMLjsiwRfnn4gw0K1+PXV4j6fpDzM9VseayxU2+r8rIHXaHntKqyAsmaqzZb4AoY5kLNzZbpUv4AsAjr+O8DsU/3CHRpwsHjWahrebs1u1rUhhwaQNW784Qju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f1bc40b35so51602445ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898316; x=1769503116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTy7Gei9AY8cB8+6SRu94ohQCeLv8uIcQrsqZtsTuaE=;
        b=lnYGMZd1fs8fX9Eccd5hgbCE0EEatBqPUNpLwlzj0Tr0cHSndmMt9ELDqxSkqMrPjZ
         6ty41MYNy6Pl6noIaLe7Cq26TIz8L619akk9xiagzIZLagasBRNI19Au0y1oLldmbrox
         okcjsEcnBdsdiK2EI3UAeSFDzWKjlRoUNNwZoXxLBfA3/5XuhurORBQ7+fbz20QupCdp
         y7yzTdqHwx6ANXKtmY3Uj4DFs/czW6RsaISqtmuN1ra6H1T4DiZu0MosSIPHhil69x1/
         eTb5ByVr5nkqfjbUO89uYTB9QJpK2Urf71YEEqIk44hAHLG5JpGi5LF087bDy71J/Cak
         Mjmw==
X-Gm-Message-State: AOJu0Yyoq9n4KnXfAyfux3AjQ9RNZKJxhkD7xnnwMAVrOFRWlRSnDT+6
	016+IffmmKX4vUwosyJyIlRcGUUjM7IXIzgDXIwPmBjQGElyM5Rw5D8nHxJUnvZB7GU=
X-Gm-Gg: AZuq6aIMuOZZQndaHtcRz+muZOAvKPJaNcPlRt3416QgGh4Cdh36XYwzuyt6E58JJgD
	NbimfwrmHIBaetnPdW9Lo7KP0xAjzznwZBcY/p2CpR8qJACmReiKMIXLopozUrFVg7AFPgWxCCy
	G5OgIGB+sZR9Xw7kSKTVbf5JKMWw+EWb1E6uAkRuDn8Y5ymcpm8+XCp1moNKnblRNVybtggTBlX
	HfO20nOHtw30M/A5e9RSvdarykHWIagciwkebKdZHujkAmgb6FQVTCqhkbzLAemE70s+rov6dnh
	hnmQgvKZcIiN9bRx9c46ENdO+w4VodbmLDcAbfFIEI6Gdl7izhjsDeZFXmKafFMTZzpfc+yJ6LN
	3z5IwIfeycx8S+HnKGYkmjk4zQnHeS9lMtSkIiHlWpQjNX+A9N2wbHz1a9NHVSHs2CTJjx1BTr2
	UT7Fi62YmR4cnaJw/+D3A=
X-Received: by 2002:a17:902:cece:b0:2a7:5171:9222 with SMTP id d9443c01a7336-2a76b16452bmr10966605ad.49.1768898316377;
        Tue, 20 Jan 2026 00:38:36 -0800 (PST)
Received: from localhost.localdomain ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm115114625ad.23.2026.01.20.00.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:38:35 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v2 0/7] rust: Replace unsafe core::mem::zeroed() with pin_init::zeroed()
Date: Tue, 20 Jan 2026 16:38:16 +0800
Message-ID: <20260120083824.477339-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series replaces unsafe core::mem::zeroed() calls with
pin_init::zeroed() across multiple kernel modules.

---
v2:
- Remove all the comments about zeroability

v1: https://lore.kernel.org/rust-for-linux/20260119065859.1914178-1-sunke@kylinos.cn/
- First version
---

Ke Sun (7):
  rust: auxiliary: use pin_init::zeroed() instead of unsafe zeroed
  rust: block: mq: use pin_init::zeroed() for queue_limits
  rust: block: mq: use pin_init::zeroed() for tag_set
  rust: debugfs: use pin_init::zeroed() for file_operations
  rust: of: use pin_init::zeroed() instead of unsafe zeroed
  rust: pwm: use pin_init::zeroed() for pwm_ops
  rust: security: use pin_init::zeroed() for lsm_context

 rust/kernel/auxiliary.rs         |  4 +---
 rust/kernel/block/mq/gen_disk.rs |  3 +--
 rust/kernel/block/mq/tag_set.rs  |  4 +---
 rust/kernel/debugfs/file_ops.rs  | 18 ++++++------------
 rust/kernel/of.rs                |  3 +--
 rust/kernel/pwm.rs               |  4 +---
 rust/kernel/security.rs          |  3 +--
 7 files changed, 12 insertions(+), 27 deletions(-)

-- 
2.43.0

