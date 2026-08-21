Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B530356775
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 07:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296395; cv=none; b=J3YJ/ASHgjz/Fv+uVg3fauga1MHaF7saKecc0N1wsimqXqOj0EkWLhMqF0BPqtzJuO1ATzif3AaRYJbnpCk98FAOEc+yISGDFB/93yefe7D50Kn/ltpMu/wrDjclZ2vGOTFK1mtDW6T/oFUrl1ZwZTSBDRwkLbFPAXEXJ40FiIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296395; c=relaxed/simple;
	bh=K13jPROyA/SxqoX5a34moc9A2ZcQbZihI+87Eya5aic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UesbTT8vo9+esx2qcRehBV/SbMzpRN+LfWDC0cYVp5YZp+bB/2Ah/3qqnshqIqNhUXzOFHhiTrP1rvzC0UWZA4hURab5QMP5Ti74M/kkOtV8Vfmpxpy9B9dhL3rhxw3JN4cYKFYTV6TM0MaEhB/8bhSgUXBoHjDEFy4f9bJBT/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNFvcjHw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNFvcjHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB211F000E9;
	Fri, 21 Aug 2026 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787296393;
	bh=VqXclXpWiLSHi10FKtUCd5Dig9jRtGHDmAYrRVjea8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jNFvcjHwRlOz13GRW28IzMe1Q81hR/SMct9I3PZ7A/yAjaBKaVJ5b3K/TMwUU0DlG
	 65bRf5GUaCDnI5ZW0Bg4tKjykaJaYWMBndBgppP9hhzeV6SCCoM0JzMBR7I2Mrc03g
	 lLyn/pOtOg1r1+/iWP+d/y9g9AJTRYd9dFYHnLqVIWhcU6YcSQCZQXjkT6Hkx+rKBW
	 Rmnml2PBgcCcfxeDkPMsNJqLZ/YYNAjOb58kYWIUQToB61s+Rss1JlKGfUDoPcpuxl
	 ETCYhCDImomxN55FQstevM95XhWJ3BU2twi17xEK50+IALMWE6msThTRdZjGhVNACC
	 HpWIwSQjvJdGA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@flapping.org, gary@garyguo.net, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent arming
In-Reply-To: <20260820.215332.1257209020327006274.tomo@flapping.org>
References: <87h5kp88uy.fsf@kernel.org>
 <20260820.182114.956582163653669626.tomo@flapping.org>
 <87ecft7yyf.fsf@kernel.org>
 <20260820.215332.1257209020327006274.tomo@flapping.org>
Date: Fri, 21 Aug 2026 09:13:01 +0200
Message-ID: <87bjaw7xqa.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Thu, 20 Aug 2026 14:34:16 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>>>> We discussed this at the call last night. We came to the conclusion that
>>>> we would like to experiment with the solution outlined by Gary, where we
>>>> inject `expires` into the callback handler, and the callback handler
>>>> returns a forward duration in addition to a restart value. Because with
>>>> that approach, we can avoid adding complexity to the Arc end of the API.
>>>> 
>>>> For the best implementation of this scheme, we probably need to change
>>>> some bits in the C code, add an additional path. Down the line, we could
>>>> also see how man callers of the C code can be changed to use this
>>>> pattern.
>>>> 
>>>> Do you want to send a patch based on this solution Tomo?
>>>
>>> https://lore.kernel.org/rust-for-linux/20260814.084700.1697518597717457311.tomo@flapping.org/
>>>
>>> The solution that we discussed before, right? It changes how the
>>> hrtimer core calls the callback. If the C maintainers take that, I
>>> will do the Rust side for it.
>> 
>> Yes this one. We don't know if C maintainers will like it. We were
>> discussing having a separate path on the C side just for just,
>> alternatively converting C side callers.
>> 
>> I think we should be able to reach some kind of agreement with C
>> timekeeping. But if not, we can solve it on rust side only, but less
>> efficient. We can grab the base lock again, read expires, then drop the
>> lock. But better to do it in the C code.
>
> The Rust side cannot take the base lock: lock_hrtimer_base() is static
> in kernel/time/hrtimer.c, internal to the core. So that way needs some
> agreement with the C maintainers as well.

Right, we would have to export the symbol, or a function for this
purpose. But it is a smaller change to C code. I would prefer we solve
it properly though, not with hacks.


Best regards,
Andreas Hindborg

r

