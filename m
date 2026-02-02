Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020112.outbound.protection.outlook.com [52.101.196.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3AC36C5A3;
	Mon,  2 Feb 2026 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042278; cv=fail; b=DoCgM0ufiAXznEr9+IxE+CBRbaWZSneNJ3a7qTHbEd2veRZUwxp1nf9TixdsZKZRh90AgNet3jatnOYURymLbBNpWxGoFOOU9/tPb32rZa2YJ5AgL6GwSbwO/FTMKTsx2/1Worv4ZzER8S4d4/ye3Tc70kohbjg97r0ByseBgys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042278; c=relaxed/simple;
	bh=irXG/A4ocDxwC1uOV5EOwteBmFaY3rlNhof8+GhPujo=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=WZcJpGj7LcxmaEQZftRPLr9kDjAvMAi2mg2mM7Ovg/JnwLjnSbG1SxoTwJ8ebYn8R0PYPWK4mdvzplui/D18yxYU75Bjj4/LHsWvIZmU0tnrkSE8lZXGqVl3wUPiiAUkGU5bsZghyhFQskiwZ+8/Cg8xksICYED4pLTNogCMeKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HGmph4ak; arc=fail smtp.client-ip=52.101.196.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HGmph4ak"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEsV/z60SdWE6xX6GnIShG0Qd1YkCyCjl4ZalBTrtxuGRU6eskQkDw/crBoB28iyRf7U8dwir2OEHRmTsxu5rk6F4QrB4F6K43TmeOSCjevUjxdeVpNQXA5TNq2oofCBe5DV5EnKgX5/QBD47WgtoKE5oI7z75W8JpGzHHvqBuDHCV5Yx3E9YGGMjXxlujuuP8+ehxUvRggc7LzMZX9wY2aJvKOMpIHadhqFbwnh2kSlBKWheEw6RanzAct/eKYhlrLrVHTusTY1CAhan3aUrYm9zYnpvBUY9nHaMT7d9LUBBHfarBckuMJDAjioeMJquVz7QAhF3bKfETf75mrXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLah55MyapPIyZg9IPFPDYktlfDBOxC32ERc8J3UtUY=;
 b=R+iBFgIbHpDqRR81sBDfaAcePB70WfLYAhREEdUACn/K4ohy8Vsi+ZqSk4eOsu+JCqowKtMZO4oohFprCiI2lLMxxuBdR7l6SdhWnUlhj6PHPlG3il9oQYK68NCN5O7Rj5xYxuP33NOZkJfqWYfssp5Xk5tkqL9S8H4fGtj4wA0J/lsagNiPXaXsfZV/7NMm7VrTqxr+e1tFClAWJdUNpPFA8SobkU3njmSuBj6I6TfWQ//7eVywiIQFi+gtj4vvoewAX7VaPU8pyqCJbDenGq8Ukuif6IRDp4BDrpvtwdv12e+/XVXLTHI7xHA3ylEW6+7l7c8IiBi50IAUIwpMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLah55MyapPIyZg9IPFPDYktlfDBOxC32ERc8J3UtUY=;
 b=HGmph4akNCnUVafkGvZoAxn0a2lp1+uyFc9yvtSUq13F4ruFm/4SeYnVulTtvR7gig8lIkWpSqvIyUilZ+dOoEVbdw8DJMq+2ddNbR5Lwnfwi0y7WMqazUP5U6c1Sqo9dt4mijrhkMxeYrdAxooO2pWwZrJF5GYNjisTIWBKZ5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8725.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:24:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:24:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 14:24:31 +0000
Message-Id: <DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net>
To: "HeeSu Kim" <mlksvender@gmail.com>, <ojeda@kernel.org>
Cc: <boqun@google.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: Makefile: apply fixed-x18 workaround only on
 arm64
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260202222144.2689495-1-mlksvender@gmail.com>
In-Reply-To: <20260202222144.2689495-1-mlksvender@gmail.com>
X-ClientProxiedBy: LNXP123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: b70640d0-ceb9-492e-2256-08de6266c806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGNhbjgrQWtqYytZWFdoZmhRM0plYldvOTlHcVhYbngyM2dzSEdvTGNoSFBt?=
 =?utf-8?B?NG9VL2NrNE8wRitreUk2bUFKbzFxSmRrZHZPZXlINStoYUh6UDFjNzlpMGlv?=
 =?utf-8?B?dU5USXY0bmFKNERYSUd0Ukp4aWs4RVRicklvai9XWHQ4eHFlMlJ6c1FaL2tT?=
 =?utf-8?B?Z1BBcXR4dDloa0dpVU1mOGowZ3NEUVMrYjVEbGNYQWdpTk1uQjdZN0FtSmVi?=
 =?utf-8?B?STh1d0xPcnp0djdxL1JRbUNOY3dnQnRYa2dtekowemtobVpRMEFRTTk5bW1h?=
 =?utf-8?B?cmh0K3J2QjVlamR4UWk0ZEVsZlM1NjlqQkVscUFVQWJ5UzFJYUlOaGIwYXFz?=
 =?utf-8?B?MjdLZEcvcEdQSkV6WUNyQ1hZcDNEMWdPRWE0M3VlaEw4NWZTc1JhZUdLTWQ4?=
 =?utf-8?B?UFYveUpQN210Q3pOKzI2MWd1YXZQU08zV1RZNDdvZnZpYjcvcFFNT01Gc2Y3?=
 =?utf-8?B?clQxb01rOWVUU3gvNFdYS1h5Z1BtVzVuL0MvUHhsVkdMWUI5SEdUSjlqdW94?=
 =?utf-8?B?V2VuWEZpR2NPcmtxUmV2RE8zK0ZFK1U5c2k5VkFLUXFJQ3NBcTB4VkVKQkdK?=
 =?utf-8?B?UHJKOFQ5Mnhudi9VWml3bnVxckZ6Ym94TVY4VG9vcTBwd0NvaW13QW5ZbWNy?=
 =?utf-8?B?YU9McFBtRDBwNXQwR3Rzb243ZXcxU3BoYWQzdFNzaFR5eWRhckkzVWtteHVB?=
 =?utf-8?B?SmNwMjhzdytJWlJjRTlKRk1YSnVHR2l5VERmWEZzQWZQUHVVVmQ0SHVvZkF0?=
 =?utf-8?B?R1lhMG0vUUtpKy9YZ1dOYldtcW5GT0FkRTY3SE1tdldhanczaHBJai96alZK?=
 =?utf-8?B?T1JtRVBKeE9VUVdrazdSYUZXZHM1WTF4NmhJdWFqVFk2TzFYQ1l3RnZ3dlZk?=
 =?utf-8?B?OGd5MGQ0aDU4Zkh6eXBLeFFLbmROZzk0S1Nidk4yUTZjbXlPTzE0bnJRek9k?=
 =?utf-8?B?bEhXUFNGcUlSSVFnZWZHT3dMNTB1c1M2cHRzVlNpcHMrb3AvRkQxK2hxeEV5?=
 =?utf-8?B?Ly96Zy9wWWJsV21PUERmY09Ha1c1MWZ2UW1BdUlSTWRFdjdIUjdpVWFEQ3VN?=
 =?utf-8?B?eGFLU29KbDFVMm9SNkVNSFJoSzl5eFZCOWw5cnZSRlFSSWRZR1JhUnZwY1My?=
 =?utf-8?B?MnFhM3N1STFlaTVoNkx4RUlJS2N0Q0JqTkpUTDVtMTdzN1lPRzRqOHl4dXBM?=
 =?utf-8?B?VWg3bE5aVzU0aWxQSUx6OWtqT2hvSzFMQzNyQ3ByeitObEl0ZzgxUFVtdXh6?=
 =?utf-8?B?ZkdqRXl3d01ZbURtLzdiS1loRlhzM2dtSy9maWlyNS9BOXdvc1lJOFErbnhU?=
 =?utf-8?B?QWI4TUlUSGFndHAvazcxckJHMkJOU084VTJzRERHTkdtMjlVU1dxL2JsMEJa?=
 =?utf-8?B?ODJYbDVXQ05TeGtvTzFWSEE1N25MQmRoNDZmZTdydjZPMGhpN0NUTFVUdDB4?=
 =?utf-8?B?L1d2bVlCeWNCd2h3RGQxZ1l4SjhQSkVtK3JoRGs5dzZvT3plRUpjRFE2dlNV?=
 =?utf-8?B?aEs0aEdsaXVCaGhLMGV1dUd1L1BMTU1iMG5DamhFaEh5NTVoR1pxREdZbG9h?=
 =?utf-8?B?a2dneFNsa203dEVseGo0NUNBWE1iMTY5NzdaMFFCRHlZaUFDQ3BBbitRclhM?=
 =?utf-8?B?T2kyR3Bha1VqZWdDUGhqZXJqWnpyYTByWUMvWlpTbUFnQ2Ntc043MnEzNHVD?=
 =?utf-8?B?UkJ6TmhmWWJmWUZVK1kvTVJ0bWl3SEswNWdINlVPT1h1VnRGYzNSakltZzZS?=
 =?utf-8?B?WnNsMFFWbGFoa1QwV2c0bVQ5Nml1bjc1ZFN5MDJLMzZGL1hFSy8vU24zVlRi?=
 =?utf-8?B?TTRGeDZpMWpMa1o0NHBoMlNReEJmdTU0VDUzNlU5TGx0L2UrT1dTWlRLVGUz?=
 =?utf-8?B?T1dMZWN5elhSeEJqL2twUVd0SGRXTXpmL05vdnA2Tk9FZWhQVDVYblY1WGF0?=
 =?utf-8?B?TE5paFRZdEsrNFlOTFZtVzlUeWpOZVBQSzBVMFdoZ0I4RGU5WXNvZnBBckhV?=
 =?utf-8?B?ajY1bEtia0QzSXhwd3UrSnlBcmV1V1l5dHNHbUM2dUR1Y3FlSngycENXYTgy?=
 =?utf-8?B?cjRBb0t4UXdNQko0WitwRlQyR3pvWEdoN3dWZldQNEhyaE5XY2s0dWNFWm1J?=
 =?utf-8?Q?gD6A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmF0SjJ5V3d1aEY2cit6UWJSYXFDeTU2VlpsTWt5UWhkR0Zpc09oMDF1N2xn?=
 =?utf-8?B?WCsvUFJoQ0hjUjQvajlqRXdKUWZ4aVM2Z2RUOW40eVB5ME9xZ0tsUmVlRGd2?=
 =?utf-8?B?U0UxenZjSFF6V25LalVjcUJHYmREd2FiQUd0aXloQ250N2Z1cUE1NkozVjRP?=
 =?utf-8?B?amlPMVlhTmxYZ3RadVM4ZDlyTlY0SDg1MWZRdm5zejNtRlE4WkJNMkU0Znp6?=
 =?utf-8?B?anlKWU5iRXppUTZUeUlBK1pzWENqSzVLdmlIditJZnkrcXprVUVVWjNGZzFt?=
 =?utf-8?B?RTZ2NC9WRjFWbTNYOGtBNzROS3V1UDJwZENBNWlKZ0xCL0lTcGRJWU9RWDlO?=
 =?utf-8?B?Y09wNC9sNndTbndVbk0rODdJSXJHbU9UWmlyZzlncWx3N1JKcjBIbE8rYWZz?=
 =?utf-8?B?ekNmNEp6Qy9xRGh4R2YvSTBsUnVnNjdmSmdmQzVxcGo3VUthTk10Q0F3MmF3?=
 =?utf-8?B?c1NBNDFvYkZHd3VpVlBGVjJoN3IyLzFrWnAyb3JnMzFCTlQ2VTBEMStOMGkw?=
 =?utf-8?B?eHJ3ZTRFaVErWmpkV0pRSDhxSGd4ck92SkZaVWgzd1ovV0xTM0s3SzB1L0oy?=
 =?utf-8?B?c2JqR0RRYkJyUlFmME5KQUJxZ3N2Vjd6NWg3TGI0U3Z1cUFSbWtNT3haMU8w?=
 =?utf-8?B?dWNqSXVkdVk5M2ZieG5hZ3Mxazl6TmdyREdLc1hEY0xyamRFRzEraEF3V1NF?=
 =?utf-8?B?MlBNTXMwd1gxUVFaWmFpM1Rtd1Fabm9RRk1oYWhDMkxrNGVGT25GM2hMRjI5?=
 =?utf-8?B?WFdjdHNOQXdJNjEvaXYwUTdwL1NaS29ST3pWSmlCUjRtSzdKT1RIelRvVTll?=
 =?utf-8?B?cmJibDdhU1djQkFXY0VITWpuSlJUeWZJRGk5Y1dIenIwYVhONFE5amFpTHl2?=
 =?utf-8?B?LzRaYUdOdUJqZTh5QWdiaVFQNlRLNU1jWWZXRG01ZU5HajRjOTNVYUlLMXBk?=
 =?utf-8?B?YXYwR1pyZ1kxUVJxajlNc0lXYjZJMDdFb2czMHVRbStaYy94VzZFK0tRYmlB?=
 =?utf-8?B?enVTWks2Yksvb1locmFGdm1NTnFycG90YUFLSkJHWGExT2xVTFJKRlJuZDRo?=
 =?utf-8?B?L3FoaU1VU3dNOEZrUzh1Tmt1QlVnZmluMzdPVkxRMjdUbFRpN0dtanBmTGRr?=
 =?utf-8?B?aC92ZTJJaC84K2RoKzYwZUhuNkJ2aUhQTGZUV3kyM1BJaGFtc1JvK2lURmdY?=
 =?utf-8?B?UUhxTmVjZjFwTjZ6Syt3WWNrNnZ1NzllRG11YTRUSGJINEVGS2x6bUkwMmty?=
 =?utf-8?B?WWZ5N3RxaGRZeVYxRGw4UzFqUXNhUW5rNVRMVXY0RGYvUG9FTG9WVmRmQUQ0?=
 =?utf-8?B?VDJNdm1PdEN4RE5KdEJJUzRiQlZIS3lCakV6WjBEM2k5eThPRDhhbW1YOWl1?=
 =?utf-8?B?Q2VUaGhJYlNTWUhmYmhNUllmR0hFekRublNIeFFNVEZPSWhqT0lKQ3BDYVpH?=
 =?utf-8?B?bml6SWxwaGN3ZFVDa3dJaFFQSGRuTFZ6VW1aYUJaY3ZKMG9qeTBFdFFEeEw5?=
 =?utf-8?B?dStUdWhJeGZGMS9pTlNQMWl3NGtkUzFFQm1iOXFmT00wWkNrc1NTR2x0c1Fm?=
 =?utf-8?B?aUJZYWFoSTNOdWRxR2k4L01jeXdsQVlHZXpOcC9sNFhJaXN4TS95NkcrRmdW?=
 =?utf-8?B?aEx0TGF6YUdsNDEzTmpSY2hmb3Z1QU91WVZJTEIyT1QyamtTaC9KWWlNMk1J?=
 =?utf-8?B?L0k0Z0pVS1p5UldWQVEwTXl3dGxWUjd6Z1Z1QjhFQUFFT1VSQzF4QlpPeUVM?=
 =?utf-8?B?M1FJTnFlMm15WFE5N1hyV3ZiV0VQUjBja1ZEZGRqNWhUei9wQnMvc3F3R3l1?=
 =?utf-8?B?RUlobGZxZzJlRzRBVEFzRFdkaCt5dXE3Q0g2VndXZHNuV1ptWU5nS0ZFc1JY?=
 =?utf-8?B?aTYzODZDUWgzeUV1MnROcys5K0I3RGl6dVRLR3pnNXJTODhqMmFPcklCWlp3?=
 =?utf-8?B?ZHR3VERTTGlyMnNTN1FFT3dxcllSbUhHcERNYnlrT2dFb3RoWmdlNkIrMk1p?=
 =?utf-8?B?aWxlREZGT2NKaktVbWorS3BlTVdxaXlNOExvVVdtWlVVYkIvRUxKRU0zbEp6?=
 =?utf-8?B?Q2RMWlZGMWZwbVZNb2RITFBud3F5S1B2U2J0dUhFQk8rT3ZFSDVkbTdGWE1S?=
 =?utf-8?B?ZEZDejdBaFNCTDhBMGtMMFU3TVZpQVZOOFVGTW85SE5FMGhUdkE3RG1jUFJJ?=
 =?utf-8?B?c3dNUy85bEVWZVlJWjNhSS96UVF2UXpLL3c2NjFLRDZuVDNvb2xrQkpMRjVK?=
 =?utf-8?B?MENKTER3aGdVRzNhckphQUdZRlN6djk1cjAwTlB5K3RqTytvbGNVNFRJUmx2?=
 =?utf-8?B?OGNqa1JXREFOb25VcjR4WmhBaHRJRit3Zmc4WktKUWFYcjBwQmRxZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b70640d0-ceb9-492e-2256-08de6266c806
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:24:31.5859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sP928j9NKBCnjd0UAiVPn2VQtsDQ4qp4b4kXFx1c3sz5tmH6qqqcBtjFtBbWHrFpwDOpQzWyQ04wqHN95LRBmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8725

On Mon Feb 2, 2026 at 10:21 PM GMT, HeeSu Kim wrote:
> The `-Cunsafe-allow-abi-mismatch=3Dfixed-x18` option is a workaround for
> a rustdoc issue (rust-lang/rust#144521) where target modifiers were not
> properly saved. This affects both rustdoc and doctests builds.
>
> However, `fixed-x18` is an ARM64-specific ABI modifier related to the
> x18 register reservation (used for Shadow Call Stack). Currently, this
> workaround is applied unconditionally on all architectures, which is
> incorrect and may cause issues on non-ARM64 builds.
>
> Restrict the workaround to only apply when building for arm64
> (SRCARCH=3Darm64).
>
> Fixes: 68e8e79e1bdc ("rust: fix `rustdoc` target modifiers")
> Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
> ---
>  rust/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 5c0155b83..2bd547611 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -136,7 +136,8 @@ pin_init-flags :=3D \
> =20
>  # `rustdoc` did not save the target modifiers, thus workaround for
>  # the time being (https://github.com/rust-lang/rust/issues/144521).
> -rustdoc_modifiers_workaround :=3D $(if $(call rustc-min-version,108800),=
-Cunsafe-allow-abi-mismatch=3Dfixed-x18)
> +# The `fixed-x18` modifier is ARM64-specific, so only apply it there.
> +rustdoc_modifiers_workaround :=3D $(if $(filter arm64,$(SRCARCH)),$(if $=
(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=3Dfixed-x18))

It looks like this bug has been fixed upstream already. While you're at it,
would you mind also add code so that we stop applying the workaround for
versions with bug fixed already?

Thanks,
Gary

> =20
>  # Similarly, for doctests (https://github.com/rust-lang/rust/issues/1464=
65).
>  doctests_modifiers_workaround :=3D $(rustdoc_modifiers_workaround)$(if $=
(call rustc-min-version,109100),$(comma)sanitizer)

