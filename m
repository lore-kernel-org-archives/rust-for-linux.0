Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1962D73BE
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149059; cv=none; b=rmHp3wLMgTgERgf8Pl8Q8Ul/OIZyhIOAwN7HM/izTZQkhCWjPSC7kgfRjdxPBSidYUPcFGaPOlU8vwABfxyyebbYtBetQcPuljvO6vf35saa21vAqkyVh58sjlZdrjilUKvNWOuzt8KKt2XgwJQkRoYgbdqUZM2G+TGyaWFuVDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149059; c=relaxed/simple;
	bh=Nmgmbc37BmbIUHfQjHR0gOnqRt+M/82LN9ZzoVB2q2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVzFh6Bsmdx81kugH7JW/FkRRpM58kGP2aDhMXpGJnC529EbXnClC460z7izQAdoWyyE1V3vljIRiUVCRuBcWkyPP6+9+43TGOt97xYkPf155MoIEkK5GXqVQQhmaAwOdDqh+8Jv3UvK2YnCSUyaJZS6HYmdjdRraE3acScq838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEhTby2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dz21pR7h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEhTby2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dz21pR7h"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB4hpY3559014
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 12:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rpUqy0FXyUwvP7vqrL31xDpc2ti1J8x7V9ekZZIqyLw=; b=NEhTby2VLOzoyeXO
	8EBxW9w46tRSXiqQQzIspIxXS1rr2+O374lNY1Lqc96HKmVnhRY6w5wTJvpPYAEa
	XNLTXMYTvAwz0nrlvPC1NKFFJusKSAf24qgpFNsgBEQWZwI6hSqUdeJjTWqOdcH9
	hh/KXn/QmIL6pVSZ6dMunlsr2tucDq2J/nhtQEMNghVtqAiutOP2qPyC1TuU4cfp
	UV1DhaADRQNxcM1cVDr+XW+l1SQJaUZK94alVxETSSBBB3PgrxLEdKBXcMsd1Oxs
	Ck8f9IfGHWFva/CsQ495clRhI3o77zKvj1UX6IxDHbtsYUygvB0MGhXqCRtRm/l6
	eP3qmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2caqcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 12:57:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e518fb75so27223085a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766149056; x=1766753856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpUqy0FXyUwvP7vqrL31xDpc2ti1J8x7V9ekZZIqyLw=;
        b=Dz21pR7h9jGLYOg/WJmz1q4LqCRfeNujObzVD50KDKWGvtQDC0lwqX02osv1TGT/JK
         zZFBZhTX1xYgE4DiAAU/7u72Sw9E1Dc16/0cpo7+AnP6Lxfmlj8xuIzJL05pkOedtLxj
         lHsl80BM9pd6qHyklGoOEiWfbqt/x72EJ5I24LrnLKsN3LKH3BCk893TclIjgGfoH8EZ
         1TIATafvpElUhKR2URBXSFkxLFiADpsudKCD+gUBIr/Fz7UntrCCCTUZzqU7JIRHzozE
         GZxAb+jQ+s5lE9N9u1dMh+t19tEkTloFY7dVs8ElQ+/QFfXaPmXYy8hZYH4feIMhNuzg
         Wm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149056; x=1766753856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpUqy0FXyUwvP7vqrL31xDpc2ti1J8x7V9ekZZIqyLw=;
        b=Xt46HechUUkDYPdGpES4ZqVJg5QZQ9ioEnxnp7jUy7F9o2leGXJ3a93dmU6Twh7Dky
         hd81ngze9FMKmq3fH1GMX+ErlzVZJ4cXvJ6Nu4EzgR77tphZ+uL9p9JzVGyP2piuEDLE
         SLeBWBBKIrZEikBRhswCkeq503tH3COu62kzkdedreYFrAWR+mssSKkyvBoQapfcbMRZ
         UcfTy2r5AxWOGZDkKXnHJwBWyEJDfnp/ISiLnA0ZSMEOVA1gDtoyHDRC9MtAMf4Rm2/+
         +Yg74ojfM+lM+XFQBBI5Ce1wHzWDK1IIOWrzP9WskVZFBSCpF5FrfTLATo1z0Ot/0eM2
         4ioA==
X-Forwarded-Encrypted: i=1; AJvYcCW2gMCuWKPgjhroMwNA7xKsGrle/iYIYL2tNa0sbpFOgJXR35eAs/3JoQ6YXOnTggBn//EYP2u60axcFq8hUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFI4U9GKzq+9lI8S5xfYyiJh9AWO9/QgO52Glx7U89qsMQwye0
	uNae5WsfO2W4Uz5SxkRNLVc1BkDEeUpm3ve/7OTa1gXjiNKrB6JuJCa4uxmIAwTJgVAzdndCrmQ
	mgihZCDdahpTMJOsfp+P1c0BhusMp8sIxLutxhJ/U0jDeAnvMOEnC7IxkDv23rDpVJT8jEw==
X-Gm-Gg: AY/fxX4k1LeiRjjg8oiyzaN63cT6rcovFObdsbAkuroRaiqtEXN+jy+/G40NZknEkGp
	CubyFpNK3eHJPo9vktYRh7BpqB0pKu4NEpaie3FakdALuBk7FTHMFD2PolUxfx5Rd9RrdSH+LhZ
	ZTXIGXUQfaZFfQ1HSVJMRoIipbIB0cPk9r60mg80xUgtAZV44RbO2Xf5cbHRKnskFnVomnxVbw9
	deg547idwcCBfkUI6e/dA+Lug6r5Jgi9ebkJZA/B7KY3D433lFEky1EQrGzqDIrlAJIR5QcTcoq
	8+UcvYEIJHCBk5P6DMDRA418rK4Ief3ocIdXcCTtGwZ7ecgoLAkxKg21p2f6b1tNqjE3h3smJHQ
	FeGcZTUUZAb5GEqs7IYiy9Oa0HRuIIfZlae5DbpXvuUSdiK5wYOijdtgoS97N5WDHCw==
X-Received: by 2002:a05:620a:4111:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8c08fab59d7mr303021285a.7.1766149055836;
        Fri, 19 Dec 2025 04:57:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFZ4KdFJ5tZqCD6zHIWJNWJ/1B/yl7GkUveDwgJaiMBUM//ImT2C9l2PhQ4e7IxsQe3cgUKw==
X-Received: by 2002:a05:620a:4111:b0:8a1:a5c5:ef18 with SMTP id af79cd13be357-8c08fab59d7mr303018985a.7.1766149055426;
        Fri, 19 Dec 2025 04:57:35 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm2126156a12.28.2025.12.19.04.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:57:34 -0800 (PST)
Message-ID: <298b7438-f6bc-4022-a56b-26585a6ddf91@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:57:32 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM 2/2] interconnect: Add a test Rust consumer driver
To: Benno Lossin <lossin@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250722-topic-icc_rs-v1-0-9da731c14603@oss.qualcomm.com>
 <20250722-topic-icc_rs-v1-2-9da731c14603@oss.qualcomm.com>
 <D4552EF5-21DB-44AF-8E45-F57B0B8CB853@collabora.com>
 <DBJGTCPDUU4J.16S98YARG0S7O@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DBJGTCPDUU4J.16S98YARG0S7O@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69454bc0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=b_VcUuRT89JXC9oTYd4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwNiBTYWx0ZWRfX9lMxt+Y9Je5Q
 afwLF4LeeVTsFrohLtIDjoAqbpS8uEBYNCpCHIv5UlwmqbFLD//yMq/WwEFEu/wx7xreAsY9IUZ
 SIGXVuUKwCr/jXl5AcUoSnhqP3wRF5DpXGTVqoLRtDMdfPI907Tcr27dIHV/65NcNmLJLhfd6wS
 PzsZ/HoS9n6RWbKPgspfEuQuEuMc8mFbXBhbBeLWXFGnnuDZ0qlWC6wavThdRjAkAZ8u9YjX2Uf
 FD6jrjiKB282N1y1tdBjPRJbyPex+4Y4GmE/wWIqkVpEtk8kBI/IY2U6hFG6KBh4VPwlw3DmZLl
 fmSO6VdFjdbIhVTeLWgt98FBgrHIM/GErjp6vShVklxbS3/NMdTYh0ZuejVNoHzFV5FeQb5qpQX
 zgC3gcDIgGtXIGb+7GAwJn3cH52zT9tqe8atQSTN50hNk/19NEcdvKOUj8GSxHdsJk+A689sPGY
 ybhiRDBJX2BJiKpe/5w==
X-Proofpoint-GUID: 09xZTTNpAtvrKIA5sJfEyXUpUQIfpNBi
X-Proofpoint-ORIG-GUID: 09xZTTNpAtvrKIA5sJfEyXUpUQIfpNBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190106

On 7/23/25 3:22 PM, Benno Lossin wrote:
> On Wed Jul 23, 2025 at 3:10 PM CEST, Daniel Almeida wrote:
>> On 22 Jul 2025, at 18:14, Konrad Dybcio <konradybcio@kernel.org> wrote:
>>> +#[pin_data]
>>> +struct IccTestConsumerDriver {
>>> +    #[pin]
>>> +    path: IccPath,
>>> +}
>>
>> I don’t think this does anything useful without PhantomPinned, but Benno is
>> the right person to chime in here.
> 
> It does do something useful, there just has to be one type marked with
> `#[pin]` that is `!Unpin` (so for example `PhantomPinned`, `Opaque<T>`
> etc.).
> 
> In this case however, `IccPath` is a newtype of `*mut bindings::icc_path`
> which isn't `PhantomPinned`, so this doesn't ensure that the
> `IccTestConsumerDriver` will stay pinned after initializing.
> 
>> More importantly though, why do you have #[pin] on IccPath?
> 
> Another question is: why is `IccPath` not a newtype of
> `Opaque<bindings::icc_path>`? And then one can use `&IccPath`.

The short answer to all of your questions happens to be the simple
"the code compiled"..  :) I didn't know about Opaque<T>, thanks

Konrad
