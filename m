Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D6D40DFCC;
	Sun,  5 Apr 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775392353; cv=none; b=bd0Y6Zw/HuGhvv6QqJtYmCCMkEuJIjhF8YW9JpKrVmvbdOmy4E1zYWbK2YeHut4Nqp+WwFXdw6B+FDpie/OZChhNgzU3eKQN+gmSbeFkiz1KO6FtaE5qDvtffvMT67nx65H5/9XuykJ6jBEhVbeT4MGbiTiDRm499QCi3milf9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775392353; c=relaxed/simple;
	bh=HKQ8rQY4yUB2llYX8OtUv2eDMI3hnd5cFlFlZXf9wHA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GNQN9GRlHXWCoxVbUaxOvHIG0qE73f43O5Un5C3k7stGRUVr7mTVk1suowMUegrKH8OhYfeb9RkvSHljsg1g+PrLJiHgyb9Zr+mvMfo1MNBqueqssHduaJttj/uMYoUprKf8RdvPz3rGzoMGLyeO0XCSGxcVsz2JN5tf0WRx1VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WawByFAm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WawByFAm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5853C116C6;
	Sun,  5 Apr 2026 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775392352;
	bh=HKQ8rQY4yUB2llYX8OtUv2eDMI3hnd5cFlFlZXf9wHA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=WawByFAmcCMStOqafxdh2WvZsejBsLs4QHq49V4Hd5nUfalfpUTwTvBMfVLrdFwV4
	 04p/tRvSuFf/6pWasWUYXJvScY+UDbp4N0M5dnAgb1GtMPlqFuWME/l+1PITqp+j+L
	 MR/KF4cUWL5CiI6vwQjShguDcu/qSPoRA5u2bKSqW8RaT587GvTRDKNiFCDoqUIsxV
	 7YRoah/Jre6+01747SYAIP0ld9CrTwQ0j6HncJvRIdIWzOeVhpxiW2mrfwHLsFhawT
	 PtTUh0yuKAFALHZy+yvgkMvr+AFjGUuIZZYfy7Y9hQFZp2iIv4CVU/YwkkRoUFs8Yk
	 pG5G7w5NRzabA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 14:32:27 +0200
Message-Id: <DHL828PQQVVP.3H1SIQV8XK43B@kernel.org>
Subject: Re: [PATCH v2 2/3] gpu: nova-core: fb: fix clippy::precedence
 warning in read_sysmem_flush_page_ga100()
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260404212831.78971-1-jhubbard@nvidia.com>
 <20260404212831.78971-3-jhubbard@nvidia.com>
 <33128320-a33c-4020-89cf-9b8313b7d9fc@nvidia.com>
 <DHL6ZYVYIHI3.2SXJQ5VWKIU5T@nvidia.com>
In-Reply-To: <DHL6ZYVYIHI3.2SXJQ5VWKIU5T@nvidia.com>

On Sun Apr 5, 2026 at 1:42 PM CEST, Alexandre Courbot wrote:
> On Sun Apr 5, 2026 at 6:35 AM JST, John Hubbard wrote:
>> On 4/4/26 2:28 PM, John Hubbard wrote:
>>> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
>>> because the relative precedence of << and | is easy to misread.
>>>=20
>>> Add explicit parentheses to silence the warning.
>>
>> Please disregard (drop) this patch 2/3, because Miguel is removing
>> the associated lint, so we won't need it.=20
>
> I'm tempted to consider it anyway, because it is a readability
> improvement. Any objection?

I'd rather not. If we have the lint disabled - and I think having it enable=
d is
a bit too much - then I don't want to set a precedence for unnecessary chur=
n
like adding or removing unnecessary braces.

- Danilo
