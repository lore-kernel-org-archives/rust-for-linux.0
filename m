Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADDC30B500;
	Sat, 17 Jan 2026 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768643670; cv=none; b=BpdpgqRLzLM0Ku3529L7wtdj1q3HhrjovFS2EKPhWF/rQxfEOOs6x5OKZW7/AkeVMPAaMgiMz8ePbQdQIw31iZiSEF1MlpfZopksW5VrhRkvUxSxdv9DH0iYqpvysDQAmwAvRZArogOBRHdbpr4xlSecDDqX7PT8wpclcynaHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768643670; c=relaxed/simple;
	bh=WrQrUYiaJoVvKn289YyFXV6ZOSCLdF6B4Wmmdit49CY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZKyDDZZul21IlollujKCdLrvLjMTSfmjLeecNRxY0EwqW046Ui1FdtJoFWR5MESxbJmMv5ZnVgGCKcv/4XdGyOTZ78V76Uix3Up4ki9D7lPV0p97ZUJgR3mxQe2RTh91miZetodJCCZ11lpwDQujGfeolEDAcsPNMqfrd+msbPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBw/Bdcb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBw/Bdcb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F71C4CEF7;
	Sat, 17 Jan 2026 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768643670;
	bh=WrQrUYiaJoVvKn289YyFXV6ZOSCLdF6B4Wmmdit49CY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=rBw/BdcbTI+Y2vuiXGdyFFHcSe8LvpCkpSpr0RWlC01HVhTdXMS2fNZZWauO9Z6ic
	 MVCsq5A1ByJU0ec1mkPpVu8dGkEoYkyZiSSR7xz2KQVCUx/o8UmUR5qcAYNgGHP7bB
	 DF3a7MSa8DJFChU+Q2g784RqX44cvofPRa5AQ8wgIXJQfbY+Wrjdk1IM1D5HidvifW
	 jXJE+VByzFWadzcRMNlDaK6FD/N9h3ptGzZd8/2LhJiNLRn73xIVbZUiV8VO34ixd9
	 NS6jGrF77jWmu/kDyenFSjudpjCPZUg3BUJviwZ/kS6ho3t8HX8wfZ8r9sC+f5FEbZ
	 cPEgofMEzLjIQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 10:54:25 +0100
Message-Id: <DFQRURCFSDK1.1AJU43WLGBXK2@kernel.org>
Cc: "Oleksandr Babak" <alexanderbabak@proton.me>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] rust: pin-init: Implement `InPlaceWrite<T>` for
 `&'static mut MaybeUninit<T>`
From: "Benno Lossin" <lossin@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260108124318.3142999-1-lossin@kernel.org>
In-Reply-To: <20260108124318.3142999-1-lossin@kernel.org>

On Thu Jan 8, 2026 at 1:43 PM CET, Benno Lossin wrote:
> From: Oleksandr Babak <alexanderbabak@proton.me>
>
> This feature allows users to use `&'static mut MaybeUninit<T>` as a
> place to initialize the value. It mirrors an existing implemetation
> for `Box<MaybeUninit>`, but enables users to use external allocation
> mechanisms such as `static_cell` [1].
>
> Signed-off-by: Oleksandr Babak <alexanderbabak@proton.me>
> Link: https://crates.io/crates/static_cell [1]
> [ Added link to `static_cell` - Benno ]
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
> This is the entire pin-init update this cycle. (excluding the syn
> patches, which I will send soon)
> ---
>  rust/pin-init/src/lib.rs | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Applied to pin-init-next, thanks everyone!

Cheers,
Benno
