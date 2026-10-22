Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683545;
	b=oBG5OjL0qXvkSncPkRO8kUzPCJEMChNj92ZTZraazsrGcp+GrFYccImhfRvVvrlfQcN5
	 a5dK/4983li5WHcxvjKan8SV5Ql+6TmPWbL54F7BfILstPz+pIQmfyUvLZj9IIpEf8ejR
	 oUkRY4b1oPQFEJL+HFm2m1wH1DFvVOfOqa+leej/Yrhs0RidrbkwLqzjAY0KCuGXo0bL0
	 iMk1X4CX5lyvJ2YKqX3QZuTHfeBcd9OV5XOebWA2mCo2I7muEuf+r4fJFbmeTuTthvp9F
	 OfisDEm4QGW/ZPeoe6KdYLNP6XnhNjY68NE4wt5nN244NN0aYBeBnaHiFNkNOtUhcAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683545;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding;
	bh=waX2JxU3WlecJqVSokSPjc4TdMSIgSJG81p2064xJg0=;
	b=lNgVWCm1jCpjMfAUYKLFFyGDOqv3kBQNZ15JmgwKq4B4DKLkOrm4P+0KsLKuqge6cc/v
	 8KFHiX/WRCul9PB+zhpQiEeD2H9YdEpOtHd6GhFTKvIGjLz1FeB185BjZSV12NRBLft8S
	 fJdMcxEwaXAQeyvxy/fUHtdi46KBKMDaZZ6q3QKxwMkdjQ4VYSYgP99ivvXUTeERcI6Qp
	 3pzGFBQ+6tHzxb9+W8TB3uCCZPfUCRdxBXkmxlsAigKG/j4MpdOduei1N5lGES/OmzzZ7
	 a+/CwEkEoaetf0c3VUruOgQ5jGts+oL0hwk0/77nK4RVJ51PpF7yGB+RVm1xJhf86tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifcrw8B1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5BA606A319
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Oct 2026 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifcrw8B1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287001F01825;
	Thu, 22 Oct 2026 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792683544;
	bh=waX2JxU3WlecJqVSokSPjc4TdMSIgSJG81p2064xJg0=;
	h=From:To:Cc:Subject:Date;
	b=ifcrw8B1Ve0S5Z1G9B6UpF4+Tfbul3cIGTLLos4XwD9US1t0wJORxojFL9mtF4sxC
	 p4NfevMqxbxWegBQ2Cq4qEYv6aklRt+xBANBpCxVYH7fnzdoUB9UGXnnVH67OR3UcI
	 b1hpzahjldAlTHLvRs+2xKsoLE2PyyR5iIvHL5OcyPEmF7OgOkiri//xL5/VBMo41k
	 HFxY2KR9qUdUBgfEzlqGsp5zk7k2Ld3zsNQ6CRS+wIsny5GbCfXqT7T58H4md14rML
	 07Sv/96aKUTqr0vH/BIR8xPMTUOpcjIB8NBsYM8UfYVz7QfrwBc/zNpztu7mW7/cLv
	 7JwKmVIgDl6sg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: mem: fix up formatting after merge
Date: Thu, 22 Oct 2026 17:38:44 +0200
Message-ID: <20261022153844.30689-1-ojeda@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the merge 7be4bc52fd9e ("Merge tag 'driver-core-7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core"),
the formatting in the conflict resolution doesn't match what `make
rustfmt` wants to make it.

Instead of running `rustfmt` as-is, which would leave the `TODO` comment
detached from the `Alignment` re-export it refers to, swap the two
imports and add a newline to keep the import "blocks" with different
visibilities separate [1].

Link: https://lore.kernel.org/all/20261018163459.80579-1-ojeda@kernel.org/ [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Linus: please feel free to just take this directly since the pull is at
the top. Otherwise, I can send it in a PR with a few other fixes if you
prefer.

 rust/kernel/mem.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/mem.rs b/rust/kernel/mem.rs
index f811c9434a80..cd00289ded72 100644
--- a/rust/kernel/mem.rs
+++ b/rust/kernel/mem.rs
@@ -2,9 +2,10 @@

 //! Basic utilities for dealing with memory, values, and types.

+use crate::prelude::*;
+
 // TODO: `Alignment` should be moved here as well, Rust moved it upstream in 1.96.
 pub use crate::ptr::Alignment;
-use crate::prelude::*;

 /// Trait indicating that [`Align<N>`] is a valid alignment.
 pub trait ValidAlign {

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
--
2.56.0
