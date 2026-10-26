Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028840;
	b=IK4LLG/yDKjS9OTb7EFy1ntDArVZYxGdKHOpGYcwzduIkrTKoLkr/2Soveo9XRUS7dzM
	 zFxNOffOabahSxB0D4G9WnYJm1UN51sRplsY1Nox1WL9GXK80+c1lHWQ3gSpeAWNGmHrV
	 RSLFP+VMCablmCutcBKNxGGt42kard6RMyYNtxkZDgeyuY0shH4YFlw6IUJqBUWHUsHYC
	 yDHcDkQ0yj8hw5yEB9tl03JgKkwfD552i0mNifotuiV3Wi1Oq/7lu+V5XMUUDhL9ohUGi
	 Pl2JHgHncpjzeBw4chHrchRWfjJVal8ts7gBrzpB6Ds3PgRD1paCLaHxH4dZ71PzxQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
	b=ztzzrIhQCiQ/8MSc6hjbPSCBkPX0mQFgCglP6iQ4YSsSETrjPZnO1mG8dv91WqSS+6Dm
	 5J72fEC9gu8gCSKIaxRjtWJK63NIQON0H/zz5+ERVvLDKpbNWTSKr6TwxAh3nrmERffgc
	 i4BNapUa112Tv3BbDCnopShwNXM7sM+VfmJf0YJg42ImhIgeyztUnMcfFhL+d7+kPBeIj
	 UexKp9tSuBpFVvI6S1+OpRaCBuGGDal+cnmEAVhI08fIlqMICZpCQMWnKdBNI/tZCbIbZ
	 vw24GKsNV6IC27KuxC1/uha0Pfnn9APVIPBa3ppBzhwwqdTZvj1zj+XfweKTrSXff1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcS0ih4B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B34kLs7r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C97606A31D
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C97606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcS0ih4B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B34kLs7r
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvsFJ3268523
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=; b=Uc
	S0ih4B0SqyqXAGstgs78uTJ2W7qimh8yCjoJbY09Gm39AV24Ile16ot+enHW4FFm
	9qMmuf6FHur8O9jfG/YMtkMxEAz1IiClXAjROITmWFDsnvmI8tw6nfgct/dmtN9z
	c63Mg4VyG+G/31UCIsG0BKMBk7IEt/zLwMQ/+Wf++9Km8773Q8spidzIzLZMEjwK
	Sbh+9lT/5wawmkzk3TuAEmif2GlDCYa/P8Qdcjgh7TkJmLTCpkZEDNIxwFNJiao3
	92AAAEeutzkreIbsQHsLINmFTDvp/FJ3sBJNB/sQeJ5RgQcq7rMOpOGcAHd2kmcv
	I4q1Lf0XMMwaAaExINsA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9c98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:33:58 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-704aee0b7b2so3179406eaf.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 08:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028838; cv=none;
        d=google.com; s=arc-20260327;
        b=GfV+Id3igcGUJG8sFSw55bk1ADyjbiNv++oyQa2cx+RxTLjBS9sqY5Am9TOT0LGUV6
         rnfQbAfV9vSg+I4cRJvoLGg6OTbdbOzrhHFLWtAUrY4LzUS6Eeu9cfLUXOyVRAjpCZTp
         R5p5gkGrMr5PoINj4bBIvDeuHIigLiUZv7OmVNqTIIwdKginiM2yxZfwXc8OlP8FRhLh
         40uyWXxmW5ln35g1Ms2c7T84Fk+imJAXQSHeDHOgKCOzv6XTQ10SaLnrumrZ7Zxmqn/i
         A04z9/6N33UEdLdn0M+u+Tywbpuech1C9SYC39Q0+Uv0bPCV6jEE7xfiZ4nG/LAYx0JW
         YsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        fh=42db97vbK7bjp+S6aZbKFgK6YXSZqBbbgW133U1e5bw=;
        b=XOfoVGQvdM31YmyEdaN2J4yVCHEC/bOg59wciC8xYhFqUKEnBHkyOHQlpYIJayy2Ug
         J/cAIskU7RIxyGAPXVf7hJX1kW+H9zIYonZoSxLHHBn8j6llOetkFlAzbLftgzxifPFx
         DGcXCl8yottJvesNnmIoIMMPvPDhHhFX19IbEbxTUFBVWUzhbFhYI4YC++RxV+Q0jBtS
         Gb1TQTPPohpcBSX3kQibFNItY1zYM8hSDxV7SOWu+1iyE8O5SX1VBG1m3fbnTfZ6J3A2
         ewDu0k6pZE6OHFrjGEGlN0H8ThSBwKoEJ+2OmqDkiL7EX7CWAVPuxVtC1fqqi0FFzKxx
         4sRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028838; x=1793633638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        b=B34kLs7raeLp7H9fv/q/Xoa+KPZgzmUUHoWDCSomDngkfOpZqXoEUtmv2GwimFYhYG
         LrHVZXpHBUrUO4EfqYWKvtXH4/CJHEQJasuqG6A/Klgdj/15IAuo69RkpxmZF9a9D7Nb
         NLGOeLsAz7RrchVrteX9J4v0evSCNKvZH69eDSmu3TPfAdZAaqUI+exT0uZcEFOjTVPJ
         3kePwnNAM0r1LHvUE/u8fGkYxGB5dNXTcE0NccLCcquX9EqPcr5szxl+OXFvMBgyBnyq
         59ZkgrbQ9uL5GN+alKxs0+q6nwsndj27bMeiBQOHKdscs7DTxQXiPSC/fr/+Ip3X94Cu
         SlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028838; x=1793633638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qidAGMYPaKRzpoE4VkvBWD/KkiVta3FKeYv3IJb+rMQ=;
        b=L/kZH3C9Z+aIkJepDvHhyGxwoEMTaA//iTSMyDP91PJHsPjjLSu9AsS2k4xecZGlBe
         C2aq13J5B6DQGxFbGh1qwa0RIJr7jPjh0W0Ed0fZ2YdbQdBIEsyUZOumGKQrCYYGHOI+
         DTpiqFqWrsXMuEIOhkknZGpaL25W/qGwEEXfrKxOVzA643pE6jeyEsH3/i1mtYqwlnhS
         y/tGjZl321Vem/NULR+Vx5nwNUwzURsaTa97T/vrWk18yR8k/5BdbSAlgbhb6maRE4lv
         cb6/CPUfF/MoK0nWJGtHC8PQtL/u4p6V4UnRPFv2K2CoVkJNGpckZG7c4KZIot4C0Y8c
         EhhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwB7L1J93MwX7p3FESY5wqMMdmliMNsnn1suLzMx5EQwj1f/j1+z4pesUqeNVBso/4Rh320jESF2Ukn/cv0xQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7AOwoMBBU+CVewrHPJjxwHU9Un1G3pbIPrDVqZnfqt75/Jbe5
	kreErexFVeQFyNSotdmDKkNn9ie2CP1HjqWicYoaOlwPxNqBcaHQu+ssuND+G/jPxO8DnHMiHr9
	Pv9ZqRi1alI52dlhEUDYh9G2LdiZVLrj5y1a/1ygdzVU+QqwkHR9dBQXph2r7tRF1ac/rZiwJRN
	Ueks57N/CLL5de+sSLI385+fWeaTIf46DmvZ3aAQVNMphp
X-Gm-Gg: AYBFou1lY7LQfL44vlZPglZwzsxfQK6dYWEvtNfaCJocwIjp3Kk+vxl1Gu29OE0K7d+
	PcRJwNYS1wxKKSBjt2yVzgLYM4akZ7zPR5WYJikWMI3GWnyVbKluicWzmsJXwLb5bcu9nntczw1
	aCVhv83EQYqXsKx/l2VFxk/cwU79j2YTVDXDrN1Qlyew19SdezmU0sjTnetQ==
X-Received: by 2002:a05:6820:1387:b0:70e:78ba:11dc with SMTP id 006d021491bc7-70e78ba2a36mr1241833eaf.17.1793028837879;
        Mon, 26 Oct 2026 08:33:57 -0700 (PDT)
X-Received: by 2002:a05:6820:1387:b0:70e:78ba:11dc with SMTP id
 006d021491bc7-70e78ba2a36mr1241797eaf.17.1793028837444; Mon, 26 Oct 2026
 08:33:57 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com> <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
In-Reply-To: <a5667943-3c3a-4bcd-99f4-fe5e487cb6c5@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 08:33:44 -0700
X-Gm-Features: AclHuK_qyCyqkMau4o0U6eEvxC80Yve9tJ1hV1jdwuEzcVPxGyIcGYsybUyrLPI
Message-ID: <CACSVV016mJk+oLotAUKeXr4a9FHn=cfPcWrxdfrwRxmC4S4wqw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfXx4HRo67raela
 1WpkZhAczoEefnV2X5xth5++WgMQcd5P7JclHUwcyYY3neYA75iJXdDK60orDBhhTB2s0P4psUY
 y131SXDKZxwV2gz1I6YOmC35GO+CewaVk7IJrrG1CDv58q1Gd0HYHohZdm92hM8kyzJgxXUoYTc
 IZh/41Cvx3xYd4hcsVEw37TPiX1A8gKHLEmIh/vHLqTmLr2KvSHN2opat/OyirJDth6v87k+Kki
 SKUxcysrjZ6zdhOqI3vCteAoM6NS0pFaeYD574mrA5y9WwDLaxEMmC8fLbyA/A1ryU4Q2pTI+Gk
 K2aLT5XffLnHIrE9Na/NyTuFxrQIfGSFRtLbcHYIgaBLIdCGs3d2q9ASVQDSgyrypqispsGaa5/
 zmlQ4QMfPlv3yeefqzylM1n/27f8XXyDbFoWXFXGTsyMjbgdLPGTDJq3+yL3Au6ZGTiQ1U9GJk/
 Sy8+EotjkA8Grttvwcw==
X-Proofpoint-GUID: LUFHom7lu_SJ7SeH3cx9J6MHnhSL4-Mc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX+ew9nIKH7Up8
 6bz7aPCcgqBwH7LeEnfv8SL6FFuQzcNM5wVVbexbd+3xp1y9l+OVczLNwxwsMe7aEIGqFiG3H3X
 L+/BVN7aCEf+7uetTCFmKQ3vy9+ah1o=
X-Proofpoint-ORIG-GUID: LUFHom7lu_SJ7SeH3cx9J6MHnhSL4-Mc
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf72e6 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=9rG3V10fu7yUYHM-WnoA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260061

On Mon, Oct 26, 2026 at 8:30=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/26/26 4:26 PM, Rob Clark wrote:
> > On Mon, Oct 26, 2026 at 4:40=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Much of the VM handling code is a headache to read and maintain.
> >> There's a soup of mixed-signedness/size types which need to be compare=
d
> >> and added and getting that wrong in C is very easy.
> >>
> >> The "(range + obj_offset) > obj->size" check could wrap for a large
> >> obj_offset, which let an out-of-range map be accepted and then mapped
> >> as nothing. Oxidize it and use checked_add() to fix that.
> >>
> >> This commit is a "get the foot in the door" type change to make sure
> >> that folks building kernels for Qualcomm SoCs have their Rust setup
> >> ready. It may/should be extended to the wider mm code once the
> >> appropriate abstractions are finalized.
> >>
> >> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
> >> implementation for that currently doesn't support dynamic_debug.
> >>
> >> The DRM_BRIDGE dependency is dropped because including RUST exposed
> >> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >> (if this is rejected we may just patch the C code).
> >>
> >> Notably, this will regress some ancient configurations:
> >> -- arch/arm/Kconfig
> >>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
> >
> > Side note, I'm ok w/ drm/msm (or at least the gpu part) depending on
> > CPU_LITTLE_ENDIAN.  The combination of BE CPU and LE GPU would be a
> > mess.  I'll actively ignore bug reports, patches, etc related to BE.
> > So please, no BE!
>
> arm64 is free of it now!
>
> 134b0fbc5c24 ("arm64: Kbuild: Remove vestigial big-endian support")

And there was much rejoicing :-)

BR,
-R
