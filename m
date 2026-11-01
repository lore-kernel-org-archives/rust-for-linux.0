Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548047;
	b=hgfmQfrb/6/IFZ5ng/m+DdskoftscE8RuvCqlXAeGyurppNRrQH6PInhnBZ2FMbl2WFS
	 mIBzi/NkwpmW/KjG0mrXiRrJaFJQ7CLvgw0md6t/KjkQ3p4ayob6g9RAIur4/coDM2SoL
	 xx0Esv1u1O5/d/rUicTgP7QywzQEaswLsezH8GRKFdum3rqOnJ2wX3GsZFMiEal+4g1RV
	 KzdAP/0np0A4qBihqa+jP5zajSB/dVwOXOKVjayaYgOFmr+g5Midosh1CsYB5JIKAAVyI
	 syqrCpAAOtWA5wUX6DA184AfRD9oCWVx8G3J867yXWRFh+isYW4fZtaPgrQvJNuNeOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548047;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mpjdYnTHxH/nbdf2Vk4AbwQAMZLWaQdbJltgY6MJR3Q=;
	b=SdUaHSNjFvdSulIRcm50DMQkh014BNZeXz5jXfmahm7K2yrjK9SmagDl8e2IzrERZ/RK
	 IkpSgliW8lfMmj3XruaSQu2/zUz4La64jCLuzm0N9pkhJaNOAKSSNmWMBrrXNd1QB96qi
	 RpAqmNwS06TSCcE7JcgsjJ8XJAhYtlomzGHuAqXKLr5VQO4AnJiJjf6gnQiVZdr3nUs96
	 CyljOd4n5+joB5Qxah4kac9uC59C2Y8gJ+6fHeRqOSaRKRsQVHsF8e4T35iwx29tguOi1
	 O+wtkgRiuzJCsHqpbmTV0h7/jtnk1Mco7EaQyj5RyrsSlXsfm8uxAlWM0bQxeNmvZ/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mneqkfEb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DCE606A327;
	Sun,  1 Nov 2026 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mneqkfEb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793548046;
	b=Wwyw9TIkT8ASO2MlDlaP5V1KjUoj3ZqL8W1xwBGxeJhkjZGxzR3uypvFG7KnjOfFrTfx
	 Ck1bSZEyNqHgQgOFpA79ZWC9dh0GWZTWpF5wnurf6LkC+k3gaXJPb2wJ47l5VlC3tVHa+
	 adRrIFgGU1aAUq3W10edrnUUB2cBipDsKvolWT/HlIUHIkeTo9FNhVFPrCGcRtL4cghoH
	 ZVZnWPjC6jQFMavcxTHnzefXP05yQEuJVb1dADolcNcyFw8OyLOy4lQ0ltSevA3B4b3k5
	 dAcbNZUKpiUym7IzJzumpbri7eTvgKTsCwg0QDyUsEa6pXj8UJ4gRj/u3E8wmEgaQmg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793548046;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mpjdYnTHxH/nbdf2Vk4AbwQAMZLWaQdbJltgY6MJR3Q=;
	b=q+nSka6uLhF9qBqthYPuoWCcCJQKLLb/kO8cef23aLHQS66bFIv9uUCtwfKaT2VhN+cm
	 sYGeNcBa95agyo2g3waWp36UKXwLXRHi7Dnp600ooglmpjbkGdkJrQv+IX6UrSzjWmCvD
	 MxDdt40WEOiA6+kHRJqQiC570g5bP4O+7d1b4B5knISsT4bKpbdK1zQ/cK+vdlMBsxjUg
	 FBcbx/QOhwGw1VBylhH7J+cqrS9Q09OPDQ2weFkNtjCzSdYxKwF4k5NAnEtpbUeuC2WPX
	 Csw7xyxMmdXkzOgEsjq9hdsteUFIBknGNdn13Q3qug1h6B02AGOZzek4+ivk0P+Cnzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A45781F0093A;
	Sun,  1 Nov 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548046;
	bh=mpjdYnTHxH/nbdf2Vk4AbwQAMZLWaQdbJltgY6MJR3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mneqkfEbQ4uk1fIJdyQfHXGAex0JIjqDha1nNSq/QWJpEbEeBBREVhCCgZ3o12LMv
	 nLJD9smh7924QHdAdXGFw5pheIdsh99Mxqx6TXrLdVQWd5DFA8Tcc8eqe6NPTQ2htQ
	 Y+V4o03qxLP5rVrtkRvv1Y6KrtvGTjrNjU6tbv+aNxCNh/csehJb0/sIfk3xBRlo2l
	 OcNFHR29J4hjNRWebzb6kTufptbEniOU3k01M7ifDpFz8XPsMUE5nYdOE9QxlFsOmT
	 3+ZPjFwCR9tNOnFwsGS1LXgloq0DCxBPn4yORSC2MvPWMyswPGUk/4mclbAlBmrKIa
	 VhJxyOA0244aA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 147B0461D6;
	Sun,  1 Nov 2026 15:47:25 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Sun, 01 Nov 2026 16:47:25 +0100
Subject: [PATCH v2 1/2] rust: str: parse_int: only accept a sign before the
 radix prefix
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
Message-Id: <20261101-b4-parse-int-sign-v2-1-0fd827f52070@younes.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793548044; l=4337;
 i=git@younes.io; s=20261027; h=from:subject:message-id;
 bh=D+H9FI9ogCTq+jwzCZO0KaYdhnIJsuMSbe0CnAgFU7I=;
 b=HjtJgBFDWRWgjnt/fR07zn0bCCT2DVNgadPEMGVBR7mmnpkoUPReCXsOal6rV/6eEhNsGUJbg
 Mb0aGsEshVgAA66pqjAJ8w0XAy+6sPy2cndKHvzZSXzKbtuZzU3D19x
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=TavwxGPDBjl4XGNQyFLKEW7PKSY4qOWusc7yf6hjV0c=
X-Endpoint-Received: by B4 Relay for git@younes.io/20261027 with
 auth_id=1332
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io
Content-Transfer-Encoding: 7bit

From: Younes Akhouayri <git@younes.io>

`ParseInt::from_str()` strips an optional `-` and a radix prefix, then
hands the remaining digits to `from_str_radix()` from `core`. That
function accepts a leading `+`, and also `-` for signed types, so a
sign placed after the prefix, or a second sign, is parsed too:

    i32::from_str("0x-5")  == Ok(-5)
    i32::from_str("0x+5")  == Ok(5)
    i32::from_str("-+5")   == Ok(-5)
    i32::from_str("-0x+5") == Ok(-5)

`kstrtol()` rejects all of these with -EINVAL. On the other hand,
`kstrtol()` accepts "+0x5" as 5, but `from_str()` rejects it, because
it does not strip a leading `+` before looking for the prefix. Since
the documentation says that any string parsed by `kstrtol()` is also
parsed by `from_str()`, this is a bug.

Integer module parameters are parsed with `from_str()`, so this is
visible from the kernel command line. Booting with
`rust_minimal.test_parameter=0x-5` makes the `rust_minimal` sample
print `test_parameter: -5`.

Fix it by accepting a single `+` or `-` before the radix prefix only,
and by making `strip_radix()` reject digits that start with a sign.
Add doctests for these cases.

Fixes: 51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions")
Signed-off-by: Younes Akhouayri <git@younes.io>
---
 rust/kernel/str/parse_int.rs | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/str/parse_int.rs b/rust/kernel/str/parse_int.rs
index 48eb4c202984..66f590251ffc 100644
--- a/rust/kernel/str/parse_int.rs
+++ b/rust/kernel/str/parse_int.rs
@@ -28,8 +28,13 @@ pub trait FromStrRadix: Sized {
 
 /// Extract the radix from an integer literal optionally prefixed with
 /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
-fn strip_radix(src: &BStr) -> (u32, &BStr) {
-    match src.deref() {
+///
+/// Returns [`EINVAL`] if the remaining digits start with a sign. The
+/// caller passes them to the `from_str_radix()` functions of the
+/// primitive integer types in `core`, which accept a leading `+` or `-`
+/// of their own, so a sign here would make `0x-5` or `-+5` parse.
+fn strip_radix(src: &BStr) -> Result<(u32, &BStr)> {
+    let (radix, digits) = match src.deref() {
         [b'0', b'x' | b'X', rest @ ..] => (16, rest.as_ref()),
         [b'0', b'o' | b'O', rest @ ..] => (8, rest.as_ref()),
         [b'0', b'b' | b'B', rest @ ..] => (2, rest.as_ref()),
@@ -38,6 +43,11 @@ fn strip_radix(src: &BStr) -> (u32, &BStr) {
         // not be able to parse `0`.
         [b'0', ..] => (8, src),
         _ => (10, src),
+    };
+
+    match digits.deref() {
+        [b'+' | b'-', ..] => Err(EINVAL),
+        _ => Ok((radix, digits)),
     }
 }
 
@@ -75,13 +85,19 @@ fn strip_radix(src: &BStr) -> (u32, &BStr) {
 /// assert!(i8::from_str(b_str!("-129")).is_err());
 /// assert_eq!(Ok(255u8), u8::from_str(b_str!("255")));
 /// assert!(u8::from_str(b_str!("256")).is_err());
+///
+/// assert_eq!(Ok(0x5i32), i32::from_str(b_str!("+0x5")));
+/// assert!(i32::from_str(b_str!("0x-5")).is_err());
+/// assert!(i32::from_str(b_str!("0x+5")).is_err());
+/// assert!(i32::from_str(b_str!("-+5")).is_err());
+/// assert!(i32::from_str(b_str!("-0x+5")).is_err());
 /// ```
 pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
     /// Parse a string according to the description in [`Self`].
     fn from_str(src: &BStr) -> Result<Self> {
         match src.deref() {
             [b'-', rest @ ..] => {
-                let (radix, digits) = strip_radix(rest.as_ref());
+                let (radix, digits) = strip_radix(rest.as_ref())?;
                 // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
                 // So if we want to parse negative numbers as positive and
                 // later multiply by -1, we have to parse into a larger
@@ -94,8 +110,8 @@ fn from_str(src: &BStr) -> Result<Self> {
                         .map_err(|_| EINVAL)?;
                 Self::from_u64_negated(val)
             }
-            _ => {
-                let (radix, digits) = strip_radix(src);
+            [b'+', rest @ ..] | rest => {
+                let (radix, digits) = strip_radix(rest.as_ref())?;
                 Self::from_str_radix(digits, radix).map_err(|_| EINVAL)
             }
         }

-- 
2.56.0


