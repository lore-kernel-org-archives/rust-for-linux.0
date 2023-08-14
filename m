Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1BFA921
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Aug 2023 08:46:46 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7299F12D;
	Mon, 14 Aug 2023 01:46:45 -0700 (PDT)
Date: Mon, 14 Aug 2023 08:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1692002803; x=1692262003;
	bh=cCm8wW9vNkKH2FZUy3jRZYJZ3dWJlVZH7ASGRvlZaKY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f6gK19pWOkyU7bTj7Kg/FMG1ckvi7PYfOhAi1ncpXLPafgl5r3cYDtO/VzAzitHFA
	 UCvdyD/gVxVDnRmgn7xGwopgP4ygYk7EBfd7NZTwxM+/AtaVkyobCrTsAvsw96nCTF
	 kAob29TUS63xuJuUbLIVGGtzq0tSOcPMvklbF/9Z0GV+3HWNbs/aFPUvP8u8/OKSEJ
	 05yGRoWkw072+33b/wg1rt8IhtxIyeszCk5nDZtFjWAmNrtrxHROIQT0T2xq+u+0N8
	 uXi/Y5ldaxdaEYRZ0egRZBQLrLIIRZ05OvckVmROJn5TMwqHPgBDK0RFiu1Ey8/CrM
	 qNK6obLjqQT8A==
To: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: [PATCH v4 02/13] rust: init: make `#[pin_data]` compatible with conditional compilation of fields
Message-ID: <20230814084602.25699-3-benno.lossin@proton.me>
In-Reply-To: <20230814084602.25699-1-benno.lossin@proton.me>
References: <20230814084602.25699-1-benno.lossin@proton.me>
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
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
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

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
v3 -> v4:
- added Reviewed-by's from Gary, Alice and Martin.

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


