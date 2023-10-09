Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7066618056
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="C7x/rMsk"
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B38DA3;
	Mon,  9 Oct 2023 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1696863098; x=1697122298;
	bh=6sKASihZm9I/toAswxlIwK+AAwIK2Fz8cJLnFLKHAas=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=C7x/rMsk2bCe3th6KW2UmrTnFHKpuIP0EvK7pPEmUOh9B+17B5nucfHHvuou/NCwf
	 YFoM/5ItEpq8axKW8TZfhNC2iGOd2Rf5M0o3CJ9BoOCqwFwtIGZC07rGIaqDMO+yqk
	 kYvVvJcN9bneqQ1z14PVlnUDkTVrEmh1XrzN4pMsXtIysuobgXIcnQ/Z8kQEc19TOx
	 z4cl7A8yaZ7khENkgHqTUeGRei1dS5iQj0tJ0u1xRR9zY2xk8RDWlQyn/XSTxePCrR
	 odkWPdSzwHQYIxaOsbGPEVu8j9vptTYS1Zg8t+m5k+AVRnEFa38KXofmBhLrUeY5Ld
	 GHAfl0ohUeyhw==
Date: Mon, 09 Oct 2023 14:51:33 +0000
To: Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH] rust: macros: update 'paste!' macro to accept string literals
Message-ID: <e36687f8-8c70-0759-ecbb-4afc06b27197@proton.me>
In-Reply-To: <20231008094816.320424-1-tmgross@umich.edu>
References: <20231008094816.320424-1-tmgross@umich.edu>
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
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 08.10.23 11:48, Trevor Gross wrote:
> Enable combining identifiers with string literals in the 'paste!' macro.
> This allows combining user-specified strings with affixes to create
> namespaced identifiers.
>=20
> This sample code:
>=20
>      macro_rules! m {
>          ($name:lit) =3D> {
>              paste!(struct [<_some_ $name _struct_>];)
>          }
>      }
>=20
>      m!("foo_bar");
>=20
> Would previously cause a compilation error. It will now generate:
>=20
>      struct _some_foo_bar_struct_;
>=20
> Reported-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Trevor Gross <tmgross@umich.edu>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

