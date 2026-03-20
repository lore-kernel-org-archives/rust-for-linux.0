Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C021A6817;
	Fri, 20 Mar 2026 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013226; cv=none; b=LQVxTyKUamWbCNXS/HrZp3owgBrh9PZ89JorMdFMtonTzVLekr6d0LgZ9WGkptNRYt8nJ5uIHN/iFLzCXEuoPPEWCDMSH1ssSnxZPjEXVl84JM0KM1MU8JnQ1eR0/U2T1mMXsmKLGcf3AGZI1csqSCs0HEOfsH4oDqNXb4wS/fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013226; c=relaxed/simple;
	bh=sgHsFwDiNLrXXjtGraq6XSBOmIhvxDGnplc/Xro+bSI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=TsV0i+sNP2KxTs170X8dZRkVrBPSKP78RAMSHRboWjvbXaG5SuaxQkAUaT0V7HGONgmE7omTV9cK/aSdkdWVAJQqVhcbrDdZ6O/6v0wsJRbFQu8RySrXMfEHhgn5O9jBxIBLi2wXWzTqCmnSrn0wECZWpih64kgo3iGNh0tZSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+UlBGEQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+UlBGEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4D7C2BCB0;
	Fri, 20 Mar 2026 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013226;
	bh=sgHsFwDiNLrXXjtGraq6XSBOmIhvxDGnplc/Xro+bSI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=X+UlBGEQ7YEZrMnWcZ4LOjyjODl+QQzPtk3HrVojqkGd/PAGa8yEEprpG1EXmN+0R
	 8jjhVP9nFiS7Uh1B0n7g1beqr/tsSg4xVSX+O/fvEkJ7u9gw9zAAf3mbLGCI6Ivnua
	 6LE1yKpBzUwxKwWz1dGGuJ2hxQBD29Fsb3mhtNgogeIvMSHs6AHlXrqPA/naxZ/4ob
	 Slh7t+VNBnj4MWobmiPYubmQaV6Y4IjdaIeyzDSlUGVWo4m0PGGTBBa2BAjETgQi4s
	 oEMUU0bBjKs4fQFRtTcnUNgkUsD0jFjqXZRmclBAOzwYH/m0BKjFWx3JMTbta72Bl6
	 2NgIKLMoUzQEA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 14:27:01 +0100
Message-Id: <DH7N7BE0CQNG.VI8THRIVHONS@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 9/9] gpu: nova-core: gsp: add
 CeGetFaultMethodBufferSize RM control command
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260318-rmcontrol-v2-0-9a9fa6f1c4c3@nvidia.com>
 <20260318-rmcontrol-v2-9-9a9fa6f1c4c3@nvidia.com>
In-Reply-To: <20260318-rmcontrol-v2-9-9a9fa6f1c4c3@nvidia.com>

On Wed Mar 18, 2026 at 8:14 AM CET, Eliot Courtney wrote:
> +/// Sends the `CeGetFaultMethodBufferSize` RM control command and waits =
for its reply.
> +///
> +/// Returns the CE fault method buffer size in bytes.
> +#[expect(dead_code)]
> +pub(crate) fn get_ce_fault_method_buffer_size(
> +    cmdq: &Cmdq,
> +    bar: &Bar0,
> +    client: Handle<Client>,
> +    subdevice: Handle<Subdevice>,
> +) -> Result<u32> {
> +    // Stack-allocate the request; CeGetFaultMethodBufferSizeParams is s=
mall (4 bytes).
> +    let req =3D [0u8; size_of::<CeGetFaultMethodBufferSizeParams>()];
> +
> +    let cmd =3D RmControl::new(
> +        client,
> +        subdevice,
> +        RmControlMsgFunction::CeGetFaultMethodBufferSize,
> +        &req,
> +    );
> +    let reply =3D send_rm_control(cmdq, bar, cmd)?;
> +
> +    let params =3D CeGetFaultMethodBufferSizeParams::from_bytes(&reply).=
ok_or(EINVAL)?;
> +
> +    Ok(params.size())
> +}

This is similar to send_rm_control(), I think RmControl should be generic o=
ver
the control message type, so you could just write something along the lines=
 of:

	RmControl::<CeGetFaultMethodBufferSize>::new(...).send();

Admittedly, CeGetFaultMethodBufferSize is a bit long, but that's GSP naming=
 and
get_ce_fault_method_buffer_size() isn't shorter anyway.

(Btw. please try to avoid building functions named get_*() or *_get(), thou=
gh
I'm aware that it is part of the struct name in this case. Yet another reas=
on
not to solve this with a helper function. :)

Alternatively, you could also consider a builder pattern approach.
