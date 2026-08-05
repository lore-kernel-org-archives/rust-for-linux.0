Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086AA35677E;
	Wed,  5 Aug 2026 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933494; cv=none; b=XEVoixHOdZ7zP09jXC9Mt1fAcSkjp/gtVQlpHdk+kO6j1yD2Oqld0PmFnmwCmWRJqs5+38do1/y93FcxVeH/LNfwSnxh6/mK4pFt6w9zQ5Zyhuo8H/z8f9rGOmxpg0trWwDH4IbK1WnCPvNTqY/DAwYGOaVzlo24AeQiZJKUYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933494; c=relaxed/simple;
	bh=8bruw2+gPSTKuIRizSIWy8RxNmxyzgKiPJHGl97G91U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PVdxurv1ULXzTlQvXaq5SlwlMHhQHiNwaat+1dI0Pqeiq4uI+cJCsi5K9F6m+9eeo5iSBDkfJ7zUVFx78wxfvZsvtAeZysKqLqmBub3AlpAvJzCElZSXKaEtR6rwl3KSzaf8u0L0vw0sIz8GxrRd8gqzSp+VP55NqkdP+WHwLwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sx9UEnAZ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sx9UEnAZ"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675CHihO3793703;
	Wed, 5 Aug 2026 12:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KI+Yh5
	WD2CFvHOfXUaVTp9fpWQWeM7i0RgCJk/ASx2A=; b=sx9UEnAZ0/o+w7PQuiQBwc
	9jbxuO3nymQJqq6mRjulqmySqOSvfLra8JovQpQGhYVxawPV4pwoZlBRvdsQS1eh
	tWPW1vnDN9CEwI5qEQKWqe+CWShJP93lMWEVUYP+ggDkOpRsn2dH4XhlKFs10omB
	d3mAVHppYR/iXrwtPRPCboByZqFzUyM+uLha4gFh41otYAAaJg5tQ+WUj5/pTJ1V
	cphAUfmXl20+RLHx3VNMtcL0oR6mRnsuwgsieUwPFdKeZ/jUTtIVzmyWvd16s4a1
	VRibdrnFf/QlyQYwFlD+QJcjFPw3Jiid/VvkvDo7m7Eur26VRVX75f374sQ5bexg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8a430d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 12:37:57 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 675CQLGZ031680;
	Wed, 5 Aug 2026 12:37:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsv4k6gvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 12:37:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 675Cbqg830540218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Aug 2026 12:37:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8487D20040;
	Wed,  5 Aug 2026 12:37:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6BBF20043;
	Wed,  5 Aug 2026 12:37:48 +0000 (GMT)
Received: from [9.39.28.91] (unknown [9.39.28.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2026 12:37:48 +0000 (GMT)
Message-ID: <020411fc-80dc-45c7-82d7-a99e9f6f825b@linux.ibm.com>
Date: Wed, 5 Aug 2026 18:07:47 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/17] s390/preempt: Enable
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
        Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-13-boqun@kernel.org>
 <367a9709-eb79-4579-9405-fb8d89576413@linux.ibm.com>
 <20260805094219.GM687043@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260805094219.GM687043@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E6P9Y6dl c=1 sm=1 tr=0 ts=6a732ea6 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=ZyJnKh-eXZI1ZQXNzZIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: p-gJtqEUf_s0ZyDRixCMX_Y9ellvZAYp
X-Proofpoint-GUID: hyANpGKjZ3GmXWYVVnY7ktEq2Paf37DD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA5OSBTYWx0ZWRfX1KTo+urDlKVg
 +H36vqZfEY5++vel8i9AnTQ465QjC71nBYdbFW7Nq/VAu3Z3yuDZ7uZ53mEmzGb4NbzEjTAWTCU
 j68HX/M71Kh2IctUeLLkeZrp2jFYNnE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA5OSBTYWx0ZWRfX5Q/670/mq5gv
 behJji3KYKKQmwYuAUAQHMAl4LSHeJKwmCII/M2Onh2xPml8sMx9ONpt0PruNwF7fcCMqKpCbyl
 fv+WOCWwhrTvyKMIy1bOXcKpE+lNCnPeRyJMKQLvyiixWSdYxLkymnXaSKqVTPcyD7ljywhVh8a
 BvUY9iUTEgiEisG8rvrmQTh7Lfv3MxEg7MYQbz7/5F9F3Q+kkNveYNxYmdIRjNe+0UIL2Ic2pOG
 qJNb3OTw/4S0NHbzLaJqNOtDeyCFo99OJjYnbqZYdiaC42zjYNZRYOdYH9DVPRm0YhQnzwtJwaQ
 dKEsXGMCoqSo73vmmpJ83kp7Q6BxiolBCzcZzq6oi2kWblNuHWqOWQKDS+Z29u5vXdcxHG9SmIZ
 FrW4MV9c/3eDlDZEGtmmxP2ef3JirIGySRQwqzF9Vbq8ZBOtCu/GUcD2o2j/Uv/cKY50P1DxHKq
 yBVfIIYDnZ2L0YvPwyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050099

Hi Peter.

On 8/5/26 3:12 PM, Peter Zijlstra wrote:
> On Wed, Aug 05, 2026 at 01:57:04AM +0530, Shrikanth Hegde wrote:
>> +maddy, christophe,
>>
>> On 8/4/26 9:44 PM, Boqun Feng wrote:
>>> From: Heiko Carstens <hca@linux.ibm.com>
>>>
>>> Convert s390's preempt_count to 64 bit, and change the preempt
>>> primitives accordingly.
>>>
>>
>>> +	union {
>>> +		struct {
>>> +			__u32	need_resched;	/* 0x03a8 */
>>> +			__u32	count;		/* 0x03ac */
>>> +		} preempt;
>>> +		__u64	preempt_count;		/* 0x03a8 */
>>> +	};
>>
>>
>> This is interesting. So arm64, s390 will have similar implementation
>> w.r.t to preempt_count.
>>
>> I guess PoC that i was trying for ppc64 is worth pursuing even more,
>> since ppc64 is one missing major arch which still uses old method
>> of querying tif_need_resched.
>> With similar change ppc64 can set HAS_SEPARATE_PREEMPT_RESCHED_BITS too.
> 
> Yes. PPC should be able to the same thing ARM64 does.

Yes. I am thinking of moving it to PACA instead of keeping it in thread_info
as PACA is a natural per-CPU storage.

If i hit any major hurdle there, will use thread info similar to arm64.
