Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557F23E35F
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038274; cv=none; b=g1N/MU++YDidOUKgm6tgM3l/MKvOx/RCFZukSKFtOpj6Vblyx/Snx/ij3UVPX9gVdrbG7r1vXk7lBfpxYv1j/0nbwZmsWW7iW30r4TvFizEprgSEhVsomPcWDab8G4TcbRrYP0LBhqgQKEHi1DJZQ/16L0sL0O7W3MVuhrOZyuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038274; c=relaxed/simple;
	bh=ez9bmjX57A284ia8toLzKVmb6ONdNpbqI4Pl6BMbs5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O6btVflV5Si5gt2U6MD+qotQJSqRe79gHOunRB/8XnALwVVMpH+tJOjKU86qL1YdG0c58FaOCT5iwP9c6Yw+Dfw9pEN5tFVBleIYx83mp5EHYq4H5QOJde6W+ePxczqvBG2/e30U0tRIzFDvVtIf4Edyp1ZDHJ4cWKXD2F7+Fs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ey5KmEcN; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ey5KmEcN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774038270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yaacsJbs7+53UVhkwxDkhvqyBamYYq/AMuyWT9p6SAY=;
	b=Ey5KmEcNYzzSZnBR7ihUZ7Qew7rU8Hhsw+kZb57/JgQynxuwEPyFVO/nhKZrO9E+59eKih
	CPle0NDgKJvpOkAC2tksb8xAiA3Rh4k/cIt1ltJTDcg0XiTkphJ6cHGM0NZPcroaMsDXL4
	YzdVb1wgWPq5VjBgoM+XAL6AFPmXVDE=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>,  Alexandre Courbot
 <acourbot@nvidia.com>,  Zi Yan <ziy@nvidia.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Jason Gunthorpe <jgg@nvidia.com>,  Leon
 Romanovsky <leonro@nvidia.com>,  "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: Sashiko.dev for Rust for Linux
In-Reply-To: <1f94cf47-9898-405d-bdf2-29e21cd87528@nvidia.com> (John Hubbard's
	message of "Fri, 20 Mar 2026 12:40:51 -0700")
References: <1f94cf47-9898-405d-bdf2-29e21cd87528@nvidia.com>
Date: Fri, 20 Mar 2026 13:24:24 -0700
Message-ID: <87ldfmtfk7.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

John Hubbard <jhubbard@nvidia.com> writes:

> Hi Roman, Miguel,

Hi John!

> I was delighted with sashiko.dev after just a very quick peek at a
> few of its linux-mm reviews. Up until now, the AI code reviewers
> have often fixated on trivia, but this one goes right to real
> issues that actually matter. Sweeeet!

Thank you!

> So what would it take to get similar results for Rust for Linux?
> (A bunch of us are working on drivers/gpu/nova-core and 
> drivers/gpu/drm/nova, which are written in Rust.)
>
> I'm guessing a combination of "add rust-for-linux to the list
> of mailing lists", and a whole bunch of new Rules/Skills?

Yes, I'm going to add rust-for-linux (will appear ~tomorrow), but a
bunch of patchsets which cc'ed lkml have already been reviewed, please,
take a look.

We don't need any rules/skills to get *some* reviews, but we certainly
might need some prompts to get *better* reviews, both in terms of bug
discovery and false positives. If you'll master something, I'm more than
happy to give it a try.

Thanks,
Roman
