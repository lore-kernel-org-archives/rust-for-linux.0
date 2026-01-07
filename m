Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C73F341056;
	Wed,  7 Jan 2026 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810872; cv=none; b=Uw2FRg6yItGQQLnAD1ORDDEtfVEm4T77385NP1YX50WhUYNObXIfQoMOaOlcSvjHDQ7ZXicVdBFpAlVwH4zbTEGjX0tqcJySKVSJvxQ5L2vNPg2agH2dh411IajypcnVsA63H3GCKQO7f+VjBTNqCiVGgCJCibHprWJCe+ZN2+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810872; c=relaxed/simple;
	bh=MllOipM8SeafdpRoH9kYz/A+Q3B4PVWoqE4uX+1K0Dc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nLcdcl9jke+fieGcR2QJ/F7iH+I9ZipFo1xp0S9+0dv+JJclNMPFeeskdC/M4oK8h4i6M0GYVeWJTpViBJJtz+MCZoBog7vBR/HKaO/mSbUlN3l21ko1k9ejkC8dr696XnUanTAm6PdKCNarkuMKOUd9HxVSw7UJLbiix87ct64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAmlFIuP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAmlFIuP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F47C4CEF1;
	Wed,  7 Jan 2026 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767810871;
	bh=MllOipM8SeafdpRoH9kYz/A+Q3B4PVWoqE4uX+1K0Dc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uAmlFIuPOoniH5Nc3thE4Gq9hgvImCojCF9ByuP3KDi+nsdweEN6Vj9mh5jtpknXC
	 ZT3oehEkj10VJRMAaEPwvJZg14qF0T9LnDr4BJ+rG0ykYMjw8wvdjBnwGrxKie1FNI
	 F4UzCnbk88UzqAi1x/ZM6RuJQTV8sOm8Zwob8BxY0ywqlgNLytNDZjHonfZo7aGkkh
	 qA4LAJKtZ57ntDxqx4h/05J7IRkQiej/MjMM4zSFeWWOVAGd2x8qW28y65gmyDvewr
	 3Es6Y/6JdJis0W9RhV/jH7zzxfaKgZBgPp5IsKFyfK69Xw5GnNVYmixAHx5v7+8pG7
	 rxmLf85oDX4dw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] rust: xarray: add `contains_index` method
In-Reply-To: <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
Date: Wed, 07 Jan 2026 19:34:23 +0100
Message-ID: <87jyxtgtlc.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Add a convenience method `contains_index` to check whether an element
>> exists at a given index in the XArray. This method provides a more
>> ergonomic API compared to calling `get` and checking for `Some`.
>
> It isn't clear when you'd want this API, and neither this nor the
> example are particularly motivating.

I added this when I had a line reading `if xa.get(index).is_none()
{...}`. I think it reads better as `if !xa.contains_index(index) {...}`.

Do you have an idea of how to improve the motivational factor of the
example? Writing motivating examples is not my top skill.


Best regards,
Andreas Hindborg


