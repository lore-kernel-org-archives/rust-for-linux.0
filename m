Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795646909;
	b=0+JzSi/QmH9cWiMhbka/pygl5JT7Wf4lwTXvdl7C1Q2o5LqwVRLiONEjxwXk+pkvChTv
	 447akh4N341Lne+XsNYQPxoJQKEy6eUF0yGHcseg1Mu7z8Mk39Dhnl3VUgyvOsiiwxB40
	 ORfye+gV4tGRXA5HgFbBR8SuMXVgyTdZn5GIiwuNCq3T4xVce6trbVl2xM8Kh+LCjvp2E
	 24xDGHvQw+5rMoXyLggp3YFZMP3IjuRGeJmUZ8OMQnLhlg3pqgOcs7KCvGoarrDn+gbUW
	 Cx2wQ0cCAj0ooR/lmnDiogUCkmXrdKuHbWtBIZhFTlaLNkiLWMQ1Z6jmEZXpPVhKkTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646909;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=KIN5vrLFiw7thN7hyC+KS5tr1pqA1M897TaFUNAMTjA=;
	b=4+iyOIhHypKD8pbyh34uXiu3m0b0HFhVnJh64ET1heZgokZ5JjGHs9PfAM5lK9vo4fnJ
	 1RNMESrS24cx4xA2q0+K2JLYG46MiYWhdKJiFNtXD/v5tjjN9+R+kQWnA5cYdNH0GCQCm
	 kLa319rZdfuq3s9g53B8pfEaFLiZd+g981grDuNzVt0qeluo1jTizfbPHOhxc/GgRT5os
	 fSxUliZoZ66gRl1IxWT+lo3y+2caZ//jS0Owvsx2BsYimKhnCBw6trWnfaiDCkHrmDXAV
	 Ao8sW/4JJ0yvTggXLE8f0OB+DkjCaS13wDEjqOTR0DIpgKdDZIMLkksg8vZVWaSxhWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fFwzESY4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C95E606A680;
	Wed, 25 Nov 2026 22:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C95E606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=fFwzESY4
ARC-Seal: i=1; a=rsa-sha256; t=1795646867; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bXsC9fJWAQoJmowcMhhUMsNaa/VcKXrYffTOBGx+vNCCiwEvMb7DsDYJPP726jqwCxNXOSlzvL/66OaZC5DHTDUMAUinITzferrsRu2lij17zF+gB6Cvx8P67xzndgDIK8RAUNyZvdY6gdoDaTBW4DKcmTZmGmHd7RSE/5BajU0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795646867; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KIN5vrLFiw7thN7hyC+KS5tr1pqA1M897TaFUNAMTjA=; 
	b=nuhEhq+iRBG/u2O/uF2A25R8/EChSLmfUr/myk9uhJfJsCnBgBhfFmFvPL6c2IoIaz/8Svw+BqwzA/Hoi9Irm0vXB1amJuU+yCJSpPEGmGKD5c0F8DCz2lBU6hUpGCo2SQyQGz4ivAIz3ir7humt0+wqK3k26ef5Bno02fbBxuk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=fFwzESY4dgvBf7ptRxyMQfutyV0lbwkH0SCU/0rU4E0zJvuBY1F0XYvD3WcjBXi+8/bQMmgJLl6zZB/UVbthSNEpmslUNuHeOnI4jGLDY7f1rK2gT7gmaGWUK24CrtOG0pU3qY9A9BD55cRGo4rOAQJpGr/nwi7Qw5DR6q+tsbQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=KIN5vrLFiw7thN7hyC+KS5tr1pqA1M897TaFUNAMTjA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795646866280624.7138417455867;
	Wed, 25 Nov 2026 14:47:46 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 25 Nov 2026 19:46:59 -0300
Subject: [PATCH 08/13] drm/tyr: use VmMapFlags::all_bits() to validate map
 flags
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-tyr-as-casts-v1-8-2b2f53164d86@collabora.com>
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

An `as` cast silently drops the bits that do not fit the target type,
and nothing at the cast shows whether that can happen. As part of a
larger effort to reduce the number of `as` casts in Tyr, stop casting
each `VmFlag` variant to `u32` to build the mask of valid flags in
`VmMapFlags::try_from()`. `impl_flags!` already generates that mask as
`all_bits()`.

No functional change intended.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/tyr/vm.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index 9b52f3562004..f06d5b02d8d7 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -144,7 +144,7 @@ impl TryFrom<u32> for VmMapFlags {
     type Error = Error;
 
     fn try_from(value: u32) -> Result<Self, Self::Error> {
-        let valid = VmFlag::Readonly as u32 | VmFlag::Noexec as u32 | VmFlag::Uncached as u32;
+        let valid = Self::all_bits();
 
         if value & !valid != 0 {
             return Err(EINVAL);

-- 
2.56.0

