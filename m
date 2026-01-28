Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7A31AF3B;
	Wed, 28 Jan 2026 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619953; cv=none; b=j4JNd+TAnK1mdYUTAUIrrSQSoOdgnr8hhjmqAgU6kfOlwJbHs2+X6rDzWB2PH2QwCa+hhFSThvd0l0PMhPhgApKPVVB166BT9aOEqzw/Riyh4Ubiee8JmAwd+7nRFnFGSwcQny4tLJ71EpiWkEnS5fCAfW/bFzifLd80XojZ/4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619953; c=relaxed/simple;
	bh=pV5znxiIcfTIztliUZShvIKzU7Zae2v8PCdn/amDaKQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=SWd/2dOisW7ohdCCmHt45w6TbP+YZtgj9yhlL8o55hNLOFMyx7cpoSL6gCrkMG7pwuUqgOLu5tryD9IwIVezwqx2tPYA/xM7A3lVNet1YtXNWcDKXCtGXHW6N52swFkoePXFX6/oOZo8gjcJ1Qt4asTDqKBviOoFBQkcCzjDa5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0+1eSNc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0+1eSNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70493C4CEF1;
	Wed, 28 Jan 2026 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769619952;
	bh=pV5znxiIcfTIztliUZShvIKzU7Zae2v8PCdn/amDaKQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=j0+1eSNchx/E61Ue/Zc3V4Tmrsn+SxiRc1p5BGLkLNdH3QNu8zX3YE2MRhX2fnHH5
	 hNY4t02mOEWYpmVzUHsLIik/MNVRskFf76YgxcKJWTkHFKsQnBVyBRstd7dJ9vuVxs
	 OSlK0MQy0tDD/yFCYRsEDWjTCBr0ubwm8pkpZZL2Yec7DONnaAL8mN1qD3D7RysEhB
	 cLDsEpa5lQvS5y5QQMBwHHi3Pft+ccbslwLN8n5nDqiUDwoChkyRUqsfcGoG7PMigP
	 rNqUX6ZgkgZJUU2f6N8Azo+5vB1jyl5brOtZqQIujy+36oBKyU0e0Mt6phuLobLybl
	 2EQDSgKVtn9hQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 18:05:47 +0100
Message-Id: <DG0DX0WOGQ4S.35RB35H32AS3N@kernel.org>
Subject: Re: [GIT PULL] Rust pin-init for v7.0
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, "Tamir Duberstein" <tamird@gmail.com>, "Alban
 Kurti" <kurti@invicto.ai>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260122101027.1427972-1-lossin@kernel.org>
 <CANiq72mb0s4_gAW2wOQ=JBcpzkLg5tHA1TQ01V9WoFUqv7Pi7A@mail.gmail.com>
In-Reply-To: <CANiq72mb0s4_gAW2wOQ=JBcpzkLg5tHA1TQ01V9WoFUqv7Pi7A@mail.gmail.com>

On Wed Jan 28, 2026 at 4:03 PM CET, Miguel Ojeda wrote:
> On Thu, Jan 22, 2026 at 11:10=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
>>
>> Hi Miguel,
>>
>> Lot's of changes in this one, mainly the `syn` rewrite, but also some
>> smaller changes such as removing the `try_` versions of the macros in
>> pin-init (the kernel still declares its own).
>>
>> All commits have been in linux-next since Monday.
>>
>> The first commit in my tree is also in the `syn` patch series from Gary
>> [1], to avoid problems it should be merged after this tag. There also is
>> a "phantom conflict" with 74e15ac34b098 ("scripts:
>> generate_rust_analyzer: Add pin_init_internal deps") in rust-fixes,
>> which you already saw in linux-next [2]. Otherwise no conflicts
>> expected.
>>
>> Please pull for v7.0 -- thanks!
>
> Merged into `rust-next` and Gary's series (without his first patch)
> right after that -- thank you!
>
> By the way, in the PR message, it would be nice if you could use the
> imperative, since that is nowadays the style maintainers should use
> for PRs.

Will do!

> I reworded it a bit to conform, please take a look.

Changes look good to me.

Cheers,
Benno
