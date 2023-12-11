Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lkN/rZSP"
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D857B8
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 02:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702289564; x=1702548764;
	bh=XMBWxQ9g09DUsP4VV2j3XbcbWqRWZl1DHB9M2r0XYWY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lkN/rZSPUtkVJcfviAZRm79S8Bhu7IwZMj2eshxKKa52qAXZdiai24g8K4YB2e0i/
	 loxzKVmh7JsqGKPwMo8Sdq96ZSJf835mOLOcdfTFerpM+qO2MG34Vg0QGJpoY3zssr
	 ixKoX+J1XeM/YVYDNcqglPqR8PcrKcGAUTSedYiUsukTeHX2RH3omuFJ9/wELt0SMl
	 9axaSgALdPuQ85YVtn9UnNAZc+OmIuWA9OxKPNyxbOFqwG1K650O39VgLjXjtlnRCj
	 Y2/zJFqYXgizkTRzUKcdpE3IJP1BFj8Q+71uIxt9C7SHx45CrcQ7mjB8FG7IL+6FNt
	 aD0Txs2w97/zw==
Date: Mon, 11 Dec 2023 10:12:37 +0000
To: Viresh Kumar <viresh.kumar@linaro.org>, "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, Vincent Guittot <vincent.guittot@linaro.org>, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: rust: Clarify that 'rustup override' applies to build directory
Message-ID: <b8824b26-a17f-4194-b901-cd9306d6120d@proton.me>
In-Reply-To: <20231211082342.dkcnlamsyaqxaylg@vireshk-i7>
References: <bf0d4ff21bc25d1ba3a31e49a32bde06dcaf6e44.1702030679.git.viresh.kumar@linaro.org> <4738ad1c-eb54-4ad6-98c8-3852de3e8fc3@proton.me> <20231211064742.63l4cmvxe4uso5us@vireshk-i7> <87h6kpf9am.fsf@metaspace.dk> <20231211082342.dkcnlamsyaqxaylg@vireshk-i7>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/11/23 09:23, Viresh Kumar wrote:
> On 11-12-23, 09:09, Andreas Hindborg (Samsung) wrote:
>>
>> Thanks for fixing this Viresh!
>>
>> Viresh Kumar <viresh.kumar@linaro.org> writes:
>>
>>> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/qu=
ick-start.rst
>>> index f382914f4191..dee787f92d26 100644
>>> --- a/Documentation/rust/quick-start.rst
>>> +++ b/Documentation/rust/quick-start.rst
>>> @@ -33,14 +33,17 @@ A particular version of the Rust compiler is requir=
ed. Newer versions may or
>>>  may not work because, for the moment, the kernel depends on some unsta=
ble
>>>  Rust features.
>>>
>>> -If ``rustup`` is being used, enter the checked out source code directo=
ry
>>> -and run::
>>> +If ``rustup`` is being used, enter the kernel build directory and run:=
:
>>>
>>>         rustup override set $(scripts/min-tool-version.sh rustc)
>>
>> How about just specifying the path here:
>>
>>          rustup override set --path=3D<build-dir> $(scripts/min-tool-ver=
sion.sh rustc)
>=20
> Hmm, this sounds good too. In that case the above line can be changed to:
>=20
> "If ``rustup`` is being used, run::"
>=20
> Looks okay ?

I think it should also mention that you do not need the
`--path=3D<build-dir>`. It might be confusing for new users who do not
know where the build directory is.
It might also work to put both commands there (i.e. with
`--path=3D<build-dir>` and without) and explaining what each of them do.

--=20
Cheers,
Benno

