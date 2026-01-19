Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3761036CE0C
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830675; cv=none; b=hKdq09tm/FocFA3IiACPwFDhxBtjiEFXlU33UoqJa0pOk8dlXy7T6y2QA36jguBvzEZHsueRv2EyEjKgSn7lgrxcNKgQf38tv0R1IpNuTAyaIh/m1Ekcs9quiH+v8AgNvURGOD8CUwKUMNtwk+Qyy1CPy6q8E8ZyseAfR0jaT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830675; c=relaxed/simple;
	bh=jChvWjgbovlVcD3u5ONuF6YAxMbbpmFZqYHrKSpBq54=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=f/scc1MtpnsYpj2lOFfIfGonPTfLxeRqDyaEKoZaMle/BYpusDcGbFDBFLP4VFMh0XgyUnTZwhpvfFMjWWB1XpKmC4IDS8RRpXAqyL5FDJ+972poRCN+mZ7UpdEPwldnLj0WzfNK7z0U6c2FNFTPUYEHsRyc8TYi0A2sA/aUQtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBNoOexj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBNoOexj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918BDC116C6;
	Mon, 19 Jan 2026 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768830674;
	bh=jChvWjgbovlVcD3u5ONuF6YAxMbbpmFZqYHrKSpBq54=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GBNoOexjliotUSh5x89VtvIHiiJjjVo3sypPSjBwNAkAAVb2pg27V5cBDdvqLHomJ
	 hY55BEsxkEW8BO5VsB0qzmEZIRr0w8pmoMcLRixj3clP2WMhsjC95zLu1WtKURV2gV
	 yjlqT1KWwB2sf5dksnHiF+vLF/iOGE84+Fk7fFLu7guSyBCIMcYnopJPy3jWOpwkI/
	 hfoSGIJaf96D3iOAHQBzdoLIHE9/TdMe3LC1ajyNrq11SbEQ2hvNCBg6LpS2rSSxQF
	 maA4b7iIViKt7/SsDaLVq7I+lNR8AM7ejdhwvHsQQlwgarObONcTmWuCVy7+gHYZXT
	 LEVzwrB7bGwgQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 14:51:11 +0100
Message-Id: <DFSM54IDHL4O.235Q8YSZDU2N3@kernel.org>
Subject: Re: [PATCH v1] rust: debugfs: Use kernel Atomic type in docs
 example
Cc: <boqun.feng@gmail.com>, <gregkh@linuxfoundation.org>,
 <ojeda@kernel.org>, <rafael@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <gary@garyguo.net>,
 <lossin@kernel.org>, <rust-for-linux@vger.kernel.org>, <tmgross@umich.edu>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251203000411.30434-1-fujita.tomonori@gmail.com>
 <aS-ULCZAdj_l_j63@tardis.local>
 <20260119.224942.2031351100749299829.fujita.tomonori@gmail.com>
In-Reply-To: <20260119.224942.2031351100749299829.fujita.tomonori@gmail.com>

On Mon Jan 19, 2026 at 2:49 PM CET, FUJITA Tomonori wrote:
> On Tue, 2 Dec 2025 17:36:44 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
>
>> On Wed, Dec 03, 2025 at 09:04:11AM +0900, FUJITA Tomonori wrote:
>>> Switch the read_callback_file() documentation example from
>>> core::sync::atomic::AtomicU32 to the kernel's Atomic because Rust
>>> native atomics are not allowed to use in kernel.
>>>=20
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>=20
>> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
>
> Can this patch be merged via the driver-core tree, or should it go
> through a different tree?=20

Thanks for the ping, I will pick it up soon.

- Danilo
