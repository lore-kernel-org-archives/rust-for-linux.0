Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B7253F13
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Apr 2025 21:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149000; cv=none; b=Mtt+d93S/TGmbcD0ap9Z38FweloEOmPwhp1yU0DOndUdyxR6h3dGYxqfAV5kXa4f1beXkTjcPVkntPLzdoo2QjiuudYdlh986uShV3pse6erku0r900fAs/AKDKekIZQpeb+lYCz2tC9bszvfgu9eoZbKqwR1+sTzJMWDzEY4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149000; c=relaxed/simple;
	bh=CRYrCG/hT1ZzKwCQF3hq596/KTShQ+Ag0Z9tiEdUi20=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfR/cPo6+pWxdW8lsoo8Z0hfjZdyhC/iOXfcoJxFMVzMYD26LZqY7kJD89wiCl7EP9Ju8paHZYArlSg5AOOTKVhOH6zE5shzrbJPmsUd1G/pah66Lma/vsmYJNEmPEDKIhxtbR2qv5P7Xbatwua/OJjyMuz0GG/cL4/UB5oxPiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=HqForfvr; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="HqForfvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744148994; x=1744408194;
	bh=CRYrCG/hT1ZzKwCQF3hq596/KTShQ+Ag0Z9tiEdUi20=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=HqForfvr2s5laiqCZQpSetIQWFhu0mEdDjtg4oeHXJ1bWt2wkcsC7WTZeO0zKa3hi
	 hSlGQtVHsh81xSZd6aDZ2Qprezcz9B6NZpSMIz4PirYJJM9dxM0Z44Ay8feuQWOVfb
	 KFJSvgexnvo2zJomtfILKud/gOIZJYV2qvi8L/05lb+ygsgoZBqMXEFjDjNp2Nduus
	 2eEq7LuWsq6XiZeGWyYM1zY01QoSm/VWos5lX7Xa7aKZWlOVe1V+8aM5zEnuNVOHyA
	 IWxBhRq1g+HgGxqLEulJqkD/kjQunnLjnmUnFNisSGKbgnsOeds7TxiwSpPRbqalrr
	 Hzt269eWIbbGQ==
Date: Tue, 08 Apr 2025 21:49:50 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/2] pin-init fixes
Message-ID: <D91L7QI9VMBI.3LMLTCHBZPMJF@proton.me>
In-Reply-To: <CANiq72mQpU3f9vMsNqd8aqgxpUZT3GshHhtrCVL79oTM38tuaA@mail.gmail.com>
References: <20250407201755.649153-1-benno.lossin@proton.me> <CANiq72mQpU3f9vMsNqd8aqgxpUZT3GshHhtrCVL79oTM38tuaA@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 57fe4ae1854e27dad7ab0cbdd0ddc07b53d5c7b2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Apr 8, 2025 at 9:59 PM CEST, Miguel Ojeda wrote:
> On Mon, Apr 7, 2025 at 10:18=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> Just two small patches fixing one issue that got overlooked, since it
>> was fixed at the same time the series got merged. And the other fixes a
>> markdown papercut that I found during review of the previous fix.
>
> It looked good to me -- the Cc: stable may not be needed, since this
> just arrived to -rc1 and there is nothing to backport it to, but I
> assume it doesn't hurt.

I thought that if I add a Fixes tag, I should always Cc: stable.

> The Fixes: tag can be a bit tricky sometimes, e.g. if one line applies
> to one set of stable kernels, and another line to another set, then
> the patch probably needs to be split. But they seemed fine in this
> case.

Do you mean the second patch? Yeah, it fixes a line in the example
introduced in the fixed commit, but the other fixed instance is in code
that existed prior to that commit, as that code was just moved there.

Yeah, I probably could have split that one. But since it's only a
markdown fix... I don't think it's too important, but I'll keep it in
mind for future fixes.

---
Cheers,
Benno

