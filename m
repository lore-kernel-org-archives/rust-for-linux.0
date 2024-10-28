Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21371DE2B1
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730127518; cv=none; b=jeS+IEE8l7597XlcehqJQel7arDNd8pGBi7sn0aoLgFrWhLIEX+FDrw3avKjJfxA5KzBLRx3nYk1UOE8BP4YgSTJu6st5ApTSaJUBwTyBAfaGC0ECxfZ0a2jXoMQ/8NVRsudnLUnWgd0Eyvnr9A6n5HaYLIs3/ACy8WhZhZK6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730127518; c=relaxed/simple;
	bh=k8cJyfZumA87GlR9XgN7azVFt7CTlP8gj671CxstDeE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Jq0XCa8tldwbY5ydFxmWOo91zdLBuP95m7hg9wRbnGXg6T/cpzdCMKRROgztAWVbjgx97N8bgIwUwzI+J0EMYx6hENflJqEDmm6gYCl/zbnS6+xJ8MANBUE1FAsca0ImcmaQEBwVZPBzThWXNggklfiWqEct9CURxzTbVz2SwQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EcMaGYvo; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EcMaGYvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730127201; bh=2m86ooiNTqiQJVjUpXKuALUQha2FA6/RyxIvBbxOwr4=;
	h=From:To:Cc:Subject:Date;
	b=EcMaGYvol+k65n+MocJt1lahjF+7xtysQzrj/7eyRpNskeAnCowvghY6FRyopbjxK
	 MRf6In8vUzqzmg0TJ0yRtrp4dj8uQSCKxDL6uAF4O5UUMdEfZtodwKEi82x4pTZB8s
	 vx/1LLbpcoDS1Vhb5wJZRcWB+iNpg366fywGAjCo=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.55.158])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id D532ECCE; Mon, 28 Oct 2024 22:53:19 +0800
X-QQ-mid: xmsmtpt1730127199th3h98dgx
Message-ID: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznvs5KVEy4h0skdTNA9jnDya6VmJoACMmG4oWA8edFzrX/L/DhQf
	 9l3zFtE54BA2mZkMQLPjmo01Z3MXHFXkHRM0MHornzrs+6GAUUYQ4Qcq7u0l4hhxjXGE6MDnZD2a
	 tauwA1pnzU/7/5WQu6C3ldepCp6WvbDpAZPLeNWgDa7xdDXWDAJZNMjVa/paAbH4uB9lmPC5XpN/
	 MHmwBHZv3ifc1md327kGe1pFsVudiRo5ez2B+zOIwIz8MtJ1a/nBZSNlXEmRj5NVWbmwmjgIrO7L
	 5ZiKbu7MCrXst9QrZ2IqTU/Vto8NEHIi7G9nHWoJgG5FkQ58BLCEgRmiDtqjviSsp+z5bT0Hymzj
	 irkCVqGD2JLytPHnPF1xtHJriUEcnEQfSvwGxdEdbw8WPJhCQht7N2A8jzocCYhkhvE7x+Q8bId2
	 Ni7xKTRUVFqwOQez4WH+Osx7oQhQTdKTtDHf14m0N9LGqR4H98Z+C/jLmlY6NsTvSjRONu/vEcLA
	 RYDZ1UqgU8F4mb53liMIhhsXcKZqNdDsWDY/s0wEPykPuoN0db6Aht8iCdpNzcnziJiX4S0ToyCq
	 tgmIiy+8F+FGRrPKRdHMkZGIayV7y2OBHFBkThZhssv6IfH4n2rVLgdHb32LEhINxN2xTSIpkRvH
	 oCz1CweMFPUBH/uzIvPRZkLiUvtjzJVqZsKrE5L/sCYJqEUw4YKj6wxyjR1yy9114OiqEpjGT1FK
	 oUJUoMbbBiFLJ6AxpC0FXG/HE+h05s0IFaBqFSx+mVUulqxnpNHNProHcCvryDG3OblhgoSZKQ2S
	 o3Nhqx4UevaizDizzUPMc6FhGjo8/yfBIF2qdLsOoyQCosi0Bwyo98xKsNEUAdBUHJdCZc17cntK
	 /Efl4lcvH0sWToEuVTcj3HZERNVMF4zFKGYvEtgX5OLM9U6UlhTjgfDp7M7HzueFnFS6+cEU2o7I
	 Zk4ozxIZ2VITmul5l+W6OyDIgZ8Kui6uIcvYuGSXDjLlPJAZjZxy6RPpjMkhTBEbDCDFkGr3RQ/m
	 ROGiPSnWi9Mjpnrb3B17AepKGdAcEcoHwXMI1pOJaLb/pYPX7KPQd/4BHojNqa3/gGBkyEqQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
Subject: [PATCH] rust: Implement fmt::Display for kernel Box<T, A>
Date: Mon, 28 Oct 2024 22:52:47 +0800
X-OQ-MSGID: <20241028145247.546394-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently fmt::Display is not implemented for Box<T, A>. We can
make the following code work by implementing fmt::Display.

let v = KBox::new(42, GFP_KERNEL)?;
pr_info!("{}", v);

Link: https://github.com/Rust-for-Linux/linux/issues/1126
Signed-off-by: JCKeep <2407018371@qq.com>
---
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

