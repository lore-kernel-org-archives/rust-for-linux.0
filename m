Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0036B062;
	Tue, 10 Mar 2026 20:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773176145; cv=none; b=jrYO78B0MwIQzHQXEQr59bS+wVMDEk29S+Ixeig6wjVdPDuscup1zTgv7KSn93nmCyIMBEsZkHreOgCeV1PfRa9mgcUvo5EVzr6hG0VwGR/+2vpAlACd9YCBJbXIAxPU6HHDD40dp50YUXC3s4O9gtSQeSD/cZM1CU5Ku8wt4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773176145; c=relaxed/simple;
	bh=KYiDDMIZDmTGDRqHZhbvaOIbyj2PFoFlTatS7AZ1fCc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZdJbYGpxCEirZjvIc06C25Rqj2syN0DkZrCq9syjOngKiuzG4xTGik0uz7pUmVWxwerycJSeZwHngYtmu9/oHFTRp8pvXfJt0A5IsY5MKrHfqxeDPkrjjYeFv78san2iCyKS5BsjpYYBrCJHbqmPyQN1pEgzJ7mjShjB84xLt+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuiOFkvB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuiOFkvB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A74AC4AF09;
	Tue, 10 Mar 2026 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773176145;
	bh=KYiDDMIZDmTGDRqHZhbvaOIbyj2PFoFlTatS7AZ1fCc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YuiOFkvBWJm4+19wq/1QoYladlkUUNcB1uqqXBo3Cx2YwAoGEmB6BytBnKwiCG7xr
	 gJZJOkpMJE9bBOz7Z2SyUFbhj36zJSgGCa/T2OYG1TV7waQdjBhtGEPkrJ20ZuF1Gn
	 laQ/kXaR4+WW9iRH/5rpDtbIy3NzaOIRM1AD3ZUHvwM4ZpeaMAJc8s1EUnNWlTz71X
	 2UqzHqIR6y73xnOaWCa9CVdBgMj95JqzhMsYARSIhUeiBh4WLceZjfyDm3eLNawNAt
	 79tPDCj+p5XYOX/WAjfXtt998NmiYA5hntqyqD4SkVKVbcykwndFxxMMWqi5WsLQzK
	 zUGnawUxF3YfA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 21:55:39 +0100
Message-Id: <DGZEHD0JWHZ6.3HW5U5JTEN9NT@kernel.org>
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
 <CANiq72k45b+famoLjUyk+UFnZbEONLNSgiwDDQCgUoV6U2m1uQ@mail.gmail.com>
 <DGZEBEPLULOZ.2GT5QV8I8VBXJ@kernel.org>
In-Reply-To: <DGZEBEPLULOZ.2GT5QV8I8VBXJ@kernel.org>

On Tue Mar 10, 2026 at 9:47 PM CET, Danilo Krummrich wrote:
> On Tue Mar 10, 2026 at 9:20 PM CET, Miguel Ojeda wrote:
>> Whether we go for `u64::` or not
>
> The more I think about it, the more I tend towards not going for u64::, a=
t least
> not directly.
>
> The point really is that we differentiate between GPU (or more generally =
device)
> address space size and CPU address space size.
>
> So, I think what we really want is an abstraction of a usize type for GPU=
s (or
> devices in general).

Forgot to mention, the background of this is that existing DRM components, =
such
as GPUVM, Buddy, etc. just use u64 as a common denominator. However, this
becomes annoying when the corresponding device is u32 (or even smaller outs=
ide
of DRM). Because then we have all the fallible conversions on the other end
where the driver interacts with the HW.

So, on the Rust side I think we want to abstract this, such that drivers ca=
n
choose the actual device size type and the corresponding APIs just work wit=
h
this type and store the actual value in the backing u64 internally, but han=
d it
out as the actual type the driver passed in originally.

> A corresponding implementation of SZ_* would just follow those.
>
> In any case, I think we should implement those with a macro.

