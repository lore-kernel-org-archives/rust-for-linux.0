Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F131891AB
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 03:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757820422; cv=none; b=Ibp0VZapiLlh1fb6TD4x4VO3jren6Kz33+jinPH7i91SojQ8AscZGyRR6ZEQ2UuTyhWi7W8CY3Kaq6FZvgNmncd7rB4BqJbEz8YLXLDacjjFzpENosXqIW5yohyzGL9GultxuLKsYH6ZNHeq8R6cXGRzWzel4rWd3Sva1bRtizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757820422; c=relaxed/simple;
	bh=rZg+3eTMr9lLsvC9MfcbTmU5MYahEjbswNA5wNEWAiM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jr57TVCC2HkMhHpvaQuXaCaUXqtdN6iuBQNN52RFqm6bLzXJEXzsGQpOgUot9kmQmql5CGd6TbHEMoInY7A+Y+/wgL12rbOFFAkgx+M2UjcSy5K6yz7GuH5HRWAZYhAx1gIBRdR+14O5iqdP7uRje63393l1uudYSjC/bKLXCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=WRTiMrwR; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="WRTiMrwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1757820418; x=1758079618;
	bh=rZg+3eTMr9lLsvC9MfcbTmU5MYahEjbswNA5wNEWAiM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WRTiMrwRFPPaQuXVzwLJri0Cu1o0QniF6jfKjqdDqS407HgJQKIVkyIS6G6fqoske
	 Yoa8wozRgjbBN1e5D7CBCIphkqHDUpfGpRX5i7QyTnBWq+UPW11TlBYERpBesW0L+R
	 EYZIRionTjsGvIoDgFx9AUOvw4u0FgtWj2YK4jE8iI+/SFNbZhoNy/rROKYgvZxkyW
	 49GtGeG25E5EPjCwYE8eMukjJ1Da1NLN87wHHg88CXdZTUOz5sqXbCB+gtY1LQnuCG
	 7GXTMTsw7j85vddQE8Sg/PIVLLyhSzxBLAg5X/N6pwjwOSqOr2qgYENzfuGJ4y9u5z
	 ZpmLgFAvTAExw==
Date: Sun, 14 Sep 2025 03:26:54 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH] rust: pci: fix incorrect platform references in doc comments
Message-ID: <87ikhlr9xl.fsf@protonmail.com>
In-Reply-To: <CANiq72msM5PT2mYKrX_RPXYtA4vapMRO=iSex1gQZqiXdpvvDA@mail.gmail.com>
References: <20250913172557.19074-1-sergeantsagara@protonmail.com> <CANiq72msM5PT2mYKrX_RPXYtA4vapMRO=iSex1gQZqiXdpvvDA@mail.gmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 287f69c5edc91eabf0806d96011ae80e37681358
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 13 Sep, 2025 21:08:46 +0200 "Miguel Ojeda" <miguel.ojeda.sandonis@g=
mail.com> wrote:
> On Sat, Sep 13, 2025 at 7:26=E2=80=AFPM Rahul Rameshbabu
> <sergeantsagara@protonmail.com> wrote:
>>
>> Fixes: 1bd8b6b2c5d3 ("rust: pci: add basic PCI device / driver abstracti=
ons")
>> Fixes: 18ebb25dfa18 ("rust: pci: implement Driver::unbind()")
>
> These do not point to the same set of stable releases -- one cannot be
> backported to 6.16. In these cases, it is best to split the fix into
> two.
>
> And in the one that can be, you probably want to add Cc: stable so
> that Greg's bot doesn't detect it :)

Thanks Miguel! Just sent out the two patches.

>
> Thanks!
>
> Cheers,
> Miguel

