Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E830E353A8E;
	Sat, 10 Oct 2026 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639509; cv=none; b=Gg+kKt4cTw06cetXODhqTyuj/r/wDVn8q0F3eLFvqpFLn38ZB9fDA290O0gQ+TvF6V4X8OCTbAtOiRaeDcfoSq4SKoKAeykurBVBozaHsH/V5sXl06he+HQwvvvi6glR6lCJv6JZQc9M2Kkof0zAC8YbZUfdJDAvCVTstaFpwIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639509; c=relaxed/simple;
	bh=sxpN53QpS1/8j6faCeXwrYyBxIT523DYJjn7a4VKuhI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=dQCnvmTplWegCxXMUWVRLXt7Z5MkMu8PrQ40uTxjJdMQ2ltCFUZI7whxraLhR7IeBY/ZZkcvdsPjuTHBYCGB2zW98PvwKWt22/MT6O/Pblx4yIknp8V2afz5FrUkxoVUPs4l6V8jLuowRk2qttHfUqRJWs65uPmRKvvWJug5cp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCS8k2Wz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCS8k2Wz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56CC1F000FF;
	Sat, 10 Oct 2026 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791639507;
	bh=Se+RnHSUYH4aZZm71yLMg+oaEpojuMfuRniLE+KM1Tw=;
	h=Date:Subject:Cc:To:From;
	b=kCS8k2Wznka06fAj4+JoLkoC0RWjwlaGHNnKZfvQGv7h9S6/qV5IwQTskJ9KLPjBK
	 GCLE5uwmkVXE2YMGmQ0J/XMKheblWP6bxkgovKnG/N5NJbd63AXc6RYVAf4Che22Sf
	 oDRecwiBuL2vslzRpBHioTC3Q2h9CMUSlrhUn01eIek3+7V7Gv1zBHtzbYG39EIBps
	 MC2L8ZtCPnXMGaZs2uT3diY3vheL1Vma5fG9WGMTqcN+QrsF8QPKYGz+HX7aNKt7d+
	 LIYvS1a4DyrJ7UK3GFpinlhxEHi/njYsQ3mV6wiGOVfgAiB65SjU+Zl2jhdKASCHp3
	 PQmllQtyuQRfg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 15:38:22 +0200
Message-Id: <DM1774SH56A5.136OP30FCYTK4@kernel.org>
Subject: [GIT PULL] Alloc changes for 7.4-rc1
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Vlastimil Babka" <vbabka@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, "Uladzislau Rezki" <urezki@gmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/alloc-7.4-rc1

for you to fetch changes up to 6e8339118040f24ebcc21db22c9c1b7398b7e39e:

  rust: alloc: add `NumaNode::id()` accessor (2026-09-29 21:05:08 +0200)

----------------------------------------------------------------
Alloc changes for 7.4-rc1

- Add Alice Ryhl as co-maintainer for Rust [ALLOC]

- Allow different error types in KBox::pin_slice(), enabling use of
  infallible initializers

- Add NumaNode::id() accessor to retrieve the underlying NUMA node
  identifier

----------------------------------------------------------------
Andreas Hindborg (2):
      rust: alloc: allow different error types in `KBox::pin_slice`
      rust: alloc: add `NumaNode::id()` accessor

Danilo Krummrich (1):
      MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]

 MAINTAINERS               | 1 +
 rust/kernel/alloc.rs      | 6 ++++++
 rust/kernel/alloc/kbox.rs | 7 ++++---
 3 files changed, 11 insertions(+), 3 deletions(-)
