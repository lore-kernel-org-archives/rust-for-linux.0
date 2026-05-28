Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50185325485
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 21:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005107; cv=pass; b=K59BKI6w1VpaCkxCZeSux6frKem5bSEFFtTRkJOPYNyFuL6oAXxk8Xa/eBuu0DfThoVQsVjnVpMaBINL9YZWVDHZ4PLHKXSlE44sZdU3HwRfGdP7SZ1a2Ze0K31ar7Q43z8EYeXLuySMcE6HZ8NHLHPAqqXEmDJz+WEqe8L7nMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005107; c=relaxed/simple;
	bh=Rk689pREgbVPwErWkpxuev+7D4BTr715Rss0jQC/HEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC2cfwtf3lJrQwLoMlP1daUdBzyB1XnsxImVfA6ul+ZjKyDr6C8OO+vqiG4qryWqNUwnOR4zDsJqmmNP+zS5kT1B41QEJE7375Jrr7k88i8RbjKhK7wAyN24/ZXZmrV/5rSYdh3gERIXWcZfQKi8hNZpuomxbr7cvB/BTA+eT1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=GHGSg6M1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="GHGSg6M1"
ARC-Seal: i=1; a=rsa-sha256; t=1780005091; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KzIBPTmthwhAeHA0/ZQk5QR5z1hu9YasP3QgYIjqwflT3fbbGBP64sWbFHbT4RKPKhyH5k3LH5+IEwSvQ/UCgNG4+ah9yO6EnM6Pc+53juka8aDEu1n4MfVEoKjkkkluCwHyvt54IZJJoieuJ1VcR5qX3CFBFyik3xQ+yrL1tkI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780005091; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d036PFKvkwoW+sbQQSIuW3LFGAUR93jduDjOep/NYl0=; 
	b=iQ3TTYhwWw5oUHxY43Q5ZlRQGIKQaDRGJzxL4XozW5jM0EoTk9SLXMbOFKcwjgJSUjjxZhOugU5FY/RfwULVjziYno+nXfgwU8Gqmwp5zXDA6Zv8vZ68S47K0nl7XTqTY7NwcAhRkFeXozevVfsH7TN8e4Dgr875MQJTIQNPwDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780005091;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=d036PFKvkwoW+sbQQSIuW3LFGAUR93jduDjOep/NYl0=;
	b=GHGSg6M1wuqoB10xJ9UCivvH9fJXswPSny++QiADxHs2d/bUis9JOX3cv1QmeBqA
	BmusU8Jki8bijBz7oQrmZUc9nhqfkVi0DiuFz2J8W2ZrQlB07U2sI7QBro7U0v3mlsP
	/DQo4d7i3nHUoVH/YrPx+DCLnPwoEUndVxuEzOro=
Received: by mx.zohomail.com with SMTPS id 1780005089800437.67750831704655;
	Thu, 28 May 2026 14:51:29 -0700 (PDT)
Date: Thu, 28 May 2026 14:51:29 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Eliot Courtney <ecourtney@nvidia.com>, aliceryhl@google.com,
	daniel.almeida@collabora.com, boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] gpu: drm: tyr: use IoMem directly instead of Devres
Message-ID: <ahi44Zwu29bgxoCc@um790>
References: <20260525230152.277820-1-dakr@kernel.org>
 <20260525230152.277820-3-dakr@kernel.org>
 <DIS9H75POYGW.EBC1MLW466RG@nvidia.com>
 <ahd4UoKVT4cM-pgA@um790>
 <DITUMY6K2IQX.17R1VUFJGBDAW@kernel.org>
 <DIUBT4GXKI2Q.3RZEYJVWXZF18@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIUBT4GXKI2Q.3RZEYJVWXZF18@garyguo.net>

On Thu, May 28, 2026 at 01:58:35PM +0100, Gary Guo wrote:
> On Thu May 28, 2026 at 12:31 AM BST, Danilo Krummrich wrote:
> > On Thu May 28, 2026 at 1:03 AM CEST, Deborah Brouwer wrote:
> >> On Tue, May 26, 2026 at 11:43:38AM +0900, Eliot Courtney wrote:
> >>> On Tue May 26, 2026 at 8:01 AM JST, Danilo Krummrich wrote:
> >>> > @@ -40,9 +39,7 @@
> >>> >  pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
> >>> >  
> >>> >  impl GpuInfo {
> >>> > -    pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
> >>> > -        let io = (*iomem).access(dev)?;
> >>> > -
> >>> > +    pub(crate) fn new(io: &IoMem<'_>) -> Result<Self> {
> >>> 
> >>> Perhaps a future patch can remove this now unnecessary looking Result in
> >>> the return type.
> >>
> >> Oh that's right now that we don't have: let io = (*iomem).access(dev)?
> >> we don't need the Result anymore.
> >>
> >> Danilo, I can add this fix to our fw-boot series which I'm preparing to sit
> >> on top of these changes.
> >
> > I can send a v2, fix it up on apply when I get an ACK, have Alice fix it up on
> > apply, or have it done in a follow-up as you offer -- just let me know. :)
> >
> 
> I think it makes sense to have a v2 with this, as getting rid of impossible
> failure paths is the reason we go for lifetime in the first place, so this is a
> good demonstration of that benefit.

yeah v2 is probably the cleanest/easiest way to fix.

And while here it would be nice to keep the subject prefix consistent,
we've been using "drm/tyr:"

> 
> Best,
> Gary
