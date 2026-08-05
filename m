Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EF23DAABE;
	Wed,  5 Aug 2026 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914139; cv=none; b=t6ohXTcuivCaSkgGvQtUmClV+B5iqSvwreM2zJQYB6Jwr+DrvEslMFeV2M9xTMo11yVz1adhvKAkOs8Hzfg8l0xyip++MAJYtuOZ8ee8l/cUjaTu/VfJySDiU3PvOLjQpWORDeg2YIsusChqbL7RAUU6rE4xtuN64AoaynQvleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914139; c=relaxed/simple;
	bh=aMqtLfqAkPjjP9FjquYjmMR7YEIU4S+tQAJ1geGXdB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gK+ek+Lb/3HeD1hL0DxT7b/w8kRDVh6ZXyAX7cQrA87Of0U5WYMKe+DCjNmM3g4NsGajA3/q/CGa2YKj2sT31/zGSB3WDEAZTG7fHsTQhXMwf7CO1ag1cRcakbpVZdIiH007M0Vy5Qwhe45R8G0jxBhaFGrdFmh3WktK1mflHL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UmS5ULH7; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UmS5ULH7"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755lq702908009;
	Wed, 5 Aug 2026 07:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=mOXfna
	goxBHpATWxSCAyM9scHQg/VEyci/WmPJkBrsY=; b=UmS5ULH7T/ku/FLqrB2MCZ
	ZRXgkLUH9uDzxII7MBSL1euHmdz8BSv5EK+wKCkj7npTS2HHLjR8P9x8RlTaFdC8
	RxeQE8WwVS6j4xrZMgBy8t2xgpUONbh9/Z5DqZKfXn0+Iyz2WVXukr0uKooJr13x
	0ozKPDFX/dE4hOOB4u5LonHipBBwWyt3sXSNV31zw5RDGWRwKrCPmu6T9AXJyKYD
	P0AtkxRxYddO8Rx8b9ePOnIsgX8Q3KRgOwkQvSiMrrF+sM4PVmA3YGHp864RLwP5
	++hmAlm3v7rk5LGG0qmAElrw+F7/30KmFyqYUwYgBPG4Kd1z5M9o4f67FiyUwP8g
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs67hsmne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:15:15 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6757BKLC023541;
	Wed, 5 Aug 2026 07:15:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fswtyn8s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 07:15:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6757FCch37290456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Aug 2026 07:15:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4B0A20043;
	Wed,  5 Aug 2026 07:15:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A54B120040;
	Wed,  5 Aug 2026 07:15:06 +0000 (GMT)
Received: from [9.39.28.91] (unknown [9.39.28.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Aug 2026 07:15:06 +0000 (GMT)
Message-ID: <9c59f7d4-03f3-4d7f-b77a-fdbab9a82ce7@linux.ibm.com>
Date: Wed, 5 Aug 2026 12:45:04 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/17] preempt: Introduce
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
        Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
        Lyude Paul <lyude@redhat.com>,
        Daniel Almeida
 <daniel.almeida@collabora.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>,
        Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-11-boqun@kernel.org>
 <2a9aec78-fe1b-49c9-884f-a59eb36c8905@linux.ibm.com>
 <anLeKu7X6SndqFR4@tardis.local>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <anLeKu7X6SndqFR4@tardis.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1MSBTYWx0ZWRfXxolL4YAJ1PKJ
 ssVQiywsV7uZ+cYigvGkQDEkfKqjjIrRTNK/Y/AxPTDe4w1aSfHJYdFfbGLDoINWfsliKMw4vWN
 pZq8viOvb5jr8qMKTDtBsbT7ovd/YVk=
X-Authority-Analysis: v=2.4 cv=I7VVgtgg c=1 sm=1 tr=0 ts=6a72e304 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=USvw5ZzSzfr2lKRvkucA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1MSBTYWx0ZWRfX30H5BuJkrMg/
 4QEPBTN9BpGIm2zrAVQ11frDH4jp63W77iYlK6oQ/zNLJjA3z+Co5hKKFfFl+VgjqmsMOoyPw4G
 Ofmwda2GPRrWRQbDGocTiCm57m8WewLzR43tAvUmRXzanmMNC80pCsrDyxvIKNRUNAPaoYi3emO
 gwI7CDYg7GU7ycerI0KuFZZERrnFzmdENqaMlncx+69VlDCS9M0kgiuccbU2bcguTgwETmHVHRV
 wMLnhN71pI8WiIiwLCL91Xw7inbe8SsrxD5D/ugjrVWdRd2MHbp+FTB/nPaD9bxJ5+BL7Wt2wxv
 ZNDNup4F0kmaCTDjxx0c8a8G0ImcgV1ZW6RDVKmoyYbx7RWT+qoh4/8YNAHOczU9LrjG5zdhSiW
 z8PXTuSAZjynfiJsoMHPsFQLpitvDP32XImyOibjdCtGDLTKFFOz9l+GiRg4GpzpGqDslnP/1u3
 +sXRPR3B04qbQIrXWMg==
X-Proofpoint-ORIG-GUID: EKXDyEEUVGvdlrVvYoh4P1u4MyRtEcGr
X-Proofpoint-GUID: G5YWBUl91z4LQHD4nGBY_EwVowML7QUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050051


Hi Boqun.

>> nit: This limit is because to have the same behavior as other case when
>> NMI_BITS=4 right?
>> It is not easy to infer that from comment.
>>
> 
> It's sort of design by implementation IIUC, previously because of
> NMI_BITS=4, we could only support nesting level being 15. And here we
> just want to keep the same behavior here.

That I understood.

> 
> If your question is why 15 was a good number before this change, I guess
> would be it's just a number that is neither too big or too small.

Its more about below comment. Something like below is better?

/* NMI nesting is represented in 4 bits. */

> 
>>> +		/* Maximum NMI nesting is 15. */		\
>>> +		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
>>> +		__this_cpu_inc(nmi_nesting);			\
>>> +		preempt_count_set(preempt_count() | NMI_MASK);  \
