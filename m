Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCED2D060D;
	Mon, 16 Feb 2026 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250780; cv=none; b=ZKoP+9pHhcQoMM6dRfd+dCdeGSZHTITsCP1284J17OmlRAKt/eFyam0sjQXVMfGH8LOldx89f6yx6yHnOEQYw4SwW/mFEzR/7LHE9WL3FOLJp68GWNqbZgtXDKPOg0aAE1DVjOdEdO9q5OQUN9ieeOI4VAnk1e6WLsuiKnYXJGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250780; c=relaxed/simple;
	bh=GYYz39tFETqaH88bUbstFx7BIqsWTwBMaVT96vPr1pY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=a1ZkqRGdrJlwFmKDUuDV3bADPJweQ07EfOiV7ySQtUYLI/GtWBsqKX+2StwXeKTQHDZWgXQzhOcTrHb+dh8jcu8U9y3jCE4VAT090N7tk6+NYJgq4gm327buAXI1066JyY1df6c0HMXTt7/AdAffQv4aKcRn0yUCaq5xQhoArj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPlqZB6T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPlqZB6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875E3C116C6;
	Mon, 16 Feb 2026 14:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771250779;
	bh=GYYz39tFETqaH88bUbstFx7BIqsWTwBMaVT96vPr1pY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=NPlqZB6ToPC+qKUMLKaSENmosrt05joD05FrxjA0zPTbqZ0HNsEwmtiB4B8++YB4G
	 29PswU7EKxB/pz+8JBEVYRP0tLM339WLIjOXbinVy2Rqsre1j5YV0/MWkDPOeEjFWP
	 KrCCmIsgP6pKfU8kzaSChzpo+x24bNoO6GjQA/AjMtcq8he2tQ2pWcNN7iT5Tee1uk
	 M4GKCuW4NA9LYnImcOYV84N5cyH4xiO/kVoN1qnrsMZ0PT5WzPYsYoT/7rneBG6vhD
	 ot1NJYZ6U1b5jYdfZTOOwBV9FRNelDfr5jsf+ShyWBMPa3+1AtRgvPi2XHQ5HpuEKO
	 hGIapNLwAfZfA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 15:06:15 +0100
Message-Id: <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org>
Subject: Re: [PATCH] rust: add a ring buffer implementation
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid> <aZMMyJofDKualqXw@google.com> <873430es2p.fsf@t14s.mail-host-address-is-not-set> <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com>
In-Reply-To: <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com>

On Mon Feb 16, 2026 at 2:45 PM CET, Daniel Almeida wrote:
> With the allocation being handled by a separate component, I don=E2=80=99=
t think
> this is right. I think a better location is rust/kernel/io

I'm not sure it is reasonable to ask people who just want a ringbuffer in s=
ystem
memory to take the indirection over an I/O ringbuffer implementation with
generic I/O backends choosing the system memory I/O backend.

The proposed code is simple, without comments and tests, less than 100 line=
s of
code. The I/O infrastructure to make this happen is still WIP. So, I think =
it's
fine to land it as VecDeque for now.

Once we have the I/O backend infrastructure, a system memory I/O backend th=
at
can deal with separate allocators *and* a ring buffer implementation that s=
its
on top of it, we can still revisit if it makes sense to take advantage of
synergies.

But for now this seems a bit premature in terms of delaying Andreas' work.
