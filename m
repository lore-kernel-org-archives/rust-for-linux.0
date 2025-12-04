Received: from outbound.qs.icloud.com (p-east3-cluster4-host8-snip4-10.eps.apple.com [57.103.84.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08A196C7C
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 11:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.84.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848600; cv=none; b=gA+I9Hccofrt6/VdLhNSz0UQun721xa+x56ftiSiWCJ1O9FO94eR9IVVjlGBjuUScyhOJJYJ4X5Yj6ncMl4MbitBmmAPSHX4DlkuIVPdPt5hbbvIlBFLF6q2PWUOhUd0NOk7PApt4RDM5Ieh6pncKvm5pmGa+cAL9dYWLdH55e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848600; c=relaxed/simple;
	bh=PfQYp6XQSks0Hsakt0zgbzgtRIr5yTiWuPEa8slDf3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udK7/7niR9YpTN5JFCG2lnLgHs+bIlXAfXb08hNtDoaOuljxp213M/fDtjKT4LJVE1XbzbOPSCelxbosQGJfLhxaiWhRTuc66i9MHUd3W4/Gz86CbCKmS9vLMaU6qJHU8p1KnlRc0D/xuEo6qYEMomUsGJaPTfX25g+96ITPHyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=H30Na9P0; arc=none smtp.client-ip=57.103.84.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="H30Na9P0"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-20-percent-0 (Postfix) with ESMTPS id 55A82180013D;
	Thu,  4 Dec 2025 11:43:15 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=N+S4S+F6NE2GdDOKSLmbrfw/yuEZ5y5xLjuwpZ2qy7o=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=H30Na9P05fXX92VqM4zULbnSY4v6yUsRq1jCqt9t1lnSxud+BrY7xY4KqgI4B79MxZwdmEhqq4Qr87ho/5jguRLaKGRHfjgNHdPpefLNvDZSRO/28N8ZtVxkzQOBVof4zMJqAB+ePxrqP9rU18WPX2z0bDhlBC0SauTFxw/mdEYYZrIMEjEn+GoxcBxp1H6oAoI/kAJZRnvROHPAYW9s97Ilu3+rS6fyYyZ5Mjz15UQruDAB1PouBHBax3asaG8/9hRDCj3NvCK/1Y1/i/WD3TVtEKbrcyGYynL4ZRjYvi9rX/Wbd3QmvVPpGI4urcZ6DuPC/LFmPY+64UAdt9ET9Q==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-20-percent-0 (Postfix) with ESMTPSA id AA02C18000A7;
	Thu,  4 Dec 2025 11:43:12 +0000 (UTC)
Date: Thu, 4 Dec 2025 21:43:08 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com, dakr@kernel.org,
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] rust: Return Option from page_align and ensure no
 usize overflow
Message-ID: <aTFzzIjEZ-lMMjtw@fedora>
References: <aS6y5blasMX0KcD7@fedora>
 <DEOIMG7Z0J8B.3OOY2A989T3G6@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEOIMG7Z0J8B.3OOY2A989T3G6@nvidia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA5NSBTYWx0ZWRfX/mM11O6uFj6w
 YM3Xde3XiZjmekUiZIkhch3JjUQf1/mXAc0019VVf2sn3rCB5WqFCdU1xWMZyB/0JPVOCR0NIad
 1k+Swx05VQCOxdwbL0l90mVfgvmNp/LGqfVopL3+mEcKMsbcX7zzsPO3c/EvT1dNdPqFko22105
 nvKqHwV5Zu73WEPDyP6UlmjIeUPhM1m0xdcmXwqAhka6shOB0Ws/QZ3kInXT3s7aqy3osHcHYhl
 fr8er498P0QXI92SpF34oMXiJsC5tYnve3UhZ0x2n32Eo8SaT13nYqXhtTHGfN17cUk1S+R/0Up
 r8L7qdk2ybke+wbZ/b9
X-Authority-Info: v=2.4 cv=NJDYOk6g c=1 sm=1 tr=0 ts=693173d3 cx=c_apl:c_pps
 a=bsP7O+dXZ5uKcj+dsLqiMw==:117 a=bsP7O+dXZ5uKcj+dsLqiMw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=JppZAXPjAAAA:8 a=Ikd4Dj_1AAAA:8 a=VebqvxzqAF6XTmt7Dz0A:9
 a=CjuIK1q_8ugA:10 a=l_8y2aVsmG4A:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-ORIG-GUID: EB93IxHMUsMVneTQE4m3khdavekYJhyZ
X-Proofpoint-GUID: EB93IxHMUsMVneTQE4m3khdavekYJhyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=635
 suspectscore=0 malwarescore=0 clxscore=1030 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040095
X-JNJ: AAAAAAABk5Txq6FsV+9QO1DAL4K1taEEGNgMwv8QUZZw23gSBuAyai0mG8b5/0cfwW/d24/HTEnjgG0hxyeB1+csJ2o1UrQLkdjU1wel4z1PTRaO9RiJU4V0yaiBNm2jc+4yYJ5ltIdooU0yj/DslwpyEfZYTkOHDDWRniPSPdss4mOGNNuX3axkZCvw6aCtmteY2QUO9K2XqjX0Sv95+GnzCl0perIfs6sRwGDoVJi3JVIWb2udzp7WUNozdg+pvxBBC197eddeDInJYEuPHXIOlmLs0SKFjeRF5QeqHKsi6U5kcmkqTzpO6WkQnXRiFmjWC/84rCOx38VpFkkkplTPeZ+G8MmaIHCItoRQ8k1yDvEj4+Fu9CGH4joTQPGObCse6vEcL3V0eWJYNIplm7lSfOSOYe3J1bOMx1DwX3J1ne//byW3odwopdllfUN+Yb/WXTThx01Edx46CjV8ApvqbU1Mev58XPaSZZG7K8f9o5fxzk23kD579gQRaAQfAqcIkbde6YWgEJCh4lEDjeyyaqaBQayXP+aHNmSNTxgmRuxr/IVHiIxOF7x1axwpTPqeUt/LhZnXswii7ANHBexBzU6BkFniwo94dgbqmAa82Scq5wJ1EQ4QffZ4fF4OHF2b/eCX4HGVGW6HKXcR7cyTaPcrYNUKFxWdxE2hmimvO3BRPI3krmQJvQ==

On Wed, Dec 03, 2025 at 07:39:06PM +0900, Alexandre Courbot wrote:
> On Tue Dec 2, 2025 at 6:35 PM JST, Brendan Shephard wrote:
> > Change `page_align()` to return `Option<usize>` to allow validation
> > of the provided `addr` value. This ensures that any value that is
> > within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> > returns `None` to indicate overflow.
> >
> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> A few nits below.
> 
> > +/// Returns [`None`] on integer overflow.
> > +///
> > +/// # Examples
> > +///
> > +/// ```rust
> 
> I never see the language specified in other doctests. I guess it doesn't
> hurt, but just mentioning it for consistency.
> 
Fair, I just took this from the example on the rustdocs page:
https://doc.rust-lang.org/rustdoc/write-documentation/documentation-tests.html

And I didn't give it much additional thought. But I probably should have
confirmed formatting of other examples in the project.

> > +/// use kernel::page::{page_align, PAGE_SIZE};
> > +/// // Case 1: Already aligned
> 
> Why number the examples? It doesn't add anything since we don't refer to
> them later.
> 

Another valid point. I think a common theme in my reviews is that I'm
being a bit too verbose. Most of it, like in this case comes from my own
internal monologue while I'm figuring it out. I'll take that on-board
and try to be more INFO and less DEBUG moving forward.
