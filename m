Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C77FC154
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Nov 2023 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mNfcVe+r"
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49785B8
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Nov 2023 12:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1699216818; x=1699476018;
	bh=zQ8BnmBSMoQdYKjf1zJale2yNr4qYlu0dngsm1biA/4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mNfcVe+rc+T0NFC82lRb5pVRJT4stP13Ryw1ZF7Gz2JdIkrtQudg1npjGS4LgpMhl
	 3r4I3EX4CaJgOFrz6I6TXflQMUUX42MxFobDdaBqO9nmG1pSDNhV0D56wbWqVmNoxk
	 yEMWRi2wjejQGXLUmYxApazge6GJ3nzldGgGihI3BJL/yjXtf7m6jEXypm+cyO3i22
	 QOfhwRAKQAh/FaCQcXs4dxuZMoVHPmtnmYdrXl/dnrPZOkhrHe0nHehQmG8kkbz9rv
	 6Qm2ooaZBk0HbSkZsdFn/LPZi0/Ze/2F6Sr4Spfto0Izt5Mo0oCcixiiKw8WViFPnT
	 4Uvda5nT18Cgg==
Date: Sun, 05 Nov 2023 20:40:09 +0000
To: =?utf-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] Kunit to check the longest symbol length
Message-ID: <cd57469a-8f4e-4296-9535-10b9c3eedc2b@proton.me>
In-Reply-To: <3cc5fbad-1eed-46d3-b1ab-a9e204347967@proton.me>
References: <20231105184010.49194-1-sergio.collado@gmail.com> <3cc5fbad-1eed-46d3-b1ab-a9e204347967@proton.me>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.11.23 21:33, Benno Lossin wrote:
> On 05.11.23 19:40, Sergio Gonz=C3=A1lez Collado wrote:
>> The longest length of a symbol (KSYM_NAME_LEN) was increased to 512
>> in the reference [1]. This patch adds a kunit test to check the longest
>> symbol length.
>>
>> [1] https://lore.kernel.org/lkml/20220802015052.10452-6-ojeda@kernel.org=
/
>>
>> Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
>> ---
>>    lib/Kconfig.debug          |   9 +++
>>    lib/Makefile               |   1 +
>>    lib/longest_symbol_kunit.c | 120 ++++++++++++++++++++++++++++++++++++=
+
>>    3 files changed, 130 insertions(+)
>>    create mode 100644 lib/longest_symbol_kunit.c
>=20
> I am a bit confused why this is *only* sent to the rust-for-linux list.
> Especially since there is no rust code and the changes do not change anyt=
hing
> that Rust code uses.
>=20
> Shouldn't this go to linux-kernel list and the maintainers of lib/Makefil=
e
> instead?

Seems I missed the "To: linux-kself" and others, sorry for the noise.

--=20
Cheers,
Benno


