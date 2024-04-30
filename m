Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2171A0B07
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714511340; cv=none; b=kIPD4Y6OOmmANO4+qo63JFMkxGwmPtUjMfrA5Uak9N8z6ZAez1R4nsCyEOMvbOwDHbS0vHBy81P20UyLB7/DMX1an/zAVOYIspDrqwmi24UJTjL8RraEoDt6biaEzKRcKoZ//fyHptt7AHQ199JeclWQLkFlxgzHkHr0f2l1sy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714511340; c=relaxed/simple;
	bh=bidcV/+uIuLSsYtXjy/J0NTWm8G4yGBrzncLO6EFoYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEUPaNR65vjXY51CUkz8zmUsq2f/ETy3W5wkPQ6fpCDK355ny+cOw9bsBZ9dA2lH7VgqEQ/h10p1njSRLQu9csXSTWeeoSae7/Uw6b7iclLsJsiWAluKZsjuH/0OeMSzBpkJLzwNZVh1IPUpNv3NLtppfMaLTViLIIx0dyVwl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsth2+9V; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsth2+9V"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-434d0a63151so36414681cf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714511338; x=1715116138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha903Iv4WN8AbabpYQYoqNkAwZ7CTZzHbHRaWvCUPZk=;
        b=dsth2+9V3u0uK0e0KAM79N1uUOTp2R0FFv0iFzWVlWPnV/2jTmQy1J1su9tJpqgKgM
         GzKOak2mVMcmYwYgRHmFNB2LMSksWM/iHbU0yDJwu3hLCnwGqSze+ioveFwzrdsTbBVG
         uirFoEmU9iRj82BUNTyOfJ6fnxOkevzKRA4XfQqS79wAt3jAp9rBK7Hi7VUQ4OCAEHdp
         SS/hNyNQtaxxpZxHKKDjDOYqwuZxMSKWZIFeHdncCvBTof7tDx3nSqGuGSjeUWL6W8ZT
         MDNL+T1Twe1gWosClfG8LtN4FjofFiIfod5Yro99WNpIGh8DANzNJLsg9VTmdinI0wtU
         t54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714511338; x=1715116138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha903Iv4WN8AbabpYQYoqNkAwZ7CTZzHbHRaWvCUPZk=;
        b=NzjLUHJS1PUBr1Q/CbG0j6WLg9gwdQYTUNbhQ/xNebF62662SNA+AplAvmz1cUx/UM
         WyTwnNfjC7/APqOcOXg0H/9MSJMIm2Ot61XagzjFgnSNY06NfpZ0WAY+rO7NOkZLSLhT
         tfHEkFI4de23U67XIb/O7slsLYlFBghIXDlToIQWmS1ujA9JDyrErZ0s7EvWELIs3xj/
         8h+093kjiVaO8CjGcKVnjZTou0O38fPAndrU4VPh+qDzizdL3jJm++gh3qVEAcd9zh5g
         UX7fpwtDyNw19QV56gB+gGgOacqU8+8g2DNs75rLbfS61Gp9UK3s/+Wx1/s4yyWxfUvW
         ZfCg==
X-Forwarded-Encrypted: i=1; AJvYcCVg+UrhTfVHs+bzBnfG/8cay8L+Tk9trpdPcPLThS3Y38/Q/sjoi6X+G3GgD6ZBq/hmUyCt8KM4yTJSb47PSrzR3aHufoSXYOFekrBPGXs=
X-Gm-Message-State: AOJu0YzuQkCFgI190/pEci2Z2OmKeuiZNx5MkKggp95JvaPbx0/zrSJ0
	msxPEJ1soHosoEmNBocN6SwAt8vtchFtb93BGWyn8uyk4UMzhS4/AAJ/RA==
X-Google-Smtp-Source: AGHT+IHd6F53zsuS3SvjiHtGcGmnsRnfAK+uRl7r+f/6d/GvPn8azB0FtKYrNHRYYeyYJAaVIY6XpQ==
X-Received: by 2002:a05:622a:308:b0:43a:ffb9:e7e0 with SMTP id q8-20020a05622a030800b0043affb9e7e0mr496452qtw.38.1714511337911;
        Tue, 30 Apr 2024 14:08:57 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id z1-20020ac81001000000b00434ee466ea6sm11639091qti.22.2024.04.30.14.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:08:57 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 037C11200032;
	Tue, 30 Apr 2024 17:08:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 30 Apr 2024 17:08:57 -0400
X-ME-Sender: <xms:6F0xZhwM9I2IF5aeOESGDyoXMf0H15S9jBq4xgHBZrfUnmDErv8zzA>
    <xme:6F0xZhRskG3dlYRYSV_hXShKw1uUbg1Zy-ePg1JunEoA51KPvfo7-tgV8I6r3fqxA
    5e2rThT6BVwLRqa3A>
X-ME-Received: <xmr:6F0xZrVUaFnvi6T38O5Di3O4_81olEaNOcVUprjjFPTVzMariH8otdsoP5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeeg
    vddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:6F0xZjgbRh8wXckHnHEoR2JrP_zMQgYlbwEiLX9-Dw7c06ByaaZ72Q>
    <xmx:6F0xZjCrMTEoaZ5ybSzOkME-4VGb_SQo0jiZMNbyGxTIEVvbeZzzGQ>
    <xmx:6F0xZsKfGYP_e5DMVVch7RV-Pl1Jzdw1KuJMkWLZZCTy1Eewcnp_Gw>
    <xmx:6F0xZiDj5sz625_xXHrylJX77JHVr-dJ110t6RerbIUoGpELxZUMiQ>
    <xmx:6F0xZnxBjtgq7wycU2-31jxMfavnDTVQPkgFZ3DJprB2dO2dyA7qowpO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 17:08:56 -0400 (EDT)
Date: Tue, 30 Apr 2024 14:08:31 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjFdzzY6gysrQMnl@boqun-archlinux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
 <ZjAYpsFROI9agY_L@boqun-archlinux>
 <ZjEfW6QpErDDnntk@pollux>
 <ZjE5gzb-aDNyK2Xv@boqun-archlinux>
 <ZjFYvPyTl6UaYSrn@pollux>
 <ZjFbp_XABvDRXIaL@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjFbp_XABvDRXIaL@boqun-archlinux>

On Tue, Apr 30, 2024 at 01:59:19PM -0700, Boqun Feng wrote:
> On Tue, Apr 30, 2024 at 10:46:52PM +0200, Danilo Krummrich wrote:
> > On Tue, Apr 30, 2024 at 11:33:39AM -0700, Boqun Feng wrote:
> > > On Tue, Apr 30, 2024 at 06:42:03PM +0200, Danilo Krummrich wrote:
> > > > On Mon, Apr 29, 2024 at 03:01:10PM -0700, Boqun Feng wrote:
> > > > > On Mon, Apr 29, 2024 at 11:01:45PM +0200, Danilo Krummrich wrote:
> > > > > > On 4/29/24 21:52, Boqun Feng wrote:
> > > > > > > On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> > > > > > > > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > > > > > > > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > > > > > > > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > > > > > > > new Vec<T> is created through VecExt<T> extension functions.
> > > > > > > > 
> > > > > > > > This only works since it happens that Unique::dangling()'s value (0x1)
> > > > > > > > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > > > > > > > krealloc() hence treats it the same as a NULL pointer however.
> > > > > > > > 
> > > > > > > 
> > > > > > > Good catch!
> > > > > > > 
> > > > > > > > This isn't a case we should rely on, especially since other kernel
> > > > > > > > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > > > > > > > krealloc_aligned() if Vec<T>'s capacity is zero.
> > > > > > > > 
> > > > > > > > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > > > > > > 
> > > > > > > However, since this commit is not upstreamed yet, so it's suject to
> > > > > > > change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> > > > > > > this patch into that commit in his tree.
> > > > > > 
> > > > > > I'd be surprised if rust-next wouldn't be fast-forward only, is it? If
> > > > > 
> > > > > Well, I cannot speak for Miguel, but there's no guarantee of that IMO.
> > > > 
> > > > @Miguel, which one is it?
> > > > 
> > > 
> > > Just FYI, linux-next has all the history of rust-next snapshots, in
> > > 20230411:
> > > 
> > > commit ("rust: sync: add functions for initializing
> > > `UniqueArc<MaybeUninit<T>>`") has commit id
> > > 2d0dec625d872a41632a68fce2e69453ed87df91:
> > > 
> > > 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=2d0dec625d872a41632a68fce2e69453ed87df91
> > > 
> > > in 20230421 (also in the PULL request), the commmit changes its id to
> > > 1944caa8e8dcb2d93d99d8364719ad8d07aa163f :
> > > 
> > > 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=1944caa8e8dcb2d93d99d8364719ad8d07aa163f
> > 
> > Yes, linux-next is an exception. But linux-next is also never directly pulled
> > into Linus' tree.
> > 
> 
> The point is that linux-next merges a snapshot of the -next branches it
> tracks, and what I post is an example that a particular commit changes
> its id in rust-next. In other words, you CANNOT assume that today's
> rust-next will be the final version merged in Linus' tree.
> 

nor it will be the base of the final pull request.

In short words, -next branches are subject to rebase for various
reasons. Commit id from them is not stable, period.

Regards,
Boqun

> > > 
> > > The -next branches are subject to rebase for multiples reasons (e.g.
> > > applying a Reviewed-by tag after queued), so the commit id in these
> > > branches is not guaranteed to stay the same.
> > 
> > I've never seen that this has been common practice after patches have been
> > applied already.
> > 
> 
> Here you go:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=105d7c03679002c977e98b13e7a4008cc3933fde
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=692e8935e23efab6c5d5fc4b003816b33c8082f7
> 
> in this case, Alice's Reviewed-by was added between different versions
> (snapshots) of rust-next.
> 
> Regards,
> Boqun
