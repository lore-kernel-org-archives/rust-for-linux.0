Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8152495503;
	Thu, 13 Aug 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639261; cv=none; b=PTA0OSlUfLetTvAanxumLPJaCcT1DetibhJn4GdQ6Ao98Le73CPzvyqqgq3Ip0e35ktTt7BrcIKsQjpjRfX5TM1ANnwV74hWPGUvRcMfhbaWFgk8VhI/zg7Imm6dbnUJ7eNXxnicohyT7GKiRNLB0/LekDuwdTGBiOhQpP3XukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639261; c=relaxed/simple;
	bh=XFXixH2sQgNKNHjoHGlTKu+JyVA8pi5huIkCjFsZyqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IW6zKQPJDmI+q57Zsu3n8Jp/6IBjCfC8lcR+hf80KlmLbo2d5mYjcDOEdQu5UZzhCXN4ciZ8WSYualm33XyO+xYY3aERYOEVP7UAmEXChCjkjgyEuNcOtLUbcv6oa1PD8JfXgfDDlII3PN29jGBV1ex9YMyRrq1TFumlijaucEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWshTgZu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWshTgZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327FC1F000E9;
	Thu, 13 Aug 2026 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786639255;
	bh=c62sdzJQh8GbyFI1/3l/hzxO3Z6Q3IYmv5WF2R9M8dA=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=PWshTgZuHwyu1RqXDbXuyCoAktkCCZuWmuFbnuKqCUD3l09YMrYyOHfByMosL0Y98
	 A40vgFAWj52GbbJfYyWDc8JeI68ZzAFf8Fz5mxCI/R/GxYsGTnVvtMsfAZsnZdfFyJ
	 /B8vRAMevS0XlBN0c4Dw4MJUhx2yQzv5uME3cRBXqhDCHGImvKs9Y7Dii8zlEfJOfi
	 jqje+M4+PTPZGPJWDGF0lyp6KZIuIkmRCrddSbGvRy2bap6pszo8J4/7zf4fLdCOm2
	 3OX2IvG2iPPVLR200SiS56sTcWQdR7aYHdNABiKBGH2R8+PV564OHkMN0pQhJCMRuC
	 yySoKCECxuWAQ==
From: Gary Guo <gary@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-next@vger.kernel.org,
	Alvin Sun <alvin.sun@linux.dev>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH -next] rust_binder: use `LocalModule` for `THIS_MODULE`
Date: Thu, 13 Aug 2026 17:39:50 +0100
Message-ID: <20260813163951.1102583-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Replace the `THIS_MODULE` static reference in the binder netlink code with
`this_module::<LocalModule>()`, consistent with the move of `THIS_MODULE`
into the `ModuleMetadata` trait.

Cc: Alvin Sun <alvin.sun@linux.dev>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
This is to resolve the semantic conflict between rust-next and
char-misc-next.
---
 drivers/android/binder/netlink.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder/netlink.rs b/drivers/android/binder/netlink.rs
index beb7ea2edaff..f34e1009432c 100644
--- a/drivers/android/binder/netlink.rs
+++ b/drivers/android/binder/netlink.rs
@@ -13,7 +13,7 @@
 };
 
 pub static BINDER_NL_FAMILY: Family = Family::const_new(
-    &crate::THIS_MODULE,
+    kernel::module::this_module::<crate::LocalModule>(),
     kernel::uapi::BINDER_FAMILY_NAME,
     kernel::uapi::BINDER_FAMILY_VERSION,
     &BINDER_NL_FAMILY_MCGRPS,

base-commit: 2697ef8943c9985c14708a6429e21812693857b2
-- 
2.54.0

