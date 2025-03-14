Received: from a48-100.smtp-out.amazonses.com (a48-100.smtp-out.amazonses.com [54.240.48.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F8A32
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 23:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.48.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995714; cv=none; b=i7dQTjQP42V4bo8z9cHuBiLUTNoQZTUO1b1vUPCGmvmU0bWzS2aRxlcTZYOhrokFJcX8Bj3r0ZHoL9iMHuKCNcNkh7u46Qq+Of5L5jpIH4feR3bPuCtke2D+qbYCBJ6cwb2X/0tTNTxV86vyN8YRIE3XGE2aQZbqgS95ldDWIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995714; c=relaxed/simple;
	bh=zeN4pha2H8jIKBvdYYskbvG+K9NaxwB/yf0WEIbfuWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbh1NDy83v2ZdD3e4jpe5m1bTojhVArwC1VYsF3m9JTRa4vVhcTUByhRKr0I41k9XeNPf4pH1+m0p83BAGEpdPYb1ytRUCcssS05MMly3RcwwjbI9nhIBs1uei/z2aq7wpkOsxGLTKqrAorYJqNBb3+gWcMYDjE6oBc5PM+jb1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=antoniohickey.com header.i=@antoniohickey.com header.b=uQmdaYP3; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=nzQEG3xL; arc=none smtp.client-ip=54.240.48.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antoniohickey.com header.i=@antoniohickey.com header.b="uQmdaYP3";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="nzQEG3xL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=cgcwyxycg75iw36cao5ku2ksreqpjkvc; d=antoniohickey.com;
	t=1741995710;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=zeN4pha2H8jIKBvdYYskbvG+K9NaxwB/yf0WEIbfuWQ=;
	b=uQmdaYP3QoOyLpduBtpbKv0Df2PL/yn27Jm4FbjM+1aqrDhKpYg0NJV4sAhPwLpg
	hp4H2fS6Yx1XE6CLBZwDpDkk9m/agION/0AnYo6SfRj8zIy5j53aXmRfKmiD08ViCFt
	i+MAog9/aL6xuBrofEmh5WSpH9TWyqd3P1C3H1MWbdnRIpjlGNi23pixbNlN7+EzsiP
	VMRvVrCstVElrWN8Oxh12soNYq4o56zRgoQlRd2OgfFztGmd4bgbeqwyBY37khkwJiN
	OGBlJYCgwCCIXtKdmg8Thi1KqqwH7I5hcfb8cMegtuZRAOyFFlDVYZPZ2ID1fU0TiRW
	8pfZdMLZXg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1741995710;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=zeN4pha2H8jIKBvdYYskbvG+K9NaxwB/yf0WEIbfuWQ=;
	b=nzQEG3xLb1suulOgNFZQeGdpCRkZutVFqQU6/95cWU57ZmnBPrQSgXClxOFagjeg
	r03SVMUoEtLfeN6e8dNP7OTL2cVqkzn4oxSmEATA3V6l2J6nkOpSzSoXR6RtyCycx3u
	dzDhXAr/N+4tp72oQ0kGLYQoz0+OrWMfJSkrBJ7Y=
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>, 
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 0/3] rust: use &raw [mut] place instead of addr_of[_mut]!(place)
Date: Fri, 14 Mar 2025 23:41:50 +0000
Message-ID: <0100019597091925-d4345a75-c75f-493c-87b3-3d0c4c722573-000000@email.amazonses.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.us-east-1.3SHHfi5Rh4c+NdtIv+pxNWeqDT0J3zAhYZLMebdhE9o=:AmazonSES
X-SES-Outgoing: 2025.03.14-54.240.48.100

This patch set enables the `raw_ref_op` feature, which became stable in
Rust 1.82. It then adds the previous macros for getting a raw pointer to a
place to the disallowed macros in `.clippy.toml`. Finally it replaces
all occurences of `addr_of!(place)` and `addr_of_mut!(place)` with 
`&raw const place` and `&raw mut place`.

Change Log:
v3:
  - Re ordered the patches, so that the patch adding the `addr_of[_mut]!`
    macros to the disallowed macros in clippy is applied after replacing
    all the instances of `addr_of_[_mut]` with `&raw [const|mut]`.
    (moved PATCH v2 2/3 -> PATCH v3 3/3 and PATCH v2 3/3 -> PATCH v3 2/3)
v2: https://lore.kernel.org/all/0100019592c224ba-0cf38e16-2aa2-459d-99cd-09a463d616d4-000000@email.amazonses.com/
  - Fix `&raw place` should be `&raw const place`
  - Fix email typo
v1: https://lore.kernel.org/all/010001958dfeacb5-9039aaab-6114-494a-9f1d-f13982091169-000000@email.amazonses.com/

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>



Antonio Hickey (3):
  rust: enable `raw_ref_op` feature
  rust: replace `addr_of[_mut]!` with `&raw [mut]`
  rust: clippy: disable `addr_of!` and `addr_of_mut` macros

 .clippy.toml                           |  4 ++++
 rust/kernel/block/mq/request.rs        |  4 ++--
 rust/kernel/faux.rs                    |  4 ++--
 rust/kernel/fs/file.rs                 |  2 +-
 rust/kernel/init.rs                    |  8 ++++----
 rust/kernel/init/macros.rs             | 28 +++++++++++++-------------
 rust/kernel/jump_label.rs              |  4 ++--
 rust/kernel/kunit.rs                   |  4 ++--
 rust/kernel/lib.rs                     |  2 ++
 rust/kernel/list.rs                    |  2 +-
 rust/kernel/list/impl_list_item_mod.rs |  6 +++---
 rust/kernel/net/phy.rs                 |  4 ++--
 rust/kernel/pci.rs                     |  4 ++--
 rust/kernel/platform.rs                |  4 +---
 rust/kernel/rbtree.rs                  | 22 ++++++++++----------
 rust/kernel/sync/arc.rs                |  2 +-
 rust/kernel/task.rs                    |  4 ++--
 rust/kernel/workqueue.rs               |  8 ++++----
 18 files changed, 60 insertions(+), 56 deletions(-)

-- 
2.48.1

