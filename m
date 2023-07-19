Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D89125AD
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 14:20:28 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614031726
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 07:20:24 -0700 (PDT)
Date: Wed, 19 Jul 2023 14:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1689776421; x=1690035621;
	bh=5SJbhv9m6kCeMleleWVbb/UYtgrGWulTiGHG+cg8WBA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kmhDij1pQxsoRyCm1+cSe+7Q+VQOSCyh9ffpcou+mSBIgZGC9goGmf41pthvwTrIS
	 rqx2BAUhQGUYlxKM/ThHc8crn7GiKVaY3Nry2seX6cXum3uH38bDEOUDsCdjuVyibK
	 MFg4fMLVSc5cg3WkLKqxMNdMiTrHV+YfY4JT8GCsEvFZokXW+iFN2vidrcTR/7e2GZ
	 ozbHJCXxc7VNKDjXApk1MTKRexz3JGxKcG6ysoJ0If6Krg5UWWi2nYRf/I/5aX1Q14
	 O/W87QFHNXQPVSEtICNhLIskDXcdP75P7by+5rNZ/XgBk+ByB6z1GPebrZkyxmcHOW
	 UhJagI3r77Olg==
To: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] Quality of life improvements for pin-init
Message-ID: <20230719141918.543938-1-benno.lossin@proton.me>
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This patch series adds several improvements to the pin-init api:
- a derive macro for the `Zeroable` trait,
- makes hygiene of fields in initializers behave like normal struct
  initializers would behave,
- prevent stackoverflow without optimizations
- add `..Zeroable::zeroed()` syntax to zero missing fields.
- support arbitrary paths in initializer macros

This is the second version of this patch series.
* v1: https://lore.kernel.org/rust-for-linux/20230624092330.157338-1-benno.=
lossin@proton.me/

Changes not present on modified commits:
v1 -> v2:
- implement `Zeroable` for `Opaque`,
- remove blanket impl of `PinInit` for `Init` and make it a supertrait
  instead,
- add `{pin_}chain` functions to execute code after initialization,
- update the example macro expansion

Benno Lossin (12):
  rust: init: consolidate init macros
  rust: add derive macro for `Zeroable`
  rust: init: make guards in the init macros hygienic
  rust: init: wrap type checking struct initializers in a closure
  rust: init: make initializer values inaccessible after initializing
  rust: init: add `..Zeroable::zeroed()` syntax for zeroing all missing
    fields
  rust: init: Add functions to create array initializers
  rust: init: add support for arbitrary paths in init macros
  rust: init: implement Zeroable for Opaque<T>
  rust: init: make `PinInit<T, E>` a supertrait of `Init<T, E>`
  rust: init: add `{pin_}chain` functions to `{Pin}Init<T, E>`
  rust: init: update expanded macro explanation

 rust/kernel/init.rs            | 633 ++++++++++++++-------------------
 rust/kernel/init/__internal.rs |  39 +-
 rust/kernel/init/macros.rs     | 510 +++++++++++++++++++++++---
 rust/kernel/prelude.rs         |   2 +-
 rust/kernel/types.rs           |   2 +
 rust/macros/lib.rs             |  20 ++
 rust/macros/quote.rs           |   6 +
 rust/macros/zeroable.rs        |  25 ++
 8 files changed, 784 insertions(+), 453 deletions(-)
 create mode 100644 rust/macros/zeroable.rs


base-commit: 6946437838b0ec7c976252f5d1872d4d8b679515
--=20
2.41.0


