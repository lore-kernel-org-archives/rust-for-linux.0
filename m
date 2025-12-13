Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614FA29B77C
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598104; cv=none; b=dLt/6j86Lku65k5lu8jS0X7exmA2stSoSVFG/hw+E0JPo9n5O9uWCSPiO0NRcDfi6WdcwNrPgPLwrK8uVaMH1ykaFNVBjUZH6uKiIVi0wmKG6JWYcV1/UjPa6tcAvM/9zMXLoR78BCh5wn/ldAlRXE8sNO4UNyC7DRLbwmZyeiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598104; c=relaxed/simple;
	bh=WImCn9FzSjj+r9v5eycunV8H6D1flDAfnmUE/i1HfsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEKEtE5gNBTOewe+zDcVm/GNd87hT7qaeg7qaZpvoFmtlwln3dJvU9MMYIkDQFuNhjCC7ldBn74TMCXh2o8cgthJcfzdIIk+2WniX4EYCy623sMG1klP2pT+fOM2378Lm2GpdGUyjGRWXqy67jI/tozqk2eBLtUfMX1mKhtbrJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKwN7cje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvdmiEmF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKwN7cje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvdmiEmF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD2BiLC2592199
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 03:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OiRjrMcPXJynpd5t04J8nEqd
	9i5Eho9ROloGYsJJ3xY=; b=ZKwN7cjeOXjqXYkqHDsQtuCTfYI2jh+OGClyIK1T
	IevCp/EFMiOq9DxmiZOP/oIofA5FY6i6zO4vwmMaQr6gfp545qZ2lqdYRWlSScZS
	PuGewRImSZWRjFckbfPHQfLOa1LsZSOi1UsEw8ea03IUwtPylk8s60irbhMxA+OL
	7MClA3JPgy+o9Te6slA0yfLKWykob61WFSfN3DwJL/LX5K75QMx52GHxuH/CwnRg
	QlLLTWNo07TVnw0eTZbzoVFhuyiSfxGc6TWeNS3Iovv7jfsLp40iXXxm50qWBwwX
	sXBr2Qb0JWvGjQabYUKDjtPKjqkEDIPemEa3AFhudPHuEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0y5603uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 03:54:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso64262461cf.2
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 19:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765598099; x=1766202899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiRjrMcPXJynpd5t04J8nEqd9i5Eho9ROloGYsJJ3xY=;
        b=KvdmiEmF6NckHsGaS7U2NOe6c9uMB3BTJEivB7eii4Wnhp0bIEz5p2ItzEFvKNTE1T
         T2/12aon0Lzaz21rWDg+ByHSIx8aabxr13eqHlZmVrX7Imfgx71EujYgoP9EyrjaPm6X
         eZyQRisLqtLkrjGuY8P+S8GQOufoft5jQOvwKp/RSJE6SS64Da34JwfDwxMGThM+lq+R
         q/A7qbPWAUSe4Xgx7HbEd2p/NWGnxQx6+euQbjQQQD2mn7TXTmZTmZYDQ/gsgR+BVYWe
         KIeFD2q1eGcPdvcnxAbOSlTsZFOJqx/lJoIs+8qseiBqAhHSLK0A6uJkrzplESRLmdz+
         6a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765598099; x=1766202899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiRjrMcPXJynpd5t04J8nEqd9i5Eho9ROloGYsJJ3xY=;
        b=vF02pbP6vhWCfR1SG8ax4xCYDCmzaANt2Z9IpgTBrk5PhXpQY1Rcl9YnVQM/0AvF5e
         yaCfDv3ZcI/wk2IyOzzRGKuGXdzW594Eg/QpIFkZEtfoFGV1bMG6ZZP5EkbqIMjDIqJ1
         zO8pHnayK10dOQ51GSQlrHDgS5gQDGKnnlO+VSG8M+bwTd5kVF88n7c5fVFnWbPPlW8u
         efbDtlsrZI5VBxMKsex/VWHz6vYzI+mMP/cAtXsx0nF8q9sbDWp51jnerJqdagSxkBTV
         C3i1H/canwO/U906qix8O0SL2RnvA9u4T6IKUT7O9Dbe5ysB3ycI6OeNioxYu0FtFrfz
         DB4w==
X-Forwarded-Encrypted: i=1; AJvYcCUxFUarixlY9COv/dzA+LP/TGL6GLtrhjIfJOM/zjegaDg//edyKa8qrcoE/C5ek0sYWg3npidz6b7Xr2FLNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMtqp2Z92lD3+bJEMeJESprtaDEtAb3AIyzML/U1KyKy8enC5R
	lQBBEUnc2q1gkm2GhEPfMlxC1nhVNNgHjbEiQf0EwT8zfkTEPobGLXk26LonTlaOeBBkLi9IhIO
	s+9qNA6tWrAfjohEin9cU1rwDdb3zdO+AD5szN8cYReJVYa4q1B6tghHNZ88BrbqOcrj5Vw==
X-Gm-Gg: AY/fxX64bKceWAlKH8auxgUfp22ZDX92s9ITj3WkSdcXYbf5bW9OdO/QtuJXnzzJpZO
	uszhjVh1WmF8RyY6nwAykRFH5JsyJsUV1l6BPJjQQ/BmlBttHiTYCgvExBo0s6kyE8Dbgi3ptBD
	eiBvqg+ubBBu9QHOUrDCBpgsJHbCArTap2QE8VVHiWNRtHzKsKk1ymUkVc+Z41ioAfY37OWPwJF
	cPSDP1jY5bE+0Sdrj1JwhghdCEFk4QWfbyrfLGQvvWa7FiofrtTAuiVG6cbtLZO+q3PDsXEZVmA
	m3pr3pLIAhbHj7dnSFrMyoVCTlkyfnVDUzjeyT/t/TB2nnpuxv1VL7OESDtLJszsqSnwm8dS6/o
	F/5ykSAPr845J2ye5cHddcE2zLV9Ljyt4+0zwyxx9udSagBOWXeIYMgn0dhsKvUGl+7hBAyQKbn
	ftNp9dJWSxF6Ce+I7odLO11X4=
X-Received: by 2002:a05:622a:5c8e:b0:4ed:bad6:9fa9 with SMTP id d75a77b69052e-4f1d0467087mr60912511cf.6.1765598099316;
        Fri, 12 Dec 2025 19:54:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8CqPeKor3JPIQUTDPbTmdRuInyQB443I+eB0ZPIvKOo0ZrgoDVqmQF0EARjC9WG/qyUX7Lg==
X-Received: by 2002:a05:622a:5c8e:b0:4ed:bad6:9fa9 with SMTP id d75a77b69052e-4f1d0467087mr60912321cf.6.1765598098846;
        Fri, 12 Dec 2025 19:54:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2fa7780sm2617488e87.67.2025.12.12.19.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 19:54:58 -0800 (PST)
Date: Sat, 13 Dec 2025 05:54:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Message-ID: <4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
X-Authority-Analysis: v=2.4 cv=f5dFxeyM c=1 sm=1 tr=0 ts=693ce394 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=jfDATOuUeH7LmkgJeJUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: UAncrkjyvwCCd6cJuCrmsGhVtpbi7jAI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyOSBTYWx0ZWRfX3+aTMNKYeM4c
 zHlhdZwxp+K/kGUHPlP68e4Ic9tX/20zLcl3DzKm2rAW6NdWSMYtE53+BuoVd8a5h8tluJGGeZA
 5worRCRy+E71glFKxYpdF33kkIP1cTeOSSA8rMdXFAT1n/BHo/HsYiXDmSiSA0Zcmubg4gRpnsB
 ftkFdJWW8gBvwR6uAJctbQeFzf5PhLhRB6DwdnKrqTYJpzxEj1/PT/gmjnXy1E4YJKwP9Gx3p1z
 VyFW+LpIRe7J+pdcxv+/r5djWSACpMGN81WGMN57zcE6odV0C6igNS7rDp6q4cRWlVcu/a5K1dO
 CbDrb1l6oruMKDp03aE1pQVwAYpjChvofRCELMduwutOIjGs7ht2s9iFXwUPTmCGfGRevfkEp1P
 Jl3PtyiKIiMmQktO/LxWAg3GninJyA==
X-Proofpoint-GUID: UAncrkjyvwCCd6cJuCrmsGhVtpbi7jAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130029

On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> bindings.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> This patch converts the QC socinfo driver to Rust, intended to be the
> first Rust driver in Android that is owned by a vendor rather than the
> platform.
> 
> This driver is currently quirk-compatible in DebugFS-exported values. If
> the maintainers do not believe that maintaining the exact formats is a
> benefit, we could simplify the code further by dropping some of the
> custom formatting functions used to match the output.
> 
> I sent an earlier draft of this privately a while back that was much
> rougher, but didn't get much feedback.
> 
> Now that we've got all the interfaces we need for this driver reasonably
> available (DebugFS was the one that took a bit here), I wanted to bring
> it up again, this time as an RFC. With the new features, the only place
> it needs `unsafe` is to define an abstraction over `qcom_get_smem`.
> 
> I have tested this on a SM8650-HDK by diffing the contents of the
> exported DebugFS and examining the files under /sys/bus/soc/devices/soc0
> 
> While I believe I have everything correctly exported via DebugFS, I have
> not checked equivalence across a large swath of devices, only the one.
> ---

> +
> +pub(crate) fn qcom_smem_get(host: i32, item: u32) -> Result<&'static [u8]> {
> +    let mut size = 0;
> +    // SAFETY: qcom_smem_get only requires that the size pointer be a writable size_t,
> +    // host and item are error checked in the qcom_smem module.
> +    let err_ptr = unsafe { kernel::bindings::qcom_smem_get(host as u32, item, &mut size) };
> +    let ptr = from_err_ptr(err_ptr)?;
> +    // SAFETY: If qcom_smem_get does not return an error, the returned pointer points to a readable
> +    // byte buffer with its size written into size. Because these buffers are derived from the
> +    // static ranges in the DT, this buffer remains accessible even if the qcom_smem module is
> +    // unloaded, so 'static is appropriate. The underlying buffer cannot mutate, so upgrading it
> +    // to a reference is allowed.

This is definitely not true. The smem data is ioremap'ped during
qcom_smem_probe() and will be unmapped if qcom_smem is unloaded.
Accessing such a pointer after unloading smem would result in the
exception. Current socinfo ignores that and keeps on accessing the data
at runtime (which also allows it to read DSP versions which are updated
at runtime), but the comment needs to be corrected.

> +    Ok(unsafe { core::slice::from_raw_parts(ptr as *const u8, size) })
> +}
> +

> +
> +pub(crate) static SOC_IDS: &[SocId] = &[
> +    id_entry!(MSM8260),
> +    id_entry!(MSM8660),

As we are performing a linear search over the array, would it be sensible
to sort it?

> +    id_entry!(APQ8060),
> +    id_entry!(MSM8960),

> +
> +pub(crate) const PMIC_MODELS: [Option<&str>; 92] = {
> +    let mut models = [None; 92];

I don't like the magic 92 appearing twice here just because the last
element of the array has number 91. Is there a sensible but idiomatic
way to express that (note in C we just use flex array without the size
and don't specify the size at all, so we don't have the duplication).

> +    models[0] = Some("Unknown PMIC model");
> +    models[1] = Some("PM8941");
> +    models[2] = Some("PM8841");
> +    models[3] = Some("PM8019");
> +    models[4] = Some("PM8226");
> +    models[5] = Some("PM8110");
> +    models[6] = Some("PMA8084");
> +    models[7] = Some("PMI8962");
> +    models[8] = Some("PMD9635");
> +    models[9] = Some("PM8994");
> +    models[10] = Some("PMI8994");
> +    models[11] = Some("PM8916");
> +    models[12] = Some("PM8004");
> +    models[13] = Some("PM8909/PM8058");
> +    models[14] = Some("PM8028");
> +    models[15] = Some("PM8901");
> +    models[16] = Some("PM8950/PM8027");
> +    models[17] = Some("PMI8950/ISL9519");
> +    models[18] = Some("PMK8001/PM8921");
> +    models[19] = Some("PMI8996/PM8018");
> +    models[20] = Some("PM8998/PM8015");
> +    models[21] = Some("PMI8998/PM8014");
> +    models[22] = Some("PM8821");
> +    models[23] = Some("PM8038");
> +    models[24] = Some("PM8005/PM8922");
> +    models[25] = Some("PM8917/PM8937");
> +    models[26] = Some("PM660L");
> +    models[27] = Some("PM660");
> +    models[30] = Some("PM8150");
> +    models[31] = Some("PM8150L");
> +    models[32] = Some("PM8150B");
> +    models[33] = Some("PMK8002");
> +    models[36] = Some("PM8009");
> +    models[37] = Some("PMI632");
> +    models[38] = Some("PM8150C");
> +    models[40] = Some("PM6150");
> +    models[41] = Some("SMB2351");
> +    models[44] = Some("PM8008");
> +    models[45] = Some("PM6125");
> +    models[46] = Some("PM7250B");
> +    models[47] = Some("PMK8350");
> +    models[48] = Some("PM8350");
> +    models[49] = Some("PM8350C");
> +    models[50] = Some("PM8350B");
> +    models[51] = Some("PMR735A");
> +    models[52] = Some("PMR735B");
> +    models[54] = Some("PM6350");
> +    models[55] = Some("PM4125");
> +    models[58] = Some("PM8450");
> +    models[65] = Some("PM8010");
> +    models[69] = Some("PM8550VS");
> +    models[70] = Some("PM8550VE");
> +    models[71] = Some("PM8550B");
> +    models[72] = Some("PMR735D");
> +    models[73] = Some("PM8550");
> +    models[74] = Some("PMK8550");
> +    models[78] = Some("PMM8650AU");
> +    models[79] = Some("PMM8650AU_PSAIL");
> +    models[80] = Some("PM7550");
> +    models[82] = Some("PMC8380");
> +    models[83] = Some("SMB2360");
> +    models[91] = Some("PMIV0108");
> +    models
> +};
> +
> diff --git a/drivers/soc/qcom/socinfo/socinfo.rs b/drivers/soc/qcom/socinfo/socinfo.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..bff1bf8fd672e3c461352075aa85ef8fdedff953
> --- /dev/null
> +++ b/drivers/soc/qcom/socinfo/socinfo.rs
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! Re-implementation of Qualcomm's Socinfo driver in Rust

I think this comment can be dropped. If it gets merged, there is no old
Socinfo driver.

> +use core::fmt;
> +use core::fmt::Formatter;
> +use kernel::debugfs::{Scope, ScopedDir};
> +use kernel::device::Core;
> +use kernel::module_platform_driver;
> +use kernel::platform::{self, Device};
> +use kernel::prelude::{fmt, pin_data, Error, PinInit, Result};
> +use kernel::soc;
> +use kernel::str::{CStr, CStrExt, CString};
> +use kernel::transmute::FromBytes;
> +use kernel::{c_str, pr_warn, try_pin_init};
> +use pin_init::pin_init_scope;
> +

> +        let versions = self.versions.unwrap_or(&[]);
> +        let versions2 = self.versions2.unwrap_or(&[]);
> +        for (version, image_name) in versions
> +            .iter()
> +            .take(32)
> +            .chain(versions2.iter())
> +            .zip(IMAGE_NAMES.iter())
> +        {
> +            version.build_debugfs(dir, image_name);
> +        }

I like this idiomatic code, we even get what original driver misses:
size checks for those memory regions.

> +    }
> +}
> +

-- 
With best wishes
Dmitry
