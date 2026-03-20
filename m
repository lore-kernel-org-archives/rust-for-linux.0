Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536FC17A305;
	Fri, 20 Mar 2026 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037265; cv=none; b=hije8FmjCd/KvCHhRewkPLKjy0nuP7m1CwnSomjYej/zQhGtwWvJcnuyZEHb3359Bm6+BB5FjJJqHf31nvnETBxgmz5flJphXg/UI7z3bVhwYZ45+vMm0xV2+t4ZBa9litV4oHLdG4yLYE9W+WQWWFeSDd5BIhFgQLXQAvndXgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037265; c=relaxed/simple;
	bh=inZTQJe4zuAFmmL8Gqg6qde5cdu4bKf0//clHRq44X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apayA5xxVw8J48tNsLCqovgqoF12uOH1UbxaMh1nT/PFRiWykNpSMOp2JqHO8XI21aChM5Ia9chJAk6H03JdOLYRbXZMI/9uzFtkMwz1kIKWv1iYsQDBOOfYlN4jFgnsi290ceIgRNxiNWUgd0G8A77nwudlQTPf67FNDL7DtbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNNeD3kx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNNeD3kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E747C4CEF7;
	Fri, 20 Mar 2026 20:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774037265;
	bh=inZTQJe4zuAFmmL8Gqg6qde5cdu4bKf0//clHRq44X8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vNNeD3kxXp97fjr1kQd28JjQl4S+SsY66HXuj/Oqt6+DLoaqg9EPBqMQ4mdAkQCSS
	 O1BX3tOYcWeMc1UeP+/Z2y3Gz8J4f1+8kqV+fQQrkVaXm8YvPjRwVelq2Rukp5dEYU
	 bQe2WUEV1V0AIC2F4yK5Z57fQhBvdmSKDbYhj1Wo16NgLYZFAqU8bo2uFd5ktMFVNW
	 XhSx6JJRIFdIe5ESjiiOOBdHxKvrKHxnQ0p1Cqu4YSDf99tkVPt1HrhJOTpM/XMIHu
	 +o7EzYCrsZVco1V9HzDrOoDQNTDDQ4n4rxHiSa9+Setl3LAtQFiPSk4ro8PMwD90uv
	 MPe48Y7YieQhg==
Message-ID: <354b3e67-9bfb-4538-a865-695ebec6b433@kernel.org>
Date: Fri, 20 Mar 2026 21:07:38 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] gpu: nova-core: convert falcon registers to
 kernel register macro
To: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260320-b4-nova-register-v2-0-88fcf103e8d4@nvidia.com>
 <20260320-b4-nova-register-v2-8-88fcf103e8d4@nvidia.com>
 <8f9da1e2-fb86-4653-b702-333fc920af58@nvidia.com>
 <ba3c5689-5e34-4097-8823-c37a48a4f358@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <ba3c5689-5e34-4097-8823-c37a48a4f358@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/20/26 8:52 PM, John Hubbard wrote:
> On 3/20/26 10:38 AM, Joel Fernandes wrote:
>> Hi Alex,
>>
>> On 3/20/2026 8:19 AM, Alexandre Courbot wrote:
>>>      /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
>>> @@ -616,9 +462,10 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
>>>          self.hal.select_core(self, bar)?;
>>>          self.hal.reset_wait_mem_scrubbing(bar)?;
>>>  
>>> -        regs::NV_PFALCON_FALCON_RM::default()
>>> -            .set_value(bar.read(regs::NV_PMC_BOOT_0).into())
>>> -            .write(bar, &E::ID);
>>> +        bar.write(
>>> +            WithBase::of::<E>(),
>>> +            regs::NV_PFALCON_FALCON_RM::from(bar.read(regs::NV_PMC_BOOT_0).into_raw()),
>>> +        );
>>>  
>>
>> Overall, I think the series is good improvement but I still feel this part is a
>> step back in readability, and we should come up with something better. I don't
>> think there's any chance anyone can memorize this syntax.
> 
> I must reluctantly (because I know this conversation has gone very
> long, across so many versions) agree. That .write() statement is just
> brutal, and we will be relying on AI in order to even figure it out,
> I fear.
> 
> I'd hoped that there were other, simpler forms to express this,
> is that not the case here?

I mean, it is barely different from the above, except for the
WithBase::of::<E>() argument instead of &E::ID.

It becomes much more readable if you break it down (which is what we should
probably do):

	let boot0 = bar.read(regs::NV_PMC_BOOT_0).into_raw();

	bar.write(WithBase::of::<E>(), regs::NV_PFALCON_FALCON_RM::from(boot0));

For other cases where we read a register and write the same register we will
have a way in the future that can omit WithBase::of::<E>() entirely, see also my
reply in [1].

I want to expand write_reg() to also be able to handle variable offset
registers, e.g.:

	let reg = bar.read_reg(regs::NV_PFALCON_FALCON_RM::of::<E>());

	// modify reg

	bar.write_reg(reg);

[1] https://lore.kernel.org/all/DH0XBLXZD81K.22SWIZ1ZAOW1@kernel.org/
