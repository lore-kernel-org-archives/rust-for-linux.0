Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B552834E746
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780148467; cv=none; b=qPaV6UeB21oYZrWP2g7eOPwFeAzs4EhhRY1FiD9YJMicUDNpqOMAqeg0IKhAGyszCIMRqRaHHWbeLb1yg9Bro1ENlqY8WdugjqZXHiJoI0bErwuiSbcRPrzcRd1xHPlGqAE4rb4/musBBUn/6LiRm72/jgpu6/inXe8/tWlpdGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780148467; c=relaxed/simple;
	bh=tW2CMdXFT9AuTtzCZ3CRjgagQnl9KlmnYdX4+oulx+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SE3pPEmGz5I4dZDT9rosJuCGPAjR31eS42VORWQLjtqDXP3XHJdQ84VsTOeERq+0knorSPNJDdmT55jAkPo7mc0yUqHwLQcGHBcpjcePCEAXR3vrXFKYa8g8SN9g0Vq4lbJxyLMFBCMXPeLLBLRcA5v4uWItJERwYfIG/lw1q9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFkajicP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiDVwFa7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFkajicP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiDVwFa7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U2BlAK4045775
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 13:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPfckcKTHLkm+2MBzGyKAZ6/OFkCiOtt/xJcMW2k0zE=; b=oFkajicPppxbRMoW
	fmnP4yKYDPBktloJaWJVH/GYy9qc9kveFQYY5eH8gdk6jCAi1GOiPGXftGq4Gfy3
	Frn1xvgxGYV8lKM4WrMMPlpZtmpqFMfJ4aI4c0X6uqwJq7EVTA0nHcH5j9Vp+6t9
	qvfgHtga0EGd7CRAQYq2cZSAOyXG4QhbyItOkE8lGYJk14x4AdGFAdRdn03tpF4G
	OJRuu7ccsY/aOGgX7F3miGdyGv0hf4thY73sWVq5g2bPsCtdDV6V7ev9tGZ9SJej
	xdI6VicllCs5j46lOgapJmgKT7sA6DHINRFRbee96mGMc4gddLt0fTDqrknIChB8
	EmdA+Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7h80j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 13:41:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso28630900a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780148465; x=1780753265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPfckcKTHLkm+2MBzGyKAZ6/OFkCiOtt/xJcMW2k0zE=;
        b=MiDVwFa7sr2BEBjSovxvPl2l3B/oaooP/f3+8bHPI8VocFcV3UZdBv2bnukYKKe1e+
         B1IgKMH2zTuoJqk+gA0qv0oHW2w2SGbZ0mfC222o5rPPPlBY4MDwzdTEhSx7NNu3Q1pO
         Qn1qbmJPZgfh6XbOpacX7HGiVtG1jm3RJ83yT+3eP92D6g9XQx34YfCd9/qDysSBf3xn
         upW9BEC3W8eC51UkGZnGlwntr9dk1VWRr9R77LP75WJ5ih07LC/0cLbPBQHeKyRIsdcj
         fLSUgNHXYbUBSXoeXImnraQEq9gwmZZBnnoC4vESbb3fVM3t74GBVwUqW8NrEyaHDdm+
         usYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780148465; x=1780753265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPfckcKTHLkm+2MBzGyKAZ6/OFkCiOtt/xJcMW2k0zE=;
        b=Al90FVhaKL68svHPRMrpuxLLZ5kGWCQIv+f4DyRWVfopWpekl6ul3MfczSc/Ex9Xo7
         Pz+NTN2BrldgilYPeFb/JdSry9PGuuNgFP0EODi21Pp3VpgOa6A3Wb/iKctbWM/yi5c/
         ti/6RRdIx8Ug/27476bcjudJzANQQ0CS87tSwPjfgctm5ZpfoAZnK/oZ9d/GKnozrkCC
         uML5cxDObUp4O75n+W8yk+3IA2w+OKpZ75sw23c2TtMGZ86yMU4Aa0Y7k82SE6nmyz0u
         fP/gZenvP6IsVRyeG33HF8SDHNDhZhwN0AnibKBS102f+4KP4nq8IwILB+r4mqZZTwJy
         ukSw==
X-Forwarded-Encrypted: i=1; AFNElJ/SqRg2bW5CEDCjOXmDM6LghN42h8qU9CYEI238a/OVhPZz3gSqhvV1mAesIZIS6usRon5Drtrglq8tJDvp7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbpfAOopoORLTfvnjJYX/NkMfSybza41W3zwzy+dnCrznqv6CJ
	F0PuRlR1ini2BqBn3mg+CA21y53/xQEFTvLs0EWWVMZFFjsMifJoksZOXu7ZYpY+szs49j7kHrD
	evPngJb3lIF9x4YG8d3C1cob75PSxOyal7PJqLgIG7oZE87kux6UX3Zw+C7GuvcgW1u31EQ==
X-Gm-Gg: Acq92OGo/XGT7GQ5zmLPuG7GrTQhBZu/VYc8ua9/aECGk5X3DRTeprvG5PsdnQ8ukgy
	r2dWl4IiSc0cWNUlUX1025bjPjXnfEgQ1m1VfnLWy5IJAD84pPFh1nQX/cBr3BfNkyx+dliEqP8
	oSuFaegjGpEFOAjrPPs5yBsY8jxq16uEZXh1dIClN7Vm0A+R7+4ezR7qYIrBXfSseV0k2f8wtca
	F1w69iU5LweDFCZ9NhDIBp+DXqvsWTZ2WxJNF3X2gkyoJSynrwgjsxX5NS45odLolYwh+U0m5UZ
	LwQw3d7e1BIqqUIU3iOWF2a06BFY+vIGjKBT9k8P/IIfYvBeFrvnojgYWKwWpi7+NKUe8u8bSJE
	FeW32TS4jKA+EoP+PlYoBVVs1KwWIYFLOW2U667KHS5TZPM0Ox+iszZoGtZKYy5b8ZwHeApV0mS
	CaQ2geF3Ra2mFYheiNwbXRce3GveU=
X-Received: by 2002:a17:90b:28c3:b0:36b:bec8:94cf with SMTP id 98e67ed59e1d1-36c4ff34042mr3494611a91.9.1780148464575;
        Sat, 30 May 2026 06:41:04 -0700 (PDT)
X-Received: by 2002:a17:90b:28c3:b0:36b:bec8:94cf with SMTP id 98e67ed59e1d1-36c4ff34042mr3494579a91.9.1780148463920;
        Sat, 30 May 2026 06:41:03 -0700 (PDT)
Received: from [10.133.33.29] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbfc9831csm6617531a91.1.2026.05.30.06.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 06:41:03 -0700 (PDT)
Message-ID: <1ba14321-bea9-4fdd-9f8e-87e31d034de8@oss.qualcomm.com>
Date: Sat, 30 May 2026 21:40:35 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: cpufreq: clean new `clippy::map_or_identity` lint
 for Rust 1.98.0
To: Miguel Ojeda <ojeda@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
        stable@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
References: <20260530095809.213611-1-ojeda@kernel.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260530095809.213611-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: An2uHhVeEyyg7LXV3AhOJXVHtEE6HW5a
X-Proofpoint-ORIG-GUID: An2uHhVeEyyg7LXV3AhOJXVHtEE6HW5a
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1ae8f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=R22tBeTbAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BzWTF2Su1jj-Cm_4THoA:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=71pCXManv-pOE82v44e3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE0NiBTYWx0ZWRfX02Rrn0npBAit
 WrjcABJ0Eroe0R1ihgYTO55Fn7FrltloQGtX3PjdKaUhUEo/nv8JANAFOLzY+EeRnAYWXyTw0S9
 gn5PXUugLHBuEN2Td+Ay55HG/HlfEmrObCxEHq5bCgEvxlyyskgyiL6s4PEh30BICYzN4cv1KrD
 G6esbUmhnFQNdRL4AaguWikVhWs2enODjiADlTKLq8z7Szvnm8Y61clk0bH1YO3pbwdWV55uBkp
 9vF/eXRerkPSCd8yh5DnFYAYAxlLnX3mlBNAZ4e2myx1sDgqA/kVD8kbfGK0szaZAO6za0Ef/W/
 RaqqLNvIiPtCuYeM2GtDn1JJATVzZbzo1a/2SPA9tjvUZ38Sq4ijGGRMm2hynIe+cCCw7pp+quc
 8Z1BRnSNOoWhGGaFyHlJlMdMRLNmIruUORKPsEH+VmwqjoxSCEC2H9qEmjMGY0jg06hbRwf493F
 smYujxaHWaVykT48+HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300146

On 5/30/2026 5:58 PM, Miguel Ojeda wrote:
> Starting with Rust 1.98.0 (expected 2026-08-20), Clippy is likely
> introducing a new lint `clippy::map_or_identity` [1][2], which currently
> triggers in a single case:
> 
>      warning: expression can be simplified using `Result::unwrap_or()`
>          --> rust/kernel/cpufreq.rs:1326:60
>           |
>      1326 |         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
>           |                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>           |
>           = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#map_or_identity
>           = note: `-W clippy::map-or-identity` implied by `-W clippy::all`
>           = help: to override `-W clippy::all` add `#[allow(clippy::map_or_identity)]`
>      help: consider using `unwrap_or`
>           |
>      1326 -         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
>      1326 +         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).unwrap_or(0))
>           |
> 
> The suggestion is valid, thus clean it up.
> 
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
> Link: https://github.com/rust-lang/rust-clippy/issues/15801 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/16052 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>


Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   rust/kernel/cpufreq.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index d8d26870bea2..a20bd5006f38 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1323,7 +1323,7 @@ impl<T: Driver> Registration<T> {
>           // SAFETY: The C API guarantees that `cpu` refers to a valid CPU number.
>           let cpu_id = unsafe { CpuId::from_u32_unchecked(cpu) };
>   
> -        PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).map_or(0, |f| f))
> +        PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::get(&mut policy).unwrap_or(0))
>       }
>   
>       /// Driver's `update_limit` callback.
> 
> base-commit: 420dd187e1572bb7e232781bc4377a80c8eb64fb


-- 
Thx and BRs,
Zhongqiu Han
