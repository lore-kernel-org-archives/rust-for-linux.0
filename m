Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179FC13D8B1;
	Fri, 20 Dec 2024 06:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675951; cv=none; b=Dg8C34AXAVR1vv626xECyX0pwnx9ONyRP10kohFTddqykwmgN1fjFp2sIkFVX/tipAqjA0vCDWRRFwjijqvQKKxH4y9tm+JLphuYt6CxX53wGBm1oasP57VfOpRL7ASRNs+ojyCrn96BCeH4zmgN3To9KBMomS0s7xRgI2rcebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675951; c=relaxed/simple;
	bh=Lgiv5NwvtYNJkew+YeD5sL6eMA5tuDkXi0wR9eIFCKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uJU22wsXBMkXwJLi6X1/pIM/G/rliF28wrJlJycFu0NmqZFmtN3txH/PDgNLx3mBalrrW19m5hW44pJ6UGLiRYICg1CbiKj8ZSFUMG7u5D5m0VAPBxdoRLpyYUd6QwKGchFstSyzGjspxt/GigURdgKYKRk6fePISO9EsM13xnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAYMBzL7; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAYMBzL7"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so1342183a91.2;
        Thu, 19 Dec 2024 22:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734675949; x=1735280749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQB5A/SyTRGtVVXnq1B+mKahvJZnjm7EEcDirVk2fH8=;
        b=jAYMBzL7KVLq0oI6JTFLnoVi0owKjMJxI7ojhB7oUayOxE9nm2oUzy+x78IZmuMtnd
         SEWl+f1BYFeuqhSD6QclL5ZfP3FkhQ0dFJw93Ap8OzH7TvnYH74C5oQBVkcE/w2o7Ivb
         UKLrl5YytTQVdKnH4OhnJM4STDmhBqKmwImjp0aPwIv60ZqHoFMb14hBjFtWSQsi0FrE
         rf/bfRl4UuhaDOyRzT4b20bgXD0mF5De8f6Cpo2qu5woyhkzZnF7IB9x6rg6Sw7GDI3B
         FQMQBkb3eRj+IVw36gwqqNq9tqBKJnic6lmW5jkmNCOEYe5WdXn6m8hAEi4fF558Uxiy
         h4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675949; x=1735280749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQB5A/SyTRGtVVXnq1B+mKahvJZnjm7EEcDirVk2fH8=;
        b=bqmtoTcoQPzWPiit23Sv4OH27iDObynb0owJEd6cyoyQiuC62fto6AYnUwzdTjesnB
         ucma0H/6MJm7RydqGGo/2BxnGEuhuL9JPl4ShDA1TQgVYFXCYTFqEZvIq/nOFFw/5YF2
         uCuPwl/ugMEpRdThlVyELj9ZQD/rrLZOb7KrSMbKkSeerxXG7O2mBUdLR8tnEwJrAA3U
         1oVph1AmAN4OZC/eP9Iwgj19amMdIOgyaz7huN/BaxZ9qCU6gfkniBCZucX05hNoEVhG
         IMKQAADggmUS6GaPaxus0kWNPrhau3vsuT24FdHD6XBHSHb37qXuIloEjcfVet+EFWAB
         uxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFJX6SzxB1VGTLW1s4SaOIBhdyAPfjFHv2wvJZqgAQfgdYecLFY3q7L044rdHXqGoBl2AdfZHe0mCoTIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRrrI4HAmjIIeDawkXFeA4DtUxsmkwMH10MidgmY3c3pNwB4qO
	NLun0hRbzUC5LP7xj/Ipaj05e2552ns2q8+0dv+QClNlQIqX97x/
X-Gm-Gg: ASbGncs5kGJIwHaruTNJ1BkGJTtQqHK/vpm2+Tz968VbFlIsNw5pUjmEzRltNzPYHpm
	Bl+fPZjueo44uGYzq3XkoD2Hh0JbEx4orP6eS7p8LakA7b+aj4qaBpgbXI91zw83D9Jk2dK0MFQ
	5jIQlL/9B2omH787ZS9rU/HfMHHwUo+Kdba0i9wO2K7n4wM5EJSAk4pG/mtdpZlRUVw83xLAvO9
	d7gqPxYIO6Cvf2DbViiLZ6IybNMwW1pwb1TRpxdE9U2E5Qu1JiYp0DUQAmZKfyIEu0=
X-Google-Smtp-Source: AGHT+IHxb6HCy13xDBAVQo43uQhQi3K/3xAJFL9q1tFyJhZW1Ihc/6nBkqG4EO5dl4aJFDAQHDXpvQ==
X-Received: by 2002:a17:90a:e187:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2f452dfcd26mr2723938a91.6.1734675949308;
        Thu, 19 Dec 2024 22:25:49 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::b10a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca007f3sm22001755ad.228.2024.12.19.22.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:25:48 -0800 (PST)
From: Jimmy Ostler <jtostler1@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Filipe Xavier <felipe_life@live.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jimmy Ostler <jtostler1@gmail.com>
Subject: [PATCH v4 0/3] rust: add kunit doctest with doc fixes
Date: Thu, 19 Dec 2024 22:25:30 -0800
Message-ID: <cover.1734674670.git.jtostler1@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds a doctest for the `ArrayLayout` type, as well as
implements `From<LayoutError> for Error` for the internal `LayoutError`.
This change in the first patch is required for the added rustdoc kunit
test in the third patch to compile.

This series also adds a change to the `stack_try_pin_init` example
documentation, so it correctly imports the `AllocError` kernel type.

Link: https://lore.kernel.org/lkml/20241203051843.291729-1-jtostler1@gmail.com/ [v1]
Link: https://lore.kernel.org/lkml/20241205105627.992587-1-jtostler1@gmail.com/ [v2]
Link: https://lore.kernel.org/lkml/cover.1734477232.git.jtostler1@gmail.com/    [v3]
Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>
---
v3 -> v4: Reword patch one message for clarity
v2 -> v3:
- Remove `From` implementation on `core::alloc::LayoutError`
- Move changes to "rust/kernel/alloc/layout.rs" to separate patch
- Move changes to "rust/kernel/error.rs" to separate patch
- Change documentation in "rust/kernel/init.rs"
- Link [v2]: https://lore.kernel.org/lkml/20241205105627.992587-1-jtostler1@gmail.com/

v1 -> v2 changes:
- Add third assert where length is smaller but still overflows
- Remove rustdoc markdown codeblock languge signifier
- Change tests to return results using `?` instead of panic
- Remove `#[derive(Debug)]` for `LayoutError`
- Add `From<LayoutError> for Error` implementation
- Link [v1]: https://lore.kernel.org/lkml/20241203051843.291729-1-jtostler1@gmail.com/

Jimmy Ostler (3):
  rust: error: Change `LayoutError` to internal
  rust: error: Update 'stack_try_pin_init' example
  rust: alloc: Add doctest for `ArrayLayout`

 rust/kernel/alloc/layout.rs | 19 +++++++++++++++++++
 rust/kernel/error.rs        |  7 ++++---
 rust/kernel/init.rs         | 22 ++++++++++++++++++----
 3 files changed, 41 insertions(+), 7 deletions(-)


base-commit: 0c5928deada15a8d075516e6e0d9ee19011bb000
-- 
2.47.1

