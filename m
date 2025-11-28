Received: from outbound.ms.icloud.com (p-west3-cluster3-host1-snip4-5.eps.apple.com [57.103.72.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D4AD2C
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 05:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764307769; cv=none; b=Z/tCIV4w/dEZpCHn9xo7wE4ERD9lRObY6NfSw7oMThnF4KWcKkhqp6y1Se/jsBns9+SiEiC1MILz/mE7xm19evwHnBtRsM/lzuxmicUKaRzp5jm4bhe4koXXLhEK8gGj4icRYFlLJwQE7dxGtLxrPsaRUTFYlEW5V5ISQq/q8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764307769; c=relaxed/simple;
	bh=tPIl5uu467AXrSvOKEDVoKmEhpW9R4jpQO8vf9/TB4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9lXXVDpKquBcmi6A4RW2/ugdvxt6eMehcQO1rlnC7PRQC/1NH6Uycpm+yiOkoDIrsY8ZCSCOFws31UiKyEXYar9SVmxDORCwlKImGIDGEge3uWLuPy6P5YXMx7gl6E+8HoctTpii6BrhYeJW56TWNVaQWziwkxZIbhGfeCoJH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net; spf=pass smtp.mailfrom=bne-home.net; dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b=OLfIc9pU; arc=none smtp.client-ip=57.103.72.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bne-home.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bne-home.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bne-home.net header.i=@bne-home.net header.b="OLfIc9pU"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-0 (Postfix) with ESMTPS id EF99E180046F;
	Fri, 28 Nov 2025 05:29:24 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1; bh=MQSDnvztJyqdMRb9MUBG/0geiAqYJeNE0GtWGSgxvzM=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=OLfIc9pUtIsdgs3OHzuI+JcXgeeK/FM31jkeTVn31XNsvWMmYBNgXsNjxKjFfPDWx8QsgD5YgJsuqhdfPc3qtMcH+skBIGcUy3O84iiCyFtKuEl+SlHIKKeOSTMAx2Pl0/Fib7lbvCMad2aw8qXcfTH1jtD248BPeChTElgW41m+F35/KwwRHT/8vS8JYpgFQu9oGEMrur6Ius2izLvfkSQyQp+JdkRMfI8bGcf75rHRsBk/6MHggyVrUQWoCuYBP0mx3P8XbYvcy0tTsWvaOge1EO8KvV5UisRuN9nZvbe7sOfiFqpJSItTGu0akIpQ4G6l1FCHDtDEYnDtMAPSsA==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-0 (Postfix) with ESMTPSA id A649B1800450;
	Fri, 28 Nov 2025 05:29:20 +0000 (UTC)
Date: Fri, 28 Nov 2025 15:29:15 +1000
From: Brendan Shephard <bshephar@bne-home.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, dakr@kernel.org,
	airlied@gmail.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
Message-ID: <aSkzK4QDU6pN2GMS@fedora>
References: <aShM9CAyRPe2gYpK@fedora>
 <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com>
 <aShdutWrmU2q7gUT@fedora>
 <DEJWIFG5Y65B.17EZVKB63RUJ1@nvidia.com>
 <CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAzOCBTYWx0ZWRfX7WD0vp6kSD0B
 p0mc8zKt8ASwYzRvtkQQokThaJRKilRLPqTu+4Xnuske2abwpcVzXTkq10NYv49J3YriMY1yycy
 GKM2HATnUx2dAO4YJNLCX2e6ihFmXougPWVs/9+6/Lm29PrbC+Il5no1KFRjUS1o91vkRS5E6WU
 321A74YiRpIPHBtvaBCx9HoQcbb8JvhBEcd4N+JxcUgCxMUQO2L86C85FKq5KZwPt1afDETYl9g
 jVrG/s9+2Ql36MuGV46I09+gLqEXnCTX+1bvoaWfhnKir7ormSq8NELhvNLka9LDIHB4D6GBE/y
 deIoo+w2wycnCYIJFdx
X-Proofpoint-ORIG-GUID: VKu4S8N17n_NUvlAlyEmn07XLh5oXiRs
X-Proofpoint-GUID: VKu4S8N17n_NUvlAlyEmn07XLh5oXiRs
X-Authority-Info: v=2.4 cv=cvGWUl4i c=1 sm=1 tr=0 ts=69293335 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ikd4Dj_1AAAA:8 a=zNjv603lqQ7L3aTxpD8A:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0 clxscore=1030 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=365 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2510240001 definitions=main-2511280038
X-JNJ: AAAAAAABk2ptVXwQoCElm2tAnFJ1AV5hnD++Yy8t53aFUZxFcNB//0N9/+rWLmFQE9/L/AZsSCiqplk4MnSV2Xt3Hh2sNBx0urvKu/K1Z/ugTQ/3gd0VaEmLJwVnY7HJMq7CLWQfzAyjjFMZXqVbBpQmX0L/xlPOCi7vhWD+NokjLBDsRV/LhRAwoQjKeAu1Wn/EReGQKtinhzS9Ok5iqu49stFOcJlUifUWIWGGzwI3CrWZWaUw0SEkkujO9rCqpk1yyeEHiR+KYypchpuMoOiRGrKhGO0dO8Nn0NvySWhgVoVv4prPIcL+C4dstFSWgasNGmSVWzyqEjNhXTJIT+roSxBi11xjmR8KjNK4Qg2T6TuG9sDJZkMftvRDUfF/IFxh2Mnbg5ku7n5TjaRHbEoBANOFMIoTFt6Cmxqo5j0OjPMVLvEy5MxMBsezwhdeyupFGRyNFoZ7aXQWy7UTpqb2hiKOXT+NNLdZidYuUjYwlf/AMNumqwqOTKzFu2OhNFYJJJhqRVib0ibf3hGhMK2IIAxILjm6NFidid7/4GGMfkl2wpx+fXmq2Akv9TsHGRl2J+FHZVPITPtrDJRMA764e7l9kbws7oemmalltdB7s3V0xwKbwUKgCYlTlneLMEhw1m830AiMBOimVHGhOCBdf7TrsFGWHzQ=

On Fri, Nov 28, 2025 at 03:12:13AM +0100, Miguel Ojeda wrote:
> On Fri, Nov 28, 2025 at 1:29 AM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >
> > Ah, indeed. In that case, can we make the if arms symmetric:
> >
> >     if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
> >         Some(sum & PAGE_MASK);
> >     } else {
> >         None
> >     }
> 
> Early return style makes the happy path less indented and is more
> consistent with the C side. However, here the happy case would be the
> indented case, so `let else` would be better:
> 
>     let Some(sum) = addr.checked_add(PAGE_SIZE - 1) else {
>         return None;
>     };
> 
>     Some(sum & PAGE_MASK)
> 
> Cheers,
> Miguel
> 

A wildcard entrant to this conversation. We could do a match instead if
you all might prefer that?

match addr.checked_add(PAGE_SIZE - 1) {
  Some(v) => Some(v & PAGE_MASK),
  None => None,
}

Something about that match syntax doesn't appeal to me though. I think I
prefer Miguel's suggestion here where we flip the happy and sad paths.
Make the sad path the early return and happy path the default. But I do
see at least a couple of `match` examples here, so it's probably worth a
mention to see what you think about it as an alternative?
