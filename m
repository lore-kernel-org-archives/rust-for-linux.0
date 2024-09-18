Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90206135417
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Sep 2024 22:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726699887; cv=none; b=rWBHIVlSTpCjc/9UlafteT/LRJiVSQxbqjKO5TABlPK1j/H2j0ctx55sG+Dz1/fpxMF19Cerb7b8CtLyukfADAR1IruREY3UiqNNRPPi/6O72WJfXrU86TIDhnoCIaoZRMmJEYcnRCJnNlAxMi0CrFNp7uNGTmN1REYygKr3wDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726699887; c=relaxed/simple;
	bh=GptCSnw6bLPxkpJ5oTlmZ05/oFCQAfLe7B+WX1CnGFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SAfThSeMqyclJNfmZPxXm03+wkKs+E9XU1+Qy5IiYvoBU1rS8Peq5n6yKn12al3oR2Dg3mtd6Y23v1jhT4TD4ifcO8Pr9+hSF7AXXECPtIB6sKkGef3R1FqJAyMf4r5khDY3GRRa69eYm0I9cmCfiDqFS9hA7RSsiL3SPDGVUjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPGTQ91k; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPGTQ91k"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6c548eb3380so846276d6.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Sep 2024 15:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726699884; x=1727304684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=burxdGBX6ZpEMnT/xYsYp3I9CoEZTGeikfV2oXFSZXQ=;
        b=SPGTQ91k6pJDPI/TIC1LVZg03yAQZl9FWKDFyn5CCFk800tBOArejwj59Fi+zvyaeE
         vt/VaOGyNfKd392LZbit8hK+eYJc/KavmeTKar1xvne/66r4Lw7PVqsuhnl/nag8HQUN
         d52RW5XaHEFhRlz8ytpsCVaKJSnOCj6ewHcJcDPmA+7PZ91kBiZ4uerEAQQqnOyWW2mn
         SzZXjjCv+rkejlE+Yt5GfOlmzG7X0vvEYn8B3Mis6UQJLNcXBPV1ytEm1JtDev6qRjeK
         +LZ9JnusMY7nY/kvAXXxFt8O8ZpyrTJZ4YYiF9uotYrNrrgKR6W2k72w/hLeiIDAZ4Fy
         NyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726699884; x=1727304684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=burxdGBX6ZpEMnT/xYsYp3I9CoEZTGeikfV2oXFSZXQ=;
        b=UYtvE405S5qVlfXFlRYWxhNeqVxFflz417DwOBTS+J7RxSeXvRbx13wwoX1/mr7DUW
         eyr6/1WKhZNRF3ZOoti7IaIkBN3NXwuL7yXfQDbS86moA15XkYOlNp6xNFwYOZsivune
         8/t6d1fyzB0t9EFcG8iEOhJH7srY6RTXXsSTRbqWyAl31iO8WVUA4wBkmKk4i4bEeewA
         446ZimuDt6HUE05e1ccYI+C6IkSsZYHClTbkbSj7vTwQ3xHAhWuI6pp7T8PR60p2LcyZ
         97UBD/adzyGT3a7HXyhGvBru27EQXgMclLswoOoRokmsIH4Z4n9aUp1dgzxO+77A4rLI
         hVWA==
X-Forwarded-Encrypted: i=1; AJvYcCWvrCRC0RletpZ8QhE8RR405AOXSTnY3qPY/XOOrXmt5ZboLQqf93Ey3xL0nd3nuf/1n63Kr0bmFgzH9ZA3RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrrQzAXL8Adj8Mf9DfhewzriddyNsxS7x9dbSPBdzkEzO5jWx
	mt0Josc9WuITv3Xwmy/Jd0erwsaY41zjd2IP6izqZEYdHjOGYHQn
X-Google-Smtp-Source: AGHT+IHxBipqsgbHxJxhCaeei/WWqNOBuoorHYVp4g2RhQnjUuCQq/KYosQ7yjF8uiDuAmp9c/t/2w==
X-Received: by 2002:a05:6214:4988:b0:6c5:4e4a:cb9a with SMTP id 6a1803df08f44-6c573543b92mr462234146d6.10.1726699884256;
        Wed, 18 Sep 2024 15:51:24 -0700 (PDT)
Received: from localhost.localdomain ([146.70.202.153])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c75e46f58esm1675736d6.56.2024.09.18.15.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 15:51:23 -0700 (PDT)
From: Aliet Exposito Garcia <aliet.exposito@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Aliet Exposito Garcia <aliet.exposito@gmail.com>
Subject: [PATCH 0/2] rust: Move unfit code out of `rust/kernel/types.rs`
Date: Wed, 18 Sep 2024 18:51:13 -0400
Message-ID: <20240918225115.2309224-1-aliet.exposito@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,
These are the patches for a good first issue that Benno Lossin oppened
on https://github.com/Rust-for-Linux/linux/issues/1117
According to the issue description, the file `rust/kernel/types.rs` is a
rather non-descriptive, general file that contains code that might be
better suited elsewhere:
 - `ARef<T>` and `AlwaysRefCounted` should be in `rust/kernel/sync/aref.rs`
 - The `FromBytes` and `AsBytes` traits and implementations should be in
    `rust/kernel/transmute.rs`

Aliet Exposito Garcia (2):
  rust: Move `FromBytes` and `AsBytes` traits to a new `transmute`
    module
  rust: Move `ARef<T>` and `AlwaysRefCounted` to new `sync::aref` module

 drivers/block/rnull.rs             |   3 +-
 rust/kernel/block/mq.rs            |   6 +-
 rust/kernel/block/mq/operations.rs |   2 +-
 rust/kernel/block/mq/request.rs    |   3 +-
 rust/kernel/device.rs              |   8 +-
 rust/kernel/lib.rs                 |   1 +
 rust/kernel/sync.rs                |   1 +
 rust/kernel/sync/aref.rs           | 152 ++++++++++++++++++++
 rust/kernel/task.rs                |   4 +-
 rust/kernel/transmute.rs           |  67 +++++++++
 rust/kernel/types.rs               | 216 +----------------------------
 rust/kernel/uaccess.rs             |   2 +-
 12 files changed, 236 insertions(+), 229 deletions(-)
 create mode 100644 rust/kernel/sync/aref.rs
 create mode 100644 rust/kernel/transmute.rs


base-commit: a2f11547052001bd448ccec81dd1e68409078fbb
-- 
2.46.0

