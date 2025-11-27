Received: from outbound.mr.icloud.com (p-west2-cluster1-host12-snip4-10.eps.apple.com [57.103.68.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B819A253351
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764253126; cv=none; b=kMgl8MtTYMBhNGFH6+NTiaeLQlmMO89ObKJu1vDmm16AvgKnYYUJ5XP2dNIdiCwjCQd9CPVyNRBq2qGUkIpDHXxGytUgK+f5K0twnlP1ftKEwyQeM8QFvsH6qIkXyIaNmj6AhtODcL8BnABF+MkJxq8z6di9bRM3b0nc8yE/FIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764253126; c=relaxed/simple;
	bh=QJA2QiYq+Gn+fwe7rCrbf3XBl7wgjskLLgZjPjMvmRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/bnJo3+JEwvTakV77NruNgeuUQeJPrbBd4NUKwSy9M2Kn9q38c4ccURUiBZi+hHh94q0P00Nq4Ed8iObuCJqUSY15ddBGBfNRJLZ+dQae+JD/DZ46phoEz9LrVUE5AWUz7tkArtgAbGuPGiCbgkR59YDefXD02uDMFlSa9Z4wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=Sa8lJdRf; arc=none smtp.client-ip=57.103.68.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="Sa8lJdRf"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with ESMTPS id 682BB1800158;
	Thu, 27 Nov 2025 14:18:42 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=0iQ5MWEsXV1mSjxUjESV/qEb98KPkkrQz0ZPMSFmyPY=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=Sa8lJdRf1+vRXNdTuuPS7rDPqD6c6s8yVK8xn2KDk/GjIo4Jpp3VAL56CgXqTeF/S/Ca4ZG76PctUSPMnoCbeAHwqSJgTz0QZ2eY1OOFMZpllNmyv2ynR3VnuRqjbtctRANN7J9x1ceJu1aYdZlvTc08oyLUE8dl6k/PbUD/z5E0WymX08KYAXWHzN1aett8us0VZOiQznC7KZMEFs7+75Th1mFLR237YpwpRbJARQULTcO2xGL0umK8r4hoXl1A9DCPyf5sd+eXLw03Ewc1Ov7lt+jbhxWhTiX5HK5r6qILBKUKYJ64e6jykza5k5HqblRu2tjF9/Mho5EuxdLYOw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-0 (Postfix) with ESMTPSA id 1D11A18000AB;
	Thu, 27 Nov 2025 14:18:39 +0000 (UTC)
Date: Fri, 28 Nov 2025 00:18:34 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: dakr@kernel.org, airlied@gmail.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
Message-ID: <aShdutWrmU2q7gUT@fedora>
References: <aShM9CAyRPe2gYpK@fedora>
 <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com>
X-Proofpoint-GUID: 87H9p4SUUmXu4ppw9M_4LR-Ni9kfZspI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwNiBTYWx0ZWRfXylmOJ+vT3Ive
 uLc2Wff3rt49ErUhjqqOCqioib1f2Yrm5lBZ6MZkZsMAxJUcXd0l/pyHdXpE1e6OOCOmS5Peuyb
 ii7erx1FqgG/lykBPe6yxyb29lP71aD6Yq1bzEMUROiTzG/XONaYhX/6ZeXMuBbzmZ/TuJ55BdE
 5A6L/UvQZv2tkptVg9RclcQuW1PfROcX2Z+0Ivp//zZzwSd/LqAKDbRk/5uZWiBVW8r1uaXHs1B
 0AAyKCuZ9liq+Xn6xwMDHhZ3ztwIRte2y2eORQJbZeIRDULNYo9iCSWZ7LkOnEuWH/IISqYAuHG
 p4Nia2SGQzjNi6IvFfw
X-Proofpoint-ORIG-GUID: 87H9p4SUUmXu4ppw9M_4LR-Ni9kfZspI
X-Authority-Info: v=2.4 cv=CbwFJbrl c=1 sm=1 tr=0 ts=69285dc2 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8 a=FX5ijlYx_CefvLruoE4A:9 a=CjuIK1q_8ugA:10
 a=-_B0kFfA75AA:10 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1030 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=955 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270106
X-JNJ: AAAAAAABfNg6Sq1T/qHYzdEV0ftaGH4PWDWruXOv95JzgMUDZs2sqYXuPKBmWE4VTg//6lKpnnWTZHBL7AMMwOIR0vE0bBw+R2IU9LLG5pZlfU/wcSwx17JVP3VYUvzR0+sVbzCDKJOsYHx1AO/Pw15gA+5+MB3mZQQB3f7Alv5yuIIzjbakB+XtmXjpgoB1+xo9IN4z6GcnU/bfAXrleXMO1LEyk2efT5yxeme3Ik9QpDmgrKyzmiRM2cS2b+Ad68uw/JnAeT976162MKxxVo/H5k3IDpwjGDmzz3lZb0tYutXxH/IBD4ZEFEv3t65UAPcoCecS6bBiRuHPAYe48ofY5JrIhdosYYx8VSt7+3djiikVxfNek7t5rG+mZvVqx1XU/0cYBNZsmonFspF2vYuDlDnrPtqrWHZxEUsSRJGvO3DBxhQuyJPsjz94ZBTlJ9OJFgCkQNhIPBFi5s+m0JAl5aJP/LmtRhXRymKOOvwk6KfmCtLi/lHXgA6qyvy7i9ERe0fhV9xXaW5Ahnt7Bd+Ir98isxvNjktCii7mIB05ZwbudYZ0zBel8Bol0mCECr9LxTRBy8Hu2U4nw+oMFjEjKb3DsuwSEex9CcddESnuhNbGQxeLt1zstRD6PdHGIPlZY5Ng20JMwXeX

On Thu, Nov 27, 2025 at 10:42:31PM +0900, Alexandre Courbot wrote:
> On Thu Nov 27, 2025 at 10:07 PM JST, Brendan Shephard wrote:
> > Changed page_align() to return Option<usize> which allows for validation
> 
> Please use imperative style as per the patch submission guidelines:
> "Change page_align() ...".
> 
> https://docs.kernel.org/process/submitting-patches.html
> 

Eh, my bad. Yeah, I'll fix that in v2.

> > of the provided addr value. This ensures that any value that is provided
> > within one PAGE_SIZE of usize::MAX will not panic and instead page_align
> > will return None.
> >
> > Callers of page_align() should raise a EINVAL when they receive None
> > from page_align().
> 
> Callers will return the error that is relevant to them. :) This
> sentence is not needed.
> 
Ack, I'll remove that part.
> >
> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> > ---
> >  rust/kernel/page.rs | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> > index 432fc0297d4a..b78473b67003 100644
> > --- a/rust/kernel/page.rs
> > +++ b/rust/kernel/page.rs
> > @@ -26,13 +26,12 @@
> >  pub const PAGE_MASK: usize = !(PAGE_SIZE - 1);
> >
> >  /// Round up the given number to the next multiple of [`PAGE_SIZE`].
> > -///
> > -/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
> > -/// [`usize`].
> > -pub const fn page_align(addr: usize) -> usize {
> > -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
> > -    // cases.
> > -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> > +/// Return None in cases where the next multiple of [`PAGE_SIZE`] would overflow a [`usize`]
> 
> You can doclink to [`None`].
> 
> Nit: dot at end of sentence missing.
>
Will fix this in v2

> > +pub const fn page_align(addr: usize) -> Option<usize> {
> > +    if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
> > +        return Some(sum & PAGE_MASK);
> > +    }
> > +    None
> 
> A more idiomatic way to do this:
> 
>     addr.checked_add(PAGE_SIZE - 1).map(|sum| sum & PAGE_MASK)
> 
>

That would be nice, but alas since this is a const fn, we can't use map here.
I assume that was done for optimisation to ensure this could be referenced
at compile time. So I'm not sure we want to remove that optimisation here.
