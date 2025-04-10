Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64808204698
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291997; cv=none; b=mYjxYnZRhJUumnt1qJnO7TkbFeQ7oKYp060z0FfLeEg1YejlFk7Ux3PrSjq+FuWhY2AZsBszf3V0OL9WF0c9oFHUtrHCtSvsygW58xWqeAWUPP6+gFy9THoNeSRfjWeJAKmOjJcj8NuvPGMq5otnHj9ZJ2fTjkf7hNnMMrHTHs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291997; c=relaxed/simple;
	bh=Ri5yWvQENvN1t230l4xZbsz6aSW3kUIvshAHk35DaaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVfwP6z0Tn+uYlTMpcKFp6BmNQd68CtuI281vdya1hzXPK6LWOfrrObuEZiemGZYozz5eRxM5y5zZNycdzl1pktdvKKogYAsJaldfd+akwunEsySIdhzceuwhJiX0r9EV1+OvSRxPF/+5AVEyAyefJQtP9NMVYjBc/Kqc9LtgoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuwAVkkU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuwAVkkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF84C4CEE8;
	Thu, 10 Apr 2025 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291996;
	bh=Ri5yWvQENvN1t230l4xZbsz6aSW3kUIvshAHk35DaaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuwAVkkUQ81NiCjpJSe6/GTjRQNGLL2v9KzZqy//mQtfdcVlAh/nXCCNIn8NxuyYv
	 hvWOvdsjI1ulVxmUx6NJFttSxSNQT151ltRlOxKJfskaiKKY+wtI/vdpDOprBE2GNU
	 zm4w7MAF/66g5UGhByVVHvntNA8v8NR6kvmbMUpES33ZsvvCQo/FW4dLcdF2SYwTcB
	 16uF5m/n4sUcdpqLjLQEVEpeHu3+f0ogAaShBLDtm1PC6TVsedIcuKNUal2uPDOSVP
	 M+cG4hCd5YfLPD8C353ikEg0F0dPP7gSdg7IRLTowjg4bA4xZNCynee/5VW+S5ESUA
	 U+63oL6CGjL1A==
Date: Thu, 10 Apr 2025 15:33:09 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Asahi Lina <lina@asahilina.net>
Cc: Dave Airlie <airlied@gmail.com>, maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de,
	lyude@redhat.com, acurrid@nvidia.com, daniel.almeida@collabora.com,
	j@jannau.net, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] DRM Rust abstractions
Message-ID: <Z_fIlXzMGj_6lmzZ@pollux>
References: <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae>
 <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
 <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
 <34a4a130-98d1-4cc3-8dcf-b72b3ed36c10@asahilina.net>
 <43ec8aba-f279-422d-95d1-68daac7eaed9@asahilina.net>
 <Z_ecMl2QtAssfczJ@pollux>
 <88270028-7541-4184-a118-96c182109804@asahilina.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88270028-7541-4184-a118-96c182109804@asahilina.net>

I'm only gonna reply on the things that may be relevant for other people too. I
don't really care about anything else.

On Thu, Apr 10, 2025 at 09:37:39PM +0900, Asahi Lina wrote:
> On 4/10/25 7:23 PM, Danilo Krummrich wrote:
> 
> Just because I stepped back doesn't mean you can't send me an email to
> ask a question to make sure you get upstreaming my code respecting my
> wishes for attribution.

You send out a mail to me and other people, that you'll step back from kernel
development and additionally told people:

"Please feel free to take anything that's useful from my past patch submissions
or the downstream branches and use it/submit it in any way."

But then...

> > However, I understand that you prefer to have primary authorship, even if the
> > code has been re-organized in new commits, moved, modified or rewritten.
> 
> Correct.

...you say this.

To me this is contradictive, but I think we can agree that it is at least
ambiguous.

I suggest you to reply to your original mail and clarify this for other people
as well.

Otherwise you may see yourself in the same situation again, sooner or later.

Also because this is uncommon, no one expects that. Ususally - and that includes
me as well - people are much more worried to be misrepresented as the author of
stuff that has changed too much from their original code.

> > This really is *totally* fine for me, and I won't argue about it (even though
> > one could).
> 
> Continuing to mention that "one could" and previously "even though I do
> think my changes do justify how things are currently" means no, you are
> not totally fine with it, and you are in fact arguing about it.

No, I can be totally fine to comply with your request and still be convinced
that what I went with was reasonable.

I even had to point this out, since otherwise it can be read as if I would not
be convinced that I did the correct and reasonable thing.
