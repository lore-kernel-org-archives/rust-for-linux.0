Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D88F6E
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714510023; cv=none; b=CK6by8OpGQxFZuC3fyge1eWuBeAbf2EbYbrCkD5t5f/GQbe6qA4dwfbYnz3Rm0St19AoLoPp/RSQrbcLDHmpVB+aDpJsn5EqZ3sfmsaRyzjdCa+xADdD9Nqq7voP7tOck/7jJ77qTHgySaTNNsy9WUCr1Ku040QJF87d+FgqB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714510023; c=relaxed/simple;
	bh=ActEC6b+rWE2hyzRdcGqWqI3nh/C6bWskrSsPADgetE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LWT0RVirWxq6M5lu57X/NJAz5MrofT0usxqQ7DSC14Kf00uwu67/6ArChU2R+dpbu6+oy726rCdskDC1yzR4utho06YessM2KXSZhNABRuOWTeAmQQ6qm4DBhtWHTGauTHU/rDmyFqTnjmi+yVwkwg3VPTKS10FMi/ERWDKmYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WtGe4r2g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WtGe4r2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714510019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSFiebe8MEEIfLeQuA2+fefPEZ8FBYHQWNDgf8cy0XM=;
	b=WtGe4r2g4oYiCSd1MYGdjgmC7Nrpdph/OxTU5wcJmWZIJoIW6Ge4Fmo9PzVSHqp3LXYZvW
	AOj7BoQKxlwCnoTdL3UlVKWcnPuY6YttK+NwTfwpCPMajCI6zzrbvBe3do2gHohSoSlWxg
	H47rGfLA3t8yjPbaka82IZeZFSk1qkQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-Q1uxG9UdNJWQaKWPCttujw-1; Tue, 30 Apr 2024 16:46:58 -0400
X-MC-Unique: Q1uxG9UdNJWQaKWPCttujw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34dc66313b3so68455f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 13:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714510017; x=1715114817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSFiebe8MEEIfLeQuA2+fefPEZ8FBYHQWNDgf8cy0XM=;
        b=iZAA1uPXFIoRMyyJ2poaM/bRcHvF03Yxei6zw3S/pDViEV00TQCdZMkg+EJW17h+lO
         HF2mJUzlHh6zRH9w39sTDlqsSWsssLJNfIcjNSIfK9BPSItCn6ET6YCwMATLE7tXsshz
         uepb5nyg+ifmHgE8lMqOL8PgTjaIfzn4qP5JBTb2BTRwgO1vwfdGJXVUn47Y3Mut8EfL
         uWxbPuXiFUsl5W1lEPodr5gvmLGvFxsV3nmMVFeJ/WQSKjqA9waRiXOjRz+KOoiF9506
         byWUwKZZ6qZAQAuTBlElWMdTPzH8LsO+gIa6Y4pClc+Vb+NW1Q/OijSUh0XA8Fo9sbqH
         pbGA==
X-Forwarded-Encrypted: i=1; AJvYcCWZNZ1bNYJO0c8ieNxf6GqsUQ1EkrorCq0OSGctbM+nNKpclhbdaTIFf6OPgogKFWXTPpuaUUSKWbFOPS7hBW4lqg3ynvlEzRDhqQ7Q/No=
X-Gm-Message-State: AOJu0YxMQnc4v9uxvEU7GYZR3rCebcj3QlhLk7J4Qd39lAZZbr2QC6zz
	vMCETGb/G6gzr/xgJ+u5VUHwUvA8t10Uyj7ibv9T9mrMxuL1kdKA1daT4ElbcNP0aG5LUpNKOIi
	MdF3+5+GfkAb0vutycrlqD1IIfBSBuTuRE3mpBdIPASHKQcPYiRfzIIj2rihmzNh+YOiCd4S7
X-Received: by 2002:a5d:6549:0:b0:34d:9066:dd81 with SMTP id z9-20020a5d6549000000b0034d9066dd81mr709893wrv.47.1714510016787;
        Tue, 30 Apr 2024 13:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgwTrPeGRetINL8gD+aVzNq7qZhwIGThWRSSMb8PjWwgpNwwZmm4ayB1obXz2aFqzfK2Ajzw==
X-Received: by 2002:a5d:6549:0:b0:34d:9066:dd81 with SMTP id z9-20020a5d6549000000b0034d9066dd81mr709879wrv.47.1714510016430;
        Tue, 30 Apr 2024 13:46:56 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id s20-20020adfa294000000b003455e5d2569sm11979933wra.0.2024.04.30.13.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 13:46:55 -0700 (PDT)
Date: Tue, 30 Apr 2024 22:46:52 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjFYvPyTl6UaYSrn@pollux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
 <ZjAYpsFROI9agY_L@boqun-archlinux>
 <ZjEfW6QpErDDnntk@pollux>
 <ZjE5gzb-aDNyK2Xv@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZjE5gzb-aDNyK2Xv@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2024 at 11:33:39AM -0700, Boqun Feng wrote:
> On Tue, Apr 30, 2024 at 06:42:03PM +0200, Danilo Krummrich wrote:
> > On Mon, Apr 29, 2024 at 03:01:10PM -0700, Boqun Feng wrote:
> > > On Mon, Apr 29, 2024 at 11:01:45PM +0200, Danilo Krummrich wrote:
> > > > On 4/29/24 21:52, Boqun Feng wrote:
> > > > > On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> > > > > > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > > > > > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > > > > > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > > > > > new Vec<T> is created through VecExt<T> extension functions.
> > > > > > 
> > > > > > This only works since it happens that Unique::dangling()'s value (0x1)
> > > > > > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > > > > > krealloc() hence treats it the same as a NULL pointer however.
> > > > > > 
> > > > > 
> > > > > Good catch!
> > > > > 
> > > > > > This isn't a case we should rely on, especially since other kernel
> > > > > > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > > > > > krealloc_aligned() if Vec<T>'s capacity is zero.
> > > > > > 
> > > > > > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > > > > 
> > > > > However, since this commit is not upstreamed yet, so it's suject to
> > > > > change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> > > > > this patch into that commit in his tree.
> > > > 
> > > > I'd be surprised if rust-next wouldn't be fast-forward only, is it? If
> > > 
> > > Well, I cannot speak for Miguel, but there's no guarantee of that IMO.
> > 
> > @Miguel, which one is it?
> > 
> 
> Just FYI, linux-next has all the history of rust-next snapshots, in
> 20230411:
> 
> commit ("rust: sync: add functions for initializing
> `UniqueArc<MaybeUninit<T>>`") has commit id
> 2d0dec625d872a41632a68fce2e69453ed87df91:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=2d0dec625d872a41632a68fce2e69453ed87df91
> 
> in 20230421 (also in the PULL request), the commmit changes its id to
> 1944caa8e8dcb2d93d99d8364719ad8d07aa163f :
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=1944caa8e8dcb2d93d99d8364719ad8d07aa163f

Yes, linux-next is an exception. But linux-next is also never directly pulled
into Linus' tree.

> 
> The -next branches are subject to rebase for multiples reasons (e.g.
> applying a Reviewed-by tag after queued), so the commit id in these
> branches is not guaranteed to stay the same.

I've never seen that this has been common practice after patches have been
applied already.

> 
> > > 
> > > > fast-forward only, the commit IDs should be preserved on merge, hence it should
> > > > be fine to keep the "Fixes" tag.
> > > > 
> > > > As for squashing fixes into existing commits, this is something I would generally
> > > > not recommend doing. This would be a non-fast-forward operation and hence break
> > > > potential references to other commits in general (not only "Fixes" tags). Plus,
> > > 
> > > Yes, but here what you fix is a bug, and generally, if we find a bug in
> > > some commit and that commit is not upstreamed, we should rework that
> > > commit other than introducing another patch that fixes the bug. It'll
> > > provide better bisect and less confusion. It's the same reason that why
> > > we don't allow a patch series to include a bug in the middle.
> > 
> > I can't speak for other maintainers, but AFAICT it's rather uncommon to rewrite
> > the history once it has been exposed to the public. It'd be especially uncommon
> > for a subsystems's -next branch. See also [1].
> > 
> 
> That link says:
> 
> """
> Some trees (linux-next being a significant example) are frequently
> rebased by their nature, and developers know not to base work on them.
> """

It also says that: "History that has been exposed to the world beyond your
private system should usually not be changed."

> 
> and in rust-for-linux.com, it says[2]:
> 
> 	It is part of linux-next.

Which should just mean it's regularly merged into linux-next.

> 
> So I expect rebasing of rust-next is expected. Normally it won't be a
> problem, since most maintainers will maintain the branch in a way that
> patches can still be applied on -next branches after rebasing, but
> "Fixes" tag may not work due to the change of commit id.

I don't see how the exception of the linux-next tree propagates to rust-next.

> 
> [2]: https://rust-for-linux.com/branches#rust-next
> 
> > Patch series shouldn't introduce bugs in between patches, indeed. They should
> > also not break the build, neither in general nor in between, for the reasons you
> > mentioned. Ideally, this should be fixed before we hit public trees, but if it
> > happens, as mentioned above, I think it's rather uncommon to rewrite history
> > because of that.
> > 
> 
> Honestly it's not that uncommon to me, since -next branches are more for
> trial and test purposes.

The -next branches (including rust-next) typically carry the patches which are
queued up to be merged in Linus' tree for the next merge window.

Those branches are not for trail and test purposes. Testing of the patches must
happen before.

Their purpose is more to let things cook a while to spot potential unexpected
regressions.

> There are a lot of testing happening at
> linux-next level that I know of, and that's the purpose of linux-next
> and -next branches, so fixing a bug in a -next branch is not uncommon.
> Plus I generally think a pull request is the same as a patchset, I'd
> avoid adding a commit at last saying "this commit fixes a bug introduced
> by some commit in the middle".

For a patch series, no question. For a whole subsystem pull request, it's a
whole different scale. Maybe it scales for rather small trees though.

> 
> But once again, it's up to Miguel ;-)
> 
> > [1] https://docs.kernel.org/maintainer/rebasing-and-merging.html#rebasing
> > 
> > > 
> > > > it's usually not providing a great motivation for potential contributors.
> > > > 
> > > 
> > > With proper SoB tags and other tags, I don't see a big difference here,
> > > or I'm missing something subtle?
> > 
> > Even though I wouldn't mind personally, my experience has been that people do
> > care about the difference.
> > 
> 
> Thank you, now I see. I think we should work hard on that to recognize
> the contribution in mutliple ways. Will keep that in mind.
> 
> Regards,
> Boqun
> 

