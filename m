Received: from outbound.ms.icloud.com (p-west3-cluster1-host11-snip4-10.eps.apple.com [57.103.73.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633EA2FBDE0
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.73.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766469829; cv=none; b=hd28/HhxAr1kEyoAoh1u4xdgog1W/rWJoTd7nPK6xTow/ADo8IRWoyhupaDkR02fTyaSux9+GRZUkNBaFPbeA91owvs2gaRpYYTFFtj0nrcm4Uyfi3ysiOu+ndPEy7m/JywO8yBYAVaCUzOUhKfENR5P4iPtCCBNQRsyMXB7ZNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766469829; c=relaxed/simple;
	bh=5N+ppz6xW3EQX4KdAXNoQ/tJIebH+jA4eUMm2GWEMSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AU1Z6bcxRpwfw/hwaGncPPXgYwAWLSpIdBnUvRq7mep74yRcGNbkk0+xvT24/0y2z3SFSIBQTzuLN9Ocxf7aR2M/sFTTNNQQcgTK56pGZNsS4XMv19s215/963TtdsvwUUtxyGXaCIB+igYidyGb1yLU5nDgNHx4nTtA/d9hHhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=Ty+j86+R; arc=none smtp.client-ip=57.103.73.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="Ty+j86+R"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPS id EAB5E18000B2;
	Tue, 23 Dec 2025 06:03:44 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=ZJ4TYUwyP7txZMYmqY+y1UD83wF4NidfNzPjm+tPklI=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=Ty+j86+RCAtncOePeJkKU9FSMqog8HRZwUimqmJtfukRv9rK552G16uW912E99/SnxKIAWIsFr6zVvQkGogMz+OLDhUBoD5rMHnJCft0t/pTIKc2CATn8ORYQsPx+TDJvxZiLWWQjuEw5WTmyt4mu6S8pNHpHIrBmX/9HV7c3BwunlOl8wnXQ+GkPD5hEIlLPRcIpo/INUu9jtWk9EcufseWdm44bGVSKZZTWh+ylozaXZf6sCkMnsuIIm4HI0dc6ckKU41UOHHpuoqJD57GesCE0qsJn/TStNLlNFdXAke8L8Ctsx6YOUKQyZ26J9oH4SmpPh9n+iA6MC1byfcvSg==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-10 (Postfix) with ESMTPSA id DEA6418000A2;
	Tue, 23 Dec 2025 06:03:42 +0000 (UTC)
Date: Tue, 23 Dec 2025 16:03:39 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com, dakr@kernel.org,
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7] rust: Return Option from page_align and ensure no
 usize overflow
Message-ID: <aUowuzq9bTV1nYrn@fedora>
References: <20251204224006.353646-2-bshephar@bne-home.net>
 <DF1DAR4ZZ9KG.3UE6JTJOOMULO@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DF1DAR4ZZ9KG.3UE6JTJOOMULO@nvidia.com>
X-Authority-Info: v=2.4 cv=TLJIilla c=1 sm=1 tr=0 ts=694a30c1 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=paxOtANTK2pwymM8rTEA:9 a=CjuIK1q_8ugA:10 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA0NyBTYWx0ZWRfX0KArKWp+u5/Y
 Bo4uzVaV2BjQsSG6rQrcOGtsvXTqH8n6JKJ6djmahRauA7TNQH/RCyNh77UehiYVOrN0bIHBWdo
 O2mGCj7R4z1EkJXfD18mCW2YdcQS9sbzemBR/vn72Xjj3Ihv7MThVvpQDEV7zaubZN/1ZJHKMfa
 6tS58tyySbgPSO9IErqpPhwmJtN8RNe+oWxy6O4k58erSgW08DJQNTPqjQjVkcJDwdifLCjpSQ5
 B9MHaf4mCkugGQukZKApB4tQ3XYNMRMbS/ItpdHc9sI/6TyoPjSJvlFzsykGq/cf3adRTG8BjLI
 iwPpU9k2olAmxxy3bDk
X-Proofpoint-ORIG-GUID: 9Ef-GBNQp7B0mMQ3HiiEoJZ6gCiZSVUx
X-Proofpoint-GUID: 9Ef-GBNQp7B0mMQ3HiiEoJZ6gCiZSVUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 clxscore=1030
 malwarescore=0 phishscore=0 mlxlogscore=829 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512230047
X-JNJ: AAAAAAABsmnGgScSGTRM46JbA0sRGFPcP1uvdwCiHf89DkWcLbJq2YqwvSOLrMzaK5zP4WEZr+xepdRkjcMPcIh10+8Wuk0wrKIpaAIDr5YD6+GdPsnK7AXvPgUZZUwugvvC8bFHEh5mqMwscjXqcHWDKu/gOhq9+twuNb3rpThRto02skgQ9nbZiBskHMgEbvUWkFuJyZ0pkHM/44hho8zRMITXr9p+UoXgyuOEh8TXMFtOSuRZbb2bEHK32KsJxBCeG24PDtxx7RA7FDNcPHt2fITpGORrbUavbFxLCo6pypF36P65okr1R70WuZ2YJdchB8w2K5TzcinYlfDfLTk9iAsYEic7G7bf4U4uUz5g8Q6CKjdNAWuh0e8LChW0n7H/+BT/XH5AWGBUr4vsCTWiOXPOz0tN47dKiy/OMiumQdKsJHmn59T3HOadFpbO1ma11v/BYHLf9ra6/btKQcEKmces8ExLLMCgvskG43LXYT8RGO5aT+gESyVN0soWWuz3AF0FNbmYWsWWKkR6yryzCkP7rbvrtiCadE8dcxkMWyDo6mw195DlszGYp/GMvXU7LE9nnf0DmUOF4587oGG8ESuJ4AsPksXAJ5yaL66Osyvhy/OAmAG2hq+7vIvNOdC8SX7nVLdi+NIhyq1eUQLiqT/2/cAYy7wmVex4iOkT/uACLssz+kHKknY=

On Thu, Dec 18, 2025 at 10:13:23PM +0900, Alexandre Courbot wrote:
> On Fri Dec 5, 2025 at 7:40 AM JST, Brendan Shephard wrote:
> > +/// Returns [`None`] on integer overflow.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::page::{page_align, PAGE_SIZE};
> 
> Add an extra line to separate the imports from the code.
> 
> > +/// // Requested address is already aligned
> 
> Please consistently finish sentences with a `.`.
> 
> > +/// assert_eq!(page_align(0x0), Some(0x0));
> > +/// assert_eq!(page_align(PAGE_SIZE), Some(PAGE_SIZE));
> > +///
> > +/// // Requested address needs alignment up
> > +/// assert_eq!(page_align(0x1), Some(PAGE_SIZE));
> > +/// assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
> > +///
> > +/// // Requested address causes overflow (returns None)
> > +/// // The check asserts that `None` is returned when a value is requested within one `PAGE_SIZE` of
> > +/// // `usize::MAX`.
> 
> We can see what the check does by looking at it, so this last sentence
> feels heavy and unnecessary.
> 
> > +/// let overflow_addr = usize::MAX - (PAGE_SIZE / 2);
> > +/// assert_eq!(page_align(overflow_addr), None);
> > +///
> > +/// // Requested address of `usize::MAX` would overflow, and subsequently returns `None`.
> > +/// assert_eq!(page_align(usize::MAX), None);
> 
> This test is basically equivalent to the previous one and can be
> discarded imho.
> 
> I have checked the tests and rustdoc fwiw, and saw no issue, so this
> looks good to go after these last details are fixed.
> 
> 

Yeah, sounds good. I fixed up those and sent a new revision:
https://lore.kernel.org/rust-for-linux/20251223055647.9761-1-bshephar@bne-home.net/T/#u

Thanks again! Hope you enjoy your holidays.
