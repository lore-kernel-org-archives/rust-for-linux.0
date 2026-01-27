Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4E28726D
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536041; cv=none; b=ocmuo3NO+jDmoifOfdCydlbwRS/rEkPCHTrJYuAN8gRG5UGG++nsUQ39ys3bX/2HzzA6oDINd+A0KJ5lY/iDaOGRnwvf6gPV4nJvomkaTeuckKi4qtnFSgP1BEiv8xr8nRAVMfHyi6PVvbnFfxhG5hpeGUJBMQZArptKFanMiYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536041; c=relaxed/simple;
	bh=hQNErM/bV7rrO/YbECWerJ9EWqbY2Imk5C7sF6BuoJU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=UfdgunejgKooXS4vvLD8r5g1gT/nPOX8GIglJnDYRYYOxz4Z/CfURNsOL5SluFnB1PDD9ApiiVFD4WFOKqCVQcHH5K3NzU0nTFNkaD+7r0u/gWojAm1jVss5kSOXayVWjBFkbsp5KD/Hd06lq4eNrpD8JPilPGhfBX8idajeh8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxaDJEvZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxaDJEvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E28FC116C6;
	Tue, 27 Jan 2026 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769536041;
	bh=hQNErM/bV7rrO/YbECWerJ9EWqbY2Imk5C7sF6BuoJU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=mxaDJEvZLAhILxj792ameaAxSrEcYJgX68Yw90nf03nNgQ5+uyiFPruEqMY/xEMk1
	 HenQSGr6orvi9mUKmbiAsVSoStq9/be8PRR9M+RYgw4+e0oTgxI7o1iMW6a6GSYunu
	 NZbcoDD+FNMORnopKugtrdeVce/s/QFYE/TC3Rd/N3pl7PAHL53O80qZ+onievXU/6
	 DLKH0CMQu8wk+DqlfJnztKxbuBl59YOYbJ9lbYesDT1Ll0RAfY1U3owIRXXpAiEgQP
	 QcUKDFx1eN9Z5GVAPnJVpdOiXNUvW6xlao1pb7Zpe666yN4qtKUmeWOsN/9mNzjpLG
	 NRScZPZJYIDpg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 18:47:16 +0100
Message-Id: <DFZK68UQ44F4.O2HV8PYFC4LX@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/2] Initial klint integration
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@kernel.org>
References: <20260127172330.1492107-1-gary@kernel.org>
In-Reply-To: <20260127172330.1492107-1-gary@kernel.org>

On Tue Jan 27, 2026 at 6:11 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> This RFC series introduce klint integration into the kernel.
>
> Klint is a linting tool (in the form of a custom Rust compiler driver,
> similar to how Clippy works) that I have been working on since 2022.
> It was initially created to help lint on code that can trigger panics on
> allocation failure; this feature has been long obsolete after we started
> vendoring alloc crate and subsequently replacing it with a custom
> implementation, but over time it also gains some other useful lints.
>
> Lints that are considered ready currently:
> * Items available via kernel prelude but imported via other means
> * build_error/build_assert calls not being optimized out (klint will
>   provide you a backtrace to ease analysis, as opposed to just a linker
>   error).
> * Stack frames larger than desired (configured via CONFIG_FRAME_WARN).

Great work, Gary!

Acked-by: Danilo Krummrich <dakr@kernel.org>
