Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B42FD1AA;
	Wed, 11 Mar 2026 13:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236298; cv=none; b=lCXi/EUfZGBO5FhAt7faocuVDXJx74N71NEyRpavXYphjTNlrG2HARoRO1WFofqGzlhTSORLdfKT+3uMh1c35JGtTPMDuWog0pGjjk2BVlm5yanBMwwJ+Qg4C33Rcs/xXIogp9yPQZZjxY2eEFje0cOu+l0a4QkzgupFyomwOPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236298; c=relaxed/simple;
	bh=/YpA2CCPCPfA0Ja5FkgnaLY819rmcgFFjcHS1Up+MOc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NBGfhfCzd3eK/xW+MXubzNoAfpw0Ikn60DvfhohfOlrBg9/wfWa+D2+49ziBx3u/adG7/9w7yxVHIzIuZP9eV8fm0m7t80cNEkVbCYVzvdK39VyZu0bnNHDG6in8F4KaXtdHmEok7G2UCJCq1NZit26PrQ4FysXBKLr4KFeDd3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXbUCYPk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXbUCYPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6887CC4CEF7;
	Wed, 11 Mar 2026 13:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773236298;
	bh=/YpA2CCPCPfA0Ja5FkgnaLY819rmcgFFjcHS1Up+MOc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=kXbUCYPksVShwj4iMAZhZ9ukWvqs0Gey7zWRCPVSEIArmqmVQOXLDEhYed0ASZaaU
	 /QncCKhsz1pbg9pbYp3Lgl0dK6feeypuBZcdvSbwGAbGnPa0aGy6IOkc6JazsAfagv
	 P/FpWagdUfNJxvfKou9fUHyVgVgdreanbKXKe5gRrYm5ps/rs+MhP8MXtGjH/9Cmby
	 K2m3o2WagpGZxJYXdkmEOWd58lmRWFrCY2XCUyYBSDPPcbdL7oHiQNjTQ9DeENTAId
	 6dBbHhE58JlP7M6hXjXjlH9nhM5P7I205HWKCQCHQjRmp50gDaDIngYl1aBUy4c/mL
	 Vi62IwC42inzg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:38:12 +0100
Message-Id: <DGZZSZ3OJIVX.5MJFI8TZV4AD@kernel.org>
Subject: Re: [PATCH v8 00/10] rust: add `register!` macro
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <DGZ9WXGUA19W.RYEM63UQQ358@kernel.org>
 <DGZZ0W7ZQ6DO.3NBYFWFGPPUN8@nvidia.com>
 <DGZZ53BQ61AF.3HCJ598LHXAFG@kernel.org>
 <DGZZQM4G6FRS.187T94FLRZAR0@nvidia.com>
In-Reply-To: <DGZZQM4G6FRS.187T94FLRZAR0@nvidia.com>

On Wed Mar 11, 2026 at 2:35 PM CET, Alexandre Courbot wrote:
> On Wed Mar 11, 2026 at 10:07 PM JST, Danilo Krummrich wrote:
>> On Wed Mar 11, 2026 at 2:01 PM CET, Alexandre Courbot wrote:
>>> On Wed Mar 11, 2026 at 2:20 AM JST, Danilo Krummrich wrote:
>>>> On Mon Mar 9, 2026 at 4:13 PM CET, Alexandre Courbot wrote:
>>>>> Alexandre Courbot (10):
>>>>>       rust: enable the `generic_arg_infer` feature
>>>>>       rust: num: add `shr` and `shl` methods to `Bounded`
>>>>>       rust: num: add `into_bool` method to `Bounded`
>>>>>       rust: num: make Bounded::get const
>>>>>       rust: io: add IoLoc type and generic I/O accessors
>>>>>       rust: io: use generic read/write accessors for primitive access=
es
>>>>>       rust: io: introduce `IntoIoVal` trait and single-argument `writ=
e_val`
>>>>>       rust: io: add `register!` macro
>>>>>       sample: rust: pci: use `register!` macro
>>>>>       [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macr=
o
>>>>
>>>> I did not look into the root cause, but fetching this patch series my =
build
>>>> fails due to a build_assert!(). Maybe you have CONFIG_RUST_BUILD_ASSER=
T_ALLOW
>>>> enabled?
>>>
>>> Nope, it is disabled and I build with Clippy so I am surprised you are
>>> getting this. Do you know which module is failing?
>>
>> ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.ko] =
undefined!
>
> Does it happen with the exact branch I posted?

Yup, my HEAD is at commit 5c558172827e ("[FOR REFERENCE] gpu: nova-core: us=
e the
kernel `register!` macro").
