Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99162431A33
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764783; cv=none; b=lYQsiUHJtF7Ov0HxxHojMY7DVe8Xojz0HcW0UMk8Rw2bTRP0Y7rpLoGhdirqOiWAbDdM7fwEqOg49JqnQQwMHqjOkE9yRrnmgOGMNukvgKZzN+S+Z9WmP282WTi0ta0XwViMdyQ6BGlB1Wic1BUO8gBDscx5DDLY4RCIqJqvZa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764783; c=relaxed/simple;
	bh=kfuaXLnbdkalw7FunwLgP6C1dG+NoPVdMtAyB4bkPRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7hE/0viml/H9vGI2fssLK2S1E3enUylSZ43wFrs0GGbyjbHPx87JPK7qp0s/6+hOSWkXuNTvNHQwCcNP6fW3ocSB9QPyuf277J3AvptuEgjdr3V4p93Fv6ubc666dI+QJa5nry0QyvAnmb3prkvmpaD5z07y6Sm6GBC6loQbLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWPHLdiZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWPHLdiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8AD1F00A3A;
	Mon,  3 Aug 2026 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785764782;
	bh=vSzluyrP0FwcZp24jjD06OBE/gIIanS/16B7LK71Iic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JWPHLdiZrZR2upl9F8LH8294rStZ1dTOLjB5iNpvqpmrAgMUaW0zWlMzojC3lOTFx
	 2bliTiJAwh6eJ1DHxplD9ES8cLy+hDceoStXi4pcVPt9Yd0Y767FTNqJG1TyLLsjmd
	 mLZ0hHBugf8B9gJtf9IUmQVYrroCZTRao5ZY49j9BzIgcdPl5aPcFPjDn3TCqUXOIK
	 B6MR3oKZuqqXw9blvZ0z8oB7/xDIGAs5HDt2ObIgflHpc6PCWuvKJr6UOgdfP8Dea/
	 j7FmcgPjhG9gZULo30SK+eIbXa5Dhsk8uI9khL0avOzMSjx+M3/TtvaSPnaeDBs6QZ
	 Ib6qlzLZPdkEA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 03133F40066;
	Mon,  3 Aug 2026 09:46:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 03 Aug 2026 09:46:21 -0400
X-ME-Sender: <xms:rJtwaooc-IWO5jl_r8z7ZcE8MLuzY-hJMIPGb_UV9RAvoBBP-aMEtA>
    <xme:rJtwapA3tXazwRXUQBMI11uBqcnLw9r-zHzrRDpk6279M0iypH8MqtamoWXDqgcgB
    Pphi-h99WQyNCwk_FYPYwBYASAyf3VrP2OiWoqsbvezok_FEEli0A>
X-ME-Received: <xmr:rJtwajWomiCSzcGkORQ1qfsMSjwm4h8ZQcUpE4K9fkEL39Y3VKhkwy2XE_VMwnm25gC1dGtrgu3bqVoMkmIdc0MCskFIAKtC>
X-ME-Proxy-Cause: dmFkZTEMI+dFIC3ilS+ST3y6UE3vWWjZQT53cH1S96rtzQnazZj/VAWsvb4b0AUTdFk6uG
    G6et2TpwGWZQ3OUe9Y3btkRSL2CQDIPg5FwdVWYQOhdFEY4JT6+GODB1W750ckJzRh99uq
    jInfhc1Qg65xMJFIgU20tc1gjq3d5xjNW9bdE+uqi1NTjqQCVI+RGyS2Os+vTVE4BKpqc8
    kfMBSa1TLdQzf6c+jh/4h6qJ351bzDRDsv+ae9E1Fal4VzOmlPdRPwZu9uOuuaf9t1LPXD
    Y0a/So4vDKWskCHDXDzKePN9la4tlRN2hfSIKpPeUKB4SIHJvNttWwI9lACo7ciwP/y7bT
    W5AG9V1z7kuihpvewkacQnpdCN66U2GW29lyLRLJcl9BcTdiETJAFFEijTDEzx6QArAV0X
    V4UIgN5di7bGUqkxnWRpCrFvyACO5yx9CkxAa72rBUwZx10OXBPd9wvKwSok/oiBmECfMx
    tnxwpACERwG+8d6HXKM6i6yPIMIe4kXObt1bL4vHRV6iDLvDBr647K5RwTeCx1xJLlbO5P
    2/LMyZ+b1RNMrxsg2l9cNUSnBHP1Vd8MZA7zqhXM4DL9gf3Cms11O1CT44ROyqbjNpxT30
    NMEpla80mhd0htcMsYLj2C0nQ6572UNl2Bi5jPCb2LDn8pWuLP1sproKy2Hg
X-ME-Proxy: <xmx:rJtwarBgPPfZB7Sf84GKhZ9GrpP19buq5LH1GQYjAZ2ua-Ju0ILHfQ>
    <xmx:rJtwagdQ_tl5JlUkOLUL-KorSGvxuevglJgjEKweXHUMi68-qRkLRA>
    <xmx:rJtwairQTFmvp9GjH2Ur7mWc-qLdXY2BAF374uckfTkTMcWorEgGNw>
    <xmx:rJtwahTOVbzXidY1ljRx4_tyBw8SPP9D8coQO5pEHVccX4_SpK204A>
    <xmx:rJtwaiWGsPAwp6VOOn9EzncFvQpUs96-n-vCZMFfRK8NTtbAhKPgKzmW>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 09:46:20 -0400 (EDT)
Date: Mon, 3 Aug 2026 06:46:19 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 07/24] locking: Switch to _irq_{disable,enable}()
 variants in cleanup guards
Message-ID: <anCbq2gh1uIcYHRU@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-8-boqun@kernel.org>
 <20260803093433.GE49951@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803093433.GE49951@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 11:34:33AM +0200, Peter Zijlstra wrote:
> On Fri, Jul 31, 2026 at 01:30:08PM -0700, Boqun Feng wrote:
> > From: Boqun Feng <boqun.feng@gmail.com>
> > 
> > The semantics of various irq disabling guards match what
> > *_irq_{disable,enable}() provide, i.e. the interrupt disabling is
> > properly nested, therefore it's OK to switch to use
> > *_irq_{disable,enable}() primitives.
> > 
> > Signed-off-by: Boqun Feng <boqun@kernel.org>
> > Link: https://patch.msgid.link/20260121223933.1568682-17-lyude@redhat.com
> > ---
> >  include/linux/spinlock.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
> > index 3d405cc4c121..a9d169dad6d4 100644
> > --- a/include/linux/spinlock.h
> > +++ b/include/linux/spinlock.h
> > @@ -572,12 +572,12 @@ DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_nested, __acquires(_T), __releases(*(raw
> >  #define class_raw_spinlock_nested_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_nested, _T)
> >  
> >  DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
> > -		    raw_spin_lock_irq(_T->lock),
> > -		    raw_spin_unlock_irq(_T->lock))
> > +		    raw_spin_lock_irq_disable(_T->lock),
> > +		    raw_spin_unlock_irq_enable(_T->lock))
> >  DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irq, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
> >  #define class_raw_spinlock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irq, _T)
> >  
> > -DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
> > +DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq_disable(_T->lock))
> >  DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irq_try, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
> >  #define class_raw_spinlock_irq_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irq_try, _T)
> >  
> > @@ -618,13 +618,13 @@ DECLARE_LOCK_GUARD_1_ATTRS(spinlock_try, __acquires(_T), __releases(*(spinlock_t
> >  #define class_spinlock_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_try, _T)
> >  
> >  DEFINE_LOCK_GUARD_1(spinlock_irq, spinlock_t,
> > -		    spin_lock_irq(_T->lock),
> > -		    spin_unlock_irq(_T->lock))
> > +		    spin_lock_irq_disable(_T->lock),
> > +		    spin_unlock_irq_enable(_T->lock))
> >  DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irq, __acquires(_T), __releases(*(spinlock_t **)_T))
> >  #define class_spinlock_irq_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irq, _T)
> >  
> >  DEFINE_LOCK_GUARD_1_COND(spinlock_irq, _try,
> > -			 spin_trylock_irq(_T->lock))
> > +			 spin_trylock_irq_disable(_T->lock))
> >  DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irq_try, __acquires(_T), __releases(*(spinlock_t **)_T))
> >  #define class_spinlock_irq_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irq_try, _T)
> 
> What about the _irqsave() guards?
> 
> Is the goal to replace _irqsave guard usage with _irq and then remove
> the _irqsave guards?
> 

Yes, that's the goal. I had that in previous version. However in
1abbecd1d2d2 ("sched/fair: Convert cfs bandwidth throttling to use
guards"), we have a user that explicitly plays with the .flags in guard. 
Lyude also spotted that too. We could adjust that user to the new API
(Lyude already has the diff for that) but I decided to simply drop that
part for now given the current size of the changes. But if you think
it's a must for merge this, I will add it.

> If so, this should probably we mentioned somewhere.

I will at least add this part. Thanks!

Regards,
Boqun
