Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348AA469E
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 08:07:42 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541AA180;
	Sat, 23 Sep 2023 01:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=q6cq42xmzjcgbbbdgnlh7krce4.protonmail; t=1695456457; x=1695715657;
	bh=73tMIUEgD66GnXlytTpMT9LwtCKty/xosfQ/cnPuQpY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KbJAyeMSKNdbntdZ5XFfl6tazxGkjkdAPj17wTLadyJsYIHif00Dl0Di3oVdl3Ll3
	 H/Z095S8dSeOVlZCnp3Qi7DU1iTUc9+C63kia88ifYhtjNHdCSAoI0PZGZMkXYJYZc
	 GBBYZnIVpJdVI+zhuGUnmlfffsvkvUKIyi/4j/VzFdkuwtMDcvk+DmjOB5rSB5rZzR
	 3Mq0hBQolbBPCxRKR1unxvh1fQBHD6x9YfS0IHlbmZ1ORYU468y48JsQbjW+4j+yU5
	 m19Q6DNYZEhPuvLgaqRZzL9lMLR4G/mquLv1+8vB/hD1JH2RNoATyMdI2p6caCYWPl
	 daDInh75Pd5zw==
Date: Sat, 23 Sep 2023 08:07:24 +0000
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Ben Gooding <ben.gooding.dev@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: remove ignores for `clippy::new_ret_no_self`
Message-ID: <91da28fd-9161-e8ab-f32d-63b2862e1e2e@proton.me>
In-Reply-To: <20230923024707.47610-1-gary@garyguo.net>
References: <20230923024707.47610-1-gary@garyguo.net>
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

On 23.09.23 04:46, Gary Guo wrote:
> The clippy false positive triggering `new_ret_no_self` lint when using
> `pin_init!` macro is fixed in 1.67, so remove all `#[allow]`s ignoring
> the lint.
>=20
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

