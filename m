Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281023;
	b=T46SjhEuR1cYsPzSycOwhlAHo+6lHao9pUNUQMExOdsdU/fZHt+S93TssIl6a8sp7mpL
	 6pAdgQwmM/wnagORK5W9k7kXX+7G3IzfZshDucr7CRMx7SuuCwyxIzNF9XHeuQ4NCq5Ee
	 Mwt2Oys6rGvfNUxtwyCrWAkZdp7NtU96zy1b29HgF1CDOzS6Lpjsz/sjLtCATQjhsrLuN
	 V8xpe4enlQ6GGkixS5vhjHEABY63TWIcGbmVuiPsWx4NnKgo6Ce9FLZP0vmqvolfBpGwc
	 BalsgizBSt5g8oSDXAcKZyj/JEIkEbjGJAv+ObL+GPgyC4ocLC3xvil9M92i40g2VAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
	b=jGYN/mqLGm21UBzrBcRx5QFw/Yo+PPo/20sIPZzrHJO0OIFkovO4up7aBUJxYgCE2+ag
	 ec/I/KipMTuetiOTBqaUN8D4s17HmA1mwCSPOUqCqKoQZQTPjeUut2rxmTab1dFS4gfiD
	 uMe/o/hS71B0uyrMUYnj+LdR4HHwVuINq4xHjvXtHSB2+9wF8Sg8JZjUEX7+q5Lnso0l3
	 fKRcoUrwrVxHpQaZ1woZ9c4OrsfWw5uJ3rf3/fG8rlFStUgJFEXvHXAqTVtn3UkJ5Rblu
	 NB8hdhP547n/BFvAleWIY75tW1YOx6y22psWkLyOnxQgl1pVFIzW3q5lMrZrZ3w0vQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKP49g+E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TInvHWKh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE62606A6CE
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE62606A6CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XKP49g+E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TInvHWKh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TDaBAn3521349
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=; b=XKP49g+E1V3HrnjM
	OLz2cPTX2f/an3poZcEYQE8Z+1+pHpYNnk/uG9BOXs7EdPPMigtPBqdxwx6UzsVo
	ftyIOU6RPOaqISQKjkiv+QtFZirtbtzmUwSjgxAhTfNO3PAOm3M6qQrK5hLpsbn2
	0jxfdGWQlqTfaElpWOImtGOPawamcNhZxiZu468zpSNisl7NSbQd+fXRRKzsV+D8
	7f7T1ZgMsCWSUf9VQJF7jswZmu98oK76ja+aPjvB9zXSzrMHmJfvH9ehvvBiMpkA
	8iUULKI20Fu6VpuSeM73jzHpIaj0ommcULuBG8Li6IfUQi1PUBQVtcKq6P2auEFX
	ua7l5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm762004p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 13:37:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c53431655so4227956d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 06:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793281021; x=1793885821; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
        b=TInvHWKhQemca17g1eepV2jDyc6mKi2+PaP1hyRkXodbfXPBFlBwcxQBkQHiDYxwTT
         2ks8NAcTFbdVSe44A6Yy4r3g9A/55ozHewUBCKHgCTQCqW72SWQeEd4hFWgaFnfuIp48
         aa4sfCTQottotg+WUdg12jf/503efesCspUaQBkPYUQQX10XO2p6XQ8f9IsuMIxVW6As
         8ozT8r9nfD+aAEC/tNAnlIJMS64kITIFLKlAQMU7z3P8KAbt5uc3oTrUEIh23nP45ZIG
         q1DtItPW+iICZLaCrAzl2pjIdFLKMz59A3AkJIFvhLBZh6MRkJOmZUoCxlrELcvekt8y
         JZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281021; x=1793885821;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jxn7SsojnXA5TK+qHLQ9eCfFXNVPdhVIuJ5lM3etGbQ=;
        b=nRyBPlHWMr0XlB34hCaEHE0N5JE30/t4AZIBuS07vcYABeNirsjlcSAPjMLvbvYiuL
         It73ch+uCbD6B2Li6kfeGGCLHQIQdVzZvX2cAp/2VLSJJz1RkgXhQttvXeMVuGBwy94L
         QLDfP7IqGMCUhidrD15QLDBqBc/b0pydi+wNwq603ru5mqtwNpYY6ea7a+3TAf3YryrE
         SfTgnCPZ2ReMo1tPZqYs9A7InPBq4xKVXqZ5+96KAu215Cpxzw8PP0UCaozEtNaQw+zq
         Cm6VC75gDBY6tZsDLddsCBhSNvvVkSFJPfWZWdKuPHQcJ0rDqiSPH0L0GF62vQoGruM9
         F+dQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+HqW+VgfJ7ojm5vF2X/qUOPt/NUJ+b4Z+uzkaB7aBjhA/bKCT4vqR6NUq4HMLTb4eS+bbd5RCKqrawFPhJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI0622B3zaMe8n1Es+mCIdMfFdpwYE5/nwpkK7v7/Wa0R2xczXR
	ngQYJGfcgVHlKPv7fn3hW6OVTNo2lL5+mF+EYov/HfcA66vfbPfEzZU9U75WP7MFBFAzcanFFaG
	r3M7Q2/zIFQOY+8RXAuMj19o46E9baKyE48TjLVzZcrzmubCrlYBsm0AHuDGTL4NjUJ24Zd+hop
	LTvg==
X-Gm-Gg: AYBFou0v4lcpSMZiYp84EplTHO6ddnQE0yBynsk11++lM3Sc9a0Irf3Ds2V6qUppDIb
	2XDNAOEOOzoyMjvDVXCcpP9etp1BJNTlj46PQQ++WP92VwpJb+NS6CjhX2bbH3go2K9DM04ksBd
	fDdAzLD23sW6g/DJEQ9Ne1oNhyHQX5mVjnrMy4kezc2qH6jsHyR5nGFNTlewPToH2MFR8RXQCi3
	uzd/PqIn13YRN75LREfqU7x0a5b3zPPPTkPjGHSgDVyd9VCVQtr6z7YmlcIPzAbqhPCh24SlwV3
	Oa1YELAxynLyMQgGw8eMJZjPHvTbWs27KrGYkErnHLmcYt+a6QCrTo43rldy9NTCJYn+pP1SFIQ
	UkPZKwOa3muKcofZI/gMz/A8mKYT0Q/gZ4T44SOOovEbxJPBJ0kOvvQDFGHnDkZRPBcL7jpM=
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr755692585a.1.1793281021179;
        Thu, 29 Oct 2026 06:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr755689185a.1.1793281020725;
        Thu, 29 Oct 2026 06:37:00 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a50c434asm416606766b.5.2026.10.29.06.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 06:36:59 -0700 (PDT)
Message-ID: <5ffe4da4-b5c2-4e24-9418-1edeec777932@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:36:56 +0100
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
To: Alice Ryhl <aliceryhl@google.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <auMWZyxtC1d_BUgN@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <auMWZyxtC1d_BUgN@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e8YSmV-QbP5NAk0ibtXXg_9kkUHuSgNQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfXyLwEtlIoVew/
 Z9Q0sts/GWa8AbNmxOECfxcvBNBoig28ERlvTwizsWe033zn1a+iaVyM3V/owODIA9T3531Oe/5
 haIZFER4csyJ9YC9VyERrWs5SNhPqyvPoYczUrWf4pR25FIG/LLNnyf+WFXGSOti01klLOnCE6Y
 xCEYWXpziTT5pSODlthK6W1zaTcF/oS0hpdTcIvmxuNsl1hb4TbRYmE3BDGy71YocZaCAOnGC1a
 tvUMumYzsmu+59Uoncs1mGoCGqRWHYV6lg+94EW6cy99hP7/iKwH9plJq1fIAqO4LWA2Ij+vsnz
 M7G3O/R6XmdziGL5SxzG8pf521p2jhdvdp20Vs//TJ97gWbYKgFW0U0VIvZmGSVRNhTKAMU+K8Z
 P8xioWdi+qQdq+4VlGNrVCmtxj+2Jh3+Lrplkzm45ZyX4Ckngnia4RRajjjLGLiqRSPVgiAIyHv
 vbchNJA195JTzbursxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MyBTYWx0ZWRfX5moMwG+8hRkD
 bQIG07O0EyZxmJ/aWQLDha4WpjIaTaf2ldwZTSNAIrppaq6zQv92Tf5B+Jj796aDVmLMFNcParu
 97O7c7fNlMLBtab5JC+JsO2AEw+6YK4=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae34bfe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Y42vabP1fUe4KHNzalkA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: e8YSmV-QbP5NAk0ibtXXg_9kkUHuSgNQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290053

On 10/29/26 10:48 AM, Alice Ryhl wrote:
> On Mon, Oct 26, 2026 at 12:40:02PM +0100, Konrad Dybcio wrote:
>> +#[no_mangle]
> 
> If you use the #[export] macro instead, then it has the same effect
> as #[no_mangle], but it verifies at build-time that the signature
> matches what's in the header file.
> 
> See for comparison:
> drivers/gpu/drm/drm_panic_helper_qr.rs

Nice, thanks!

Konrad
