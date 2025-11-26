Received: from outbound.ms.icloud.com (p-west3-cluster2-host5-snip4-10.eps.apple.com [57.103.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FB1448D5
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 06:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764137158; cv=none; b=SVp9DsbrY4CcC+O05XuUyE0VmvOYfZZYxCeMD4PCPpD9BHE+Axt3sTmOrsHtK2nLaqv+I2kf3jPLseVcJCiogOQz9ktPnPyQzZ9dq7gVMHMNvMxxexLqQkHrcx+pbfjrooxUXtRw5ZE05rqfWECSnxKERvWAxexXD0AVhsy+U9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764137158; c=relaxed/simple;
	bh=/3cVhi5NYyaQ9s0jgTlCPnAJYynkA1sDbrjU3gPEmsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj+7uFIniGXo7RwR5Vrb9IZag/KJxHGWp3I0Iy5lvsQtHKAHBcsBKIPur0i7cwk2DjR9+bQthtk5CDgi3RqaeEiQWzjT3Jq3a4CKpsx7SqN6PphgcJyAc04XtEda/Mk0LJZrrofSXYH1z25qtuWfJpP4EPHmpMDjnuGKnJGBOUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=c8Enl3O5; arc=none smtp.client-ip=57.103.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="c8Enl3O5"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPS id 196471800128;
	Wed, 26 Nov 2025 06:05:53 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=HWCp2c5E1H7O+Q96GAi6bNWZtazqgioAnhAoRAOXLvo=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=c8Enl3O57eRKcDJZkbfGcdsr7PiFY7kXWbeNrtQEqSDKsvrs3tK8fxMD6FNzzYgg4beux7oI339hh59ys01X2+JYr2dfKw1ec0mZyMw91QCRMHmiH17HgdNR1vBUTWkiqCWGYhyxTMpshOE+M80l3p1SDw4tZv5VBqMj2fcx0RonwWRMmqdM48gwJQ+SuhJJI6dIa+h99h917X+4+jiy8TzqTiShKGgsLYAYKMZDMoU0mm/C12DWHd+MA4Ru3jo7UFfF1dvSfV4R+aMzzEs0XDeF+ReaXnZ2gHBlXisPCxhSXKhFBSCsUTbICNft5p9lLtPgP4vjcHfxGWkGkuW8nw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPSA id 6B6F2180010B;
	Wed, 26 Nov 2025 06:05:51 +0000 (UTC)
Date: Wed, 26 Nov 2025 16:05:47 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, dakr@kernel.org,
	joelagnelf@nvidia.com, jhubbard@nvidia.com, airlied@gmail.com,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
	brendan.shephard@gmail.com,
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
Message-ID: <aSaYu8GCrU4XRRNF@fedora>
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
 <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
X-Proofpoint-ORIG-GUID: wFF0Gtp_ydERzspMKNjCfa6rmj6Z3igg
X-Proofpoint-GUID: wFF0Gtp_ydERzspMKNjCfa6rmj6Z3igg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0OCBTYWx0ZWRfXymsQqCHtrXA7
 9JocAXq9+tY/wBKofAzoSc93KKbaHQkS5IAFr1oWHAu8ucdlfCROZZPY5NxPYsKekPiguklj+hX
 JG/oeWh/b7aHXyP1/3KZOQ4xL1rA8Ry4S2bQY3sPg0heRapWfnWPDlLcPnOrVdu6LMVuRLzCSGS
 EPZeaUvGLbne0uHsnUXaLnJxUW6SXIQ6wrtyWeIEPmet+cnomrMfCVfx0OYzMICRHG849XW1jqe
 qoRjJ/6MoIThKT6UHS5ihbYpVRcktHxtOWgG75Uk3shC53spk6/Dih0DJ5WWFzlUy9RI5blgsmM
 C+WVa8DEbh/cP2wSuGT
X-Authority-Info: v=2.4 cv=c6qmgB9l c=1 sm=1 tr=0 ts=692698c2 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jbRqzA-MdUj_exYDcw4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1030 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260048
X-JNJ: AAAAAAAByUjj4nuVGAWwEtta1AjBqAz2OWIzp4o5zXtJ9337k0jxRdecd4vexnKRY0FXg5E2AAYgmxqqCq/8fpSAtOeU1rfp+QMaLG8taQy/a0xkkf3hv10sVF2eAIDajARjSK1chsy2FhgX12zEktMEWFyI6Lxbjn81CXCOCMxUCRQbo5pahYzR76xsmmNQsX4Ocpw1BMI7AFqwjbLSD/bcjg72ezlqqX/ACoWvd61J7/6I9OeA5gr3KD2l0OmEMrpzE7oOIecE7th1gP2NwUmJ6gYEUTr4wuWvIKt2Y/uo7VgX6loUjICD2AafDRtVuWkNIdYL1NAR60n9zSPl+13iWMqoWoUIoP7ExL51JorTx0+ffLTOBi8rof5tK67F6DRHIpvOP8JRAuG7gZcNKRz9n1yteVWoJBMxciCwYUgoSeQqc1Ejw9Qhbpj/PfE/EKzFqurriS6TrhaQoSWQyZw91wb20hKGmo4+baoc7SuTNZEo80Rm6k24mFvawi4enFc7SHWYhCkIbwB3xWYNYJ+Vsiqz8tMEnKRSa1s3Yg7hDa0YUTDRVe9H49KAS1h7NiV3p1vDollo8gVZF9ya5S5TbgBPA6HhgzjFwV2wWZ90FnvgehY8Okzc5mlzxoWlQx1JotTIsqKD3/KgJdrhus2OIQiayeVvicqEKCAOIps5qPqG3zLqZ4qMU9w2Bz/ZIhpCkbKDpx6AQ5VRrBX6IIJw9Crjgg==

On Tue, Nov 25, 2025 at 11:55:08PM +0900, Alexandre Courbot wrote:
> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
> >> >  impl NovaObject {
> >> >      /// Create a new DRM GEM object.
> >> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> >> > -        let aligned_size = size.next_multiple_of(1 << 12);
> >> > -
> >> > -        if size == 0 || size > aligned_size {
> >> > +        // Check for 0 size or potential usize overflow before calling page_align
> >> > +        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {
> >>
> >> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - well,
> >> I'll admit it looks better as a placeholder. :) But the actual alignment
> >> will eventually be provided elsewhere.
> >
> > What about kernels with 16k pages?
> 
> The actual alignment should IIUC be a mix of the GPU and kernel's
> requirements (GPU can also use a different page size). So no matter what
> we pick right now, it won't be great but you are right that PAGE_SIZE
> will at least accomodate the kernel.
> 

So, maybe what we realistically should be doing is aligning to the
larger page size when comparing system and GPU page sizes?

> >
> >> >              return Err(EINVAL);
> >> >          }
> >> >
> >> > +        let aligned_size = page_align(size);
> >>
> >> `page_align` won't panic on overflow, but it will still return an
> >> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
> >> you return an error when an overflow occurs.
> >
> > The Rust implementation of page_align() is implemented as (addr +
> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
> > if the appropriate config options are enabled.
> 
> That's right, I skimmed its code too fast. ^_^; All the more reason to
> use `Alignment`.

We would still need to ensure the value is a multiple of PAGE_SIZE
though right? Like if the user requests a size that is _not_ a multiple
of 2, then we would want to align the value to a PAGE_SIZE. Which is
what the existing logic does, it's just always rounding to the next
multiple of 4096. Maybe I'm missing something about Alignment and I need
to spend some more time looking at it as an alternative here.
