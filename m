Received: from outbound.ms.icloud.com (p-west3-cluster6-host6-snip4-10.eps.apple.com [57.103.75.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D808E1F03D9
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 05:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.75.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764136179; cv=none; b=FSekgfcZq9shrVLkB8PObo4PK5urxJ1QdxbIEvuDbf7PyxMUH3cDWybImUgzoNTdQxAYMVsfJ5cUpuYrVr6Mu5Wtm19o2rwbSUOBI/2/35SVvGIXf9YN6UbYDEIbkK1UKYpXMNHuEQgelMo5iuK2L1x2fLqP90yF3nqCwxJ+Y0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764136179; c=relaxed/simple;
	bh=dUG4qOhNY2Uh1rUMRYkOHYUqzIbuvvdp7DXrRHo7VDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOyyTBKDzyUWg/DKseaWp6jo20zx9swQXs+OmGNQkeId0um66Rok/sm+c/2a4BU3VeADYEqkZ9rDB7P9VstzMP+R4gkKw7wW/dHTVLKEG6m/BTM4yo3mPis7jsUOAo1OpPvRcJzDaVh7qYKabV5zLabzE+Uzs+4Jn5n7fwlZov8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=PDFaGEhN; arc=none smtp.client-ip=57.103.75.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="PDFaGEhN"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-10-percent-2 (Postfix) with ESMTPS id 61E3E1800204;
	Wed, 26 Nov 2025 05:49:33 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=irvx0QuVHJhLxA/iplmb/YluQ7fWz2Ch2DAugFvtT2Q=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=PDFaGEhN2xA3UAMMmijb/C5YXhC1im5JK4UNX6tgA9pn2MDby8+Fb0vtvmFI9MtOsTxnlGR4TlAp8hfo3m7SLfFvxofYivk9WDXzeMVV53Hh0coiLTpCvxOakr9nSgKntXItRyO74BKy0rmNCcWnv17M+udLg+O0r+4z+OSGUvrbBOkG09OcqgRXmfcCq1PUxL9XlfhvLAX9wwd8IEp8gQgFQLZ0/CKHTjT87yRv1dz9GGzPWcw0aCOdmAF2fU7fSVLPpmIp4vKRJH+1dzpD8RIA42dFtO1J1HDNFcMEMe8WAxnhk2NRR65qRx7tkhyAfm6wXRbBXA1qrTLcaSymjA==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-10-percent-2 (Postfix) with ESMTPSA id 6264418000BE;
	Wed, 26 Nov 2025 05:49:30 +0000 (UTC)
Date: Wed, 26 Nov 2025 15:49:26 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: dakr@kernel.org, acourbot@nvidia.com, joelagnelf@nvidia.com,
	jhubbard@nvidia.com, airlied@gmail.com,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
	brendan.shephard@gmail.com
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
Message-ID: <aSaU5lSmtD17U0kT@fedora>
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <aSV1rxXq4KuInexy@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSV1rxXq4KuInexy@google.com>
X-Authority-Info: v=2.4 cv=QJFlhwLL c=1 sm=1 tr=0 ts=692694ee cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=Bcv9xwsS2OVvdwMGJkkA:9 a=CjuIK1q_8ugA:10 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0NSBTYWx0ZWRfXwUljMWoC9SaO
 9OUPodwFYNL45lZ2XiXrGYTsNRbNiUcLLcJio18UjkfsN4qpXKalXHVcTAhcteQSNJ5M/LbZ8Sr
 c8SjLMIOVfvwfCst201nsiNvnAPySA/wo+WP40r0qP64Tya4RfqmAaiVzOV5uOKKStOEbhSuWUR
 4FQZoVva+NUfdzoNHExVXv8b/e7WnpYhL/KlNrHPKxIJxFEdh+bYZOXwW6s5HeG+0OOe1/ugHMg
 2mbBaJl0pX0Z7IuYFC+dmPTkp/WOENfcdfDURFha2xszQSUFydBGyxuCKhROShqPyv2a3dwZ1+4
 xz9ulfukx26Iz06QtFT
X-Proofpoint-ORIG-GUID: KBvgApPOmXImsYQa4J90rS2jHxfwfwf9
X-Proofpoint-GUID: KBvgApPOmXImsYQa4J90rS2jHxfwfwf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=452 clxscore=1030 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260045
X-JNJ: AAAAAAABPy5DQoqLbqZOG9w+5DW6TJL2iTz0ElYt/EovhofDfVhNDTeCsv8ekALXrl8sLOBadMcxYlOeYTxLuxRJ2FDVx3M6N+rxDHblXD2OXmmmY+xKAP23l2HPl+N19af0dTQQwQ0UGOT6UV5EJ6Ebot/6l3LQMqQErsrLgrbkz+KJyiAolHSKn2KKTfzi6u7MqjKDCrp/d6n8B0QZuez1mTpcMFLFvDABGO2rkhOsAXZEmRh22uSQ9G8s2/dgzDA+Xmjq6iXBydTBVCLmK2QqLjY4nTuohR7oodrIkhL0fiYbNqk+2liq5Ihz6o/a0hnhX7jRrI7XUMlrN82wjXzHrSs7ak2nidhGMtt0daPWsZyRYuR+kn2rmiq2ykWg+UnV6Yz1uabVhMYiZhO7l9okfqFRL6lAsz12fODUtEHDKLvJIIBOGyMsIqXGHw6/3vDuUOZ0f9I7qxDy6dKp9xlekVspkF8a0veSbm6HIq4hBjDbQpUGyI5VIg4YWieItW/woKCc8Ym43v2/GRqYwrhzmHxLsKnWRTtD8vXI/C/mvXbQPmkT5gorIu+UP6NsjcKufOwWF8OV5qMJmxzDlYpPTSnckaTZL14nx7BjsQA7M4dv+wk+sgi/pO184trhCMXLzd48bx7/VX1ZZeaZm01gLUxaqvXyCN2gQOOeDk/y+vu+xSMNApqoLPAR7PKi2jVPaHYPTFrzNitH911mSvicOXb1Pns=

On Tue, Nov 25, 2025 at 09:23:59AM +0000, Alice Ryhl wrote:
> On Fri, Nov 21, 2025 at 02:04:28PM +1000, bshephar@bne-home.net wrote:
> >  impl NovaObject {
> >      /// Create a new DRM GEM object.
> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> > -        let aligned_size = size.next_multiple_of(1 << 12);
> > -
> > -        if size == 0 || size > aligned_size {
> > +        // Check for 0 size or potential usize overflow before calling page_align
> > +        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {
> 
> Maybe this should use isize::MAX as the maximum size instead? That's a
> pretty common maximum size for allocations in Rust and big enough for
> everyone.
> 
> Alice

Thanks for the review Alice. I used usize here because the page_align()
function specifically mentions that the provided value should not
overflow a ['usize'].
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/page.rs#n30

I don't think that alone needs to be the deciding factor, but it's worth
expressing why I made that decision to begin with. Happy to hear your
thoughts, and if you still feel isize::MAX is more appropriate given
this information.

Brendan



