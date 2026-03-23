Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4BD18FC97
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 02:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774233748; cv=none; b=H1xyyBMsYnqpEIxOwAj7mMzquKszygS4siqXY1JGSDqZnm/mJZCvBBicUrz5xrgbNhsCDCYa/8kqh7gYhhbthfh927mxY6dLv5RozV99wvnxSZ9aeH+n0yeNG3YIK7fsF4aeSUTWaZgRdLML3MrJ833cQbEDYd3jn7YT2A+YLgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774233748; c=relaxed/simple;
	bh=2M+9meiqho5Nr87C256gam7kjrrTqcY45Gz5AMsyJ+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMnTdHCVVW4N62kV1+KdpJJj1+ydnzZb3SIHKZRQWjymHAO4xGbUZS6ix/Dxafr4KlNPaVQ8O0IOLrjZoPEbIJW71fzO8+zhxemKYsg40WFnCOQLJvqKrFLul3fqhhllK64Kv0SSGNiJ9VFbpoAFm2Ap5hiiN8eRl7xZIIrjHPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+80r3kI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+80r3kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274C1C19424;
	Mon, 23 Mar 2026 02:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774233747;
	bh=2M+9meiqho5Nr87C256gam7kjrrTqcY45Gz5AMsyJ+M=;
	h=From:To:Cc:Subject:Date:From;
	b=N+80r3kIK7SdjGq46XvvCoaFqzD1e78TXWFSu4BB6Q6zVW3Gavwrykt8lzbtPPE/r
	 YG0JUuljjobaP/dvd94M015tX8Nh5LPSuVwAipt9NWTOEZECWI1tAoufCzWT5DQ9Mj
	 rMKUlGeFIy3fjN1Az2aOp3O3gEt6n6pzOf1zdCRI0XqvECDnFJ//BGBMuVnb+e20kH
	 qKK/PS1OViU+mgEANlQJx241uz4g9UGZwav2xMoUwFwRDyU3lxW+wWcA0onAWmucvu
	 awaGwkiajP8Kh6iPMqcK9JRLI9UYpp75Z0/rOEIiHWrPi2HVXNZpTia8T1ZO3nP5l7
	 0QKz/9/Wh4rsw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add `.rustfmt.toml` to "RUST" entry
Date: Mon, 23 Mar 2026 03:42:06 +0100
Message-ID: <20260323024206.129401-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`.rustfmt.toml` is not covered by `MAINTAINERS`, so tools like
`scripts/get_maintainer.pl` do not report it properly, e.g.:

    $ scripts/get_maintainer.pl -f .rustfmt.toml
    linux-kernel@vger.kernel.org (open list)

It should have been there since the beginning, and while it is not a big
deal since the file has not changed at all since it was added in commit
80db40bac8f4 ("rust: add `.rustfmt.toml`") back in 2022, this will be
especially useful to catch unintended unstable features if upstream
`rustfmt` started to allow them in stable toolchains [1][2].

Thus add it.

Link: https://github.com/rust-lang/rustfmt/issues/6829#issuecomment-4084325200 [1]
Link: https://github.com/rust-lang/rustfmt/issues/4884 [2]
Fixes: 80db40bac8f4 ("rust: add `.rustfmt.toml`")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77fdfcb55f06..a62f6af55c3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23146,6 +23146,7 @@ C:	zulip://rust-for-linux.zulipchat.com
 P:	https://rust-for-linux.com/contributing
 T:	git https://github.com/Rust-for-Linux/linux.git rust-next
 F:	.clippy.toml
+F:	.rustfmt.toml
 F:	Documentation/rust/
 F:	include/trace/events/rust_sample.h
 F:	rust/

base-commit: bf074eb6891be799174ff42e0051492681fdc045
-- 
2.53.0

