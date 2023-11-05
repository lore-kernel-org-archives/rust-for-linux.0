Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485FD370
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Nov 2023 20:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KNcd+8AZ"
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C267EB8
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Nov 2023 12:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=p64sprrjjzb4xlcdl7zoiw3hiq.protonmail; t=1699216396; x=1699475596;
	bh=uo8yob167zufvDQu6PwZn125Yyq9W0oti87NIFid+Ac=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KNcd+8AZ+7Dy3PEV24wXiC+3LRoEjEs043hGYY0u+MDyEToUqjk86B6PvSIOIN5YC
	 GhygVQTqzJNy1447Z4moCExRJDMhGwpVkWOXCEBgGdGL/+eE1CUKKKefCsZseVIiY9
	 NRCG5+7P2BNua/PQyYzaS1dJg7Zfd/THdu+cveCznHeZXD4i42ZLXO+daZNehxqiSJ
	 dA+maA1r3wiW4+4u+pl+w8GXd7Sft8lWzWNzfauGhp4dNGOmEgHpDIq2akjqfAjVGP
	 KEBXOxgd2sCpeoTbd7Fu8Pj67KPwsDNKmtNmGLuiGKXdP05kxu3kmmcm9VLKhAjqXI
	 WWTVs/CgEVjcg==
Date: Sun, 05 Nov 2023 20:33:08 +0000
To: =?utf-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] Kunit to check the longest symbol length
Message-ID: <3cc5fbad-1eed-46d3-b1ab-a9e204347967@proton.me>
In-Reply-To: <20231105184010.49194-1-sergio.collado@gmail.com>
References: <20231105184010.49194-1-sergio.collado@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.11.23 19:40, Sergio Gonz=C3=A1lez Collado wrote:
> The longest length of a symbol (KSYM_NAME_LEN) was increased to 512
> in the reference [1]. This patch adds a kunit test to check the longest
> symbol length.
>=20
> [1] https://lore.kernel.org/lkml/20220802015052.10452-6-ojeda@kernel.org/
>=20
> Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
> ---
>   lib/Kconfig.debug          |   9 +++
>   lib/Makefile               |   1 +
>   lib/longest_symbol_kunit.c | 120 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 130 insertions(+)
>   create mode 100644 lib/longest_symbol_kunit.c

I am a bit confused why this is *only* sent to the rust-for-linux list.
Especially since there is no rust code and the changes do not change anythi=
ng
that Rust code uses.

Shouldn't this go to linux-kernel list and the maintainers of lib/Makefile
instead?

--=20
Cheers,
Benno


