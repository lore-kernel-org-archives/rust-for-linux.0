Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060713C2D
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 07:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788679030; cv=none; b=BINWeRkj35nI7PtX0snar9XWt6VFS1b9tevlh3k+WHXDGMGeLXtzxfDMpYzUaduopVhsSwehmNDLNZh9U5Mhq4lkjph2Z9b3xVpnTusMdr8H+k4uVfuEGZlK24aAvGZ/aNWxK70FXJTjKzBjVrqB88g6VnxpvcvnaeX6lDI2t4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788679030; c=relaxed/simple;
	bh=svJ28Nr1x2+/2H0P9vk+dg3WkoJwazZ1HiL88pPHfWw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISh+QMa8FKz3tYL+QZMR7elTKEYDyscD6zSVI074SxPM3BQ568ds3JD3mitXkypmv69yqoEYJNdgEtNlSjSMnV4dGs5fczuSOcgwL+6iGRiOtxWjs9wekhGL4GQFn2jEF8OJOb/BakyKKXIUre1L7q+OCwpmWL9/zy8ZMXI6YsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=d++j3ErQ; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="d++j3ErQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=hzvz6xoysne47afcy3bu4vxq6a.protonmail; t=1788679018; x=1788938218;
	bh=ocoVgWYwl1+Ls/Yi4yGNUnvahlYRLe6cMNI+dgYGQ0k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=d++j3ErQU9fvEsWXnRe2XRkxTRiByf/AR1T0kAJgb2uQHR5IfgEYWXvV1IhZXp94m
	 mJtRva7falgBwBmkHFU+dsQweX6NPsOwoqJ6gcjWAbPO7SO31Cpb0ANchJK8ptwpi0
	 KQ7Q2ZEV1yQtE/PtR15ar2v2RxBH8u3JHBO5+K9WgI711fQ6yugRiBtmBTHVRz9e47
	 xd7iMKSClX1v0x9OnOovfu9EZkZYcrxtCSuGqVWL4XzYKLQJIwu9tRm4QCbX9cjRoH
	 fxHPtbuZtMfebnmVC4lTPnczixl4DkDQwo76fudMPwQpP20A+jYjkZ4jEULsZi/im8
	 jPUS3iCyQNDoA==
Date: Sun, 06 Sep 2026 07:16:54 +0000
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH 1/3] rust: net: netlink: Migrate to zerocopy's `IntoBytes`
Message-ID: <20260906071635.160615-2-sagartaunk@proton.me>
In-Reply-To: <20260906071635.160615-1-sagartaunk@proton.me>
References: <20260906071635.160615-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: 140f8c1715cba43c8ad3bc952f5b4d62dab90b2c
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Replace remaning imports of kernel's own `transmute::FromBytes`/`AsBytes`
traits with their zerocopy equvalent. In this case, `IntoBytes` which is
already re-exported through kernel's prelude.

Link: https://github.com/Rust-for-Linux/linux/issues/1241
Signed-Off-By : Sagar Taunk <sagartaunk@proton.me>
Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
 rust/kernel/net/netlink.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/net/netlink.rs b/rust/kernel/net/netlink.rs
index 22ef3dde36fa..c3b50dd50a4c 100644
--- a/rust/kernel/net/netlink.rs
+++ b/rust/kernel/net/netlink.rs
@@ -12,7 +12,6 @@
     alloc::{self, AllocError},
     error::to_result,
     prelude::*,
-    transmute::AsBytes,
     types::Opaque,
     ThisModule,
 };
@@ -84,7 +83,7 @@ impl GenlMsg {
     #[inline]
     fn put<T>(&mut self, attrtype: c_int, value: &T) -> Result
     where
-        T: ?Sized + AsBytes,
+        T: ?Sized + IntoBytes,
     {
         let skb =3D self.skb.skb.as_ptr();
         let len =3D size_of_val(value);
--=20
2.55.0


