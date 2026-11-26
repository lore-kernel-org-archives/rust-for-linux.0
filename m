Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690303;
	b=bx86AgCgr+0Dge0j1GPwOOnfm0fZcf4rMuBe5cp2CD6AUw6OBuROCbVL3fd9pVC0nKgf
	 epQUn0GQvAOivhA/fT1NBQsTqSBZksu4uyDAeTFhUWQcbWw2NdyEt4LAiRmtvdoNH+Djs
	 fTtSOH5XaxeTsV7WzOtpX7G5svv9A1djOBquKYLr0A06AAgThE5xZ/yt5UJDOEft5sL8v
	 gDoO3uu/d6xBBhy07oaDa48sTIxCtlMHOccJTThEStwCx0EZBgmgEgFKl63AIIF29OZHj
	 QlFg8rWLFNoGxUPdggEdHQQnhh2ry6UNxrUDHQJcUW4UCpWzrXIoxXoKVY0EiatcZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690303;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5ntCcjIuevH5QG1iJizV2FIttqGUB67AJd7kEb0bdV4=;
	b=JseXVCDz6tYVqJnOEFe2NhXo4VOUpIv9txYUCLk+trZeRnIs2DYOMrXBKzJMActkG+6n
	 iZYHbH1opKwXXSLed719blNZ8lxR4tC9+Oyuy0mb+ScGaacOPtBlrIc7FE7akpvpZ6Ysg
	 A8OYte8GSetK0rRrW3YOOJo5zT2otO4Hv18irHFZ00xylvqJ44bV06hzKn2GEGX2tY/qS
	 XhhxVuaGjSN+f2n81TTl89MZX9ssATFlKMCtKhY+Au8fEyfzq2MZocZYy3MpmQpMS8YIo
	 IpP5OKczklG2d0UGvVcUUtXP5SadAevAO7U5Z9BgKCCFsxFwEA4eSDQELd1WuqD2vsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RA5CmdhA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6739606A31E;
	Thu, 26 Nov 2026 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RA5CmdhA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AA61F000D1;
	Thu, 26 Nov 2026 10:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795690302;
	bh=5ntCcjIuevH5QG1iJizV2FIttqGUB67AJd7kEb0bdV4=;
	h=From:Date:Subject:To:Cc;
	b=RA5CmdhAMT+egc98YLI0ZsR0M0/tFDHVOxP7ny5vkbAGijjYbnGs9/2+g9jKrVSMC
	 aypeHRgox5NlkHzBhUwftQbTjECcoyyoZlPAXwDcERJ77aRfFdSJucPIS3TqgsShwd
	 2NpryuZu9nu1U/66cqsR/JCeDzUuyWxnvBwdoh1nFBr8O45m5GuyOBiLqrEx2QWjql
	 M+2egwZreLzSQu/3vcwTMAhpXHIVD+VAQ0dv9+Hp3RxCGgpQzS4SSQE2H1zDS6kCiM
	 OVSZ4nKXhnjH9MtBxEcqJuA/5gvl4UtRAazl/oXuxxQOZGx0szlzjLcyY4Vnq+vl7Y
	 mD5YxO/xMAzgw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 26 Nov 2026 11:51:14 +0100
Subject: [PATCH v3] rust: time: implement `Debug` for `Delta`
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
Message-Id: <20261126-time-delta-display-v3-1-aeeecc72f3a8@kernel.org>
X-B4-Tracking: v=1; b=H4sIACEPCGsC/33NzwqCQBDH8VeRPTexM5J/OvUe0UHbWR0ylV1ZE
 vHdWz0EQXT8/mA+syjPTtirc7Iox0G8DH2M9JCoe1v1DYOY2Io0ZZrwBJM8GQx3UwVG/NhVM5h
 cE+d5URgyKh6Ojq28dvR6i92KnwY37z8CbutfLiAg1CZiGZcF1/byYNdzdxxcozYv0MdA1OlPg
 zZDY42WS2vLb2Nd1zeb+eSF+QAAAA==
X-Change-ID: 20260215-time-delta-display-d702e7788d2d
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8209; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=XjIcO1LLn/3GXFoTuFkQ2wSXF1pgayDIVIQRVPfANq8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrCA8lN8SuWPdF0REUrLLst3mj1PP9TgAunfsHV
 ISMP/pQoumJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawgPJQAKCRD6UCkIqsW9
 0AdTD/wKcI+5u8LlPsoSvIV9ttNeRBZoc2+6Jb25mhsIL7CVvymbNREQOoJWLspNvYwQ6Qtv2XY
 6hzohH1GQZXYLr3LDoPSqzGPyLJlkg9VbGH9q9EU0ESt2hzWafkb1f/zTLN3JRA6zuTOHRVo/ER
 COby8LuhuZJqYL1ivgd1g7Kr9A1H5eGoxjn79JWyBZn75oVxNRlnj4bYwyhdipy9BV5r2Mraj0v
 SN+FASgKowMpQm+lnBtfqqqTWbxDKC8GjaFiencISU6bULgP6exKYfwoPY7XYLM5N05qxsc7K3u
 t01OK77S/y9mbysBPGOvvjILU+buRDCgOS4ssoAxI4LfnCDrJ4FD8Kt0xGGqMYQS2m9ebcl49WC
 lWJCgDzsntaUIKTv1OCfHtEt+7Cqe4Yt1y8LJLqtIISxJpqRl3IJrd94akk5fXK5CbvdcDhe8WN
 t2wGo5eBBWYoDI9QtjyeS5oDifGw6nMBDzocKCHZuoJDL1yA3dxXSC8S/XxqCbC2iaY2kGoRQZ6
 AJAOUP2ZumPxELyEBM5kKjbTpfcX5+BPdGu2E6FmSPvXJkeNoNninwUsWsJROa0jdWmBXw/+iqp
 sFhYfRbUwooW9nN6HiyGssxxJIzsAssXkbTTRcCm1CAhmIM5+oEs2knWMkLCh26jOsNGq+/SW03
 qb5innV95SZorUw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement the `Debug` trait for `Delta` so that a span of time can be
printed by a formatter.

The span is printed as a count of the time unit it is stored in, suffixed
with that unit, and with each group of three digits separated by an
underscore the way Rust integer literals are written. A span of 12345
nanoseconds is printed as `12_345 ns`.

`Debug` is implemented rather than `Display`, because `Delta` has no single
obvious format and the other kernel types that carry a unit, `Hertz`,
`MicroVolt` and `MicroWatt`, implement `Debug` only. Callers that need a
specific format should use `Delta::as_nanos` and print the result
themselves.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v3:
- Implement `Debug` rather than `Display`, as `Delta` has no single
  obvious format and the other kernel types that carry a unit
  implement `Debug` only (Tomonori).
- Implement the formatting for every time unit rather than for
  nanoseconds only, via a new `TimeUnit::SUFFIX`.
- Separate each group of three digits with an underscore (Miguel).
- Separate the value and the unit with a space.
- Add KUnit tests for the formatting.
- Link to v2: https://msgid.link/20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org

Changes in v2:
- Rebased on v7.4-rc1.
- Suffix the formatted value with `ns` (Alice, Gary, Miguel).
- Write the value directly rather than via `write_fmt` and `fmt!` (Alice).
- Document the format with a rustdoc example.
- Drop the `rnull` user, which will call `Delta::as_nanos` instead (Gary).
- Link to v1: https://msgid.link/20260215-time-delta-display-v1-1-bdd2d6e98ebf@kernel.org
---
 rust/kernel/time.rs | 134 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b6a2aab12a50..8b38d4c70c87 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -309,6 +309,12 @@ pub trait TimeUnit: private::Sealed {
 
     /// The zero value of [`Self::Repr`].
     const ZERO: Self::Repr;
+
+    /// The suffix that denotes this unit when a [`Delta`] is formatted.
+    const SUFFIX: &'static str;
+
+    /// Widens `repr` to an [`i64`].
+    fn repr_to_i64(repr: Self::Repr) -> i64;
 }
 
 /// A time unit of nanoseconds.
@@ -321,6 +327,12 @@ pub enum Nsec {}
 impl TimeUnit for Nsec {
     type Repr = i64;
     const ZERO: Self::Repr = 0;
+    const SUFFIX: &'static str = "ns";
+
+    #[inline]
+    fn repr_to_i64(repr: Self::Repr) -> i64 {
+        repr
+    }
 }
 
 /// A time unit of jiffies.
@@ -333,6 +345,14 @@ pub enum Jiffy {}
 impl TimeUnit for Jiffy {
     type Repr = isize;
     const ZERO: Self::Repr = 0;
+    const SUFFIX: &'static str = "jiffies";
+
+    #[inline]
+    fn repr_to_i64(repr: Self::Repr) -> i64 {
+        // CAST: `isize` is 32 or 64 bits wide on the architectures the kernel
+        // supports, so widening to `i64` preserves the value.
+        repr as i64
+    }
 }
 
 /// A span of time.
@@ -341,7 +361,7 @@ impl TimeUnit for Jiffy {
 /// [`TimeUnit`]); its value has type `U::Repr`. `U` defaults to [`Nsec`], so a
 /// plain [`Delta`] is a span in nanoseconds. The value can be negative, zero, or
 /// positive.
-#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
+#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
 pub struct Delta<U: TimeUnit = Nsec> {
     value: U::Repr,
 }
@@ -669,10 +689,122 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
     }
 }
 
+impl<U: TimeUnit> kernel::fmt::Debug for Delta<U> {
+    /// Formats the span as a number of time units, followed by the unit.
+    ///
+    /// The value and the unit are separated by a space, and each group of three
+    /// digits is separated by an underscore, the way Rust integer literals are
+    /// written.
+    ///
+    /// ```
+    /// # use kernel::{prelude::fmt, str::CString, time::Delta};
+    /// let delta = Delta::from_micros(5);
+    /// let formatted = CString::try_from_fmt(fmt!("{delta:?}"))?;
+    /// assert_eq!(formatted.to_bytes(), b"5_000 ns");
+    ///
+    /// let negative = Delta::from_millis(-2);
+    /// let formatted = CString::try_from_fmt(fmt!("{negative:?}"))?;
+    /// assert_eq!(formatted.to_bytes(), b"-2_000_000 ns");
+    ///
+    /// let jiffies = Delta::from_jiffies(1234);
+    /// let formatted = CString::try_from_fmt(fmt!("{jiffies:?}"))?;
+    /// assert_eq!(formatted.to_bytes(), b"1_234 jiffies");
+    /// # Ok::<(), kernel::error::Error>(())
+    /// ```
+    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
+        let value = U::repr_to_i64(self.value);
+
+        if value < 0 {
+            f.write_str("-")?;
+        }
+
+        // `unsigned_abs` is used because the magnitude of `i64::MIN` is not
+        // representable as an `i64`.
+        let mut magnitude = value.unsigned_abs();
+
+        // Split the magnitude into groups of three digits, least significant
+        // group first. A `u64` holds at most 20 digits, so 7 groups suffice.
+        //
+        // Dividing by the constant keeps the compiler from emitting a check for
+        // a division by zero with a potential panic.
+        let mut groups = [0u64; 7];
+        let mut used = 0;
+
+        for group in groups.iter_mut() {
+            *group = magnitude % 1000;
+            magnitude /= 1000;
+            used += 1;
+
+            if magnitude == 0 {
+                break;
+            }
+        }
+
+        let mut groups = groups.into_iter().take(used).rev();
+
+        // The leading group holds the most significant digits of the value, so
+        // it is the only one that is not zero padded.
+        if let Some(leading) = groups.next() {
+            write!(f, "{}", leading)?;
+        }
+
+        for group in groups {
+            write!(f, "_{:03}", group)?;
+        }
+
+        write!(f, " {}", U::SUFFIX)
+    }
+}
+
 #[cfg(CONFIG_RUST_TIME_KUNIT_TEST)]
 #[macros::kunit_tests(rust_kernel_time)]
 mod tests {
     use super::*;
+    use crate::{prelude::fmt, str::CString};
+
+    /// Formats `delta` with its [`kernel::fmt::Debug`] implementation.
+    fn debug_fmt<U: TimeUnit>(delta: Delta<U>) -> Result<CString, crate::error::Error> {
+        CString::try_from_fmt(fmt!("{delta:?}"))
+    }
+
+    #[test]
+    fn delta_debug_separates_digit_groups() -> Result<(), crate::error::Error> {
+        // A value below one thousand is printed without a separator.
+        assert_eq!(debug_fmt(Delta::from_nanos(999))?.to_bytes(), b"999 ns");
+
+        // Groups that do not lead the value are zero padded.
+        assert_eq!(debug_fmt(Delta::from_nanos(1000))?.to_bytes(), b"1_000 ns");
+        assert_eq!(
+            debug_fmt(Delta::from_nanos(1_000_007))?.to_bytes(),
+            b"1_000_007 ns"
+        );
+
+        // Zero has a single group.
+        assert_eq!(debug_fmt(Delta::<Nsec>::ZERO)?.to_bytes(), b"0 ns");
+
+        // The extremes of the representation are printed in full. The magnitude
+        // of `i64::MIN` does not fit an `i64`, which makes it the interesting
+        // one.
+        assert_eq!(
+            debug_fmt(Delta::from_nanos(i64::MAX))?.to_bytes(),
+            b"9_223_372_036_854_775_807 ns"
+        );
+        assert_eq!(
+            debug_fmt(Delta::from_nanos(i64::MIN))?.to_bytes(),
+            b"-9_223_372_036_854_775_808 ns"
+        );
+
+        Ok(())
+    }
+
+    #[test]
+    fn delta_debug_uses_the_unit_suffix() -> Result<(), crate::error::Error> {
+        assert_eq!(debug_fmt(Delta::from_nanos(1))?.to_bytes(), b"1 ns");
+        assert_eq!(debug_fmt(Delta::from_jiffies(1))?.to_bytes(), b"1 jiffies");
+        assert_eq!(debug_fmt(Delta::<Jiffy>::ZERO)?.to_bytes(), b"0 jiffies");
+
+        Ok(())
+    }
 
     #[test]
     fn to_jiffies_timeout_converts() {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260215-time-delta-display-d702e7788d2d

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


