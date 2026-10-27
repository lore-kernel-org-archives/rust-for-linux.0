Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103004;
	b=3uSF7nTiZB81ahQgE2gfv3UKIanyX+ISTo7QLIjR+9UlAXFxu6zLVvqJezmV6vcJo80n
	 Q7q7QBc4QBfa8fz1IO6FS1DZVvHZO6L55H2FqmJNhCMA5m9sSAuqUDRP4QOw6dZOKZl7B
	 Mfb9D2AnctMZUa5fPcCeooCYBUdFubPQKWwMTKb3XIExK4Ga8YTcKVAEUMnPNIlpGZDIV
	 PrN9E8Zx9YvYJCWl7tV8GxeULE42U+ko4ceLF4vY09HGhWxqCtAUv2e9++sQK1OFHzpWs
	 8OCcE4Z+fVWgca5OEiITFd5w6AU1UWu4v158ouILlQybPT9fB6ZSB8dVLNwHJA7+Z9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103004;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=+/yUZDWJm+dq+R2m+4C3amtipZZf0zBQmyOqVt98Leg=;
	b=gXxP5MwceMeSpEpm/3fRmIJYgldcSIm+tF1Jcpdiq0k8nX0GaXLi+pM1VrWpAe3VDvW6
	 2VioNAmx0XiYFgPzEBgM607hIS3UYz4y8FNOCng+YqB3SUSSK4JduQ61sruhxamNnehvG
	 SJxSiGLawkhmxP2Ah5PV94G1D4lC0Yry1nTe5nroGCb0THybciAxrjAmWn3SHhdXouRg+
	 vqVj+A74ppCVylRHra9wcWtTZujN9JIdzxPCbDWnY+bKotG4+wzDezIZAn6aomFynzvzd
	 4UKFWnxxZ9Q7aO6z+achT3D4ji4F03RxSrhIo1rUg1nh3yIIHCeGTfeihJiDB9Ai67g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAqrNaSS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5FE606A330;
	Tue, 27 Oct 2026 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAqrNaSS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793103004;
	b=wP4jA7BFsqOe3Ti5ln4WLEjI0EI0U7YXABSB7rabGBMt4apxTi+KrqIgPCPrf/ar+DaB
	 WsPCEfG+A5JYErD4HpmQtTofdctns60olsH8H1LytOKXBp9ieiWnuAwwF0Un00lsIwfCn
	 GO3tNJmhCHX/QzaNKE19PWaw5zK8gGoQ4F0+mMY3Isot2oVG0JlgZ+meD3tUq6lUl9e4u
	 NQuOp86pk94AHNG29a9Ad7Bi15pZ4u08LpXakgKb5ItZqOPdYn8eFUazXzRsskHTaXFEC
	 vCYUNGh15Hd1tY5LaBoRr4Gb8GCI6M2qBVgNe1bDuLWivNzT5Q8EpZXIVXV25YJTwzg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793103004;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=+/yUZDWJm+dq+R2m+4C3amtipZZf0zBQmyOqVt98Leg=;
	b=GuyRQz69K7kBqu4sJiu+s6BaM5PEE0b5Tg4j7vczNeqnahlxZyElHpYIgZZsV/las37F
	 RDrZPP1PVA0OZ68fMRWJZNgP25ylgjfd53FIh7Es2/sguZxkeLul4skffQx74HO0/0mAm
	 Cng0yiip646RRrCdKWAH1ZYQD8k1DOdvA1DFQX9AtYiEr4W0Ay+hAU9W03WCmpBsvDIGX
	 JIU2+3ZpPSe9z+VWVCgoN/1+yCu2+ZQytzcEH1SqiDyzxl4+Wl9fBPeSr31YYt7YDeI6h
	 zSuVfkMm3sPqY2qFU+llly9ZOOeBPGW+cTJC0tEvva4YS/e8rzzHsdiZHBfX/nYOtsQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8F591F031E2;
	Tue, 27 Oct 2026 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793103004;
	bh=+/yUZDWJm+dq+R2m+4C3amtipZZf0zBQmyOqVt98Leg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=eAqrNaSSP5CIymbIQq+H3skueKHnOLG68mrH/u2dO83QquC+j2RKIPtws4kmvG1G1
	 CxfLGgvf5GivCa6i2XP03ICJFWb+VVqSq4HdThJuEkyfPkJezAeDASik3eYna44Igb
	 aS0y6ZLPO9n4FNktlA4TvV3GNcuBpIxS57gCGVngBYfKnU5AmyNLLkQ2WwGYMA4aAi
	 d2tim6JvpKW0o5KMdEzOmCVeb1Mi69cyvF5wuyC2Rsc350qn9Dyizm9ZqArWDrMnZj
	 p5HdMy2zsTts3uxY3ReycbaSCkK2DS3zgZ4OR62BZ4JczQAPUd0koyt59kEfFehzxi
	 NR2bR97rCzZZw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F3219450CB;
	Tue, 27 Oct 2026 12:10:02 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Subject: [PATCH 0/2] rust: str: parse_int: match kstrtol() sign and newline
 handling
Date: Tue, 27 Oct 2026 13:10:02 +0100
Message-Id: <20261027-b4-parse-int-sign-v1-0-7f386318a4b7@younes.io>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWZuEatxeRSyoKWNR0kEk4t0Vy
 +8k579AyDMJ1NEFng4WXlxAGkdgps6NhDwEg0pUniaqwF7j2nkJu9tQeHSY5VRWlTXa6gzCb/V
 k+fyaTftb9n4ms70huO8H0BnwUXUAAAA=
X-Change-ID: 20261027-b4-parse-int-sign-36e899fc4f43
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Gomez <da.gomez@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Younes Akhouayri <git@younes.io>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793103002; l=1463;
 i=git@younes.io; s=20261027; h=from:subject:message-id;
 bh=zTt8DAHZuMHakgutZ0swbdOulHE2DnMp45ikzS7giQQ=;
 b=O0yOTqyIwfn1XZyXWmC1vlbvSbtpaVkcyFqc37vTG2uQ8ocxhZBOzF+G1Hi+yvNd+CVPuitZR
 KSOBAGipiB1C1O3AneAeEB4OegJ6XnCs81SLFSJTArXuDyoU94lDe7f
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=TavwxGPDBjl4XGNQyFLKEW7PKSY4qOWusc7yf6hjV0c=
X-Endpoint-Received: by B4 Relay for git@younes.io/20261027 with
 auth_id=1332
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

The documentation of `ParseInt` says that any string parsed by
`kstrtol()` or `kstrtoul()` is also parsed by `from_str()`. That does
not hold today, and `from_str()` also accepts strings that `kstrtol()`
rejects:

    input     kstrtoint()   i32::from_str()
    "0x-5"    -EINVAL       Ok(-5)
    "0x+5"    -EINVAL       Ok(5)
    "-+5"     -EINVAL       Ok(-5)
    "+0x5"    5             Err(EINVAL)
    "5\n"     5             Err(EINVAL)

Patch 1 accepts a sign only before the radix prefix. Patch 2 accepts a
single trailing newline, as `kstrtol()` does. The `0o` and `0b`
prefixes are Rust extensions and are left as they are.

Tested on UML with the Rust KUnit suite, plus a temporary KUnit test
(not part of this series) that compares `i32::from_str()` with
`kstrtoint()` on 12 inputs; all of them now agree. Also booted the
`rust_minimal` sample: `test_parameter=0x-5` is now rejected and
`test_parameter=+0x5` gives 5.

Signed-off-by: Younes Akhouayri <git@younes.io>
---
Younes Akhouayri (2):
      rust: str: parse_int: only accept a sign before the radix prefix
      rust: str: parse_int: accept a trailing newline like kstrtol()

 rust/kernel/str/parse_int.rs | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)
---
base-commit: 7d109178cd644268326cd31702ed46c7ac8bb300
change-id: 20261027-b4-parse-int-sign-36e899fc4f43

Best regards,
--  
Younes Akhouayri <git@younes.io>


