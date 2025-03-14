Received: from a8-71.smtp-out.amazonses.com (a8-71.smtp-out.amazonses.com [54.240.8.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181DD2E3368
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 03:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.8.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741923955; cv=none; b=OiHSDm3ztD/u/0u0awLvFCbHwQ+Bya6ReMguBC1j8OAKCFiR/k7nNM4t/mZjE5ZBr0Ksl8+4I9QJ+b2sKNFiTIifme71xmZXJPjuUxWMXbS+id4nlDNMhgEDWgPs9oDZIvDsVCoUNaY5zREErRatz0/8297xdQmLkGdnI+Zh7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741923955; c=relaxed/simple;
	bh=nqMW4C3NrIhhmINPXZE4/UA7SB+mYZp3/gNeD5mjykY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYRNoSEhgGeQ/64Mz1TH91po9nTGLdH6QjajEHKH6aH4RYNRNfP7Ua15psjam2RDttFMSyBkS+WqRRmb/jF/yAZkE8ihpjusqGa3yf+qAjT+HOIG5rHtQ+KroySMKUtXevmAxdFUAw7D4MjmJG/4YxFwCUpU20Ki/r1YArlIFrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=antoniohickey.com header.i=@antoniohickey.com header.b=bSljA+JT; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=pYiVReQi; arc=none smtp.client-ip=54.240.8.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antoniohickey.com header.i=@antoniohickey.com header.b="bSljA+JT";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="pYiVReQi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=cgcwyxycg75iw36cao5ku2ksreqpjkvc; d=antoniohickey.com;
	t=1741923952;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nqMW4C3NrIhhmINPXZE4/UA7SB+mYZp3/gNeD5mjykY=;
	b=bSljA+JTyX2xVLRa50bfPwFCw3Zl99uqhh8vfgfGmIs7BZPfzA5Tu2X8PgcnAoDT
	pKTbn07tafsMpXYzF0cOqqBpsGSTuT/DOpzPsbgfgaqO0c/2BmLzlJIwp/20RNeeWVB
	0JJwPXfh2rRtx3we8x8PG3Ww5PuG5LZyeDXTJCZgvDbHQ0QGBkEbvO35zSdoU3Sd68S
	/BBkBJSEVdUdAecSzPvnEdFG1a0s5x9oeBgZ5OymAJi+itdDNics1t608a/VNdA6v7o
	I0/E3ifDJricZd6c5HSzN5N7kmnJHtxbWN/0vHJoTAtiQuyD6z34P/EsWK9Yxtulraq
	aEJYwlQk4A==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1741923952;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=nqMW4C3NrIhhmINPXZE4/UA7SB+mYZp3/gNeD5mjykY=;
	b=pYiVReQiMWkc5EeKiDBi7EKsuoKy6XNKZ5dVahvL++8cSLi9sFqhJS+3mZWXZFJB
	dpTuNhSE6Xs882r/TJpjPr0AfYrKs/TFmtLLnYidJbNpsFIYTLsCrKy5NevUyjWLTZ9
	a4nKqcdOcoc8yP6A/8SHFu/BY44lSOtddA9ZvLlY=
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
Subject: [PATCH v2 0/3] rust: use &raw [mut] place instead of addr_of[_mut]!(place)
Date: Fri, 14 Mar 2025 03:45:51 +0000
Message-ID: <0100019592c224ba-0cf38e16-2aa2-459d-99cd-09a463d616d4-000000@email.amazonses.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <010001958dfeacb5-9039aaab-6114-494a-9f1d-f13982091169-000000@email.amazonses.com>
References: <010001958dfeacb5-9039aaab-6114-494a-9f1d-f13982091169-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.us-east-1.3SHHfi5Rh4c+NdtIv+pxNWeqDT0J3zAhYZLMebdhE9o=:AmazonSES
X-SES-Outgoing: 2025.03.14-54.240.8.71

This patch set enables the `raw_ref_op` feature, which became stable in
Rust 1.82. It then adds the previous macros for getting a raw pointer to a
place to the disallowed macros in `.clippy.toml`. Finally it replaces
all occurences of `addr_of!(place)` and `addr_of_mut!(place)` with 
`&raw const place` and `&raw mut place`.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>


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

