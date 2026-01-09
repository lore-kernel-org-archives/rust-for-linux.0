Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021090.outbound.protection.outlook.com [52.101.95.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A629335CB85;
	Fri,  9 Jan 2026 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978306; cv=fail; b=dIpfK0WkdqfooXdetARWIgdw6V2k56HbgaPa1Zjwc5bKeJtjmosADqGDSuen6qlWE/0FbP5UqqIa8c/Js+A2O03UsWOlTNWqxcExQjzk3ZutEEkLz4RLNdFyfn7Z3ZSZicoHZbN8piViUXS4w5faefZ0Ti+KdoD4ThaQQPSqgfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978306; c=relaxed/simple;
	bh=c717a6CNunuWHnhgWi9AgnLuRz8Ddsw0E2ocGRxyq7g=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=oj7SQfxEakcLJGXAbRfXrndnSt31OpWLMuhIQH2YsW+Aaaj/RKGp+0PU37yJgOimvziFxA7JkdAtZJUVuyGKr94sljFE81Gr7yU11cNTRPGdHZtyj2Q9TLF6GmUGcbU0Z1niOVK3TCSyasFrun4mUKnw0sey2GZJRqtZuOXOTDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=V6BQDBjk; arc=fail smtp.client-ip=52.101.95.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="V6BQDBjk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khpXMMsNKJdJmpJPgqIG8r1+UpISqtMdT8pFEzd8nj2IdI6IFvncUg+6r0bq8bNwDadQT2W8fJk+eSaPd1Cn4uCJv8QWpQRFhhJKrC0EyIp+5eugR385L7z1RZ47satVehgUQje7ZI1+FHIYnmo5tdNjBLGuxEdOJQmnYyT8OyQKPG5EbKN+SaUgGPoAnsDV6QpuKnFx1Cq2rgs+Jw5ydECVOeKB6caNTQwYBAEhKbXJPGHoTiytKjFA2jtKzEQeoQgVjhoyzmQ251DnZihWbdqNTQeYGdDZeoEHLi4zgpUBFG2c2Ytu+dErTrAcHS9up9mZScXASn3uXhxnDuHmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBMh3h1ZJNrFzikvWQ8ENoNgzWNtzjNBc3yUmxbiW88=;
 b=fpRcqDTCqQmvaGAhLDSreNQUbwL5zdFZKfiS9j3sBBFeycTJrJ00Zad5K4DN2P7yTmnJjbdbvOZBJmZicJZlNaKqS7z29v+bik+OBbzzb+6NCevrfrudu6iy26ENGru3v0k/XgbVGYBkZqaY/tkDL4/GIiaJfxRkUQ/8ZD1MM6rDH9tzhzlOLNIRMjXFEFApyUt4Sl09IcHVa5xsbI0bWuFXLpHJDthfd9Nva1AWk6zFsQLQt+JanoJAwg38yott8G3fCY903pm1hB1q1rqrY9+MttVBCcfBZcjnFSfDAqTlDkMEEr8XZkcicrXbvdAhZoMR/OlfANv8081ayyerjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBMh3h1ZJNrFzikvWQ8ENoNgzWNtzjNBc3yUmxbiW88=;
 b=V6BQDBjkP7D4XT4AFGkIrPh5MVqqdBck2skvNaxSCrCL/ZVGLCr6Lgkmg2B559K+X26vGg70jMtyPr9VBlThYmtuSSR/FRifySKI8qMjux6XNG7N1+m4/tdk2JcjoDJKNAv9W7SvJJIe61I01ZzfCXMNlGMoN02tEKZoZ9kqrYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5068.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 17:04:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 17:04:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 17:04:58 +0000
Message-Id: <DFK801ZCI1GD.34GWJ10JZBBBF@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@gmail.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Gomez" <da.gomez@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/10] rust: xarray: add `contains_index` method
X-Mailer: aerc 0.21.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-3-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9mqwaWMc0MTGOk+rKSM8W8spRmwiLGCkEjcSvF+d7QW7g@mail.gmail.com>
 <87jyxtgtlc.fsf@t14s.mail-host-address-is-not-set>
 <CAJ-ks9kYk7cuQFOK89OwUx+k8p+_kANjB12rZLO+dzfSd=BpdQ@mail.gmail.com>
 <87344gh2pk.fsf@t14s.mail-host-address-is-not-set>
 <2PUnbrv1SBqe3PHKeFqFI7zge1N89qpwH_FF_pXszbaA9-ocBueRJHb0KcuW9EyPNiZFCaCc1vgmTjXP_u_oPQ==@protonmail.internalid> <CAJ-ks9=JJ6S6U-Bq0WC1PfJ0P9G3PvugfDdE2q9Q516M-QpsoA@mail.gmail.com> <87o6n3f4uz.fsf@t14s.mail-host-address-is-not-set> <CAJ-ks9neiwxL6WhK1i0qPtZCGjfEFsXA6J-yVHKmZcwZ8RS06A@mail.gmail.com>
In-Reply-To: <CAJ-ks9neiwxL6WhK1i0qPtZCGjfEFsXA6J-yVHKmZcwZ8RS06A@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0421.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::25) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e06329e-2f81-4397-86fb-08de4fa138e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEc2ejBraEhEYjZ6NWNFbm5hakQxLzdnSFZJSlVqdWxtckhQQVJyMlhDMFMr?=
 =?utf-8?B?azNkdk5EbmNXOGQxN2U3YWp2MVhUbEpNNldLYWJna3lKV2RUNWtVRkNKY0RK?=
 =?utf-8?B?bi9pa1E2R3YrcWt0eFpmdXhYMEtzaEFTb08xZmxEdDgremtzOHVyMVBoY1da?=
 =?utf-8?B?aENqaUdWaVowWm96MTlQb3JYWEhUMUZVYzIyQVdzQkZvRnNFTU9pbmhCRE93?=
 =?utf-8?B?RW5zZ20xSThlaUpaS3F3U3dGNHl0T0hYdHI3Wk0wY0JZQ0ZDT0g1QnVPMER2?=
 =?utf-8?B?REtYaVhLSlJxRmlWQWFYZlBIQ3NaeUQweGhmQ01PampyRU1STXBmTUNYNzNt?=
 =?utf-8?B?YVVVK0NRUE5xdFdxR0haSGdXWVllZ2R6OXNGVVFGWlpGMERwZHFsNERuSWZV?=
 =?utf-8?B?bXRPRVVPbmFDZzJBTU9ranpiMThwOG55Z3pEcGIzR05UZHpPMlJWaFhIeHEw?=
 =?utf-8?B?Z2FnMTBNRVk2Q1lHNGdtV29Oc0s2ZVgyMjhQaWpkTXBuQzh3SlhIeGNqZDVI?=
 =?utf-8?B?RDk0ajgrL2N1QmwyYlZOdnF0UTlBcVQvRW51bWJlQWNoSmxhcjlrWnFSVHg3?=
 =?utf-8?B?MkVhOUF2azErZG5UVUxSaUpucnNPbnF3WUVxY2F3bkhJMW40YTgrTjk4L0gw?=
 =?utf-8?B?Wk9oV2hWcWM2N1BHa3RWdngxRHJrMURGU25CNno1cWZLekFqUUZBY2dDTU9P?=
 =?utf-8?B?Y0hTdkRrWXNjRzZWTklqcnFaM3pNUFRTK2JMRWFjdkk4b1NYTllUQXBvcjU5?=
 =?utf-8?B?QkduZ1BRZU0vaDdJL2gwMS93NFZsbkNFbTZSWWl6ZnlUUnlqeGpKK2RuQVhO?=
 =?utf-8?B?V2ZyQUxHb0U5bVFqcVNnbW9raHA0N2pDTDlPWUFzaVA2dm5nWStlQmlFU2Jq?=
 =?utf-8?B?VmZ5M0pySWxGVEVWZXhYWFQvcUszVnlGMzNmZUZhbUQvVEx5YXBLVXhIa3Z4?=
 =?utf-8?B?Y3RQTE4vT015NkVDdktOT1BNRDBvbjhOaDQyM3pKZjVBRjJTd1RBUi9HWWJJ?=
 =?utf-8?B?R2tCcVZvYlFkV1dNZVhtOFZaVGh3alFLazQ1VitHeVdnbnRXakNwWm9NVnJa?=
 =?utf-8?B?aHYxWkxGSkpVeFg2RGREV0RQbDh6Qk9pOCt5Vkk3MFJoeWZoTzg5K2RrODJK?=
 =?utf-8?B?Z29oR1QrNEZzK3FtZHhTOEw2ZVBhaXRhL0V5dm1HcFk2WGtoUTh6N1JvbFI5?=
 =?utf-8?B?UWZjVnBnZXVmMkQyZHFCSVQrZmhPQTk1TjVBK2ZhaFd0a3VGNmExbmJteCtS?=
 =?utf-8?B?cWt4THZGNWNWUEhlRlhYbllRTDRIZFltT2E1VS8rUkk1NDd3U1JDN0xZU05n?=
 =?utf-8?B?djREUVExSXNGaUtmSGxSTFRCankzRzBFaDFjMXBLTEt2N0lxNW9uL1BkZzhS?=
 =?utf-8?B?QkEzWmRja3RTT3V3UUtOTTlWTis1Qmg0ODRPeDJ5enV1UWhXanh6OGNxb0dn?=
 =?utf-8?B?L09xUisvek94NHU3MFlDWk9uRy9GdlRab0c4b1JvYlZvU2NORUE1K0k3b001?=
 =?utf-8?B?S09ERHdnaitnSGFvRlJJeG9YVVBTZjY1d0tQdVlYWmVCZ2hLZjZYL2RsY2pm?=
 =?utf-8?B?RmR5aHZ4a0svSEJMZWMycmtXSWI5SFp4TFdDbUE3VXgyV2hJazd0RWxzejlW?=
 =?utf-8?B?eW96M084MU4xbllDNy9lV2xYR3hVd1Z6aThhcnRYRnNKRDBlQmZ2bjhnNTdn?=
 =?utf-8?B?SzVLQW94MmcrSnhzd2JPYzhnSnBYL1dSSEVEVVpjc0pWMkxoWjA0WVlub2ti?=
 =?utf-8?B?Mjk5aEg4QWk3Vm5ZanhRekhsbldZWC91bEZmNW9rY2JISC9nSURxUUJRY2F0?=
 =?utf-8?B?MUtpSm5PbEVaQW5JRm5KcUowZTB5cjBqUG1sOStKOGxsNXowdGI1S2k5Kysv?=
 =?utf-8?B?NlVKU2JjTUUvQnYzdzhMbE45S2xsNVBIcGlvT1pGNmZySFFzNW9yZVltUXpT?=
 =?utf-8?Q?KsLcrPdt7rzgqVxHMYc+F+cd6oSU8AoE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTBWMHBLMU8xcEx4VU85U0Q1ZTlvbDYxZzdieHVaZFR1QjI5bm9YMjJoM3ha?=
 =?utf-8?B?eVN6akM4NFVQL2RZTjd2c3NxSFBab1hBN2tZSitvU3UwYW92MzFYUG41cXpB?=
 =?utf-8?B?TTgxRVUvcVdXR2NzSVM5TzVDN3BodjZac3FDNTQwdTZWcjZBYWZxaHM2VkFW?=
 =?utf-8?B?dWtSUkM3WlFHVFJkMllBOEtpM1JzUFpzT1h1ZEYvd05jMjJrTkUzemZoUDcw?=
 =?utf-8?B?VHRRdUhuMmhWVWhadm0wOGxuMFNTTGUrM0poY2J6RnFBeDJJM2ZkYXBjcEs0?=
 =?utf-8?B?RmdUSEc0KzhkUEhjeGNzOC9UaU5yYTFLbFJyeWxaNkJvb0p5b1NmTVdxMEo4?=
 =?utf-8?B?Y3BGR2RCSmpYMFJLRTFocnZIZzU0R01MZTVQckR5ZGlERkFmdEl2bmFSR2tS?=
 =?utf-8?B?a1FUdHA3K2E5alBZTm5qcUc2TVFIT0RTSnFNU2hNcXJRenBFenE5UHRsYUdC?=
 =?utf-8?B?c3kzWDJ3SEgrSHU2N0Q0c0x0SU8ySFA1VDRkem03S01naUpJMEU1N3B6S2Fj?=
 =?utf-8?B?ekYyN1EyRHVCb3J2c2IyblZYdnU4b254bnc0eXZ6bnVmWTcyRjJGUldlK0Vr?=
 =?utf-8?B?QmVCa3FEY1IwR0ZDaEgrZExVUFhKbWxkazdoV0dmVjFLVGk1TFU1TWJja29q?=
 =?utf-8?B?Mi9XZWpjZ1NKb3FUcUt4bXFheGMzSnlhT2NLNjB3YzByZ05iOEMzWCt0a1Nu?=
 =?utf-8?B?a1RqU2JRN2Zva0NHQUxEcXJJdlI0aEFRTEN0ZXppSjJ6ZnJKcFFPS3FqMktJ?=
 =?utf-8?B?TGVKa3ZvK25kaFFRNUNDYkJPMVE2VDB1R0pSL1BiQ0lVRTBYa09LZ0JKenJE?=
 =?utf-8?B?aHYyYW1KdllSTW5yY3g0Yk93UkVGck9FNEQwRXRBZVdIMVZRNzdhdHFZdkpK?=
 =?utf-8?B?NmJtL1RwUUEzUDMxMjRNTHJxN05kQXNGSGZXcmtJZUx4YnF0Skx0Qk5tSUhY?=
 =?utf-8?B?K1lJekllR1J3OFhNVWszNXpEcWFWVklYZmJ6ZjBHV0kyQVcrbng4RDFNaUVu?=
 =?utf-8?B?d09ZSkpaTkQ4UEF0S1Y2YldYSXorM3ptRGV1ZWU5YnBZYUhoZ2V6Zll2U1lk?=
 =?utf-8?B?ODhMenV3cGZRLzRYMjBtbDhGcnVUTTNxUnNVQXJkcEI0ckdMSDZEOWlJOWd3?=
 =?utf-8?B?azExZnBxU09kMnFOWVVseU9DVG9IV3JnQnJubktJTkhWc3F0ZUxjamdPSWM5?=
 =?utf-8?B?ZnVMeFlwRUNPOWIzS2tqS21ZeFlScFJVY3B3VWN2ek1VUDJiY21RTi84QWJG?=
 =?utf-8?B?VmlIaHpqSE5sd0sxME85SlkzV013RUM2WEVkWXRPRk9ZMU54TklRU0hTdzEv?=
 =?utf-8?B?aWRGZVQ3SzE3VVlNK3lncGdhd2lMUnhBanNrdm1TbkFwTlRKSFRGSFg0Zkda?=
 =?utf-8?B?aWx2QVI5WFhnSjFjdEsvaGpJdklndXArOUNoVGRlYUw2cXhodjFIK0xCKzBl?=
 =?utf-8?B?SVBHbEV3V1E0SXFjTkVRdFZOd3Eya001WUx1eVFZTGVxb3AzOFU3ZDFmV094?=
 =?utf-8?B?N3NYamk2N2E1V2k4bzJTa1ZocU1JUTlja3JzdmNobDluNXNjc2FqalhvakZo?=
 =?utf-8?B?VnJtVGV4NHpCTXJhSmQ4QytGak9vZ0tmVlJlNVJaTVdaUExaL3VuVE83QzBq?=
 =?utf-8?B?REtzZk11dGs4cHBIMndod1V6RUNOTTEvdHA4K2JkTERKTHlaRmk4WTZUNUVm?=
 =?utf-8?B?L2x3RFRkUktlWkhJUCtsajBaenZ5S1o3Rnp1YzZqQ3g2NTk0ZU1GakMrOGJL?=
 =?utf-8?B?SmIxeG40Q3BJdW5KODNKcUMyV2ZhazI2a2FSTzlxRWpGUE95TDBCemNvQmRa?=
 =?utf-8?B?eGlUOTdnTlN3b0Vld3FtM1JKczk4YWxWSGM5VWwyOW9ZNGtPSXRjUVFKZkRl?=
 =?utf-8?B?Ty9DaVh0ZE5jT3FmK1ZGczBlcWF2akxSK1IwOVN1K3FCbDZ2dVNLNC9WS0hm?=
 =?utf-8?B?cEMwdjdZK1pqclRieW1sdi90bFkrcFZKVkdZTHVJL2NJbWdtQVJaTG5mai8x?=
 =?utf-8?B?aE9CZmYwei94OW0zZnEyK0E1L3VPNnUzdm9Cbm92ZWY0MmNaMk9ybjFMc0FD?=
 =?utf-8?B?dkwzQzlkZWI3dUJvTTR6V25kTU0wRHpZOEdzM1FoakdISlpmQ0Nhc1NSelVz?=
 =?utf-8?B?cGNhc2VPK0NJM0F5SWJLVE1xRnM0N2dTZmdmQW1sNXBSWkFIUDRtTmc2aVkx?=
 =?utf-8?B?S2NFTGJ3cjRPbjRLcFp1cVo2NG5GQUxrU3RBK0Q4cmhzYTh0SXhWNUZFUC8z?=
 =?utf-8?B?VzhaVDNUYjJaVWRiUTdjOElySFFCaVlUN0ZlYzEzOVE2aHlJcWNMY1g5anJX?=
 =?utf-8?B?ZXBRUVB0MlFXUHNRSUtsaTZOZ1JKN0JOVWtjMkQzeU5CbXJTRUY0Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e06329e-2f81-4397-86fb-08de4fa138e3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:04:59.6756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUXwZOl2XYxTsKmqMkxcU4F3bjEIp2maaMOrYMO9r0ZRrKZObb9Sc/5+NfNoTDN7SIuLxtyRc36OhdZR6nSTWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5068

On Fri Jan 9, 2026 at 3:59 PM GMT, Tamir Duberstein wrote:
> On Fri, Jan 9, 2026 at 5:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> "Tamir Duberstein" <tamird@gmail.com> writes:
>>
>> > On Thu, Jan 8, 2026 at 4:38=E2=80=AFAM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>> >>
>> >> Tamir Duberstein <tamird@gmail.com> writes:
>> >>
>> >> > On Wed, Jan 7, 2026 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg=
@kernel.org> wrote:
>> >> >>
>> >> >> Tamir Duberstein <tamird@gmail.com> writes:
>> >> >>
>> >> >> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindb=
org@kernel.org> wrote:
>> >> >> >>
>> >> >> >> Add a convenience method `contains_index` to check whether an e=
lement
>> >> >> >> exists at a given index in the XArray. This method provides a m=
ore
>> >> >> >> ergonomic API compared to calling `get` and checking for `Some`=
.
>> >> >> >
>> >> >> > It isn't clear when you'd want this API, and neither this nor th=
e
>> >> >> > example are particularly motivating.
>> >> >>
>> >> >> I added this when I had a line reading `if xa.get(index).is_none()
>> >> >> {...}`. I think it reads better as `if !xa.contains_index(index) {=
...}`.
>> >> >
>> >> > What was the code surrounding it?
>> >> >
>> >> >> Do you have an idea of how to improve the motivational factor of t=
he
>> >> >> example? Writing motivating examples is not my top skill.
>> >> >
>> >> > IMO writing a better example is not the issue; rather it would be g=
ood
>> >> > to understand why you need it. In my experience `Option::is_none` i=
s a
>> >> > smell, but hard to say without seeing the surrounding code.
>> >>
>> >>     fn get_cache_page(&mut self, sector: u64) -> Result<&mut NullBloc=
kPage> {
>> >>         let index =3D Self::to_index(sector);
>> >>
>> >>         if self.cache_guard.contains_index(index) {
>> >>             Ok(self.cache_guard.get_mut(index).expect("Index is prese=
nt"))
>> >>         } else {
>> >>             let page =3D if self.disk_storage.cache_size_used.load(or=
dering::Relaxed)
>> >>                 < self.disk_storage.cache_size
>> >>             {
>> >>                 self.hw_data_guard
>> >>                     .page
>> >>                     .take()
>> >>                     .expect("Expected to have a page available")
>> >>             } else {
>> >>                 self.extract_cache_page()?
>> >>             };
>> >>             Ok(self
>> >>                 .cache_guard
>> >>                 .insert_entry(index, page, Some(&mut self.hw_data_gua=
rd.preload))
>> >>                 .expect("Should be able to insert")
>> >>                 .into_mut())
>> >>         }
>> >>     }
>> >>
>> >> For lifetime reasons, I cannot borrow `self` in the taken arm.
>> >
>> > That's surprising. Couldn't you destructure Self so that all the
>> > references derive from the single mutable reference &mut self?
>>
>> I don't think so, because I still need `&mut self` around to do the call
>> to `extract_cache_page`.
>
> Hmm, I must have missed it before, but can't this all be fixed with an
> early return?
>
>          if let Some(page) =3D self.cache_guard.get_mut(index) {
>              return Ok(page);
>          }

The returned lifetime needs to be same as the lifetime of `&mut self` (let'=
s
call it `'self`). This would mean that `get_mut` would also need to borrow =
it
for `'self` (mutably), so it cannot be borrowed again, mutably or otherwise=
,
later in the function. This is a classical category of borrowck false posit=
ives
that only Polonoius can address, not the current generation of borrow check=
er.

Best,
Gary

