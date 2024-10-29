Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D24A1A
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 01:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730163697; cv=none; b=MhWw+uXjlenOpayrNeNjx/heMQS/WIe0DbaFZqB0eyCeCqxDRtpjwBL9NklF6KmBfa0B1LOMlBRJh79fC9qTL8MdaowXXq+yikcbfITv0VLoxiwe6UkjGE+qW4bn4rO/Z0wRHqdLjdpi6VCnvFnqyUJfSqiY0nSMYTI4gG7siAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730163697; c=relaxed/simple;
	bh=exbdjBERdw8MIO8ea16riYhx9iWfZ3TINyMRjlQeWUg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=kpl/G/TnerEYG3LV1pBDk5LIA/zY5BXs5K686f5LlkXnpPI86qXFMQJ6M10/OIUgeYIO/h7WJq0eVGRHg/Zgk34bj0mgRsxfElTcGFEoCacZlca+mbO80MAN71H7coMO7QqppMtNfAAqELCz3S76X5xrmNKrj6MekO/n/3PswFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ivcXaAyt; arc=none smtp.client-ip=43.163.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ivcXaAyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730163311; bh=wzmtnr3uVkuUCCvzozLJ2QngCQV1PwmbEQVhb8XIV+Y=;
	h=From:To:Cc:Subject:Date;
	b=ivcXaAyt6koganUM7OWvUTo93r7/4CdVSENlpP9hmynMsoHJNzo8pQNCnavH/5j2s
	 YoBCfyBdKOfhaVXas92wKmDg/fcjJ8Zkrzidw0JvQPeOqiI0S4BP0PGYGfsJv+xDAR
	 xE7ZDMhbWYK0aDXSGGLg+kQNlibEDKRzn/tFWgOA=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.55.158])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id DC8B800A; Tue, 29 Oct 2024 08:55:08 +0800
X-QQ-mid: xmsmtpt1730163308tks12ebpm
Message-ID: <tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com>
X-QQ-XMAILINFO: M0yQCYO1Pk4BWmQVvknxyq27RzCLzivDSqJptKf/lA4ZzjiR9HHdethUyyIO0/
	 2W2tJY3eCAPL/nK0hRXeAMdVJzFY8jREcYcIkNlXvb5t+SpeT+j9jb7/R2VvzKfrDCZTrwzKXzuw
	 oInp3otYeEZjrz/W1h7BsQ8nwfVOsP3enPIlZ1VI6lTBbbA9+b1YJgbrnXQUdUQSV6ysW325iivf
	 e0P9bT/QEu2d/TDZWxuxuOZ/JKs40AJr8wbE5Z+Is53e4FGvHp7Cr5MIMmMUUtR6Yz4ePzVMQuaK
	 qI23cYNjxjdNm4sVWznhWccC9eX6Wcj2An4fuP/d5WxVGMPxLY5FWHjxU0savbmk4NBVQ5oUWjrx
	 XrWAaU5/8KZvX4etfzn/vG2Ftl1g7xyJFGrrs11OgaOk/oggJb7EWDulRJHjxo2hWPv8KqlqtFj1
	 Jx/x0baTeky/u2u+EJEr7+uup1ju+Zt/uth9AL3Oq05T+IQ4UynzDYgNQ5O9IKMhqfZlKCYfUTsv
	 WHqpbo1g+dpf6KZuhzotDfgzr9VqTKtUIpa/P1QoHK0FyxURut72xpFyCyFDwC+2ZBg5b3AzkMAL
	 WR8TjfgVwul0LAHGLKSa0yeeNDN99MTHesIahEs+ozbtDCjpnHazHFz4LPLHjhhPOg57a0uZ0+4k
	 b8oox8VztX34goESIOwtyQ9nBLdxVXkiSAoJcRutFo4lfCXa1qg78uvygJiejCrn2X7rl+uhpiX7
	 tTkw3jry9jHXliaPl0L1sGDB8sQmaSZ36HANyBBJ8/FzMPCIHS0RFHkkHEZuTwDvqMrWswn5Zq8e
	 WEcbsHbGz9T39TiDacPAmmABRz3Ndqy906S1RDGUgqT/C6dc0Dh97zLwk8Lu4W2ZQ4EwtVktbLLD
	 IiyOY/3AOhwRn7pcf1kslpCR2AGRx/ANAi2prssnVrPgff6xDB65wmw6mSnOMQKdJKydprUSv8Il
	 mIty257sYNmzC50HGlyg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: JCKeep <2407018371@qq.com>
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
	JCKeep <2407018371@qq.com>
Subject: [PATCH v2] rust: Implement Display for Box
Date: Tue, 29 Oct 2024 08:54:25 +0800
X-OQ-MSGID: <20241029005424.557806-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
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
Changes in v2:
- Add missing tag: Suggested-by.
- Update the patch title and the changelogs.
- Link to v1: https://lore.kernel.org/rust-for-linux/tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com

 rust/kernel/alloc/kbox.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index d69c32496..5f4765800 100644
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
+        fmt::Display::fmt(&**self, f)
+    }
+}
+
 impl<T, A> fmt::Debug for Box<T, A>
 where
     T: ?Sized + fmt::Debug,
-- 
2.34.1

