Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027281;
	b=q4TpnLiR7+cEKK4mbmgl7x9I/y9dq9eCSGipe4PWZJLY1E2cccBk3vM6YgISx3s/fUfM
	 1Qe5w6P3YNHT++U7sk6TeRJwMc/2Tondj/DowhdVpnhF4uPzBSD9v/W+wWQdUH+rA09Jr
	 QkDGFHmN2ucoX/1oKaFfN8eOYxHZfxorVcFmNLZvKd6/829e2/dd4bJejlndgFYKFYp2T
	 /+chqe6Pp9JwBSaCLYg2ayDWIlFKHC3xeB460h+Ny80ZGWmzqbyoElxyVN7jtMRyiSfF+
	 dY5FNts3pwW/VK6kUWRkwvysIVCP6xZwDXzsiqiPjiHIVb/AayqhIIMyj7Sid0AkVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027281;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dd7RAO3avlBAcafG0kd8O46r9QB0mFFuCyVtLE7G4lo=;
	b=mubHgp5jex20Tlgh8viYgCpiVPi2lM+Dmy4zfmISW+bxqY6CkbAYEj4k3FbmxqxSQy5p
	 4jaVa85ZPIRX4qY9KWMJDriVntMoROsN6ZuWE54xkH8N09UqC7w5BDoHVSJONG2qadL0t
	 vHnAXsbbuvP4C67+SmamPlGG+1O3ehOzlu/4wsd5/6ILInL/bMHLJ6dIHGtqoWYRLuWCQ
	 0iiPn2o4ymqPvRHKWGpC7cSFBi1ua4TTy17/vpj32Xoq/G51saytalEDXpB5nBVwFS+39
	 UCtYuFYjswvCuRWLTyjc3XyB7g7YtrDsR9GERteAGWoX6EWET61Y5jYjhpO8Z+h85CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FIoA4Kox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KTCFsH9p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1BA606A31D
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1BA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FIoA4Kox;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KTCFsH9p
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwElL3075081
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dd7RAO3avlBAcafG0kd8O46r9QB0mFFuCyVtLE7G4lo=; b=FIoA4Kox/ttae0+O
	t98EgnygqVSsHm2ONIDoPWq4F6mCBecD5xgWMZxA/Z+aInxiCxDMSFEflyfNO7XO
	xa9phdWO7fvx8TEUjviy4CWZT1aDuOHwlwCzg4wTjwCLLm/iR8/ETzMrG4mRJ45a
	0D3/ZRp9LdnXuAUrPsQ5EPew42p1UNiYx6vPc2o51M/sW+qAdrobTdA24pNRloNI
	ZGGu2jbIXXixL978qmXp7a4wc7ik88U8epAJ8o0x06NgvXGyRjw75b5aSVUpSDQx
	rBzAdziDr9ohbKmGMia0VfpP68oF6SnOQUpH4hOCmWOXoBwrgZ6avHgd+XQ5hDpK
	vajIaA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdb151-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:08:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77f133855b9so126931137.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027279; x=1793632079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dd7RAO3avlBAcafG0kd8O46r9QB0mFFuCyVtLE7G4lo=;
        b=KTCFsH9pN9RKO2KjBTJuoEO94l+gaoOOo/XBhDB/hPV9Mq6NniDup9JX1jIM5A4wUQ
         ESF42+SzdiGM8vL0LCMbpEJC+wCgfVj2JyfaYEbUijvBQRO67v5oProSNi0rM4bXT6aS
         FAwk+/9wJAIBcYZ+jkH/yL+/uCbO8F3cT0qGeEFChV6Sc0OOpC+U8lPQmq/JgGMSvE+O
         EZMJWu+2ZbNEwvr9mfSotmBl3x6/NiEuJEd1oiBSJvdDK9uWITnt2gLUxWgosxNy/0FM
         YV4Dk1dWQbSI57UCgbCgHlAGZwzcLeAxQrBYPvjOxv0lJyHp1/K8ihA90OHgRZyy74Ff
         CIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027279; x=1793632079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dd7RAO3avlBAcafG0kd8O46r9QB0mFFuCyVtLE7G4lo=;
        b=0ELiNwNx5FJ85ruPpdQzqa6YfKbihQnDqFmQ97z3Buwsq9MRl1+oAI6tXtLQGTzrG6
         OdkfExYjXJn4N1vsgnCRgkw/24QWduplLxyT93plhZnxoLOy32g96DyEjvuxikW74Jp4
         rOmRDsM/Y5oB/HHd9ba8WMzEhXyR26FCmUVjXOJYW4sdhyWxOwOx6epfGfvj/KoCdKQc
         BlqJYj4RqekOdjN3tJm9ncV1LBlSwkZ5DsHFtvZ64sUAxtMUObxf75t9R/lRdPPVTV9g
         DurG3yYx0h2WYB5zKtIdeAIh1/rnSgzRZ6DwbJP5q/lb8l6DzVQGAFv51Me4KIfJnjYr
         yXKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoOsqZfXc5vhzYwdyRpvurPyqegr6r4PL0ejXsBNrfnAzpB+QKpV75pSR1MXdbx9HPof6U+muPUBr4OmYikQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL52Erjk5O6g8FG8uLXfcQ/CA3MR5hS17yk7lWs7ILNS/LI6S6h
	3CPGDsAdDJ3mQ9cWTimiC9r5DXk+6xJ6cXQP9hZ8Zt0v7TaF2sa5nzsI6PsPlJHsZ+Wh/iBlkMC
	DgK1ld0bDM8wjPKo5UI0IHYAI1f+G9YWsfwiefUt2hWr6NULXciYFhvQKpsK8heBuXCfoZA==
X-Gm-Gg: AYBFou3xdhe25Pzl+b/l3fBC0e302nqYj0Um81b/zt9sbbjPlPtd082VtLE120oZuJP
	+2CuPr1ywM1nWXfqqoTPb/sgb+PgFgvqzb25HGifui3c181M2Afkhe/dG2jA0ksDSy4LLf6VbIi
	NnbJLFllAyPfY2619OzjKTPrl+MD/JlShDsIawXF3brrr8+9PZ/NPpxtYGlOgvdVCbWt2SR/87I
	3SlYsGDjjvWcAvc6VylE+Fb4U6TUktCsrR2gZoA+zRO/wtefnTR6mie6dryDNtdnUpHZxQGJ+Sz
	t4zTqWfEm84kE13M0MZbrOpZMUtk5lQhuwcUiS8bdmZv1e/X6bfZgNp8m4XwZmorGbm8LccFzt0
	7WuhHWT0V3GRcMIt1Jc/uAg==
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr2047506e0c.4.1793027279369;
        Mon, 26 Oct 2026 08:07:59 -0700 (PDT)
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr2047469e0c.4.1793027278882;
        Mon, 26 Oct 2026 08:07:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79683csm325953166b.69.2026.10.26.08.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:07:57 -0700 (PDT)
Message-ID: <bd89e242-22ec-4666-988b-9edc473a5851@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:07:53 +0100
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
 <CACSVV01LdgUEAG+xyhWRoWe5Y=N7KztU1p4kQyzeW_KeWWAA1w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01LdgUEAG+xyhWRoWe5Y=N7KztU1p4kQyzeW_KeWWAA1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O5c9QdfHcGXS9gp-EqTYcfa14oUr4U6l
X-Proofpoint-GUID: O5c9QdfHcGXS9gp-EqTYcfa14oUr4U6l
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf6cd0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KBXt8WmB77sV3oe1ItkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX8c2SpYsKWW54
 o/fnEasyU7HdOsXYYt53OqKPf4QEur0xVLFFst2phogRboFqxxSIAhwFhIcEgrwkaXteZ6DKCR4
 wQtaSSgdqzI/c2MCGDioNWIWqaS1eo0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX7V42ms7wMWFs
 McPGXsr9Tey+rrp/OWWVamTTM/Yw2ZbL/PhmkA0ylYTbs6K3moQ3QEeQPaA2JSusYSlmhxb0laP
 20lVMo5BIKWeOAh8jbAsdKCXm/2XC1+px/odB+lounqir0D/+PwZ1Z4wlpOKUwD+erqamo3VX54
 0XhDkXxamAafr4pisS3ADp3Nk3v4Gu4SCi43rZL7YoRgvTuqT7C57v+7r4ObcaC8svKaLUelK3O
 VNbeDyVpUsGjyAoL5RyJVJ2rGkvsdWn0/UOiY9cvAOLgAfKBEWrTWKxJrLKKBDSweWCYOMLLTPe
 v3XyHbzlS9Xpoo9Nf1/rmcVLdNUit65356FKv9SKqnsTZLESJnSy0UTFKipqKcAJPxrIVJ4GhID
 f8PH+tGr2h1+/6BvGJDE2qC9U2fn99iYGivFDT5NNpmEX9XWbYXFwzzmw9QXUmuZJPL56QCCX6j
 U48hXLvL4jutt/aNB0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 10/26/26 3:39 PM, Rob Clark wrote:
> On Mon, Oct 26, 2026 at 4:40 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Much of the VM handling code is a headache to read and maintain.
>> There's a soup of mixed-signedness/size types which need to be compared
>> and added and getting that wrong in C is very easy.

[...]

>> @@ -1118,11 +1071,10 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
>>                 op->obj = obj;
>>                 cnt++;
>>
>> -               if ((op->range + op->obj_offset) > obj->size) {
>> -                       ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
>> -                                  op->range, op->obj_offset, obj->size);
>> +               ret = msm_vm_bind_check_bo_range(dev->dev, op->obj_offset, op->range,
>> +                                                obj->size);
>> +               if (ret)
> 
> I think the ioctl surface area is a sensible place to start using
> rust.. but seems like this patch could instead be a 1-ish line patch
> to use check_add_overflow() here?

Yeah I said that under the --- line, my main objective here is to
encourage rs

> Big picture, I'm a bit more interested in the
> goto-error-unwind-spagatti-monstors.  Even there, just using more
> cleanup.h would be an improvement.

Same. I'm done reviewing gotos. LLMs help a lot, but LLMs probably
prefer Rust too.

Konrad
