Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548047;
	b=QFKWgVHggnXMDZGxrpqzNb1fu8c9i3DDGIy3h0I7OBJT3h05nDrygJWIclHZmcrnzmvb
	 B4FHqVqUF9MAwSAZc32IdDi0ZOuO/9gjwJ0VFQtgjNHIu1Iw9d6H7pBbM+rxwBv9KJDGm
	 Zl+vULU5u3VCdCsB8H+WbzUURisPvaSCdoux7u47/Deld6MF5iXFmyb2sS928EbGWo8HD
	 b4zx8t5idygLIBzHS8HfcsTs7mGDhN3NE02uYhvHt28RpAVtILct+QCtEBjbfr/AzZPiu
	 +ZkjqAjzP7+U+CKP84WFZ8QMp2v9eLDwT+5WhjF4wdfCvwpf6B+A2PLHp3orKtELvvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548047;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=C+MO5fqeCy6bspcZMliDx99Z/Z7cSPsK5yc8kHfzioo=;
	b=GgDEBgbWAOciS/6e6fg2XuRShDeA4bGDUjo0jfXZdA4jgm7VLYTQajEy5/1w/VKyO5bG
	 QN+fLAOGfzS0fTwz+u+AwM3g2TMQLzAuKNM/SCsLZgkb2Sja8dtGQpkzHfki1KiHu7U8X
	 VfxpW9I52JM+RBiUVuzy0pGI0ifrp3dqlSuyNYBdBXCk2l3hWDjztfSE0a2dRtFZ0kkLS
	 R6hqEgJ1rBA0w9Onkl9El4z24EzRF0gYIJXgX3//Y6GAYvtdacVmvG0xXgiCZ6vhVKUUt
	 HIlddZisJkXtpI3p7pGTJ93z1l4O7IeOctjrnlDh7gRxURK8y9WC39YcnOuRxPjy35Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+St66qA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8225606A325;
	Sun,  1 Nov 2026 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+St66qA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793548046;
	b=3bg8S7DnWmGT9Ml/32DTVYPR9biSrIaALYgzG+V5i15rRy3gQ2z+Zf3J76bqARwwwa48
	 r7QtRVevzJFDypxVOfKuS6NhqsTbcMX0E9nZ6uGDVJ5EljkGUTv94JrnFKe0G6zLzC3nc
	 bPNwfgbMd6yU8pe2icW7IpluAq+W9u+XNqiELQPSwksnGeB9nOygiO8WKwrkjk8YtTWmJ
	 TUkcO17V+gOkFoGdCLirmCbrwvGhAxUg/KQUqQ19eKpEQp9+0V2pmqXNzS0bJ6j13w6Ut
	 Mj+fkJiwA0eVZh/ta/sCGSUNOOCIognLXhL/254uyWw5szgw2SkhIR52bdyGe5uR4OQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793548046;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=C+MO5fqeCy6bspcZMliDx99Z/Z7cSPsK5yc8kHfzioo=;
	b=qDgPaI/iYgdarNnJSRx6qwNgJfZArP46cARRendCt7dIXCE44egtHSUqNaa9ZE8dUmFF
	 Sof2jzx9b+ypRdMcRBH7y+1IDBVf7hVQw34I+9zat+kr7lXjLBqOd21YjIlvvfXcWcPEe
	 S/suwPyeP8YVX1s06SAhvYM8FO1nSg+zU/yWuAr/PZo5gNkpjE4yM5Oe6kvNcS8FDBUNS
	 da+ErAhtoREnvzohhbM1h+5uXGTW8M39ylb6HLOnZ3nhJv2Ojx3FepDkkpja21jD4U/2F
	 i1FIc4ezXEylaRfnoT0s2hs3ag8bj9IvSqdzyhQxF8SJPwu/49Q3bdTCAhfmhVfvsug==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A43FB1F000C1;
	Sun,  1 Nov 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548046;
	bh=C+MO5fqeCy6bspcZMliDx99Z/Z7cSPsK5yc8kHfzioo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=E+St66qAxAgA9dLw8C1ueg2mCbVNc3Arv+pURGdE5iRyG+FkCqdz7AxJ0F7uiIR0N
	 m7hji/4z2X/UV3g2wpP3WVWFlVPrEtwrtS5W4Fvxn1FEGwK1D84muGQGaVnUg/6Kgs
	 KvwNWT5pAprOenHYPH/vODQWq9mmjLm64Zn7Nol4myNyBELbUd0QPxiLOs17VWd9hp
	 mVL3n/WFkXeoc8kWLbVzbfYCkGHS80J/mWCmnCpzYpqgOVkKLfGZ9C7O7Yz8nyJUxz
	 tRA47pJ8bUKxpYT02RJ8BTgJrOphwTLe9kgjUwB00LKwWYPu21dpr4rvtlBFg5yw4n
	 Ek1PyTk1gjbxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 02B2E461DE;
	Sun,  1 Nov 2026 15:47:25 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Subject: [PATCH v2 0/2] rust: str: parse_int: match kstrtol() sign and
 newline handling
Date: Sun, 01 Nov 2026 16:47:24 +0100
Message-Id: <20261101-b4-parse-int-sign-v2-0-0fd827f52070@younes.io>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NOw6DMBBEr4K2zkb4Iz6pco+IAsgaNoUdeQEFI
 e4eQ/qUbzTzZgOhyCRwyzaItLBw8An0JYN+bP1AyM/EoHNdqFyX2Fl8t1FS7icUHjyagqq6dr1
 11kDavSM5/pzOR/NjmbsX9dMhOhojyxTiep4u6uj98y8KcyydqQqjqtZ25X0Nsye5coBm3/cvF
 QKHmcQAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793548044; l=2170;
 i=git@younes.io; s=20261027; h=from:subject:message-id;
 bh=ys/TnaZbk7H1Cr9SJ1S3UJJkeWMCmYGXLwebus8t+JM=;
 b=06K7h/lziGWLWlVqPdov9yIDteIVKR08TBcJ93dS4TKJNnxWzJTR0W67Bj964inP/TM3ayYSO
 XF0rfNt05AdAXOcEMRjXNhAzBebY9B+MEY2ZczoSdGHlFzYLgnt1PYT
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

    input     kstrtol()     i32::from_str()
    "0x-5"    -EINVAL       Ok(-5)
    "0x+5"    -EINVAL       Ok(5)
    "-+5"     -EINVAL       Ok(-5)
    "+0x5"    5             Err(EINVAL)
    "5\n"     5             Err(EINVAL)

Patch 1 accepts a sign only before the radix prefix. Patch 2 accepts a
single trailing newline, as `kstrtol()` does. The `0o` and `0b`
prefixes are Rust extensions and are left as they are.

Nothing in-tree depends on the old behaviour except the `rust_minimal`
sample, so this is meant for rust-next. The `Fixes:` tags record where
the behaviour comes from; I am not asking for a stable backport.

Tested on UML with the Rust KUnit suite, plus a temporary KUnit test
(not part of this series) that compares `i32::from_str()` with
`kstrtoint()`, a thin wrapper around `kstrtoll()`, on 13 inputs; all of
them agree. Also booted the `rust_minimal` sample: `test_parameter=0x-5`
is now rejected and `test_parameter=+0x5` gives 5.

Signed-off-by: Younes Akhouayri <git@younes.io>
---
Changes in v2:
- Add a doctest for "-0x+5" to patch 1 (Miguel).
- Refer to kstrtol() instead of kstrtoint() in the commit messages and
  the cover letter (Miguel).
- Say in the strip_radix() doc comment which from_str_radix() is meant
  and why a sign is rejected there (Miguel).
- Note the rust-next target and that no stable backport is requested.
- Link to v1: https://patch.msgid.link/20261027-b4-parse-int-sign-v1-0-7f386318a4b7@younes.io

---
Younes Akhouayri (2):
      rust: str: parse_int: only accept a sign before the radix prefix
      rust: str: parse_int: accept a trailing newline like kstrtol()

 rust/kernel/str/parse_int.rs | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)
---
base-commit: 7d109178cd644268326cd31702ed46c7ac8bb300
change-id: 20261027-b4-parse-int-sign-36e899fc4f43

Best regards,
--  
Younes Akhouayri <git@younes.io>


