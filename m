Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D845618AF9
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 07:50:21 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4031A1;
	Fri, 22 Sep 2023 00:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1695369016; x=1695628216;
	bh=svD5R8HOfCiUeWJaoG9Nh1jRNjjm6cAho76nVkSbQB4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gdklLWmIkNgmCW24lNa1GrS1wTm4j+RS69aqR4H6P58tuwb4AaEimsMTY1AIZc7Lq
	 +PtVMher9wReM5M9/D4dAiLwUMwY8HkAEKg6asmbOq0B1hgw6IlJQ8seUfa+3FmGXz
	 L6ytaM78BcsDDyRISkXw3vjI8ByIv7v1PtARF0DvoyFIN77HeTfH28osoA1gsz3Txx
	 Zx2w2ivd8uT6X481htGEkCiS/6r7CYS6GXxmS2SR26xQPSo8qscKyosM8b+AM6gRxL
	 IpR7Z6lQ1iqq3hn8ZZ97WXsyNUbcS3mVklD3peudT+QhAIO3KndEQ2agw+LJkYqrPJ
	 Lsh5RePpbCKKw==
Date: Fri, 22 Sep 2023 07:50:07 +0000
To: Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH 1/2] rust: arc: rename `ArcInner` to `WithRef`
Message-ID: <cdadc162-a425-a29d-194b-f4ab033dfed5@proton.me>
In-Reply-To: <20230921213440.202017-2-wedsonaf@gmail.com>
References: <20230921213440.202017-1-wedsonaf@gmail.com> <20230921213440.202017-2-wedsonaf@gmail.com>
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
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 21.09.23 23:34, Wedson Almeida Filho wrote:
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>=20
> This is in preparation for removing `ArcBorrow` and making `WithRef`
> public.
>=20
> This is a pure name change with no functional changes intended.
>=20
> Suggested-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

