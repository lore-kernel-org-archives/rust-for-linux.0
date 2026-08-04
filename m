Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA9B47668B;
	Tue,  4 Aug 2026 20:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875255; cv=none; b=BI1jOtIB21E7d6rFg5/rDfy9JLLHr5CQRNcRLUp41iNXWxvbuGcRR9VUa0+M3X7B58c1QRs/xSyUdRwnrFsHBFLU4JFg9f30Wc+VeVKanbJPRNWNnZl5R7JIYVXtuR/67gbrnzRo+x8UhRTtTvl2U2tn164bobsZlAzPacd3FXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875255; c=relaxed/simple;
	bh=ml90BBLNPlugM1Fy5fF6gs75Rr3Zj3dl7P6wOveJ0kQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNvpj+Q8/AGUHkqKSLUoCh2RYBQ7IVtlgTce1OoV3PyYVmLp3RZQHGvO0kj79AH+mo+7xZ7hBvmhte990PwVs7MukNDoSkXDHe/9Bvx0QTeIcZsaehE4gH3LFrxyW80bCdqjaa352CMttC8KIcVaCmFMtGTy7OW4a80BKlhIicQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=evlTxb89; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="evlTxb89"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JnPLe1857301;
	Tue, 4 Aug 2026 20:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/y6Ng8
	iTypVT/os6v4/xxoA399Owol1Ey3szttvRvcY=; b=evlTxb89pVsarNMdUs2qnM
	Bz0yK0RdYmrv9BqsADil2x/g5Pvh5dPFLj0Lxc4eM36pQAL+CL9D83eCnBFn3f18
	JcnBGmtJljB1d3yM+qY/LdGDKoXSZKGyspUSPYTqq13q+aHSoL08Ru7CU77a+B47
	vaxt/tHhAJe2SaHpyZ/uRvL8wFI26bh9HXNERWTJSAGPNkmKKtvE8skAE3eoacaY
	hmxEDyAn3TD25EJNXwQcd/ThaB7Blj89wlWx9Xaf9X5HVXUScUylB7UHSSlqxf55
	4EhKqTJcUYK8c/FQFCM7vpdMyEJ1Z1F/POy+rEHcPN2xC4yJEs/fea3qkzMhaMyA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8euqbrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 20:27:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 674KQQRe028152;
	Tue, 4 Aug 2026 20:27:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fsu4qksnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 20:27:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 674KRAtr46137668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Aug 2026 20:27:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 116F820043;
	Tue,  4 Aug 2026 20:27:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D442720040;
	Tue,  4 Aug 2026 20:27:05 +0000 (GMT)
Received: from [9.39.27.209] (unknown [9.39.27.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Aug 2026 20:27:05 +0000 (GMT)
Message-ID: <367a9709-eb79-4579-9405-fb8d89576413@linux.ibm.com>
Date: Wed, 5 Aug 2026 01:57:04 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/17] s390/preempt: Enable
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
To: Boqun Feng <boqun@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
        Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-13-boqun@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260804161447.84806-13-boqun@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: vMTnO9MQG_j-rTycTnHNHHVynBYTI3XE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2NCBTYWx0ZWRfX5V/F3FLCCnCq
 RTtCtYc/r21BcZEHNkDM0fU2bzdHeeil1kqGAbb/D1+dAna99i5scr+kbcoD0KU+wPoq3/HwuzV
 6O//xjdEoPaP6NGeOyg5liRDuGFfvuI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2NCBTYWx0ZWRfXzk/gl3B0l0c5
 4WxCl5BxsWbZlIiZrRs67fbPfbdvkySNDgVo4Ahpb7RF2rZbfstMLCT92kWw1CiETWkdtkzyunF
 Wv/CQRbyc+ISx9eZb7Mr0MGSOiexTFuDfhVYKXAk5G4DujZLXR3LPsn9zEW4IMO/8P5eDZ1kjW1
 dKq/GsnbdNjeg/uXvkCpdLhhqytD0i3H6aaqH/orX2tQzqxTbvaitfNphOEqOmtCi+9sg9eVJvA
 nOBLd0jO+0HVobJAIum4cIfZ80bFNuYOs2Sb0Xc5rr2PGxv858or8XAr7R9nV4yN6H67noKJ6Ep
 bhm8bO70DEkT5+PxddRe62eDok8TG9ZOQJRMiGXKgqUtY25+UteU36xucETWp47mTM9wQtc0jxx
 SgSAQsTk4/JKsboX/dL08zh/8oJK1qgrlyvmyxRYjPcOiqbB0ZeeXRi8azNk7YMtPL1B0Ev5asG
 tNA10oK4CfkdyKVveew==
X-Proofpoint-GUID: Lh6Zdyja0HSkCyWPHm8Oy2wpVokalkbN
X-Authority-Analysis: v=2.4 cv=KfzidwYD c=1 sm=1 tr=0 ts=6a724b23 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=GjiJ6sYaQ7aKqrb2YAAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040164

+maddy, christophe,

On 8/4/26 9:44 PM, Boqun Feng wrote:
> From: Heiko Carstens <hca@linux.ibm.com>
> 
> Convert s390's preempt_count to 64 bit, and change the preempt
> primitives accordingly.
> 

> +	union {
> +		struct {
> +			__u32	need_resched;	/* 0x03a8 */
> +			__u32	count;		/* 0x03ac */
> +		} preempt;
> +		__u64	preempt_count;		/* 0x03a8 */
> +	};


This is interesting. So arm64, s390 will have similar implementation
w.r.t to preempt_count.

I guess PoC that i was trying for ppc64 is worth pursuing even more,
since ppc64 is one missing major arch which still uses old method
of querying tif_need_resched.
With similar change ppc64 can set HAS_SEPARATE_PREEMPT_RESCHED_BITS too.
