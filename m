Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFF12FD1C2
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157363; cv=none; b=WCWJfWV6T0yi45aXwTlRDWZV5L5juTW6t9Q1QsWlKuIB6czxcVYZpzdGgjHpnm4YE1YS6B+Ol5lyjcgr4myNrLpovFounNjcS8rd7YY6yND1gyEjIhQQ4ht8w87K2MtoTZ6OABnBfgau1MXj1KvUZxMQgLH372eZmxDhF0mHP/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157363; c=relaxed/simple;
	bh=NhYrQGO38QuQLSWga45vBJ7ROBR0meV9YIQRexZ6ofY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5aX9hwlLTkRDEi6ggZRjGisfG9Uv6YjxdLYOCDRwyjE9+2+KdlYmPRU4DSl4CKD+4Q4LzTw4mDVNVx1GI/+WD3vhD07E9ZQ6lIjQujkfGfx8svbuRMBaPTl8W1j81IxkU8ygEvpFT/oXoRmHqhNvd5WPPJZt0erySlhSBig4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DE3RbXWF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DE3RbXWF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E981F00893;
	Thu, 11 Jun 2026 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157361;
	bh=K7zp2b7pg26XuKAhSA6kvBZN1PkgAn972X2aqDIOPQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DE3RbXWFrydkYWZSlXJ+CfutT1zTJMRoGM5dcqvAxbxAWROwqOMxh0/v8ChCYa2Cp
	 tQnBv5IeAQhQQu5NHoMbg/3daeVHJA1suaKIDseQ2Yr/gp5GE1QF03jl6RNIfOvhY0
	 9/AbhlSjFkhLJNiciG/jtsDDBCXwUF8BcWHyMxWSfplJFhmxY+gf/GAOoj0tuMO9Dl
	 QVxGJUb72oVtCKLoxsby6dzSHL0KXR15wBedg+fPi2O54bPMLLpmqCERYT07JRZNLr
	 +YrrS0m/Ua/IHu8GkD4oFYpdoi/BHYBpzzQwyMoKFrpDiDmu8jQ61QMkuNIQ8tOxEj
	 ZvC0hbvVofX/A==
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
Subject: [PATCH 3/4] MAINTAINERS: add Alexandre Courbot as Rust reviewer
Date: Thu, 11 Jun 2026 07:55:37 +0200
Message-ID: <20260611055538.61425-3-ojeda@kernel.org>
In-Reply-To: <20260611055538.61425-1-ojeda@kernel.org>
References: <20260611055538.61425-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alexandre has been involved with the Rust for Linux project for more
than a year now. He is one of the main contributors to Nova [1], the
Rust driver for NVIDIA GPUs, and has authored core Rust infrastructure
motivated by that work, such as the `num` module with the `Bounded`
integer type, the `register!` and `bitfield!` macros, as well as
improvements to abstractions like DMA.

He maintains the nova-core driver, as well as the `RUST [NUM]`, `RUST
[BITFIELD]` and `RUST [INTEROP]` entries. In addition, he has been very
active reviewing Rust code in the mailing list.

He also proposed and implemented the `int_lowest_highest_one` feature
in the Rust standard library [2], which we should eventually use in
the kernel.

His experience maintaining a major Rust GPU driver and the abstractions
it needs will be very useful to have around in the future. Thus add him
to the `RUST` entry as reviewer.

Link: https://rust-for-linux.com/nova-gpu-driver [1]
Link: https://github.com/rust-lang/rust/issues/145203 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 813c75e930ad..bf7a7a52e9a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23395,6 +23395,7 @@ R:	Trevor Gross <tmgross@umich.edu>
 R:	Danilo Krummrich <dakr@kernel.org>
 R:	Daniel Almeida <daniel.almeida@collabora.com>
 R:	Tamir Duberstein <tamird@kernel.org>
+R:	Alexandre Courbot <acourbot@nvidia.com>
 L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com
-- 
2.54.0

