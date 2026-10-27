Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793103005;
	b=mCT5FLFbRHgLT5ByOG8H/ZQMsYBgATZ3kBWPDDXAC8RszTG34U/6isU51jUWV5G4u1Z7
	 AnZ2UV5h5TqK5r01aB61DKUEXZKZRr5fbW1I9gS2kXwLll+/igSn7DmtWIKwxAigOut3c
	 e+zfrmQboNtAoKOGkmqTX0sBH0TKybsuL68nIi0g1WiCewHdGcA8lv87hjPdXK1uSKi6+
	 X0w9I+YNbwYBK7IhoWQOhcV2kcr/MYjEPdCybk2QqQe+Ybw0z9lPpxXsr8CtmajvVK3Ej
	 Jif68NYEabv+c2ykME/7lbBbTquvq9f8tY8AK58J+sC+y8fqeBhCeIYiu8JkQas/tmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103005;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yYOtM4BuIpTWTRwQ03uCapSzz1aSA0caW59ytvuj3Q8=;
	b=G4/oebIeY99Y3O7f5FLlr0lrbO+QMhwkkGSZBw/E/HJxenrIirWsLSYmySJ9ZAkXSIE9
	 J+Tftb4Z5LZIBguWZK5TixjIR9AgatcLWzjTslQXnAYQlAiH8y8S/E4GOm78W+oTMFEPS
	 PwrHXJO8KznNOGrIsd4ZgzyBQ7ArN/la2oX/HvsCyslQ+wU7lG1Nlt1d0GVZrja1HwdWF
	 2OyK6T2QS5Zmjzf01Rb30LkLmL4Gav0IY5E9rKsIbyMh80H/W9yp901pxNqJdbk/6WkbK
	 B4fPdlX5twHWwxBABfG5hMb9m4fQ4Qlk4OdxNAVPeTwUz8tLjL4xfFNJHrSxVapZNoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmK9hhVE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D8606A333;
	Tue, 27 Oct 2026 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmK9hhVE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793103004;
	b=DKHn1y+2DoJ8ioqNcnlnBjzhGjdPnLF8KuiMLmTn3fVCpoVmBuRo/Q/ozSjfKySpkq98
	 2BQdo2BhiQq+YZTUqG+weNqlyPulKg1pXcrr71769uGGnUQKkqx8Ln2A53G1rKeWbqoeC
	 inSsMKB9+jKoyQQLQw/HhLnGXm0QnS6YxFRl2dTjjgw2dm8lImxIseMCHfvVpnlYp/CoA
	 +MNidSx0YyqZiU+fwbqCK2Tr1pMp35GAyAMC6SRuKzZWTtt/KBL1fezKxBK1vY/Z5WyhH
	 X/nCD1AbOfti7YxwirBaIBKLev+W00wPAhoo9prGm2zwL8PDzic3XcIwEetS1Hp77wg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793103004;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yYOtM4BuIpTWTRwQ03uCapSzz1aSA0caW59ytvuj3Q8=;
	b=gbC9qFSV3CSiR6aHlJ8dbQXjmFUEns6W0+6pT7EzARfEl2NeQmfgScdljksDzIGxMv8P
	 xNIXAJC6mr/SPu4qqqg8Q44PoLdVtbGumru9JOtzL+KCqUUlt8gszeJ0G67fjq16wEjZR
	 ePPHX7agjSgsNoOqh+mwvyYUoqHgIiSfSY74kGGbj1f3s0IZAl71vmPgbt9T9/oRmjPBL
	 r1Kuc5FyQmnMUIfG2OHI8Hp4KIIOsvREcCkjixBje8rJ5XYZz+ZZpgCbBcQMTXdy0Y96u
	 QK+Fkpo1WJ1x8ClinqjgZX6SHVL+kGcrGfKs0CQqtmKLoNW91FqRcnYempQKNvWW/AA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA0511F031E3;
	Tue, 27 Oct 2026 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793103004;
	bh=yYOtM4BuIpTWTRwQ03uCapSzz1aSA0caW59ytvuj3Q8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nmK9hhVElg07pmr2dBYNsCje5Mj0ts8wsdhrAw9NXdqeNgGuHU0bcwMQ+RQXhFcBQ
	 vdPwUcjlt/fChAvWLOyh8j/nMx90zI08R6nSWU45qUwL+AGjs4CyuYABidtrjoeISh
	 v/dVdW0IhqKhVInu7gQTQZ+hPEZtXncTLWxXnROJAlapjIxE+k+NDJqLQ8Bh1c7FR+
	 QmwIoR2Y8uJX5K6eAVaBlwziEOdO9bgh9xI6wwSPhLccQyu7ZGtQjDefXZ08Gsk35g
	 LTUOVlrKqOB19foAJIFdWLgDcUgwJ0voA7jtwtW/mN+DdhQvst6dbjxMFcPqGafteo
	 ACS+IwnFHfkiA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 23B3D450CF;
	Tue, 27 Oct 2026 12:10:03 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Tue, 27 Oct 2026 13:10:04 +0100
Subject: [PATCH 2/2] rust: str: parse_int: accept a trailing newline like
 kstrtol()
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
Message-Id: <20261027-b4-parse-int-sign-v1-2-7f386318a4b7@younes.io>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793103002; l=2519;
 i=git@younes.io; s=20261027; h=from:subject:message-id;
 bh=NMDljLHIBCr2SpOAfotlmJ6JzudvatDgarIHJ0F0q5Y=;
 b=NsX5K2E5gXlHF/QnhEjEST4ehx1nHzafURb/JCD+VMl/i63Qu3CsUzpQc0rNxSVoDpKCYRVbA
 sMRZsNMOTnKAw2lEZp1WTMCHE/eozMyDo1wb/6gPJjVovxrFiJn7mta
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

    kstrtoint("5\n", 0, &v) == 0, v == 5
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
index 07e1fbd7be8f..ada355306fc5 100644
--- a/rust/kernel/str/parse_int.rs
+++ b/rust/kernel/str/parse_int.rs
@@ -54,8 +54,8 @@ fn strip_radix(src: &BStr) -> Result<(u32, &BStr)> {
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
@@ -88,11 +88,15 @@ fn strip_radix(src: &BStr) -> Result<(u32, &BStr)> {
 /// assert!(i32::from_str(b_str!("0x-5")).is_err());
 /// assert!(i32::from_str(b_str!("0x+5")).is_err());
 /// assert!(i32::from_str(b_str!("-+5")).is_err());
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


