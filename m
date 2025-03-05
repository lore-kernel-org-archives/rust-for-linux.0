Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E31E531
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185378; cv=none; b=fdkUdOKRk9VszGgiM+eVaWNbM7RiPmkYbO+C6suen7oNW17QYX33h6FkdyH2s48Ww1opzGXyTemeB/5tG1hAfc2kJONFZ6DoWxBUqVUaPWNbHQSI+QPNnPHerDqPoM90tdEysz38rg5GB29PqWcxWZovyJN/hHwDlcdKSz5mhYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185378; c=relaxed/simple;
	bh=Ez0VtLmQoqq1/Yokm3C3CD9v8cBacvTGH8tC6agSjxM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V9PVR0DnlZ8UD+JhEH8Jrz2d3fiqdKUKe5nqcyacjfPpUZm11XPnjMA4Jr/5zegF4Ffq6a/znE3xrIG6f3M/ohlFaM5YvGHIEnpNkWSsZNB+5VdaKA8zC5M9a16wGzZbgC80TPwnOs9IUpcPpqVhIcT+xV9yeL1mQ99keq+Jo9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToyLGPwn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToyLGPwn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A664C4CEF2;
	Wed,  5 Mar 2025 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741185377;
	bh=Ez0VtLmQoqq1/Yokm3C3CD9v8cBacvTGH8tC6agSjxM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ToyLGPwnSuMFqrEMub8moJpaVy7JJ1QnreRJOO5Y0kEeNC4LhqRnq1EnZNRC3eODy
	 EGhmIx6SW16T390wd1URs8lLI7JyZun0SQc8cQnd1YoJGNHHY+pIl8DbwzTotCjasx
	 PZPGFEd+04LxjrXPfFsQV7XSTwhlHhe7zpMpZkMlZ+psK3U5R8H6Tfvzs7bLXPoWmZ
	 dQRWqQkxXIXH81pgCtSNYk7tEEB8glzpG9q6i5zAoFOkEBip1kg5mIF1UpBjbFAg/K
	 4xArbZqwzuvcar/UrNidFRI95y63ngnfhGBaKpzijbWDkOqV8/MiuyVTDW3KsrDy+G
	 hHyGWhzwH/eJg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <benno.lossin@proton.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 00/22] make pin-init into a standalone crate
In-Reply-To: <D88DZV6T9WOV.1QM9UZEAB6IL7@proton.me> (Benno Lossin's message of
	"Wed, 05 Mar 2025 14:03:08 +0000")
References: <xn5HRPkxO91lsoIUAwMnnAvQRCAgmw6nzTZX2DsODS0viAvz_g6B8l3dpYNtcL2jBXySi0DQrVi04b6MY8GbMw==@protonmail.internalid>
	<20250304225245.2033120-1-benno.lossin@proton.me>
	<87msdza8d5.fsf@kernel.org>
	<Hlq4P8qcOOmwdtlEQS7tg0FifI_i0ln9dvHP04yyxWteSpGAV2OUnP6ahOqX85eohzXVLSKdBak5guQvYfospg==@protonmail.internalid>
	<D88DZV6T9WOV.1QM9UZEAB6IL7@proton.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 15:36:07 +0100
Message-ID: <87r03b8rzc.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Benno Lossin" <benno.lossin@proton.me> writes:

> On Wed Mar 5, 2025 at 2:56 PM CET, Andreas Hindborg wrote:
>> Hi Benno,
>>
>> "Benno Lossin" <benno.lossin@proton.me> writes:
>>
>>> This patch series extracts the pin-init API from the kernel crate and
>>> turns it into a standalone crate used by the kernel crate. The reasoning
>>> for this change is that the maintenance burden for me is too great
>>> maintaining two (more and more) diverging versions of the same library.
>>> At [1] you can find the user-space version of the pin-init library as a
>>> Rust crate.
>>
>> [...]
>>
>>
>> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Thanks a lot for the quick reviews and testing!
>
>> Tested with downstream rnull driver. The driver is 71 patches on top of
>> this series. It required a handful of trivial changes to patches that
>> touch pin_init, but everything seems to be working just fine.
>
> Do you still have those trivial changes around? I would like to know
> what kind of changes you had to do. Was it just import adjustments or
> did you also need other changes?

I pushed my branch to [1]. I folded most of the changes before I got
lazy and put a commit on top, so you have to do a range-diff with
v6.14-rc1..rnull-v6.14-rc1.
>
> If you find the time, I would greatly appreciate if also you put your
> rnvme driver on top and test with that.

I can do that, but I have a few work items to tend to first and I go on
PTO next week.

>
>> Reviewing this series made my head spin. It must have taken a
>> significant effort to compose the series. Thank you for making that
>> effort!
>
> Yeah it wasn't easy to get the two versions on the same page again. The
> hardest part was to split the changes into self-contained patches and
> also to ensure nothing breaks between them.

I checked every commit - nothing broken for me. Very impressive =F0=9F=98=8E


Best regards,
Andreas Hindborg


[1] https://github.com/metaspace/linux pin-init-rnull-v6.14

