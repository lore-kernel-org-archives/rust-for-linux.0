Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF791375
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 11:59:47 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC77D10B;
	Sun, 24 Sep 2023 04:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1695556783; x=1695815983;
	bh=KHCxcKh13d7DDl1+tVT1f9MF1ReKtzY/5wTFWHlKAFQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FSbven0Uht21ygeMaRKuxI0kpOkUB/KafGZe1MX9jacry9N8FRq3GfVxT05LaFDoB
	 XAqmTWYlCGLsX92frMBBlUDHO8Iie3yV3Gq19wgrUrAljTWOxNYluG8Mel769tIr6t
	 J2s+cgJZhpt7tAoI/FJDgxX8wyL3Et04Hm4/HTDtwhfTGG0WS/lUJBzColl25kYJie
	 kohVFleVUgsF90dlZyTdFvseH0Lxv3Apcbab2v5SLOia2lB/gzhE9V3enZmMtGjfYE
	 UdnNEIzZD76OKnzgmgaUxzZpYpmFak+GXeyRs1zMQ6CJttkQSBIaXZQAmDLRlOETEx
	 ccjaCdz2vba+w==
Date: Sun, 24 Sep 2023 11:59:34 +0000
To: Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: [PATCH v2 2/2] rust: arc: remove `ArcBorrow` in favour of `WithRef`
Message-ID: <f38e4fdf-ed44-c230-0a4b-fb56b644c9c9@proton.me>
In-Reply-To: <20230923144938.219517-3-wedsonaf@gmail.com>
References: <20230923144938.219517-1-wedsonaf@gmail.com> <20230923144938.219517-3-wedsonaf@gmail.com>
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
> With GATs, we don't need a separate type to represent a borrowed object
> with a refcount, we can just use Rust's regular shared borrowing. In
> this case, we use `&WithRef<T>` instead of `ArcBorrow<'_, T>`.
>=20
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---
>   rust/kernel/sync.rs     |   2 +-
>   rust/kernel/sync/arc.rs | 134 ++++++++++++----------------------------
>   2 files changed, 39 insertions(+), 97 deletions(-)
Reviewed-by: Benno Lossin <benno.lossin@proton.me>

