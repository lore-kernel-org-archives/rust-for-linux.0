Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783AE289E13;
	Thu,  8 Oct 2026 06:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440030; cv=none; b=YAAabnU8ZrWs3mkaM4/tJB0IZH3On3LHNZcefukjGld+BpUMCWpJgd27GDs7o3/FBkZzitpmMjNCy4OXZrIWv5nZBFIlzO2AnNhFUI8t/KU2GUgYl6LYv+1fgGpNkmoW4UZy196d8+/t0dhUUvc2qnKtR80WvkQY71jft0YVXS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440030; c=relaxed/simple;
	bh=A1dyqJjXgH0vMttjdPWPs/FsRWSHvyub4/Vx/WtML98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BjyCCNdKwuEj1TkhgtDqiMo7jvNtt7nnCj/iW51xVchlqalYfZPV1u2rNLpg5Sqefbg8WlRkgpMLrw28Ut4DfqG8HWAVtsPkCEBut6YLVIDZygRdQEnUX59oBHPw1xP53Siqsvoee6a3YHfN2OJZALYrIg5sYPeZTc3nPIncNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIvsstTL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIvsstTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C543A1F000FF;
	Thu,  8 Oct 2026 06:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791440029;
	bh=Y1LTDTGAPUqkSCD39nKKzMHF2nHI8PBV56a8TwJF1pk=;
	h=From:To:Cc:Subject:Date;
	b=nIvsstTLCb9E81CvjOdmW64EiWQyF7gthh5MWHdOACPDiONveTyCHixgX6rh39leb
	 re1q7wlrRusDlflGgH0M+GcP6MB8Imp22hhkUBKXCeW+jwAe9NiclXW0TTDWYwv+n0
	 VAKO0Ky5MB0LG6bV6E14Et6n1m2K4CuGECJ9wk0heYWuVNi+88Hk7WwqwWQfcaVFNb
	 rXHSwhn9bRgqajtzli8yc/IcDdpWAOgHYvGS9koy2RUYyE9LnX1Sdvmp0vRWbcQrgD
	 65cmXrFAwPQF3gdGGfflE9diqlj/8yGrlsSzLrAcG1P7kzLa23l+qn0aWBUz8mM2rU
	 xvFWt2wu3ktSg==
From: Thorsten Blum <blum@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Thorsten Blum <blum@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in strcpy_into_buf()
Date: Thu,  8 Oct 2026 08:13:25 +0200
Message-ID: <20261008061326.177841-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=blum@kernel.org; h=from:subject; bh=A1dyqJjXgH0vMttjdPWPs/FsRWSHvyub4/Vx/WtML98=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnHTdquSVv9OXm8/OGe0Pgrq2xKGER+vrkn9e/6Xm/rg 5Zil07f6ChlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJcM5iZNg48XBOk3nqy83N 7aJ7Drakpp6uqYnzsmn7+F/5htae9IcM/+y8LkycWZh/06vLvb3++Pq4J3+bt04pPHb5y68+s9a ZnTwA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Since strcpy_into_buf() already rejects empty buffers, use ok_or()
instead of unwrap_unchecked() when NUL-terminating the buffer.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 rust/kernel/uaccess.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 5f6c4d7a1a51..2a0af795e75d 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -422,9 +422,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
             // This means that we filled the buffer exactly. In this case, we add a NUL-terminator
             // and return it. Unlike the `len < dst.len()` branch, don't modify `len` because it
             // already represents the length including the NUL-terminator.
-            //
-            // SAFETY: Due to the check at the beginning, the buffer is not empty.
-            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
+            *buf.last_mut().ok_or(EINVAL)? = 0;
         }
 
         // This method consumes `self`, so it can only be called once, thus we do not need to
