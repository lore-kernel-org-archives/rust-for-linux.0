Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A31E86A
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 18:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714502048; cv=none; b=kIfFfSW1TNjibbnpPj1y29ylWDzN7cZv2DxEAwfEghJGVsyck5FOe8Q21rXiTYdFn44W5WouZaux87i3e0+Oireq262BUHwdJy32zqffPuNP+1qZWuTSV1kkfONpmgVj4Ysf5H+txFeEgSDdjtzv8+VyQVBaBLQBsIVPQbiWIFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714502048; c=relaxed/simple;
	bh=GT0+Is5DsditvGGdlkRExL0wY1hBg9o2sJ2rLRvZ5pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3Pm2whlkaUNGPYjDg3UgPSjHWAof/c4o03XYXgpgmJ3OVEyt+PzGsTypbtmWkD5fZ2LQAeWtr0Ul0+5xDd4m8Qx3lkiYvkGkrKcNx7/eIPZI8N6rErNksRXWQNLugdAAvQdD/WO2gpyNAe+kOzkRhk8VVJF6Ol88SleDAK/QrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Is5e7kDh; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is5e7kDh"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c868e82bf8so995555b6e.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 11:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714502046; x=1715106846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFeElNSXx4xj4SYU6tGp+OaYv0ukyKDbWMi2BiVtLyk=;
        b=Is5e7kDhM1dPIdv3zQWrlKK3Zoi7ZVyPiw6+/hhBZi8aIs7JE4I8k4kmymwQhTyfrZ
         Hr6ucdMJepWdYQ+4xfQVWVkyp4Q2ouWiGGLD1uwjv180bjM9f5kSCnUoPvYwMrgVljVM
         4ewIii97I0RKJH0tvx7NhyPkmhJjFlK5IL40b6RbiJm/yFiNDPbOmZhvZ/XyKAEd74kn
         eSROn2btGiip/zsH+hC6U1gDquecsfHlwqihuitSMcsnp4VEPUNEdghLEine3bpB5he5
         5tlLXBAhLsbzb0RTRLs2wFWIDqiEqBS9aFKdS6+NL9iv18XZDL52QUFwqpmAzd5ZFFhY
         Jc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714502046; x=1715106846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFeElNSXx4xj4SYU6tGp+OaYv0ukyKDbWMi2BiVtLyk=;
        b=pjJUbKIoUGhOgbXgeN8yCNrPHxf6udXdnnSEOl1W90Fo8SsONR0JDVYebGyv9j5+zT
         uETxwpTnM0Or8BUXIWKGCcbI72y3dpcVSjbglc61wIuEjErvatioOC+z8PTORepGlhNl
         pgPmGKzn4QY/LxZKA+tYHljuwYHPsCwWCMnseq5xwBnMQgm0H2PdO4mXB1zR8LlG4YjX
         oYyHlJOacKHhauTWGiNkFG6RrgnQZmpaTX9enxtSppW2S2ThVqQR5ZNc5D4sOqZ7h1CN
         DvjjLqxzvKBjLBOS4G5B+cM+E3rndtvT3kQKxZlZ9DZGRB141wiU+JvGPpNiQK19zDQ2
         QmWg==
X-Forwarded-Encrypted: i=1; AJvYcCUui7QtptExvuj+D+XQXBGrBvOU8DOr11M7T0FthfNRIFjjK/96mwD23/gM6vaiGyp0ITulJW0Cbjf33ZWMvxnGjQR55iGW1eqG+RzJagQ=
X-Gm-Message-State: AOJu0YzflGz6Dcx+WY2pZlV2o/WutQBfOvqYFQBpxiKi9bie7OIdMnGl
	tDu+xN1ar12riu0VZJEUqcCTZ9YtkiRX6CxAAaVxcH/2COzzF2U8
X-Google-Smtp-Source: AGHT+IFFhxw7DQfEDxCzYlslNBpiHYgTnFVfY/8OmbPBXIszUEG0DTjMMrv1TZHk55Scwg7NzhJ0gg==
X-Received: by 2002:a54:4397:0:b0:3c8:64d0:c45e with SMTP id u23-20020a544397000000b003c864d0c45emr438908oiv.30.1714502046228;
        Tue, 30 Apr 2024 11:34:06 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id bz4-20020ad44c04000000b006a067efb28fsm10331534qvb.43.2024.04.30.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 11:34:05 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 1FC491200043;
	Tue, 30 Apr 2024 14:34:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 30 Apr 2024 14:34:05 -0400
X-ME-Sender: <xms:nDkxZmDKiK9RkO-x4eO6u9pxF0tqch1T1P0EyRxozt_gvxa2LTT6jg>
    <xme:nDkxZgiHhrso8Ys8J5FORy0TiskD55NnTdlypIXG3tBhCJeI_odM2D_55McIw2VEu
    G5lgaM_Vo5yoikArg>
X-ME-Received: <xmr:nDkxZpkGWRgO632AMkx3GMEtL-sJbweYOk1SxKHTGOMTa3L0J_oOzWVuQYfvGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepfeejieekffehgfduteeitdeikeeukeevkeevuedthffgveejtdfhgedv
    iedtleeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprhhushhtqdhfohhrqdhlih
    hnuhigrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvd
    eghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtgho
    mhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:nDkxZkyxxGFbLiqZjsWD8HU2bw3619qAHpN26F-qlEgmufBUHSfjTQ>
    <xmx:nDkxZrSJXe6il5AX0udgLC-kZqZq51eh5wNhz55xXdZKX3nGi_r0-A>
    <xmx:nDkxZvb1YRLpfi4Fj1f4T4_y-muIjNO7A5eEeTlmQodsErCmtXo5YA>
    <xmx:nDkxZkRPFlw_cPPubqxn8Xt8C8dumaxEhIHAsl8Pj-H5a8Quq0Bxrg>
    <xmx:nTkxZtCkF1QInrfIDV5k7subxS03uE0UHvMwVM5F0hdzBo4WZVfnJVva>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 14:34:04 -0400 (EDT)
Date: Tue, 30 Apr 2024 11:33:39 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjE5gzb-aDNyK2Xv@boqun-archlinux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
 <ZjAYpsFROI9agY_L@boqun-archlinux>
 <ZjEfW6QpErDDnntk@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjEfW6QpErDDnntk@pollux>

On Tue, Apr 30, 2024 at 06:42:03PM +0200, Danilo Krummrich wrote:
> On Mon, Apr 29, 2024 at 03:01:10PM -0700, Boqun Feng wrote:
> > On Mon, Apr 29, 2024 at 11:01:45PM +0200, Danilo Krummrich wrote:
> > > On 4/29/24 21:52, Boqun Feng wrote:
> > > > On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> > > > > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > > > > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > > > > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > > > > new Vec<T> is created through VecExt<T> extension functions.
> > > > > 
> > > > > This only works since it happens that Unique::dangling()'s value (0x1)
> > > > > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > > > > krealloc() hence treats it the same as a NULL pointer however.
> > > > > 
> > > > 
> > > > Good catch!
> > > > 
> > > > > This isn't a case we should rely on, especially since other kernel
> > > > > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > > > > krealloc_aligned() if Vec<T>'s capacity is zero.
> > > > > 
> > > > > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > > > 
> > > > However, since this commit is not upstreamed yet, so it's suject to
> > > > change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> > > > this patch into that commit in his tree.
> > > 
> > > I'd be surprised if rust-next wouldn't be fast-forward only, is it? If
> > 
> > Well, I cannot speak for Miguel, but there's no guarantee of that IMO.
> 
> @Miguel, which one is it?
> 

Just FYI, linux-next has all the history of rust-next snapshots, in
20230411:

commit ("rust: sync: add functions for initializing
`UniqueArc<MaybeUninit<T>>`") has commit id
2d0dec625d872a41632a68fce2e69453ed87df91:

	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=2d0dec625d872a41632a68fce2e69453ed87df91

in 20230421 (also in the PULL request), the commmit changes its id to
1944caa8e8dcb2d93d99d8364719ad8d07aa163f :

	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=1944caa8e8dcb2d93d99d8364719ad8d07aa163f

The -next branches are subject to rebase for multiples reasons (e.g.
applying a Reviewed-by tag after queued), so the commit id in these
branches is not guaranteed to stay the same.

> > 
> > > fast-forward only, the commit IDs should be preserved on merge, hence it should
> > > be fine to keep the "Fixes" tag.
> > > 
> > > As for squashing fixes into existing commits, this is something I would generally
> > > not recommend doing. This would be a non-fast-forward operation and hence break
> > > potential references to other commits in general (not only "Fixes" tags). Plus,
> > 
> > Yes, but here what you fix is a bug, and generally, if we find a bug in
> > some commit and that commit is not upstreamed, we should rework that
> > commit other than introducing another patch that fixes the bug. It'll
> > provide better bisect and less confusion. It's the same reason that why
> > we don't allow a patch series to include a bug in the middle.
> 
> I can't speak for other maintainers, but AFAICT it's rather uncommon to rewrite
> the history once it has been exposed to the public. It'd be especially uncommon
> for a subsystems's -next branch. See also [1].
> 

That link says:

"""
Some trees (linux-next being a significant example) are frequently
rebased by their nature, and developers know not to base work on them.
"""

and in rust-for-linux.com, it says[2]:

	It is part of linux-next.

So I expect rebasing of rust-next is expected. Normally it won't be a
problem, since most maintainers will maintain the branch in a way that
patches can still be applied on -next branches after rebasing, but
"Fixes" tag may not work due to the change of commit id.

[2]: https://rust-for-linux.com/branches#rust-next

> Patch series shouldn't introduce bugs in between patches, indeed. They should
> also not break the build, neither in general nor in between, for the reasons you
> mentioned. Ideally, this should be fixed before we hit public trees, but if it
> happens, as mentioned above, I think it's rather uncommon to rewrite history
> because of that.
> 

Honestly it's not that uncommon to me, since -next branches are more for
trial and test purposes. There are a lot of testing happening at
linux-next level that I know of, and that's the purpose of linux-next
and -next branches, so fixing a bug in a -next branch is not uncommon.
Plus I generally think a pull request is the same as a patchset, I'd
avoid adding a commit at last saying "this commit fixes a bug introduced
by some commit in the middle".

But once again, it's up to Miguel ;-)

> [1] https://docs.kernel.org/maintainer/rebasing-and-merging.html#rebasing
> 
> > 
> > > it's usually not providing a great motivation for potential contributors.
> > > 
> > 
> > With proper SoB tags and other tags, I don't see a big difference here,
> > or I'm missing something subtle?
> 
> Even though I wouldn't mind personally, my experience has been that people do
> care about the difference.
> 

Thank you, now I see. I think we should work hard on that to recognize
the contribution in mutliple ways. Will keep that in mind.

Regards,
Boqun
