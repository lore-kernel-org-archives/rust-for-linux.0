Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793028395;
	b=AM2zoAD3TO8HZsEM4fKJO31E6qHI5NNgV9TS2gEkhTrBn95hdYeyB09KMR9jezZ5ZSgF
	 z29lUeJ/rouV7dxGAmMdX18koF5LLy+0wfiZLlX7EhdFTi6V1nQN0QG4TSTbF6/vnC9je
	 0UvcOxsognm+PY8ls2qmdJQ6BWpuk0NkUBMhZYtJ4z6E43Dtw3XqO+AeZCuUCITAyliDQ
	 7Tgyl54sv/cExujZzHb16uTcUs4aaMCZmRSk0cLKT21/P3EnzdDUK1L6aBDJ65Ai+4COU
	 vMStgj1Qw3Ty3oZk+2a7ZOMWwcQ0zy7m+qSZnvT1QRB8yAVslFVOpvPMsACZfQQx3Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=;
	b=2BzeF31wyy6uyE50bMUP/q4d5hnMJrphIp6SerSYdqdOoul2JOCpUBCC6nY9egPZTwcp
	 Xr/NzBWnyO/zfTJ893FqjyCc2Gs4zSLNg+C/r3k48ymnppRAKAvPrb5RSOPPmgVDHIP5j
	 ego19OFrqPAR8TT0ZhYjR4z3KiKR5wuzw0GLd6nwtLfoccXYnvmvar7xzo7bCJTy0CPra
	 d+tUvyBbogp3Krd0wVOpx1uMkAEQ3mdYXAYEFbvcV4S+PvaqvpG2QEB09QgguOgALt0X1
	 UCFRD/hYyYPeF/lLunqlrLSD3vRvp9bJ2WNxFi0Jn3/QZH6D/N5w/1u2ffvjl/6PCaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R9+wKlxq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvEsTX1n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E83606A31B
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E83606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R9+wKlxq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvEsTX1n
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvd5r3618600
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=; b=R9
	+wKlxqx3yyUK3kge6txMns4lng7slia9jyzR7MvqQ5adescsYwshaCf/NhQXUTUe
	J7SMCF7IrtTXaJMOw+/nkZLiNvErwVJAbpV9VgW4B293i8H25W9Kvt5T4pNBZ48Y
	tMvKNKVE9abMTGIB1ho9T/hLvhisuHH5BIHFlcERLu74BTJrJbnyBG/d/w94tg6+
	D1fdPSGQ2ykGGOFfe+aofq0Z7Uyk/71SPfEzv/chPqh4xj0Doa1TVD8LZhdMfpvm
	bHaR+AC1OPQ9ExDOQ5gp/tZtMk4yqCoou1FCAyEIEy9LqQtPvJC3UASMMGYdUZN7
	JZaWoei2CoaJNPx/DLNw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrkv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 15:26:34 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-70b97cf79cdso2952011eaf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 08:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793028393; cv=none;
        d=google.com; s=arc-20260327;
        b=FxEcCucKs0MJbdgEsRAf3aVwYVWrs+ZuMQHagnanYXnLVpiSe5/FDRctAf5b7BXYq7
         hRIo5LfFHaCEQDEBVsRZOU6Wb8SiGAxzTpk1Cmw4dupQ69yDurJ58Ce4xsmWRhu4LBSm
         e+2IVMve2v3i3Vwyt3SZT0QQKVMWOIIkMk3KAqRT80W/3FTILAFVbd75RhnBUH6Fe8WJ
         Hha3YMy54ksXLV9rDC2mzXwyTj6p7C7/2iRxaS5M9VP+rPc8JZtpIKy96nzdZRCLqpNU
         tFtH9mrhjN5Rj2eXHirmnyGShHbWkv8vlT60Pbt64eBnTLNwKGDbbeJgGlnhNs9UAX9m
         UAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=;
        fh=ZIjAi1TAIKPFst1JKlxYZjqHSYfb4qYAF24+LJNYfxE=;
        b=s94AzfwLHcVKYyNZ3tHh7LevxM88QtXIbqjIU6CUzRniupx4ViEjd6Ec0i4QHxyJ1R
         V2B6ALHfHY0li3jtmasvkOT+xPjg9MHAYQfeP3xT+dzEJM0LUjhqR18a2Pu4eINbUmtm
         brR8bpEgZhxQQ4DCfwp4WWp7Ch8ZHi3xWRKx50o6t4uDHESCkawMxmZTki5vlU2hkkcb
         gwvGrpM9i0zx9I8blNX3Ej8U9tTaeuMCE84Nabm0Ym6ZeI6OMgc9eJmPoOpACq/C02DA
         g1GeQWhEYtPT0Eu8nqxLkn60+XSuWtSFzPxJ+BZtSg/gR1iM9ZN9nPqgqcuLF9WEc/dV
         tFiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028393; x=1793633193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=;
        b=NvEsTX1n9TgbSMaoCM3HfL+tWiws5mG0aqcjkF9LWUoe0qgFwYIIms9XrnMWixc70T
         UFjWMJYiCIyIQsvzgfPd/7Kp0Y0Zph6Bus5ino8BgFZhCwepHACKXWdLjHMRJOkgLGJJ
         YATsjesxIA1MJ1WhZz2EndrWV4Y3214OsDE0lSlKVHzHwZ6n7v2g+IKtZ69o8/f2w9Nl
         kkeH0mde8ly/SJzwmlLe4TLHxbiim5/sjRO9ieRF1hu5kaDag7309uTd2ubJTxUsGsv3
         2+IpSQY6ToEFN+e0Yh1LmczeWzVbtmnhYkw0qefq5Y/ybgl/OaMSD0EPUrVvWHoRkwCG
         /SLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028393; x=1793633193;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSbSdfxGzCD7LDy75RT+TlWivDjhKh11W0IRGV9azFo=;
        b=gypUZStC2czG2u6g7ovkRW0vnyFErZXmOJvVFf17W/dfdNy6dQyCHPSalbvB7YTucf
         nH7yGsBEOtv4qxmeRokk2NV8G+tlyDHPcB8yO1jKqdNIEBGCarjDb0+fP3YCwpgqbRVt
         vwWMn/InAOtX7Ka5NUTC7oNzdffowr4j1IklHEAePdhZWDzNqZAZw6PmFueDdJF3XIQt
         5DX9MDo1IFhYU1ukNOyeWQN2zdxiIX45NUF/UxmIm4FyZO3N9dP35r71ryEyAFUgqXYv
         vb4j0NWaU08Mr7o1aQUkC5xFeH8qrp192PZSMyeBUl7AKYn1h3Wlqf6IQwuZfHNIh260
         6DvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo6aEUJMx2TGLaIleTZyHR1iNwQJfTLbY+LTZrkcK+z5ZC9+ux8qFp6+aYgSrCUznGGVG3Mo5b+mWMxEaKjw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ/+xj2IJCCC+fBvHtiV5pDhSiRhWvdudmiE9qR1Cm0PNStkKq
	GGjTbWx1PERA4g9zL+cpkFbCwQSDXt6EkdiqmrUN/ZLL/U7egBWT5XetAtNPlhUy+eAh6m/LMrI
	02ToFOoM6vwOGSq5SwJHjeFfFFrfIeNRI6ienKytd6XDTHh1EJr61BGOwh4cy3ZiO/9bHtrrExz
	oaJ0+oLEBWgMlydYXkscBb8DIpoUkNrSz3jAPA1i1sl6uW
X-Gm-Gg: AYBFou33Y0EX4RGOP5SNrvl0TcnJMavZQCrEoaBYbccoYznOsid7J4LKNlhiZPPCWuT
	erR2lCsKm8ZmQhwA5jFw9q/a9wXuB7BtVqV+0nYxwx98TO2dT+z+qN2Vyh1CuFBgCWALKW5P1xA
	PQO7HV6Gl76moj4rq/b+5YQdzSdvKRGJDTMHZWnodiXucb900kmDiAaSRvHQ==
X-Received: by 2002:a05:6820:f025:b0:70c:b3c9:e426 with SMTP id 006d021491bc7-70cb3c9e70emr2392450eaf.17.1793028393034;
        Mon, 26 Oct 2026 08:26:33 -0700 (PDT)
X-Received: by 2002:a05:6820:f025:b0:70c:b3c9:e426 with SMTP id
 006d021491bc7-70cb3c9e70emr2392424eaf.17.1793028392529; Mon, 26 Oct 2026
 08:26:32 -0700 (PDT)
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
In-Reply-To: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 08:26:21 -0700
X-Gm-Features: AclHuK9xjFfobxYMIbqsUtosZXmXjpwnpF60fd4rFY6glZ9mMn0xxUjVmWKugR8
Message-ID: <CACSVV03M_MzamPN5X=+bmbqOkET2QOJk8O_vQyhnjDGbSTvN2g@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
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
        rust-for-linux@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: njW1-8PJH3mDKk2ACN52kKNA_C04xSz0
X-Proofpoint-GUID: njW1-8PJH3mDKk2ACN52kKNA_C04xSz0
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf712a cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IotmcVCifouJJa9mDPAA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX1Cl/opYiGyNw
 mmFYNE7BzlVA4dLq5q9zKxHuw2oEbPu7NYHoq6Y/5XJ8YCAgMdlPU+wffMGwHq3sLmBDwH1HxFw
 7Jw/eee64uudmCSqMLKwr3DA0H8zQ8hrJ5KwUjsuqE49xCHQWdfs6YTfspkpce5q68D30jPfRxK
 obLzFARwey0WC1Y1ylen36XtcjPcuWt9FeZ7SX/En8PKyYF+ZVa3WskaUmqtD4F+D/ChwZdSdV5
 EhAPcj4NVFOyeQgTL31LqMZn+oSHgjTYIkAFPfQ3R1zqKhj1tYIOX3rU1yq83UIQ9YOaMfIjZpX
 aWI0sy8rSET7SdoFT/YatHrNDP6BkVidQs6IzHSmXpjAf7OnsVnuXzW/IHCvcheiHOxcw5ucWvG
 NChTkDYuDnvyM7rP6nttUM+RDl3I/iquxo2QNfQ+QmhcLBUVeHumwQfw+MOOzWKbZZ8Q0JwA6Hj
 tAurzs0gpaqPrZ7No6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX9AVLTp7IX0FB
 jkQZxslcpQxhqCtsvFGs9iOExx1XFB9qJ0CaTOIB6aRCIXDEHP7PHV+KV4nffwHchOtjvpulz3D
 0nX3SREuYsWIWSsNAmrmm/0iFAAh2Uc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260061

On Mon, Oct 26, 2026 at 4:40=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Much of the VM handling code is a headache to read and maintain.
> There's a soup of mixed-signedness/size types which need to be compared
> and added and getting that wrong in C is very easy.
>
> The "(range + obj_offset) > obj->size" check could wrap for a large
> obj_offset, which let an out-of-range map be accepted and then mapped
> as nothing. Oxidize it and use checked_add() to fix that.
>
> This commit is a "get the foot in the door" type change to make sure
> that folks building kernels for Qualcomm SoCs have their Rust setup
> ready. It may/should be extended to the wider mm code once the
> appropriate abstractions are finalized.
>
> Worth noting, the C UERR() macro expands to dev_dbg() and the Rust
> implementation for that currently doesn't support dynamic_debug.
>
> The DRM_BRIDGE dependency is dropped because including RUST exposed
> some spaghetti dependencies ending at DEBUGFS and it's enabled anyway.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> (if this is rejected we may just patch the C code).
>
> Notably, this will regress some ancient configurations:
> -- arch/arm/Kconfig
>     select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN

Side note, I'm ok w/ drm/msm (or at least the gpu part) depending on
CPU_LITTLE_ENDIAN.  The combination of BE CPU and LE GPU would be a
mess.  I'll actively ignore bug reports, patches, etc related to BE.
So please, no BE!

The !KASAN bit is more worrying.  But AFAIK the intersection between
things that can support VM_BIND and armv7 is the empty set.

BR,
-R

>
> Smoke-tested on Glymur
> ---
>  drivers/gpu/drm/msm/Kconfig        |   2 +-
>  drivers/gpu/drm/msm/Makefile       |   1 +
>  drivers/gpu/drm/msm/msm_gem_vma.c  |  66 +++------------
>  drivers/gpu/drm/msm/msm_vm_bind.h  |  16 ++++
>  drivers/gpu/drm/msm/msm_vm_bind.rs | 160 +++++++++++++++++++++++++++++++=
++++++
>  rust/uapi/uapi_helper.h            |   1 +
>  6 files changed, 188 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index ed1c4775d1e9..f5c4749f8e95 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -3,6 +3,7 @@
>  config DRM_MSM
>         tristate "MSM DRM"
>         depends on DRM
> +       depends on RUST
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on COMMON_CLK
>         depends on IOMMU_SUPPORT
> @@ -63,7 +64,6 @@ config DRM_MSM_VALIDATE_XML
>  config DRM_MSM_KMS
>         def_bool n
>         depends on DRM_MSM
> -       select DRM_BRIDGE
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_CLIENT_SELECTION
>         select DRM_DISPLAY_HELPER
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 1e246616f83f..826759a820a0 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -129,6 +129,7 @@ msm-y +=3D \
>         msm_ringbuffer.o \
>         msm_submitqueue.o \
>         msm_syncobj.o \
> +       msm_vm_bind.o \
>         msm_gpu_tracepoints.o \
>
>  msm-$(CONFIG_DRM_MSM_KMS) +=3D \
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index f687a629629d..3c453b034e8f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -14,6 +14,7 @@
>  #include "msm_gpu.h"
>  #include "msm_mmu.h"
>  #include "msm_syncobj.h"
> +#include "msm_vm_bind.h"
>
>  #define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, =
##__VA_ARGS__)
>
> @@ -981,23 +982,12 @@ vm_bind_job_create(struct drm_device *dev, struct d=
rm_file *file, struct drm_gpu
>         return job;
>  }
>
> -static bool invalid_alignment(uint64_t addr)
> -{
> -       /*
> -        * Technically this is about GPU alignment, not CPU alignment.  B=
ut
> -        * I've not seen any qcom SoC where the SMMU does not support the
> -        * CPU's smallest page size.
> -        */
> -       return !PAGE_ALIGNED(addr);
> -}
> -
>  static int
>  lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *=
op)
>  {
>         struct drm_device *dev =3D job->vm->drm;
>         struct msm_drm_private *priv =3D dev->dev_private;
>         int i =3D job->nr_ops++;
> -       int ret =3D 0;
>
>         job->ops[i].op =3D op->op;
>         job->ops[i].handle =3D op->handle;
> @@ -1006,48 +996,11 @@ lookup_op(struct msm_vm_bind_job *job, const struc=
t drm_msm_vm_bind_op *op)
>         job->ops[i].range =3D op->range;
>         job->ops[i].flags =3D op->flags;
>
> -       if (op->flags & ~MSM_VM_BIND_OP_FLAGS)
> -               ret =3D UERR(EINVAL, dev, "invalid flags: %x\n", op->flag=
s);
> -
> -       if (invalid_alignment(op->iova))
> -               ret =3D UERR(EINVAL, dev, "invalid address: %016llx\n", o=
p->iova);
> -
> -       if (invalid_alignment(op->obj_offset))
> -               ret =3D UERR(EINVAL, dev, "invalid bo_offset: %016llx\n",=
 op->obj_offset);
> -
> -       if (invalid_alignment(op->range))
> -               ret =3D UERR(EINVAL, dev, "invalid range: %016llx\n", op-=
>range);
> -
> -       if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
> -               ret =3D UERR(EINVAL, dev, "invalid range: %016llx, %016ll=
x\n", op->iova, op->range);
> -
> -       /*
> -        * MAP must specify a valid handle.  But the handle MBZ for
> -        * UNMAP or MAP_NULL.
> -        */
> -       if (op->op =3D=3D MSM_VM_BIND_OP_MAP) {
> -               if (!op->handle)
> -                       ret =3D UERR(EINVAL, dev, "invalid handle\n");
> -       } else if (op->handle) {
> -               ret =3D UERR(EINVAL, dev, "handle must be zero\n");
> -       }
> -
> -       switch (op->op) {
> -       case MSM_VM_BIND_OP_MAP:
> -       case MSM_VM_BIND_OP_MAP_NULL:
> -       case MSM_VM_BIND_OP_UNMAP:
> -               break;
> -       default:
> -               ret =3D UERR(EINVAL, dev, "invalid op: %u\n", op->op);
> -               break;
> -       }
> -
> -       if ((op->op =3D=3D MSM_VM_BIND_OP_MAP_NULL) &&
> -           !adreno_smmu_has_prr(priv->gpu)) {
> -               ret =3D UERR(EINVAL, dev, "PRR not supported\n");
> -       }
> -
> -       return ret;
> +       return msm_vm_bind_check_op(dev->dev, op->op, op->handle, op->obj=
_offset,
> +                                   op->iova, op->range, op->flags, PAGE_=
SIZE,
> +                                   drm_gpuvm_range_valid(job->vm, op->io=
va, op->range),
> +                                   op->op =3D=3D MSM_VM_BIND_OP_MAP_NULL=
 &&
> +                                   adreno_smmu_has_prr(priv->gpu));
>  }
>
>  /*
> @@ -1118,11 +1071,10 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *jo=
b, struct drm_msm_vm_bind *args
>                 op->obj =3D obj;
>                 cnt++;
>
> -               if ((op->range + op->obj_offset) > obj->size) {
> -                       ret =3D UERR(EINVAL, dev, "invalid range: %016llx=
 + %016llx > %016zx\n",
> -                                  op->range, op->obj_offset, obj->size);
> +               ret =3D msm_vm_bind_check_bo_range(dev->dev, op->obj_offs=
et, op->range,
> +                                                obj->size);
> +               if (ret)
>                         goto out_unlock;
> -               }
>         }
>
>         *nr_bos =3D cnt;
> diff --git a/drivers/gpu/drm/msm/msm_vm_bind.h b/drivers/gpu/drm/msm/msm_=
vm_bind.h
> new file mode 100644
> index 000000000000..e8aa6adb9181
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_vm_bind.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __MSM_VM_BIND_H__
> +#define __MSM_VM_BIND_H__
> +
> +#include <linux/types.h>
> +
> +struct device;
> +
> +int msm_vm_bind_check_op(struct device *dev, u32 op, u32 handle,
> +                        u64 obj_offset, u64 iova, u64 range, u32 flags,
> +                        u64 page_size, bool range_valid, bool prr_suppor=
ted);
> +int msm_vm_bind_check_bo_range(struct device *dev, u64 obj_offset, u64 r=
ange,
> +                              u64 obj_size);
> +
> +#endif /* __MSM_VM_BIND_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_vm_bind.rs b/drivers/gpu/drm/msm/msm=
_vm_bind.rs
> new file mode 100644
> index 000000000000..164208e0a1b4
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_vm_bind.rs
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//! VM_BIND operation validation for the MSM driver.
> +
> +use kernel::{
> +    bindings,
> +    device::Device,
> +    error::code::EINVAL,
> +    prelude::*,
> +    uapi, //
> +};
> +
> +/// Validates a single VM_BIND operation.
> +///
> +/// Returns 0 if the operation is valid. Otherwise logs the reason and r=
eturns
> +/// `-EINVAL`.
> +///
> +/// `page_size` is the granularity that `iova`, `obj_offset` and `range`=
 must be
> +/// aligned to. It is the GPU's alignment rather than the CPU's, but no =
known qcom
> +/// SMMU lacks support for the CPU's smallest page size.
> +/// `range_valid` is the result of `drm_gpuvm_range_valid()` for this op=
eration.
> +/// `prr_supported` is only consulted for `MSM_VM_BIND_OP_MAP_NULL`.
> +///
> +/// # Safety
> +///
> +/// `dev` must point to a live `struct device`.
> +#[no_mangle]
> +pub unsafe extern "C" fn msm_vm_bind_check_op(
> +    dev: *mut bindings::device,
> +    op: u32,
> +    handle: u32,
> +    obj_offset: u64,
> +    iova: u64,
> +    range: u64,
> +    flags: u32,
> +    page_size: u64,
> +    range_valid: bool,
> +    prr_supported: bool,
> +) -> c_int {
> +    // SAFETY: The caller guarantees that `dev` is a live `struct device=
`.
> +    let dev: &Device =3D unsafe { Device::from_raw(dev) };
> +
> +    match check_op(
> +        dev,
> +        op,
> +        handle,
> +        obj_offset,
> +        iova,
> +        range,
> +        flags,
> +        page_size,
> +        range_valid,
> +        prr_supported,
> +    ) {
> +        Ok(()) =3D> 0,
> +        Err(e) =3D> e.to_errno(),
> +    }
> +}
> +
> +fn check_op(
> +    dev: &Device,
> +    op: u32,
> +    handle: u32,
> +    obj_offset: u64,
> +    iova: u64,
> +    range: u64,
> +    flags: u32,
> +    page_size: u64,
> +    range_valid: bool,
> +    prr_supported: bool,
> +) -> Result {
> +    let aligned =3D |addr: u64| page_size.is_power_of_two() && (addr & (=
page_size - 1)) =3D=3D 0;
> +
> +    if flags & !uapi::MSM_VM_BIND_OP_FLAGS !=3D 0 {
> +        dev_dbg!(dev, "invalid flags: {:x}\n", flags);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(iova) {
> +        dev_dbg!(dev, "invalid address: {:016x}\n", iova);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(obj_offset) {
> +        dev_dbg!(dev, "invalid bo_offset: {:016x}\n", obj_offset);
> +        return Err(EINVAL);
> +    }
> +
> +    if !aligned(range) {
> +        dev_dbg!(dev, "invalid range: {:016x}\n", range);
> +        return Err(EINVAL);
> +    }
> +
> +    if !range_valid {
> +        dev_dbg!(dev, "invalid range: {:016x}, {:016x}\n", iova, range);
> +        return Err(EINVAL);
> +    }
> +
> +    // MAP must name a handle; UNMAP and MAP_NULL must not.
> +    match op {
> +        uapi::MSM_VM_BIND_OP_MAP =3D> {
> +            if handle =3D=3D 0 {
> +                dev_dbg!(dev, "invalid handle\n");
> +                return Err(EINVAL);
> +            }
> +        }
> +        uapi::MSM_VM_BIND_OP_UNMAP | uapi::MSM_VM_BIND_OP_MAP_NULL =3D> =
{
> +            if handle !=3D 0 {
> +                dev_dbg!(dev, "handle must be zero\n");
> +                return Err(EINVAL);
> +            }
> +        }
> +        _ =3D> {
> +            dev_dbg!(dev, "invalid op: {}\n", op);
> +            return Err(EINVAL);
> +        }
> +    }
> +
> +    if op =3D=3D uapi::MSM_VM_BIND_OP_MAP_NULL && !prr_supported {
> +        dev_dbg!(dev, "PRR not supported\n");
> +        return Err(EINVAL);
> +    }
> +
> +    Ok(())
> +}
> +
> +/// Checks that `[obj_offset, obj_offset + range)` lies within an object=
 of
> +/// `obj_size` bytes.
> +///
> +/// Returns 0 if it does. Otherwise logs the reason and returns `-EINVAL=
`.
> +///
> +/// # Safety
> +///
> +/// `dev` must point to a live `struct device`.
> +#[no_mangle]
> +pub unsafe extern "C" fn msm_vm_bind_check_bo_range(
> +    dev: *mut bindings::device,
> +    obj_offset: u64,
> +    range: u64,
> +    obj_size: u64,
> +) -> c_int {
> +    // SAFETY: The caller guarantees that `dev` is a live `struct device=
`.
> +    let dev: &Device =3D unsafe { Device::from_raw(dev) };
> +
> +    let fits =3D obj_offset
> +        .checked_add(range)
> +        .is_some_and(|end| end <=3D obj_size);
> +
> +    if fits {
> +        return 0;
> +    }
> +
> +    dev_dbg!(
> +        dev,
> +        "invalid range: {:016x} + {:016x} > {:016x}\n",
> +        range,
> +        obj_offset,
> +        obj_size
> +    );
> +    EINVAL.to_errno()
> +}
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 489748ef642c..38741220270a 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -7,6 +7,7 @@
>   */
>
>  #include <uapi/drm/drm.h>
> +#include <uapi/drm/msm_drm.h>
>  #include <uapi/drm/nova_drm.h>
>  #include <uapi/drm/panthor_drm.h>
>  #include <uapi/linux/android/binder.h>
>
> ---
> base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
> change-id: 20261026-topic-vm_bind_rs-5551b8014396
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
