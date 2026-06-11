Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7222248A8
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 05:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157366; cv=none; b=jh0i3aKGW5pjalJXwqGGboXWqFZMif9F3jhXX7O4U/kfown2hP9Ib7Sps6HayOPnumDnYkxomCpdGrZm+jm0FbEh1Ftv/o+Z0sOujMb2U7BnWIdqGNgeqBquhpkDlSF4Dw4yZ7Ytj6jGi70stP0TmQ2JnQqxv/h032MgUa+SLJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157366; c=relaxed/simple;
	bh=cwneSxcysh0m9MgLYuoRmB90zEAeloyEDTq1pILwU0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ukTL/55oWsdtWWabLCrbYkNecnoMvdqnfE+BHYwRDyuZif8YebAg+JmIcdf3mIbT5awAVv3++eBalHtWHjWfs9jIIJg/XVlenYmrPDq9SC+Q0LlQyRtZxWUa/UpyPceJmE3UmdlkSKtReJgRHHL5cSpd513wfl29r7IM6CSGcIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MI3Lm8bm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MI3Lm8bm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447751F00898;
	Thu, 11 Jun 2026 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781157365;
	bh=LmgclSl3FpBBL1/XDnBZWjwE5H4skiQiooxeTwlNThs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MI3Lm8bm0BStM//h0/Ix2b0ZFlUj8fZ2ZjTB+i3yh8LYrbItfjvs2i/19oTZ+P+ko
	 sjXuLunhMZYuh284M+4eo2V/PRZYtj4Zs6o5VHPbn/LVHatr0gIbEl2DfzrF6LpcR3
	 3xcpAV7oFckhyLkoZSZ/qoo5xh7GjhS0rK+uU8GsA50vfyjbfGRbse9Iv7+nLKthdC
	 DPwXGegeCXXh4r+bCOk+u0Ncf7bV3yDkVRDat6Svi17Nnw64Sfsr5mlTgKu+bZt1Iw
	 GAeBErWFBXg6LP83Al31dtQXDq2aai3why7jMbVxpolnk6i23F5maa9rllkLQXwwz3
	 sGCR0gv9+ZqkA==
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
Subject: [PATCH 4/4] =?UTF-8?q?MAINTAINERS:=20add=20Onur=20=C3=96zkan=20as?= =?UTF-8?q?=20Rust=20reviewer?=
Date: Thu, 11 Jun 2026 07:55:38 +0200
Message-ID: <20260611055538.61425-4-ojeda@kernel.org>
In-Reply-To: <20260611055538.61425-1-ojeda@kernel.org>
References: <20260611055538.61425-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Onur has been involved with the Rust for Linux project for a year now. He
works on the Tyr driver for Arm Mali GPUs [1] and has been driving the
`ww_mutex` series and the SRCU abstractions, as well as improving the
core Rust support in several areas.

In addition, he is already a reviewer of the `RUST [SYNC]` entry and has
been involved with upstream Rust -- for instance, he led the bootstrap
team for two years.

His expertise with the language and its toolchain will be very useful to
have around in the future. Thus add him to the `RUST` entry as reviewer.

Link: https://rust-for-linux.com/tyr-gpu-driver [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf7a7a52e9a8..f925356a0b49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23396,6 +23396,7 @@ R:	Danilo Krummrich <dakr@kernel.org>
 R:	Daniel Almeida <daniel.almeida@collabora.com>
 R:	Tamir Duberstein <tamird@kernel.org>
 R:	Alexandre Courbot <acourbot@nvidia.com>
+R:	Onur Özkan <work@onurozkan.dev>
 L:	rust-for-linux@vger.kernel.org
 S:	Supported
 W:	https://rust-for-linux.com
-- 
2.54.0

