Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028644;
	b=3L2nLtrW3f+TONbeatChlUlXYCCsMKfepe/gre6q4/sSMZtkb+Fu2Zh5dRLIseGZBqw8
	 crPclXmt3cXhfT0dzIkc7xREs16dfYxv2QcUaxNq7Apipkj6VL7mIaV/pXCiPVXSkdQLr
	 Zo7Gj9Mm24g3aLCnAS6V7rgqmJjTNS86IkDZGhmxWM4/O+VVk62LIjwaet+8HLwWa0TCd
	 6HHWsvUDvwCGPnYeEeXZdWf5lqqKt3Ycl8qez2i5E+SARfxj6sCYRqvgCxawBY8bM5Hcg
	 qbyoXc/4PoW8J2uDttON65TzOobX3GbQZlcHaoUzxCHWMBe4rkUb7rxR7XiaeLL1UXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
	b=kA7cPn93QMLdxPHkrjHM8gAlcmXwEGlJ20rANn50NLz1JuW+l4LTCZ71KcHaknykOxFP
	 ewo4dT90Az7NVlgGCib7TemaHyWxu7gBNSmUUPO3f9LNjEH/WRFGeDQU6Qy6H6VlfUvkK
	 2XVEVWH3FdDCFr2lA29dcGiBwo3YVoMCbuoT7slXs5oX0R4mu1Q7A4biqfpz81v9wISL3
	 5Vo2NsMwR51x8BvEX50LD2Ih5xpSiOufYmzPxwtYm8BEp+MYF4dv4f9fckCjWTveP4UEL
	 waUa4AQdIQCwk01agfPZfGwY4XXTzSx7AEvN0HFPZiEl0pMNU+nIR4pWMhWX0tD97og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSpW+L2W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YSQSmC1/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81797606A31B
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81797606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eSpW+L2W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YSQSmC1/
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEw7Hl3584482
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=; b=eSpW+L2W+Csp5WUY
	GvxBySkIFVAQMZDJu9L5LzxKEJW4zA6tUbyUJ30PNCJh7eFycvg5q4yjUoI/K74O
	s4bnSEYpe809dALsn3T5v/PlZsUrCJOZI+O5/CsnItZZOQvcOims7eMpT6O780dA
	oEWEFAxUo1ftvTTDWDHldVpRFns1GAIp0xuChWsQRFPVuHSZtqegzef0LKDxlFFM
	uwWWjUr7Ar0+hnxUJCQQmCTC/bbaBBqIcZyp/7HnJM4qYnKAF2Bo7bDiyjbSW9HC
	lMNG/NVva6MDU83MQbjG8IJpZmu2Za7iKWE8WTOC072qK2y4eF2x1rlhkHkVdSni
	kkm0Qg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddau8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:30:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bcc2f50fso156424241.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 08:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028642; x=1793633442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
        b=YSQSmC1/aVZEr0mLJLTjKEGRXHvlRpLLlLDUzycoVCnchazAiHIYLdJvIjKX+D5PXh
         Tk+bFGdE5eNm3XbfmKLeE79hIPkPCKeSjhlG7Ikg1J4qI6k2fhCDYfNI/RDZV3WteawM
         hltETlPiaUmbQJvf0B6LT+y5p7XBzr5k3wckh4i8NduNfQqkLPGo46mrRbC6GuBD0YBG
         8Y4bOAa/nnb73w6CTSXM+s2hWlS71V2lM1l5q26lTqnMmzLGYR+6cd5+TPtlkhlLZcnI
         ErLAFpa+ine96EwdxNRRrQY3HEeT/68R29o54kDHuJ+t/iwng8YpIIFU/w+qEP4Ithie
         ITuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028642; x=1793633442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNEN/0vWce/15eUz14WckhE2l2ohDRpHNcQP7Q+mdfo=;
        b=0NEtan87u5P4ESaw3uXc0zkYBw1RWXzeVnbEBBpRcEaCl69g+WXsQC2bxtka+PnrCI
         BQ/fNSPmjotULmfNJeoKwI+7VlWjR+R1YDzUq+vMmShBTmtrm9gbM9bmpuNF1NCIVfpP
         VGOW1jUrUveG3L1pt6bFowIW4TIlJNo1XvtASWM1NIK+HDH07K/qlkGYsfF8ioDziFKF
         lLjZLS37/7I+vJZrZV8J6IBG+bPhNsMqS/8mJMkbe+aQxNVcOxKIKx+2ATZ1Q6NF/pQo
         wOds1N4Nh5E+DksHwwVNfGRPmSzJa+bXBkoF4iGAbWpGU9BunEiMt77M6o8qaYXZwbCo
         d0fg==
X-Forwarded-Encrypted: i=1; AKwUvBwkG+kvc+M0J6ab+Qgg4Dt/OU0Qqkxa33aQBFPEfqvsRmngpxWbPY2f0K34yO6SQbuO5031wz2nZe3tuG7uiA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIflV0IYoafNPBTa5kp/CY2GYvAwtDgznla+GtRZ4dLF6Dn+d2i
	hpR8TYV0TCxEf/qAksX0c55AbtwUWhhn7SWaVmDcpOcQZKAWOi7zTR5+HyOug3PP3qqf7moel63
	DiVhQdR4NvkdMVJUOtwknzrzA/UJ7FLdbbF6IYLQ8dNkZtMuF7G0bHIQAUEPqxKhGjRTd7g==
X-Gm-Gg: AYBFou1/k2AjiE8A0waf4cZ5WnNxm/ggHL8AZlk6C16tbMmAYGSgwvh608xbz+wGPgB
	bKP15Hj830j1m74Rcn8nh2YgxpksFYIsSG9ZvB393hBJ9iuA1vfiURfmBcQY0WFUlwfay8Izi1Q
	1cQs0KfPS9JeWSeLwR4uNSXXkMBMhw/WCaRmvjrzpRxkJU9L2vnGeosMBJoBkU3luUlBdKSyTtR
	5WfLoJSaYvHWJdXGOWcDF96WSNhahrQbHlmINBfgFHe8gLQFDDesc86M8/0G4HTzKf7auDbCxwY
	ybIsIIUS2VlLvPHdSRmADcRTowIxU/w3X1lv8nFBj1d41B5D6nTe1J/syrn0R6EnPixipNVkkcS
	ESmb4Wtv2RFsmZ2CT7iBcjQ==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr2249008e0c.5.1793028641650;
        Mon, 26 Oct 2026 08:30:41 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr2248969e0c.5.1793028641198;
        Mon, 26 Oct 2026 08:30:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79eb05sm333500666b.79.2026.10.26.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:30:40 -0700 (PDT)
Message-ID: <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:30:36 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: rob.clark@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JRN4YFsdm-oZZP3V_FSLpNY1tHpsoHZb
X-Proofpoint-GUID: JRN4YFsdm-oZZP3V_FSLpNY1tHpsoHZb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX1wnmXfVPsuHh
 aitRjvPkPTljteqWxY+1kmYlzXgMtPquBquMGPyGeCqfW6eMa8QqkJIyc6OVgcKwcoTQRvR2BOh
 XOfi02jhl+BuLqmAlFSghQ2vkTRjHIS3zp5pg2wskSz4BW2iLZadB6v5h151ZQROhYkor3IUCRf
 iQPkNPJQA4Hzr/RogVm4AMKg9ZHfs7Et1m/YSVONz+QnoWo5st0+1rcg2xWPDZ58+hBuEwe40X4
 G90pnoxZuxLT8ulPeHCqZ8sbKxsWyK+hjEaPoU/8OhiDmWMY1FJJfUYvk1SCHh/RdRYR9WhG8Ru
 Bz1E90XTNAEyZVno7WtUzPYZ0gF+48Yx2dnmBB/VhdVMlDcCflJ74HFg4UT9xtuMx8WmaDaQTZj
 +VEB1tMLMxPEHYBeN+fgY89am61LGgf7ACUtjjQyfyIg7IJEPlT7UOzqSke/SNUEwKOiFX3jzFg
 4boMR3eJgC8Zg1HF+2w==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf7222 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=obMtVcPMbQgr-G-mzi0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX/rhoD+6Eozpo
 lirc3B3AStY8SG2ZKtHMeEac44Qb16TBUf4QbqVMKKHi//Kka351h/tYpAgePJUOoWrMDBEmE8V
 ypABRumrunTHwiGpGH6i4XBgKj4rDWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On 10/26/26 4:26 PM, Rob Clark wrote:
> On Mon, Oct 26, 2026 at 4:40 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Much of the VM handling code is a headache to read and maintain.
>> There's a soup of mixed-signedness/size types which need to be compared
>> and added and getting that wrong in C is very easy.
>>
>> The "(range + obj_offset) > obj->size" check could wrap for a large
>> obj_offset, which let an out-of-range map be accepted and then mapped
>> as nothing. Oxidize it and use checked_add() to fix that.
>>
>> This commit is a "get the foot in the door" type change to make sure
>> that folks building kernels for Qualcomm SoCs have their Rust setup
>> ready. It may/should be extended to the wider mm code once the
>> appropriate abstractions are finalized.
>>
>> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
>> implementation for that currently doesn't support dynamic_debug.
>>
>> The DRM_BRIDGE dependency is dropped because including RUST exposed
>> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>> (if this is rejected we may just patch the C code).
>>
>> Notably, this will regress some ancient configurations:
>> -- arch/arm/Kconfig
>>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
> 
> Side note, I'm ok w/ drm/msm (or at least the gpu part) depending on
> CPU_LITTLE_ENDIAN.  The combination of BE CPU and LE GPU would be a
> mess.  I'll actively ignore bug reports, patches, etc related to BE.
> So please, no BE!

arm64 is free of it now!

134b0fbc5c24 ("arm64: Kbuild: Remove vestigial big-endian support")

Konrad
