Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF4B1DA53
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731332983; cv=none; b=q0X2WfKVEUBneVFF+MvoBxYkHTRLKveBzRb9CqMZ323y12zBZt+qtoS/tqAyM1uF5difPMGOGGcix9SVPCQudYwywir+NkymMvE0hV9IacXGHoVm/+a8lRcss+hXkNHOM8OhZvXARQW3ApM1BCF4OUb84pPcuvVxYb7eQAwp3QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731332983; c=relaxed/simple;
	bh=fQr9lMQ/6dJ0BF0hfUWOj6Presxs5zpWHcrDseXjjFE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=GmE6e70b1/035eKJarmM89+21eXq08aT9Ji3GfgGZ/+ABF0tW4O9D3WSiPthBcrfNkZ5P4ylQksV+W8F7nSNSiAxU+jIvnaYgbHhZWB6wRruGDhUcLc4AbebbqDeVoHrtoKEPUW8hDEue6hQ7shJZlZzC8gZSes2KdwaGdOSkMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vCUqV5Gj; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vCUqV5Gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1731332676; bh=Ooo7pZezX3WrjqeZ0wkZJN7/xwoNtBuhqR7BwtDE7+k=;
	h=From:To:Cc:Subject:Date;
	b=vCUqV5GjiOd6jEiLsSBVa5fDUg3UcGFayxq0S+izcf57DasEJsa6rvzB4W1T6RdIW
	 JYQzH8az1nsp6EFSdVjr1zE4QwEa5fUK40/zbSp3rfFgqHGqgYcEDHeRe2q9LkFOJd
	 k+eeucBF1WKLHEuDr5/95ky1QcUGR0rD6MB8UWzU=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.52.202])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id B2222620; Mon, 11 Nov 2024 21:44:34 +0800
X-QQ-mid: xmsmtpt1731332674tgrb1wy5r
Message-ID: <tencent_2AD25C6A6898D3A598CBA54BB6AF59BB900A@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8tFugrFYQ+3VR+lIZJ45iG9oQMIf45CdSiUgbeTLoyVvEFBVcom
	 pBMq5BPhPQIcxY7ncuN4gyNB2R+q3jwr6et3ZTHRzNCeP/0D6jO/P7DnG3NC0aJt16R3Thlj4E7U
	 3PFtrVVcxRhoCfQlOCylwPonM1JRWtyacg4P4HFSFU3Mxa/cIBQ5zSPugKvprvNTgqTB+fHd2Ps7
	 pOGcXffGQ+TgEulQi9txA8u3bZ77OpOvtnS9AIsRdDuFQiZ4kf6bsj51K6pT0bQFts5/9tC7nkef
	 +3uOZTXk7RFo+tvdsQWR7tjaNXFjtXyWYIlnQ9lagg84zuqtyP+rzzxpzDQOeMmlA3Lmc7Px2h1f
	 kRfeuJuJXJLChUl2JTS8pLNx03EzBLYZLm840afJ+s4lgO675e3S2jF2DIz3twqgrycbm9CR7WT2
	 7ULwuoF38wlMEQ8l/O4KPT6PoQK1gS6VPtfGQREB7N43iyRvH+yY/enU/yU3DY571xfl52hzsp0i
	 x4tXGzhK4D03isUveI3RHU7ZWtALXR2AlEVmmhn5psoUq+OsxZjE0sGLsSV0+Mdi26WbAUb4f2lI
	 SLkcpEMabI1pVEsXOyoVB4OPxQa/OVT74ofNUdHQzvgUCG1GoCyFJ8m7URgTBLyjrmX8DoVO0FMg
	 LGmy/Wz+1acjOO39fsIKyNUlJphxPBCf1lZYXZA1O8PbxDyObA6nQvXIUy/SR5EwLG/5E9puI+iL
	 cnbnvDYOOvyvkyk28V2NcScWTcGFSxD/1eD4Z3xmA3J8G+IaxxQRjE90tr8x5+59kheydaqixFO0
	 m2pE5tzGW6g7zLJDTYhlyvFTco5DkNf1eTWytzWh+7KNqe7u8gNHuVQqDcLN/NZ2ZN262GqyD1zt
	 8iq26TzwdhLxUB99iPzHAXS588QL22CBthKM5o/3VqWq0lp+w/GM1IyvCz63v4t1QcYj2d2jykYP
	 /ojt08/o6c/2oTLmFEAi+3jnbGSi5SIOi0Tm7zDn9EPxbnAtBTgo2GFqkP4ByY
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
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
Subject: [PATCH v5 1/2] rust: Implement Display for Box
Date: Mon, 11 Nov 2024 21:40:41 +0800
X-OQ-MSGID: <20241111134039.1507783-1-2407018371@qq.com>
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

Acked-by: Danilo Krummrich <dakr@kernel.org>
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

