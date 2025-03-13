Received: from a48-109.smtp-out.amazonses.com (a48-109.smtp-out.amazonses.com [54.240.48.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB842AE77
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 05:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.48.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741844027; cv=none; b=pkb5kkFQe+/lam9WuTzBRtqfFVjer4tGRTTgyNvrQo810AeVV70bge1LZ3NpEND/BeKYj2dF1PMp5fB4fq9iZLY7/AQlb2j9OcY0kx1d+I3fSBXIAbpw59W7O09DyjUFHzZMNZa2vXYoCsuTnRAhoU+NTnbuKPmsP5SmwFpNCLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741844027; c=relaxed/simple;
	bh=o9h33Gk8tww9G8VpmTMYShaUuUWUSYgKDbj/LwWBmcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IhDRaErkXhcaFwmpqFiOBAY3NVZ8S1edVqAnhd64cfC7D1IURBbe4KrWb/t3iEQd7N8oqRSFK+uTceLsZftf2c3mfqw6PJwQ8DBMNHQO/9HS2cUg5GlwXdM0gRVi9Ny+bAU83xWBXqsh0tc9uggxW80YtTOf1dChuIk0MPhPeoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=antoniohickey.com header.i=@antoniohickey.com header.b=UQ/gv1nH; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=GO3TRxG8; arc=none smtp.client-ip=54.240.48.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antoniohickey.com header.i=@antoniohickey.com header.b="UQ/gv1nH";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="GO3TRxG8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=cgcwyxycg75iw36cao5ku2ksreqpjkvc; d=antoniohickey.com;
	t=1741844023;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=o9h33Gk8tww9G8VpmTMYShaUuUWUSYgKDbj/LwWBmcA=;
	b=UQ/gv1nH9VKPqhz0oP7TISUGlO59djHqQkh/foTQ2mHoj6O6whp7osmPsHkmOq6X
	JQrMX/Uxdt+T8IN5b1/KTsbxmXmAIjOPma97z4OSDO6T5sQ7LL1XvjarR4q1P9BTDnI
	bUGITQ8Rk5ByBsrJBq5hPUpTeK2AwFtygof2tYNIaBzpf63EwG3YWe4E63+/KbW1IoJ
	K9lLoDEr2yun13u8uPb3r/cLH2kGI8aCU9gQKnNgvRBzLWEIJTZmHzomSB35KLYrYRo
	xeWmvpYhIJzaQJ2ctKl6mFe94004zpAbWoyh07A4NoQZBzHxjmv+lg7DQvk5XW9HxOa
	apFFFl+4pg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1741844023;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=o9h33Gk8tww9G8VpmTMYShaUuUWUSYgKDbj/LwWBmcA=;
	b=GO3TRxG8WEQBUlRI9/XYlwlvs3QYev1oStqg85RFvg6BbrNPtCG+I5kJ1gx1BXhO
	N6EupUAbwpL3iOVVBl2Dm9iPO8vcP4KPbRtYsaujUPSp3H0K155HhQNvZ1MhlWCnMiY
	+Nx21Fdu4bbLGa0vzb9e4idyi0jjENWSlG/gb9y8=
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>, 
	Benno Lossin <y86-dev@protonmail.com>, 
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/3] rust: use &raw [mut] place instead of addr_of[_mut]!(place) 
Date: Thu, 13 Mar 2025 05:33:43 +0000
Message-ID: <010001958dfe8a0a-0762f206-fb88-4d44-a50e-9ce6da4da205-000000@email.amazonses.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.us-east-1.3SHHfi5Rh4c+NdtIv+pxNWeqDT0J3zAhYZLMebdhE9o=:AmazonSES
X-SES-Outgoing: 2025.03.13-54.240.48.109

This patch set enables the `raw_ref_op` feature, which became stable in
Rust 1.82. It adds the previous macros for getting a raw pointer to a
place to the disallowed macros in `.clippy.toml`. Finally it replaces
all occurences of `addr_of!(place)` and `addr_of_mut!(place)` with 
`&raw place` and `&raw mut place`.

Suggested-by: Benno Lossin <y86-dev@protonmail.com>

Link: https://github.com/Rust-for-Linux/linux/issues/1148

Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
Antonio Hickey (3):
  rust: enable `raw_ref_op` feature
  rust: clippy: disable `addr_of!` and `addr_of_mut` macros
  rust: replace `addr_of[_mut]!` with `&raw [mut]`

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

