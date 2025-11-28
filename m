Received: from outbound.ms.icloud.com (p-west3-cluster6-host4-snip4-2.eps.apple.com [57.103.75.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64882DC789
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 03:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.75.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764300932; cv=none; b=ByEaecgxt4VW09Cm8KtqXWbg2VHpP4j5idXXQD7nhHMyFJDFhCVDwWVzSbAizfUIjSDkBpUmMPS5mYbNwHeZsxwEC5/tb+8YJL1ke/LYDU/i7yH1+KpY3TJT2Yxnfx0eNNV06NXn5IQMLE1U9+SOIL//44o4KtRAg73+sAd/hx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764300932; c=relaxed/simple;
	bh=zOtF17+HZXondMVKQDkpsyPlE2n4KuLQcIBumSrLhQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CylLa1C3CMHWLpHCR5cqroBWsyD4bwcjhemYnveCCHBTiJo++VdrQE9rFuvedi22do+igkyZtWsgvz7KuqpvcZTj9tmxvhvwDfTb+gh1F+vWaD0lVggIaTJMw5YwMBsbVph2BL8BiWDYbVkOfazZkZv4ymOHJpHL8IKpKaLDtks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=Dp4hqKP/; arc=none smtp.client-ip=57.103.75.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="Dp4hqKP/"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-1 (Postfix) with ESMTPS id 5CC061800CC2;
	Fri, 28 Nov 2025 03:35:27 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=NLUn1H57Iz6eigzg68x1OpbGDaojyXf4qCLFnpFFv2c=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=Dp4hqKP/fXDFSrxK0PdrlYV7ygQzXa2AOmAw0o/kO+jdBx5oTxqER/cZlaNtPVH3GEkPGkCnOoAskE3ljydtmyHE3nfB7qUMa+6VNIe4WKCoDrt7iba4E/J8aQtp4n0cVSJWIpS+5dWLEE40JBaf60uVzWCFXYaVwF2x3k4owf1TGEYQN7xX6JIY+NhXAV2vffZtYJHVLKqhECpasvvZ6oN5YWZmvRo+l4jqNY+PrUrjBMPZdLRAq9x6yXImcir7MuJ+BFxUFXWk25wQ11kixBfMTH5T6i82qrwE2n0J1VngRWdHKVTenDGrVER9I1G+sNxaxG20jRnZvJjfuuK8Tg==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-1 (Postfix) with ESMTPSA id 0E8BB1800180;
	Fri, 28 Nov 2025 03:35:24 +0000 (UTC)
Date: Fri, 28 Nov 2025 13:35:21 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: dakr@kernel.org, acourbot@nvidia.com, airlied@gmail.com,
	aliceryhl@google.com, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: Return Option from page_align and ensure no
 usize overflow
Message-ID: <aSkYeanuMeltfGGm@fedora>
References: <aShM9CAyRPe2gYpK@fedora>
 <aShi9fAhQzRzWj9X@fedora>
 <CANiq72m0Z5ax3_ABSCo6Ogpeuv3u4aGsK2Fixx_q5mAMaNcy3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m0Z5ax3_ABSCo6Ogpeuv3u4aGsK2Fixx_q5mAMaNcy3w@mail.gmail.com>
X-Proofpoint-ORIG-GUID: x5v_JFpN5aQ-TXpoR4y_0R2g7pC2SvlQ
X-Authority-Info: v=2.4 cv=D8BK6/Rj c=1 sm=1 tr=0 ts=69291880 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JppZAXPjAAAA:8 a=VwQbUJbxAAAA:8
 a=PoryLkWic8FfzxhfaFEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAyNCBTYWx0ZWRfX1JsQgdkohbBR
 8XHWm9dyPNBit2PRn6pYK4yYCIKBzThhIbzI/dDXkHQPCL6kyMCDhgXSoU6IFC0+PoV60sp4L4F
 nq2l2/KpwtR3sOf2tTSm1HW2ub9KqwKpi9KrI6GYg1f7MKzkbvgFDQc2asqpipEeDjUQM/BOpf3
 B5MCRu0X+G8Zg5toU9CJB3xz0f2K5GkmumQbuSrv7xGc5nDtOgZbjB1LRQrI0MTYuWkrX2CNnSQ
 0UNkmga4pqxgw6IEoJfwTvt60VSAM0Yn4XseLglbi1JUNWZcsL20scfV8XRuggM9ngGCWc9tRZs
 9sCLqqV48aaQt6B91iW
X-Proofpoint-GUID: x5v_JFpN5aQ-TXpoR4y_0R2g7pC2SvlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1030 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280024
X-JNJ: AAAAAAABzwkuMF4t3BvP8yXQSEZuKiPoSAkP2eBVLSlVtNnTa6INOqCpI1gAon8phet7hgPckVMfCjChE+xdvsSOv5pCt7sVf4GN61RJsXf/y+7Z/AS0C/qdrrvUG55sKWY5P8862CW8ThzhuGZiO2HSnkCPmJXo5mBDfWAZ2TZHM2YvtfB1T8695SeoPRJHcRvmz2Tiz5fy1X6pVbhKwR7NMt/hq4oiMEkY/I8R/JAbs0rXadavpbIiYBruAAtAp7Lh4P3Rv6atS2/3CZudLlv18WFBgrxbo6D5/lJLgphj6MfA5FfMKl3wJ6GtdVn1fjqbBcCmTb/BRZXY9KIGHgJFq1Ph0DOqiq2bMpVWRfNJfE8u7o0SOideWNxfynPERr/v5sHKR1S20IK+lb6Ye+9iXls0BGDviS8D48ht3goLRAq+BTSFJGTayikZtmxCNypFYq0sODO8T6FHwJfjZkkrS2D9VAK6TR4ARYG2r4un7h4cFIeZn7n9Dsq4cxju7MB1yW2KeWUHNVZDi3w8gExrvHeq7WhdOCNYs9tl6a4/KI9xe26Ar8HL2ngVIZA1MV5kYan94D59EiQFtb0qyw38ZztgcM4hNnQvum8B213c3RtE183+sWaaGo0XEhFyBMqTwNlBn2u6JKg9wx8CtgYxT+mo6muX7tpn1KMS2AqKwywOSaKeoBGxCwtQ4w==

On Thu, Nov 27, 2025 at 05:24:54PM +0100, Miguel Ojeda wrote:
> On Thu, Nov 27, 2025 at 3:41 PM Brendan Shephard <bshephar@bne-home.net> wrote:
> >
> > Changes in v2:
> >   - Reworded commit message to follow the imperative form.
> >   - Expanded the documentation to explain the `Some` and `None` return cases.
> >   - Added a period at the end of the documentation comment.
> 
> This shouldn't be in the commit message. It should instead be placed
> below the first `---` line (the one below the Signed-off-by).
> 
> Also, I would recommend not replying to the previous version but
> starting a new thread instead (it is good to provide a lore.kernel.org
> to the previous version in the change log).
> 
> In addition, if possible, it is nice to use `--base` to tell Git to
> provide the base commit.
> 
> > +/// Return Some [`usize`] that is page aligned. Or None in cases where the next multiple of
> > +/// [`PAGE_SIZE`] would overflow a [`usize`].
> 
> Missing intra-doc link (this was feedback in v1). In addition, this
> reads a bit strangely, and it looks like the first line of the
> description wasn't removed? That would make the "short description"
> (the first paragraph) quite long. Please generate the docs to see if
> it looks good when generated.
> 
> More importantly, please add some examples (doctests). They are tested
> as KUnit tests automatically. For new APIs, we always try to do add
> examples, and in cases where there are edge cases like here, it
> clarifies quite a bit, i.e. please provide a representative example of
> the `Some` case and the `None` case.
> 
> Thanks!
> 
> Cheers,
> Miguel

This is all really good feedback Miguel, thanks for the pointers. I
really like the idea of adding examples. Let me work on that, and then
I'll send a V3 as a new thread with references to this one via the
lore.kernel.org link.
