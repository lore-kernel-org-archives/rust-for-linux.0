Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901C22D238B
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753360621; cv=none; b=OPe5a0pwsdv+UMg8xRKIRrFSVK61GQduDV/F6cecDUrNGkJHwgWe03CE8r1VM7IFjaH373fOBoJkIrfnDkftdgp4VDbpKzbKIhvc8dovZ/wK07wA6G8j9TlY1jkzGNTTQxJQ38VIM1ivI1b9r2pxekObq8k7tvTsEaP1r/ZtroY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753360621; c=relaxed/simple;
	bh=LcSIW0NY6oVfU7XhBiAcCwSmXdrPSxDV38BCQfAwyXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbNaRauYj3ig0M/45FMOAzmehB9WZmofIM8MJ4Tt26OjZRkTrPEiVIYWkFnG+O+t6aGqIPH8P6SPCeBf5iP5k5UtqaR7kw7c4NBaiTNExPNosGodz7kJoCD4ttQdAnwREe0uFI5/qn1LiJ6gm8+QC2bQhvMcRD+L5HfqJ/SOWlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OT7nSb+t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OT7nSb+t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9iFnP031250
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 12:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSR4gbUU/2tBPcpsP9lRCwcwfrmXksikVD3aXPQ1sts=; b=OT7nSb+tMmsWHalP
	bvt32Eq5DE67wqxcWNQ7RmlVdqStcAEJFIjE2DJFh+TcX4H4wuzmlNY8+wFQMBHu
	fHjjjd63XJZ9fnZtWr/Yb4tOKntSmW2GmhE2Xrmklb6qU25PTFD9RqJfMw7B4Lvy
	GORgShFwNatTr4X70ZqzDU/YpFjkRrBMYxfitQzC/Efda7iKJYgCkBZeWk/MzVyS
	dpwB4WatGXFuqgXc/srS110j5GcI4rjehJG8KyVFJvDRACxL8dGkbf5YCWn/Qo9j
	J6W9buqT+4WaYjBTTXEaLeq4HS6zIixg6DrYqJzVqSTk/fHNTFFmzeA6ewEG/QGK
	CY/Icg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vf2s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 12:36:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e1d3bc3bd9so14829285a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 05:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753360618; x=1753965418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSR4gbUU/2tBPcpsP9lRCwcwfrmXksikVD3aXPQ1sts=;
        b=jyUkSYOqsVco8PLY/XAkODi6bmIeFEWeTqefDV1PGnLUE9GZyRurMezFv71WHy6WxQ
         NtxDCOUimRp4B9Cmq/tebojmx+j2AopG0Pw+LhaSwY6woGMavciMfhsMn/U1tRx5IM5q
         /3ZStFsseuSGzlW5w1mm8qPKPLXBSdUcPI/rTaIVddC/Li96hC+x5AwI9wG/pBcZuhHQ
         P6SR8AeS/xmlRCqIiTGeIjlPQHwgskTfSLRDQnNRf6dfvIT74lsU3N8QpIcXtzze75kl
         ENAo6MtBCirextQuy8jmv45OoxsOXp3TjVXZPFJmfywJzjk4q8U1zytBCth50b17Aag8
         goZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXciksJ7izAsaO/hNdr8AWHDEH6mymFckyAyF1Fz9y83nmS9ScP0MV7Fy0DfVq/VXaY+gXEXSDYfwZCbig42w==@vger.kernel.org
X-Gm-Message-State: AOJu0YygQXNziPR0KqEliiXZi/IwyQTKw1M9JQV3b86UeZHtkAT51o1/
	ZNTRGAbkBanQYcqkGxgDSFEaqdw2iGEdN/NDxSvyIMBs+YfOJCVpcYb9HihCjrEgxBFz3jvHgdk
	FFfTwkG6O8gGaJGlBeVCFUe7pVkY/CEsMUvicrpkGf2hEIt4sT0ORYL3pyqnbqSHfySo+1+N1aN
	Whhw==
X-Gm-Gg: ASbGncvJZEBKT+0YAmnXrqDm3E3NxA/goq9GFDQY7JhwHPEI7bHh/wEZ6wOpf72V8Mz
	f+WV6Re7IF+ouiR1j7ELSMRu8YxsIS7Aq77eBtuwlAB4FU1ZQUXH1I5HgVhOimjWon/Zxy5jFc8
	IDVVSQwu8y8CSUfrcL4rfRUsQoSSVoPtxMB3EbovTLlNOMVzfCyikk0opCfuhJQ6X9hmC2tRyHi
	sSNh602BeTmC2nHhkn0naAWuyOVmvF3t9cJmUN3ITu3tWqPXTQWk7pal40mZhyt2MhJkyeEiVIx
	6r9/J6ncKhIo7WgvXZDC3x68OU6k/gdHWlk694rJfxUxzveJpxo6qJDhI/c59f8JEfBdiAQhWYH
	3x6KRxKYJHcjV7IvgWQ==
X-Received: by 2002:a05:620a:d88:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e62a0e4ff5mr305361985a.5.1753360618060;
        Thu, 24 Jul 2025 05:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtobSdcxMw45bMRgVyfiSZ4iD7n9YDnCcddnf4qk7/DbB2ZWWg10WQWjbeX0X1bWYDwrezTw==
X-Received: by 2002:a05:620a:d88:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e62a0e4ff5mr305359385a.5.1753360617552;
        Thu, 24 Jul 2025 05:36:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47c496eefsm108992066b.25.2025.07.24.05.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 05:36:53 -0700 (PDT)
Message-ID: <9884efc6-c6c5-49f1-b582-55bba8397521@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:36:49 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add initial interconnect (icc_path) Rust abstractions
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
 <CANiq72kxcEywL4L6HEqn7AZa-jOBsw08jr+Kvjdwrd+iTOO_uQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CANiq72kxcEywL4L6HEqn7AZa-jOBsw08jr+Kvjdwrd+iTOO_uQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1jMAZ8zUxP3t6Fa0ELn2ooXeyNSNeNPJ
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688228eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=1ihfflFO6Zl3b22XxKoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA5NSBTYWx0ZWRfXzsslOlhs6Vh5
 2ZcwZG0eiQQeGMpvT4V7Wrt0u46xm3uKYD0kNuZKIjF7YeqzltWDM0R/7gdReJtBKzutj/PXJvs
 VyrASIf3TxE2eGghQSytUY1nszcoP9WqhSKAnddgHP2JdOfUTfrOyjJizOc1SxezkFMfoV5UtUu
 AFp9Cvaqsm6XQQ2BiE9JskHFt2s1JkujvqtmsbuRXIfnXigjSSfMFqRiMlymhfaB1759RfJ7Zrc
 FzyUqo4ITlMyRwenfxqIXo4X2Q+8mA0LN6dbzRMEithM+WwTVFDorzV6Ti2AjV9BxmqLmor4T71
 NKY0G2XzTzMvkGsRCv6Vs2MUZdyyuiax7HHkJHVispX4IK17sS1aeqxPEZTyi1esNe5tLadHCQ6
 5+P9D0IlsF2Pb2u/JDDPUgJStPcy6NOKddRm0FOXiQD1mKl3ck/Yb4EH7V2Qixz+wGFp9syz
X-Proofpoint-ORIG-GUID: 1jMAZ8zUxP3t6Fa0ELn2ooXeyNSNeNPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=927
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240095

On 7/23/25 12:22 PM, Miguel Ojeda wrote:
> On Tue, Jul 22, 2025 at 11:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> icc_path is in essence very similar to `struct clk`, so the newly
>> propsed bindings are understandably based on the corresponding
>> common_clk module.
>> This is the interconnect consumer part, with the corresponding ICC
>> provider changes coming in some near future.
>>
>> I attached a sample driver making use of these, to ease any testing
>> or CI work (as the title says, please don't merge it though).
> 
> Thanks!
> 
> The usual two main questions for new abstractions are whether the
> maintainers of the C side want to see this happen (and how will it be
> maintained etc.) and what users of the abstractions are expected
> upstream.

I haven't talked to Georgi about this. I can volunteer for
code-janitoring, but as you can tell I'll still need your oversight

Regarding the users, I don't have any specific promises on a consumer
of these abstractions in a short term, although the ICC API is rather
common (especially across the major arm-based SoCs), so it shouldn't be
long before someone needs it.

Konrad

> 
> For the first part, some subsystems prefer to maintain it themselves,
> others prefer to have someone else lead a separate sub-entry in
> `MAINTAINERS` (e.g. "... [RUST]"), possibly with its own branch too.
> 
> Cheers,
> Miguel
