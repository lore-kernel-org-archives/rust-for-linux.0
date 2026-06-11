Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E742248A8
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 05:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157359; cv=none; b=XVSYq2TuyfVXz0mWwhk1urik5VJ/mJWgN5Sz/VDsiwvMgJlvGA31ZBuZE3XD6gNkIuKb2Kqubc8QvGYrf3nY/uQSLpaq/7IdhyDtJraVn3dL4bdtQ4h09gijRi4H4SxNsf9kixXR5QaiBeHOQp1+g/ewQT8/2U1vd9NXUimiW8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157359; c=relaxed/simple;
	bh=4yDvi4xYZlsc4sa6ksxjfW0FLgUrRqsurx8rYDf95QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqp2S4bA1zFA9VIonqcrSeP0k61dUlBJrsW7EMvvO/NYUUZGjpnVWTZuy+vgMGhzurCv5iqhOxzhydP45nDmjEPd7+QY8zQoDxlA38cE8pXC855BSLu19yKZy1AHlpDQef2pyfcp8UqxFPP1/kYzA3M1kciTrlHbhfJezHp3gAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sq0dmcCU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sq0dmcCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51BC1F00898;
	Thu, 11 Jun 2026 05:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157358;
	bh=EMfs7hyFNcuitNojwF3gX8E4E1ura9tbRB7FmLdO4nM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Sq0dmcCUqdZGgBf+g/w6wRAGlraPP/xdSwmb8gLmAdnjt1KB8yCQOjZnI72PFbn7K
	 NHl8eqKHVwhoVQoJRSu8OxMcpuw623XF56wCVJfu7X0Cgr4DOXNTIFShkyxx7Sq97M
	 4rEnVZdUOxwbDTvtaR5QIq4bRp3wDpkkgecKFDVa94H+0U3fc1voiwu90EodQR3zSm
	 iGLRuY922g3Oat1bcVGyAD/UBnKJDOpoA76J6qonfzDkE2QAHBcb56ZJMLFIO8oA0b
	 dLREdC+vh3RENe5qpL/3NJimJ5mK5urnpKTICXYS7HUJ9Cmwk0Md6U45dIU4pGwLzL
	 eL+WxwS1iaa4g==
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 2/4] MAINTAINERS: add Tamir Duberstein as Rust reviewer
Date: Thu, 11 Jun 2026 07:55:36 +0200
Message-ID: <20260611055538.61425-2-ojeda@kernel.org>
In-Reply-To: <20260611055538.61425-1-ojeda@kernel.org>
References: <20260611055538.61425-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tamir has been involved with the Rust for Linux project for more than
a year and a half now. He has been working on improving the integration
between the kernel and the Rust language and tooling: he led the effort
to replace the kernel's own `CStr` type with the standard library's,
and reworked the rust-analyzer integration, among other things.

He is already the maintainer of the `RUST [RUST-ANALYZER]` and `XARRAY API
[RUST]` entries. In addition, he has been active reviewing Rust code in
the mailing list.

He is also a long-time contributor to the upstream Rust project, including
on topics that matter for the Linux kernel [1].

His expertise with the language and its tooling will be very useful to
have around in the future. Thus add him to the `RUST` entry as reviewer.

Link: https://github.com/rust-lang/rust/pull/139994 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d34aeaa415a..813c75e930ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23394,6 +23394,7 @@ R:	Alice Ryhl <aliceryhl@google.com>
 R:	Trevor Gross <tmgross@umich.edu>
 R:	Danilo Krummrich <dakr@kernel.org>
 R:	Daniel Almeida <daniel.almeida@collabora.com>
+R:	Tamir Duberstein <tamird@kernel.org>
 L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com
-- 
2.54.0

