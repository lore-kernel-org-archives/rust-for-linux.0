Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53656370D6F;
	Thu,  5 Mar 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709390; cv=none; b=sKHatvMEf6dNsNQ0/bX8x/e0gfXiqATFV+4ksA/YtP79aYq6lDvdTJoeJZejzSUmpIHVE4AYA6/c4qcpsR/Leu/1FtGslX0mNUDiR9+xsT3bteqwBIKKJ8WAZAgOikpn8O5UU5qE/dG9WYkwzjY3mTkt3CWdX4+K4qMFV3EvV/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709390; c=relaxed/simple;
	bh=lrn12u6sL6iGiv7dTsc1sF0gtNSSPZgx/BMyrzPZGnw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=CvWF/tEmO3Ra7M8oHxQZEzjfWWG93b/ur6BBhnSkJnVZM+SeMEIsZo18wHgaHNvQpUrVaUh7qd5wzIlTHX9iPHLlLhkk4fygMcc+bWLZTCdVCVnOQ/sDTLCkM/4v7+bEUSgVEEBdHmd7qZxZYDng6c/aDm1YGNqFMz1NqeGkyhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJpOjRjs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJpOjRjs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C242BC2BC87;
	Thu,  5 Mar 2026 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772709389;
	bh=lrn12u6sL6iGiv7dTsc1sF0gtNSSPZgx/BMyrzPZGnw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KJpOjRjsdjQDEtf+Bo+H9g/cw839Els4EBc5934Vs3bnb7Vyqt2if5+0a6Br7ayBn
	 2KJsfbGKeP0sUDTeiGM5QBSOEOy13j7Q1i4vq3fojuuz4JIjemBNTBbaRWw+bd2D+R
	 6AShFbSzTxvgE0WPKoqyOOk4Aky2wwFxgS34tFJkKEuCHwnJpTsCK3zMsvYvA4aY/Q
	 KM/czFBJIhMFVaa4Ai4u18/LCNpIYOo8sYGArXAGAMwVt3PjE3VvDFBtDdtCMt9guF
	 nWpyWn/qo1zxNHN3HN1vdJYNitDF6IjUSY3uLZU85WZA65s1NJZS9onKA5zA6fSsrN
	 eh4ygkb6vP8CQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 12:16:24 +0100
Message-Id: <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
In-Reply-To: <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>

On Thu Mar 5, 2026 at 8:37 AM CET, Eliot Courtney wrote:
> On Wed Mar 4, 2026 at 8:39 PM JST, Danilo Krummrich wrote:
>> On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
>>> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Res=
ult<GspCommand<'_>> {
>>> +        read_poll_timeout(
>>> +            || Ok(self.driver_write_area_size()),
>>> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgEl=
ement>() + size,
>>> +            Delta::ZERO,
>>
>> Isn't this either creating unneccessary thrashing of the memory controll=
er or
>> unnecessary contention at the cache-coherency level?
>>
>> I think we should probably add at least a small delay of something aroun=
d 1us.
>
> This is what nouveau does (specifically `usleep_range(1, 2)`). OTOH,
> openrm just does a busy wait, which is what I replicated here for now.
> GSP command queue not having space IIUC is meant to be very exceptional.
> I am not sure which is best, maybe Alex has an opinion, but also happy
> to change it because that reasoning makes sense to me and I don't know
> enough about the distribution of how often it would actually need
> to wait to know if 0 delay is justified.

Well, what this code says is "let's hammer the cache / memory controller as=
 fast
as we can for up to one second".

This really should come with some justification why it is actually needed f=
or
proper operation of the driver.

@Alex: It also seems that this is based on broken code, i.e. I noticed how =
the
DMA read is done in this case in e.g. gsp_read_ptr().

	fn cpu_read_ptr(&self) -> u32 {
	    let gsp_mem =3D self.0.start_ptr();
=09
	    // SAFETY:
	    //  - The ['CoherentAllocation'] contains at least one object.
	    //  - By the invariants of CoherentAllocation the pointer is valid.
	    (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
	}

Why isn't this using dma_read!()? I think creating this reference is UB.
