Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A11A340A57;
	Tue,  3 Feb 2026 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133389; cv=none; b=jjG27szcUVlL2oFAGvTcTvXxSFVyjZLyCyAW3phfOSmiz03SLvOWLwJnsSIXvhy6U/wqYrdA0cV2a4nDBsaoHCHyCs4qvCqa4KOvdmyrw76gNndY6ES45xrFpub1PjpeEKefY3PmTN4JFU5ubpWoWm3oxvFJXr0KNs1ajV/nZgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133389; c=relaxed/simple;
	bh=KTztaF7NCwuXH6g5u6JY8qtgA6BlX+gK6mzaO5/CZ3U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=t1H+4kHiymZg8wD59dQN5RPgfwnEmQ5D7To5ew3Ft0EW1vG8hNIxsROw+zPnk7jsT+tofKbv+vLBLuB+1TsCH8VpLkjK+sYeEF1sbRnWHAfKHVl/6pDYTapUZydbxN4quRFOzwW5Lr6IvVCHB+gl9Dq3E0HEObMXjP40IIsELzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rD3VT37A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rD3VT37A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E0BC116D0;
	Tue,  3 Feb 2026 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770133388;
	bh=KTztaF7NCwuXH6g5u6JY8qtgA6BlX+gK6mzaO5/CZ3U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rD3VT37ApTLFgQmD/4t98Lrriyo5CkC90Da6SVQmz91cR0RZmR/8aeIWfnuWcyAz+
	 PolxWifKF/kgHc2cWfFE4DGyFLuC01yY6UJmozlXPzppd2fV9aRzV+NPYTeDy7i1Fq
	 4ve4tgXiQe78RLcSgi+GsCi2IN6AnzJb4DkfVv9apByvShQVuy727xH2cHJBMzXI6z
	 yHWDEczEQtjNa47eHYezg09GCGV2cTNpuqmq39HGC6hZ3kCIXdli+QYN0xpAyZy3lS
	 fcwUk96PTRRyQ7R+jeFqiFyKKu8O+xpQJ6od7kb41Ri3y7zNyA86pQo7sO55uZM8PQ
	 EfDhj61rKQIYA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:43:05 +0100
Message-Id: <DG5FWZ2CA3DR.2WBZ27YUYS705@kernel.org>
Subject: Re: [PATCH v2 1/3] rust: alloc: Add shrink_to and shrink_to_fit
 methods to Vec
Cc: "Shivam Kalra" <shivamklr@cock.li>, <cmllamas@google.com>,
 <gregkh@linuxfoundation.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260131154016.270385-1-shivamklr@cock.li>
 <20260131154016.270385-2-shivamklr@cock.li>
 <DG5FEPO6RCK4.17KOY7PRLNFKV@kernel.org> <aYIWd9wzPIRa4gZc@google.com>
In-Reply-To: <aYIWd9wzPIRa4gZc@google.com>

On Tue Feb 3, 2026 at 4:38 PM CET, Alice Ryhl wrote:
> On Tue, Feb 03, 2026 at 04:19:14PM +0100, Danilo Krummrich wrote:
>> On Sat Jan 31, 2026 at 4:40 PM CET, Shivam Kalra wrote:
>> > This implementation guarantees shrinking (unless already optimal),
>> > because the kernel allocators don't support in-place shrinking,
>> > a new allocation is always made.
>>=20
>> I'm not sure we should go in this direction. There is a reason why kreal=
loc()
>> does not migrate memory between kmalloc buckets, i.e. the cost of migrat=
ion vs.
>> memory saving.
>>=20
>> For Vmalloc buffers the story is a bit different though. When I wrote vr=
ealloc()
>> I left some TODO comments [1][2].
>>=20
>>   (1) If a smaller buffer is requested we can shrink the vm_area, i.e. u=
nmap and
>>       free unused pages.
>>=20
>>   (2) If a bigger buffer is requested we can grow the vm_area, i.e. allo=
cate and
>>       map additional pages. (At least as long as we have enough space in=
 the
>>       virtual address space.)
>>=20
>> So, I think we should just use A::realloc(), leave the rest to the under=
lying
>> specific realloc() implementations and address the TODOs in vrealloc() i=
f
>> necessary.
>>=20
>> [1] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4162
>> [2] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4192
>
> If kvrealloc() does the right thing, then let's use it.

It should once the TODOs of vrealloc() are addressed. The reason I left the=
m as
TODOs was that I didn't want to implement all the shrink and grow logic for
struct vm_area without having a user that actually needs it.

If binder needs it, I think we should do it.
