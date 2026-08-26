Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F6447817
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761818; cv=none; b=mcgfGoW5+qqylQMlpu/gCxHltxE5d17a2ZgT80dMwJKZqmZ8pakmHYDLWGDzjnvXGxtu8Xxc8DHmhL7OnLLEcp9kBbzYOVGhMpugFhOKiP+7MqO0SzdkjUDuj15Uq2k/nXHGYnp4L7qvgiglbmcvXxYT9V8mZjhlpkxZ4sLKD3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761818; c=relaxed/simple;
	bh=gwIfm3sCQyiILWZQ7xFw6yNp7td9RDcFDuU2pI//xdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8/skg8WPnJ6Y2mVFOg8B/n+EHfBCO5f1IdQ9LFKOd2LxNI6aaP9HPjsuocIuRdfKMlV3xs7+xNB+xZrZfqKwn2MY/myb9H5y0p+DCn3B/FNOhMhw6y+Sr7BgjeJbSQsY86HcRXiTr9MQao9xaLSKxWIROqaaBfB69biAnbGez4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=LsqMpOMs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="LsqMpOMs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso10748205e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761814; x=1788366614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5JqemKnba64Z3g/kh1rqnazfKcGKeW7SjV07q49wE8=;
        b=LsqMpOMsFvgMA5daSnkrAZT2lljVUtu6hRgd7fpAwNuPB13J1mENslhUBn/+xYYqqL
         2dB/b8TiT6Dw1bw65FYI9jYuXQEgPBycpsIMg6pEwyqg/FbYiCieJC+lPkRMEJWlLdHD
         Rz51CXECI7MLIZnNKByUc+R7azX1gW0Rso9z1GawcD/4NyiaqgNU2rlOazfghGVwNE9z
         KAG1RX7oPXjBrDe4w737qGRyqulEMIjegBUMg9JP2CR6zuaSxugOd/ZZ/aOL4wbkWXE6
         8rZKEU33MiptizNe+gtg82wzNb06F4f4m1G+zRthNmw+qY5zXfEE/SQRInU4tiLfb0zc
         o5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761814; x=1788366614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5JqemKnba64Z3g/kh1rqnazfKcGKeW7SjV07q49wE8=;
        b=WnPSyPRiz7vtbV0Qyz32ZiyBGj01k2tHyaj2HVpAenJQF5O384fx4JT+J5KTrxw4qd
         EO6ms1KQhnP64xFlqmo676gob0idSol88RCadohVH6YI/3h+jNkOZAfrBrVsO5/Pk5rP
         rOoLRYZGnq9eO2vwe5NaeMMHP0uVinvvHak4lJ7WTYRw+xjk83aloZnkTy+by8cSp7BY
         2VEXf3ZBbEFMUY0wxIGgTNFAoREQQFHBn4DDaOh4a/oU9ThETf+xlfchM03zK85fdgAF
         R5pMxVzA9Dd8IPpegGeu6bLFTKdA7tiVI3C7gKOF6Dc2qbHCUX4oC7ZRcnyiDOLXpFle
         ELcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQ96IhUjS9en88pvSlh4lNrPMPh+Ey/dNlXA5wT+qqfEA69QgUnSaxyDJe7f/IOMtGjDHb6NT3RUk4NowGWw==@vger.kernel.org
X-Gm-Message-State: AFuF++lUIEtYNqkr9vwenuYiq32qvsGFWoudS3eSKGosCzb3LlFdToJz
	VDbr7KR76ZWr8LmH29RzDajIvglAZIx6x6SLuJUJYPCxx3gYfSrbDWYj0MMpFk3iOg==
X-Gm-Gg: AR+sD10SHkH9KaiMEvFjBSdr8fs+HsBO17Mgmq6WU5s0xReAMxeMbokeYz7/USLXEm+
	l3YEo2HNGJCbAzzvmXqueQQHFiblVPD6qNDf0OqmB31D4pjuSAydJaD9ZELjN6PH1i0pWJNYCZ3
	+Oc2u5BFj9xE1MCQZ6EyknItj4ZyMhzG4mDhHkRkRrGOcG51uawXyjwn1HNGXWGYWoui2VhRYwt
	/R/PlR3XZfhtWxPz27OarPm0uN3DeMYkEL6CdpPtgGfcxtDRXPHUGvzorZA5iYqY1Fw4vWRga63
	910RCAiPaTcxUIPLlGpAN/oU3L39gOnaus9qpjJXYLts2yzQRXo3fwRskqZ9DLKPC6gUJgJsRYA
	O7EO8DYBlAXi3aEeLYqGw5Ez+SIznYVjRf2LMIPdo8fAhzpkm6skBAVg4SoNnGL5diQ7RgULYM5
	DHRPvBgT6yR4vogxDMVhbSn/oR/EHcVUZ4TKiUCrbnedB3GbYtl3NGxSeffMArDfjiFz/aTpOpH
	f292bj3d6kMdnSRmK1yMKWsrTH1mp7EZ9T5
X-Received: by 2002:a05:600c:c178:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-499dc6efe07mr77963895e9.3.1787761814121;
        Wed, 26 Aug 2026 09:30:14 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc981bf3sm32323615e9.8.2026.08.26.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:30:12 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-crypto@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/2] rust: crypto: AES, CMAC, SHA-256, HMAC and RSA bindings
Date: Wed, 26 Aug 2026 17:29:47 +0100
Message-ID: <20260826163004.3365-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Synchronous crypto bindings for a driver that has to authenticate a device
before it is allowed to drive it

The first patch covers AES-128, AES-CMAC, SHA-256 and HMAC over the existing
synchronous crypto API. The second adds RSA through akcipher, which HDCP 2.2
needs to verify a device certificate and wrap a session key

Changes since v2:

  The hand-rolled AES-CMAC is gone, along with its own dbl() subkey
    derivation. It delegates to the in-tree aes_cmac library through
    include/crypto/aes-cbc-macs.h, which is what Eric Biggers asked for
  There is no private RSA primitive either. Modexp goes through
    crypto_alloc_akcipher("rsa"), and OAEP padding and the HDCP key material
    are held in a memory-wiping secret type
  v2's separate CMAC fix is folded into the commit that introduces the CMAC,
    so this is two patches rather than three

Nothing here knows what HDCP is. The consumer is the DisplayLink driver at the
end of the chain, whose control plane is sealed with AES-CTR and keyed by an
HDCP 2.2 exchange

v2: https://lore.kernel.org/r/20260703030056.2763-1-mike@fireburn.co.uk

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, this one
  rust-usb, 5 patches, to linux-usb and rust-for-linux, not sent yet
  rust-drm, 23 patches, to dri-devel and rust-for-linux, not sent yet
  rust-firmware, 1 patch, to linux-kernel and rust-for-linux, not sent yet
  drm-vino, 13 patches, to dri-devel, not sent yet

Vino is the user for all of them. The abstractions themselves are generic and
carry no knowledge of DisplayLink

The whole thing is one branch, base and prerequisites included, which is the
quickest way to read it:

  git clone -b vino-v3 https://github.com/FireBurn/linux
  cd linux
  make LLVM=1 rustavailable
  make LLVM=1 -j$(nproc)
  make LLVM=1 -j$(nproc) modules

CONFIG_RUST=y and CONFIG_DRM_VINO=m are the two to set; DRM_VINO selects the
rest of what it needs

It is the exact tree these patches were generated from, at 4c9ba407018e, the
drm-rust-next tip of 2026-08-06. drm-next has moved on since, and this follows
drm-rust-next deliberately: the KMS layer underneath this work lives only there,
and that tree picks up drm-next on its own schedule

Two commits on the branch are not in any of the series above, because they
enable no part of Vino: a scheduler call site that stops compiling under the
locking-guard series, and the Kms associated type Tyr needs once the KMS
registration trait requires one

It applies to the base above on its own, with no unmerged work under it, so it
can be taken without waiting for anything else here

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (2):
  rust: crypto: add AES-128, AES-CMAC, SHA-256, and HMAC bindings
  rust: crypto: add synchronous RSA akcipher support

 9 files changed, 592 insertions(+), 6 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
