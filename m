Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020117.outbound.protection.outlook.com [52.101.196.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5375C2E7BCC
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 05:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770614541; cv=fail; b=q++VPD8cyfhT/IDFjCMrtFPcF0b9gUJRi941f4mmbhR/ig4HVWyFffZ6IJspMrRUoXm7UCR9DXZAXBPVTVceHe1c4CmorqZuBiJQ024B7OXRa8F/63tfmFEpp8oyHbR+CpIeEWcvh1H/DdfrVbesGN49CGr4+DV1+hWfgZsHI6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770614541; c=relaxed/simple;
	bh=uvPqc9lToQboVae3rLNErDjB4oNUZcsPEtzl26D8U4U=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=sLMqgmqf8kCdYbuaqVnra0YZdr2+uZhkvf6S3EPelaanNuE8rcANvHHD7F9yVfhXwlPNY+aLY0F5OD/5wEyisxr3yLal3rYhwxxmrL7fdagjiNqAf5fFymOl3Nl3CGUH/KQYLExu156JV7Sg9g8KZjWnu2RCj5x7CXmVeFxcBr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QTN/DnmS; arc=fail smtp.client-ip=52.101.196.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QTN/DnmS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prXTzKSARLtjHkzV0Vf3ThoLSk4TQBzbOWIRPa0mQTTR2VKR0xYNM0X7qBGV6XTaz7XtPg7cELnGC/k4xsOPsRQMlm9Jk3tk4ELOGalwT+dEcxphbqn2CZE5HOJ/a6fxRSWuLzlmXe0aheqFg7B4kL/S96Vkbmx1/GE+yI3yoHrLrOqXxoyci4BHMTHfrKTwJoFbatYp3Qa+kKxPtrMIKpGRi/M+dY4QasfVlURfEK6r4AzatoG32SBGJUdFhHMSLISRA74mQ9UzyDOj6uu4YSHrLHZuLynVbbddg+gPTm2TUybqDGJDiTzjFz7V0WW51DowJqJFK7eBchnU4/J79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfiQyd2S3SPWrW3YsMmhwV9m96JWe1klI2UoOTvI4f4=;
 b=p4F6+0NrAlBPVjsQmdx7Q8jiOvzI6ApgtA6tOGLh8UYMeAfU71JP9xC7Zo0AzDqilG4jH4zNxKMFBlHw+4hW2V8qpaluxv2iaaYjAGTWVUVd0xMKOCXYX+zz7UXJiUsLaor2MG/zpqKTLbxKc5abY8CqMjf/EZuYsM+eaL7S7iWI61fW102vjEVXDQyRpUJJSqnioNKGfn6TiuLwm11QsFTocCMYcwxqv+N96j2JpcJrwIKSH1A0h9g0NSjR7JjjL375hKQXD2XJeR671uZgi5x6aTlbyVdqP08wGM5CCId0RnAdOKZXSOKSRbEYSgQPhPHk59RtRRZGfo/JKmHn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfiQyd2S3SPWrW3YsMmhwV9m96JWe1klI2UoOTvI4f4=;
 b=QTN/DnmS4CjWjLqi18VYXtJqFrFNJrbNhVWj4R6gmjJFbsxkUaYZAS47cJBh4/6ZaSMva9EESGJLsxeGHL2gauiMJBYqDJkn9e2ouz2xCgjN6+npNTbX7qpCDBHXS7xYFTkvDjYGglREI2K8Y7OXsalzUMS3+CVh5uNyf2gwN7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5669.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 05:22:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 05:22:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 05:22:11 +0000
Message-Id: <DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: std_vendor: add
 `{likely,unlikely,cold_path}()`
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260208224659.18406-1-ojeda@kernel.org>
 <20260208224659.18406-3-ojeda@kernel.org>
In-Reply-To: <20260208224659.18406-3-ojeda@kernel.org>
X-ClientProxiedBy: SG2PR06CA0205.apcprd06.prod.outlook.com
 (2603:1096:4:68::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c9790a-cf65-4e0d-a738-08de679b31ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVl4RkJrUGc0OGVvUk4rZDlmcUphd1F1UTJXQWlwbTBWSHlCR2w1OGNQVGhP?=
 =?utf-8?B?TTRYRVAwL2ZpS2RLYytGbys1Tm1lRWFyME1VM2MraTg1aHFHSjE1Qlcwc1Az?=
 =?utf-8?B?SVJuK0s4T2VmUElzaUhUMFBXSEU3Q1d2ZWpSM0Z2alZSbi8vKzdSeGxxMHEx?=
 =?utf-8?B?SHdJS2l6TXBReXJPZzJ2eStsR0h2bGtMOFRzTHZVQ0FGd2JsMVh4UzhhdTRT?=
 =?utf-8?B?M0l3ZlorSDRoaEJIUXFqSTFndjVqbGc0SVpOejMxVTlrTUVnd2dRV0tEK2Iv?=
 =?utf-8?B?eGtBaCt6UkgzdVVrVVFWSHZVRWc1N3paQnlsQlQ2aGtYOU5EdVBaV2kwR2Zh?=
 =?utf-8?B?STZLWVJhK1JJNTVuMmgxVm9ibzMyamxnNlpTSVNTcmlTSis1eGVXa1Z4Ulky?=
 =?utf-8?B?MFM2NEN6MXE4NDN6RGtRZUZjYXlmWDNkVyttWERyamQ1TXBIZ21lZG11eDdj?=
 =?utf-8?B?eTltL0lQSHdlNEhORzBBV2gzcTQ3cHFJWDRzQVl4M2hrRWd6Qng4UEFrcFpX?=
 =?utf-8?B?SlhPREN2c3hydFhGS3dtZm9ZbS85M2ttWTlicDNUbEoxeHNPbTNFU29TYXRW?=
 =?utf-8?B?cWRLcUNKempkajhFdnFIYW9DRXFPNkVZZzV0Z3Y1WDNaWER4dUozQUMwYjFJ?=
 =?utf-8?B?YnVlQ0hmRXVtUndZK0V0K0JhOEhJWXBLTGd6RkVMM2pGbkl5UmtHc1RpaHQr?=
 =?utf-8?B?bjBEakM5SzF4L3N4bFNPSy9FVmRZS0FYVmp3bTZUR21zazN4Tjhvd3phRTdM?=
 =?utf-8?B?em9FekZTanNhUlBta1A4eGtaVnBwOGs0OExuRjB1OVpaN0JBb25KYXdFM1ho?=
 =?utf-8?B?dzUxNlBTUENFbkM3NVhrWHpOcGxhYkNaMG5ZaHNMT3pzTzZBTVB6aDc4Szdv?=
 =?utf-8?B?aGdJL1dKQjNjY0FjLzl5QTVUN1QxVDNLclMzci8vd1NNWWR6bTFjVnlxQU9Z?=
 =?utf-8?B?ZnFrRms4MHJoZVV1MFcrVVA1c1hlbmtrWTRIaDkrUjBGNWdkZTM2bzUvbml3?=
 =?utf-8?B?ZHM5enRuRzBrNzcweGRCSjdOZnVRN2lPWDN6NWtQdFF6TzIwOXJzdHRDbXdL?=
 =?utf-8?B?QWw5Y2pYVGFaWFRIU3AxVTRvM0JtaVNFVGl3NkloRmtDdUJGbDNqOWRNSktK?=
 =?utf-8?B?TG0rR3JCbmhOMFp3QWdtUnJoTmV1UExsdzNvTUVhYklnVm9UUXZ1TVVndkhH?=
 =?utf-8?B?dTlTcWdZVDFONTZ1Q09pN2puYzNyT0ROREgvWTdWbUdWQVpHcnV2Q2k4Tzht?=
 =?utf-8?B?ZWRGcHJvN25aejNweDBTb1pHaEk3aWFzbTA4K1RuTWF4RWxWS2FUdlZiNTJl?=
 =?utf-8?B?N0NEdjdETGp0dC9VajFnTzNKMjBPWVhwdU1lb3hFRTBjUFJBdjNibXFFdDdP?=
 =?utf-8?B?WjNkRU4rY1hqN2NlYk10K001ano2OWRITTcvcDFkN1hlblhmbDVSL2o5eldD?=
 =?utf-8?B?Z2tPcjJYMzFQV080ckNLeS9oZ3FTQlZ6ckdXVjUzRDMwR3RtbjgxYW9KUGgr?=
 =?utf-8?B?OFZhTEdrakNKL1kwckNRRWQrMmlSRmdxbzdrLzJXcjZpTGk1Q2Yvd1ByUjR5?=
 =?utf-8?B?VXBxYzYrbUp2eTNCNlVqcFVKaUV6Ym9PWGxmbmFIVWZaLzZaa1dmY0RvYXFE?=
 =?utf-8?B?ZkxzaTluaWZ5dExUZXV1SW9lWkFDRmVSbmNXMm1EZ3RmUHUrVU5ralBsTStC?=
 =?utf-8?B?K3Q3SmxWUCtLTy9ZUEZHRS9EMWFtbDNMWmUramVQbUxrZk9hUElXSGk4ZlQ3?=
 =?utf-8?B?RGNWWlNHTkw0RWdKL0F4YzFTVThMNDdRQk5kcG9PazYzOFVxVUt0WWxPZGd4?=
 =?utf-8?B?dWVoUUppUUUxbzhnUlRnVnE3T1o1MHNSNTNIZlFrakdLc2FZbG53aCthbk9G?=
 =?utf-8?B?V0Exc2h3SlFpQUkxMUVIWXZaNmtERTZNQW4rRWNXS0xBaWQycTBYQmk5YUI2?=
 =?utf-8?B?dDRGS01KN1JZbnZsZzZnNmpmaDlLZ0VpMkczWHBsYmFzUmQzaE83c1FDNjhi?=
 =?utf-8?B?UFdwMWVsSXBVdThnSXZsZStVVU1aNWlnN3kwb3dHL1J6dGcyQnIwQnl0RFVl?=
 =?utf-8?B?cHVpWUtueG1SRlJ6LytMS2tjckdjeEJWOHB0SXFhMjlsZVBaSGpvZzV3YndB?=
 =?utf-8?Q?nWiM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUVTWTFZOERiQktaei84bVlhUXMvOXcyTlZmbTI5RlFlMGZXMllGS1FmWXVv?=
 =?utf-8?B?SXA4UDJtTWh3dGNYNlQxb0lQUnh2U2FHanlZKzVQWW80Y1RYdFpKVTI1UXln?=
 =?utf-8?B?UW0wVmFmdGxGWGFnZ2FWYXE1UDhieXJ3dERpdGFZM09kRjdxSnBwVkU1azMr?=
 =?utf-8?B?M2pZWTRLMnBzaEFZZ1phRlRGUjFHakdaeGtJd1NpYWsyWE9sWGxhK1QxS21l?=
 =?utf-8?B?dUV4SU5iN29ITFYzYWdYaTBJcmt3ekhoNVN4U1VXKzUraDlGQ1ZrQXBMYzhu?=
 =?utf-8?B?OGpEN3RjZ1M5VlZUOEF6RFVJQWxLdElpSmQvQnZiZVIwYWhOdWJmY2ZFQ2c2?=
 =?utf-8?B?Uit1MUhZRDd2RGwybjFUbWdsVDFpVW9GLytPcmw4Nk50WmtXR3EyQTVlNVpQ?=
 =?utf-8?B?NEg4UzV2cmFtamR4WCtTSmlGYmZTWU10TENxejU4OUdja1o1OEI0T2c1VXNJ?=
 =?utf-8?B?eEkxTnVsUHcvTHVqbSsvV043WmNjODBhZnRzVTFFckNpZGpRS09WOUZtMFZr?=
 =?utf-8?B?bHpBb01ZeEgzSlNaSng1UExVTTZTRURrb2hGNFJrNnRQcEVxcytWTzh5b3Fx?=
 =?utf-8?B?MldSYnNOZitRdHVnSTA0WjVhOThRTXRpZUVzb2NObHBmMXRHblRVOGFZdFVI?=
 =?utf-8?B?eVFUMGJVQjdNK2hvT3BXbDJmWml5clJGdElHbStPWkZSelBjUW5tcC9TY3pn?=
 =?utf-8?B?RDJITHJBZXZqMWxDVVA2NG1RUVVuamNaNEluR3g5Mldpb3ZPKzVuUDlONGtk?=
 =?utf-8?B?cjA1UWM0QlcrS0xCZGcwLzRxY0M5Uk9YbGRYUGd6ZkZLakx3M3AweFA5clRr?=
 =?utf-8?B?WVd3NkIxSGl2RTlvTkxhNWd1K2xUekh6SmNDZ2hEcDdwajZoN2wrWFBCZGZV?=
 =?utf-8?B?SkFKM0QwOWM1TjlUWVlGSjFZTzVvMVlqWXlDOVVtZDUxeDNjZkpFVFFWTzNn?=
 =?utf-8?B?M0dKZzBQWEgzaG1rbm9xVHplRWhidUJDbVloMTBjZFJTbGcrem44ZnZQcGh1?=
 =?utf-8?B?bWllY0FxZkhzRFBRSUhqcmlNSVZ3MUZrRWZNMGc2V1MrVzZGTjN2V01TYWpT?=
 =?utf-8?B?QUk0Tjd2eEhxbEVsSU5kUWk0MlhKVGI5VGlXejFHdlZsSTNQRnI4dDFWVUZP?=
 =?utf-8?B?SnhZZEZzdzNPZmVGQzNZMWNicnJVUkZKZ0ovak1LQ3FTcFhOeEJNdXg5K0Vs?=
 =?utf-8?B?amptWWdPWTRmNGRkRlNKcHliSmxwTzllZ0k5M0k4TGtjS2lPMXBUekdLM05R?=
 =?utf-8?B?b3FLSzY2OUs4ZS9mNkxWRlFDNzIrMDRlYTNpcWRESFI3YXBMOG4wOWx2cWJl?=
 =?utf-8?B?R2hYdW9KMXRibWhkQ003RW5ZVFFBTllNZDZaZFhOVFRjSDdvUmExVDNpRHI5?=
 =?utf-8?B?Um9QM1lHRTZ5TVN5REd0NmltWEVaT0U0ZDdaU2VvdUJpNUY0czZsZVh0YTdK?=
 =?utf-8?B?ZHBBNjBTVlRKWlQvZFBPY1BIYXRtQjZpNlFSdGxVaUNtWnhNL3FMMFVRaUFL?=
 =?utf-8?B?Wi9UbXAzd3hlbW9VRVZGcGhJbzhOeC9RdmZZQlFYTm5rV1NnUXhyUlRCRWhL?=
 =?utf-8?B?R0pwNEt5Yi91NmFIMHFNQW1DU2ZJa1VIUFZQNUwxem5sN2QrekR2c3cwdmhH?=
 =?utf-8?B?cjA3azVCWGY2SHFPbVExdmdOSU9iTUFFaUk2UVc5UGNIN2I4V0diWTZkYW1x?=
 =?utf-8?B?Y1cxa2FMeG40UjJIS3JDVzZ3OGwvd3FOVDZ4K1gxTEpxZ0JPVHkrUWFvWjJL?=
 =?utf-8?B?WG4yOEU2KzJaTzJMeDlCWU4zeWpMUlV6K0dSNlNQV0hiVkVzWU5QbEUwVXdW?=
 =?utf-8?B?MzNWb2tDR1RKM05MY2FTRk80b2YvTHhiVTUrOUpzaVM0b29zT2w3OER4QkhM?=
 =?utf-8?B?MWJzU1Foby84VVZKUmdXREdTSjk0VWhCVFJCbGZvemJNZDN1NUd5Ulo5d1lk?=
 =?utf-8?B?MTBEc0pydW5BWEs5OXBVQUE5VGsraGNURnppMWpoZFJONHFKaXAvR0pmaVli?=
 =?utf-8?B?WmJuMFZjbStPT0wySGEvWEQ5TmYySFhPY3d5Zld2WmZXeStaZERkQlNJV1VZ?=
 =?utf-8?B?Y0lhZEhvdUFkbHkxaUhMbDVDbVlmNEZ0VWpPZWM4ZWdzTXZtTXBTRUJyTXdk?=
 =?utf-8?B?TjRqcHdaVzZUL0xYbXMySm1QcDkxMzZuN3Q4QVVXc3M4eUdvakFDRjgvWWR6?=
 =?utf-8?B?YzJDVlhVemJtLzVtZVpCOCtuZXRLMmxYVzVLcnJsSUtNL1czaWZNclpLVTlj?=
 =?utf-8?B?ZC80K1VwbHExQ3RwQkFTNHhtdmV3ZitSTFpZMWhXS0lpM3JjbURmNzFBb0Vk?=
 =?utf-8?Q?blVujGBWrsqQkiq3w2?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c9790a-cf65-4e0d-a738-08de679b31ca
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 05:22:18.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Koyp7Zw/A7VuvXspomnVK26EcevXJ+LSGvfEGw5wmRHZITu8uA0+I1wWUzM6MR9IV+gpqnfoetwUBE1wI1Yk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5669

On Sun Feb 8, 2026 at 10:46 PM GMT, Miguel Ojeda wrote:
> `cold_path` is becoming stable [1] in the upcoming Rust 1.95.0 (expected
> 2026-04-16).
>
> `cold_path()` can be used directly, but it also allows us to provide
> `likely()` and `unlikely()`, based on `cold_path()`, similar to the C
> side ones.
>
> For instance, given:
>
>     fn f1(a: i32) -> i32 {
>         if a < 0 {
>             return 123;
>         }
>
>         42
>     }
>
>     fn f2(a: i32) -> i32 {
>         if likely(a < 0) {
>             return 124;
>         }
>
>         42
>     }
>
>     fn f3(a: i32) -> i32 {
>         if unlikely(a < 0) {
>             return 125;
>         }
>
>         42
>     }
>
> LLVM emits the same code it would for similar C functions:
>
>     f1:
>             test   %edi,%edi
>             mov    $0x7b,%ecx
>             mov    $0x2a,%eax
>             cmovs  %ecx,%eax
>             ret
>
>     f2:
>             mov    $0x7c,%eax
>             test   %edi,%edi
>         /-- jns    <f2+0xa>
>         |   ret
>         \-> mov    $0x2a,%eax
>             ret
>
>     f3:
>             test   %edi,%edi
>         /-- js     <f3+0xa>
>         |   mov    $0x2a,%eax
>         |   ret
>         \-> mov    $0x7d,%eax
>             ret
>
> The feature itself, `feature(cold_path)`, was added in Rust 1.86.0
> [2]. For context, Rust 1.85.0 is likely going to be our next minimum
> supported version.
>
> Previously, a PR in Rust 1.84.0 [3] fixed a number of issues with the
> `likely()` and `unlikely()` intrinsics (by implementing them on top of
> the new `cold_path()` intrinsic).
>
> Thus add support for `cold_path()` by applying several approaches:
>
>   - For Rust >=3D 1.86.0, `use` directly `core`'s `cold_path()`.
>
>   - For Rust >=3D 1.84.0, we could choose to provide a no-op, but given R=
ust
>     1.85.0 will likely be our next minimum, do some effort to support the
>     feature by vendoring `core`'s implementation based on the intrinsic.

Instead of using the intrinsics, we could use this instead:

#[inline(always)]
#[cold]
pub const fn cold_path() {}

This works all the way back to very old Rust versions, and the codegen seem=
s
identical, too.

Best,
Gary

>
>   - For older versions, provide a no-op implementation since it is simple=
r
>     (there was no `cold_path()` intrinsic), since the other intrinsics
>     (`{,un}likely()`) were fixed later and since we will bump the minimum
>     soon anyway.
>
> And, for all versions, simply provide `likely()` and `unlikely()` based
> on `cold_path()`, by vendoring `core`'s version (saving a layer using
> the intrinsics implementation).
>
> In the future, if `likely()` and `unlikely()` become stable, we may want
> to use them directly as well.
>
> Now, in the C side, the `likely()` and `unlikely()` macros come
> from `compiler.h`, which means it is pretty much available everywhere
> directly. Thus just add these to the prelude (instead of e.g. re-exportin=
g
> them in the root or in a new `hint` module).
>
> This will also mean less churn when we can remove the `cold_path()`
> version from `std_vendor` (and potentially the other two too).
>
> I tested that Rust 1.84.1 and 1.93.0 both generate the code above,
> and that Rust 1.83.0 and 1.78.0 do not, as expected.
>
> Link: https://github.com/rust-lang/rust/pull/151576 [1]
> Link: https://github.com/rust-lang/rust/pull/133695 [2]
> Link: https://github.com/rust-lang/rust/pull/120370 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

