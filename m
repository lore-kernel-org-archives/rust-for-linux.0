Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7121368
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 11:59:31 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9641D101
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1695556766; x=1695815966;
	bh=oQo/kb9ebTvq/QgNY8lAYDLsGdDSn7gbpv3qtZMT6f4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bv3YO44uaO8A7qa85xsHVdWNZwSzicjbY9tiX+UHqPNTzKlOI7qAVR9lPGMufjG+w
	 5KVSl2ZNU9RVOnOxOnZ4XbTx47ZgU2aaiVjQEsmWMLHHDDc98syOExiIFqS25axYp0
	 mpWL4UeQ4u5H+Deu3vnXB+/DM8OSPzfl3tYxe4fp0xeUETfvOTiZmJAIp0GN79dzeO
	 UTWSVyTrzjne8NCqpR0oEvF6xcy93Y0up6T8tp/ob4757M+6FDIpUe4NIK9SYUbq6q
	 kqygRBaroV3T1IA9X7bFShtgf5IyLOCDHKfwFhsQXYy47VfsO/3hZySh0gMSScdK7E
	 UPocTuP1ElCWg==
Date: Sun, 24 Sep 2023 11:59:20 +0000
To: Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH v2 1/2] rust: arc: rename `ArcInner` to `WithRef`
Message-ID: <48800564-0024-26f7-ae8f-9bf4523360aa@proton.me>
In-Reply-To: <20230923144938.219517-2-wedsonaf@gmail.com>
References: <20230923144938.219517-1-wedsonaf@gmail.com> <20230923144938.219517-2-wedsonaf@gmail.com>
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

On 23.09.23 16:49, Wedson Almeida Filho wrote:
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>=20
> This is in preparation for removing `ArcBorrow` and making `WithRef`
> public.
>=20
> This is a pure name change with no functional changes intended.
>=20
> Suggested-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---
>   rust/kernel/sync/arc.rs            | 20 ++++++++++----------
>   rust/kernel/sync/arc/std_vendor.rs |  4 ++--
>   2 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

