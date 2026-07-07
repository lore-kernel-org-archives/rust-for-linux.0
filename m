Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022080.outbound.protection.outlook.com [52.101.101.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD25417377
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430867; cv=fail; b=u00CNamvxfZwOyN8DAWHpOXgXyBDM0aY9OwoDJXdYcNOL3g6lUtGPnNZljssplFiVf2/fduS7NEaGD1LNSbMPBxYbVmO0CvibpwZ5LVP/gB3d2RfzDFNS2iDLExoWeIrky8N6NnpArjQjctiij7+rQG7SR9vKZ6P8fQDDpyCIhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430867; c=relaxed/simple;
	bh=lVJMuKAFDynf0iCuGItxBkw7GeNFuIL9tQmRZcJL7gM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ewyIofKvw/KOP67EsuREPBmXjneolimhBRLVoIoAaeP0/j0vqXH6yvrp0AOuXM5dZYT3jx11Tmz6gzJaJCc7bvzhpZf00mpea1AmY2Z+fLb3xo9pRDrpOBguufGNTqAqfCx4b4DgGyLypvZlfihcW5r7fgPL72C09c2r2mQ6GcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SI83AHuH; arc=fail smtp.client-ip=52.101.101.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SI83AHuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CagZMUlz53PpXC6sPBXiv/0CtvQr1BTWPDQyI/uNGlvc1SziWbKglAujy1oPVLkiSSUgkJCEJsCrmxlJNaLPz2R3TrtvqzRFmxXMVHqRsxyUyC5O4j4ATPpGBZswkxMNNYKtHtTV7VIyKFzcV8ZRauR1cIb4SbpLfVlhL90zbPgl9npLyML5vJMo1VQKBZbL2RbZ1cPfpwjHvUys0yHkhqXwusbCEFARfvm81AIeME7bS0izkmmMk+bfKpw4aTWhMRdCyyvm3g5rbNTKwCbNGH/m6MX+HXPoyAhBebX56uGcGuqu33AibWx55/GWSlTUJUHXLAtkCCTFjcp3O4dFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u/5TNmkU2Y48J+4klvkWxNLkdI58R6erMvATQQ+dtM=;
 b=kab2dk7uDZdEpllZmc6NzHC1jQzNeoOowb4cZcxuvvtQa4NJ/MZHNNABlOkJ3KRkGHMkVvely9iGSG52WtStcfqKVj7VWZcv9PwChVya/dIZ7G6NYZ16SIHt8fbIImlg4GV/8Uv0EJPe6Zpbqh6sR5ZuB5vjmBEnTB02W10EOZbx+9vuP1ZbfVyNCXrdYTrSDlRbS689VFlm5hqdCLnby12MDk52r/Wdlzg5txYPhUK5ZzJjamCuEhj8lTtgylmpWbNxzayocIhAdwDOULtmBKyKaKa6hXntZDHEff9oZAzFelkZC9PJtW/QH81jC5EZTQaxED3BiVdBBFkcC90X+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u/5TNmkU2Y48J+4klvkWxNLkdI58R6erMvATQQ+dtM=;
 b=SI83AHuH5KvlpAGidJayG3zCE54sEKCPwz9LUqP1zYQu+8fOfTHtor+KA/p6LIwvpIjTNFLPbBH15i+dvjjL+X6iMmiXJWiQeZfyNxFoWI4I4wuxf28jjkCz5N2FoRos3/Rm4fpJMaZ3xjQsmqwYXLgSHXLdNlZ/GgMjeWNqmDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8879.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 7 Jul
 2026 13:27:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 13:27:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 14:27:40 +0100
Message-Id: <DJSDH6ZWWQI4.14UJGH8YGO95U@garyguo.net>
Cc: <ojeda@kernel.org>, <lossin@kernel.org>
Subject: Re: [PATCH] rust: pin-init: Add missing SAFETY comments in
 internal/init.rs
From: "Gary Guo" <gary@garyguo.net>
To: "Pengheng Wang" <pengheng.wang@foxmail.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <tencent_847C6CC7A95F9DB83F0D371CC97F4DD46C08@qq.com>
In-Reply-To: <tencent_847C6CC7A95F9DB83F0D371CC97F4DD46C08@qq.com>
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8879:EE_
X-MS-Office365-Filtering-Correlation-Id: f52288c3-d86a-40f2-6ebc-08dedc2b8562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|6133799003|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	X9tVflZjLDiDCLgHiZlBimitsBGotl7edBiqEI2HP6TLiiZBcaxr83i/EY3ycD5KpciYYgpL0oLhV9uKcf9BBIVHaB8Vzm5uDC8fwmkDhhZaHatFusDPdRpnqiNGhFf0UbDCeLPaPtUnSo0HhyocuWWA94Txl4ZotH0KuHI1pMWQU/XrI4DQIUnNXNVnDOcqvVPHudgwFoHbyx1kI8A0hBN6KyIimqrH9p8z50Vo9Q6IIsn/GD3C+yB9NXrBLIlcoSlVhZOu3La/0ktTCDMHZQE/FQOqyr4VyrJZi48XdaVn+qkqK7qz37hwf5aplfgLlWt7sbSoTW1xhuDq1FTHfDnM661Qp7Pngl46A977mWXhPQeJM44fwjBuWnFvtzmNotb22nsIpoSm7QLd8qIzet3UFauTKYIyge4O/NK23UfYGJTDRlxvGaDCw1Ub+tO25+/ajMIaAGt3epsTs+TIPVZRlSVfE78+iizsg3ryzLzrFuYTVfrial3ZMxLh6D/eWVmdEhXSbFFamlmpWT/JLZrwFsKk2gXI65FUv6Euasrw1y8Za1DxSeLdRr/VKSSeSMZEAPdudMURjXdjIyi92UjBXLuN1nXJPqvEbL4ot8zjOpanEWebtUuNDt7TQeq8lRtwtpWM1+b0evYJXAAtL6upcm3T3M08gELqL5R0Jx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDhqdWg0VkhIMlRKaXRNc3pLbm1xVE5NVUFJcUFQbFRXODZkOVdOejVWVXZu?=
 =?utf-8?B?ZjdHRGNsc3AzelRWWHB2OGw1WUdDOTBXOUpPY2pYdmllY2hyd2dFcFNSeXNC?=
 =?utf-8?B?elIvZ1hwYzl2QzBMZWRmb1JQTHRMeEVud2doOHZ1MTFYekwya01QbE1tcGxt?=
 =?utf-8?B?UnlLaEx3SERGS0JoTkJrbERVT1R5UUROdHMrNWNiNzIwMDlmY0k0bkRGY3M2?=
 =?utf-8?B?a2dMcTNnM1JzZDI5WEV0M3hzZ1dlKzlnZGZDekt2RE14ajhjaEozQ0hjMC8w?=
 =?utf-8?B?YkdUa2ZNWkxNRjFubXNjVU9RSWtWS0F2YkdseWc2QzQyZGtvOUp3c2ZrNk8z?=
 =?utf-8?B?aEYwUzlrcE9oaU1NMWo3R25pMXhPTHQwWFRzaXNTTUxSWUFKVFBuSGcwaFBB?=
 =?utf-8?B?SSt6R2UwYkhSU0dtTXJ0d1RvS3JtZ0Ywbm5FbGloRjRrYi9veVAvOWRhWWZH?=
 =?utf-8?B?L2krS2I1eGhvNG42eDRjTVBPREZsbXVoa0lUZjFibTBva3dtRzUyYlEzcW1i?=
 =?utf-8?B?NmZOWEtwKzQ4Und4OVM5d2ppSE9YVVFaSG9HblRnRW41eFU2WWVrY1R0dUtx?=
 =?utf-8?B?QWdJOHNPWEE3Smdpbi9FcjBYUmVxMm4yTDFxdGhDMDdhRjZNU2VRQ3ZTdktE?=
 =?utf-8?B?S0tFaFFlaGR1bjg5aDhZVWppTDRXNmRYcWlTYlhjdVVCdXhoWm9GWnloSHdm?=
 =?utf-8?B?bnRpa0RIMXZhNk1DaUZhMnBXWlZmeXFDVTA1ZG1TbnlhNlJHODJtN2Y1K0tD?=
 =?utf-8?B?cGNueFFyclYxMmJVOGNROEhHQ2FoSDlNTXdFMm9OSHU3YjYxSVAydm5LcDBV?=
 =?utf-8?B?S2VBemsycWoycGVlVnlLSlRNaHYzWjYxM2ZMdmpyMS9IR1gyRWxoZzVYWDZ2?=
 =?utf-8?B?QmE5cUVjb2Fnb3NmTUppWTlocUpwOGt6cm1PRFFYWGczd0JDTTNCUnlybkZP?=
 =?utf-8?B?YlJ1aHUwemd0b3RHaS9GWlNqQWFFa3F0T2ZPN1NmWDFzZmhmczBWdU9VSWQ3?=
 =?utf-8?B?UjEvbVEzdFFvcjg0N2cyVnpzdHRYUWtDVHFFdnNadEJrU3V0elhvVVpmM1dZ?=
 =?utf-8?B?S3ZCMmZwYk1Xd1hPa0Fkd0dmdFVSYzh1SWlDWDhic3d3M0o0YzJPMWVYRGtV?=
 =?utf-8?B?bVExU1l3alBhOTVNUTRLRlRKMmE1NXI1MXVyWkdXTDI5Q2pYcHNzQVptVVR1?=
 =?utf-8?B?Uy8wSHBJejI0U2UrWlA5Rjd4WG56OWpsWWNJOWZzZ2xKa1JvUEM4WU82SGlD?=
 =?utf-8?B?Ry9xMlp2QWthdkJ4M2FTbTIrK3ZtUTNoNWU3WXE2OFptL3VQZ2lXS29VazY3?=
 =?utf-8?B?eHFGOWxuMWduSjNhSGJxR1hxOVpFK1JKbG5yVUJvT2NobXJtVnRGeEJ2cHp0?=
 =?utf-8?B?dkViNXNpcHJKMjZCcW9tNis1cTd3Q25Mb3N5TTR3enplVDAxeU51UFMxOFNy?=
 =?utf-8?B?alllUEJpTnRiTFI4WktlVk1GcGN5eHJTSllaT0grblBucnlRVkZoVjJyblo1?=
 =?utf-8?B?UWkveHdEb3U0cFk5SWVQSHFXalByNWYwbi8veDQ3WUFZNkYzWno1Q1haZE14?=
 =?utf-8?B?alp3UmszaXNPazVTUUhTVGhXVVhBaU9PWEZoRlRSTXhhZHdLYldqK01vMjVx?=
 =?utf-8?B?UzNra000dTgybUhzdjhCNmNLbDdkcDNUbkRFLytsVWVZM1QrSXhKTlZHL29B?=
 =?utf-8?B?bVRhQ2l6REp1REdpbkRXdGwzSzFEZi83d2pMMnZPVWozU2RsalpYTVVyYytP?=
 =?utf-8?B?U3JiYyt5eXZ1UXY1cWwxZzJaeFMwaHQycW9sWlZwN0w5Z1ZHRnBQK3pwOXI0?=
 =?utf-8?B?bDR4cERkOWFEYmxPM1JMSG5oaXJsWlBtZVNnNDVHVjlSMEtHYU5uZmU5RGx3?=
 =?utf-8?B?VHJyMFN1anY5aFNwKzRCRWdjUU44NDVWSWhEYzVCeVV4M3RqT0ZzckRTSHZT?=
 =?utf-8?B?Q2M2eUJtcGlsVDVHNDk1R2IwVlJxYmFCUEdPWUJUUG1WaTMyN2FBUGsrREhi?=
 =?utf-8?B?d3BKYXY2OWR1RlRobVdydnVjTUE0TWo1N012aldDdnQrU2ZiWHpobXNoWHU5?=
 =?utf-8?B?NkZZQXNoRjdNYW95K1dDaG9mWGF6SmtlRHJza2UzWGN2RFROTnhDV2o4ZVda?=
 =?utf-8?B?WG9UUEdUVGxtYW5SN29Vb0RlVUZSWEpnZFA3Y2tCc28vVFNHVmFiUS9SVnBs?=
 =?utf-8?B?SXlERUdlOVN6aElPeS9qRmtrZHJzcFIyWmh1RXFtMGMzTVNudHk4Uk1FUFl4?=
 =?utf-8?B?czU3Y1liamdZU3VyLzR0cGNHMXVtTkY5dlN6ZDFSeThlSU9zU3BLVFVVRm54?=
 =?utf-8?B?dUhKWmJ0MElqcFJNWThtSk9FQnVRencxcFNkblhXc1djb1g0QTl4dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f52288c3-d86a-40f2-6ebc-08dedc2b8562
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:27:41.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbdEc1A+yWllIs4woSy3Hwekw31U4xdVw9iYHg2Lu1dcbFY+sX12ZAdapKn6wFM63krl/pEH4PuzyigU2LyvqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8879

On Fri Apr 3, 2026 at 12:52 PM BST, Pengheng Wang wrote:
> Replace "// SAFETY: TODO" placeholders with proper safety explanations
> for the unsafe blocks in the proc-macro initialization code.

This patch doesn't apply anymore, due to the refactoring to the slots. Ther=
e're
still 3 TODOs left. Want to do a respin?

>
> Each unsafe block now has a clear explanation of why the operation is
> safe:
>
> - Line 152: Type implements HasPinData/HasInitData trait guaranteeing
>   correct data structure for field initialization
> - Line 175: Closure correctly initializes all fields and handles
>   errors/panics properly
> - Lines 255, 261, 269, 297, 315: slot pointer validity and proper
>   alignment guarantees for field access and projection

We don't need to repeat what the diff is already telling in the commit mess=
age.

Best,
Gary

>
> Suggested-by: https://github.com/Rust-for-Linux/linux/issues/351
> Link: https://github.com/Rust-for-Linux/linux/issues/351
> Signed-off-by: Pengheng Wang <pengheng.wang@foxmail.com>
> ---
>  rust/pin-init/internal/src/init.rs | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/=
src/init.rs
> index 2fe918f4d82a..4121e21e01e1 100644
> --- a/rust/pin-init/internal/src/init.rs
> +++ b/rust/pin-init/internal/src/init.rs
> @@ -149,7 +149,8 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut=
 T)
>      let field_check =3D make_field_check(&fields, init_kind, &path);
>      Ok(quote! {{
>          // Get the data about fields from the supplied type.
> -        // SAFETY: TODO
> +        // SAFETY: The type implements `#has_data_trait`, guaranteeing t=
hat `#get_data` returns the
> +        // correct `#data_trait` type for initializing the struct's fiel=
ds.
>          let #data =3D unsafe {
>              use ::pin_init::__internal::#has_data_trait;
>              // Can't use `<#path as #has_data_trait>::#get_data`, since =
the user is able to omit
> @@ -171,7 +172,8 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut=
 T)
>          let init =3D move |slot| -> ::core::result::Result<(), #error> {
>              init(slot).map(|__InitOk| ())
>          };
> -        // SAFETY: TODO
> +        // SAFETY: the closure passed to `#init_from_closure` correctly =
initializes all fields of the
> +        // struct and returns `Ok(())` on success; it handles errors/pan=
ics correctly.
>          let init =3D unsafe { ::pin_init::#init_from_closure::<_, #error=
>(init) };
>          init
>      }})
> @@ -250,12 +252,13 @@ fn init_fields(
>                  let accessor =3D if pinned {
>                      let project_ident =3D format_ident!("__project_{iden=
t}");
>                      quote! {
> -                        // SAFETY: TODO
> +                        // SAFETY: `slot` is a valid pointer to the stru=
ct being initialized, and `#data`
> +                        // provides the correct projection function thro=
ugh the `#project_ident` method.
>                          unsafe { #data.#project_ident(&mut (*#slot).#ide=
nt) }
>                      }
>                  } else {
>                      quote! {
> -                        // SAFETY: TODO
> +                        // SAFETY: `slot` is a valid pointer to the stru=
ct being initialized.
>                          unsafe { &mut (*#slot).#ident }
>                      }
>                  };
> @@ -263,7 +266,8 @@ fn init_fields(
>                      #(#attrs)*
>                      {
>                          #value_prep
> -                        // SAFETY: TODO
> +                        // SAFETY: `slot` is a valid pointer to the stru=
ct being initialized, and the
> +                        // field is properly aligned (enforced by the fi=
eld accessor).
>                          unsafe { #write(::core::ptr::addr_of_mut!((*#slo=
t).#ident), #value_ident) };
>                      }
>                      #(#cfgs)*
> @@ -290,7 +294,8 @@ fn init_fields(
>                              unsafe { #data.#ident(::core::ptr::addr_of_m=
ut!((*#slot).#ident), #init)? };
>                          },
>                          quote! {
> -                            // SAFETY: TODO
> +                            // SAFETY: `slot` is a valid pointer to the =
struct being initialized, and `#data`
> +                            // provides the correct projection function =
through the `#project_ident` method.
>                              unsafe { #data.#project_ident(&mut (*#slot).=
#ident) }
>                          },
>                      )
> @@ -307,7 +312,7 @@ fn init_fields(
>                              };
>                          },
>                          quote! {
> -                            // SAFETY: TODO
> +                            // SAFETY: `slot` is a valid pointer to the =
struct being initialized.
>                              unsafe { &mut (*#slot).#ident }
>                          },
>                      )


