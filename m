Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016D430CE1;
	Tue, 11 Aug 2026 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443027; cv=none; b=chKSbWQ0KOXgz2+J/gKYeuYGq/4vM4ynmCzWr8lhJLhnb1SuP+KDqpw0NNpRzwsNAIXALx0Ld5bpfbAEqJak+ylg78fc7Gv1pjN++Fx56WwTkBNn1Q3C7+vIhKyVwU4klD9tnoI+OY8tbPii5moa4u5WSvWnN4/G/1hMxX1GFFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443027; c=relaxed/simple;
	bh=qTUxxSDc0cz1meq6dTSsELrULMUbQiC2YpfKsYgDluw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cI3n4O/sRA/4sX2mFOunSPBU3dILfA3weP6hUAZ3MGMGbc20Tpi9BdW0myaTEqh2KfcBSbzdAlVvU59j8Sknghij697Vu8bTVxrGyPesSE6bRcCl/OqyFbpV1Q6CYTbGbZKSXRBT2dYqVDm0o8vwPXcUjdHtURdmApJxfsHAs8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BDoS9wGa; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BDoS9wGa"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AN1bmu2999523;
	Tue, 11 Aug 2026 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LU28Qk
	VKWw2EeBZPwxjLVfX+RSSDQ5yZHq1vZ572ZLI=; b=BDoS9wGaAtpQqR2cQvKNmK
	Nxwoit/muinS6hMn48uRwwKqtkuzKcVBmy0GXjMXzmXAJSSSCVe+7j7O/3+Bi0FO
	6BHnm0pJjzR+Qr1aN/+ZGzBL8yLj3biGuhIzy+tJ7DbPeuF6s+6KeIRZRAwqHRvA
	MJRQTqHL+WKOzSLTrUvDye7rcunADaZtq9uGyhevK6jFCnVKTHRrFXMw3WW6cwgW
	BjC+LD9da6tibmkuKRfcldQ3ZnHAObjFNA9MFpW8ofxDYcKdXhwIMLQk3q1bklAm
	jq0Yn6cRvwDL18kx+ZMZbITmw3L1RXeVTJgjuviE+XMYlEnZzN5Y9hhhNO52GOuw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvnw3qqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 10:09:51 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67B9uFEl005600;
	Tue, 11 Aug 2026 10:09:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxhfy08uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 10:09:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67BA9maq34275750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2026 10:09:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E6FF2004E;
	Tue, 11 Aug 2026 10:09:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57DDA20063;
	Tue, 11 Aug 2026 10:09:45 +0000 (GMT)
Received: from [9.124.216.233] (unknown [9.124.216.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Aug 2026 10:09:45 +0000 (GMT)
Message-ID: <79cb03c5-bbaf-48fe-bda2-97117c0c99ec@linux.ibm.com>
Date: Tue, 11 Aug 2026 15:39:44 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Improvements on SpinLockIrq patch series
To: Boqun Feng <boqun@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
        Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
 <20260811041714.27679-1-boqun@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260811041714.27679-1-boqun@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=RsP16imK c=1 sm=1 tr=0 ts=6a7af4ef cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=luyCOxGtPo5oDZEKwFUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yOcuSI1-l4_9Yul41tb5E1_Z3Ybdztt3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX/w/cSGduAFfR
 TyGqPlpvP9G+zk9F50hlSykGg7o2/J6v+KD1nLRNe4wMdwrJ6Q3mn44NADkZOFWYbcdo2MxiDK6
 8VeFImqbNLK8LT41iTpD1x5IZmvcAu9qhnRIcJQSG4+Re4aI47kwD/StNv6Llql8bbrsH7RoHNO
 FwNncYSLan2jOlUfa3vVMZ/s8Y/TOzyzB3KQKkmCjDbrBpPA9kG8oLKDyX8xU+BVCM9r8gECuQp
 zeAxeGxFfJolXuwL/gfckWinoORqknWRbv/KYSUtn3ucBegokNKaeQVmgnXYGJwzGHLPglb4z8I
 XVMvQM1uC6GaH2MEiDHC4vQ4a6D2uOOQ2lWyWeYUxLc5qobfooO5ScYSwwCkfbJp2dOj/aZGEoq
 pyfdF9/EjtRCUkgBgjhLb1bQXQiBlQ8a8Nyc3PQ5veVyrpdHW+1rK9Cz6TYectJvzQICHr+3slH
 pyiTKl46NxU7EeU5gOQ==
X-Proofpoint-ORIG-GUID: L8wqBSyQmi3ue4GGdJsIG2NxWOC3xztb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX+tFDDL9rjXl/
 kwMmEWCwcGuPQrtMLgC/JLM9zZH5OTHSwb497qpDd160dOJ5LwVwGlzshKg0jKtUoJt0Tn8tOku
 6fJCe0DyN4QuI4jPZRXF1UM4qhYA6dg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110083



On 8/11/26 9:47 AM, Boqun Feng wrote:
> Hi Peter,
> 
> Per your request, I send those improvements as separate patches. I did a
> very light build and unit tests. I'm still waiting for the 0day build
> test report in case we missed something subtle, but figured maybe it's
> better if I send them out while I'm waiting.
> 
> Regards,
> Boqun
> 
> Boqun Feng (4):
>    irq: Add {over,under}flow detection for
>      local_interrupt_{enable,disable}
>    selftests/bpf: Use the new NMI_BITS definition
>    irq: Explain better on NMI_MASK overflow condition
>    irq: Add max local_interrupt_disable() nesting level kunit test case
> 
>   include/linux/hardirq.h                       |  2 +-
>   include/linux/interrupt_rc.h                  | 13 +++++++++++
>   kernel/irq/refcount_interrupt_test.c          | 22 +++++++++++++++++++
>   .../testing/selftests/bpf/bpf_experimental.h  |  2 +-
>   4 files changed, 37 insertions(+), 2 deletions(-)
> 

Looks good to me.

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
