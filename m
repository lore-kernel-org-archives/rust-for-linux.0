Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB74FDE69
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 15:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904317; cv=none; b=QEYCcA++3prLgKOysWzZ/VVWqj5+99XnKsNx6EtnwxfSDh0Lt3N9e2uBKoYIgkfF06pu1mW5xaLq8Oaj9JbvzIxahN0qmrXiZBk5Rh8B/aRpciKdHmepfN78zUoKTwyKpyg9BoFUmCClIPyTmcYaCYcCBOPxHlkEYeoxYhgcESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904317; c=relaxed/simple;
	bh=MqSDcGOkJmVNdHaMovCKHWahNpT2nQ3Qj7Ia69PZvS0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+S7zeViil/LEaDFAzrO+AsBh7AzrUTNt4Sd46eGEjlwwIuVyGevSzXgaHmy5lUdLdBU2wkGXUT/9CW8z4ImiIEi4Gstp5mkjTAMgJiUPcsltwnrdp/A52LlGFO28dGJfh/SN0zO1FToe/rUjMmnq5uWc3uHoDzIxBTrI+0lJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=agpRySHi; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="agpRySHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791904304; x=1792163504;
	bh=Vqu0VfD2TSaDVWLsO2jZ2m+epvLHQW8tE6hQ9rNg7II=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=agpRySHi0J918b/TpFUyAc5riNXNYUAhRgAUtl30kXLX1WbuoyoXJQXFHitwqhqJs
	 FnTUUbuXNmsbq5Fwt/CGdNdOBqB//22F4qWccAtBhxXzRyoLfluLszzYF+Y95TPxF4
	 solujKqVf8aFGjIs6DRbaBl1w9A+NuizEF4iCkWh9eKEDjSscpBXQubW1PlY2Z6uSO
	 9TdSrslY0yaHJcW5YyaeSDn9SA83N/FgeaRbrVit+dMQIA7eWxV15XV+9TLkon9E/m
	 4OaK2J+h8i7jJL+BJtO0GC3N8A9xRo1Nf9SV8mSGfmLWU6TaSJvSrDpxjf82iDhnh1
	 2LMq7wKW+uCYg==
Date: Tue, 13 Oct 2026 15:11:37 +0000
To: Gary Guo <gary@garyguo.net>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Subject: Re: [PATCH v2 1/2] rust: non_empty: add NonEmpty
Message-ID: <20261013151131.725271-1-lnsdev@proton.me>
In-Reply-To: <DM3RF8H2M4WU.1CB0H9Z2A6WQY@garyguo.net>
References: <20261012-nonempty-slice-v2-0-0f2b67d9463e@proton.me> <20261012-nonempty-slice-v2-1-0f2b67d9463e@proton.me> <DM3RF8H2M4WU.1CB0H9Z2A6WQY@garyguo.net>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: abc0a03f3ab1a461b693a6e600e9fd7243e8765a
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Oct 13, 2026 at 2:54 PM BST, Gary Guo wrote:
>> +    pub fn from_array_mut<const N: usize>(array: &mut [T; N]) -> &mut S=
elf {
>
> Construction of array should be of form
>
>     &&mut [T; N] --construct--> &mut NonEmpty<[T; N]> --unsize coercion--=
> &mut NonEmpty<[T]>

Good point, no need to go through the slice then. I'll make it a
`from_mut()` on `NonEmpty<[T; N]>` in v3.

Thanks,
Lorenzo

