Received: from outbound.st.icloud.com (p-east2-cluster3-host10-snip4-10.eps.apple.com [57.103.77.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81662E093F
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088527; cv=none; b=R+6yKqL+vg7+YWtiuQMFstNg+GUbHuhtbQK4hfUyutD2yYqsnObOwF4xxmuriIeUyYyn99SeqGPcXQ+jlo8gk6s9Fo84Gi6qo2YRKKvAZd1HWeQFPcUhXf1ITeqIhkE5xw1DrcdxQltpxlVI8YTeHijF38gmzuXRagFjVReb3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088527; c=relaxed/simple;
	bh=JmfkBePxkuP3NAAzSYSLmFVc2k9URYMaQDLxWT42YlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXjuh+0dzPCjtP0qamyLQswZIQjJ3O34yD01vPYeitIO4E+BXF/DnwBkmvKVm7hwlEIQQMScaaNEw6C8S6b2FTh6o+tRW/9xoAty70jtaXAqwBqJ/hLwcxWtW71I3h4RIQs2RfN+fJMxMhj96MNy7Ch/Y8yA9j5bUg7D2Ez2J7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=ArpKY1wu; arc=none smtp.client-ip=57.103.77.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="ArpKY1wu"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-4 (Postfix) with ESMTPS id A129D180055A;
	Tue, 30 Dec 2025 09:55:20 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=jmDYq0sZYNfRXKy7F8dDdYiishtx63bWrkF4Fhf00DU=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=ArpKY1wumRPypHpgTLEa0HKDKnByOEgxXG3bYfOEDNSpEJUsm2v/VPKDWfMHWjP3E/dawYhWE6vFwWkPwppg1AOb7V9QxMFs0Do8upBqFen1n/nMKBGRx5fwLXFeJsnZZw4PFhz9YvrnWXcGJ9LkQwYfcoWI/nBzX5FgRuf8nzP4YuuS6Gr48TF3vqNP8YUYo2XWKUr6sfpBnPMbIKXCX8eEq56hOnBOjNRR+EcrvDHkUFDgwI00JUaoj6UdRuAUo6dAkQ0R2yORRL9Q6x9lEwdjtu7c44DXVFaTTH/QiJg48laP0FkQUeiixrHboyOJW133yZrdevlByB4o/mgyBg==
mail-alias-created-date: 1746336505199
Received: from fedora-g16.bne-home.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-4 (Postfix) with ESMTPSA id 3532A1800543;
	Tue, 30 Dec 2025 09:55:14 +0000 (UTC)
Date: Tue, 30 Dec 2025 19:55:09 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: Test page_align usize::MAX boundary edges
Message-ID: <aVOhfWmyJBxD4SUa@fedora-g16.bne-home.net>
References: <20251230094841.76830-1-bshephar@bne-home.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230094841.76830-1-bshephar@bne-home.net>
X-Proofpoint-ORIG-GUID: eDq-KvX5c89fLpQ15zl4qfk3YuBty3Qi
X-Authority-Info: v=2.4 cv=OZuVzxTY c=1 sm=1 tr=0 ts=6953a18a cx=c_apl:c_pps
 a=YrL12D//S6tul8v/L+6tKg==:117 a=YrL12D//S6tul8v/L+6tKg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=JppZAXPjAAAA:8 a=v0bcC3016m_wzupuhzUA:9
 a=CjuIK1q_8ugA:10 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-GUID: eDq-KvX5c89fLpQ15zl4qfk3YuBty3Qi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA4OSBTYWx0ZWRfX5PILfIQ/g32F
 JWSRAWTyPOXs0NZtxB/go/D0LAxZqCLnGkMsFOeaJkTbBzpbXeuNdccsgpiVlzNino5EzfuXsd/
 UbyLVKqdtLeKbOTQAQF/AvXuqwwQGgg8DLQbX1aFKosBa2t96U2rWorMPvA+gy8RbX575en/E9v
 hzBmcN0UgnSlSLTq+DlvtO5MXbPBKKx4prFozEkOA/EsV3PjGy1J08YvWjA4rA0rr2FDEr8y6qb
 6NkeW17Cq8wueRyY/JDJ53jgpvfafOd4Lj6lMvlwLcixhtJJJAea29bIXqwNcT7PyFLVsEMm04k
 Ed8LhP7yi7mgu4xORFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1030
 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2510240001 definitions=main-2512300089
X-JNJ: AAAAAAABYN/C2DwERd3qtqUnOxp39Bc6oM1b3Y6SSCL/RzFDy3YqA8swtbyNXxSSFR9dsT30sy8sYRm/clpCUMylsCVQ8Z2oV28mdBXYIDhBCiJZF8fCzeIQxm8Lv0IbwHFJahlwL4LmUZP5IKtLQUXw3aOcgCGoH389Mnvgylvt0gntGyuZlZxhgbRzRIt3uGf6YJsKL+0LUXPPiG0MyKjANVarOsM7+Q/deOa0Xa5TBFaoAKNN6OioYnp/+i7esyQGFnLQOF7L5k6WndA6lKrdmK8sNem0I+Wvg3zX9M/vsK9fuAXIKtsm3YBLLooAi/iT0mo+2ECLMchqaGnTTvMpmLhmY0wvuA+Oj4g2Yu02tcdBnJepqUMKKDNmNZVeOc/6M/AL8fYwBZqIWCUtGOog6/snC2+gMY3zx8sNuInFvA6SbEQvkTIqBV1wfzrvup6/Z9wFWQK4Hi+uUYoW+e/kI9L2aAH1IkKZgVktcUZKmUM5g2YNWp9qSbSTODHfwopJ0IdTwW6vLYTsF9HFn+Z6z+VCPA1Ldwy9X20iF2YP2tIhig3B3jIiFbeySmKByI7gSMb5GRHKV+f26ofk7lclVI44C9rlqtkmOQ1jKDUDYeaVFGJuMZYdYduWdl4YTeAjIkuYI0Hb+fsOG88TbUejyjJ6wjO1DcvzQJ41vjEaKFLexbe1lDEolaR362jVwfFqf5d7x4WYdAxijrhj43ghZwhovASa2o8d9HjljvMONGmNQnxte+RG5bTL2SEtTXtAuvwj/8QvVcwYwdNVQnUWjQvWE5Kg07asgsHW60DhZA==

On Tue, Dec 30, 2025 at 07:48:41PM +1000, bshephar@bne-home.net wrote:
> From: Brendan Shephard <bshephar@bne-home.net>
> 
> Update `page_align` doc tests to test `usize::MAX` boundaries
> rather than arbitrary middle of `PAGE_SIZE`.
> 
> This patch is a follow-up of:
> "[PATCH v8] rust: Return Option from page_align and ensure no usize overflow"
> 
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
>  rust/kernel/page.rs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index adecb200c654..d602d4231f56 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -45,9 +45,10 @@
>  /// assert_eq!(page_align(0x1), Some(PAGE_SIZE));
>  /// assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
>  ///
> -/// // Requested address causes overflow (returns `None`).
> -/// let overflow_addr = usize::MAX - (PAGE_SIZE / 2);
> -/// assert_eq!(page_align(overflow_addr), None);
> +/// // Testing boundary conditions at the end of the address space.
> +/// assert_eq!(page_align(usize::MAX - PAGE_SIZE + 1), Some(usize::MAX - PAGE_SIZE + 1));
> +/// assert_eq!(page_align(usize::MAX - PAGE_SIZE + 2), None);
> +/// assert_eq!(page_align(usize::MAX), None);
>  /// ```
>  #[inline(always)]
>  pub const fn page_align(addr: usize) -> Option<usize> {
> 
> base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249
> -- 
> 2.52.0
> 
@miguel, Thanks for the pointers in:
https://lore.kernel.org/all/CANiq72kcMLXz=xyZeKC0=j_e0BzJEY3wGpBTTxfJsc6EZhCnXA@mail.gmail.com/
https://lore.kernel.org/rust-for-linux/CANiq72mLPvB_6Ow3bW5-V4-km=RyA59chQ1g1x9qUt2P-zZweg@mail.gmail.com/

Let me know if this addresses the points you were raising in those.
Maybe you just wanted usize::MAX and then one over? The first test
case might be unnecessary. The last two do a fine job of illustrating the
point I think.
