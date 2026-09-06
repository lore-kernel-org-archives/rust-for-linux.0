Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022134.outbound.protection.outlook.com [52.101.101.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7D2D3EEB;
	Sun,  6 Sep 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788698785; cv=fail; b=mK7eU446lYVi1pHqAteUflb3DN3/SbV3iFJ0IRspPzRibVTqWDUSJ7GonTnTPbXaNVlTzFgoQlypiqTuszKUso+05bD058pfyGRJXuUsrujwm4j0r0GLfTwx0stUXxixDu24tD/uw6TjwkPXsMzSaera7xPs8rFHz9FjclfO1+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788698785; c=relaxed/simple;
	bh=nbOUgPwkZCWaCWTensAmBoppG8hJo3rwRz3q+ol4EUE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hxavkhkf9Pol8/yn2UHVW203rpERaBC6QGktshWdoapPtTNbaasIhFuHs5BnMoaRB93LDulfmEya8bAnbmEfzLs1ZslGGNlmAdJnNo2iarIzaIN1RJVNUqNnyUqc47chj+US+WCQ7n4lw852Rca1y5csmAMyWhti+e7UBbwXOYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GrdkIPMq; arc=fail smtp.client-ip=52.101.101.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GrdkIPMq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUVxsJdX1bX64whNArRZF79DSPmVSPPUJRMOudVQKOqEyEz2tvWS+9uouPSbcNsFp98NfI6h+xzqqdPmjFx5NBeUytsy4sAdmPvcvNq/SYrNDsrxJNbK1LZvS7eD0wFJ5TUp0or7z8sSdSqCEeQMD6tviprf4vQpzeSyM83ZVN8rFI0Q91kAFD+Na9IMGTbXu9dQBP7dFuRKYlRLY22vb2/Na9j6Rkrn3iOs3erRYOKVW6tquGS1KNM9syLbypDfpQcTyC9jo8KSkRwXmtuXANoXZWaiLLoirq5TBYcSkQ17gN7i5Sim6u0iLJKErwfT6drsHPMh8Q7orgELDamdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hgnar1fj1lpRMypVMJly/CQlu9mGcVrrZ91GEHxelh0=;
 b=aXSEF9rDMC7Mzw87JroTentU84gsvdAIy4qIsylH2C9iYXtU+saBBLRCnKQTcTUf0Y0v+tQjIlZcQZ+OD0EAWIu5nSHy9cWig3h3g3r6mq1ide6JjNV2RSNICWJcfA+nldcRI4jLPbRyHzrtbgzUvEEmL9KADU/WuUJXOG/cd4PJLaSv1pOpUc/RXYKbjTJHQuwCksZOQPhqsF0o/bfaopj+/UpgC3ErDkHJbdmesWVDD7XhSxj2qH4ObbC/o9Vs1jEZJRBYV+HBk6oY8Y7jm9j1H/YknBAEqxusSZA99cRqX2dCLaN8jwNV1Ac8/6VqxzjF3y8d1CRDyjfeSJ2NaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgnar1fj1lpRMypVMJly/CQlu9mGcVrrZ91GEHxelh0=;
 b=GrdkIPMq7PV8QVBV4MsApOq1S5Puss7ATQWpYPSf4CYO56NiShG9b/K+uBKdkGJA0TdivyWrs8fDV/UidFIWFXCGn9PffP2vsTeCasvH9vdyZfgF8XrbRO8BNW4l/JHEcUEG+Dz+80+ilksy1FJyo7zdPeW9leuKNwSGZalEgt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB2699.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 12:46:20 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0382.014; Sun, 6 Sep 2026
 12:46:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 13:46:18 +0100
Message-Id: <DL88SQWYU15W.2CVZB5NVSSJGK@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: num: document why Integer is sealed
From: "Gary Guo" <gary@garyguo.net>
To: <git@younes.io>, "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20260906-docs-rust-num-integer-sealing-safety-v1-1-78057391302c@younes.io>
In-Reply-To: <20260906-docs-rust-num-integer-sealing-safety-v1-1-78057391302c@younes.io>
X-ClientProxiedBy: LO4P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB2699:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6d1d04-cba0-4243-51ce-08df0c14d91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|1800799024|23010399003|366016|921020|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	AgBIMyXyQrUON8R6MiDQEaan+J1XzjDgMdYvlsAk+W+EyqyRGMGpuc0d3k6n6jKJ1lre6+qrElMPdJXggnu8M+A8fPBro4O0v0Vko/9rzf3xoDTXRNMRrlso/pj2SZumvsv8Mt6vJvaeXTM4uORV0B/z9l0KGdrfLiYZH6gXRZMRfCjVK8xPqzFUU5qIe9PYgDRYXwuwc8IgGHrBAuRuY6v+k2R+z/e+JsGsJlGm37/rR7EEMMJh3oCc+fyo3u9273ggbIppL5kDlwObk1ummU+cBceipMJbOYZNrFajRDEolMI149orDtKa5FiLkGiHjhaqVu8MdjP+gtluBA8x6UaQgdEX2tM/5irUyPyWq39V+2UEnf0pv5uqqaWz0o0dE94aLmzc4p/pRgP+/rNreXudtX0T2jFEAMzf3PxR8oBz08wAeRx+AVPCDR0LoaO+G2XUBK+75fF4s585Pp4RHbAN+Rui0OIpTkJGsGMEcvgn+nZ4ktj5kJxSIyq6luxyE92K0M0sdUcURlKxqNbN1VIL+LEcg76+Rn2eHt49Q50L63KP0B6m8TFYk+luW8n6I3SF+01E/BlXaLaLhTzXfljemY5Utkb15gFDigieHH0EIz6dPhnyMblUCFe+5B0xwKtNrg9+JXf1WoSqRLJMWcRQ7/fmvagTMZk0PRCKQcE5i3b56dwnOxKpj2yDzghGfbY9zPX1Q45Bm0sxhH8k3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(23010399003)(366016)(921020)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckQwQzl4ejdsUjFMY0dXUFVFam5qU3BaN0ZReEU1U0owT3ZrWFU4ZDN4eWxq?=
 =?utf-8?B?WWMzcm94OTNDMG1aMG5HK1E0azdLcVdCZjhocmVCZUVMZ1FoZ2crR0VpRTVM?=
 =?utf-8?B?ZFVTeHdmRjRSdFN0dTdrV3VsM1ZLUHNMRWhhUUJ0NVRocHBic3ViZFJ4NEpn?=
 =?utf-8?B?aklDc21RUGtsNmdmK2hUUnY3Ti80MXFBVWM0WVJQa1J1dDZiWlNhekltYktZ?=
 =?utf-8?B?dncwdVBlbEdRTmxuOEsySTAwajhFcGk5cFVkSzJkblN4VG15YkxvRGNSODhY?=
 =?utf-8?B?cTkvNkpCZ0JrSENnZ2dTc0s3Ty9HZnVhVHdVZFFwQ0Z3bzdvVkxGNUJzQ2sw?=
 =?utf-8?B?M0lHMTZ0Y29vWmpvdk55eFN6N3oyUTYrdFg3TUQ4ck05MEpaRjlnRHdlUWo2?=
 =?utf-8?B?eFZPRjRXaW9Ea256WW0rT29Yak1sV1FVNUx0Q2pIR09mYkxDRGFqTmM3Q01B?=
 =?utf-8?B?dDNKS1grY2JSZ1hkRG9WcThwOEhoeVd0eURseFpkQVp5R0xJd05FUlg3cGFq?=
 =?utf-8?B?SHhxdm1YWmdEeStIcG5SeEdjNkdZb2d5eWdna1EwMmpPdzZBdytvcVVBUmsx?=
 =?utf-8?B?UWl2QnBaZXI1YzNtSDNsL0NxdWZia252WFUzQWIxeldZWGpSUE5DUmxFYjFy?=
 =?utf-8?B?OXFqTXRka0hkeFZyTTFUYWEvYjJMMVhmYU85VEJxeXpjWC9QekdheDRvY0ln?=
 =?utf-8?B?SENvekpWTVlTdDhkWUNTeXJZSmVQZ1NBejBMWEtWd3RjL0YrNUtJZlQzMG9u?=
 =?utf-8?B?R1hiQjVZdWorN1VrZ3cwTllITjNZaHcycmpGUWd2ZVlLdGVodFIzbGlyUkxM?=
 =?utf-8?B?eFY4dmZOK28wQXpNYmdtYzcraVVWOW1wL2tiT3pGTFMzSzkvVnZaaC84MzJ2?=
 =?utf-8?B?WjRXQVY3MTh5b0FPUHA5TEd0TFY4TC9WKyt2SlNFeW0ySXFaVklvSmQ4cFkv?=
 =?utf-8?B?NkxOeSs4QWdrODZVTWVKTGJpeHVUZEpENG5iblpSNzNTb21ZTklHLy94S2c5?=
 =?utf-8?B?ZVFVQkoyWjRZQzdmQnpLSkd4aEpJaTFESVRzbDBSWGtRMERUM0RJMk5rM05W?=
 =?utf-8?B?ajdFaExaeGcxYUZleEFvRGhxbVZ0MzY4S1hSOXdoSG5aTmVSSHFQUmhTcnc2?=
 =?utf-8?B?T1NrUzBHY1VKL2F2TnJRRk9LZ3JibURWbzlkcStma3BETmM4clRLTzFDM25j?=
 =?utf-8?B?UmhCSDNsdGk1bG5yUVRWL29HOEJlSGtSZVhyc2dONlQ5Vmo1dzhzNG92MlF5?=
 =?utf-8?B?YnZNTEZ5TXhOZWp0QXgrcU1XZE90QWQ2a2NacnBGOU5HSUE5VHBweU5ZNE96?=
 =?utf-8?B?Y1pReGw2V3JOOGtnNlZmaDhXZ3c0Y2RqR2Qwc3ZTNjY2ZW5jalZ3TVNLeFBs?=
 =?utf-8?B?bGJiSWNETVVaM1JoSGR6ZDlBZTBVcnlEUHRlTk13RC9QSnRoVnBrbE1YTUtv?=
 =?utf-8?B?bFJGclRGb0h3V1NwS045RzFHLzU1WEY4L3BNV050RFJ5Tlh4eURFeVpucWQx?=
 =?utf-8?B?OW1TU0Q3K0lQdTZDYlhFL3BlMkZxWnBZejQzTldIWlNHM0diUnU0V2FTSlF4?=
 =?utf-8?B?dG1WZmpTOFpQbDJhVDZVVWpHd084WTJTeXpZWGk3SUxYRXNvWWl0bytKNFlE?=
 =?utf-8?B?VFRoWEhLWWIxQVlCZjRwc3pvaW90RmNyOURxV0sxam9MVnBXNTMzRytNZVlU?=
 =?utf-8?B?dXhTdUxaYWI1Um10RGxUL2l2U3NWWnQ0UTRkY3BRK09QcDhSdnMwTmFLRWxZ?=
 =?utf-8?B?ekFxWUZQdGJkQnFuQzBzcEJienhCTm03d0FhZmhlczZUMlp2anFDeHRNSEtS?=
 =?utf-8?B?cFdRMXNKZzI0WjcwMVdVMHZMczFiTE55RkJiV3kzN24rbWRHcW5ha0xVSjVE?=
 =?utf-8?B?a0p3RXhKbTBVYXRSUHdhczV1T29idXhCc05VNVhSWjJESC91eURJM3N6cEc2?=
 =?utf-8?B?UmZLZFo0d0UzNmdrRTkyai9NdDlwU1JzRHlnSEltbTVwRlVpWHhGaE9rNDMy?=
 =?utf-8?B?NTEzdm9TTjFTbGFYeXptdkFhRHFWRFcrM21jdDV1U3AxSFE5RWordUVEcjBQ?=
 =?utf-8?B?bXRIWlBvYkwybnU0TlplamRjSXIxdEI4amQ1NitDczhBQjdXTmhUWkc2RnAz?=
 =?utf-8?B?UkpLbHJBT29RbW81K0VyTUdBMkhoMzd6R1NJVTRiQys2TURQYnlYSTdSWGRE?=
 =?utf-8?B?K2NwNk9GS015S2V5MTBNOUlPd2gzNlpsaUNqZVkweEJTT3FqbTBFU3pSSTFx?=
 =?utf-8?B?ZzF6NXRydXBaVi9abWd4Y1NkTGpKTmVUQ3ZFbGJ4Ulg2TVJVWUgyTmtmaCtU?=
 =?utf-8?B?U0NldmJ4OE1wdXJIZFc4TGVKc0t0N0pxRCtvdU5vQ2RKek1xNEVQQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6d1d04-cba0-4243-51ce-08df0c14d91f
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 12:46:19.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFwiNgNDdW35wxGg42yeYVhf4J3C0Ffqu0YZPBZZocpX7tGnZfO9M1W7G6jPgrOObcC3NQSgr3iG3JYjvTDx2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2699

On Sun Sep 6, 2026 at 8:40 AM BST, Younes Akhouayri via B4 Relay wrote:
> From: Younes Akhouayri <git@younes.io>
>
> Bounded relies on Integer::BITS and Integer::Signedness accurately
> describing the implementing type to justify unchecked operations.
> The reason external implementations are prohibited is currently recorded
> only in the commit history.
>
> Document this safety requirement on Integer itself.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/all/CANiq72m8kycbfQ1teyne-OtB5d5TsUcX_WW0FC=
kWB3Ayyg-qWw@mail.gmail.com/
> Signed-off-by: Younes Akhouayri <git@younes.io>
> ---
>  rust/kernel/num.rs | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> index de589792a77a..1d06395d3a63 100644
> --- a/rust/kernel/num.rs
> +++ b/rust/kernel/num.rs
> @@ -20,6 +20,11 @@ pub trait Sealed {}
>  }
> =20
>  /// Describes core properties of integer types.
> +///
> +/// This trait is sealed because [`Bounded`] relies on [`Integer::BITS`]=
 and
> +/// [`Integer::Signedness`] accurately describing the implementing type =
to
> +/// justify unchecked operations. An incorrect implementation could ther=
efore
> +/// make safe [`Bounded`] operations cause undefined behavior.

I think this is a fairly typical case where correctness turns into safety -=
-
i.e. unsafe code depends on correct impl of safe code. I think a

    // sealed so that unsafe code can rely on correctness

could be sufficient. I imagine with a future sealed attribute, they can als=
o be
single line, so

    #[sealed] // so that unsafe code can rely on correctnes

would serve the purpose. Miguel, any thoughts?

Best,
Gary

>  pub trait Integer:
>      private::Sealed
>      + Sized
>
> ---
> base-commit: c6709d5e14072d0e3d02f291daee46a199e5dad3
> change-id: 20260906-docs-rust-num-integer-sealing-safety-3a0e2967a948
>
> Best regards,
> -- =20
> Younes Akhouayri <git@younes.io>


