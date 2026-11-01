Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548047;
	b=i2r+rkZAafwSz6eiNOtCGXbGTVK9fIPd5dbyqp94ricy7+DtIiFG3qn84oRUgVztfJ+f
	 KyZFBmOlWavJn/UAvloy61wGTwem82/ia9JGhr+/gLu1VYYKyHUGTsbEtAPlZQA/ip45h
	 IlQyc4S1cc+tHpxw6WGtjldv0HlTf2lVc8Ffn6/GPn1ZwteHH3Ahu0lUaM5mAmlatWYm+
	 NpUFjnD1tQ2ZT8DDUc/yKnZ7SZ/EKfD/SSfg3I3v5XHpghA4AYkDokpyiudQDNoNGvLJe
	 nnAd5wQRDhRRBnf6MLFrABJAEzZxaenOpfdcozAwy3piM7ZNuOqHLdLeYTTWZn5Y8RA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548047;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9QABjkMJ3O/5a2PpmlQ85Jb7mwt60E8ZqBMhhs8NGaM=;
	b=x6fxURhVEXMOtEnmBbQvHjFePQ2/oAtr2BsZSmVuXVRggE524h7jFdR0FCqZ7eOOavtS
	 ytrhNKQHqcPAByL4CjNTiJT1F1ndzv0KKSA/lggArjGLz+FQdxi9DyaQnBhDMzIHHk+J7
	 SZ/VFnn4KHQN7CZBC+noVdN4TiCTkxE90EqmBF2zkcLnevXkTLpphbg8rV4HovXEl31UI
	 pFQ6gtInYQfWoRAuTUhdZbYHxjLitwnXhKbf6oDsRaZudr56B7mym4cmFQKLHPvysRVFi
	 MvPUtePRaiDBcVGsKCMtreHCSnSoneUusH1BmryV6E6LexbTt5IAqgRf17lUFLgt3Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZSfdaz+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CFD606A326;
	Sun,  1 Nov 2026 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZSfdaz+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793548046;
	b=SDqPm5dYlYvj5MHWegBqtfRrX3XuiU41TQj+BCz31/xOUsXbDb2ftrmyefFp/GYKTUnd
	 LA9SlR1pj7+k5k/lfSCQ2K0x2jGovhXTh9WgvhK9q57O4t8mXj21Glwdq4frCu+8NI5bd
	 UI/lsQcHmY7u/PJdYsQas3NqMQLKcM6uY0nfpNtzs+1cZOSvySBqLgh8l0YLk+8UtxMtm
	 cxG+liXh//GVT+z09oqPMePVPd57QobI79aiGU1eoF2JTPeHDynNdEsLFeHI5tODe6Sf2
	 LiyVOFLDpNEzV0+4LxM14gZeiqFGU2WmRa7WvQnoSLhOhF36hVmOG46QMN6cfnbzVZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793548046;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9QABjkMJ3O/5a2PpmlQ85Jb7mwt60E8ZqBMhhs8NGaM=;
	b=CIk0LYh9AtcBc5Cf9khKdhYt97It9C7vXRmrvSlvu4OBvRHdV6g1y5JKvySx7W+WToOH
	 jZiF6vJyF3M0n7CP/tOmqU1rtLMI28nS5hkWCOnWi+ORRArCm2He23bKrbl8TasZBM19S
	 H4fkaA9HEjaiyG6gcE5fKJlAyP672gxvI1Ybn/4Y2/YqXq5uyD1Qn4kFRHp+ktXbZdlpv
	 7m1jJoGVxF/NbisN/kQ7pCeYXdGy0sDJh0T0F9cB+lTE6D6oZBr0wje6uT800IvJ89pnt
	 AJNWtmazmC10MeFoKELo8nDJKVb0uKP0n70TCs7orgweZyf0w/rAGEbqqjeCE/8f87g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A44811F00919;
	Sun,  1 Nov 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548046;
	bh=9QABjkMJ3O/5a2PpmlQ85Jb7mwt60E8ZqBMhhs8NGaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OZSfdaz+lt42TYzs+prbm/6HU+eoV0pBOr/rrMfAV6T/16P3wHPGi4Yvqxs4vPcs9
	 anxQgVTduqagQQRvEHLNZwPGa0TWYZOxPKJB35gH4i/bZc9kG0AnQh09t1b0zlGZ1l
	 Xf/32ETx3BkXEIOkgGL7VFxIVRVOn7F/6yir1e12ImuemmJHUM8512WBBLuvqvWWkI
	 BJDujsps0Igm3lc7okDRv29f4Y23xWRA6CMYAea2UkLU7P4n/WeJsydxxiK5H0NVpi
	 Dph1b0Aik1JgD7O1zlA+GHJGoP3yOZvQyWjBGb1vegTH0BTp9sqsz3sr78FxKmbkBL
	 7w8vHlLjQ1C7Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2049A461E2;
	Sun,  1 Nov 2026 15:47:25 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Sun, 01 Nov 2026 16:47:26 +0100
Subject: [PATCH v2 2/2] rust: str: parse_int: accept a trailing newline
 like kstrtol()
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
Message-Id: <20261101-b4-parse-int-sign-v2-2-0fd827f52070@younes.io>
References: <20261101-b4-parse-int-sign-v2-0-0fd827f52070@younes.io>
In-Reply-To: <20261101-b4-parse-int-sign-v2-0-0fd827f52070@younes.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793548044; l=2520;
 i=git@younes.io; s=20261027; h=from:subject:message-id;
 bh=2XAMHgQke384/ZeGsO0Ek8ydrF0x8h0HbMzNATiMv70=;
 b=/JzwAtCUZYRO37zUxBiYebEVCS7f7iTMMUXgrDVwVyKuPYZ1d1BdokO8avHBEk+bmKTgpK1Kx
 KxUPayNyhSnB02Svvm5n85yMpf7TXY0eKTr1jpT1YJ/hZ8xwJHxz55K
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=TavwxGPDBjl4XGNQyFLKEW7PKSY4qOWusc7yf6hjV0c=
X-Endpoint-Received: by B4 Relay for git@younes.io/20261027 with
 auth_id=1332
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io
Content-Transfer-Encoding: 7bit

From: Younes Akhouayri <git@younes.io>

The documentation of `ParseInt` says that any string parsed by
`kstrtol()` or `kstrtoul()` is also parsed by `from_str()`. However,
those functions accept a single trailing newline, and `from_str()` does
not:

    kstrtol("5\n", 0, &v)   == 0, v == 5
    i32::from_str("5\n")    == Err(EINVAL)

A trailing newline is common when the string comes from user space, for
example when a value is written to a sysfs file with `echo`.

Fix it by removing a single trailing newline before parsing, and add
doctests for it.

Fixes: 51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions")
Signed-off-by: Younes Akhouayri <git@younes.io>
---
 rust/kernel/str/parse_int.rs | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/str/parse_int.rs b/rust/kernel/str/parse_int.rs
index 66f590251ffc..5b13925c328e 100644
--- a/rust/kernel/str/parse_int.rs
+++ b/rust/kernel/str/parse_int.rs
@@ -56,8 +56,8 @@ fn strip_radix(src: &BStr) -> Result<(u32, &BStr)> {
 /// Strings beginning with `0x`, `0o`, or `0b` are parsed as hex, octal, or
 /// binary respectively. Strings beginning with `0` otherwise are parsed as
 /// octal. Anything else is parsed as decimal. A leading `+` or `-` is also
-/// permitted. Any string parsed by [`kstrtol()`] or [`kstrtoul()`] will be
-/// successfully parsed.
+/// permitted, as is a single trailing newline. Any string parsed by
+/// [`kstrtol()`] or [`kstrtoul()`] will be successfully parsed.
 ///
 /// [`kstrtol()`]: https://docs.kernel.org/core-api/kernel-api.html#c.kstrtol
 /// [`kstrtoul()`]: https://docs.kernel.org/core-api/kernel-api.html#c.kstrtoul
@@ -91,11 +91,15 @@ fn strip_radix(src: &BStr) -> Result<(u32, &BStr)> {
 /// assert!(i32::from_str(b_str!("0x+5")).is_err());
 /// assert!(i32::from_str(b_str!("-+5")).is_err());
 /// assert!(i32::from_str(b_str!("-0x+5")).is_err());
+///
+/// assert_eq!(Ok(5u8), u8::from_str(b_str!("5\n")));
+/// assert!(u8::from_str(b_str!("5\n\n")).is_err());
 /// ```
 pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
     /// Parse a string according to the description in [`Self`].
     fn from_str(src: &BStr) -> Result<Self> {
-        match src.deref() {
+        let src = src.strip_suffix(b"\n").unwrap_or(src);
+        match src {
             [b'-', rest @ ..] => {
                 let (radix, digits) = strip_radix(rest.as_ref())?;
                 // 2's complement values range from -2^(b-1) to 2^(b-1)-1.

-- 
2.56.0


