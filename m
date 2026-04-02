Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60282328616
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 06:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775112738; cv=none; b=H+fhYPlz3tCjMKvnZipv2aj+WKeIUiKhcc3cCeR9e30BPtupt2ubTQznEPnDhumBTFJQkHX6EivsRPEF3UYws0C9DWZYzhOzzwKD9uXqCDv5lSRyRLDNZUzyFwxE3nHLwnkKj2FwNetsTO085f7+vJmkuXs9ShmXg3pwXLHBW/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775112738; c=relaxed/simple;
	bh=xRrX7+ChFARFJjvSnOyf/XVz+ekF01zG2RHavVcSjLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=STBAgprHhpE/+bh6LlLErVaWZTU+U4JjyepAteOaKxGth5vdRRUWPoo7QKZ3Xlld8ZSBz2Nxs+S94NJ91BXTg9XN+ALt8Fprdh0jRTQZLHAqkQtC+ZnKtMs4MDv82MulMKVw5zzGpMoaZX7ZEX3IH5PiHRjiHNuNd3jx06A7wcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRPEIKaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjVZ+DJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRPEIKaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjVZ+DJt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M43B53955887
	for <rust-for-linux@vger.kernel.org>; Thu, 2 Apr 2026 06:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jTYcWIhFz0PjRYqf7rrSJdqYU6hbKED5h78gJAgGLmg=; b=BRPEIKaRTCfFaUaC
	OSajXchS1lk7vuYD7ZNHbkhCC5Qt+2bGMYDL3udopUGNXJOsTN2t8df8g3pFgLkP
	JVTIiqugaIiY74yOjlav/LH2su0hNn8v8PQto29aifYvS/OJUkPA/4orQvTwYpGR
	AXlr06HPcX2udTCTYJVw5pL/rgUAvpfG9kXCC+h9u3dUJy0/w6P1+DasYEVWUBl+
	0R2vMc8NomO+KhtS1VZVMCzbM4OPwxV9a+0pM9HPgiIwgat84XrvcFwu3KzwRy11
	Kp1MkffG/6HnSU85nXK88KWYFusvVZ3EnEKtchZYx2jHeMhO0PxPV0Fy7PQaY/wA
	W69BYQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5hsgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 06:52:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c741f038f7cso289863a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 23:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775112735; x=1775717535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTYcWIhFz0PjRYqf7rrSJdqYU6hbKED5h78gJAgGLmg=;
        b=bjVZ+DJtwMlxz0/eyt3lVcXzmEoSaulWBsTpRCQ9JBrubx0AIztQEp/wm8aKsFfLLE
         XPjF1lYmC2hZguHkyNgAQxfczTlm5LCzLq/JV1g7biNqDosx570s2g/z6z+17hPQ5jBo
         E36LW5W0+cTevtVav0Ym73IXi+13uMgvItiMd+gZTG8N5nqEPXvyakPEgztQb5cTfRMT
         EsRDlsGzNlaTOh5br1ZGywHruzgPa75a53P+zvF1K5fzFQ7jLeJfVwXOepXsv1SyhjCY
         34JQv74jCkV11F5N71Y+QU7Rc0qyFzMLY5a/sBvUdhU3YqxIDI+dpsCijTgHtsTHAsKy
         GbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775112735; x=1775717535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTYcWIhFz0PjRYqf7rrSJdqYU6hbKED5h78gJAgGLmg=;
        b=HwlLvA20M1QWUH+DpkkwUAbRIgQfbAx4yrtPCl74aBfLjy+uscwSW+mL2GVOQDiGCk
         SvVazIpTnOx/FRKQicnG3ufka3SO9XyY8TpSdkbp2rFDljx4HnZQBJOS21poK4w36nxL
         t9PFpBB4GsqZZBbca9BOogaLIFKQklSsNn2Va83/1GbbqGC6eQmRdoP+yX7rcnw1Frzv
         KsqtD0qli0PzPmmFpbfhDLz75NwKyMofCaAs2plovRmykE7EYnQ5h8h9awUP9wtgwlbJ
         nw2EPPuWILgBvNwxWVqmOaMfH4vdLDwaDw2Rdrmz63MV92AcH4HQWOMmWEorWiseCp9Q
         0tyg==
X-Forwarded-Encrypted: i=1; AJvYcCXOA18xXtwCg9qZjKthBrvzkMeNbiFqhRnIz5HQq9kk6uxx7yc0tL92Xbe6WtQkkIvv9bmHRH/jZtU9x4Zfvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGswWwVDb/fL1LUlzq8MwC9WiCxOrMyPHWh8GieBvSpocTjfHW
	bzTnyWjJ9BslWeqsvzd7wNnhaua3vn1efsZLMoNFLPuKAKRcTfqr3meqnIrtEcwx9JatFrSm17c
	OkeTUsY9c67w4sZCUGBNlwMAWNc+YB+0wOkXSzOwAvNYscxnllo/PwTIP30K5+jNbkDoCGQ==
X-Gm-Gg: ATEYQzyku7t0xUTT11rMGEOML/6kcEPIBiGqPDJAfUVy2qL/qkb1H9q/gIumicIu2qr
	GJQDHCMPgq4YafjcliRK6roi0/7c6AFwjPWv8ELP5pTsWWfN/ij8Q90K7YiJHnMjE78NIbKduC9
	34MkKuw1J9CzsRHZcDQOkImAPDOWE+gFYlgVLrw3tl7Vj8iG4YoyacHYo8VM5bRf+bs4ndrEgtS
	B9b1aDlpAY0y59GTnYlOemb7EGbJn4HZZ1rjfeHsPaWf0Q4qk8nQRec5OO8PrqOdkSQxW4yscZO
	oE+gIJi7nfRr84brUhWAsOPwjWnzwx/KQBJgtmQTdjkheVBfyw6RYgYbK5oYRP97Rodl4cW9f7N
	y71G0u06jrQ/NtF2VM/CSttPIBdqBe7qm8EiwBKJOJWhstvU7ODhFf3ihLXICffZuzz5BmwnW/x
	iQrExipfZm7RDP1dKs4w==
X-Received: by 2002:a05:6a20:e293:b0:39b:e1e5:a101 with SMTP id adf61e73a8af0-39ef76f86a9mr6904846637.43.1775112735205;
        Wed, 01 Apr 2026 23:52:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:e293:b0:39b:e1e5:a101 with SMTP id adf61e73a8af0-39ef76f86a9mr6904789637.43.1775112734604;
        Wed, 01 Apr 2026 23:52:14 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm2469676b3a.19.2026.04.01.23.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:52:13 -0700 (PDT)
Message-ID: <543e5567-2c8b-479a-8edf-a827d0637b93@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 14:52:04 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] cpufreq: Pass the policy to
 cpufreq_driver->adjust_perf()
To: K Prateek Nayak <kprateek.nayak@amd.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui <ray.huang@amd.com>,
        "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Len Brown <lenb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Miguel Ojeda <ojeda@kernel.org>
Cc: Perry Yuan <perry.yuan@amd.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        linux-rt-devel@lists.linux.dev,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, Bert Karwatzki <spasswolf@web.de>,
        zhongqiu.han@oss.qualcomm.com
References: <20260316081849.19368-1-kprateek.nayak@amd.com>
 <20260316081849.19368-3-kprateek.nayak@amd.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260316081849.19368-3-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce1220 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8
 a=50MYKZWsfa7X8wndP2cA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SnEA89ndeTtU7CIN1ZkTNnHwA0NIWtqJ
X-Proofpoint-ORIG-GUID: SnEA89ndeTtU7CIN1ZkTNnHwA0NIWtqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1OSBTYWx0ZWRfX90uBh60pc483
 FLWZiIcV5C7QZGB9O++kPZQthbo/XWQOUq+PuGnJYOQ/OMSKlvTxuaBV9OpobQqqCJ3j6UwhFNi
 bMh9Eckepmv2ccwEjXZGmPkgH4Yj3G1ZKWuLrVGYZdJAIo2Gi6o1zjbaGS3xXgseezw7dXjLJIY
 1fNqGGFNATFSNJZ7mbOxIJK2eo3JkjfQOkHBvW+DrR+3ON+6oJl57BOVbU+/X1Dt1ODngrHJLoo
 340N/wLJvSvQeGmW9EqFXHQel+Qwr747AQNimFl05n7KKRClPv9RdWquycMaHC9z8L5ZOr+cxBm
 /r199OenZ+G29km0gLGTs+SdgQQ4FFQgLLbtcSgmRxqTnnnPLXPcN+ifZRlKLTi5NVLG+godPtC
 Yq+eijPQWLiql/CfMLHBzAFyNLsIFnxV0cMi4RQ+RDk50smtKqKn9BTjh+L0bnN9ChFLrc9fdxc
 phtXRibDlG9K7OzM2pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020059

On 3/16/2026 4:18 PM, K Prateek Nayak wrote:
> cpufreq_cpu_get() can sleep on PREEMPT_RT in presence of concurrent
> writer(s), however amd-pstate depends on fetching the cpudata via the
> policy's driver data which necessitates grabbing the reference.
> 
> Since schedutil governor can call "cpufreq_driver->update_perf()"
> during sched_tick/enqueue/dequeue with rq_lock held and IRQs disabled,
> fetching the policy object using the cpufreq_cpu_get() helper in the
> scheduler fast-path leads to "BUG: scheduling while atomic" on
> PREEMPT_RT [1].
> 
> Pass the cached cpufreq policy object in sg_policy to the update_perf()
> instead of just the CPU. The CPU can be inferred using "policy->cpu".
> 
> The lifetime of cpufreq_policy object outlasts that of the governor and
> the cpufreq driver (allocated when the CPU is onlined and only reclaimed
> when the CPU is offlined / the CPU device is removed) which makes it
> safe to be referenced throughout the governor's lifetime.
> 
> Fixes: 1d215f0319c2 ("cpufreq: amd-pstate: Add fast switch function for AMD P-State")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Closes:https://lore.kernel.org/all/20250731092316.3191-1-spasswolf@web.de/ [1]
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> changelog v3..v4:
> 
> o Added the Fixes tag. (Gautham, Chris Mason's review-prompts)
> ---
>   drivers/cpufreq/amd-pstate.c     |  3 +--
>   drivers/cpufreq/cpufreq.c        |  6 +++---
>   drivers/cpufreq/intel_pstate.c   |  4 ++--
>   include/linux/cpufreq.h          |  4 ++--
>   kernel/sched/cpufreq_schedutil.c |  5 +++--
>   rust/kernel/cpufreq.rs           | 13 ++++++-------
>   6 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index 5faccb3d6b14..ad4b5f84773a 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -710,13 +710,12 @@ static unsigned int amd_pstate_fast_switch(struct cpufreq_policy *policy,
>   	return policy->cur;
>   }
>   
> -static void amd_pstate_adjust_perf(unsigned int cpu,
> +static void amd_pstate_adjust_perf(struct cpufreq_policy *policy,
>   				   unsigned long _min_perf,
>   				   unsigned long target_perf,
>   				   unsigned long capacity)
>   {
>   	u8 max_perf, min_perf, des_perf, cap_perf;
> -	struct cpufreq_policy *policy __free(put_cpufreq_policy) = cpufreq_cpu_get(cpu);
>   	struct amd_cpudata *cpudata;
>   	union perf_cached perf;


Original code before the patch:

static void amd_pstate_adjust_perf(unsigned int cpu,
				   unsigned long _min_perf,
				   unsigned long target_perf,
				   unsigned long capacity)
{
	u8 max_perf, min_perf, des_perf, cap_perf;
	struct cpufreq_policy *policy __free(put_cpufreq_policy) = 
cpufreq_cpu_get(cpu);
	struct amd_cpudata *cpudata;
	union perf_cached perf;

	if (!policy)
		return;

Nit: Post-patch, the policy NULL check should no longer be necessary.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


>   
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 2082a9e4384f..17a5b8e0ea1e 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2231,7 +2231,7 @@ EXPORT_SYMBOL_GPL(cpufreq_driver_fast_switch);
>   
>   /**
>    * cpufreq_driver_adjust_perf - Adjust CPU performance level in one go.
> - * @cpu: Target CPU.
> + * @policy: cpufreq policy object of the target CPU.
>    * @min_perf: Minimum (required) performance level (units of @capacity).
>    * @target_perf: Target (desired) performance level (units of @capacity).
>    * @capacity: Capacity of the target CPU.
> @@ -2250,12 +2250,12 @@ EXPORT_SYMBOL_GPL(cpufreq_driver_fast_switch);
>    * parallel with either ->target() or ->target_index() or ->fast_switch() for
>    * the same CPU.
>    */
> -void cpufreq_driver_adjust_perf(unsigned int cpu,
> +void cpufreq_driver_adjust_perf(struct cpufreq_policy *policy,
>   				 unsigned long min_perf,
>   				 unsigned long target_perf,
>   				 unsigned long capacity)
>   {
> -	cpufreq_driver->adjust_perf(cpu, min_perf, target_perf, capacity);
> +	cpufreq_driver->adjust_perf(policy, min_perf, target_perf, capacity);
>   }
>   
>   /**
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index 51938c5a47ca..1552b2d32a34 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -3239,12 +3239,12 @@ static unsigned int intel_cpufreq_fast_switch(struct cpufreq_policy *policy,
>   	return target_pstate * cpu->pstate.scaling;
>   }
>   
> -static void intel_cpufreq_adjust_perf(unsigned int cpunum,
> +static void intel_cpufreq_adjust_perf(struct cpufreq_policy *policy,
>   				      unsigned long min_perf,
>   				      unsigned long target_perf,
>   				      unsigned long capacity)
>   {
> -	struct cpudata *cpu = all_cpu_data[cpunum];
> +	struct cpudata *cpu = all_cpu_data[policy->cpu];
>   	u64 hwp_cap = READ_ONCE(cpu->hwp_cap_cached);
>   	int old_pstate = cpu->pstate.current_pstate;
>   	int cap_pstate, min_pstate, max_pstate, target_pstate;
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index cc894fc38971..4317c5a312bd 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -372,7 +372,7 @@ struct cpufreq_driver {
>   	 * conditions) scale invariance can be disabled, which causes the
>   	 * schedutil governor to fall back to the latter.
>   	 */
> -	void		(*adjust_perf)(unsigned int cpu,
> +	void		(*adjust_perf)(struct cpufreq_policy *policy,
>   				       unsigned long min_perf,
>   				       unsigned long target_perf,
>   				       unsigned long capacity);
> @@ -617,7 +617,7 @@ struct cpufreq_governor {
>   /* Pass a target to the cpufreq driver */
>   unsigned int cpufreq_driver_fast_switch(struct cpufreq_policy *policy,
>   					unsigned int target_freq);
> -void cpufreq_driver_adjust_perf(unsigned int cpu,
> +void cpufreq_driver_adjust_perf(struct cpufreq_policy *policy,
>   				unsigned long min_perf,
>   				unsigned long target_perf,
>   				unsigned long capacity);
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> index 153232dd8276..ae9fd211cec1 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -461,6 +461,7 @@ static void sugov_update_single_perf(struct update_util_data *hook, u64 time,
>   				     unsigned int flags)
>   {
>   	struct sugov_cpu *sg_cpu = container_of(hook, struct sugov_cpu, update_util);
> +	struct sugov_policy *sg_policy = sg_cpu->sg_policy;
>   	unsigned long prev_util = sg_cpu->util;
>   	unsigned long max_cap;
>   
> @@ -482,10 +483,10 @@ static void sugov_update_single_perf(struct update_util_data *hook, u64 time,
>   	if (sugov_hold_freq(sg_cpu) && sg_cpu->util < prev_util)
>   		sg_cpu->util = prev_util;
>   
> -	cpufreq_driver_adjust_perf(sg_cpu->cpu, sg_cpu->bw_min,
> +	cpufreq_driver_adjust_perf(sg_policy->policy, sg_cpu->bw_min,
>   				   sg_cpu->util, max_cap);
>   
> -	sg_cpu->sg_policy->last_freq_update_time = time;
> +	sg_policy->last_freq_update_time = time;
>   }
>   
>   static unsigned int sugov_next_freq_shared(struct sugov_cpu *sg_cpu, u64 time)
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index 76faa1ac8501..a83aec198336 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1256,18 +1256,17 @@ impl<T: Driver> Registration<T> {
>       /// # Safety
>       ///
>       /// - This function may only be called from the cpufreq C infrastructure.
> +    /// - The pointer arguments must be valid pointers.
>       unsafe extern "C" fn adjust_perf_callback(
> -        cpu: c_uint,
> +        ptr: *mut bindings::cpufreq_policy,
>           min_perf: c_ulong,
>           target_perf: c_ulong,
>           capacity: c_ulong,
>       ) {
> -        // SAFETY: The C API guarantees that `cpu` refers to a valid CPU number.
> -        let cpu_id = unsafe { CpuId::from_u32_unchecked(cpu) };
> -
> -        if let Ok(mut policy) = PolicyCpu::from_cpu(cpu_id) {
> -            T::adjust_perf(&mut policy, min_perf, target_perf, capacity);
> -        }
> +        // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
> +        // lifetime of `policy`.
> +        let policy = unsafe { Policy::from_raw_mut(ptr) };
> +        T::adjust_perf(policy, min_perf, target_perf, capacity);
>       }
>   
>       /// Driver's `get_intermediate` callback.


-- 
Thx and BRs,
Zhongqiu Han
