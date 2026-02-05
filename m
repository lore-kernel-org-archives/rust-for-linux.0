Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283B1DE4EF;
	Thu,  5 Feb 2026 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301197; cv=none; b=GEUL5zfGb5iI2lC2uKgmmdxSSFYSIOOm0M7JwOHWKYrx7dmvTFn+312KDJS/1molbKiiatNOpvomq+edJ9OMFkI9tgjfi7dCNytfvjkuemO5NW6EaCXVkLUcElbPpEq7NB+r/zAea//6rrDrSdIlPZsolVLWEy8Sz4BE2tIHI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301197; c=relaxed/simple;
	bh=tcXAH9VxC0x+vH9l4NpWAP8DAmM24peprbjG/1dik1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ObVAoblC+BOyzrHfO40iucl+QDnbuRdzIo+4el5EgRJOFER4dEaKToQOWO28IK2wAalLCcJuNhyx58O9KXRmgziC6o+bTf8n33QfKRXBJHo2ptI+dRo6QjhNumZTbHNIAFhj6WTOVGEY/LGMPVDZtLrwwJbvJq5ekAWhpdavfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyKmjYJd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyKmjYJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC1DC4CEF7;
	Thu,  5 Feb 2026 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770301196;
	bh=tcXAH9VxC0x+vH9l4NpWAP8DAmM24peprbjG/1dik1Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=EyKmjYJdfNJP4QS70K68KAqqSLuJEbWES8rpO+rdJjdTd3C4VBqDkzu1Bx7/DQ402
	 ypSXICYbNQvg7rPsRkxoo+YxcZfJqlyQS7rZFBUsV/nk+/FRkuituyUa1IU8tsoo58
	 9J632hOW8tmXvxi3hChIQoTAmofAZgrbydlNB+IQo3RZ4dQUSZdaC9aN7z4p831Qd6
	 V4SRlZCL5Gl+t30P3dwKHVplPivPIOrqNHK9p5Wpj1XvkTV3saL+Fb/hAMIDK/Gg0h
	 SdlrDENMFnFkXVt7gQhDOWCkHJqyDd5OQ6zmSy7QGScxBuq4JtN6L1v9IlJ6+rVtLB
	 sbahm6HHA2byQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 15:19:49 +0100
Message-Id: <DG73EB8091J4.3SFPDC5TLH0M7@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix aux device registration for
 multi-GPU systems
Cc: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>, "Matthew Wilcox"
 <willy@infradead.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205041120.127106-1-jhubbard@nvidia.com>
 <DG72N8GDQ9E0.2FUX560O3I19X@garyguo.net>
 <aYSfpf3xZNwZhzXs@casper.infradead.org>
In-Reply-To: <aYSfpf3xZNwZhzXs@casper.infradead.org>

On Thu Feb 5, 2026 at 2:48 PM CET, Matthew Wilcox wrote:
> On Thu, Feb 05, 2026 at 01:44:27PM +0000, Gary Guo wrote:
>> > Fix this by using an atomic counter to generate unique IDs for each
>> > GPU's aux device registration. The TODO item to eventually use XArray
>> > for recycling aux device IDs is retained, but for now, this works very
>> > nicely.
>> >
>> > This has the side effect of making debugfs[1] work on multi-GPU system=
s.
>>=20
>> Hi John,
>>=20
>> Looks like this is something that should be achieved via IDA?
>
> Yes, if you have no need to go from ID to pointer, an IDA is better.
> That said, as far as I understand what this code is doing, an atomic_t
> solves the problem just fine and is cheaper.

I agree, for now an atomic should be perfectly fine. Though, with enough
patience binding/unbinding the driver from sysfs you can probably make this
overflow. :)

The reason for the Xarray TODO is that it is one option for a place where
nova-core can store nova-drm / vGPU specific data, once either vGPU or nova=
-drm
attaches to the auxiliary device. But I think there may be better alternati=
ves.
