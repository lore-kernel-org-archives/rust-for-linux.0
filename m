Received: from outbound.st.icloud.com (p-east2-cluster5-host1-snip4-1.eps.apple.com [57.103.79.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4024E883F
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766470267; cv=none; b=O+R/k+Kj87PwED47L8WCGzRKqFUOwyqV3zgE/BE/hpBvEruq2/EV1Gw86ut9OTYkvfhhHjOkXJbCHM2q7BEkHozjB6xqPYIDv2CGpAi/GZd5uFH8yi55KSkLEj9H9aaMQbJBfD7BBP5BbLLpYPAyJ8zdDs+lQrrrj7wHTh/1wb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766470267; c=relaxed/simple;
	bh=PMn/Xt/uk0Fi88EhUegbm1jhHMbBhLKjEL1P5KoirQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUFfKGnFpoVOHL0IkqiHBLMps0R0iQz4KMOCW3reAuGclUdR4yUuw6hjAbMWjCOFtwCJMG6Zq11Rz3SWw7DHUMLGOT862uP+oeJUviO16hqngQoaiv5f6nP6qBC5Pu73w+xwx6BrMdNIPyb8gc8F1RQvrKtX5ge0G24jc801MXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=dkPNA7ix; arc=none smtp.client-ip=57.103.79.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="dkPNA7ix"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-15 (Postfix) with ESMTPS id 7285118000A0;
	Tue, 23 Dec 2025 06:11:01 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=PgFncF/RAuPmSd/ndbWFGHlEySnfTyAhpN6Jo23lMt0=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=dkPNA7ixGNjp6V5Mf3oPEYh6bIgPuETaNIcRLNKqGPLfXL1/WlYAksqTjp3El6gfil25yHPM+jzlJQJaLs1HYAAAuaHDWuoYm6b5NguMsEsuYuOTEVD7n2vmziM+nzaOJ6IW3pfQIztJLgD3k0lN9RxU9aldHIzi4ZOyUOZP/lEw3q3C/rP83LXI4nX2xcdTKuAjeM5SHpJm0LI1JIpZ+PuIRLbrhVyUVP/fEuYlCIZm1uePevW1oapw3RzeqJzVsLxsf/NZpnse+3NBKd7QGG8DMvWfjkUdDy+NSmA5eO3lmPm99vC8paYX0JJRcOZs+k+KkKucRiojGs+KmEQhjw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-15 (Postfix) with ESMTPSA id 003DE180009F;
	Tue, 23 Dec 2025 06:10:58 +0000 (UTC)
Date: Tue, 23 Dec 2025 16:10:55 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: aliceryhl@google.com, joelagnelf@nvidia.com, airlied@redhat.com,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/nova: Align GEM memory allocation to system page
 size
Message-ID: <aUoyb9BcnYS0xp8f@fedora>
References: <20251215083416.266469-1-bshephar@bne-home.net>
 <DF1DDD8BUIYQ.1YCAA8T6557NP@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF1DDD8BUIYQ.1YCAA8T6557NP@nvidia.com>
X-Proofpoint-GUID: qrFTykA8JDHO5cXb2BsBDRPj8ldWf9Iv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1MCBTYWx0ZWRfX9/eoxI1WLkk8
 SRzMXAOA3mK5OdYUW0I5MYgeNffdMLh6X3Uuo6yb94o5hBn9u5wpNaAd1emZDzfpXNERZNu5yTo
 Lvn9OHqh4tZQ0svCJS8N3QalBFj1bZJqISvLjiKdFvt57SjX72v11sVwcvqmmKcmaZ6DoTXfwf4
 l+l6NbJfe1XlCZkbfS/Tvl6nDyWjajMYeVc2X1CEpQ3ahy10FWo/xVzkf/UEBIxTB7FRaBecCOl
 pX/dc0cAkUzc6iBXBCNj5tqFHrWKIXF/QzC117lfQYeUf2JwpgNQrFsrA+N32zKIX/GzZfQGvuT
 DpVFISwDg1LKicXnj4b
X-Authority-Info: v=2.4 cv=BJG+bVQG c=1 sm=1 tr=0 ts=694a3276 cx=c_apl:c_pps
 a=YrL12D//S6tul8v/L+6tKg==:117 a=YrL12D//S6tul8v/L+6tKg==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Tqo27WzTpzf5rUx77aUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: qrFTykA8JDHO5cXb2BsBDRPj8ldWf9Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 clxscore=1030 mlxlogscore=714 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512230050
X-JNJ: AAAAAAABrBUh0yJo2WecKsw9Hv3boXtZQNEIRW4PhSyfeYiRT8qVuab8LUmVdCsRfjA1SWwhz+kAi9d2GfcZy1oQxF0AgF5nLnwwDxGYMj9UJufxAj/2RA6V4zXbfk1yDPZcY2rEudqjhH+btUbf0Nr+d8mFa2mGR/y0NHjB0vJgO9aM8mcoPlj3SvM46gi8Q7gBq33xqQxrD+qspyQW8Na/hHiGcA0h/TCJaHlUBsctrK2TTqIlPNCPAjLuggR87MJU4KDs7dxz8UIK3Rn3BpSB56ggs3ls1CAekOi+3AgjNyl6z6ZzlCxM03UKrsPqSXk4oLYOl3B5zJDJCxMYa9L+WOhX0cvOcaLjCND+3DAOFjvh/3e5mkps6/5cAYtWP9qVsyLRF+bjQqBlqDh+Qoi6SHuLN9VdaJ8nX+1ByKn52KsDNxX907rqgJA2A1vA46LvuAf0zXLCZS4twlebskemMsa/XdcHRPiT2uea1Z4MgSy71Wl4D8/xM2VnlBo++J2kbozqV4x9RvnrS5UVZv80A/AqojIpbRL6jS4Zvjn5jEESbyNJtIAS1B+FXe/pq6Sv5+llzztd8c4bmXtPS3etG1jg+USziuU0FrnLjWXZllYKLojLBva+4naVvQgSWEGSmiSj5L2rgzW8c/SuI66H/WmEQrmo8z01w8bYeSRi

On Thu, Dec 18, 2025 at 10:16:48PM +0900, Alexandre Courbot wrote:
> On Mon Dec 15, 2025 at 5:34 PM JST, Brendan Shephard wrote:
> >  impl NovaObject {
> >      /// Create a new DRM GEM object.
> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> > -        let aligned_size = size.next_multiple_of(1 << 12);
> > -
> > -        if size == 0 || size > aligned_size {
> > +        if size == 0 {
> >              return Err(EINVAL);
> >          }
> > +        let aligned_size = page_align(size).ok_or(EINVAL)?;
> 
> nit, but it's a good practice to always leave an empty line before a
> block of variable declarations.
> 
> >  
> >          gem::Object::new(dev, aligned_size)
> 
> ... or if you prefer to avoid the variable altogether:
> 
>     page_align(size)
>         .ok_or(EINVAL)
>         .and_then(|size| gem::Object::new(dev, size))
> 

Sounds good, I'll use `and_then`. I like the idea of not unnecessarily
assigning variables just to use them once. I'll make that change, re-test
and send a new revision of this one.

Thanks!
