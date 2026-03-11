Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A8F2FD69A;
	Wed, 11 Mar 2026 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234427; cv=none; b=CZTjFTqYU01uHtDggOrumL/sFVBgMQF+l3ReB7p/JPU/ojbYZeP19sCEP4v8N1Xo05J8Hg+IgzrF6DAyqAHbvRNow2YWItls03ZbHOkeFJkxKxDHoHn34+bpY/3YJPoNcrRxBnY2+thnQTG2jfcm5+JCSIywafBFAAOAzt20h1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234427; c=relaxed/simple;
	bh=kKb7W5vCSeAJIy3ehsP+FcMvOpPLDw4CrbrLtSHD0F8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=GvpiKRPIFv9y0fUG8zf+f9cWLlm8M74Dpp3HlxuBOI/QKzx+lJrkCk6+l07q6j8RVIjs8z1rGf6KYA+2u49lPrFKl/uRa4fH59B/goBI9HDJrBFiRusTPxG9FnhY0r3BpfsEnGag0NgVSJT6HZgwN69m8dTH4rmqKCjuJacr9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwetHx3s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwetHx3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1972C4CEF7;
	Wed, 11 Mar 2026 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234426;
	bh=kKb7W5vCSeAJIy3ehsP+FcMvOpPLDw4CrbrLtSHD0F8=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=HwetHx3s+DPU+QoiOpybKpVu8gRKXEtU7A9xneNcO9kpS6gRu0Y+q7gd/v7+L0kj/
	 UYw/uQnz7mBypmjaKn9ik6stK48ZocAHTPDibUMskFnuYS+Gw6IAeTlD8fRAfgmEeN
	 BE/yfPFy3WR6EIHKgUMNqY26ZUVGqb/lmfHCr4sVf91//xP6Cz1+o0WIML2ES2P0rE
	 CjwSsZftJJIQKnx7/5V8KxqckOZpHuzQ4ucrKkW1dGOCHu/b45j4DhGjQ9E83JVThC
	 0GzWMuSeMmbSc8yo5AmmTkedTgQXMGCt/3ilYsPITd115B+KZB2nPmS62mddnbnTO+
	 kzsMvtuwBgZXg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:07:01 +0100
Message-Id: <DGZZ53BQ61AF.3HCJ598LHXAFG@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <DGZ9WXGUA19W.RYEM63UQQ358@kernel.org>
 <DGZZ0W7ZQ6DO.3NBYFWFGPPUN8@nvidia.com>
In-Reply-To: <DGZZ0W7ZQ6DO.3NBYFWFGPPUN8@nvidia.com>

On Wed Mar 11, 2026 at 2:01 PM CET, Alexandre Courbot wrote:
> On Wed Mar 11, 2026 at 2:20 AM JST, Danilo Krummrich wrote:
>> On Mon Mar 9, 2026 at 4:13 PM CET, Alexandre Courbot wrote:
>>> Alexandre Courbot (10):
>>>       rust: enable the `generic_arg_infer` feature
>>>       rust: num: add `shr` and `shl` methods to `Bounded`
>>>       rust: num: add `into_bool` method to `Bounded`
>>>       rust: num: make Bounded::get const
>>>       rust: io: add IoLoc type and generic I/O accessors
>>>       rust: io: use generic read/write accessors for primitive accesses
>>>       rust: io: introduce `IntoIoVal` trait and single-argument `write_=
val`
>>>       rust: io: add `register!` macro
>>>       sample: rust: pci: use `register!` macro
>>>       [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro
>>
>> I did not look into the root cause, but fetching this patch series my bu=
ild
>> fails due to a build_assert!(). Maybe you have CONFIG_RUST_BUILD_ASSERT_=
ALLOW
>> enabled?
>
> Nope, it is disabled and I build with Clippy so I am surprised you are
> getting this. Do you know which module is failing?

ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.ko] und=
efined!
