Received: from outbound.mr.icloud.com (p-west2-cluster6-host6-snip4-7.eps.apple.com [57.103.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF1C224B05
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082506; cv=none; b=lWhXgJv2AVjDOrck1KrwsUkMwi5PzxQi6s9SxN/qjtwyGgJjlmSygvY6KIm0XAq5+mL19AQj/jENGE0///9j5TNfh11d2mP3021n77s9H2XG8FHkHKRHMZzg5LtHsGFBfwrepkqa1g/uYTVIg1iwgzLg9qsGU4S8F1FJNYS0YpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082506; c=relaxed/simple;
	bh=bn6PqNk6K/O6vl3olQCMNwUL8s069H+Swm4RmzKe0DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJy/Lm4MqCbTXxAa3uvS/Lazn34wOnH6K48tlUquEPchaZ9NutajbVDbr9BvMTyi+pwfmiTUO0pi7bdGGC+17TtP5nVIyEN2NIhuxXU9bejLmT64tTEMJLHTOtsRrI2XB9S0+UsTgXVwyaBS5SuOgpnxTs5pVlvruwQHIIkE2lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=e26CbfBs; arc=none smtp.client-ip=57.103.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="e26CbfBs"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-2 (Postfix) with ESMTPS id 4060618000B5;
	Tue, 30 Dec 2025 08:15:00 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=Aiv+Zhw1hr5DJqpXk3Ura8/HH9itShxSanjwMbazrqA=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=e26CbfBs6iauqDKWQuAaeZiOcQqt0AH5eG5GlTUzJoUNrlD98Aj3tL4uHVkQCTR+GkmO+1XAOU5txJCCTbgKheHgKX9Ln3wD1bpvcUsyOGY/uUGnXZa27HUM3Li70CDnfkwU3qhWBwKpKHObZGzaAGUraeONGWIVv3zhy+ELcdBvprgMm5SvHBHTdXF9bYa93K1ppgSKlPl8nFkjcTuuOeE/6GQRrvIDCixxnYyMBJgbI9EMGHSl4aAGC9nsbbiFIBWLtR0JopTaQB2CWOZyqD6WaOr0s4jJ8Jq7QnZev40g/jWIdR/qCqEGKbEw1FXlCD1lG+838ahl3UyBqjCcDQ==
mail-alias-created-date: 1746336505199
Received: from fedora-g16.bne-home.net (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-20-percent-2 (Postfix) with ESMTPSA id 75E8718000A7;
	Tue, 30 Dec 2025 08:14:57 +0000 (UTC)
Date: Tue, 30 Dec 2025 18:14:52 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com,
	miguel.ojeda.sandonis@gmail.com, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8] rust: Return Option from page_align and ensure no
 usize overflow
Message-ID: <aVOJ_IOmAJrs-L1l@fedora-g16.bne-home.net>
References: <20251223055647.9761-1-bshephar@bne-home.net>
 <DFAS5RWFNUCZ.3L6IQ6BB4NEQY@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFAS5RWFNUCZ.3L6IQ6BB4NEQY@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA3NCBTYWx0ZWRfX1HX+TPqW50qN
 El0uf772V/U3WFkLMZbnXk4+ySOCzZA0LH9Hdj5Km/0tUumWPIJUADps0IcN0cxXEDKUlftNXz6
 ljDApY4eJSV16GncqiPwgfxgTJ2MHusBDSKjqSnEiNAe6u+UwZ25mK8RFcT4BsJLXFCNJJcb/hU
 zcb/MGyqsqISxnJAKMXY62GiOs9Hcvu+FLQes6onsCPwZFJOitrDEHIqhyCcRzIScGpSE4anNX7
 XGQRRekIjztw98q8tggs9bSCfFX1q/ps3uewwb5Jw63UdyOjhRGI1VGGhiW+RS5vMdHL4p9+NX2
 DsVBjCKeO8qYx9Qq0ND
X-Authority-Info: v=2.4 cv=I5Johdgg c=1 sm=1 tr=0 ts=69538a05 cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=JppZAXPjAAAA:8 a=1XWaLZrsAAAA:8
 a=Ikd4Dj_1AAAA:8 a=QX4gbG5DAAAA:8 a=7zlp64k-Ffg8XpoA6g0A:9 a=CjuIK1q_8ugA:10
 a=mTXuAFqUwmiQvsSFmwXH:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: TRmszSpE6sVeZo1WRd6gZWlvLuBX8lI3
X-Proofpoint-GUID: TRmszSpE6sVeZo1WRd6gZWlvLuBX8lI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=545 malwarescore=0 phishscore=0 clxscore=1030 mlxscore=0
 spamscore=0 adultscore=0 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512300074
X-JNJ: AAAAAAABdK9p8O33T1e7Mun0WwGzSe4BrrZaK+r1cdSImHAvikiGO0Gpcvx04V2H8/ZkaVP/kwfZKgJIreeZGA4jSw6i5qXv/Hwy0HOjsRdLbMiFpCUEzg/pWh/6seSDIxwxIbetPoibF5N7SFCCn//OadaYVyjrZhKF1LxGOUhM99M1Se2k53MrB20azfC5phwwjkSAJEq03n1qLgaiSqsPiyRpwyyJl8rOHzrhODHuf3/wTwHgu09J5hL27CDfJb+4ZgVLF9qIYCNR6O+BkX+Tfsn76gy3KH/J8chXRD7G+P9pXyx257ze2kQ/JiJOKT45rcZjQ1Oh+yJ7uhq9PFZbDOkG0xUMCPxD8yt6TbpswmV3y4x6Ux124slaOpj3nYp/HSWW8vROEqTclmKHuu6R2ITUFokNbOsqfHzVv+gCVoh0NU+7GcbeMeBM1IylzmOgYnUI80R0jNnFRTwrVdBTUwmOv0vpJeThxbsE2bSFnL0iKC/6SXwWiQvXLCMJfxM+n7ZZHr7iDe4gdyJhw+Es3IEVbRl2yNmwVgB4YF4i2TCnltw3nmPC07BaB5V59v0kY4LhIje2ZqP2qqWbUn9wMl8Z9KTCjUzCRiQk1aKjdzYsddBbQASsC3VW/QLSHympCjjgQRf7slzpcURYT2CC8xHAhRsdDBJP1vKwguqu0fM04o2sl302tFBLS5V9V/Tj2axIREM=

On Mon, Dec 29, 2025 at 03:46:09PM +0100, Danilo Krummrich wrote:
> On Tue Dec 23, 2025 at 6:56 AM CET, Brendan Shephard wrote:
> > Change `page_align()` to return `Option<usize>` to allow validation
> > of the provided `addr` value. This ensures that any value that is
> > within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> > returns `None` to indicate overflow.
> >
> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> 
> Applied to drm-rust-next, thanks!
> 
>     [ Use kernel vertical style for imports; use markdown in comments.
>       - Danilo ]
> 
> Brendan, can you please send a follow-up patch addressing [1] and [2]?
> 
> [1] https://lore.kernel.org/all/CANiq72kcMLXz=xyZeKC0=j_e0BzJEY3wGpBTTxfJsc6EZhCnXA@mail.gmail.com/
> [2] https://lore.kernel.org/rust-for-linux/CANiq72mLPvB_6Ow3bW5-V4-km=RyA59chQ1g1x9qUt2P-zZweg@mail.gmail.com/
> 

Hey Danilo,

Thanks! I can indeed send a follow-up to address those.

Cheers,
Brendan
