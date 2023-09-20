Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040F736AF3
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Sep 2023 13:25:15 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91011E6
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Sep 2023 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1695216308; x=1695475508;
	bh=aT9PKBVhZus0XPPYxq/e5ljiPK/jIsQxVgPoCwBivfg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nnY26sNBTVX2WsYYdArMhIzrWWdmmwFgC1j5p1aoJsieyeO1lY4oSh7tERzzLKlnV
	 szf8jxpE2GNsG9GOQ88Ruvp2hybi73cZAS+gkuL3O0DbBAxpjPBtKjibm8gFKS22la
	 BHkk4DTgqFHkaIfYITGR/HSOutsTd+pTYcxdjwv0M3YdSlxvCXfcUKuFHoREi+AR1d
	 bhGtzoexENsBTyeVOD3wMskeYa4HK5YpZ2M64Ig46dGHE/u0PydPr8/lIAijg/xYYh
	 M/5XlurdbefDvagXThZ9rRYt5Oju47EqQ4U/AH+sMB64to2h5evAmpDaWCB8Tu0Knn
	 ZJUYtO/hjYDKQ==
Date: Wed, 20 Sep 2023 13:24:54 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
Message-ID: <79176486-af4f-5865-3ed3-256a798c1044@proton.me>
In-Reply-To: <20230919.192600.604528401262292577.ubuntu@gmail.com>
References: <532b57ad-6d35-f0ee-1433-b9b63a91fdd5@proton.me> <20230918.220905.1497497848303760774.ubuntu@gmail.com> <dfc87664-24c3-88ac-ec34-2b65e898628d@proton.me> <20230919.192600.604528401262292577.ubuntu@gmail.com>
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

On 19.09.23 12:26, FUJITA Tomonori wrote:
>>>>    > +/// Registration structure for a PHY driver.
>>>>    > +///
>>>>    > +/// `Registration` can keep multiple `phy_drivers` object becaus=
e
>>>>    > +/// commonly one module implements multiple PHYs drivers.
>>>>    > +pub struct Registration<const N: usize> {
>>>>    > +    module: &'static crate::ThisModule,
>>>>    > +    drivers: [Option<Box<bindings::phy_driver>>; N],
>>>>
>>>> Why is this not a vector? You have to allocate in `register` anyways.
>>>> You could also use `Vec::try_with_capacity(N)` to initialize the vecto=
r with
>>>> capacity for N elements.
>>>
>>> I thought that this is simpler. What are advantages of Vec over this?
>>>
>>
>> Pushing a new value is a lot simpler, since it only is a single function
>> call and not a loop. You also do not need a generic parameter.
>=20
> How about the following Vec version, looks simpler?

[...]

Yes it does look simpler.

>=20
> Trevor proposed another implementation to use static allocation, what
> do you think?

I think that we should use static allocation wherever possible/if the C
side uses it, we should try to also achieve it.

--=20
Cheers,
Benno


