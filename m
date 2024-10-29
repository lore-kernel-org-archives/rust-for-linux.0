Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5420721C
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730212498; cv=none; b=HaHrGkeQ3fbSVBKtLb6bb3+/tHYjN/y0fKtCBT0kVNEk8MPTCSqIbjRPSWe1ehfuf6DsolNuqcjWnNKBjFi7UEWIQkOTwwA05yKDleAyz49nV7FKjba41X5pGSICzWmWO9cIWPxIh9xmsVYUWUCC/9OODtOnLmhWiHCApywjsIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730212498; c=relaxed/simple;
	bh=rqoQgM6iVagwN7p3lG0/af1VJDdqao2BQgWLbunzjl8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=XMT6qDnBwbJLz/MDEVXeOsFddZFGpjw20HR/pJ+Qxf7gz7yzXCMTMiYk4+BXx8mSDI8Qye9ixrUY5HzkY2Sgkl9RXzxhSMJv0EIoSEOPjcRNKPueoR2jW7Vi/lJVWU4c2Iz9oJ5AA+quZPVnROMhJZXzieMoeEYm4UmS0Va0NKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bseYVoTL; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bseYVoTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730212189; bh=oX6pVKZL0LoC2rP4iV8l6TWsMm59JwV3vGy5W7uv+io=;
	h=From:To:Cc:Subject:Date;
	b=bseYVoTLuKMjxuh1dZc4p+4F8Jjy9zNULobJ8kK4mjSpIwCkdoyaBXHdWqIRqVXSc
	 nC5V8yq303/liuUyuYsiCMjJPi2Ft/VCMq3M4tuahtLLVHCW7VInt1rVBtFSRwasZt
	 ou/XRlaZYG9aplU2mV9lRe7EhVPu/+fztut+mDng=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.55.158])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 76FA5891; Tue, 29 Oct 2024 22:29:47 +0800
X-QQ-mid: xmsmtpt1730212187tiaz3vhn5
Message-ID: <tencent_CC0134B8E94CCD93D347DAB9ACAB48652F09@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeiejHYHMy0VEdEUcFxB2ModXr0YDJavZnO5p2ZK10TDEf3R1Qg1yf
	 JnlTHweGv4EhnwDlp210Rz5wJXIN46mX3beFC/V5acRNGSWqts0pO7qgrxb6kVzM4ICCRVsQu0LU
	 r+t/y6Chbts1rq3ZmPHxCSNTOOC5+YWfQsZ7x8cQqdrEdJxxT2AXYt7mFizGgixRL6o/AKqybvzi
	 Rpvs+6yf/dSMqttFryMhRQiZeh7IbjQprgXioIZU1+gUB1rutoSyO2tk8BkftEv9a8rSsWsBlYvi
	 Y+wvpH6w+wxDFhzuf+ZnF7XZlFVDyVhTRhVmOC8GERLldbPtCmUs2AXuD85oeEOSWg5stm2t5/KE
	 CLe99ZBHAuDzCWH0MfEPWacEiyFdHnzJRXdVag8lV2Qgeuqqu0dGxxo2bCBwh87BFEqvQJjED2qx
	 s18eBaI3NzD0xesCC7pzcKPZeM4bESNTrymHtaDST2YLYCKHUpbauv2Prpg2as9GedQZH0duAL4m
	 iOo9YZM5JUYjHg0EXodTt6pkgG8949C0vVYQVVtSLHafQdd0y+VyKrgxTyLUHrEyN+5PKJfBCskz
	 U1zd3oGtz2jK7P1ZEH37u4ukf8+8KFydPuMGJ84vbGuazjV62QQjVtMsgUOmSNpwt999d2yTuLyk
	 Uo9GmhnVR+t6er/SKrm99RHOUZHTxAJ/hMx6iY5QpalAyZSU+hg0sS5KMEoJnVQaevcb+IvmKcJu
	 ww3spw9PbniH+lGiUuhU0mPcx88AziADHqaWDAr/FswWoRxpL/MjowqQc5vxePPJQKCP3BmhXDni
	 vyFHve05m3mKnpgJ9lxT/mwj4lgt7eCWsrSHchsNVyzbiTT4rUP0fLXvnqNDQlq0vxaBfybKp8bv
	 iCb/yG5h8L+dUsjr9UHlY3zbufKb3FK4RWL020GTUj2aby5cTiJTnlokQo2ZOvsACxwYtGQtCrFu
	 OKpNbDokpMOE0/qWcrgoMtmVeWnQaAXpTIdA0HYf32Ei3EK5/Fh8//mSJWLw51DzXHbEFd89ON60
	 vyS4EBpQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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
Subject: [PATCH v3] rust: Implement Display for Box
Date: Tue, 29 Oct 2024 22:28:38 +0800
X-OQ-MSGID: <20241029142837.572660-1-2407018371@qq.com>
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
Changes in v3:
- Update `fmt` implementation to clarify that it does not call itself infinitely.
- Link to v2: https://lore.kernel.org/rust-for-linux/tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com
Changes in v2:
- Add missing tag: Suggested-by.
- Update the patch title and the changelogs.
- Link to v1: https://lore.kernel.org/rust-for-linux/tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com

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

