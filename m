Received: from outbound.mr.icloud.com (p-west2-cluster3-host10-snip4-8.eps.apple.com [57.103.69.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E03227B94
	for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 22:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764541338; cv=none; b=KnVRysGMCCXYJXyxxY7aZ/gP40zex25DKcywzKOs3vj5pKJaOS92TH6f8NH/rzt0EHx07zeNATN/P9cYxq9BkkUghw/epjlgDNWZJLl+qBE3wyB49qmRGlzvbiylkxKR85yficlBZV11nUjQduE+iJQM4m/sD+xzShheN/R6qVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764541338; c=relaxed/simple;
	bh=srgDg2KumQnUt8YJr+SbaRQa0heKiN8bmfYu4v2re/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmMz/gtssi2n3YsszPu2A4deil1pzwYxAehg24QL5tzLy1c//i7+2HkrjXV+TW520RVi4Sxo27UJIgQWgCcexCqJfqLFdXGLraH9phgPmzMqDuNeOKPDCJbwK01EaNx9Q6Kx+zB6C5+80eTyk0IdU5Qn3KAPF1vhxQntYPWbtTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=WMZRdrZc; arc=none smtp.client-ip=57.103.69.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="WMZRdrZc"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-10 (Postfix) with ESMTPS id 208F4180019F;
	Sun, 30 Nov 2025 22:22:12 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=Bve+8vjHglAR9j0vNZXQjhZvDx7S0b9U/raBc1nhI1k=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=WMZRdrZcQOXjvvqErcTkpKV+3+kTuRMjBTFrhrLLwp9BIXd9cU2h+S4RNpv/hM92gCh6SFM7unHfBE3Vs0GLkFn/yByUiKBfpqAMA3aaJnvegBED434UqNQCrsjvUmhqIUkXilLPArPjqu41rfvqgnC33zSJRPq5PtIXIxyMkQto1afTEtDjUhmxrvDput38AcJUbhQtJjeD+ZXxTuc+NdAA69KMkfuj6WeFMRIV6kmBXhgmiG4r0RYvCZBdVpjGSRyzkW5UgmZXhHOAc4DaSZjS5sj/wJ+1tCpEPLNmyYDVOiForZx/K2YqSTiQYjg6SwpteXtEgfx/OhEVa9E+tw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-10 (Postfix) with ESMTPSA id DF8A41800183;
	Sun, 30 Nov 2025 22:22:10 +0000 (UTC)
Date: Mon, 1 Dec 2025 08:22:07 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: aliceryhl@google.com, dakr@kernel.org, acourbot@nvidia.com,
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: Return Option from page_align and ensure no
 usize overflow
Message-ID: <aSzDj1htLp11eCWF@fedora>
References: <aSpEWf8ytDn_laHh@fedora>
 <CANiq72mLPvB_6Ow3bW5-V4-km=RyA59chQ1g1x9qUt2P-zZweg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mLPvB_6Ow3bW5-V4-km=RyA59chQ1g1x9qUt2P-zZweg@mail.gmail.com>
X-Authority-Info: v=2.4 cv=IKAPywvG c=1 sm=1 tr=0 ts=692cc395 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8 a=LSLWLLndY7D5GGP9q-IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=HsIHSPPcIiYA:10 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-GUID: x2ImoQ_bBqhAojF0deCVBRtrkQLAtATO
X-Proofpoint-ORIG-GUID: x2ImoQ_bBqhAojF0deCVBRtrkQLAtATO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDE5NCBTYWx0ZWRfXxiPQIlpINwYM
 tqRPoYEFaAwP0qGKnoopgBFdZb5i2Wk/GNF1ejsh6pixf1nhbvC+CTInbN2vTuUMKxIf979TBjz
 L3Xki0rbBhzPUEaUTOV8+DZTY+v7+8ntG0eegU5qRzGjuVHODRpmrqj9UbZtbAaKrBjZs4nfBXd
 ws7dwRoxjmLc6IwPnsasy1noNKTlB/P32cAqSvhnjg+SK8LQxsJj391KtHxrX+7wIQ11iOiS6sQ
 CiRI3Ul/XZGt4VpoCLk1URkCMkKUGtoMtE8VNNmn+KXcWjGWCha39qLnrCy3G3q6A8Sa3DlIFtR
 pPWPMyyhItAIt21+R67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1030 bulkscore=0 adultscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511300194
X-JNJ: AAAAAAABmphusoZC83oj1SyXixS9GKFjBflMeQxc+o0F41d1+gt6Ld78OTz/wVbtaUKibFQldYp/acF7PUcINuIV94sps3xeSXJ0aMOszr7Z0j8s0AFYTxyJZX9v6PV4HIUsbblrg7D2kbJDvZDruvy0Uqckxzph3kU5up5DPbs50zf3nCkQR5qyIUKWSPqp9gsG+fFeEQ4GCOb+2mo17NQWF7Gbo2LR4jIV8QzV6GrX3NLW6F5H0v0i0TOzExDY16314M0aStbV5w4wtMQQwpJcDiOkh6jQ4uE4UUSrnbprdfMfenbeF/9zwA2NwxjxylxVCHe1FQmWfVSnshnPm6xfOp/6WIwME+32KcYbZzb72kReZKqhnCx76oM0KeLEwcRbkVyV/haYUg+pZZAqRAWejhU9gNgyU3l4VMmRExUMc0SX4ay2IcOzR5C0z6oKSUrgTvCWNyA/J4Pg+pd+wcbbHNUpYH6LX1XXx4lhmZbKflqyOBxvA9sq+nRrBHNKAbK/33XMAK++qZ4tnZNJQNfHgOowyGYO/yHgzkhKw59q97DuxxZA8V2e/R2IqovaHsJrqv/F/DooKPFNC16n6o73/f/BzZKi9ugGW6mxf7xIW0gbraR7y+Z10PXh44r+1BM6aDCqAszoPBjJ3/B2KnG0jN6HY27//jP2madNHJs2JGny0dGFwsqZN4+wtliL162PJOXhLdgqFeV3GOg=

On Sun, Nov 30, 2025 at 01:01:58PM +0100, Miguel Ojeda wrote:
> Hi Brendan,
> 
> This looks much better now with the examples!
> 
> On Sat, Nov 29, 2025 at 1:54 AM Brendan Shephard <bshephar@bne-home.net> wrote:
> >
> > +/// Returns a page aligned [`usize`] in cases where the value can be aligned. Otherwise, returns `None`
> > +/// if the aligned size will overflow a [`usize`].
> 
> [`None`]
> 
> > +/// # Examples
> 
> Newline before `# Examples` header.
> 
> > +/// Assuming a `PAGE_SIZE` of 4096 (0x1000):
> 
> Can we assume that? i.e. these tests run as KUnit tests and we support
> architectures that allow for other sizes, so we may need to guard
> these with a `cfg` or `if` (which may be hidden), or perhaps better,
> you could compute the values based on `PAGE_SIZE`, e.g. something
> like:
> 
>     assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
> 
> It would be nice if you can confirm the tests fail (and then work
> again) running them in a kernel config with a different page size:
> 
>     https://docs.kernel.org/rust/testing.html#the-kunit-tests
> 
Yeah, good plan. I rewrote all of these tests to use the PAGE_SIZE
rather than static values, and I've tested this change on Asahi with 16k
PAGE_SIZE.

> > +/// // The check asserts that None is returned when a value is requested within one PAGE_SIZE of
> > +/// // usize::MAX.
> 
> `None`
> `PAGE_SIZE`
> `usize::MAX`
> 
> > +/// let overflow_addr = usize::MAX - (PAGE_SIZE / 2);
> > +/// assert_eq!(page_align(overflow_addr), None);
> 
> Is there a reason for that particular address? If not, perhaps just
> using `usize::MAX` (the maximum value) would be simpler. Or perhaps
> the edge case (the first value that returns `None`) would be better.
> Or even better, both.
> 
Yeah, I originally just used usize::MAX, but I wanted to demonstrate
that a value within 1 PAGE_SIZE of usize::MAX would overflow and result
in the None condition. The function would accept usize::MAX as a valid
addr value, so I thought doing it this way with a clearly named variable
showing the logic might be more representative of the logic.
> Thanks!
> 
> Cheers,
> Miguel

Thanks again. I'll fix up those docs issues and send a new patch with
the modified tests as well.
