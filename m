Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5E1C5486;
	Sat, 24 Jan 2026 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769272175; cv=none; b=bdrjCPTyrQ/qzRjHiNSrKatHVpFZn5mx1mD01d0pXUsvBKTDxsMa8MccT/wb2CUVeKIPZEYcyb2amtfGroMRKOX9dj2DUTOrHKLUQHS/KLUjoNhGg4/52gkR5hyBkYVB45V2HErI3+3MZbd+V7G/qNcxl1QkdhmnJqISfJMQobc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769272175; c=relaxed/simple;
	bh=jc0WSSta9Y0I+raE1yGc4jTTTypNw1MVZGoRA73aFOs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=pzX14VpZfz6veCG999C1aK9X6xnGtgAxOthmKuin3AGe75hGVtvbbyZ1uyiJ3qsV/HJI3KahaSk8Bf7k8FWVP7/VdCZHWGn8F/K+b+YiHElvVFW3FHMvS+6n40i2fug3P5tylyeKvtsgzT+aDkhMYotp8av7xObqCDSh5tPURQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXTM/YaO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXTM/YaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D37C116D0;
	Sat, 24 Jan 2026 16:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769272175;
	bh=jc0WSSta9Y0I+raE1yGc4jTTTypNw1MVZGoRA73aFOs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SXTM/YaOlpxhF+dt/NI/DdcFsZ1pL4nUwXlD/dheXfGNkbYl0t6jOR8TkmjeYC9He
	 1IEnFhCi1/RhCIpIc6Ggh22NY4J5mTtg7HVPDtGOwUMr6jpn4qqs32ZA+00yYj0SO2
	 b1Vi03Zos4/lPHnT7wgKpeoxBy+D0k2kmf0ezgieJnfuGp838EAo8lsbUmrTiMDU6c
	 1SjTjbe0a+icIqXEEnsaePY1podsMgGtp/KLJmmySNz0ElUE4eGO1D4Ad/731DncTW
	 mMpZukmBZ9JYwas9njjIPQL66ROzcj1CpnEYVRpf0eCe6F/QP1BReGN9tgq3cnOIDu
	 802TGjvs8IKcg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 17:29:29 +0100
Message-Id: <DFWYN2557148.34IB8SN4R2GB2@kernel.org>
Subject: Re: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Benno Lossin"
 <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
 <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>
 <DEYMFYQH2GY0.3HF506HL8OHY6@kernel.org>
 <DF1DP93V7IQ2.2BA2EV61WUA6C@nvidia.com>
 <CANiq72kc_SY9Nsy0kYDa__Uqjt3WqNnT-yfqvF=1La7ox2Fzyg@mail.gmail.com>
 <DFVXYNDE1USI.3B6GIBDMP36AU@nvidia.com>
 <CANiq72mwvMBymD1Zt74o+isB1r89kdXZiq8fmX-9vOd9JFcY_g@mail.gmail.com>
In-Reply-To: <CANiq72mwvMBymD1Zt74o+isB1r89kdXZiq8fmX-9vOd9JFcY_g@mail.gmail.com>

On Sat Jan 24, 2026 at 5:17 PM CET, Miguel Ojeda wrote:
> On Fri, Jan 23, 2026 at 12:45=E2=80=AFPM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>
>> Actually, the nova-core code that depends on this won't cut it this
>> cycle, so it is probably more appropriate to merge this through the Rust
>> tree.
>>
>> Sorry for the back-and-forth and last minute notice!
>
> No worries, I can do that -- do you want that I take the second patch too=
?

There shouldn't be a conflict and it's always nice when a feature comes dir=
ectly
with a user. :)
