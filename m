Received: from outbound.mr.icloud.com (p-west2-cluster4-host12-snip4-10.eps.apple.com [57.103.69.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B9134CF
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764253272; cv=none; b=uWg0GxaQUlp74L1qqPi2iyISdt6rK+3xF3rLHPixQLXepZgNkD0whWj5OzTP+8/ETE97KWyWdOU3tGBPFvxq09QVXClpHjaBGO6vxiUjy8KmxdILC4nbyzs3IhF/Zk6/20iAu28AqwxgcwwegH0DKldifHytVexPm5z9VFonibQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764253272; c=relaxed/simple;
	bh=RPoTsJnHhSzRUWwnaiq8slaY4NifAZQTi98QjcwvLLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpW7J8ZLKRrAeiz9HVZvqpdWSOaAVPG1UkLIg02pwPdya7MTvHtUSN/VoZehoNerj9LB9EohQx92TDT5qZnpo5zJCvSySIy+rtu7WdI5UM3cSO6EMAtNIdm3KmBP7h+DhZWc315rEHKNrtnJUSyRLhLk1wvHlZ0VUpNq4x3bmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=BBfkk3+i; arc=none smtp.client-ip=57.103.69.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="BBfkk3+i"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-4 (Postfix) with ESMTPS id 0EA2F180011B;
	Thu, 27 Nov 2025 14:21:08 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=Pk16RfO3KDXIb8YQrSspX+2HVyPiKlTAFR6bmGIra3E=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=BBfkk3+iCLQ1mlwvYtE+gECxcuM356Mj8uujmTwggJXfaI2kLX3D1Af4DQhFDefoZwesFgd9k+xi80731jntYmeVy0oGjEnsWaGDOismLaBJkFKeabegfvqGqYFsLb360tckiX6ifwXjn/6bI7SgoutnQYUDC6oa69Agij0h4s8oroTb3lbREbCmIWzTCg8D3+bHQEg8pmNMC800i4dlY9cG1EKqF4kROpT543meWBw01bchvD6EMJNDl2gDREndNNNlbuo+Z0uJVaaZePUYvAP5demYVTVnEP+0Ky02iylT1uh+wuI5JoGnury2ZytHPoV4zz1TmA1QFwDzauI1ww==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-4 (Postfix) with ESMTPSA id B276F1801493;
	Thu, 27 Nov 2025 14:21:06 +0000 (UTC)
Date: Fri, 28 Nov 2025 00:21:02 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: dakr@kernel.org, acourbot@nvidia.com, airlied@gmail.com,
	aliceryhl@google.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
Message-ID: <aSheTh-T1oroAUHR@fedora>
References: <aShM9CAyRPe2gYpK@fedora>
 <56446175-58B0-407B-9FC8-97DCE1969673@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56446175-58B0-407B-9FC8-97DCE1969673@collabora.com>
X-Authority-Info: v=2.4 cv=Zo3g6t7G c=1 sm=1 tr=0 ts=69285e55 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JppZAXPjAAAA:8 a=QX4gbG5DAAAA:8 a=qKT9ptxkt80fGoZfiqsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mTXuAFqUwmiQvsSFmwXH:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: OW661H17SDOdx53dDIs3xSI0HRSqkPYI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwNiBTYWx0ZWRfX3JzoLPytV+QN
 21tTdquywqjZpRiS4RzLk3NX8aWJrBFLAmxyKCKxm8jKomfegmVBVH4qGK1K7BYYHh0GP0D4o/M
 FtxQwHySZPQAYrOhmurx+RpHnZrr+o9vXLk7NVjhRf8/DJnWWqw2dO0mZs98ELbo890LG9oOv4J
 GcjFlWvkaRs6xiOhgiGmhA5Uwm6vSbGWlZaexeY7Vr7FmlHjtRVXoKR7vsVnLMFHupFkmkU5Qdi
 nvG6XkQ0ZWbgC/+aNHrqo+hkC9QyzZQEKR00uaquadAs7G5ko4tftoDQ2kaqKJOWPd91xb3q4Lv
 Aohb1B7rdFtuj75xUXH
X-Proofpoint-GUID: OW661H17SDOdx53dDIs3xSI0HRSqkPYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0 mlxlogscore=596 malwarescore=0 phishscore=0
 mlxscore=0 clxscore=1030 bulkscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270106
X-JNJ: AAAAAAABAbr/rI8zok4ZKSfbHDrWjhNUmdzPpcnsCy9pl7PpJ6e/F/s9cz2K3X+aamtwAgYfzoF7FDbu+dozeRP9FiRQQwbJ0bQIC6xMZP6AJ3gByl9TH1vVwPtV/CkFfGWsqRKDCwY0p4/NvOFXTMjWtlVPZTdRa7kb1tRfOrg3aJsU5Hzybg5XjBe2C/39LV7FGJ2XtNrSMc3/1Fqxvl+6kW2Sz+CFV05XwZhPmP97iUVVTEfQS+Ox45Wf1GDekSqZwHLc7OqlnWmZNTG9fvCK3NFgkyVdpmoFryI2Ld17tJEj6HkW+MvyeN31qPlq3gEfzja4Wj/+eaqwPDZY6+UufZAFRwyxiDqshomEn8qVPBrlAs/jRN/lItH+FSPtrb636kxGnvGB5dagSKs+4uqAUUHTNxQhFYry+TOv49R9s8/MdOMkaENn6UXW4t4/L7HiNu3VKv+Gzdou0CCouPwX60x2v5R9W/on8CKGy+5n4x/NU71Mdzsi23W2U2Qk5Gd5ABPxUf7PonbmFSueVlGOHZobdD8nyn3ecOR0kKWOLzWRmZdcoFihcH4fYyoVPgI0NHzaqDI/biJeqv/puuCMVwM2Yc8Q7IbxK3cwAVM6qdRhUsvgR/EwJgdNC9/CDLgqwn07WZ8I7EZX76xV1W9OAt/9l/k=

On Thu, Nov 27, 2025 at 10:44:16AM -0300, Daniel Almeida wrote:
> 
> 
> > On 27 Nov 2025, at 10:07, Brendan Shephard <bshephar@bne-home.net> wrote:
> > 
> > Changed page_align() to return Option<usize> which allows for validation
> 
> nit: imperative voice here
> 
Yeah, my bad. I'll fix that in v2.

> > of the provided addr value. This ensures that any value that is provided
> > within one PAGE_SIZE of usize::MAX will not panic and instead page_align
> > will return None.
> > 
> > Callers of page_align() should raise a EINVAL when they receive None
> > from page_align().
> > 
> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> > ---
> > rust/kernel/page.rs | 13 ++++++-------
> > 1 file changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> > index 432fc0297d4a..b78473b67003 100644
> > --- a/rust/kernel/page.rs
> > +++ b/rust/kernel/page.rs
> > @@ -26,13 +26,12 @@
> > pub const PAGE_MASK: usize = !(PAGE_SIZE - 1);
> > 
> > /// Round up the given number to the next multiple of [`PAGE_SIZE`].
> > -///
> > -/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
> > -/// [`usize`].
> 
> Can you document the return value? I’d find it weird that this returns Option otherwise.
>
Sounds like a good plan. I'll document both return Options in v2. None
if the resulting value would overflow a usize::MAX, or Some usize that
is page aligned.

> > -pub const fn page_align(addr: usize) -> usize {
> > -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
> > -    // cases.
> > -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> > +/// Return None in cases where the next multiple of [`PAGE_SIZE`] would overflow a [`usize`]
> > +pub const fn page_align(addr: usize) -> Option<usize> {
> > +    if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
> > +        return Some(sum & PAGE_MASK);
> > +    }
> > +    None
> > }
> > 
> > /// Representation of a non-owning reference to a [`Page`].
> > --
> > 2.51.1
> > 
> 
> With the change above:
> 
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> 
