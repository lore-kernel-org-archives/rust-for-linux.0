Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41EC749C;
	Thu, 29 Jan 2026 00:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769646025; cv=none; b=Sl4xDpeErm/OQbxiFaEoFKWzjZ28QU0WUdXf1Qzi7KsusegkPrS9gSPZHP0iSCA8ghHn4aIb8v63aOSFCOP5d6nL7rPWdLrrjxMFCYy/v1OfU6vis4aU23em9sS9B0pP+a5OtzEQqZS1DEdNB/+cjSjV7ew0z8dpA9XsN3cvlAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769646025; c=relaxed/simple;
	bh=Lpd9kC+1aougw4btdvzon7ENBBCLCGY+Jd5QG33v4yw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Ye5Uhn8d7jF72CLBPkI6oNTt0Sl8M03LMkqourw1GuPbIaZLv7TjG5e6ORVfThvAqFNlbVPTpthNzgeM9kSulKmQn/W3VuEGjgZPJUdkuamnsKtMsQK8nTGaW5c/0ZET84HCACNZ76BsHnjNlA+2l2wcMNNPaw71ODoYus8hLJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJVinoa0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJVinoa0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5174C4CEF1;
	Thu, 29 Jan 2026 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769646025;
	bh=Lpd9kC+1aougw4btdvzon7ENBBCLCGY+Jd5QG33v4yw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=bJVinoa06mK4xDCvuVXnFC/HzeXb5E5HreC05Ge7Gbap+2Ww2i1UazpaSSuCwpbxX
	 prY4MV0AbboQIm7vAP+TP3ycwQ0JJMqBwzQqF/3LWLYE25Cvi/QLp3qZjaHPMubdAl
	 RHrTVZI5hWzMVTNqcYq4RSuckDQCz9eYgIceqaB9e5CsCzioNaOl2vsIjQb2x936Q5
	 yvt6K+CGz0VTgy45y+Wm1TbAEerZjmxQkMUQsCoI3qii5c+y9JlOI9R9aGW84ddTNl
	 6xA7u54/EFrClsJyDkB8/vijBmalgJ3b/wVJcQL1pQwZoK+tLWgF21G12W1J8RxAi3
	 fR/ne5i7l1Zsw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 01:20:18 +0100
Message-Id: <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Dirk Behme" <dirk.behme@gmail.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-riscv@lists.infradead.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
In-Reply-To: <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>

On Wed Jan 28, 2026 at 4:14 PM CET, Joel Fernandes wrote:
> On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
>> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &V=
bios, cmd: FwsecCommand) -> Re
>>>           let ucode =3D bios.fwsec_image().ucode(&desc)?;
>>>           let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
>>>  =20
>>> -        let hdr_offset =3D usize::from_safe_cast(desc.imem_load_size()=
 + desc.interface_offset());
>>> +        // Compute hdr_offset =3D imem_load_size + interface_offset.
>>=20
>> I do get the idea behind those comments, but are we sure that's really a=
 good
>> idea? How do we ensure to keep them up to date in case we have to change=
 the
>> code?
>>=20
>> If we really want this, I'd at least chose a common syntax, e.g.
>>=20
>> 	// CALC: `imem_load_size + interface_offset`
>>=20
>> without the variable name the resulting value is assigned to.
>>=20
>> But I'd rather prefer to just drop those comments.
> The idea of adding these comments was to improve readability. However, I=
=20
> can drop them in the v3, that's fine with me.

Yeah, that's why I wrote "I get the idea". :) But as I write above, I'm
concerned about the comments getting outdated or inconsistent over time.

Besides that, it more seems like something your favorite editor should help=
 with
instead.

> Do you want me to wait for additional comments on this series, or should=
=20
> I make the update and repost it?  Thanks,

As mentioned, I tend to think we should just drop them, but I'm happy to he=
ar
some more opinions on this if any.
