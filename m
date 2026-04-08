Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022110.outbound.protection.outlook.com [52.101.96.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123AE2D8DD6;
	Wed,  8 Apr 2026 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775648021; cv=fail; b=kYz+BcOzWBm5klAPgdW981ffiAvhyyYDTfx3qgFVGmZEyCGGW90rD7juNnt9CZBFkihH/A9xPjfYeVicMVEYDJ1LGpAMRW4rIj+nN70D1nSxLeoHnO5T+v6WXsChYo86su5/NR/lZUUe+Gvj6e4viBv9CCd4NGnSIEfKEP9D0y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775648021; c=relaxed/simple;
	bh=TYN00KkKoxX7y6gVteZjQJAzq2NZauFv9O6T2yWUgpE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CYJAAfJ+oD3kj/JzYxhWKXJPQkbo9owRxo3xoejmcELHFfN6awulBSu31bH0/gRgAYohNXwcKeSJV3QnUIM0r8uvSc9ZKqbRkjya7YelU2rsStKPx/X/yjVoUhxmVa49s5m4H62G5Y6FgCuzBx3kDy7SZAku0NTJhm0zyxiiyq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uYqBFL2Q; arc=fail smtp.client-ip=52.101.96.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uYqBFL2Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXAymozsUhj7XzYw8+hOzsrcFB6g+P8Q/+oM54uInjTWn9OMOvY8TTOdE/A3UZBkDyQQGKx4p3ZyTLEfd88yTZFkzEfFY/HF7XXRWDA76bE0BvgWgrhSF00I4BbR1NMI8/tZ3DxCNPYVBb9xjt2HQoYA2lNkXnL+bJIAtBe1yB64u0wHkPVl95fjF4GgDEXj1rU7ANTSkYAEnerFSSJAZdiAA9v4UlXnyvY9tRTp88uBwfBaIt/g/bKUSGYWwwy9y5IvVc6YN/D/GyVHCulex2uULedQldPHhklHirZBaCvWdB6tlMdIh+nq5AqiOnREFtdhSB4Ie/FDi7UenVSsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiTFs51uKvf/6zKOH9Keq/z0j/InChOYDMFVZOqe++k=;
 b=j4Hpak6pjO2sonyNHzsiq6CKRNCi6/4dxfKYBnQmuwcQKY+rid+NAx8RagDSYM2Lco+8QemCjVapdHzLVLYhjpPs0z3QTTTePca3YTeHVwaLe3272Xw5y3JsyuKgShsUWz7mJBUcKtrhVuTK5c9U2AusoYYWB+77mWr8who93gfIsFF/tsnitFLhL7ac59iI7L1TcSmpGfOBL5TDj53nY6rZEwd87Uhw8BJUthAoT7okqkgRGGN0Ylb05RJWsBF23owLN61qXh4jZqieF+UT4JBtEBSeXtGqsa55+EMdJCoge8ZsfAiBtDB8JLGvaRTIkYETBPUqklYXMbmeXAvjbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiTFs51uKvf/6zKOH9Keq/z0j/InChOYDMFVZOqe++k=;
 b=uYqBFL2QZnAE3fblyHLkereUEvu/j/51FwL6s/itrdoGwccMXwIuGJJebii/yv7P22SCyM2m9OOn1R8uAcwqmBi+VsGtFYAjfUA6SBSbndiHzkgAgPb4eMXvKsWxU55P600pk4bC6zC4fFgNut3s26WjWXI0IpY4IIvCAZrZtwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9175.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:498::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 11:33:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 11:33:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 12:33:34 +0100
Message-Id: <DHNQOSMQJV1A.18UJB6VG0QK70@garyguo.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/4] docs/zh_CN: update rust/quick-start.rst translation
From: "Gary Guo" <gary@garyguo.net>
To: "Ben Guo" <ben.guo@openatom.club>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <cover.1775619061.git.ben.guo@openatom.club>
 <b5e1246269848fc95d118a722fb11eee88961053.1775619061.git.ben.guo@openatom.club>
In-Reply-To: <b5e1246269848fc95d118a722fb11eee88961053.1775619061.git.ben.guo@openatom.club>
X-ClientProxiedBy: LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::33) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ebcc7d-c56e-47d7-6958-08de9562ab5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5I/TljYe8vAUJv034o9egR+SauvnJpuqD42O6JHpoGEfwAZvzMPsJI5bNlSMK5mtzoKtNyv2DwRs+TNKqJAmiLe/oDzHkK/9XADPF6yhVUQR9KhBbG8Ep6nrMQ9HGVPn9wolrE1xdR0mpeYC+jhoQVx46vbWY6F/zy3V1PebUD/GBIF/oYCnaHQd1BDE3Og7wjOBRrozpNUqZ4mOSKWb+TkGAdaV///kAS8vIA+se0vMsiqx+Q8QoeGfI17O5V6C+8S+0+WPUqwlh2q9llwRQaW7yaBUBz3vqeuqEPtbTabKjloVBmtFU84uRHT38lTGlAMZsQwEPR7T8CSlRe9TRDpswHPkQGqLq4WrkYcf5Mv748GExqRWW9lLV0vSS78CBiEHqZTk0tOvso1gzDwDeKAaTyEUr1Wk+eyHnLMLtIrz6exzixQjyAo/E7ydkhhPXovNFwmyrC276bCss/PtpRdaembU2oF7ZUA+eMap3NUjwEiQ2JAWbMsuMS1OkICsAomcpSlQCwL/1MYM11jAnM9yj3VnRq3h0d49d1qEi2j2QjudOREyxqBCv1xM6pSPVleEOmZgKMFV3+kqnZkw5/9lh2rzin0/MI1YYYgt6lyWcKYpT83rULpJqCXJ3QKstYvTopD717fES0oqY8E8AVeRuwUu0fkPvHlDs67TbcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlJEZytheklPUEV2amsrc0V1OW9zVmJsbjhXV29WZVRLV3BQcXNJZHlCN294?=
 =?utf-8?B?Y2k1bTVPMmpiVUhWbm95eDZJbzBOcnU4alljaVFQUCtXcFJCUG5Ta0g5ZVlE?=
 =?utf-8?B?MlR2YXkwTjJ0RzNBOGs3RjNkM1orQzdJSEpVSnNOUDFqWVZINWUwOWJxSXAr?=
 =?utf-8?B?ODdzZGdKb3FObU5LZ2JaS1g0UDRielUwR1g3UXRZMDl1Nmhrd01IclZHckNO?=
 =?utf-8?B?UWVodHYyL0xUZFc5aC9YNmxmbHNqS1JFTEZBc3hwdlpUT1RZeVBOWDNBemRR?=
 =?utf-8?B?V2dCMTNsN052WTFCbmlJR1VRRGdNQmRhd1V1YVpIbXozYm5lRnVlV21BTGpr?=
 =?utf-8?B?VUYvYTVZZ29XVko1ZmdaRWNNMWY3LytqOHp3Y1NWYkkwS3E4bW1ZcWtVTDJX?=
 =?utf-8?B?eUNDNG1sM05zbHdaalV2NUVIUlp5ei9JWUZUQXFVZjRnSkd2WkVtWWQxNTk4?=
 =?utf-8?B?U1ZRZGwwblZZMEVGN2gzL2RjNnlNREZpRVlibWhlVFlKbEZKekNVVjF3aDlN?=
 =?utf-8?B?MTR6dlJmUGhPWmpKYXlSV1kyMGZiNEs3Yy92SERuMG5adXJabzJNMWxSZnVl?=
 =?utf-8?B?UmNUT2lqdVVINmdVQXUyd3BJeGN4bGFKMDJZQUhtWlR6VjNjcmcrK0ZmSEFx?=
 =?utf-8?B?czlMN1Q1SWdVVHptVld2T0lZOEF5aVdFY1BLbkxuSFRLaU9QcC9rWkV1dmkw?=
 =?utf-8?B?aFB6cWFDUUNKbGpwUVdTblF3ZmR2V05EVjR1MldXZzlkYURYa0YyVFVSLy9G?=
 =?utf-8?B?N0c1bWdPTDExczNtNTdid3cwbkhqVFlrSEZEL3psZ2lsT3Q0T1M2SExBakFY?=
 =?utf-8?B?dVZkWXNJNEhGUzRmbjQzMzZCdThWNU11Q1REb2hTZVpEZGVqODhqQ1Bhcmx0?=
 =?utf-8?B?c29YWFF1Wm1Pb1hGTmN2dzZwS2VpTllMdlIxcXpwSzRSbktET2s2dWJrQWtC?=
 =?utf-8?B?aHBwYi9BY0ZzRExISWdVMW95UGl5MFRiNDlKNmlMRXJEWmtzRGQyQmxuTjBn?=
 =?utf-8?B?OWZIcWh0Qk1GQTRSSVUzS2JEZi8vOUFhcGZhUDBOVzZJcWM3SERjY3NTTzBv?=
 =?utf-8?B?dUUrV1REQ3VoeUhFbDNKdzZEWFJaWXo5Y2dCVzh2NXRmeG5XeDE2cFQzVEpo?=
 =?utf-8?B?TlFiMnlXS3FvMkphczl6cjRUbktSYUl0Z2ExcHYwTUY1MHJiSHUxZjZwUzVO?=
 =?utf-8?B?S2Jpa25sSVZpbkZvaktPZlpTRXc1Z0pXTVkzMzBZbXNSa3c5OVpkRFA2VVY0?=
 =?utf-8?B?MDIxZlJmbDZxNjRvR29qMkFOZ1Jnd3kwRUdXOURBMUlqZzM3Z3VZZ2liZkN4?=
 =?utf-8?B?cUN3bUkxTzNZSjI2SjBZOFc5TExpenNUK05qSGlNK1J3M1dTaHRURnZ1M0o0?=
 =?utf-8?B?ZHNMYkNRdkFZcEFJalBCNENabXIrRGk0ejFNTUQ1UHpINEdJRzNOSzk0VEp2?=
 =?utf-8?B?Y09pbkJBYnMwMm1za2dmZW1EV0xnNWJhdU5zUWhBR0ZVM1hYY2c5bXZ4OFhu?=
 =?utf-8?B?d3Y3QUoyOG1WKytjOXVLMnBPUVBQMDFIRU8xemFXa3B1dWxkdUhXc0EvNU44?=
 =?utf-8?B?UVluYzRZNy9aZWhXcm1zRFpPb0d1U1JhSTkvM2RkdHNRcFg1M3pOMzlWZFVB?=
 =?utf-8?B?amdWaEZJTmFXTHEvOVJmak9WcVhOWklTcjBGMEtQQ1pIK0xlaCs1VnVSQlhu?=
 =?utf-8?B?cDQ4blpTc1lvL29JNUtLWWxzbkluSEVhMUFCWmNod0l2MUE4VzMzSDR2dVJO?=
 =?utf-8?B?eTkwdlhLSzBvVGxNcm5hbU5tejVXTnRVb1A0azdFWFZKWXQ0YU1XWDdYZHJ4?=
 =?utf-8?B?ZC9sdUVSa3lScGJhU2UxUVZsejh5eXRPNHFXOEV2ek50U21tL1NaMFQ0Tkxs?=
 =?utf-8?B?YWF4YkE3MkFDdUw3ZmdQcG9YMDQza2VEdmVNa2FDMFpKSkxhcS93d2UrZ2RM?=
 =?utf-8?B?bHBPci8va0s3NDZPckNRY1FFUXdQOXRVZjF6djZrWnFMV0szN3IyN1RUaXgy?=
 =?utf-8?B?YVJOTXIraWZXV296dUpjSTdqWTBPWExiZ1ZUeTMwMFZlbmliY1dGSVpJWEgv?=
 =?utf-8?B?SEFaRzNmcnU1SDhDQTBaSXl6MkliME1RWElEeDdjdloyU0pTZjlFaEt5UFJo?=
 =?utf-8?B?c0ZXaHVSQmJDSm41UFFvWG9CL3MvQm4xR1ZwMngrZ043bzJ6SzFlT0RrWFFD?=
 =?utf-8?B?NzRsK0pzTUp6V3NBZEFzeHVNUnRIMWVVZzNOdDh2ZlQ3N1ZHenZ4ZXNLdCt0?=
 =?utf-8?B?c2hMV0M5SGZlVG4zRkNjSVRBZEloSTNMZm5rK2EwUHZCcmt4QVJlU05yUHpQ?=
 =?utf-8?B?UkdaeEF6cTJmbjV3VTRkNUlBVTRxQ3o5Y0R0ZlJJb0NPd1NOWWFyQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ebcc7d-c56e-47d7-6958-08de9562ab5e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:33:34.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yUrH9Mlbb22UbYIfyVdISE8ySxx4B7Q6epqw/OGalwep8NhO+kIir1u3NG6CWx4+Dqw9L9k0URd1nHfIFGcew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9175

On Wed Apr 8, 2026 at 6:05 AM BST, Ben Guo wrote:
> Update the translation of .../rust/quick-start.rst into Chinese.
>
> Update the translation through commit 5935461b4584
> ("docs: rust: quick-start: add Debian 13 (Trixie)")
>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>

Hi Ben,

Thanks on updating the doc translation. There has been new changes to
quick-start.rst on rust-next, could you update the translation to base on t=
hat
please?

Thanks,
Gary

> ---
>  .../translations/zh_CN/rust/quick-start.rst   | 190 ++++++++++++++----
>  1 file changed, 148 insertions(+), 42 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Docu=
mentation/translations/zh_CN/rust/quick-start.rst
> index 8616556ae4d..5f0ece6411f 100644
> --- a/Documentation/translations/zh_CN/rust/quick-start.rst
> +++ b/Documentation/translations/zh_CN/rust/quick-start.rst
> @@ -13,16 +13,138 @@
> =20
>  =E6=9C=AC=E6=96=87=E4=BB=8B=E7=BB=8D=E4=BA=86=E5=A6=82=E4=BD=95=E5=BC=80=
=E5=A7=8B=E4=BD=BF=E7=94=A8Rust=E8=BF=9B=E8=A1=8C=E5=86=85=E6=A0=B8=E5=BC=
=80=E5=8F=91=E3=80=82
> =20
> +=E5=AE=89=E8=A3=85=E5=86=85=E6=A0=B8=E5=BC=80=E5=8F=91=E6=89=80=E9=9C=80=
=E7=9A=84 Rust =E5=B7=A5=E5=85=B7=E9=93=BE=E6=9C=89=E5=87=A0=E7=A7=8D=E6=96=
=B9=E5=BC=8F=E3=80=82=E4=B8=80=E7=A7=8D=E7=AE=80=E5=8D=95=E7=9A=84=E6=96=B9=
=E5=BC=8F=E6=98=AF=E4=BD=BF=E7=94=A8 Linux =E5=8F=91=E8=A1=8C=E7=89=88=E7=
=9A=84=E8=BD=AF=E4=BB=B6=E5=8C=85
> +=EF=BC=88=E5=A6=82=E6=9E=9C=E5=AE=83=E4=BB=AC=E5=90=88=E9=80=82=E7=9A=84=
=E8=AF=9D=EF=BC=89=E2=80=94=E2=80=94=E4=B8=8B=E9=9D=A2=E7=9A=84=E7=AC=AC=E4=
=B8=80=E8=8A=82=E8=A7=A3=E9=87=8A=E4=BA=86=E8=BF=99=E7=A7=8D=E6=96=B9=E6=B3=
=95=E3=80=82=E8=BF=99=E7=A7=8D=E6=96=B9=E6=B3=95=E7=9A=84=E4=B8=80=E4=B8=AA=
=E4=BC=98=E5=8A=BF=E6=98=AF=EF=BC=8C=E9=80=9A=E5=B8=B8=E5=8F=91=E8=A1=8C=E7=
=89=88=E4=BC=9A
> +=E5=8C=B9=E9=85=8D Rust =E5=92=8C Clang =E6=89=80=E4=BD=BF=E7=94=A8=E7=
=9A=84 LLVM=E3=80=82
> +
> +=E5=8F=A6=E4=B8=80=E7=A7=8D=E6=96=B9=E5=BC=8F=E6=98=AF=E4=BD=BF=E7=94=A8=
 `kernel.org <https://kernel.org/pub/tools/llvm/rust/>`_ =E4=B8=8A=E6=8F=90
> +=E4=BE=9B=E7=9A=84=E9=A2=84=E6=9E=84=E5=BB=BA=E7=A8=B3=E5=AE=9A=E7=89=88=
=E6=9C=AC=E7=9A=84 LLVM+Rust=E3=80=82=E8=BF=99=E4=BA=9B=E4=B8=8E :ref:`=E8=
=8E=B7=E5=8F=96 LLVM <zh_cn_getting_llvm>` =E4=B8=AD=E7=9A=84=E7=B2=BE
> +=E7=AE=80=E5=BF=AB=E9=80=9F LLVM =E5=B7=A5=E5=85=B7=E9=93=BE=E7=9B=B8=E5=
=90=8C=EF=BC=8C=E5=B9=B6=E6=B7=BB=E5=8A=A0=E4=BA=86 Rust for Linux =E6=94=
=AF=E6=8C=81=E7=9A=84 Rust =E7=89=88=E6=9C=AC=E3=80=82=E6=8F=90=E4=BE=9B=E4=
=BA=86=E4=B8=A4=E5=A5=97=E5=B7=A5=E5=85=B7
> +=E9=93=BE=EF=BC=9A"=E6=9C=80=E6=96=B0 LLVM" =E5=92=8C "=E5=8C=B9=E9=85=
=8D LLVM"=EF=BC=88=E8=AF=B7=E5=8F=82=E9=98=85=E9=93=BE=E6=8E=A5=E4=BA=86=E8=
=A7=A3=E6=9B=B4=E5=A4=9A=E4=BF=A1=E6=81=AF=EF=BC=89=E3=80=82
> +
> +=E6=88=96=E8=80=85=EF=BC=8C=E6=8E=A5=E4=B8=8B=E6=9D=A5=E7=9A=84=E4=B8=A4=
=E4=B8=AA "=E4=BE=9D=E8=B5=96" =E7=AB=A0=E8=8A=82=E5=B0=86=E8=A7=A3=E9=87=
=8A=E6=AF=8F=E4=B8=AA=E7=BB=84=E4=BB=B6=E4=BB=A5=E5=8F=8A=E5=A6=82=E4=BD=95=
=E9=80=9A=E8=BF=87 ``rustup``=E3=80=81Rust =E7=9A=84=E7=8B=AC=E7=AB=8B
> +=E5=AE=89=E8=A3=85=E7=A8=8B=E5=BA=8F=E6=88=96=E4=BB=8E=E6=BA=90=E7=A0=81=
=E6=9E=84=E5=BB=BA=E6=9D=A5=E5=AE=89=E8=A3=85=E5=AE=83=E4=BB=AC=E3=80=82
> +
> +=E6=9C=AC=E6=96=87=E6=A1=A3=E7=9A=84=E5=85=B6=E4=BD=99=E9=83=A8=E5=88=86=
=E8=A7=A3=E9=87=8A=E4=BA=86=E6=9C=89=E5=85=B3=E5=A6=82=E4=BD=95=E5=85=A5=E9=
=97=A8=E7=9A=84=E5=85=B6=E4=BB=96=E6=96=B9=E9=9D=A2=E3=80=82
> +
> +
> +=E5=8F=91=E8=A1=8C=E7=89=88
> +------
> +
> +Arch Linux
> +**********
> +
> +Arch Linux =E6=8F=90=E4=BE=9B=E8=BE=83=E6=96=B0=E7=9A=84 Rust =E7=89=88=
=E6=9C=AC=EF=BC=8C=E5=9B=A0=E6=AD=A4=E9=80=9A=E5=B8=B8=E5=BC=80=E7=AE=B1=E5=
=8D=B3=E7=94=A8=EF=BC=8C=E4=BE=8B=E5=A6=82::
> +
> +	pacman -S rust rust-src rust-bindgen
> +
> +
> +Debian
> +******
> +
> +Debian 13=EF=BC=88Trixie=EF=BC=89=E4=BB=A5=E5=8F=8A Testing =E5=92=8C De=
bian Unstable=EF=BC=88Sid=EF=BC=89=E6=8F=90=E4=BE=9B=E8=BE=83=E6=96=B0=E7=
=9A=84 Rust =E7=89=88
> +=E6=9C=AC=EF=BC=8C=E5=9B=A0=E6=AD=A4=E9=80=9A=E5=B8=B8=E5=BC=80=E7=AE=B1=
=E5=8D=B3=E7=94=A8=EF=BC=8C=E4=BE=8B=E5=A6=82::
> +
> +	apt install rustc rust-src bindgen rustfmt rust-clippy
> +
> +
> +Fedora Linux
> +************
> +
> +Fedora Linux =E6=8F=90=E4=BE=9B=E8=BE=83=E6=96=B0=E7=9A=84 Rust =E7=89=
=88=E6=9C=AC=EF=BC=8C=E5=9B=A0=E6=AD=A4=E9=80=9A=E5=B8=B8=E5=BC=80=E7=AE=B1=
=E5=8D=B3=E7=94=A8=EF=BC=8C=E4=BE=8B=E5=A6=82::
> +
> +	dnf install rust rust-src bindgen-cli rustfmt clippy
> +
> +
> +Gentoo Linux
> +************
> +
> +Gentoo Linux=EF=BC=88=E5=B0=A4=E5=85=B6=E6=98=AF testing =E5=88=86=E6=94=
=AF=EF=BC=89=E6=8F=90=E4=BE=9B=E8=BE=83=E6=96=B0=E7=9A=84 Rust =E7=89=88=E6=
=9C=AC=EF=BC=8C=E5=9B=A0=E6=AD=A4=E9=80=9A=E5=B8=B8=E5=BC=80=E7=AE=B1=E5=8D=
=B3=E7=94=A8=EF=BC=8C
> +=E4=BE=8B=E5=A6=82::
> +
> +	USE=3D'rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
> +
> +=E5=8F=AF=E8=83=BD=E9=9C=80=E8=A6=81=E8=AE=BE=E7=BD=AE ``LIBCLANG_PATH``=
=E3=80=82
> +
> +
> +Nix
> +***
> +
> +Nix=EF=BC=88unstable =E9=A2=91=E9=81=93=EF=BC=89=E6=8F=90=E4=BE=9B=E8=BE=
=83=E6=96=B0=E7=9A=84 Rust =E7=89=88=E6=9C=AC=EF=BC=8C=E5=9B=A0=E6=AD=A4=E9=
=80=9A=E5=B8=B8=E5=BC=80=E7=AE=B1=E5=8D=B3=E7=94=A8=EF=BC=8C=E4=BE=8B=E5=A6=
=82::
> +
> +	{ pkgs ? import <nixpkgs> {} }:
> +	pkgs.mkShell {
> +	  nativeBuildInputs =3D with pkgs; [ rustc rust-bindgen rustfmt clippy =
];
> +	  RUST_LIB_SRC =3D "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc=
}";
> +	}
> +
> +
> +openSUSE
> +********
> +
> +openSUSE Slowroll =E5=92=8C openSUSE Tumbleweed =E6=8F=90=E4=BE=9B=E8=BE=
=83=E6=96=B0=E7=9A=84 Rust =E7=89=88=E6=9C=AC=EF=BC=8C=E5=9B=A0=E6=AD=A4=E9=
=80=9A=E5=B8=B8=E5=BC=80=E7=AE=B1
> +=E5=8D=B3=E7=94=A8=EF=BC=8C=E4=BE=8B=E5=A6=82::
> +
> +	zypper install rust rust1.79-src rust-bindgen clang
> +
> +
> +Ubuntu
> +******
> +
> +25.04
> +~~~~~
> +
> +=E6=9C=80=E6=96=B0=E7=9A=84 Ubuntu =E7=89=88=E6=9C=AC=E6=8F=90=E4=BE=9B=
=E8=BE=83=E6=96=B0=E7=9A=84 Rust =E7=89=88=E6=9C=AC=EF=BC=8C=E5=9B=A0=E6=AD=
=A4=E9=80=9A=E5=B8=B8=E5=BC=80=E7=AE=B1=E5=8D=B3=E7=94=A8=EF=BC=8C=E4=BE=8B=
=E5=A6=82::
> +
> +	apt install rustc rust-src bindgen rustfmt rust-clippy
> +
> +=E6=AD=A4=E5=A4=96=EF=BC=8C=E9=9C=80=E8=A6=81=E8=AE=BE=E7=BD=AE ``RUST_L=
IB_SRC``=EF=BC=8C=E4=BE=8B=E5=A6=82::
> +
> +	RUST_LIB_SRC=3D/usr/src/rustc-$(rustc --version | cut -d' ' -f2)/librar=
y
> +
> +=E4=B8=BA=E6=96=B9=E4=BE=BF=E8=B5=B7=E8=A7=81=EF=BC=8C=E5=8F=AF=E4=BB=A5=
=E5=B0=86 ``RUST_LIB_SRC`` =E5=AF=BC=E5=87=BA=E5=88=B0=E5=85=A8=E5=B1=80=E7=
=8E=AF=E5=A2=83=E4=B8=AD=E3=80=82
> +
> +
> +24.04 LTS =E5=8F=8A=E6=9B=B4=E6=97=A9=E7=89=88=E6=9C=AC
> +~~~~~~~~~~~~~~~~~~~~
> +
> +=E8=99=BD=E7=84=B6 Ubuntu 24.04 LTS =E5=8F=8A=E6=9B=B4=E6=97=A9=E7=89=88=
=E6=9C=AC=E4=BB=8D=E7=84=B6=E6=8F=90=E4=BE=9B=E8=BE=83=E6=96=B0=E7=9A=84 Ru=
st =E7=89=88=E6=9C=AC=EF=BC=8C=E4=BD=86=E5=AE=83=E4=BB=AC=E9=9C=80=E8=A6=81=
=E4=B8=80=E4=BA=9B=E9=A2=9D=E5=A4=96=E7=9A=84=E9=85=8D
> +=E7=BD=AE=EF=BC=8C=E4=BD=BF=E7=94=A8=E5=B8=A6=E7=89=88=E6=9C=AC=E5=8F=B7=
=E7=9A=84=E8=BD=AF=E4=BB=B6=E5=8C=85=EF=BC=8C=E4=BE=8B=E5=A6=82::
> +
> +	apt install rustc-1.80 rust-1.80-src bindgen-0.65 rustfmt-1.80 \
> +		rust-1.80-clippy
> +	ln -s /usr/lib/rust-1.80/bin/rustfmt /usr/bin/rustfmt-1.80
> +	ln -s /usr/lib/rust-1.80/bin/clippy-driver /usr/bin/clippy-driver-1.80
> +
> +=E8=BF=99=E4=BA=9B=E8=BD=AF=E4=BB=B6=E5=8C=85=E9=83=BD=E4=B8=8D=E4=BC=9A=
=E5=B0=86=E5=85=B6=E5=B7=A5=E5=85=B7=E8=AE=BE=E7=BD=AE=E4=B8=BA=E9=BB=98=E8=
=AE=A4=E5=80=BC=EF=BC=9B=E5=9B=A0=E6=AD=A4=E5=BA=94=E8=AF=A5=E6=98=BE=E5=BC=
=8F=E6=8C=87=E5=AE=9A=E5=AE=83=E4=BB=AC=EF=BC=8C=E4=BE=8B=E5=A6=82::
> +
> +	make LLVM=3D1 RUSTC=3Drustc-1.80 RUSTDOC=3Drustdoc-1.80 RUSTFMT=3Drustf=
mt-1.80 \
> +		CLIPPY_DRIVER=3Dclippy-driver-1.80 BINDGEN=3Dbindgen-0.65
> +
> +=E6=88=96=E8=80=85=EF=BC=8C=E4=BF=AE=E6=94=B9 ``PATH`` =E5=8F=98=E9=87=
=8F=E5=B0=86 Rust 1.80 =E7=9A=84=E4=BA=8C=E8=BF=9B=E5=88=B6=E6=96=87=E4=BB=
=B6=E6=94=BE=E5=9C=A8=E5=89=8D=E9=9D=A2=EF=BC=8C=E5=B9=B6=E5=B0=86 ``bindge=
n`` =E8=AE=BE
> +=E7=BD=AE=E4=B8=BA=E9=BB=98=E8=AE=A4=E5=80=BC=EF=BC=8C=E4=BE=8B=E5=A6=82=
::
> +
> +	PATH=3D/usr/lib/rust-1.80/bin:$PATH
> +	update-alternatives --install /usr/bin/bindgen bindgen \
> +		/usr/bin/bindgen-0.65 100
> +	update-alternatives --set bindgen /usr/bin/bindgen-0.65
> +
> +=E4=BD=BF=E7=94=A8=E5=B8=A6=E7=89=88=E6=9C=AC=E5=8F=B7=E7=9A=84=E8=BD=AF=
=E4=BB=B6=E5=8C=85=E6=97=B6=E9=9C=80=E8=A6=81=E8=AE=BE=E7=BD=AE ``RUST_LIB_=
SRC``=EF=BC=8C=E4=BE=8B=E5=A6=82::
> +
> +	RUST_LIB_SRC=3D/usr/src/rustc-$(rustc-1.80 --version | cut -d' ' -f2)/l=
ibrary
> +
> +=E4=B8=BA=E6=96=B9=E4=BE=BF=E8=B5=B7=E8=A7=81=EF=BC=8C=E5=8F=AF=E4=BB=A5=
=E5=B0=86 ``RUST_LIB_SRC`` =E5=AF=BC=E5=87=BA=E5=88=B0=E5=85=A8=E5=B1=80=E7=
=8E=AF=E5=A2=83=E4=B8=AD=E3=80=82
> +
> +=E6=AD=A4=E5=A4=96=EF=BC=8C ``bindgen-0.65`` =E5=9C=A8=E8=BE=83=E6=96=B0=
=E7=9A=84=E7=89=88=E6=9C=AC=EF=BC=8824.04 LTS =E5=92=8C 24.10=EF=BC=89=E4=
=B8=AD=E5=8F=AF=E7=94=A8=EF=BC=8C=E4=BD=86=E5=9C=A8=E6=9B=B4=E6=97=A9=E7=9A=
=84=E7=89=88
> +=E6=9C=AC=EF=BC=8820.04 LTS =E5=92=8C 22.04 LTS=EF=BC=89=E4=B8=AD=E5=8F=
=AF=E8=83=BD=E4=B8=8D=E5=8F=AF=E7=94=A8=EF=BC=8C=E5=9B=A0=E6=AD=A4=E5=8F=AF=
=E8=83=BD=E9=9C=80=E8=A6=81=E6=89=8B=E5=8A=A8=E6=9E=84=E5=BB=BA ``bindgen``
> +=EF=BC=88=E8=AF=B7=E5=8F=82=E8=A7=81=E4=B8=8B=E6=96=87=EF=BC=89=E3=80=82
> +
> =20
>  =E6=9E=84=E5=BB=BA=E4=BE=9D=E8=B5=96
>  --------
> =20
>  =E6=9C=AC=E8=8A=82=E6=8F=8F=E8=BF=B0=E4=BA=86=E5=A6=82=E4=BD=95=E8=8E=B7=
=E5=8F=96=E6=9E=84=E5=BB=BA=E6=89=80=E9=9C=80=E7=9A=84=E5=B7=A5=E5=85=B7=E3=
=80=82
> =20
> -=E5=85=B6=E4=B8=AD=E4=B8=80=E4=BA=9B=E4=BE=9D=E8=B5=96=E4=B9=9F=E8=AE=B8=
=E5=8F=AF=E4=BB=A5=E4=BB=8ELinux=E5=8F=91=E8=A1=8C=E7=89=88=E4=B8=AD=E8=8E=
=B7=E5=BE=97=EF=BC=8C=E5=8C=85=E5=90=8D=E5=8F=AF=E8=83=BD=E6=98=AF ``rustc`=
` , ``rust-src`` ,
> -``rust-bindgen`` =E7=AD=89=E3=80=82=E7=84=B6=E8=80=8C=EF=BC=8C=E5=9C=A8=
=E5=86=99=E8=BF=99=E7=AF=87=E6=96=87=E7=AB=A0=E7=9A=84=E6=97=B6=E5=80=99=EF=
=BC=8C=E5=AE=83=E4=BB=AC=E5=BE=88=E5=8F=AF=E8=83=BD=E8=BF=98=E4=B8=8D=E5=A4=
=9F=E6=96=B0=EF=BC=8C=E9=99=A4=E9=9D=9E=E5=8F=91=E8=A1=8C=E7=89=88=E8=B7=9F=
=E8=B8=AA=E6=9C=80
> -=E6=96=B0=E7=9A=84=E7=89=88=E6=9C=AC=E3=80=82
> -
>  =E4=B8=BA=E4=BA=86=E6=96=B9=E4=BE=BF=E6=A3=80=E6=9F=A5=E6=98=AF=E5=90=A6=
=E6=BB=A1=E8=B6=B3=E8=A6=81=E6=B1=82=EF=BC=8C=E5=8F=AF=E4=BB=A5=E4=BD=BF=E7=
=94=A8=E4=BB=A5=E4=B8=8B=E7=9B=AE=E6=A0=87::
> =20
>  	make LLVM=3D1 rustavailable
> @@ -34,15 +156,14 @@
>  rustc
>  *****
> =20
> -=E9=9C=80=E8=A6=81=E4=B8=80=E4=B8=AA=E7=89=B9=E5=AE=9A=E7=89=88=E6=9C=AC=
=E7=9A=84Rust=E7=BC=96=E8=AF=91=E5=99=A8=E3=80=82=E8=BE=83=E6=96=B0=E7=9A=
=84=E7=89=88=E6=9C=AC=E5=8F=AF=E8=83=BD=E4=BC=9A=E4=B9=9F=E5=8F=AF=E8=83=BD=
=E4=B8=8D=E4=BC=9A=E5=B7=A5=E4=BD=9C=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=B0=B1=E7=
=9B=AE=E5=89=8D=E8=80=8C=E8=A8=80=EF=BC=8C=E5=86=85=E6=A0=B8=E4=BE=9D=E8=B5=
=96
> -=E4=BA=8E=E4=B8=80=E4=BA=9B=E4=B8=8D=E7=A8=B3=E5=AE=9A=E7=9A=84Rust=E7=
=89=B9=E6=80=A7=E3=80=82
> +=E9=9C=80=E8=A6=81=E4=B8=80=E4=B8=AA=E8=BE=83=E6=96=B0=E7=89=88=E6=9C=AC=
=E7=9A=84Rust=E7=BC=96=E8=AF=91=E5=99=A8=E3=80=82
> =20
>  =E5=A6=82=E6=9E=9C=E4=BD=BF=E7=94=A8=E7=9A=84=E6=98=AF ``rustup`` =EF=BC=
=8C=E8=AF=B7=E8=BF=9B=E5=85=A5=E5=86=85=E6=A0=B8=E7=BC=96=E8=AF=91=E7=9B=AE=
=E5=BD=95=EF=BC=88=E6=88=96=E8=80=85=E7=94=A8 ``--path=3D<build-dir>`` =E5=
=8F=82=E6=95=B0
> -=E6=9D=A5 ``=E8=AE=BE=E7=BD=AE`` sub-command)=E5=B9=B6=E8=BF=90=E8=A1=8C=
::
> +=E6=9D=A5 ``=E8=AE=BE=E7=BD=AE`` sub-command)=EF=BC=8C=E4=BE=8B=E5=A6=82=
=E8=BF=90=E8=A1=8C::
> =20
> -	rustup override set $(scripts/min-tool-version.sh rustc)
> +	rustup override set stable
> =20
> -+=E8=BF=99=E5=B0=86=E9=85=8D=E7=BD=AE=E4=BD=A0=E7=9A=84=E5=B7=A5=E4=BD=
=9C=E7=9B=AE=E5=BD=95=E4=BD=BF=E7=94=A8=E6=AD=A3=E7=A1=AE=E7=89=88=E6=9C=AC=
=E7=9A=84 ``rustc``=EF=BC=8C=E8=80=8C=E4=B8=8D=E5=BD=B1=E5=93=8D=E4=BD=A0=
=E7=9A=84=E9=BB=98=E8=AE=A4=E5=B7=A5=E5=85=B7=E9=93=BE=E3=80=82
> +=E8=BF=99=E5=B0=86=E9=85=8D=E7=BD=AE=E4=BD=A0=E7=9A=84=E5=B7=A5=E4=BD=9C=
=E7=9B=AE=E5=BD=95=E4=BD=BF=E7=94=A8=E7=BB=99=E5=AE=9A=E7=89=88=E6=9C=AC=E7=
=9A=84 ``rustc``=EF=BC=8C=E8=80=8C=E4=B8=8D=E5=BD=B1=E5=93=8D=E4=BD=A0=E7=
=9A=84=E9=BB=98=E8=AE=A4=E5=B7=A5=E5=85=B7=E9=93=BE=E3=80=82
> =20
>  =E8=AF=B7=E6=B3=A8=E6=84=8F=E8=A6=86=E7=9B=96=E5=BA=94=E7=94=A8=E5=BD=93=
=E5=89=8D=E7=9A=84=E5=B7=A5=E4=BD=9C=E7=9B=AE=E5=BD=95=EF=BC=88=E5=92=8C=E5=
=AE=83=E7=9A=84=E5=AD=90=E7=9B=AE=E5=BD=95=EF=BC=89=E3=80=82
> =20
> @@ -54,7 +175,7 @@ rustc
>  Rust=E6=A0=87=E5=87=86=E5=BA=93=E6=BA=90=E4=BB=A3=E7=A0=81
>  ****************
> =20
> -Rust=E6=A0=87=E5=87=86=E5=BA=93=E7=9A=84=E6=BA=90=E4=BB=A3=E7=A0=81=E6=
=98=AF=E5=BF=85=E9=9C=80=E7=9A=84=EF=BC=8C=E5=9B=A0=E4=B8=BA=E6=9E=84=E5=BB=
=BA=E7=B3=BB=E7=BB=9F=E4=BC=9A=E4=BA=A4=E5=8F=89=E7=BC=96=E8=AF=91 ``core``=
 =E5=92=8C ``alloc`` =E3=80=82
> +Rust=E6=A0=87=E5=87=86=E5=BA=93=E7=9A=84=E6=BA=90=E4=BB=A3=E7=A0=81=E6=
=98=AF=E5=BF=85=E9=9C=80=E7=9A=84=EF=BC=8C=E5=9B=A0=E4=B8=BA=E6=9E=84=E5=BB=
=BA=E7=B3=BB=E7=BB=9F=E4=BC=9A=E4=BA=A4=E5=8F=89=E7=BC=96=E8=AF=91 ``core``=
 =E3=80=82
> =20
>  =E5=A6=82=E6=9E=9C=E6=AD=A3=E5=9C=A8=E4=BD=BF=E7=94=A8 ``rustup`` =EF=BC=
=8C=E8=AF=B7=E8=BF=90=E8=A1=8C::
> =20
> @@ -64,10 +185,10 @@ Rust=E6=A0=87=E5=87=86=E5=BA=93=E7=9A=84=E6=BA=90=E4=
=BB=A3=E7=A0=81=E6=98=AF=E5=BF=85=E9=9C=80=E7=9A=84=EF=BC=8C=E5=9B=A0=E4=B8=
=BA=E6=9E=84=E5=BB=BA=E7=B3=BB=E7=BB=9F=E4=BC=9A=E4=BA=A4=E5=8F=89=E7=BC=96=
=E8=AF=91 ``core
> =20
>  =E5=90=A6=E5=88=99=EF=BC=8C=E5=A6=82=E6=9E=9C=E4=BD=BF=E7=94=A8=E7=8B=AC=
=E7=AB=8B=E7=9A=84=E5=AE=89=E8=A3=85=E7=A8=8B=E5=BA=8F=EF=BC=8C=E5=8F=AF=E4=
=BB=A5=E5=B0=86Rust=E6=BA=90=E7=A0=81=E6=A0=91=E4=B8=8B=E8=BD=BD=E5=88=B0=
=E5=AE=89=E8=A3=85=E5=B7=A5=E5=85=B7=E9=93=BE=E7=9A=84=E6=96=87=E4=BB=B6=E5=
=A4=B9=E4=B8=AD::
> =20
> -       curl -L "https://static.rust-lang.org/dist/rust-src-$(scripts/min=
-tool-version.sh rustc).tar.gz" |
> -               tar -xzf - -C "$(rustc --print sysroot)/lib" \
> -               "rust-src-$(scripts/min-tool-version.sh rustc)/rust-src/l=
ib/" \
> -               --strip-components=3D3
> +	curl -L "https://static.rust-lang.org/dist/rust-src-$(rustc --version |=
 cut -d' ' -f2).tar.gz" |
> +		tar -xzf - -C "$(rustc --print sysroot)/lib" \
> +		"rust-src-$(rustc --version | cut -d' ' -f2)/rust-src/lib/" \
> +		--strip-components=3D3
> =20
>  =E5=9C=A8=E8=BF=99=E7=A7=8D=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E4=BB=A5=
=E5=90=8E=E5=8D=87=E7=BA=A7Rust=E7=BC=96=E8=AF=91=E5=99=A8=E7=89=88=E6=9C=
=AC=E9=9C=80=E8=A6=81=E6=89=8B=E5=8A=A8=E6=9B=B4=E6=96=B0=E8=BF=99=E4=B8=AA=
=E6=BA=90=E4=BB=A3=E7=A0=81=E6=A0=91=EF=BC=88=E8=BF=99=E5=8F=AF=E4=BB=A5=E9=
=80=9A=E8=BF=87=E7=A7=BB=E9=99=A4
>  ``$(rustc --print sysroot)/lib/rustlib/src/rust`` =EF=BC=8C=E7=84=B6=E5=
=90=8E=E9=87=8D=E6=96=B0=E6=89=A7=E8=A1=8C=E4=B8=8A
> @@ -97,24 +218,21 @@ Linux=E5=8F=91=E8=A1=8C=E7=89=88=E4=B8=AD=E5=8F=AF=
=E8=83=BD=E4=BC=9A=E6=9C=89=E5=90=88=E9=80=82=E7=9A=84=E5=8C=85=EF=BC=8C=E6=
=89=80=E4=BB=A5=E6=9C=80=E5=A5=BD=E5=85=88=E6=A3=80=E6=9F=A5=E4=B8=80=E4=B8=
=8B=E3=80=82
>  bindgen
>  *******
> =20
> -=E5=86=85=E6=A0=B8=E7=9A=84C=E7=AB=AF=E7=BB=91=E5=AE=9A=E6=98=AF=E5=9C=
=A8=E6=9E=84=E5=BB=BA=E6=97=B6=E4=BD=BF=E7=94=A8 ``bindgen`` =E5=B7=A5=E5=
=85=B7=E7=94=9F=E6=88=90=E7=9A=84=E3=80=82=E8=BF=99=E9=9C=80=E8=A6=81=E7=89=
=B9=E5=AE=9A=E7=9A=84=E7=89=88=E6=9C=AC=E3=80=82
> -
> -=E9=80=9A=E8=BF=87=E4=BB=A5=E4=B8=8B=E6=96=B9=E5=BC=8F=E5=AE=89=E8=A3=85=
=E5=AE=83=EF=BC=88=E6=B3=A8=E6=84=8F=EF=BC=8C=E8=BF=99=E5=B0=86=E4=BB=8E=E6=
=BA=90=E7=A0=81=E4=B8=8B=E8=BD=BD=E5=B9=B6=E6=9E=84=E5=BB=BA=E8=AF=A5=E5=B7=
=A5=E5=85=B7=EF=BC=89::
> -
> -	cargo install --locked --version $(scripts/min-tool-version.sh bindgen)=
 bindgen-cli
> +=E5=86=85=E6=A0=B8=E7=9A=84C=E7=AB=AF=E7=BB=91=E5=AE=9A=E6=98=AF=E5=9C=
=A8=E6=9E=84=E5=BB=BA=E6=97=B6=E4=BD=BF=E7=94=A8 ``bindgen`` =E5=B7=A5=E5=
=85=B7=E7=94=9F=E6=88=90=E7=9A=84=E3=80=82
> =20
> -``bindgen`` =E9=9C=80=E8=A6=81=E6=89=BE=E5=88=B0=E5=90=88=E9=80=82=E7=9A=
=84 ``libclang`` =E6=89=8D=E8=83=BD=E5=B7=A5=E4=BD=9C=E3=80=82=E5=A6=82=E6=
=9E=9C=E6=B2=A1=E6=9C=89=E6=89=BE=E5=88=B0=EF=BC=88=E6=88=96=E8=80=85=E6=89=
=BE=E5=88=B0=E7=9A=84
> -``libclang`` =E4=B8=8E=E5=BA=94=E8=AF=A5=E4=BD=BF=E7=94=A8=E7=9A=84 ``li=
bclang`` =E4=B8=8D=E5=90=8C=EF=BC=89=EF=BC=8C=E5=88=99=E5=8F=AF=E4=BB=A5=E4=
=BD=BF=E7=94=A8 ``clang-sys``
> -=E7=90=86=E8=A7=A3=E7=9A=84=E7=8E=AF=E5=A2=83=E5=8F=98=E9=87=8F=EF=BC=88=
Rust=E7=BB=91=E5=AE=9A=E5=88=9B=E5=BB=BA=E7=9A=84 ``bindgen`` =E7=94=A8=E6=
=9D=A5=E8=AE=BF=E9=97=AE ``libclang``=EF=BC=89:
> +=E4=BE=8B=E5=A6=82=EF=BC=8C=E9=80=9A=E8=BF=87=E4=BB=A5=E4=B8=8B=E6=96=B9=
=E5=BC=8F=E5=AE=89=E8=A3=85=E5=AE=83=EF=BC=88=E6=B3=A8=E6=84=8F=EF=BC=8C=E8=
=BF=99=E5=B0=86=E4=BB=8E=E6=BA=90=E7=A0=81=E4=B8=8B=E8=BD=BD=E5=B9=B6=E6=9E=
=84=E5=BB=BA=E8=AF=A5=E5=B7=A5=E5=85=B7=EF=BC=89::
> =20
> +	cargo install --locked bindgen-cli
> =20
> -* ``LLVM_CONFIG_PATH`` =E5=8F=AF=E4=BB=A5=E6=8C=87=E5=90=91=E4=B8=80=E4=
=B8=AA ``llvm-config`` =E5=8F=AF=E6=89=A7=E8=A1=8C=E6=96=87=E4=BB=B6=E3=80=
=82
> +``bindgen`` =E4=BD=BF=E7=94=A8 ``clang-sys`` crate =E6=9D=A5=E6=9F=A5=E6=
=89=BE=E5=90=88=E9=80=82=E7=9A=84 ``libclang`` =EF=BC=88=E5=8F=AF=E4=BB=A5=
=E9=9D=99=E6=80=81=E9=93=BE
> +=E6=8E=A5=E3=80=81=E5=8A=A8=E6=80=81=E9=93=BE=E6=8E=A5=E6=88=96=E5=9C=A8=
=E8=BF=90=E8=A1=8C=E6=97=B6=E5=8A=A0=E8=BD=BD=EF=BC=89=E3=80=82=E9=BB=98=E8=
=AE=A4=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E4=B8=8A=E9=9D=A2=E7=9A=84 ``car=
go`` =E5=91=BD=E4=BB=A4=E4=BC=9A=E7=94=9F=E6=88=90=E4=B8=80=E4=B8=AA=E5=9C=
=A8=E8=BF=90=E8=A1=8C=E6=97=B6
> +=E5=8A=A0=E8=BD=BD ``libclang`` =E7=9A=84 ``bindgen`` =E4=BA=8C=E8=BF=9B=
=E5=88=B6=E6=96=87=E4=BB=B6=E3=80=82=E5=A6=82=E6=9E=9C=E6=B2=A1=E6=9C=89=E6=
=89=BE=E5=88=B0=EF=BC=88=E6=88=96=E8=80=85=E5=BA=94=E8=AF=A5=E4=BD=BF=E7=94=
=A8=E4=B8=8E=E6=89=BE=E5=88=B0=E7=9A=84
> +=E4=B8=8D=E5=90=8C=E7=9A=84 ``libclang``=EF=BC=89=EF=BC=8C=E5=8F=AF=E4=
=BB=A5=E8=B0=83=E6=95=B4=E8=AF=A5=E8=BF=87=E7=A8=8B=EF=BC=8C=E4=BE=8B=E5=A6=
=82=E4=BD=BF=E7=94=A8 ``LIBCLANG_PATH`` =E7=8E=AF=E5=A2=83=E5=8F=98=E9=87=
=8F=E3=80=82=E8=AF=A6
> +=E6=83=85=E8=AF=B7=E5=8F=82=E9=98=85 ``clang-sys`` =E7=9A=84=E6=96=87=E6=
=A1=A3=EF=BC=9A
> =20
> -* =E6=88=96=E8=80=85 ``LIBCLANG_PATH`` =E5=8F=AF=E4=BB=A5=E6=8C=87=E5=90=
=91 ``libclang`` =E5=85=B1=E4=BA=AB=E5=BA=93=E6=88=96=E5=8C=85=E5=90=AB=E5=
=AE=83=E7=9A=84=E7=9B=AE=E5=BD=95=E3=80=82
> +	https://github.com/KyleMayes/clang-sys#linking
> =20
> -* =E6=88=96=E8=80=85 ``CLANG_PATH`` =E5=8F=AF=E4=BB=A5=E6=8C=87=E5=90=91=
 ``clang`` =E5=8F=AF=E6=89=A7=E8=A1=8C=E6=96=87=E4=BB=B6=E3=80=82
> -
> -=E8=AF=A6=E6=83=85=E8=AF=B7=E5=8F=82=E9=98=85 ``clang-sys`` =E7=9A=84=E6=
=96=87=E6=A1=A3:
> +	https://github.com/KyleMayes/clang-sys#environment-variables
> =20
> =20
>  =E5=BC=80=E5=8F=91=E4=BE=9D=E8=B5=96
> @@ -151,18 +269,6 @@ clippy
>  =E7=8B=AC=E7=AB=8B=E7=9A=84=E5=AE=89=E8=A3=85=E7=A8=8B=E5=BA=8F=E4=B9=9F=
=E5=B8=A6=E6=9C=89 ``clippy`` =E3=80=82
> =20
> =20
> -cargo
> -*****
> -
> -``cargo`` =E6=98=AFRust=E7=9A=84=E6=9C=AC=E5=9C=B0=E6=9E=84=E5=BB=BA=E7=
=B3=BB=E7=BB=9F=E3=80=82=E7=9B=AE=E5=89=8D=E9=9C=80=E8=A6=81=E5=AE=83=E6=9D=
=A5=E8=BF=90=E8=A1=8C=E6=B5=8B=E8=AF=95=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=AE=83=
=E8=A2=AB=E7=94=A8=E6=9D=A5=E6=9E=84=E5=BB=BA=E4=B8=80=E4=B8=AA=E8=87=AA=E5=
=AE=9A=E4=B9=89=E7=9A=84=E6=A0=87=E5=87=86
> -=E5=BA=93=EF=BC=8C=E5=85=B6=E4=B8=AD=E5=8C=85=E5=90=AB=E4=BA=86=E5=86=85=
=E6=A0=B8=E4=B8=AD=E8=87=AA=E5=AE=9A=E4=B9=89 ``alloc`` =E6=89=80=E6=8F=90=
=E4=BE=9B=E7=9A=84=E8=AE=BE=E6=96=BD=E3=80=82=E6=B5=8B=E8=AF=95=E5=8F=AF=E4=
=BB=A5=E4=BD=BF=E7=94=A8 ``rusttest`` Make =E7=9B=AE=E6=A0=87
> -=E6=9D=A5=E8=BF=90=E8=A1=8C=E3=80=82
> -
> -=E5=A6=82=E6=9E=9C=E4=BD=BF=E7=94=A8=E7=9A=84=E6=98=AF ``rustup`` =EF=BC=
=8C=E6=89=80=E6=9C=89=E7=9A=84=E9=85=8D=E7=BD=AE=E6=96=87=E4=BB=B6=E9=83=BD=
=E5=B7=B2=E7=BB=8F=E5=AE=89=E8=A3=85=E4=BA=86=E8=AF=A5=E5=B7=A5=E5=85=B7=EF=
=BC=8C=E5=9B=A0=E6=AD=A4=E4=B8=8D=E9=9C=80=E8=A6=81=E5=86=8D=E5=81=9A=E4=BB=
=80=E4=B9=88=E3=80=82
> -
> -=E7=8B=AC=E7=AB=8B=E7=9A=84=E5=AE=89=E8=A3=85=E7=A8=8B=E5=BA=8F=E4=B9=9F=
=E5=B8=A6=E6=9C=89 ``cargo`` =E3=80=82
> -
> -
>  rustdoc
>  *******
> =20
> @@ -223,7 +329,7 @@ Rust=E6=94=AF=E6=8C=81=EF=BC=88CONFIG_RUST=EF=BC=89=
=E9=9C=80=E8=A6=81=E5=9C=A8 ``General setup`` =E8=8F=9C=E5=8D=95=E4=B8=AD=
=E5=90=AF=E7=94=A8=E3=80=82=E5=9C=A8=E5=85=B6
>  =E5=A6=82=E6=9E=9C=E4=BD=BF=E7=94=A8=E7=9A=84=E6=98=AFGDB/Binutils=EF=BC=
=8C=E8=80=8CRust=E7=AC=A6=E5=8F=B7=E6=B2=A1=E6=9C=89=E8=A2=ABdemangled=EF=
=BC=8C=E5=8E=9F=E5=9B=A0=E6=98=AF=E5=B7=A5=E5=85=B7=E9=93=BE=E8=BF=98=E4=B8=
=8D=E6=94=AF=E6=8C=81Rust=E7=9A=84=E6=96=B0v0
>  mangling=E6=96=B9=E6=A1=88=E3=80=82=E6=9C=89=E5=87=A0=E4=B8=AA=E5=8A=9E=
=E6=B3=95=E5=8F=AF=E4=BB=A5=E8=A7=A3=E5=86=B3=EF=BC=9A
> =20
> -  - =E5=AE=89=E8=A3=85=E4=B8=80=E4=B8=AA=E8=BE=83=E6=96=B0=E7=9A=84=E7=
=89=88=E6=9C=AC=EF=BC=88GDB >=3D 10.2, Binutils >=3D 2.36=EF=BC=89=E3=80=82
> +- =E5=AE=89=E8=A3=85=E4=B8=80=E4=B8=AA=E8=BE=83=E6=96=B0=E7=9A=84=E7=89=
=88=E6=9C=AC=EF=BC=88GDB >=3D 10.2, Binutils >=3D 2.36=EF=BC=89=E3=80=82
> =20
> -  - =E4=B8=80=E4=BA=9B=E7=89=88=E6=9C=AC=E7=9A=84GDB=EF=BC=88=E4=BE=8B=
=E5=A6=82vanilla GDB 10.1=EF=BC=89=E8=83=BD=E5=A4=9F=E4=BD=BF=E7=94=A8=E5=
=B5=8C=E5=85=A5=E5=9C=A8=E8=B0=83=E8=AF=95=E4=BF=A1=E6=81=AF(``CONFIG_DEBUG=
_INFO``)
> -    =E4=B8=AD=E7=9A=84pre-demangled=E7=9A=84=E5=90=8D=E5=AD=97=E3=80=82
> +- =E4=B8=80=E4=BA=9B=E7=89=88=E6=9C=AC=E7=9A=84GDB=EF=BC=88=E4=BE=8B=E5=
=A6=82vanilla GDB 10.1=EF=BC=89=E8=83=BD=E5=A4=9F=E4=BD=BF=E7=94=A8=E5=B5=
=8C=E5=85=A5=E5=9C=A8=E8=B0=83=E8=AF=95=E4=BF=A1=E6=81=AF(``CONFIG_DEBUG_IN=
FO``)
> +  =E4=B8=AD=E7=9A=84pre-demangled=E7=9A=84=E5=90=8D=E5=AD=97=E3=80=82

