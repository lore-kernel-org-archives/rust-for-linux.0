Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103005;
	b=fnxd+ES/mrhHDBryMVTue9unR0VgMXWxs34nBqvwD5/b6QfmBBcPRLq5yOTNeR6p4tJV
	 AZMJHZX4z5tYzfu4bUaxqFnUKHaIvLB8UqkrtcvkkQm8U25DLbNednhYyMr0FqNO/Zgg3
	 3CRIn21N+gI25BSBWNZzkoUjglra32xiUvVV16PuNYWqmaU7N+Fd0W+KmRZbyShi5aZ4N
	 4DOpUzf9ZBDLFij6iYgolVbSa9JebGzrcj1jMzR5XWs9mCoznAbOUKNIun6FIkMqLFRYJ
	 jUj+gD6EJ/nUHvPBgmCt12gzWj591MjnokOd98YPGZzuEpnzwYLNrDYPFw4lGM2uXKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103005;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tMiwFLFDG8BJthOZhEySwJu04jCsjfEmp/bff8mveSc=;
	b=Me1me40L6L18OXpmHAyrvWiOsiHgVBQT9pXx1tWY1YDbfundO8TVEmRiokPnncGuGUci
	 7gxHC7GKuyL0DqvO46zPszLq9hBWiZVhtPPnUmk5RQDFGEcaAh37y7HZb3vZ0SdNxbdwq
	 lFCzLWnhcBNJ6n8Snf+DctRpoRel9bQ1O1wu7uR80/+ur3VL6LzGTqNEulsX0QlvT+G0C
	 eaxaNmXD2EezT2JKGDufLfju1VQzpL4BZqKGi6V/aijU/FrgoXUMCzko8GV2y1CNwYLl1
	 I2UBHKNI2NWZsARmj0vRFmVb3/904kZl2MRazSo5yiH+h+6BiaudRgLgHfILHEsblMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lQIrwwp/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0530606A31B;
	Tue, 27 Oct 2026 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQIrwwp/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793103004;
	b=qkaFn8hPxv4IfPUGQaDRryPAGD1XqEldmo700MsAS8adq5gpqO1Sdvy7Miv/4VYVF/29
	 4+yUHLWG7NpHNhJA92MRZaRHUOwpr6GbohHkkTT0IoNa/it7TjZPxR+PvNOcLCLp9Goi5
	 vesbeolbqmVjLcgglA/l86GM0robpkgZ+DufnLiwsl1ofTjtBwBXdvvXEk9KTypmXmGsv
	 eZAhyP30IfwKJyZREBe5cZB/1iZWb65etU6I68ti5lYaVFxtdZJqEyp/bvId4ioJnNaAp
	 pcuVCfwFD+gTv6Sw2Sm3enFKlzl6Bt+na1rYFX/aHmEsrl6j2HISgHO3ccMJg7tY8KA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793103004;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tMiwFLFDG8BJthOZhEySwJu04jCsjfEmp/bff8mveSc=;
	b=EQNR3PVP9etkEc4kiRiNi5zLskFxn7rjy1oE5RpYjpn7ufXMT9vnXHCaeW0LiXGtyL7O
	 B9e0p5oM1yLABD5LnVjbjPi+8v6qVezMjlW70XRHNZUzApIHy945+1RyISWwgZiV3TydB
	 CG3KFGcp7eJzEBssjSWxqyVNt5TmTjyX32uV61lJjUXdTWN10f/FvgRcROZTNU1ESc30N
	 //JHNCVtEcjCAFPvY/ZmuRGRtLbI8j3z/RsSy9k02wzswpRys5HhprSLonW0a/k7Iolpj
	 1o0IjK5D6UQpk6MzNzkbAzL2bTSJ1oDAfWkooYQjYUxfkr1Xy74gdOit87DeHxf7Jmg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7BAD1F031E0;
	Tue, 27 Oct 2026 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793103004;
	bh=tMiwFLFDG8BJthOZhEySwJu04jCsjfEmp/bff8mveSc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lQIrwwp/yn8nGiY7b2cUM0MHtXoUNdQ77nmQjeJ8wCUYLFnbENaqmHguaJzexKZtv
	 QyVVYPb4a/OkRBhP0WI+aLsEObABBl1r0A68V3Xj0wvKSi8VA6QH6egtyPn4xoEyVk
	 HotGNblPjhme6OZCU8tmHEmTpJr6M2FtbC0DYet5r6K7M2N10qf6txQmUd/UlJuKUa
	 ddvIe4n30ADPhOYHy65g9HTYIpDedij3exHGbf8VIxq9YE72QyeZGLdARJZS09jZU8
	 wsLX+jB4ZkvMTRIfS2i1IhDGexluRRKWb5gsUj/wEvV+nIcBOLOWMRIqINZibcYUZ1
	 2Fey7ku949AdA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 124FC450C8;
	Tue, 27 Oct 2026 12:10:03 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Tue, 27 Oct 2026 13:10:03 +0100
Subject: [PATCH 1/2] rust: str: parse_int: only accept a sign before the
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
Message-Id: <20261027-b4-parse-int-sign-v1-1-7f386318a4b7@younes.io>
References: <20261027-b4-parse-int-sign-v1-0-7f386318a4b7@younes.io>
In-Reply-To: <20261027-b4-parse-int-sign-v1-0-7f386318a4b7@younes.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793103002; l=4111;
 i=git@younes.io; s=20261027; h=from:subject:message-id;
 bh=ZIMsYyaNWv66eaanjb2Is4SXAQQRcP2OLUu3EkB/df0=;
 b=mlQf2QJycNef9ASMfrzkl+aJBB+Mrq+9E7pfi2AKiK/7S3w9T/+GIFZWxIdeZ8ElOkectyvvW
 JvzbqAUNjePCSeRUI2WcaXvBI4ECCo+j+JDLP3QPlju07N2lrNntnxt
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

`kstrtoint()` rejects all of these with -EINVAL. On the other hand,
`kstrtoint()` accepts "+0x5" as 5, but `from_str()` rejects it, because
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
 rust/kernel/str/parse_int.rs | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/str/parse_int.rs b/rust/kernel/str/parse_int.rs
index 48eb4c202984..07e1fbd7be8f 100644
--- a/rust/kernel/str/parse_int.rs
+++ b/rust/kernel/str/parse_int.rs
@@ -28,8 +28,11 @@ pub trait FromStrRadix: Sized {
 
 /// Extract the radix from an integer literal optionally prefixed with
 /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
-fn strip_radix(src: &BStr) -> (u32, &BStr) {
-    match src.deref() {
+///
+/// Returns [`EINVAL`] if the digits start with a sign, which
+/// `from_str_radix()` would otherwise accept.
+fn strip_radix(src: &BStr) -> Result<(u32, &BStr)> {
+    let (radix, digits) = match src.deref() {
         [b'0', b'x' | b'X', rest @ ..] => (16, rest.as_ref()),
         [b'0', b'o' | b'O', rest @ ..] => (8, rest.as_ref()),
         [b'0', b'b' | b'B', rest @ ..] => (2, rest.as_ref()),
@@ -38,6 +41,11 @@ fn strip_radix(src: &BStr) -> (u32, &BStr) {
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
 
@@ -75,13 +83,18 @@ fn strip_radix(src: &BStr) -> (u32, &BStr) {
 /// assert!(i8::from_str(b_str!("-129")).is_err());
 /// assert_eq!(Ok(255u8), u8::from_str(b_str!("255")));
 /// assert!(u8::from_str(b_str!("256")).is_err());
+///
+/// assert_eq!(Ok(0x5i32), i32::from_str(b_str!("+0x5")));
+/// assert!(i32::from_str(b_str!("0x-5")).is_err());
+/// assert!(i32::from_str(b_str!("0x+5")).is_err());
+/// assert!(i32::from_str(b_str!("-+5")).is_err());
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
@@ -94,8 +107,8 @@ fn from_str(src: &BStr) -> Result<Self> {
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


