Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F6F212D83
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270368; cv=none; b=exlwH0Ht8LnQXIlCeZuV2U/ccfJATwKBaz4j9JA+VhakCN0poNHw5JF+Ezt8RYtPBVI6gbz96F8bvmJY592JX58gbt0dUaLVdU6w+pWZMB0FLvQSBdgN2/JCuQxnEsJyBQYrr9pXy/Fgm8YAYD6RyzysrJordXhBuBTl6CL3U9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270368; c=relaxed/simple;
	bh=9rj1cVhx4thgC/2OWJ4kbD+Kw0LtrOjEdbA4NWu6Chg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=St0hCc4RPJiJX0780zLWyJZ7ri7YWO9dGZzq7N/OYjoQb9Dzfr7zllIf8m35MWHl/f+gJ5q4hzl2mCqD5IWdwvztIk77qTeSS7GS+js5LrXwy+IhBL73uGKiPn3guXBXxB/+kN8u3ZIJK4Xg3XtyH20IlDNYIMiRLc5L8r2WZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpYID8r8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpYID8r8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9fJts024458
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 11:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEq8YYhXL7FoLLBpSRO5bvtuwnmRSOR3fjHvCA+iHcM=; b=BpYID8r85zvNYYr8
	CnQdseHOG2/afwfYo9JkfUfV9U4SUMSGXRDBF5k9gdR+yg9SdSMuglXPr16l6Vb2
	mcJQUtUvQAqCA4OHOhq694bkKimwBMh1sAfKpvG89CH7x4OPlvIKm95E1nenZmiW
	k0rLAZEzbCnBqCUSK3PFLTnTA3Uh2yGurttAbvn1zKt82FDer4tPUjPktaNKm6Xj
	vs4bh0clF+Qi5hB58ggXfwbFykkW8ZAM/9VSD/VYeG29Wc5EABXIxzBCTroTvuOm
	CzEUitSBoLJO6cbM4bMEcxNGCoQ4w+48T3QQOQ/NKM70inypUCJpQTO9fveh84N6
	gpXDKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6q5d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 11:32:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab7077ad49so14382871cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 04:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270344; x=1753875144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEq8YYhXL7FoLLBpSRO5bvtuwnmRSOR3fjHvCA+iHcM=;
        b=kJ4LYz1vQ2HUz4F9YP9WLGPF4z0rauftOftvGXki1s0I/ucUD+5smMjDrW2UlAatbB
         XI/Ww+LEg5xPjJ1URe8OeQJcYssuVqEVyD9jT1BQDgogO6Hh8Dlf6cGES4bHSQrtupWi
         +rBdubwC15p4/kbva4+vplQNTfEwTfn5y6mDysDtEmVXHr+Pv7PczvQEoYW7Kdo/JR2z
         YSG1C/1JbsGSiS5hDQX0najkiG1szyre6Ofx4H5XrmHn5g8hN1KZPhuTb1i8pMW9pmQn
         fqpkRfZe0N6p0gHzxFaBkQfMCbV4OrRJz4gTPuCCOGWL2lxS2beGCkQJokpdKiGWD0d6
         Dtfg==
X-Forwarded-Encrypted: i=1; AJvYcCVxiOBlpBVK4JMvmvhcv5NENSrZd8R56hwKPF9FLC3lFu5AxGZDvZQhaJM9HKy6gtvHhPHpfXtAaQUmPVdIMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1V9g9Js0nCp5ImyUUCXuFxsF6UpJdy8k82o/ykSZIA6IbfRs7
	zwSd0bSTKfTJgFGFtZnXSu8tLm/HuihyKBl0SJ8sGuw4XqWv8BhDwuoeOUos9eeOjP982dJBTm0
	XdZ6sGo26MLnmGcqDrgwgI7fGDFAv9TPzDrwnQHwVgWOvkt7NjXIEeYOZMSA89lCtQordpA==
X-Gm-Gg: ASbGncu2h5POeeN0NhMJ60ggsYcTtT7JAD+NJgdV5JPYeBxzNZBOpVCFjWXuOe5Q1B6
	7XyAT34BzWOmO7TPWAWTKu0B5fAh9iZgNQrLkLLspoogR/E1xowXvoyfHQPfsXr6i+vLZ/vGLWD
	Hu21eVTWbmuK1W10/sfthb+q02TQQi4l+wf1Z4aOTDBMiakDouvW+wUIQreOTByx0QB3RztRM60
	EVTOCpCi4L6E6MxFI63+wvnQQotDbS/jstgNjlyWxu0O1kRChCr4+ClHAPtD2c803vI0p9UyiR3
	dQsu7/ZXFJJBK7GGlLp+iknZOid3u0LpDCd+A/9Lb2a/taUA3IiuWYByyrnDM4HxFC93aXkjF5V
	3tGBCYsZXpZHHsJEGpg==
X-Received: by 2002:a05:622a:1485:b0:4ab:5d26:db92 with SMTP id d75a77b69052e-4ae6df26e46mr14599971cf.10.1753270343603;
        Wed, 23 Jul 2025 04:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8bELZd2/Tj5DlsN6hPJW9HVlRJ0K7QJZgVKD+12MwYax4hBvWftddN6G7Ot0hdS4s12N1Tw==
X-Received: by 2002:a05:622a:1485:b0:4ab:5d26:db92 with SMTP id d75a77b69052e-4ae6df26e46mr14599761cf.10.1753270343048;
        Wed, 23 Jul 2025 04:32:23 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c907a5b1sm8427012a12.53.2025.07.23.04.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:32:22 -0700 (PDT)
Message-ID: <d80ebfbb-5fb5-4dde-a79b-adb22231a63e@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 13:32:19 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: Add initial interconnect framework abstractions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
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
 <20250722-topic-icc_rs-v1-1-9da731c14603@oss.qualcomm.com>
 <CANiq72nPLn+3V_DhN9_dmKnRrb5mfjzQ67Utz7HdtOY3McpweA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CANiq72nPLn+3V_DhN9_dmKnRrb5mfjzQ67Utz7HdtOY3McpweA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=6880c85d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=PfD2oos9AAAA:8 a=n7DJBcn5hHOibpQQY_QA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=oXWlT9oWAVMySZ1Hvsws:22
X-Proofpoint-ORIG-GUID: axQYPbApRsRvrLn_oJ1ekBtNbnX_cAt-
X-Proofpoint-GUID: axQYPbApRsRvrLn_oJ1ekBtNbnX_cAt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5OCBTYWx0ZWRfX9ajF7e4iICww
 V5cbHbwAg3Z/4RN8TK//qes6xEARieNI8s/Roe9HQJ3eWyMQMtWx1YJukCHNg7DMr0XBvg2oegO
 23wzSFKAGh7+QAOjS63odFjclag+MjvNR+1HVRkfIITplaWtYl7hfbLyrT4gA15DwyFPHdJVDcD
 uaSk2ANbReUklstj0vyC1S9L1s3UyNq4Q3BmDe0WtXhDCtR47m1prRd9DaL6zXWEwmQgNvb2R6C
 urInYKmjF3EEl4xA9Okxtb/TQBczb6iKCnWnWjVon/dLmYWAQhvvO7tylLsluhU8otAZovx3Jbc
 Ns8V6sSA9vlSJDWoe7YCineQXOMDVob8pFupJgVR2oIq/n609SxOlPPRIU5seWC9kOXVMN0GzGe
 OT4P7xslNws4mMmbOM0HS8yDDXSKDH3nsR1Miyfk5JMxWSRJKkCiOxP99rbuBeCbivX5ER0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230098

On 7/23/25 12:42 PM, Miguel Ojeda wrote:
> Hi Konrad,
> 
> Some quick mostly doc-related comments...

[...]

>> +    /// Create a new instance from gigabytes (GB) per second
>> +    pub const fn from_gigabytes_per_sec(gbps: u32) -> Self {
>> +        Self(gbps * 1000 * 1000)
>> +    }
> 
> I guess this means callers must call this with reasonable numbers and
> otherwise it is considered a bug, right? i.e. this could overflow, and
> thus panic under `CONFIG_RUST_OVERFLOW_CHECKS=y`.

The C framework makes no effort to check for that, so panicking is at
least something.. That said, what would you suggest to do here?

[...]

>> +#[cfg(CONFIG_INTERCONNECT)]
>> +mod icc_path {
> 
> Maybe a different file?

I was debating that. icc_path represents the interconnect consumer part
(i.e. used in device drivers that just need to toggle a bus endpoint),
whereas the corresponding provider part (which manages said bus) is not
yet abstracted.

It would make logical sense to split these two.. with the latter going
to icc_provider.rs, perhaps?

[...]

>> +// SAFETY: An `IccPath` is always reference-counted and can be released from any thread.
>> +unsafe impl Send for IccPath {}
> 
> This gives an error, right? Was it meant to be inside the other Rust module?

No, it compiles fine here.. Strangely, I didn't get any warnings or 
errors with this patch. Maybe because the struct is pub and within the
same file?

Should I move it into the module scope for sanity?

> 
> Also, please also run `make .... rustfmt`.
> 
> Finally, the examples in the docs are converted automatically into
> KUnit tests (under `CONFIG_RUST_KERNEL_DOCTESTS=y`) -- the examples
> currently have build errors.

I was missing this config, yeah..

> 
> We have some extra notes at:
> 
>     https://rust-for-linux.com/contributing#submit-checklist-addendum
> 
> on things that are useful to test/check.

I almost wanna say `make rustfmt` produced slightly different results
(one or two lines of difference) than make rust-analyzer + vscode
extension.. hmm.. Perhaps PEBKAC..

Konrad
