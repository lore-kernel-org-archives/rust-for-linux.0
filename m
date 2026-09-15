Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FAC4B541D
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490431; cv=none; b=jWprNJNGFv2sOucaqgt46eZ97eywZT8iRU+Djcy9OCKa+kTn3jWBc5vEwKPHC7k9Jh+k6GaHUw98YQpesdTkuGBOP67fOzjYQIEqyR0U4ZJS2wWyyApGRPRGPD6vNX1YzSQcmRzWoLVKX43Wb3kwySALrI4RmHgFH6mYP78hCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490431; c=relaxed/simple;
	bh=S1DZx7X55e2WW66cR3XPfdNeDoS82+Wq4VfjwuWWrVM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bwdMHHOjlqNTnCOGPuWPCM7TcXUMoP85M25lvJPvN98Jr8arxb/zgxRFsK3Qs3s4Fy/1DZTypB1F/mBQTmPn6vO2Fx14t+mgj3vILNgb9kxiurA5KPEH/JCL01RLCVGY+OvI1gGA0Ssuvv+jilsr5+6d5IhEcwqUtH6yXJ6GvJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=no3A9ZrD; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="no3A9ZrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789490416; x=1789749616;
	bh=dnEl1BcBNFLTKuLcIgJ5HH7MiCpVZFsVbpLITtItNxM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=no3A9ZrDFxBfOjyFFHzlKl8rwkbsWcWm7Ay9n8wdVSMr9xI5Wd2co8c3u58aIyYas
	 Dl6BrN/qHtH91r3PptbeB1+ISkLej8XuqDffaUl5VXW6ljSW4UYnlgUSMGpDioduMt
	 pMZzoGnvhbKnf7pRMxWMaK+wL2tv8QHLZ579XRZTHvlGxx7GHPFB7icrk2pLQBLIi1
	 uy/BHUr2+Idcvw7dwzgfzR8xco3429Xs6vT4b44f/OXHRBuTOf/dJgUdKNk+xrO2LA
	 vCd16ra+WBym7Ar8P4NeEn+CdyaNGYUctvnA4ttWRD+NV7tQdG9iZCeZigHIsx3v7Q
	 iJ021nFDs2JhQ==
Date: Tue, 15 Sep 2026 16:40:10 +0000
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH v2] rust: net: netlink: validate attribute length before casting to `c_int`
Message-ID: <20260915164000.124340-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: 1147f2041977a0213fbf642dabc16417746aaf94
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

`put()` trusted an unchecked `as` cast from `usize` to `c_int`.
When the length exceeds `i32::MAX` that cast wraps around to a
negative value.

This ultimately resulted in a kernel panic when the reinterpreted
value via `__nla_reserve()` and `skb_put()` became enormous.

Validate payload and header both fit together in a `u16`, rejecting
any payload that wouldn't leave room for `NLA_HDRLEN`.

Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
Changes Since V1:=20
Tried to make the diff smaller as pointed out by Alexandre Courbot.
Moreover, as pointed out by Sashiko,`nlattr` is stored in a 16-bit=20
field which houses both the header and the payload, so make the check=20
verify that there is enough space left for the header to fit with the=20
payload.=20

 rust/kernel/net/netlink.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/net/netlink.rs b/rust/kernel/net/netlink.rs
index a2f4bd171dcf..667667346f96 100644
--- a/rust/kernel/net/netlink.rs
+++ b/rust/kernel/net/netlink.rs
@@ -90,9 +90,14 @@ fn put<T>(&mut self, attrtype: c_int, value: &T) -> Resu=
lt
     where
         T: ?Sized + IntoBytes + Immutable,
     {
+        let max_payload_len =3D u16::MAX as usize - size_of::<bindings::nl=
attr>();
+
         let skb =3D self.skb.skb.as_ptr();
         let len =3D size_of_val(value);
         let ptr =3D core::ptr::from_ref(value).cast::<c_void>();
+        if len > max_payload_len {
+            return Err(EMSGSIZE);
+        }
         // SAFETY: `skb` is valid by `NetlinkSkBuff` type invariants, and =
the provided value is
         // readable and initialized for its `size_of` bytes.
         to_result(unsafe { bindings::nla_put(skb, attrtype, len as c_int, =
ptr) })
--=20
2.55.0


