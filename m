Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82A7C
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Jul 2023 09:09:50 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6026549EC
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Jul 2023 02:09:40 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1690621777; x=1690880977;
	bh=uCozY+Pcnawd0I1oW4pKqllFOri6l5nBR5qs/jiAoEo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lKDPxnyFMYP6lsDUaojZFrgdIpXQuFcXehhvbFGFwtYfMVJJdCfW5fjrEI5WujI0f
	 nWcuxjcz/5W2zriu2QFzV9LNl6aFYV+VGS2Kyu5UYjZ/r7myg3R69jwdzH8wTFSL3/
	 5fcT5TAOiTzMpDobLg6KARjQhq2qOwiVuQ6u7jxTH5AzNIojixXcrQ/1rJSYgY1nf3
	 5ofLheTX0lz8SKwNMg4RUlc4vSx5LA1a0xZSgJ4cPdX0KRe7HFo2iZR3usR3ekeVnr
	 +ztylJks1+CpoQFuiAAa7fnnQ0A0bZuFdmagIM5FTjPCvHlTjbJIq58ECc9rY0WUfS
	 DYWrqz2d2kfcA==
To: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] rust: init: make `#[pin_data]` compatible with conditional compilation of fields
Message-ID: <20230729090838.225225-3-benno.lossin@proton.me>
In-Reply-To: <20230729090838.225225-1-benno.lossin@proton.me>
References: <20230729090838.225225-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This patch allows one to write
```
#[pin_data]
pub struct Foo {
    #[cfg(CONFIG_BAR)]
    a: Bar,
    #[cfg(not(CONFIG_BAR))]
    a: Baz,
}
```
Before, this would result in a compile error, because `#[pin_data]`
would generate two functions named `a` for both fields unconditionally.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/kernel/init/macros.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/init/macros.rs b/rust/kernel/init/macros.rs
index fbaebd34f218..9182fdf99e7e 100644
--- a/rust/kernel/init/macros.rs
+++ b/rust/kernel/init/macros.rs
@@ -962,6 +962,7 @@ impl<$($impl_generics)*> $pin_data<$($ty_generics)*>
         where $($whr)*
         {
             $(
+                $(#[$($p_attr)*])*
                 $pvis unsafe fn $p_field<E>(
                     self,
                     slot: *mut $p_type,
@@ -971,6 +972,7 @@ impl<$($impl_generics)*> $pin_data<$($ty_generics)*>
                 }
             )*
             $(
+                $(#[$($attr)*])*
                 $fvis unsafe fn $field<E>(
                     self,
                     slot: *mut $type,
--=20
2.41.0


