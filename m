Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916E14292
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 15:23:45 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DCF10F1
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 08:23:42 -0700 (PDT)
Date: Wed, 19 Jul 2023 15:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1689780220; x=1690039420;
	bh=Pbem3YNgkrJwB1l2pt/Dr3M3RK+UKnK7AsN1kPZxLbo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gqj3zCZn9RJsBr7p6LGtAEPjRGp69UWZmCRodCIxi+eTFJjX93RxSSeKXV+OQpv4v
	 FkyDG1tI/0jlTxCXXwPUY/l/UfPwxsQpzejI8SQJX4+rTKYgka1TYAtFempzc/fsNl
	 dPfVhVJuypBH0vjZFeMne/ePxq7J6DrgGRqVFbZihppOdo3c4lj0md1UV/fz47SpgX
	 LbVHE4NhMHs7HqSYyoVGElE2NkQgjggCD5g7x94pCCFx3KuZHjbMNyLx06G7yBzyef
	 Q10N7p5gsQt5RrC+qGQJKALF3ATSd+rzcHSLTk64fVmnTtX1gi+f2EMtsNOMCF/r2E
	 MWBxEMHlF8bnQ==
To: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/12] Quality of life improvements for pin-init
Message-ID: <o3Twbfzc2_P84DP9ovID4WvI9p6KtKKUuXZctHHclEOqVQ-ULyokM0WGsZMVfk9-k-SnWLj6II9m11umwnCH3MYjsX2My7OLi9x5XYrjZPg=@proton.me>
In-Reply-To: <20230719141918.543938-1-benno.lossin@proton.me>
References: <20230719141918.543938-1-benno.lossin@proton.me>
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

On 19.07.23 16:20, Benno Lossin wrote:
> This patch series adds several improvements to the pin-init api:
> - a derive macro for the `Zeroable` trait,
> - makes hygiene of fields in initializers behave like normal struct
>    initializers would behave,
> - prevent stackoverflow without optimizations
> - add `..Zeroable::zeroed()` syntax to zero missing fields.
> - support arbitrary paths in initializer macros
>=20
> This is the second version of this patch series.
> * v1: https://lore.kernel.org/rust-for-linux/20230624092330.157338-1-benn=
o.lossin@proton.me/
>=20
> Changes not present on modified commits:
> v1 -> v2:
> - implement `Zeroable` for `Opaque`,
> - remove blanket impl of `PinInit` for `Init` and make it a supertrait
>    instead,
> - add `{pin_}chain` functions to execute code after initialization,
> - update the example macro expansion

I forgot to mention that this patch series is based on rust-dev [1],
as it depends on Gary's `paste!` macro.

[1]: https://github.com/Rust-for-Linux/linux/tree/rust-dev
     Repository: https://github.com/Rust-for-Linux/linux.git rust-dev

--=20
Cheers,
Benno
