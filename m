Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604261509B6
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729493; cv=none; b=O4msKnas2SsiDxi+G4zE9bklA7q/gotGCSa0F766n10PcVe4UCmr1bhltv2s+GumTt7kplCw31kCeH9eWNIpRWne6QY77zci/ZNZlrHx6QjizU3+zgPydSaq2W8nGsziXTwNQUxPDrolVw+CWHeGayYzqKvRLHlkrJjMDXAVb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729493; c=relaxed/simple;
	bh=1tdGJAy3IXXnmeAPwQdSf8+v8F1UyxtGvUnHQxxhHKY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=bx2rTv2KSQ+ub87GkvhFGp9LE6HDv4mywDXGFaKTNgHQIrqlI3F9V58cxfiJeps5ZEv2Loqgmv25nhLNfVfCDIZBJWg0ApMRoBBy3YF8GvRjM3IIxpbjGK0zMIMZodfIxhqj4k3AL7nMaMyrkHXq6S6JcR0ez35mPTS0gGIyYk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=INBGTT2K; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="INBGTT2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730729179; bh=fbHHSzUJh/TdKsxVYshQ0K5wsXyO4oQ99VnW4TK/1wE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=INBGTT2Ktk1dr3mqYLP02Pkmkv9EQAMrK8bElxgomVJK/E0XXdt7b0LUv4/hgvLnV
	 hTIFRQuj1Z8QsAh4+CqfnXzNjRvpzqsyYgR7UIVpzmcn6t1VJy4V2uCiHoJQ/dOYkE
	 PF6QCcNGR07jJNQYopKHAHhWkBsUG4t//Rc6krf4=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.53.233])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 19207CD3; Mon, 04 Nov 2024 22:06:18 +0800
X-QQ-mid: xmsmtpt1730729178ts4vie4jf
Message-ID: <tencent_78A46797341AFC745CE618E9EAEDA2D62708@qq.com>
X-QQ-XMAILINFO: NhsePn6g3vMq4yTHhqtedqlMjj24JEBNx4E1xF5D+FTP+MquPlrQuu2C7EyO/1
	 TfS3V2/7N9xyMec8AaIWbx3zA/ImpEMZi4kIkwSv7nBIa/wxGasvgQSPQvwg9lP/lONewurNhDGX
	 COi7ZcmdPbRRBJsYjxH8OxPOJ1wvgVCvsDhej5Ti+D1q1yQDu0BUej+zDLRS0PwCZHgbbs7+zwwN
	 /Wzg2A/OUBX9gu66CCnwgPOBMBhYO2PGevb8wOlnbfj7Io4scXGKq4rsMgIVp2Ne0mQ8t/mjDjXx
	 EoSgCWXJpgj7d8d9fnMaZnqm4ndHDYtFcd1aisFWBb3x4V8hwfVM7pEgYvRQW7Jkn3ZkmSus7xYm
	 3ScorAwTPVI4V3e3HyAYesfhcUARBE+YbY9UT4KCXhC4bfW3qqAWzu3N2epb+9pyKgh4NvovmVvO
	 NdJtN5t3YihAR0e9jMFOm0aHqpWlwy960i8c1f63eELUy1WiNQRh6ZVxnfVY40L2Ye5KdRJQhG49
	 xNJJXlmvsNXMPyn0Q9cAvnYObTA2b6UUMO5YMegR9x/NsnbF6Nan8LnKDoOYiFEPqkQF3beEO5Yw
	 ntsLmJhvEYG9XiXn7eEBpWVjaa8uuwB7zDLFn4/QOsPhBnk6L/7KuCXqglp5iwuN2W/r5AYE3w9x
	 QQXDPP/k5zt8p7KhqNSI1ZvKCe3kJTS1lzNYLPEBwaQ9O3yCf3xnMuI2V4lWo75i7uR2woMG2LKC
	 JA73SEGfx5WRaZofqKJ3ydF/HYBzcOVjoSbFad8VgILRBEEJlpDYsRKDb1ZfU3Xxpi0ThMchf0rY
	 yOe2LsVQ0wMidopVxdP8K4QsjgPdm85/e8H6W6zhO3FFX8sSNHptMau4ZKbHAK7jV8Iw2V6JN7y/
	 LgF+35YAYd8PrUhY7PYbG/HheeT1nSJ06ZXjDJ9wKU3xI8QclmIVMvYlUthTCaer9Yq0YPuewXfc
	 tAimw3HqGp/3B90JF+XjfQ8tDbGAdt60qB/cwfc5zaNEMM55n7skCOCxaN7eVm38dxNuJqCJiAvx
	 stWmQo/ACOnMfXMsIOxuT2mXztG+kdEHC1o+CfKSIwwihFZ/2bW0+ANlyyw3tNsLL+w6L19g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Guangbo Cui <2407018371@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Guangbo Cui <2407018371@qq.com>
Subject: [PATCH v4 1/2] rust: Implement Display for Box
Date: Mon,  4 Nov 2024 22:06:06 +0800
X-OQ-MSGID: <20241104140606.877547-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104140514.877185-1-2407018371@qq.com>
References: <20241104140514.877185-1-2407018371@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently `impl Display` is missing for `Box<T, A>`, as a result,
things like using `Box<..>` directly as an operand in `pr_info!()`
are impossible, which is less ergonomic compared to `Box` in Rust
std.

Therefore add `impl Display` for `Box`.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1126
Signed-off-by: Guangbo Cui <2407018371@qq.com>
---
 rust/kernel/alloc/kbox.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index d69c32496..a496a866d 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -427,6 +427,16 @@ fn deref_mut(&mut self) -> &mut T {
     }
 }
 
+impl<T, A> fmt::Display for Box<T, A>
+where
+    T: ?Sized + fmt::Display,
+    A: Allocator,
+{
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        <T as fmt::Display>::fmt(&**self, f)
+    }
+}
+
 impl<T, A> fmt::Debug for Box<T, A>
 where
     T: ?Sized + fmt::Debug,
-- 
2.34.1

