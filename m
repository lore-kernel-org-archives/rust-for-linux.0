Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ADC2DB788;
	Fri, 30 Jan 2026 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791499; cv=none; b=PC0hpygciWJS/OIRNpss5YZFTKvo/Q3mrSB9sDaCOl3FUDAWAGDGqWp9MMpka00OwditZVtL6Xy3qcMSwa2iLOCdpAQPOWiutBxpw8u4s0Id1BReT95KPj80QE6PUHbWAsULJEO4TXS4ggPWVR4dpXpG2vDqqgha0Qv+3RG4EZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791499; c=relaxed/simple;
	bh=drHimOnwSw86ZNfsHwtdAsRJIdNsGB45sqg966Kx95k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=FobHAkg83SOWAt3r8tDEAn+oNxGKuZQ7MlL7huyV3iGpYhgs3KbRM9eFsp++9MmPnGsX/MXcc8NnHOf9hdVeM/Qt9CpeuOwL+fXeTrZ+nraia5lX2z+mrxQixpFqC1wa+cPahXIAvrdgca31R6gq4wlXlc6rVl5cetUiLAe+ZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOyp/8lf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOyp/8lf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A2CC4CEF7;
	Fri, 30 Jan 2026 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769791499;
	bh=drHimOnwSw86ZNfsHwtdAsRJIdNsGB45sqg966Kx95k=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=oOyp/8lf1KvF5KaS3XtSYz+bHCzsAk5Fmdijg/YqHo4MJ1yaVBadkMoWzIDcfiQwM
	 HcS+dqLzmWfSgD0sZnf3bdw4yvCEdVOY/TI0de/b5PYYrAMK9o2zDJfroWSgZFKCQo
	 YbvVNw1zu292nkJYjWWmUiSRNYnTeq2L8zuQfNC2vHKe5ZkPI/w9rRH7e5mHPd/B4K
	 jZnC7rOP2NAbMJpTM2TgbW8+/b3ZkFFWiI0cT+5uKyQU8SyioN0Ug8fu7U7TkTng8C
	 8LYdUPBscn04S5CQpRWoEQgMod3EAJtmjpGZBReLR1pLzrIKNLvlyiWvjfZnNb3xqT
	 dKP5XoSHF+VYA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 17:44:53 +0100
Message-Id: <DG22Q420ISG8.169OONC5IKK7I@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
 <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
 <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>
 <DG1Q6I5CTD87.RYS7QBJCHZ7T@nvidia.com>
 <DG222YZ4WT33.21A5GG66K9X5O@garyguo.net>
In-Reply-To: <DG222YZ4WT33.21A5GG66K9X5O@garyguo.net>

On Fri Jan 30, 2026 at 5:14 PM CET, Gary Guo wrote:
> On Fri Jan 30, 2026 at 6:55 AM GMT, Alexandre Courbot wrote:
>> No, I'm starting to believe that the fundamental issue is that the
>> register interface does its I/O backwards, and that design issue is only
>> exacerbated by the recent I/O redesign. I.e. instead of doing
>>
>>   regs::NV_PMC_BOOT_0::read(bar);
>>
>> We should really do
>>
>>   bar.read_reg::<regs::NV_PMC_BOOT_0>();
>>
>> Because that way we can use deref coercion.
>>
>> That's quite a big redesign though, which means I don't believe
>> `register!` can make it this cycle... I'll give it a try though.
>
> Hmm, that's unfortunate, but I think this is indeed a big design change t=
hat we
> should iron out before merging...
>
> I think you're right that if we put the methods on `Io` then all of the d=
eref
> issue would just went away.

I already discussed this with Alex offline and I think we should not take t=
his
direction just because of the Deref issue, as we can easily overcome this w=
ith
using AsRef (or a custom trait).

Whereas the downside of bar.read_reg() is that you end up with a more
inconsistent and complicated API for drivers.

For instance, with the API as is you can do things like:

	register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
	    0:0     reset as bool;
	});
=09
	impl NV_PFALCON_FALCON_ENGINE {
	    pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
	        Self::update(bar, &E::ID, |r| r.set_reset(true));
=09
	        // TIMEOUT: falcon engine should not take more than 10us to reset.
	        time::delay::fsleep(time::Delta::from_micros(10));
=09
	        Self::update(bar, &E::ID, |r| r.set_reset(false));
	    }
	}

and then use this from the driver code like this:

	impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
	    fn do_stuff(&self, bar: &Bar0) {
	        //...
=09
	        regs::NV_PFALCON_FALCON_ENGINE::reset_engine::<E>(bar);

	        //...
	    }
	}

Having to implement AsRef (or a custom trait) for the corresponding I/O bac=
kend
implementations is a pretty minor inconvinience compared to the simplicity =
the
current API provides to drivers.
