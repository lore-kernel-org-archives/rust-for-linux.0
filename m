Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402DC364941;
	Tue,  8 Sep 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859597; cv=none; b=NDwDCHPGIRiQSFl31IxaE86RkdAqx+bL5zT4+5uCSkyZC9zJVvT6IisJyIrvs43zbcnw/Zr5IkJrSy+30YiD1gxoEerAZTse2zxeycfiXtmgbMAgXzhrorggw2rPaXvTla87MamMzDAWdKXVVMxMqhUvAAfSSPIKicb6uVpT3Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859597; c=relaxed/simple;
	bh=VjiLmslqHRgu8HZ2CO5y5jz+PaLyTiUBRd/enucIOsA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=i237Q0hcMOqFQMOR4fOXl7Ms4dwFzjjSeIfoYF8mBGAG6vkP61ijiifynHxaRCrMyQJYl/2kwfOwBGRXda7fwyi3x9lw6X20aQBfWtWMBvAVXQvaLjiYYjwuV0dUrdR8dbJ0kekA/Xxx8Wn2p9wDUzb7rlkVleWoheuPnXgqlk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kT+4XaP0; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kT+4XaP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788859591; bh=hujNJgT7pd/7Y3ctmUCIbv8Z3MhCnChCZ4w4+50/pw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kT+4XaP0F16RfpwRfxwmFUA77euhf20U83hVyYZ6oxtIZUR17GWZd5pQVJbL+x0St
	 4KYg6DTHpBi2DsnwDZrdY5TFQMA3oNWZbpF9zVGlFr721CfDeWzvzp+UX0Zo5vYowu
	 bvT8Jr9Kh55YXJjnosbNUXMxvs9pYVYKgfX4S2CI=
Received: from localhost.localdomain ([240e:342:b241:2200:5415:9e:37cf:c860])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 6999861F; Tue, 08 Sep 2026 17:26:25 +0800
X-QQ-mid: xmsmtpt1788859588ta5ji2e79
Message-ID: <tencent_DEBD9FED1CD8FC1625D8EBEFEEC3EE7A0405@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb51qwcjTsHriV4u/TQ7AGiwk/n5da6bEtiZDXiTcky+9n0H1BYCK
	 9jGNfOPI18qrDpNZ5VuUfjgdnvh1471qoncWs4+nKlwukLk23C83ZucWtEmhFWSH1CToPWwu1+QC
	 Y+qQ0hl5VpXjxuFR1jGRDClTGP4EFjYitnLO56hZV2LiiB4mzMSJPQGHgcIZFRQ+O+6kA713aIeo
	 TFuhxQHHZz4DjydrAbOoHq8RfA2HWs+q7ExjnjThpkq3Ix1D2QvS6qoEXhy8hv7CV0Fivg6HD9Zm
	 M9cpMbZhQ8+Aqz3qAb8GqtDFDj5EEletInHlgnHowar1yALhmzRVmYupau2/afXcaa1HXMZ7IQ8P
	 JhkWHXNwQNxGz8TidrfLOjAPEsMbBcnnnQv6tEr0SM9NeabU+tGP5AadxqBRqHfp9a358Qn7kfwf
	 p9aGUuWH5XUu9ZPtM9KW4zSMKV3FizUNM41Qurpu6eydboo2oSLMqOzoPsL2vfQYvZtd0Cmw5IdF
	 sJ5aHk7ziSzO7UQG87Z9d0FWVZmn+O+2GK7+0qrMDDbWlUN72tY6rUIxdwZiWFRsJZtGUzsTTtOY
	 2hgVfjfZaz7P/Nl/nZv/oVmd+awHsxBtJnpQoTHK2TZuEDMxBOR2Dxdxe6+XFIRrsPIAfKQl3DzY
	 r7KM+bCs4bz3oTmhIC3bLNL0Tf5fwQSdXHuw4PoSMrQat4nP0uwovqGj02a8Gga0u67bLLJ8GlLt
	 114jkoDaIAyW7tRXoGcQ8j+2rmpTyj+qdLuPP9tWXU1UwW0sswE4VjnP131IRGoTEexVM5EnJbzO
	 ZWzXz3pE2aHpXVpDOxHL8Qt9xuFQP1qBDCMTkI+nqFe/+pqvAi4Tp+cFu8k0WC6wn+GyQZsTC+uP
	 7n/HR19d4TtNRHVxr16fcVdUvBJYAcer7JQTaxPbbubuGnpvupTFSFP3KaDSBbWvx2nEyf5UzGYK
	 Prxzx/I+//EkXks+5FpNpkDKjW255huvJRMS/8YR/H6TT/e+A4oWbpbA+KKaB/fJFhr1GOLablpH
	 wvtZGG9nVl68jdGq8UnswP9AjAB39rCiUe8HegcnG3hj8pAM1b
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: JX <1239989762@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] rust: make unsafe_precondition_assert! const compatible
Date: Tue,  8 Sep 2026 17:26:23 +0800
X-OQ-MSGID: <20260908092624.63350-2-1239989762@qq.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908092624.63350-1-1239989762@qq.com>
References: <20260908080604.34070-1-1239989762@qq.com>
 <20260908092624.63350-1-1239989762@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The no-message form of unsafe_precondition_assert! routes the
condition through the formatting machinery. This prevents the macro from
being used in const unsafe functions.

Use a fixed diagnostic literal instead. This allows the no-message form
in const contexts without interpreting tokens from the condition as
format string syntax. Keep the custom-message form unchanged since it
intentionally supports runtime formatting.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1232
Signed-off-by: JX <1239989762@qq.com>
---
 rust/kernel/safety.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/safety.rs b/rust/kernel/safety.rs
index c1c6bd0fa2..f3c498c242 100644
--- a/rust/kernel/safety.rs
+++ b/rust/kernel/safety.rs
@@ -7,6 +7,15 @@
 /// The check is enabled at runtime if debug assertions (`CONFIG_RUST_DEBUG_ASSERTIONS`)
 /// are enabled. Otherwise, this macro is a no-op.
 ///
+/// The form without a custom message can be used in const contexts.
+///
+/// ```
+/// # use kernel::unsafe_precondition_assert;
+/// const fn check(value: usize) {
+///     unsafe_precondition_assert!({ value < 4 });
+/// }
+/// ```
+///
 /// # Examples
 ///
 /// ```no_run
@@ -40,7 +49,7 @@
 #[macro_export]
 macro_rules! unsafe_precondition_assert {
     ($cond:expr $(,)?) => {
-        $crate::unsafe_precondition_assert!(@inner $cond, ::core::stringify!($cond))
+        ::core::debug_assert!($cond, "unsafe precondition violated")
     };
 
     ($cond:expr, $($arg:tt)+) => {
-- 
2.54.0

