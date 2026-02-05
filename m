Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E113D638;
	Thu,  5 Feb 2026 22:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331584; cv=none; b=uGJqOxweYPgBuEgYF+jBFG0g61CTO22XVN87MVBwoNAoOOzk8nhhCJky8pPqf5nnyx5guKdFQpOl6Hqtr1Witoj0q0XPSTuE4L/7R37Vc04Zv9xXQJH2HccPPu7ZhafEcNQxdnbH3uG1W8gdvkNdSm9M0DHXVqEIohTFQF9/Zlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331584; c=relaxed/simple;
	bh=c8fYKE9+ySvvwxeHCgDhSW7zyQfsh6rfatxRSof4wjY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=tPSkg4ezE8uXU2ZFgUppe3mr/13VcJNYoE0akRVRDgZy+NHes8g72iASHc5gP1roJcsjZuUkpPeJNQpkYt0TFfXy01d3z8FcDHdfB/GaF0fLzg6nMZtPQi6iYw5Vmt190U467/qNvIqBIZPl/I/SSUgkn+ZMgnVA8545Go0j3Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQKEJqY/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQKEJqY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F64C4CEF7;
	Thu,  5 Feb 2026 22:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331583;
	bh=c8fYKE9+ySvvwxeHCgDhSW7zyQfsh6rfatxRSof4wjY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=kQKEJqY/sSJofCBVy05YcB0R4FCbORXgvKp/q/B19cu8EKvBJ0sqe9LDii6MoegmP
	 xZlPV5jlxVR2E05BAV4FqG4gneXmp4YbOaw/k9Ld22vViu1Yh1iZJyAP2EoZPzgdH7
	 UzB8O3sJNpDSbm5zWkFOeeGHcVdulpEWlYKJNy+UF3/HW+gcCEmUkQatjyhhR3jXQp
	 l61f7crCSqlnGfnzW6RvzQ89p7RlSkpamkPAlSnVEHVN/DDsCGZdkXWnfRHAAkVCzh
	 9sFB/1He6ChWkrcFYkkHV4ii0o/VqE3YS+mRIHoljL1SLNR+mXGEJuVOssOR7bcPhG
	 oiFVtyqY+YU9A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 23:46:15 +0100
Message-Id: <DG7E62FRLFG8.2WLEEY8VX9PRO@kernel.org>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Link Mauve"
 <linkmauve@linkmauve.fr>, <rust-for-linux@vger.kernel.org>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Eric Biggers" <ebiggers@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Lyude Paul"
 <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
 <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>
In-Reply-To: <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>

On Thu Feb 5, 2026 at 11:31 PM CET, Gary Guo wrote:
> I proposed the wrapper type because majority of devices won't need BE sup=
port,
> so adding complexity to Mmio itself is not ideal. It is also generic, so =
it can
> work with any IO backends, so for example, you can have `BigEndian<Pio>` =
and
> `BigEndian<Mmio>` and you don't need to duplicate your endianness support=
 for
> both backends.

That implies that we swap bytes manually? That would be a waste if the CPU =
and
device are big-endian.
