Received: from outbound.ci.icloud.com (ci-2002l-snip4-10.eps.apple.com [57.103.88.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18AF30C359
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668283; cv=none; b=rA0B7Lfv0c/LEQ+Q/VmwHjpAJKU/llrqus/3bfXzn0DIk4dsq/rbqMqbzUXE2CxyCxfXIZUB8yDBsEg9WWbcGu7jIrN5td6uKwpkM/FKN4W5hRJzOSX2x63HEo9Q80AXQTWTH6D+YKyLP/u15GbPPNieaENl+hcRXTVlOOEqlBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668283; c=relaxed/simple;
	bh=7nZ62pNdxrSPtUF21DVbf1v2EmqxsUP0QrTLLdFMtv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtzdtVM8AYpOKGgJttael7tP8p0urd7+T1LaEAAlXlNTMTf3xy7D3lcig5lv2nLkc6I08hHzjRtwWgjYbK916piTwyEy8+4wBiUgRKZly3lrp40XAArz3MTirVxh5XHnlr1GcuTqLqIvTncyz6Y2xT4R0plh9ghTBjy8M1Ye8r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=TsRkjx50; arc=none smtp.client-ip=57.103.88.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="TsRkjx50"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-8 (Postfix) with ESMTPS id EF29618001AD;
	Tue,  2 Dec 2025 09:37:55 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=FpZSAZgrCSnmOl+rWSasdbiz6I+roIjShmUAwPz6NMM=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=TsRkjx50GTjLBot7MlWsPj3h9yTZTFvXv6fnJjloG6Pb1RnEbzlnbCjXsvEZ9guP+6NefZnFjLm3DWhpL1Se5NbfVq5SI/iRueOHVTWDnuBeSz3Exit4aXGKvQSWhwiXPYVBL3n9ullWEqh0X5UAwXamlXiIcB0ORYDj/u18uGmmy8WZR94fuN7nqzw7xYwaZoNtwOyOMbIXexp8Mni0rrik0B8LWDYLE5FVou8bn9UGBrV5YEucJR0l0V+OoAjM2cv8rwEMFJPUrCNNnGYOYJQom8qZrmsFd5g/kYRABlfIHUukCKfBiAvOrQ1UV9lkAoGzGwN9Uy8uG7iNv4VR3Q==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-8 (Postfix) with ESMTPSA id 6CA3718001A3;
	Tue,  2 Dec 2025 09:37:53 +0000 (UTC)
Date: Tue, 2 Dec 2025 19:37:49 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: miguel.ojeda.sandonis@gmail.com, dakr@kernel.org, acourbot@nvidia.com,
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5] rust: Return Option from page_align and ensure no
 usize overflow
Message-ID: <aS6zbbP3BfBE2DJ5@fedora>
References: <aS0rkCpdbRu9n4p8@fedora>
 <aS1qz6WjjP8E49pY@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS1qz6WjjP8E49pY@google.com>
X-Authority-Info: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=692eb374 cx=c_apl:c_pps
 a=2G65uMN5HjSv0sBfM2Yj2w==:117 a=2G65uMN5HjSv0sBfM2Yj2w==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=WDRH-SJpgfnRsos6XEoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: mShiEa0MqsPzL4FGqmjlxQSKd-FHgqgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA3NyBTYWx0ZWRfX617yEV6KzUB6
 W4eipqWKFxy3DuIoG/6ZdAEwIjCw4tV6tJ0vWst9P9eoNLvsiH3Hww6g/kojU079D3wI3U4O8yl
 BcdX+6UD3+ZM2/Nd+aHx3hS2MdLwbzKqqP6VOeKBzaqsrea2PZMohXMcyUYGdqtnViLtPlnNV59
 H3hIysfUSzQGEugIpErsxpuI7yt3BZ88Kgrf42YLshDh1QCbXcNSBq2v+wlw7/pUUE+lmSRWous
 E0mGHqmNeX2QI616Z+SFu+rwI5OC1uxmmMC19Rs1njaQYQbkAKLRJvP3zsJHaOYmTQbVJ2d1IMC
 gwQHSuEmB9VUkT3Bfac
X-Proofpoint-GUID: mShiEa0MqsPzL4FGqmjlxQSKd-FHgqgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1030 mlxscore=0 malwarescore=0 phishscore=1 bulkscore=0 spamscore=0
 adultscore=0 mlxlogscore=396 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2510240001 definitions=main-2512020077
X-JNJ: AAAAAAABikUtUm7LivMXqpxKrETdr8l4BTs4NEUtPM9vyucvy3pXig6kRiUInwArHa6oBD4d/Xww6YLOzmeSA/jlPNR7B1jUFip2O8idLpgucuru2TjGv9OkpMRvPmVGNiTS/qx8zwUdoFzA3PU9v32YTGAlSfOZRaFDADVY4Lcpf2Ewnfd2MRnOFjmpaBT49ViQch80dyIEBPEyKdGKo79/JQPMOE92exEkLi+YM4S9h4pqs16WpxrRP+/RhgM3AbnRbjLxNxD8pSOUPVKnJedWpl5N1GACzoF088fvCmx3mN52d0I+0egGAVJlRMos2ju9gBSc3Q3EpsuqcijsSZpdRNj/dRQFusIJb4KHmDTuwIEeAzT1/C3bjUv8XZqmpI0WyJBOnKvozbG47jZMmVFqJgTMdgzdEMTo1EeWB12xt0bBywvuAGcARS57F2I7Sq575kXRddV7takt+qktOYzC+ntN3QV0znpL/PGaq0aDVazX+VpqjWPZHmssNoA4M5V3ILgi5Rb2KlaEbFJ+LpJLroN0thqnMOi3Yag5ADnwf2z4eJHDekchg1Sd4zbdn/FGkT/nFAs2NaqKySfEI5xGPYQ9NBm+DVaezh4heP+RHU36QJYiIis1EsjuIzIu+jUcqUhQFgdANHem7qquRyY/H6UxD86jCLJN+ugeppjVPNp/hQr3jVnY

On Mon, Dec 01, 2025 at 10:15:43AM +0000, Alice Ryhl wrote:
> >  /// Round up the given number to the next multiple of [`PAGE_SIZE`].
> >  ///
> > -/// It is incorrect to pass an address where the next multiple of [`PAGE_SIZE`] doesn't fit in a
> > -/// [`usize`].
> > -pub const fn page_align(addr: usize) -> usize {
> > -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow sanitizers in the wrong
> > -    // cases.
> > -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> > +/// Returns a page aligned [`usize`] in cases where the value can be aligned. Otherwise, returns [`None`]
> > +/// if the aligned size will overflow a [`usize`].
> 
> The first line of doc-comments is shown on the module docs. I think it'd
> be nice to shorten the first line.
> 
> /// Rounds up to the next multiple of [`PAGE_SIZE`].
> ///
> /// Returns `None` on integer overflow.
> 
> People reading the module docs will get what they need from "Rounds up
> to the next multiple of PAGE_SIZE.", and if they want to know details
> such as overflow behavior they can read the page specific to this
> method.
> 
> Alice
> 
> 

Seems reasonable, v6 sent with this adjustment:
https://lore.kernel.org/rust-for-linux/aS6y5blasMX0KcD7@fedora/T/#u

Thanks!

Brendan
