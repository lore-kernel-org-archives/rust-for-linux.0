Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD3298CA6
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087483; cv=none; b=BYsODhsTfUBO1NOJZPk46CqAgtmFwLXpEiPeoxDzJHKXVTCLnJwiSigvWjvqfOhVmDFiHLTESzbcp86dSnXs8Yvl3+2Xyopi+xblcGh60k4/GNwkOR1yICY+wTAR975vyFoRFd+K3rOIx8h4qkSBcBno/1dphsie8rvmDLt6z0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087483; c=relaxed/simple;
	bh=DMgtdWwqWv9x/EblqrMqcsglGq4HJEU/EYiCkh4q8Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLjM6tZ+RAR4K9yrVlB0CMzeCycepqrov8ZRA8AJTVePXz/HWlJV8dyedo4E8FBLbn/SYKCz/zwIYSFPdXxciEuKN9WdQ+wriu4Z+leXxJFiLPMW8Aq+DMedK5iVkVVbuOjEUwy/jbm7/0tXNv5A+Apsc2XXqdM+p+jYV0Yi6uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HF3iOvqm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF3iOvqm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0f3f74587so139731465ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767087481; x=1767692281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4WtlCaBVFtUkraY3Wyh53AdYOFtcOjjADX0yNxvcWSQ=;
        b=HF3iOvqmi8/cvFTL4bPKAfOncEXuy1cb8uo1D0+9XVi94Nzb6d5VT5nnj4HO2MBtrl
         L6VCaCCtaJ1CfjgBJCntAc9k+0MMxXQuJgApsm6cx0xaRT+gEzmRaOpG6aGc8EcrlJ3C
         rlzZjbrSk3O3lO4S32A0WFTP5M5lXAET2ogPLysOAsmaloRiZsrZljEWSvUA0//BhBEh
         bvtv2DcyVC95UsvPtduHofX3DRrhKCRwVvC6MWbvA+ThBLY/w/CGtmfSy6MOmE9abBQj
         5YUydsMy7LRWbmLfM2dd+qUGndcbvHLwNgzRxv8DrdKV8SridfKQIJuE7wbwH2G5kMbr
         jazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767087481; x=1767692281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WtlCaBVFtUkraY3Wyh53AdYOFtcOjjADX0yNxvcWSQ=;
        b=TVT8rPipJho51ZFdoo2XNh44oa3SNj/3zizsd9afbISMFmJz4lxU6OJAHvHp+dvGF/
         zhFGrhyOr9peEHVcGz5A9+x1WjEeSwcwgcRIMd/OpkXlt6XfPUxrIy8ZbXKvqbQmiahR
         Y8HNfAYO6n6OADlvso2v0TEx//niSmjY8KvugGMdTL5CswjaaxNBFbxumtee1qTY94b7
         /CeLs6aTZmSXyCigF91t2cwq95dMrrbKTKpivaQ/SxIdHA3axrx9vmeBne/sHRURpVxH
         o9sQsTn8tcpKzdk9lvC1v4jzieMhjp0+UdZQMPJMeidQCUksYreNCQalCPPwd9jsKZeN
         d5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVGT7Lf1FL4KklAmqv2CZGeS1mIECUmv4Dl5MaLqMRNEp5KtEGWU/1qMK7chyyppKIe/xTxDTzMRRp10UYpZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZJ4uH/QJQZitUVveiSIYBLD5jyx1/Bwk0RISZ/qzS5jSiCWSK
	5qPW+HaUxoRMGI687l5b/NY1/xmOAQ0uv0pacRcKPsh+oll6+TN1ezlx
X-Gm-Gg: AY/fxX5bWWLNT98GjQEoXIzX33Rdh++X7VVhm7m5UbGyyBIFdioYqpzEvYeCJcjyEVl
	+4W0HQHJwpgbOfcNBAf+keeB+j7zTGOUY0TYreIfHYfE1Na7x/UAY8RYcwRPHOUZXqSX1Dbsx/4
	C1LTMhLYfWVsgjkaIaulVbEj2z6eirElV9DUGLJM5uHcykC8E9I4XDRkmpPCXkhyA4q5kI+OjHt
	hd2dBiyBh33GhP+/7gEb5z5GPuHcBRcZ89WPyTiOoCAwzslEVY42TP0Qb6BpNZkA4jF7qnGSc3r
	+zhOdan+DzqjiBpsh+as92PUUeiv5xOCfV3mtaPNd3bsA7JLmG7+bt0PdrqSggJRNyho2/7EuCr
	2F7qbifqWqw8kScjmg7IY9Evq4FCZXQawcGGTm885cs10ASZfTPtbf2EFLXE9S/qfaRaxZZOiMh
	24RQYTPmJi1M3RvooKSd5o+W/DKmKEY3uZJ/9eQfeJ2a9f3dWG1I5/m68fMdHGWw==
X-Google-Smtp-Source: AGHT+IGGAmAXz0d3E0h46djE0ZpymOLsihSS5Q1UOimg395RHkiVaN92oLecMAXdeE/hQnv+Z+Uo2A==
X-Received: by 2002:a17:902:dac8:b0:2a0:ba6d:d0ff with SMTP id d9443c01a7336-2a2f223177dmr320384105ad.16.1767087480920;
        Tue, 30 Dec 2025 01:38:00 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm13378158a91.9.2025.12.30.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 01:38:00 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: aliceryhl@google.com,
	arve@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com,
	boqun.feng@gmail.com
Cc: a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 0/3] rust: Switch to kernel::sync atomic primitives
Date: Tue, 30 Dec 2025 18:37:15 +0900
Message-ID: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Convert uses of core::sync::atomic to Rust LKMM atomics.

Each patch can be applied independently, but all of them depend on the
atomic bool series.

https://lore.kernel.org/all/20251230045028.1773445-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (3):
  rust: revocable: Switch to kernel::sync atomic primitives
  rust: list: Switch to kernel::sync atomic primitives
  rust_binder: Switch to kernel::sync atomic primitives

 drivers/android/binder/rust_binder_main.rs | 20 ++++++++----------
 drivers/android/binder/stats.rs            |  8 ++++----
 drivers/android/binder/thread.rs           | 24 ++++++++++------------
 drivers/android/binder/transaction.rs      | 16 +++++++--------
 rust/kernel/list/arc.rs                    | 14 ++++++-------
 rust/kernel/revocable.rs                   | 24 ++++++++++++++--------
 6 files changed, 54 insertions(+), 52 deletions(-)


base-commit: d4cd35bacb06d53acf39ff248ea2b3eef50573f6
-- 
2.43.0

