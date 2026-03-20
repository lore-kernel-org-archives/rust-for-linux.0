Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5963E25CC74
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774040983; cv=none; b=sM7Pd5ZIcCQeISz7mVhObeI9aaZRaUR0iBCYsSmnRllfoC66wUTAHKF9MDyV6TUkpo3hJ1SGQRSBulU2hWCwu9VUTBcUsySxp4ulzv+JYhc3f5WPnz+wd40MvRyk6+m/+GBvBtD00HW3KvhyF4Mc0FY/RKYYfFqEvEsJxO4gwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774040983; c=relaxed/simple;
	bh=jGS9ukgeoAs73+W9gf2Ra/M5j0ioiTjUBEVhBKesogI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t4HWUsRn5YkhUP2xr6uef1fep+bDmDdUZFcLZNhOdxP7xr6aCt9hUmsG599vYJ6+Gy5o/fdR/d47j59iE5o7Abm+Hj5ZxURq3jjZbY/HJLuJL7xNFzeWJQASBYvZANM3BVMwjpXyDPq3Ghge2kNqDbFVSbsKihdpHYdF2WYrU0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WhFREyC8; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WhFREyC8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774040979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LdazZRUKPM4vpFTCoVH7q3Sgf/OigaeYxeWW6aTMgO8=;
	b=WhFREyC8EnejfQg0iYOyCaFeE33b9AE6YqRim1Rhn9Wbph6l+wN0VeURU3qVaNhQV41mgQ
	FyzgM8JaReUxeqVyGfXoOBZojJgz98by+LeJkBVkplS47HDa+KDx0rAHO+ieGqnfj+k7Nx
	BDZevr1nxMjXvNghK7H5iFKYuuIt4wU=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "Gary Guo" <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>,  "Alexandre Courbot"
 <acourbot@nvidia.com>,  "Zi Yan" <ziy@nvidia.com>,  "Andrew Morton"
 <akpm@linux-foundation.org>,  "Jason Gunthorpe" <jgg@nvidia.com>,  "Leon
 Romanovsky" <leonro@nvidia.com>,  "linux-mm@kvack.org"
 <linux-mm@kvack.org>
Subject: Re: Sashiko.dev for Rust for Linux
In-Reply-To: <DH7W8TLZAKUB.2E0Q2VS546HBS@garyguo.net> (Gary Guo's message of
	"Fri, 20 Mar 2026 20:32:10 +0000")
References: <1f94cf47-9898-405d-bdf2-29e21cd87528@nvidia.com>
	<87ldfmtfk7.fsf@linux.dev> <DH7W8TLZAKUB.2E0Q2VS546HBS@garyguo.net>
Date: Fri, 20 Mar 2026 14:09:33 -0700
Message-ID: <87a4w2tdgy.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

"Gary Guo" <gary@garyguo.net> writes:

> On Fri Mar 20, 2026 at 8:24 PM GMT, Roman Gushchin wrote:
>> John Hubbard <jhubbard@nvidia.com> writes:
>>
>>> Hi Roman, Miguel,
>>
>> Hi John!
>>
>>> I was delighted with sashiko.dev after just a very quick peek at a
>>> few of its linux-mm reviews. Up until now, the AI code reviewers
>>> have often fixated on trivia, but this one goes right to real
>>> issues that actually matter. Sweeeet!
>>
>> Thank you!
>>
>>> So what would it take to get similar results for Rust for Linux?
>>> (A bunch of us are working on drivers/gpu/nova-core and 
>>> drivers/gpu/drm/nova, which are written in Rust.)
>>>
>>> I'm guessing a combination of "add rust-for-linux to the list
>>> of mailing lists", and a whole bunch of new Rules/Skills?
>>
>> Yes, I'm going to add rust-for-linux (will appear ~tomorrow), but a
>> bunch of patchsets which cc'ed lkml have already been reviewed, please,
>> take a look.
>>
>> We don't need any rules/skills to get *some* reviews, but we certainly
>> might need some prompts to get *better* reviews, both in terms of bug
>> discovery and false positives. If you'll master something, I'm more than
>> happy to give it a try.
>>
>> Thanks,
>> Roman
>
> Hi Roman,
>
> First of all, great work. It has already produced useful review on my
> patchsets.

Thanks!

> I've seen a few false positives on Sashiko which seems to be that it understands
> the Rust code from an userspace Rust perspective and doesn't know some of our
> unique constructs (most notably, the way we handling bindings/FFI).

Yeah, I'd imagine that adding some rust-for-kernel prompts should help a lot.
>
> I'm preparing some prompt changes locally and am testing these out, to see if it
> reduces false positives. It appears to me that the prompt for Sashiko is from
> https://github.com/masoncl/review-prompts? If I made a PR there it would
> eventually land in Sashiko, too, right?

Yes, I'm using some prompts from Chris's repository, but not all of
them. We're in touch with Chris and thinking how to better share them.
As of now, anything works, send them either way, we'll figure out the
syncing part.

Thanks,
Roman
