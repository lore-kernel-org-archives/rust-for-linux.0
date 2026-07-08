Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020127.outbound.protection.outlook.com [52.101.195.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CEE2F12DA;
	Wed,  8 Jul 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511792; cv=fail; b=UdY+BYcnOf/HnHxepFtnjh2LNPG8ay3WqaIXTvZpRnF/3V//Q+Stsqu4nNC08gQtd/B42x3wkXu6AOqHnE7xXPG2XzgmXd8guhqBm5Ly1q89Ui0y+4at6W0IhSmQY2PtOlZAGm3JTYjpG8DjhUiMCN+8QqiF1f/cqrZBPfjxUB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511792; c=relaxed/simple;
	bh=EtkdEFCx2alhnDe908UhHseli5eC2cSmm0QNZAKjlVQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GtIIt/DwVdi8ja13BgQEIcm8My5mUCDNVfUnCMfzIDJ84GLh3qV/WWuW6ZYMNkVHaQHtmbRKmgDtX1fDu9tklpzbOSD61053v5cRKuLvMN3LTDK3fl7wJL78wJIiJWEFcn+qke2JJxu/gA03IhO7VY9Uquxw3R6wTOsEt5OrtTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wFIsVgIv; arc=fail smtp.client-ip=52.101.195.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wFIsVgIv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgQVkB9mbFzwHWud/hrtE7SM1VRHMVjq7jSfVoYEhReqKSpmeQOQu53Q5+vAFukQ6P5aJP0FT42bRe9HjVadYC77m7/vowOQI8S6LfBwgZHonXyzxJJjmriJ0ptZDlDusxqxbX0J+oCyPVrZpqXeraZh+Csu8VyE4CW//eh4A8bgaFv3YeHzuUHkZrl+KeTAs559quNriD945c7OYxDy0pp7gUZ5p8r/XxKaz6lGL5j2F30GEf0LgV2DYizqyjeNUTcdqrvH1bLyPYlEjh6T0RoqOBckzv/cHUnq+xlg379tlawYUK1RPl90kLOhMQjTOE108704MDJ2SW2xLAXFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO/4rUH6zlkOvEeyleHqXgrxLHD3U8+FVFZpoAdKh3k=;
 b=ZumW7inScSW/zFs5O1N/eTgmboecKUc/dmD8j5YD/fiSawKee0yQLWpMNPr/dlDoWt5ncbEzMz/3wv1VVm0ZCUBJCRWfIfKDMdLQ+C5FWOBFZzJei6OBAMutS3V+xdrIZZCzG8+z/nJnYqYTKBaUTM2CA2eMN5yrnKDaNizkmfCwX5ZhDMdOWtGM5LzJ+pyerTRxiFVyj9WG4uK0xbKFI9OlcNBZ2O2oHARkY3zdkDmg+wAznsk5V0r7BceXGwqYF/QgAGsm4psbyGB11XiyA48HlBQbYOHkeQ+3u+OWo/nzqsgFwA0A2ODop1cHwpJhLBnkcon8kjQqWNBG8kP2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO/4rUH6zlkOvEeyleHqXgrxLHD3U8+FVFZpoAdKh3k=;
 b=wFIsVgIvJi8g9dPJDFKq7mVmja6HGe2Ku4HU6/o1uKNh8K4MzCRXsmorToAkMJaAk1s1e5oeDbYswuHj3nzOPqTH+3jJ8ftMNnfjCsv7Svo9QVgWGxP56dcU0gprXzpdq+0Eu/K5QE1Y09htngL8D4ByTt6EIgSQIwmySUypG4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3043.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 11:56:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 11:56:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 12:56:26 +0100
Message-Id: <DJT65VLXQ3HI.1D3T4VTAWU4XA@garyguo.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <hust-os-kernel-patches@googlegroups.com>
Subject: Re: [PATCH 2/4] docs/zh_CN: Update rust/general-information.rst
 translation
From: "Gary Guo" <gary@garyguo.net>
To: "Ben Guo" <ben.guo@openatom.club>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <cover.1783480076.git.ben.guo@openatom.club>
 <9104e9b6a59f06ec514010e61aa240c343bead2a.1783480076.git.ben.guo@openatom.club>
In-Reply-To: <9104e9b6a59f06ec514010e61aa240c343bead2a.1783480076.git.ben.guo@openatom.club>
X-ClientProxiedBy: LO6P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3043:EE_
X-MS-Office365-Filtering-Correlation-Id: 89096189-d735-4f63-f358-08dedce7f0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|23010399003|1800799024|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gnhYOAIWc+DkReyWU3daHcIikJjtzsFpNQBYP4eotRvrvPhLJVIKxuz4lzp+PRShjbZoXrBNh8z2VxzBp/4dhGQQCeYwnpxw32WrLCZKMyvz5VD9/5iyFij4WhvlOMS5XP7/s5fTj4/KIlwRe6c1RCGmZNKiDb5XTiM3nPjaqErWAjxqYaxYbK2GCwp23/Evl/DfnJo7ZB+KITJwcOMJiYPtnJpBRQbyAAVdEaJ/lw38F1QtNg4n50NOlayuzeqVMwPVt0nQ4JpnKYyk8Ixnl+VxvpCCGsFa1sQCb/T/w/0cb7O7TPnc8IQWBFsk9pMAEgTpN2TnX1SQx3aQnupAlvNg1dPyYIYKT6HRM0dpeJPIXU98YXb20cW/nrYlih3KRPXgUUiLjCVJ7vyEAfFySMxpnF9Dr+FmbKok3m+c0599iTHJwZytquk/xtG2hts/nQofifJBXHugHo+4m6ZHJemvfeNGGhpLYSGnWnD80dCOYZxiXZDuf+X0Qyc6+0EyzIhw23NKHRgZVEX2QTxOH9Jxoi9KCjnc46Irj2f3ZZvjOS5elY+MTPikHg9Eid9M3/IqAqFleZWj/nq/mjl2X1QEDmXNk7xngyILPYC1+M0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1lHS21Vc3NYVWRyVE9sNzFpU1VFSE1icm56cGlDRmM3cndlblZnc21QbVVM?=
 =?utf-8?B?am15WWV0VUpGdUpZUStXUWE4VWVoT3dYdnNLN3NObTBZWUZETk5nVWN3S3NS?=
 =?utf-8?B?RDNBZk11RUkwZ1Ztekk5MHREY25DNmZJSXNvM1dwemdUaEFlcXJEYlhBcEZJ?=
 =?utf-8?B?ZHIyeHcwazdIeGxsZzFNcjZmTVRJYzhuZzNGbVMzZWZHRUhNakxMa3lKQjUz?=
 =?utf-8?B?d21nR1YwaHhUQjBMZ1BMbS9yQmJXSmo5OU14NTVOQ2pEY3JncVUwRmc1U3I1?=
 =?utf-8?B?V2huUmVFbjN1VHJFSlA0M3RrcEZuT1gxVUI0d2dOMG0reHA3V0xmbTV3YlZi?=
 =?utf-8?B?dXAzWWRiYXgzQjd1QVh4UjF5Z0RHZ2Rid21vOUp1U2kxc3gvS0pkWnNZQmtl?=
 =?utf-8?B?d1lxb2JKMmVqRlJUNGl2MWVjbWMyZ0FPZU9GenNOTTY3SHR1Z01DM1J1NmhU?=
 =?utf-8?B?bE00U0NpRVJSelpqZldPQ3dKR0dlb2thd2ZoeTJSV0VtcEJlNjNjUXNIU2pC?=
 =?utf-8?B?VFNVdGxwWURFQjhWTUJPemxDVnBEQ3NUczBtTU05aFoyQW9xdkhGbnR3YmtJ?=
 =?utf-8?B?amsvbHJiS205V3lkbmhmU3JLb0pyd3I4d2xkcXg2SFg3eFE3MCtodXBsUENw?=
 =?utf-8?B?a3EweUt6QTY0V011dXBoR0FQVWI3c01yZjFzcHB5MzNJQUM5MndLMmpwbFFH?=
 =?utf-8?B?d2prKytWWUozVFM3aCtiejd6b1NQMVRZbmYycFJVR3hLclBPdFFPMVp1bllk?=
 =?utf-8?B?ZWVRY3dJVkNlUXB4bVNLakdESVRRcmlMWnM4NUl2OHBsZW9TZ09WYkdVaTBP?=
 =?utf-8?B?dUh6VmN1bFcySmFMWUlRTjJDY2VuVHNBV2MveUtEbElFbVFvYzNyc3p1THFi?=
 =?utf-8?B?cVIzTWJDZmY2aFlUMWZrV3NvRmdZNWJ5QmFEc2dTSmpxVjA0YmovZ0V3SWpT?=
 =?utf-8?B?aVZ3L3QzVXFRTVMvRUNXYi9qUjRWS0dOckxsMzltcHRoQmI2SXQ1YXM0N1lJ?=
 =?utf-8?B?R21yMXZ2VVoyVDc0c05LcnJKeEhwUzRoWUdZdXUwMmpnaDB0RmZtald0WGpR?=
 =?utf-8?B?dDZjOCt6QkJHZnJ0RGRrQm1Fa2V2bmVleG1PSCtIbElmOEorY1gvR3R0OE93?=
 =?utf-8?B?VHNQa2pwbEhlTHA3NW9JamJ3TWdvT3RsUDVWaFdOdlpWcFV1T2crTVVpK2RU?=
 =?utf-8?B?UW5Mckt0bUI4Zm9QWEVTVFJxM0tsYzZwZlZGUkJBMXNGSDBYU09DWkgzZHJ6?=
 =?utf-8?B?V21NRUF6SXZkN095Z0NVVlpMQ2NlQ3hhdlBZdUpsQ2l6RnlFbEtjcE1oWnlF?=
 =?utf-8?B?WXJ4K0tzV29Bd21vOHc0djFtVFpDK2I1ZDNQUHVCTXBReWpJSFZHays5MFRG?=
 =?utf-8?B?UjB0Q0c3UUc0K2ZTalpaQlo1Y0lUVnlZeDdYV0V2Wnd2TTFXcUdmaHo0cVdP?=
 =?utf-8?B?UHdFZW9RNEN0bkhXdU5kWk1HWU9XNVpiTDNZWnRXVi9NV1ZXKzQvVlByYzg5?=
 =?utf-8?B?cjQzUDJRaVhqQjF1YjdpaHMzNXdoZU45MWVSallpSnQ5R1Rvc3R3VFB5K2xN?=
 =?utf-8?B?b09IU0lpTmhDWmhkRUE4Q04yeHZHeGIzQzNScEk4R2N1QnNUMGlxck5jMExC?=
 =?utf-8?B?RUl5Z1ZWTUN2c3g4Sm9xQW1RVURzZTRxRzBMSERoWTJudmJnZDZMSTJ4SGZY?=
 =?utf-8?B?TEJwa1AzeVVhTEE0SU0xenNERTExdlM4NFByb2ZORGlJZVpWekt6MHcvRkto?=
 =?utf-8?B?RE0wSjQvWUlWVGw3bDRxbU0walk3L2ZVOUEvczVuK1FPdGo4TGNxa3NpRjN1?=
 =?utf-8?B?cElWdVR0ZmdMUjBERk82dzYrZ0hhZXRJMVJLUGFFWnZ2c1NyMzRVMUhCSjc0?=
 =?utf-8?B?M2hNL3QxZVBKNjJtSUc3RUZubytZeU0vRE45LzVyMGIyMFVVdThrVnZxd0xt?=
 =?utf-8?B?dkNuTlU5cGZJQi9US3ZmdlRUdjZGbDNKWFJ6a09zTm9QZStUbkhFcGFPTnNq?=
 =?utf-8?B?Nlg5amNGczd1eU9nSzk1UEtNTG9NQ3ZNU3FpU2c4UWhBdVV2T1A5amVTZ0k4?=
 =?utf-8?B?R3h3Qm1jRStiMk9rSlhWcDRkKzcrSzBrczV5aDBSVHBERCswOFlVWlpJZHRN?=
 =?utf-8?B?K0dRYnRLMHpPN2FnbXFnQlNtdHpRT1ZlR0lnd0lqWXZqb2k0N2E0TUZSamRM?=
 =?utf-8?B?VkJaT3NrMnplRy9zWUEva1BscERuaVpLYktUbkRvSU0rN2JIU28rQ09ob3hV?=
 =?utf-8?B?azloc05WRnc2RFVhSXRVM1Nwck9pbSt1MEV2V2JCK0QvQWJyN3FXSnM4eFdr?=
 =?utf-8?B?U244S3ppOHVpbmZpOUpQQ3k1U0prTXNEWTZPUzZvcG5rQ2pmZE5Bdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 89096189-d735-4f63-f358-08dedce7f0a6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:56:26.6881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fF27PP3BYV78729fvS4WDpqPQ8csJca7F3H4RB+Y8sWgu6KLjLX7XF9JwWC5O2URWkCPrB4O5eenDFO8eseAiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3043

On Wed Jul 8, 2026 at 6:25 AM BST, Ben Guo wrote:
> Update Documentation/rust/general-information.rst translation.
>
> Update the translation through commit 86c5d1c6740c
> ("docs: rust: general-information: use real example")
>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>
> ---
>  .../zh_CN/rust/general-information.rst        | 82 ++++++++++++++++++-
>  1 file changed, 79 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/rust/general-information.rs=
t b/Documentation/translations/zh_CN/rust/general-information.rst
> index 9b5e37e13f3..043eb87588f 100644
> --- a/Documentation/translations/zh_CN/rust/general-information.rst
> +++ b/Documentation/translations/zh_CN/rust/general-information.rst
> @@ -13,6 +13,14 @@
> =20
>  =E6=9C=AC=E6=96=87=E6=A1=A3=E5=8C=85=E5=90=AB=E4=BA=86=E5=9C=A8=E5=86=85=
=E6=A0=B8=E4=B8=AD=E4=BD=BF=E7=94=A8Rust=E6=94=AF=E6=8C=81=E6=97=B6=E9=9C=
=80=E8=A6=81=E4=BA=86=E8=A7=A3=E7=9A=84=E6=9C=89=E7=94=A8=E4=BF=A1=E6=81=AF=
=E3=80=82
> =20
> +``no_std``
> +----------
> +
> +=E5=86=85=E6=A0=B8=E4=B8=AD=E7=9A=84 Rust =E6=94=AF=E6=8C=81=E5=8F=AA=E8=
=83=BD=E9=93=BE=E6=8E=A5 `core <https://doc.rust-lang.org/core/>`_=EF=BC=8C
> +=E8=80=8C=E4=B8=8D=E8=83=BD=E9=93=BE=E6=8E=A5 `std <https://doc.rust-lan=
g.org/std/>`_=E3=80=82=E4=BE=9B=E5=86=85=E6=A0=B8=E4=BD=BF=E7=94=A8=E7=9A=
=84 crate
> +=E5=BF=85=E9=A1=BB=E4=BD=BF=E7=94=A8 ``#![no_std]`` =E5=B1=9E=E6=80=A7=
=E9=80=89=E6=8B=A9=E8=BF=99=E7=A7=8D=E8=A1=8C=E4=B8=BA=E3=80=82
> +
> +
>  .. _rust_code_documentation_zh_cn:
> =20
>  =E4=BB=A3=E7=A0=81=E6=96=87=E6=A1=A3
> @@ -20,10 +28,18 @@
> =20
>  Rust=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=81=E4=BD=BF=E7=94=A8=E5=85=B6=E5=
=86=85=E7=BD=AE=E7=9A=84=E6=96=87=E6=A1=A3=E7=94=9F=E6=88=90=E5=99=A8 ``rus=
tdoc`` =E8=BF=9B=E8=A1=8C=E8=AE=B0=E5=BD=95=E3=80=82
> =20
> -=E7=94=9F=E6=88=90=E7=9A=84HTML=E6=96=87=E6=A1=A3=E5=8C=85=E6=8B=AC=E9=
=9B=86=E6=88=90=E6=90=9C=E7=B4=A2=E3=80=81=E9=93=BE=E6=8E=A5=E9=A1=B9=EF=BC=
=88=E5=A6=82=E7=B1=BB=E5=9E=8B=E3=80=81=E5=87=BD=E6=95=B0=E3=80=81=E5=B8=B8=
=E9=87=8F=EF=BC=89=E3=80=81=E6=BA=90=E4=BB=A3=E7=A0=81=E7=AD=89=E3=80=82=E5=
=AE=83=E4=BB=AC=E5=8F=AF=E4=BB=A5=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=9C=B0=E5=9D=
=80=E9=98=85=E8=AF=BB
> -=EF=BC=88TODO=EF=BC=9A=E5=BD=93=E5=9C=A8=E4=B8=BB=E7=BA=BF=E4=B8=AD=E6=
=97=B6=E9=93=BE=E6=8E=A5=EF=BC=8C=E4=B8=8E=E5=85=B6=E4=BB=96=E6=96=87=E6=A1=
=A3=E4=B8=80=E8=B5=B7=E7=94=9F=E6=88=90=EF=BC=89=EF=BC=9A
> +=E7=94=9F=E6=88=90=E7=9A=84HTML=E6=96=87=E6=A1=A3=E5=8C=85=E6=8B=AC=E9=
=9B=86=E6=88=90=E6=90=9C=E7=B4=A2=E3=80=81=E9=93=BE=E6=8E=A5=E9=A1=B9=EF=BC=
=88=E5=A6=82=E7=B1=BB=E5=9E=8B=E3=80=81=E5=87=BD=E6=95=B0=E3=80=81=E5=B8=B8=
=E9=87=8F=EF=BC=89=E3=80=81=E6=BA=90=E4=BB=A3=E7=A0=81=E7=AD=89=E3=80=82
> +=E5=AE=83=E4=BB=AC=E5=8F=AF=E4=BB=A5=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=9C=B0=
=E5=9D=80=E9=98=85=E8=AF=BB=EF=BC=9A
> +
> +		https://rust.docs.kernel.org
> +
> +=E5=AF=B9=E4=BA=8E linux-next=EF=BC=8C=E8=AF=B7=E5=8F=82=E9=98=85=EF=BC=
=9A
> =20
> -	http://kernel.org/
> +		https://rust.docs.kernel.org/next/
> +
> +=E6=AF=8F=E4=B8=AA=E4=B8=BB=E8=A6=81=E7=89=88=E6=9C=AC=E4=B9=9F=E6=9C=89=
=E5=AF=B9=E5=BA=94=E7=9A=84=E6=A0=87=E7=AD=BE=EF=BC=8C=E4=BE=8B=E5=A6=82=EF=
=BC=9A
> +
> +		https://rust.docs.kernel.org/6.10/
> =20
>  =E8=BF=99=E4=BA=9B=E6=96=87=E6=A1=A3=E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=BE=88=
=E5=AE=B9=E6=98=93=E5=9C=B0=E5=9C=A8=E6=9C=AC=E5=9C=B0=E7=94=9F=E6=88=90=E5=
=92=8C=E9=98=85=E8=AF=BB=E3=80=82=E8=BF=99=E7=9B=B8=E5=BD=93=E5=BF=AB=EF=BC=
=88=E4=B8=8E=E7=BC=96=E8=AF=91=E4=BB=A3=E7=A0=81=E6=9C=AC=E8=BA=AB=E7=9A=84=
=E9=A1=BA=E5=BA=8F=E7=9B=B8=E5=90=8C=EF=BC=89=EF=BC=8C=E8=80=8C=E4=B8=94=E4=
=B8=8D=E9=9C=80=E8=A6=81=E7=89=B9
>  =E6=AE=8A=E7=9A=84=E5=B7=A5=E5=85=B7=E6=88=96=E7=8E=AF=E5=A2=83=E3=80=82=
=E8=BF=99=E6=9C=89=E4=B8=80=E4=B8=AA=E9=A2=9D=E5=A4=96=E7=9A=84=E5=A5=BD=E5=
=A4=84=EF=BC=8C=E9=82=A3=E5=B0=B1=E6=98=AF=E5=AE=83=E4=BB=AC=E5=B0=86=E6=A0=
=B9=E6=8D=AE=E6=89=80=E4=BD=BF=E7=94=A8=E7=9A=84=E7=89=B9=E5=AE=9A=E5=86=85=
=E6=A0=B8=E9=85=8D=E7=BD=AE=E8=BF=9B=E8=A1=8C=E5=AE=9A=E5=88=B6=E3=80=82=E8=
=A6=81=E7=94=9F=E6=88=90=E5=AE=83
> @@ -62,6 +78,58 @@ Rust=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=81=E4=BD=BF=E7=
=94=A8=E5=85=B6=E5=86=85=E7=BD=AE=E7=9A=84=E6=96=87=E6=A1=A3=E7=94=9F=E6=88=
=90=E5=99=A8 ``rustdoc`` =E8=BF=9B=E8=A1=8C=E8=AE=B0=E5=BD=95=E3=80=82
>  =E6=A8=A1=E5=9D=97=EF=BC=88=E4=BE=8B=E5=A6=82=EF=BC=8C=E9=A9=B1=E5=8A=A8=
=E7=A8=8B=E5=BA=8F=EF=BC=89=E4=B8=8D=E5=BA=94=E8=AF=A5=E7=9B=B4=E6=8E=A5=E4=
=BD=BF=E7=94=A8C=E8=AF=AD=E8=A8=80=E7=9A=84=E7=BB=91=E5=AE=9A=E3=80=82=E7=
=9B=B8=E5=8F=8D=EF=BC=8C=E5=AD=90=E7=B3=BB=E7=BB=9F=E5=BA=94=E8=AF=A5=E6=A0=
=B9=E6=8D=AE=E9=9C=80=E8=A6=81=E6=8F=90=E4=BE=9B=E5=B0=BD=E5=8F=AF=E8=83=BD=
=E5=AE=89
>  =E5=85=A8=E7=9A=84=E6=8A=BD=E8=B1=A1=E3=80=82
> =20
> +.. code-block::
> +
> +	                                                rust/bindings/
> +	                                               (rust/helpers/)
> +
> +	                                                   include/ -----+ <-+
> +	                                                                 |   |
> +	  drivers/              rust/kernel/              +----------+ <-+   |
> +	    fs/                                           | bindgen  |       |
> +	   .../            +-------------------+          +----------+ --+   |
> +	                   |    Abstractions   |                         |   |
> +	+---------+        | +------+ +------+ |          +----------+   |   |
> +	| my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-+   |
> +	| driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |       |
> +	+---------+        | |system| |system| |          | bindings | <-----+
> +	     |             | +------+ +------+ |          |  crate   |       |
> +	     |             |   kernel crate    |          +----------+       |
> +	     |             +-------------------+                             |
> +	     |                                                               |
> +	     +------------------# FORBIDDEN #--------------------------------+
> +
> +=E4=B8=BB=E8=A6=81=E6=80=9D=E6=83=B3=E6=98=AF=E5=B0=86=E6=89=80=E6=9C=89=
=E4=B8=8E=E5=86=85=E6=A0=B8 C API =E7=9A=84=E7=9B=B4=E6=8E=A5=E4=BA=A4=E4=
=BA=92=E5=B0=81=E8=A3=85=E5=88=B0=E7=BB=8F=E8=BF=87=E4=BB=94=E7=BB=86=E5=AE=
=A1=E6=9F=A5=E5=92=8C=E6=96=87=E6=A1=A3=E5=8C=96=E7=9A=84=E6=8A=BD=E8=B1=A1
> +=E4=B8=AD=E3=80=82=E8=BF=99=E6=A0=B7=EF=BC=8C=E5=8F=AA=E8=A6=81=E6=BB=A1=
=E8=B6=B3=E4=BB=A5=E4=B8=8B=E6=9D=A1=E4=BB=B6=EF=BC=8C=E8=BF=99=E4=BA=9B=E6=
=8A=BD=E8=B1=A1=E7=9A=84=E7=94=A8=E6=88=B7=E5=B0=B1=E4=B8=8D=E8=83=BD=E5=BC=
=95=E5=85=A5=E6=9C=AA=E5=AE=9A=E4=B9=89=E8=A1=8C=E4=B8=BA
> +=EF=BC=88undefined behavior=EF=BC=8CUB=EF=BC=89=EF=BC=9A
> +
> +#. =E6=8A=BD=E8=B1=A1=E6=98=AF=E6=AD=A3=E7=A1=AE=E7=9A=84=EF=BC=88"sound=
"=EF=BC=89=E3=80=82

sound should be translated to "=E5=8F=AF=E9=9D=A0".

Best,
Gary

> +#. =E4=BB=BB=E4=BD=95 ``unsafe`` =E5=9D=97=E9=83=BD=E9=81=B5=E5=AE=88=E8=
=B0=83=E7=94=A8=E5=9D=97=E5=86=85=E6=93=8D=E4=BD=9C=E6=89=80=E9=9C=80=E7=9A=
=84=E5=AE=89=E5=85=A8=E5=A5=91=E7=BA=A6=E3=80=82=E7=B1=BB=E4=BC=BC=E5=9C=B0=
=EF=BC=8C=E4=BB=BB=E4=BD=95
> +   ``unsafe impl`` =E9=83=BD=E9=81=B5=E5=AE=88=E5=AE=9E=E7=8E=B0=E8=AF=
=A5=E7=89=B9=E6=80=A7=E6=89=80=E9=9C=80=E7=9A=84=E5=AE=89=E5=85=A8=E5=A5=91=
=E7=BA=A6=E3=80=82
> +
> +=E7=BB=91=E5=AE=9A
> +~~~~
> +
> +=E9=80=9A=E8=BF=87=E4=BB=8E ``include/`` =E4=B8=AD=E5=B0=86 C =E5=A4=B4=
=E6=96=87=E4=BB=B6=E5=8C=85=E5=90=AB=E5=88=B0
> +``rust/bindings/bindings_helper.h``=EF=BC=8C ``bindgen`` =E5=B7=A5=E5=85=
=B7=E5=B0=86=E4=B8=BA=E6=89=80=E5=8C=85=E5=90=AB=E7=9A=84=E5=AD=90=E7=B3=BB=
=E7=BB=9F
> +=E8=87=AA=E5=8A=A8=E7=94=9F=E6=88=90=E7=BB=91=E5=AE=9A=E3=80=82=E6=9E=84=
=E5=BB=BA=E5=90=8E=EF=BC=8C=E8=AF=B7=E6=9F=A5=E7=9C=8B ``rust/bindings/`` =
=E7=9B=AE=E5=BD=95=E4=B8=AD=E7=9A=84
> +``*_generated.rs`` =E8=BE=93=E5=87=BA=E6=96=87=E4=BB=B6=E3=80=82
> +
> +=E5=AF=B9=E4=BA=8E ``bindgen`` =E4=B8=8D=E4=BC=9A=E8=87=AA=E5=8A=A8=E7=
=94=9F=E6=88=90=E7=9A=84 C =E5=A4=B4=E6=96=87=E4=BB=B6=E9=83=A8=E5=88=86=EF=
=BC=8C=E4=BE=8B=E5=A6=82 C ``inline`` =E5=87=BD=E6=95=B0=E6=88=96
> +=E9=9D=9E=E5=B9=B3=E5=87=A1=E5=AE=8F=EF=BC=8C=E5=8F=AF=E4=BB=A5=E5=9C=A8=
 ``rust/helpers/`` =E4=B8=AD=E6=B7=BB=E5=8A=A0=E4=B8=80=E4=B8=AA=E5=B0=8F=
=E5=9E=8B=E5=8C=85=E8=A3=85=E5=87=BD=E6=95=B0=EF=BC=8C=E4=BD=BF=E5=85=B6=E4=
=B9=9F=E5=8F=AF=E4=BE=9B
> +Rust =E7=AB=AF=E4=BD=BF=E7=94=A8=E3=80=82
> +
> +=E6=8A=BD=E8=B1=A1
> +~~~~
> +
> +=E6=8A=BD=E8=B1=A1=E6=98=AF=E7=BB=91=E5=AE=9A=E5=92=8C=E5=86=85=E6=A0=B8=
=E5=86=85=E7=94=A8=E6=88=B7=E4=B9=8B=E9=97=B4=E7=9A=84=E5=B1=82=E3=80=82=E5=
=AE=83=E4=BB=AC=E4=BD=8D=E4=BA=8E ``rust/kernel/`` =E4=B8=AD=EF=BC=8C=E5=85=
=B6=E4=BD=9C=E7=94=A8=E6=98=AF
> +=E5=B0=86=E5=AF=B9=E7=BB=91=E5=AE=9A=E7=9A=84=E4=B8=8D=E5=AE=89=E5=85=A8=
=E8=AE=BF=E9=97=AE=E5=B0=81=E8=A3=85=E5=88=B0=E5=B0=BD=E5=8F=AF=E8=83=BD=E5=
=AE=89=E5=85=A8=E5=B9=B6=E6=9A=B4=E9=9C=B2=E7=BB=99=E7=94=A8=E6=88=B7=E7=9A=
=84 API =E4=B8=AD=E3=80=82=E6=8A=BD=E8=B1=A1=E7=9A=84=E7=94=A8=E6=88=B7
> +=E5=8C=85=E6=8B=AC=E7=94=A8 Rust =E7=BC=96=E5=86=99=E7=9A=84=E9=A9=B1=E5=
=8A=A8=E7=A8=8B=E5=BA=8F=E6=88=96=E6=96=87=E4=BB=B6=E7=B3=BB=E7=BB=9F=E7=AD=
=89=E3=80=82
> +
> +=E9=99=A4=E4=BA=86=E5=AE=89=E5=85=A8=E6=96=B9=E9=9D=A2=EF=BC=8C=E8=BF=99=
=E4=BA=9B=E6=8A=BD=E8=B1=A1=E8=BF=98=E5=BA=94=E8=AF=A5=E6=98=93=E4=BA=8E=E4=
=BD=BF=E7=94=A8=EF=BC=8C=E4=B9=9F=E5=B0=B1=E6=98=AF=E8=AF=B4=EF=BC=8C=E6=8A=
=8A C =E6=8E=A5=E5=8F=A3=E8=BD=AC=E6=8D=A2=E4=B8=BA=E7=AC=A6=E5=90=88
> +Rust =E6=83=AF=E4=BE=8B=E7=9A=84=E4=BB=A3=E7=A0=81=E3=80=82=E5=9F=BA=E6=
=9C=AC=E7=A4=BA=E4=BE=8B=E5=8C=85=E6=8B=AC=E5=B0=86 C =E7=9A=84=E8=B5=84=E6=
=BA=90=E8=8E=B7=E5=8F=96=E5=92=8C=E9=87=8A=E6=94=BE=E8=BD=AC=E6=8D=A2=E4=B8=
=BA Rust =E7=9A=84=E5=88=9D=E5=A7=8B=E5=8C=96
> +=E5=92=8C=E6=B8=85=E7=90=86=E6=A8=A1=E5=BC=8F=EF=BC=8C=E6=88=96=E8=80=85=
=E5=B0=86 C =E6=95=B4=E6=95=B0=E9=94=99=E8=AF=AF=E7=A0=81=E8=BD=AC=E6=8D=A2=
=E4=B8=BA Rust =E7=9A=84 ``Result``=E3=80=82
> +
> =20
>  =E6=9C=89=E6=9D=A1=E4=BB=B6=E7=9A=84=E7=BC=96=E8=AF=91
>  ------------
> @@ -74,3 +142,11 @@ Rust=E4=BB=A3=E7=A0=81=E5=8F=AF=E4=BB=A5=E8=AE=BF=E9=
=97=AE=E5=9F=BA=E4=BA=8E=E5=86=85=E6=A0=B8=E9=85=8D=E7=BD=AE=E7=9A=84=E6=9D=
=A1=E4=BB=B6=E6=80=A7=E7=BC=96=E8=AF=91:
>  	#[cfg(CONFIG_X=3D"y")]   // Enabled as a built-in (`y`)
>  	#[cfg(CONFIG_X=3D"m")]   // Enabled as a module   (`m`)
>  	#[cfg(not(CONFIG_X))]  // Disabled
> +
> +=E5=AF=B9=E4=BA=8E Rust =E7=9A=84 ``cfg`` =E4=B8=8D=E6=94=AF=E6=8C=81=E7=
=9A=84=E5=85=B6=E4=BB=96=E6=9D=A1=E4=BB=B6=EF=BC=8C=E4=BE=8B=E5=A6=82=E5=B8=
=A6=E6=9C=89=E6=95=B0=E5=80=BC=E6=AF=94=E8=BE=83=E7=9A=84=E8=A1=A8=E8=BE=BE=
=E5=BC=8F=EF=BC=8C=E5=8F=AF=E4=BB=A5
> +=E5=AE=9A=E4=B9=89=E4=B8=80=E4=B8=AA=E6=96=B0=E7=9A=84 Kconfig =E7=AC=A6=
=E5=8F=B7=EF=BC=9A
> +
> +.. code-block:: kconfig
> +
> +	config RUSTC_HAS_SPAN_FILE
> +		def_bool RUSTC_VERSION >=3D 108800


