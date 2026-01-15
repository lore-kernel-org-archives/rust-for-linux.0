Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712F3285041
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513565; cv=none; b=svhOO3h4qboexLefTUs91bPwpQ8IdCQXB19iPf+qEmxAfQDnaI5u995fxaDc+nhy+vP80btY/xYPaVOqvDz5tXZn4sphOD2vK/iGYGB1istlH8XVWKUjQxTHH9b5h1AsfAKpK3LYAQ2LURpdAajhuYYfgxRWdsQlfBtdWNuXXCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513565; c=relaxed/simple;
	bh=OoT6wNOzMKX0YeLFDFiNSUBI8ARgCX/Pvr8vVLU8d6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rPvz7N1X5bFfPqtxiZW3ipXIWLQccSDXaojp567syRrEbf/+F8HIcV0nJRzXYyuIcoPXwCE6Q5UwZbeGv3gH24zK539j1WCJdVrZacvbX1m8BveZ2Jlcvr/A9RIFFd15Qn0953SrvD5l1IV9qeKhq1Nq81YrkazqW6MhpoHrF1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8FGXgpf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8FGXgpf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A26BC116D0;
	Thu, 15 Jan 2026 21:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768513565;
	bh=OoT6wNOzMKX0YeLFDFiNSUBI8ARgCX/Pvr8vVLU8d6U=;
	h=From:To:Cc:Subject:Date:From;
	b=P8FGXgpfhhFFpLNykFkqmlnbDnASFX1Ct57sRSj5A/Pi9MYupeDmZf9aX+BCzv9g+
	 AjVDo5ajFRduyAtorvRVWToyuNbI+UpOZ9953Y3/risQhx2hTZMuXBrpfwQA5OAhu7
	 YnCA9LaCKfhU6BCqLPdAj8X7+Jp4N2ouA7a/qMUENgqDv7HfMARC5DpAgp3sjUc0y2
	 xtiWPdhCSrmdNXMDlLXsFNtug1mxUNmz/g5kdIkoRZievxGrwyhGl3UbVdxzNLgN7E
	 QfyL6UtN2qYR24ttru8jrjDtc4t2RvB1CXkiSS0axg78QjYVuP55CW6WmlrmrrGfd1
	 V8A0TpqWOKVvg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>,
	Jesung Yang <y.j3ms.n@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add "RUST [RUST-ANALYZER]" entry
Date: Thu, 15 Jan 2026 22:45:45 +0100
Message-ID: <20260115214545.63262-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This entry will handle the support for `rust-analyzer`, which at the
moment is essentially about the `scripts/generate_rust_analyzer.py`
script.

It is one more subentry of the Rust subsystem. The new branch is
already part of linux-next and will be used to send PRs to be merged
into rust-next.

Tamir and Jesung will take care of it. They have both been active around
the `rust-analyzer` support for a while.

Cc: Tamir Duberstein <tamird@gmail.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d044a58cbfe..edd954fd458e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22936,6 +22936,14 @@ F:	rust/kernel/init.rs
 F:	rust/pin-init/
 K:	\bpin-init\b|pin_init\b|PinInit
 
+RUST [RUST-ANALYZER]
+M:	Tamir Duberstein <tamird@gmail.com>
+R:	Jesung Yang <y.j3ms.n@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
+F:	scripts/generate_rust_analyzer.py
+
 RXRPC SOCKETS (AF_RXRPC)
 M:	David Howells <dhowells@redhat.com>
 M:	Marc Dionne <marc.dionne@auristor.com>

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.52.0

