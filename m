Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA2115ECD7
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149142; cv=none; b=UMU0Kt1f/shc9k+ZF5xmUoarWX+zV1/xcGdwIXfw6hI8/+ac3OrB2KqP30MMRYXEysO4Ofsy7pavEw2BDQ5EtZ3FnMptqgpsQF9RBYT/9mOZFvq1FpwfCG24VO43OLbq8XkKALYwB+SuIJNELOhKon/C0WxW0qizOOvh5JUgJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149142; c=relaxed/simple;
	bh=/z9RChqFbUobiCtIwibbNsTlS4mZ14RedF2GrmFSfh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZCE0G5gCJtjxsR82RSchLqrQ2J3QJ6tzqzmCjpmhuc8ldlkkrj/jWgWcjMG88ccjLNmnzAEthoQg5wx3VnFaevvnTh/UL/PyRVdG3IYFWCC9+oujQqFqJj0SCoSgSn2eDTPkCEYcR3j3TIq1iI09n8idmUnglLvjJfHlCojpo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JII/EGkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZT/CjJN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JII/EGkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZT/CjJN1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBJcci091309
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 12:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQ8BpDnvaxRKS1c970H93q1ZxObJ65jXNdNzE4pE0VQ=; b=JII/EGkhBil9AGNa
	2WQ2EGLl6DStk1CNUo+3swM8oXOpmnpAy7TDkTETBM7VSPg9Ts8CBkkj0WO/PpyW
	EUKNhmw2OCvgjTYrcS4yNe5xupEAVqtSFYqCmCAaCEetuyHb113Ri4diycu3akBX
	WQ8gfN8bcQ9L6VLZHgjDqQUWfl4BbkDUtrWaQp1uCiWSxkeCTHdtzfGp1zXwurk3
	CM6j/+C2s9yiEsO8NqYkZPcY9Fe3d7f6pDl8nKuEkDOx/Ney1CE2WYf3GF2MnFpW
	U+YUNrIUlAZx906Bl1E8Q5MOMFENXRDN56pWhysxgNsEXur45fbWJxGjPEFS+WHf
	9nYeuQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eapvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 12:58:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f357ab5757so5648461cf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 04:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766149138; x=1766753938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQ8BpDnvaxRKS1c970H93q1ZxObJ65jXNdNzE4pE0VQ=;
        b=ZT/CjJN1OTDD2Kw7QgCWR7Vkqzc85C3X4Q6YuiwDWoCEO6ywbBX9M8vnReDNYipnsq
         OToSWxKxjvysDEGhtZjNqnlvmGl6P6Q4YnqZmjAwr258eNlYkgewVaPR7phUl7YSE/id
         xhUzthcyVJxQ8AMI5SwU4/ngc3+vgAoNrEbKUB5Yv/amVVwKpROOidhJKiw/Nv5NQoas
         yeCSdorOAN9Td3c2YC6Eny/Jl16jy/ifny4v+I05D/5zPQIgKpTZE6plski8FQnL83hu
         +5AFKiqzGjLAwi9zkS86vrlPWQ3gzaFFH6jkELDMUnUAYfHK/eAM1bdVWzzdIXABwF5P
         ff9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149138; x=1766753938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQ8BpDnvaxRKS1c970H93q1ZxObJ65jXNdNzE4pE0VQ=;
        b=DtQoO+mXJR+mRNpy+sbINxBd6upuwf3vz4Om5bMA9zYbWhGKr7rToDIQv7dZepWHTF
         nZNn4ZNpw9SBc4xo88UfZ5V0a+XFtXoas40UTUCYl6WscNfP5k9Gs2a/9Lud69khqYN/
         9tNfyT7IF1SpwzmqiOnqgJXewsf6gAVFe5SqqqK8+Kuj+C+Ndj4n7ka5mIsoJS10jCh7
         1ng+vpihyNYuJ5AxAxvSQ8hF5O0ayLz8h4OzHg5nCQ6mvbTtUTA1K5ibZovzEsFx3ojE
         R3mv3Idh51ZenZLVGmGJ0UT9N34/2mUpQHN2yupd5maOlZbD1IPxr78AUH5sikYilQOV
         GWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrPtj6GgNCbOZcXapb2dE6w5H/dWw9x85e7GxGM6nfSb/70VpKoMTRnNoAIEngYq+SQzCwGJnA0tpXX55d2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUBm3oQUap9+06lh8j8BYo1cn42FFFf38YCIG0wkCXs3XuSgp/
	rvCNkUTo8XU8Jh4zdqrglM8y3d+qOLEGJn5/fFdUeIFo18Hn2sfu9ohqLPfwK575+rAuH9FJakP
	reGJl8PeEwfxbeOzQmAUQ/kfY3YxIZvEhHJJy9Y1D4Uy5yib6ffQuFN4LCPPxwM4wyLp63Q==
X-Gm-Gg: AY/fxX5WrG8b8F3jd0J99uzvZ4SDwn2EBO1VwUwgafAd2KBBC8TXRdHVWykKqgDfSGE
	4PWxA2ALxP8/SCVbGcPlsbjSyhOHq3Fkr36mY5/VHmsbxMWZIvVGZEGa4VhqlPhcNfMgfU+djb4
	jHbPDRdULlTBVKHk2Rlkf9FWTVGt4/BP8Rr3fZKxUMXo8B72n0smnxQM/pmY8wNkUs3Khtibm3M
	t1lvY86dmzjtwEP+k7Jd7gXPJ1vvdA50gMVpFbaljNQ6/CCCb56LukouU6F1V8cB4+fL9qPlfVP
	FkA8uDCD5RREWWg5G9HOPU6fTlqbKuLTwd5XoXd9RYYDz2qAvZ4O5KZ/74beFLpupuyuJKsXj1J
	OWxBEyFBBDcDyAchz1hWo5Qq/TeHwqHWbIXfF2nF5w39LUvzVrp8qbQVdjWwpCFmaiw==
X-Received: by 2002:ac8:5e4f:0:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f4abdc5c87mr26785071cf.9.1766149137955;
        Fri, 19 Dec 2025 04:58:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDWGdxEfmLosc59bks5bBeNjqEWIzY041ekBoX64RJpOVkxNK5lvoChgtD4nKmgNOZ5gynEQ==
X-Received: by 2002:ac8:5e4f:0:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f4abdc5c87mr26784921cf.9.1766149137553;
        Fri, 19 Dec 2025 04:58:57 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53c70sm2115423a12.6.2025.12.19.04.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:58:56 -0800 (PST)
Message-ID: <9d5d1caf-5c3c-4c58-92dc-10f73694ec0e@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:58:53 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add initial interconnect (icc_path) Rust abstractions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250722-topic-icc_rs-v1-0-9da731c14603@oss.qualcomm.com>
 <CANiq72kxcEywL4L6HEqn7AZa-jOBsw08jr+Kvjdwrd+iTOO_uQ@mail.gmail.com>
 <9884efc6-c6c5-49f1-b582-55bba8397521@oss.qualcomm.com>
 <CANiq72n31LBnLdAtZH0VBzVGau-ddWCp=5=Bra=boRE4RiCZGw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CANiq72n31LBnLdAtZH0VBzVGau-ddWCp=5=Bra=boRE4RiCZGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNiBTYWx0ZWRfX3wM89HAU8aOo
 2bAeBDTCPyRwMx9vv554Rb7OKbWO0szkSlfyJpqOkpnC3v4eEwOJYwd2YVIQgzXPrZHerpiRyu8
 7Dc+b9hycFZ+8J4hi5vyxNmvrmiJH0DgPKOx1nRMP+L0uxNAuVq9Z7S12t3zgzci9NOsnJaOCI5
 GS0rb2GYQ/NL1qfrERYd+CePNBhJQuhndip1ldRM5lcPkfqVvIBh94L1naAc+/Cr7Pu5UKtCPpZ
 W0JT0VzQ/dvW9AVIMKiXeOK8I9ma7Q0vHOh73LWQuoMaX4dw0bR5T4YCp8SWTLpnq/3HJ6qpLSa
 Unp7wP8cnm8kNknaIMfN4iW1HkckNmt6nFlaUOLYuJaa6d1fRjFMr6gn/R0hf2eVddBSSDfHFtF
 MGXgz4c8sxOBlo93JkxMTZRr6hK3NAqqS6lAtZ6gadlJqAd1cpEPFJ7/KU+CLEl/xdN0LxbKNXT
 W5054X8gPkU7fD8Grag==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69454c12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PfD2oos9AAAA:8 a=EUspDBNiAAAA:8
 a=giwF036dxWHEPjP9aMMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=oXWlT9oWAVMySZ1Hvsws:22
X-Proofpoint-ORIG-GUID: __1fs0_evpO5IawrKRIzvkoFWNPe-Zs9
X-Proofpoint-GUID: __1fs0_evpO5IawrKRIzvkoFWNPe-Zs9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190106

On 7/24/25 5:55 PM, Miguel Ojeda wrote:
> On Thu, Jul 24, 2025 at 2:36 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> Regarding the users, I don't have any specific promises on a consumer
>> of these abstractions in a short term, although the ICC API is rather
>> common (especially across the major arm-based SoCs), so it shouldn't be
>> long before someone needs it.
> 
> In general, abstractions cannot be added unless there is a known user
> that is coming upstream (or developed in-tree over time, like Nova and
> Tyr).
> 
> There is also the "Rust reference driver" approach/exception to help C
> maintainers bootstrap the Rust side, which you may be able to take
> advantage of:
> 
>     https://rust-for-linux.com/rust-reference-drivers
> 
> At the end of the day, it depends on the particular case and the
> maintainers, of course.
> 
> I hope that helps.

I don't quite recall why I ended up sending it as-is, but thanks for your
(and all others') insight!

I may revisit this series one day, unless someone needs ICC bindings first,
then feel free to take it over.

Konrad
