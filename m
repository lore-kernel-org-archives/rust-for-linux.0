Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9837D3D092F
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 21:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988279; cv=none; b=dhMYCQ4MeyM5OID1l1xDN/fC/U3WQ1y8tihXT4dAdYOMqCBpBYVnKGxgMgVSvan0IBzHbrizwTyKOJR3T2ob1gFifZC7ZvVs1SWb4xAvMQJe7cO2MpJoqfj49VHTExxPfgfz/AZWLIMy+2OSCi0n94iJGjCGhkBYizXQ9suf/5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988279; c=relaxed/simple;
	bh=H75lVSaHz/pFAfgEnL4STNmnL5nDJy3K6iwMCFOfXvw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DxMhJgqIPnlaXJ3vZswdjgbU+xZm6GX/mkTmf5CDk7MVDtOBMBFErsSfygkRt1lVoN7JZxmaXsN+Cp5JQ7qj0YFvOL7z4hrhC6ziq+90f+KhKtymeYEXDF6sAXsONr/Omo2YpYbx3zpoAsv6pcf6369VmgOmO9wCptXqZFyglao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=a7GxkCK8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DXQa1T/I; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="a7GxkCK8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DXQa1T/I"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 809651400041;
	Wed,  9 Sep 2026 17:11:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 09 Sep 2026 17:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788988276;
	 x=1789074676; bh=F7AiM+By052RmgniFpBteIsVIK7779ONgEOJmzSmQ2U=; b=
	a7GxkCK8rgsjC3cg6EkZ11miaIPF/dYfMiEtWf3AzpHhej9I3ZRPxke7f4/JhrNP
	h6JbiPCk0pTBYIWwutrIGOvTGwx08ZhOFR7wrtuf+yL3GGWiV6eHizoVHYcmaDMi
	YnDqITMkuu+SgdasfewXTyNOYUiOLGlZ/PPf0EUmMEHHV0JGMeQ88j+P/MRdvdSF
	RpIhiI4gEcv+q9m8PeOb1ujPDt57tdpn9CfctEhXJ0+iWhDJvjvGy2s6Oa3Hx/lF
	1SC0yS+08MneJFOudKN8/vnfKKX5ZzrU5oBI6iduHX9cTmxuuyKShVkFw48L5hRb
	GW7bRWRwAJRhQivJP+knqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788988276; x=
	1789074676; bh=F7AiM+By052RmgniFpBteIsVIK7779ONgEOJmzSmQ2U=; b=D
	XQa1T/IRQBVuYKQdAS65GCHPyaWbPpVM/uMPXj9WvUR6yedkOsnDbTd4OKt1MiHs
	sIl0nJ7dvWPCx31BQN74ZCnJ/t1ipoiJAo8dxwQjyD7gKiWb+PSK82hj1Vf4+ZTK
	SoVasknnq9PGbIwQCQ86L0wM1dj+RPwxYxU/4RWvhM35H40nIA0gDsVOCvuF99LL
	lgSrX312DtE/RngY0SSgiHgY+3l21+MuEF9FmGE75B+0GFKIg6cnDwNEmGKyBjxE
	HLaUs3HMn9Rgo8XsZ/8VVdzdCgJ7IL4OEffMMnNUIZsoowb842CJ/VN9bcfijLcS
	BgJJltzwBSU/iCeVnLx8g==
X-ME-Sender: <xms:c8uhaiVN4b2mW3u3-nhHmt66J_it-LB_zEZHJn0hA4rnQRkcSN2m4A>
    <xme:c8uhaq7g2iUnUiqKTlBwF9tMNGavrog68D5wU6NHcrElzQYzod642sbFj8yIdJslP
    yktFFhin3mjsGbDyJhCfX9c0MTbZHNAAltXPs1MBL7HPVAtwCyWm751>
X-ME-Received: <xmr:c8uhaoCga4L-6O7Q6Uew8JZXAj0SJpnzPKPfd0PX1SektQdiof9wYLcG5W--6wHdABdfBOs24jyWlI11CHTFDg07>
X-ME-Proxy-Cause: dmFkZTFCfd198oaxLxE0f99iw+EKYC/unnE1opH0LxcdHxrwxQOjOKbML+XST80075oFiv
    ol6H11Ll3DgdUD3yebbB963GnBRsJR3ZZAvvatQZHD714WYEFjRvGTuGtgBLA/xYTeDVbM
    jFA304hKlNtSfM7vOKivD9DuJRyTrXaGpIUaMzMyAlKwBvN0QKQNxmHx3vE77B5bSufYGO
    gAvIlP0ngUcB5yEoyMSCc0wqLxGFLiAHj9Z5MdxwGwg3O04Ykc8oL0ag4aC5JeHJhbSIEr
    zQKKf1+oaKy0sy1bD0sVWvsJwsNwOw4RRtKm0I3n6WhFhQhET8dPpeiubciJ7dCNoQB8uB
    CaeX9ZBf4kSh1LvRI5oWadkPHHr25EAxDkw5JsaFSncCVcn/QTtPgESHSHFltqsc3rLSgc
    tcN+buw9reO2ckZUEej5PLywMZO1byoVNYSsrPo/ynVR6iOZR0JBJCSrs9cLbm1rsBKJKM
    yHOt4CvCV7QRlFjj/GIAeC08cdOpPS5VdH5KlelAccycLZC03N07TYO4Vv9fTVXczXnigf
    ur/wlm9JqKlWbgNQL4CGZh7e36xDad96qXYH87LtT7Pm36aro/k7xtc4nTv92MCICYfglo
    9mHIASZ+9sdzdR4LB3VS/3XfEJe8ghXKG2x7aJAZZtkNbW3CCIN9CQ3UNQ5w
X-ME-Proxy: <xmx:c8uhamcVS3nrw4fT-DZWz4YYO-PPG0gWv3sx5vumKQWNUeTwgj3SxQ>
    <xmx:dMuhahtDCOq9REgPWyPJt2x58adSidd_vC_r-QLUT-VS_n0cSLJpIQ>
    <xmx:dMuhalKtWHvZ5X2QTe9TDZYl8h59T45vMZ6mj_Uy1KgOpbtw6V4mkQ>
    <xmx:dMuharYq0SBymn4NivntsXK-epOpny4fcDUJyoWW2eyZE1D6uFMh8g>
    <xmx:dMuhanh3KaNlOnLXMq9dnUcEBjEag03jpnndWA2CodoTZY3y-eRlnfDQ>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 17:11:11 -0400 (EDT)
Date: Thu, 10 Sep 2026 06:11:09 +0900 (JST)
Message-Id: <20260910.061109.2299253227990158500.tomo@flapping.org>
To: aliceryhl@google.com
Cc: tomo@flapping.org, ojeda@kernel.org, tj@kernel.org,
 a.hindborg@kernel.org, acourbot@nvidia.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, jiangshanlai@gmail.com, lossin@kernel.org,
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] MAINTAINERS: add the Rust workqueue abstractions to
 WORKQUEUE
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <aqFhykfMYOhdcqSv@google.com>
References: <20260909104313.2453991-1-tomo@flapping.org>
	<aqFhykfMYOhdcqSv@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 13:40:26 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Sep 09, 2026 at 07:43:13PM +0900, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> 
>> rust/kernel/workqueue.rs and rust/helpers/workqueue.c hold the Rust
>> abstractions for the C workqueue API, but they are not listed in the
>> WORKQUEUE entry. Add them so that changes to the Rust side are also sent
>> to the workqueue maintainer.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> This is being fixed by:
> https://lore.kernel.org/all/20260807165252.3849875-4-dakr@kernel.org/

Thanks, I missed it. Please disregard this patch.

