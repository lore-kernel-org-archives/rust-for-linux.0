Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998400;
	b=U7DyLi9kzsM7mBJweX8MZr7TD9IXkEUM//PnkgnKMbhixtGpUUwWob5Frtx/pAG47v3K
	 OJgwCQCMpQmvqVZ5A9UynXgVq89I3vElendkNZ7Fz1PtM5s+EslecW9MDunll4iZ0vdIu
	 7s7JucWjHwhvbC6x3rbK30uuj12vRKv1Hx0M0nlgxOWhotNhytIY0yOKoKF7JrkcamvGr
	 ujz+y+pFMGdb8xXrK3hVoBhDlLLiLXG2L2eatjtefvIscN427V6+CflyU6+Q9tIj0P43V
	 eMYpquIeq8ZSxJm7NrF3tHoMr07/eECzMAtJs5X/36klgSU7qgY7NRwYDihNRE14yJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998400;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XDa4T2Svnf0xreeQhyk2ka9zHJk7TIyxlvHo9ClUQJI=;
	b=z26OW7U0487YjmLFIDXXH8UYByynBkD6n2tkkCVHyKcrI9/yXcfeccWfs00/xlKOP9z3
	 zXJ5ql0EGkJaNFTIPafHxUD5q6bLH/j25ap3AHKcaBapE+dWvtUDqGh6JW+ijrvQzZZnx
	 7+v8H4pc+WDx52O3bVcMW5CGM6o5/9kwFEC0EvIfaxNjakEvA/hniyUusYNFW1R2nn0LB
	 qm/pVZ3JU84Vz/0kTMLIPY+zeG/OYdA08OLDTu9QcW1t3U6Jg8TU8mL+G//VoKQVC38v4
	 HMUf2GnpIPn1a6R5F28i8Ij5hGHfQhqn/vu6WILiXhsa4KV2YT4k2Pz4KW4P4dsJPnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=olH1FMkb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD2E606A331;
	Wed, 18 Nov 2026 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=olH1FMkb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794998399;
	b=FM1KQ/Vh8oKl/0/EPwOvie5KY+/L3AWIyfBOeNPy1JET4cz2uj1vjagoik1aycGvxgMe
	 0Oo3iyS83USGflSrCUUgH67UEbx3q5TiRrDDJwh/YDbQiTzTbboWLuFFV0CbprDLCy/T8
	 CwXGJ/Pzkj914IMHt1s7Y+TTREVbU5SHH1d2iTjp0TFeQuoF2eat/rnq/eJH8C1nTxwxH
	 0L1vTmFnYWycCC3yD6kZHL/m6iL88Pe6VEgJQ8Iy2+4YotICvi1mnGycnEnbO9uCH2/YN
	 MsFio7MZaCsSMl1Jw6KTXcKpLUG0GkKrrHROFq/YpD+d94kwKooLX6DxgzHtM6Aojbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794998399;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XDa4T2Svnf0xreeQhyk2ka9zHJk7TIyxlvHo9ClUQJI=;
	b=eQUySzcSwYWcB3GTYcrfgyM0MxUNbA4Df2ZZKb1wV3dzdKOKaInoC+7yzyA1J+zrbFlM
	 FHT8M8fF+lrfbn98N7mSC+EoDK9lySdgKcX/DZuel/4MXAzvaGBgrrkrVQHUqyYivFLh7
	 dlf4jjD6ABvAlBkyYukYYfNxXBKn2GK/vVkp+iYhcXgvvsn/5KyjPlmXA3GrmD40DAJIU
	 jAUZ9OFnchohc5tmIGkcEa7iFjs17jw5lzF+R5SZEeo6dIMD2ekriIfNgmMLRxXE++GYM
	 LMFhGQs12z+MtnSaocgT7KNyNx74MmrtWEjqxDgTGSiSdUm/uOKLlR9w24zE7kmtjzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45E401F000C5;
	Wed, 18 Nov 2026 10:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998399;
	bh=XDa4T2Svnf0xreeQhyk2ka9zHJk7TIyxlvHo9ClUQJI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=olH1FMkb+o3fgwdCOWCeaYIYONq+35rd1fWBTA7wweydp9BjlxNVoUMEVgfgAHGmy
	 +rlZS83XwITI5BDxbYhK8N/wnQ510/srkFQ4UxV8dG0mVVfEt2aHUp037MeFKSEqsx
	 C0+46ggY74y+bml4l44L1EtH6lOYlmKll1dLQGWBckGaeDRRTYagqoYSL8BLhUZPfQ
	 smGbKQneHovH1pheiqe3Ni19qWx/x6A4EMG4pmZhlQDqKE4cpRb7wCO8tG7H3avSQF
	 gKeLl+yxM2u8TaQZ++Y6VcmJM8aIl2sPk6A2D4EhKa06eha/EiYaXX6ma/sz9MVTG2
	 mHXh0A6JCM7yQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9CAEB4ACF3;
	Wed, 18 Nov 2026 10:39:58 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 11:39:59 +0100
Subject: [PATCH] rust: xarray: capture the iterator lifetime explicitly
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-cleanup-xarray-precise-capture-v1-1-43e148eadea4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAH6A/WoC/yWN2wrCMAyGX2Xk2uA6sIivIl6kMXMVrSVpZTL27
 nZ6+f3HBUw0isGpW0DlHS2+UgO364AnSjfBeG0MQz9459wR+SGUasaZVOmDWYWjCTLlUlXQhbH
 3zh/Y8whtpPljnH8H58ufrYa7cNlWt0SgVg9KiadNqtmKCj33Wq1gkrnAun4BvZgxN6cAAAA=
X-Change-ID: 20261118-cleanup-xarray-precise-capture-1bf06165c6cf
To: Tamir Duberstein <tamird@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794998398; l=1477;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=BUiadxipdagmI2NAgF2mTTigbq84tSd2XDg8WwXyp/8=;
 b=orptA4Jd5c4u5bYxSkoiI+Ni+VLEozHmOlAP+QBxekc76Uf+67HjjjghbjfRMaHV1zgXptIK0
 c4MJTSOl8SXBbtBlSaYMX66UsQHdJNIofQx2uGTKBYEQ7gfdIVgQ3br
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

XArray::iter uses an outlives bound to capture the lifetime of the
borrow of self in the returned iterator. Its caller consumes the
iterator during pinned drop and does not need an outlives guarantee.

Use a precise capturing bound to name the borrowed lifetime. Also
include T, since the bound must list all in-scope type parameters.

Suggested-by: Jesung Yang <y.j3ms.n@gmail.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1175
Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
The XArray KUnit doctest passed on x86-64 QEMU. The Rust kernel
crate built with CLIPPY=1.

OpenAI Codex assisted with the signature changes, testing and
drafting this commit message.
---
 rust/kernel/xarray.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index 987c9c0c2198..4a67e7f24335 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -108,7 +108,7 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
         })
     }
 
-    fn iter(&self) -> impl Iterator<Item = NonNull<c_void>> + '_ {
+    fn iter(&self) -> impl Iterator<Item = NonNull<c_void>> + use<'_, T> {
         let mut index = 0;
 
         // SAFETY: `self.xa` is always valid by the type invariant.

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-cleanup-xarray-precise-capture-1bf06165c6cf

Best regards,
--  
Peder Bergan <peder.bergan@gmail.com>


