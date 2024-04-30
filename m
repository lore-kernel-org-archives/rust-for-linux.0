Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215E1BED74
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 22:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714515565; cv=none; b=ML/3QTFMDZVFjLwXC/VQfi4o70S2GUd2/3PSrXC6F5G8wqO3wbBvOKQr0SR2en33g7nOzyzFTeCUU+jKuXpWpZx4eW3GkJjswCKlCxMNjIPewGlhEd2E3r0jpyKHEHREB28WkldK5zRICFyfeLP1KCkI0RXlu59YbqG5HdAPQwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714515565; c=relaxed/simple;
	bh=6Dl2SsPuFin61unDVRpZUYuE5CtnRQuLghvTDcmNn+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DqEYXhsU5sGaUU6uwrRxfTEzLyBY/EMbe+CAuxvxP4/w1BP0LmE6BM0BmD4mcd+0w+emJrh8Zvof4muBF5bRRPMhYUF+oMVk5N18dcGvTFQLrhdmX/Po2xSctCZaVy7Q5P37nTURQwOvu3XXs22hd4JIBK/rd5g4ZP8XzaM8MhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NdbvScJw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NdbvScJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714515562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aQLZaPQ2rePen4HBdkTHw/Q0RbzpCP/WAONM9CiBAFg=;
	b=NdbvScJwWwnTuzR7po41TYkisMFal2geBWweUBmbRGSsRf2cOUerDa37mQTYpyaQiRSRjt
	ACm+ZTAF4JZut4QbV7UbMMSi39aYIf/ui7PzlbW5S2KUdfjJE87WLs7uhxTWYCzwdRhMI6
	INu6YmXchBLkT9BVMrjV1e0dyarIrH0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-F1BZATrsMJSi-mCOJHjaKg-1; Tue, 30 Apr 2024 18:19:21 -0400
X-MC-Unique: F1BZATrsMJSi-mCOJHjaKg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-417bf71efb4so1335905e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 15:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714515560; x=1715120360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQLZaPQ2rePen4HBdkTHw/Q0RbzpCP/WAONM9CiBAFg=;
        b=AoJ2Kf2O726JZOLWmo8DTf56Om7aUCf62H0Fv+bSwQDsP0NsIQ1w5h2a267dX4t5fR
         TS+Ds4FI5LZQyWdNHENonCtmzGRfZQGrayFeSbvpPWMueppsrRHFj/COzSY+4eiIqWSs
         dcvRBmWJACudM7OuPBQ6ijSqaDZyuc9D6frXWuAfu6neMNalDTwA/G0dL5x1KdElkQYk
         pLOkK1McpmOLdKjXlb1abScd42OvuyWUwJFcyejLNUy9Ms4a4biUqNjsug2dGAMrglUb
         R4RADka6fER5oM0Fy9WSx9AAGDMVvQSDMkts9OBfw6gSf2njbqvcKBTnCUll3q1cAuw9
         W9kA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Y5H9CThtDlld9TSSVvF9Cn9u8r9Fz+d21CucSlP94UjU92gpondD8N7pkk+ZPI7QyT98sC44sMFJj2LzGoNRsjxePjS4tLXU/tqTJ44=
X-Gm-Message-State: AOJu0Yz7I6/W/rh56SY1EtTN7dRr6N2i+YiGoITSJHvf/sgT3hKcihV3
	Q8rbIodTL80/l3ssN1Pyqf3CuZQ3d3aaoyAiTHZTxaORz6LV+BzW6B4ODUf59Ogwm+I4KV9Ztlq
	J+oCkpcBhAS/oi+pg1K31qJGM8oLUWjbGBu9IgZr+WNWbmNLwStHcGgq99/tgZ2UP
X-Received: by 2002:a05:600c:1f82:b0:41b:8c5c:31b9 with SMTP id je2-20020a05600c1f8200b0041b8c5c31b9mr890926wmb.14.1714515560242;
        Tue, 30 Apr 2024 15:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBYhGnG1qi+Z8raNbpFkl3Xxnmh7Q/HrIcGs8oGXUcewLOS52dNNfM8RSvoGbYRZQSxwefTg==
X-Received: by 2002:a05:600c:1f82:b0:41b:8c5c:31b9 with SMTP id je2-20020a05600c1f8200b0041b8c5c31b9mr890909wmb.14.1714515559825;
        Tue, 30 Apr 2024 15:19:19 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c445200b0041bf21a62bcsm238690wmn.1.2024.04.30.15.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 15:19:19 -0700 (PDT)
Date: Wed, 1 May 2024 00:19:17 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjFuZe1WIUyZ34f4@pollux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
 <ZjAYpsFROI9agY_L@boqun-archlinux>
 <ZjEfW6QpErDDnntk@pollux>
 <ZjE5gzb-aDNyK2Xv@boqun-archlinux>
 <ZjFYvPyTl6UaYSrn@pollux>
 <ZjFbp_XABvDRXIaL@boqun-archlinux>
 <ZjFdzzY6gysrQMnl@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZjFdzzY6gysrQMnl@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2024 at 02:08:31PM -0700, Boqun Feng wrote:
> On Tue, Apr 30, 2024 at 01:59:19PM -0700, Boqun Feng wrote:
> > On Tue, Apr 30, 2024 at 10:46:52PM +0200, Danilo Krummrich wrote:
> > > On Tue, Apr 30, 2024 at 11:33:39AM -0700, Boqun Feng wrote:
> > > > On Tue, Apr 30, 2024 at 06:42:03PM +0200, Danilo Krummrich wrote:
> > > > > On Mon, Apr 29, 2024 at 03:01:10PM -0700, Boqun Feng wrote:
> > > > > > On Mon, Apr 29, 2024 at 11:01:45PM +0200, Danilo Krummrich wrote:
> > > > > > > On 4/29/24 21:52, Boqun Feng wrote:
> > > > > > > > On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> > > > > > > > > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > > > > > > > > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > > > > > > > > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > > > > > > > > new Vec<T> is created through VecExt<T> extension functions.
> > > > > > > > > 
> > > > > > > > > This only works since it happens that Unique::dangling()'s value (0x1)
> > > > > > > > > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > > > > > > > > krealloc() hence treats it the same as a NULL pointer however.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Good catch!
> > > > > > > > 
> > > > > > > > > This isn't a case we should rely on, especially since other kernel
> > > > > > > > > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > > > > > > > > krealloc_aligned() if Vec<T>'s capacity is zero.
> > > > > > > > > 
> > > > > > > > > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > > > > > > > 
> > > > > > > > However, since this commit is not upstreamed yet, so it's suject to
> > > > > > > > change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> > > > > > > > this patch into that commit in his tree.
> > > > > > > 
> > > > > > > I'd be surprised if rust-next wouldn't be fast-forward only, is it? If
> > > > > > 
> > > > > > Well, I cannot speak for Miguel, but there's no guarantee of that IMO.
> > > > > 
> > > > > @Miguel, which one is it?
> > > > > 
> > > > 
> > > > Just FYI, linux-next has all the history of rust-next snapshots, in
> > > > 20230411:
> > > > 
> > > > commit ("rust: sync: add functions for initializing
> > > > `UniqueArc<MaybeUninit<T>>`") has commit id
> > > > 2d0dec625d872a41632a68fce2e69453ed87df91:
> > > > 
> > > > 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=2d0dec625d872a41632a68fce2e69453ed87df91
> > > > 
> > > > in 20230421 (also in the PULL request), the commmit changes its id to
> > > > 1944caa8e8dcb2d93d99d8364719ad8d07aa163f :
> > > > 
> > > > 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=1944caa8e8dcb2d93d99d8364719ad8d07aa163f
> > > 
> > > Yes, linux-next is an exception. But linux-next is also never directly pulled
> > > into Linus' tree.
> > > 
> > 
> > The point is that linux-next merges a snapshot of the -next branches it
> > tracks, and what I post is an example that a particular commit changes
> > its id in rust-next. In other words, you CANNOT assume that today's
> > rust-next will be the final version merged in Linus' tree.
> > 

I meant -next branches in general. As I understood you previously I thought
you're not sure whether rust-next is prone to altering its history. Now, you're
clearly saying it is - noted.

> 
> nor it will be the base of the final pull request.
> 
> In short words, -next branches are subject to rebase for various
> reasons. Commit id from them is not stable, period.

As you just educated me, for rust-next that seems to be case - again, good to
know. Generally, I don't think that's commonly the case though, hence my
surprise.

This throws up a new questions though. Does this mean you'll actually just
squash fixes into commits that are in rust-next only?

> 
> Regards,
> Boqun
> 
> > > > 
> > > > The -next branches are subject to rebase for multiples reasons (e.g.
> > > > applying a Reviewed-by tag after queued), so the commit id in these
> > > > branches is not guaranteed to stay the same.
> > > 
> > > I've never seen that this has been common practice after patches have been
> > > applied already.
> > > 
> > 
> > Here you go:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=105d7c03679002c977e98b13e7a4008cc3933fde
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=692e8935e23efab6c5d5fc4b003816b33c8082f7
> > 
> > in this case, Alice's Reviewed-by was added between different versions
> > (snapshots) of rust-next.
> > 
> > Regards,
> > Boqun
> 

