Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.102
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795278090;
	b=RYy6iUQZP2atqT1DXP+veA9HcEHkVaauKnB63lM5yvvyX87mjt3+02HwihltsdGIu4iP
	 5xHjQM/y/eIetXVXeERoMP8Qh1erT6sEzHuuztRqAqgjIq1e+fIf7yPohksd6DhfnwXGW
	 XydoN7RxK7DHnpBr4GOCNv8CTFagwJdWpyCaJtN9qPLybMhGkrwR8n9xwAOw6r7IjIgWY
	 BTZMnUsAwbxr0IzgtXUJlksF1jQrEZYOZPC2WhZv8VRzfweBsH1+jMeerwcmUryjxJjMr
	 OuQQGbsxy4PbS3s1XUayeBIyhq9pKIDsAkXTCfXH6kdFneIai4rMasd5IGkKqbIurDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278090;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7dxK73tJ6mq2Y51KR+38Zl+0/gzHPKAFbYlyu+FmFaA=;
	b=E2HhOSy4fpL424Pi3oGC5upfqO54vwXoOVGdP3VuNuzLG0VdUwjVtZmAOlE1djRqwsa+
	 skGwX10qM0+ko8itQ/zjniqaSoNGE2JD/9uNGzHUZzZ5i3ZjDc0FhPjGN0vdGxDrphZBc
	 i0qK5BpIxkWr3jVzoUXJPMGrzmCb6Jk0XNv6r7Sr21DeAx+1/wEf6EuGVwi4PV0hT46JZ
	 y2NeJwUSHNWlMlf3S4Y8WQMDIQIJlOOqK2gDVuJdGggEcI7b55qAV1X9VeEH3xXvsAuDp
	 fVwJS9Gav2PCR2RfW9F4Et86mPoTXsFCNMw3F6MTQC+Bh6LWr5PgthC/dFg/Ga9GylQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=RU2Uxp8P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.102
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020102.outbound.protection.outlook.com [52.101.195.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03412606A332;
	Sat, 21 Nov 2026 16:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03412606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=RU2Uxp8P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEiJHPUE02vJdyJcjPy1UTxDJ2L8iOpvYHFFj97eJdF4/ul/fVj5uz1mSmprl9CpiZAxRgFafN3F7A0X/kghEi4uzEiC/P1FgxCpUXKn0Agd5BWPYZjfbC4bbSyJEuBgAGanApzA5IlhE73iKO3eM9zijmSVYY6xAjjS2U0yLynFiN9IFKD/fLcyHEcwDK8sM0WxwRoOIzxaFaufMNt3FbbHWsVo2zWGO+uJ+EWir+4LtXHqz4f1y3gFAhplGLyQmn/kAI1SKKh95QgvZZUe82wBTr/DigntwWWYT8l+HJ0F9yQpVdnMI+MEWfJwTq0sjtEliFJk5OFQbn04N5YHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dxK73tJ6mq2Y51KR+38Zl+0/gzHPKAFbYlyu+FmFaA=;
 b=Ti61lgbskpjt6ppTY/NCghMz4iLx6wrr6lnpUl2xcAU3waKCV5M8mVeBtifymkw5kD5Q2ZKn+uw1y3g31LelwdWlviwbxnsWA+xISC7YxpBbJ9ao+htof3OlmvuGWFCX3xCQ7ZCIpWUn6rshHT0anQRzkhFUGMf2W4YrrwTzx5EHwv7Ad6L4kbuKdVnYnGsUqtj1uX2sBBwUmOEPX5cjFL4H/B593Q8Q7hfeopFRCw8aqnFyAg9SH8Jftl5zWsjtgGitdyxBNVQzOkXOzJ8l08pTpCOixS/tZNzmSZ1xtQdYyxh2wZrZgf/HDDUW92TUfdy2oiOHr5TCCaXJHKHaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dxK73tJ6mq2Y51KR+38Zl+0/gzHPKAFbYlyu+FmFaA=;
 b=RU2Uxp8PqUdl9EXUKkbVZqdOg9LyQHaKuWBLuAcceBZZ+UmLwxqzme6cUViAlT/S8I9H/eH19xqcS0knIfnBdsulVV81A+Zl9CdCBbb3RtwC3oJ1GLmxvEtPHyl+Gc0bDAWJ8N3eDWWPcmPR7Gwwdfbzr1SZLtC2HfDuBGEk6Jk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO6P265MB6428.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 16:21:26 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0639.012; Sat, 21 Nov 2026
 16:21:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 16:21:26 +0000
Message-Id: <DN10YV2PJNQ1.2ZQRU6MQ9BS@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/3] rust: uaccess: add UserSliceWriter::clear()
From: "Gary Guo" <gary@garyguo.net>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
 <20261020-b4-dev_query_fixes-v4-1-df66b4c98bc6@collabora.com>
In-Reply-To: <20261020-b4-dev_query_fixes-v4-1-df66b4c98bc6@collabora.com>
X-ClientProxiedBy: LO6P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::18) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO6P265MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 34fba534-065c-4ec3-45a9-08df47eb7df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|7416014|261102123227099003|261028144727099003|261021121427099003|261022105027099003|261026140227099003|921020|4143699003|56012099006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	7YSBD09aIOUuX7bMxkg9ApOxQE6hkhB+iaS97/yYDDXQAmzLlpNCx4H8fsiKAEogtgukUV9MovhXrHCayPfCwWjn7n1fmj8KR2bt75j9bx2+Phk2cK2s2cTpSmikeBr03pTG0YnzNXUa7LoERisXEdC59Vl5J+UqGei4E40iBwvjSLLri3YzudUzhLB4IwHJg+2NwjhRSygDyJ5gm8v10s8x0IxA0BBGuUWzebAD4E68kWe6pgYbBOe23NlqAtfu8PVZN611XDssje03AiFaAw5f6A9VawddDN2BU1pCXyVIQRpwZ6dhP2SHZHqhmf1gNBlcI7hCj0TXETRoZkbV0xV4C/UdSDmowTKWeSSmvQoWWTD+34+cmB90FeU5arxBonXasMVbtd3hcMEAlBLJB4DbNqoP4T6l9r2nzzlDLNz7uIwwfdp6u2v7BdGjRCxVB0QFUo5zt9IWXIrpnpF7jlFOLDMTU43J20NyqsiV24KiuQkmscOmlb+xAHm4J+ZpuU3zU8QmTmm5L9ugeNsSV6AogjJNujM/YOEuN7ZOZF1CqE4BVsh1mwoHLXTaTNLeEG/8VLfp/JfMt4tDxoBu6bclZ2qyc1YXAProiv8QLo4Vma0H2i8n8UO5J67B8b19sZS4b4ReSGlcyS/vvnbcb8B0i/6PqM8IeNs4Ka+5ikwJfyqLQ5+e/nT5sCuV1xD2jmrrcyfJnH03edxXIMPjpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(7416014)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026140227099003)(921020)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ellSaXMzR0t4UUVjL0dXeVRXN3ZiM2YrZW96TnFHNUpNY0Y4dzA4UllDZkNM?=
 =?utf-8?B?MXdvd3RVLzRYakwxMVNJVmcxRHdsbWgwRHhtdlAwQ2lveGE5SnN3cjJIOWpQ?=
 =?utf-8?B?UkQxMVEyQ1RQUysxbGZ4MzNWSHZzdUp1RXdhajhES2hpSFJzNHpqandvWk0r?=
 =?utf-8?B?MUZiWmV4WVlNZlZvMmorRStJbHdvQk9lajJmZEVVY2cvbVlwZExtK0wyWkxr?=
 =?utf-8?B?a3Z1NlpuekI1dHNIRVZnOVVJTkIramxMdDJmL05WdEYybDhaeDAwNFc3N3Vm?=
 =?utf-8?B?TlUyZEVoaXVzek13L0lHd1VUZDJLRnVxK2NZWTJjbnoyTDhkOWY5aVlDV1I0?=
 =?utf-8?B?NVVueXJnemVzV3BZN2lXL1I2a21HOENacW5jczUvak1EeCt1VnBzcmo0VXcw?=
 =?utf-8?B?bjNicjFDcWp6MUFxRTdtNFNCdGs0cUFVeTBoY0NNTkE1ejNBSE0rRjhUM1pK?=
 =?utf-8?B?ajlTbzNuWFlySzNDb0MwbzV6Vm9VNjRYYVlBTFhHaDJlRDFqVWpaSjl1M2FF?=
 =?utf-8?B?UlFyZjhRL2dNajNPZVBIc0RudTNoYXllVVREVzl1bmdIMXl4WnE3MCtWY0Vl?=
 =?utf-8?B?TGRkbThab1pBL2t3ZHVnRnVCM2NOcWhNcGRzQ01IbDZGVi9rQklzcWppenY5?=
 =?utf-8?B?RlU5aTZMemNEa1NlRit3V0JGb05qZnNrL2pIU2tiYUw4elhYSHBld3lwd0dK?=
 =?utf-8?B?VXpFTnlWalJqVXJTWHREOHRVOXl4NURnYkxXZTJ0NW9TRGdveGliQ3VRUERX?=
 =?utf-8?B?dWp6WXhyaFRRZzF0Rll2YUxNUEdYMGhXaUVhRy9RbkFYeTQwQ2VLRUpyNHdQ?=
 =?utf-8?B?ZTczMWd4TUFrR1BaT0VTRDdEQ2ZORCtabkQrUEkwQ01DRDZkK0M4M1NqSXlY?=
 =?utf-8?B?NkNtMnprYzljbDdlZ0w4NHVaNUJEYUZlUldPSmwwZ09DejZiWnRKS3dJRHIv?=
 =?utf-8?B?c291SHFOeEx6VEZIc3ZLcFRKSEJWZ2MxWFkwRDNjL0EyMjZuK2JIUXE2SUJq?=
 =?utf-8?B?VHk0cHFsbkRrZWVyYTVDNFFxSFk5cVllYTlrV1YvczBsYnVXbnovYWRxMnJB?=
 =?utf-8?B?Y0NCcEhJb0lHWW1GNFhpaTNYU2dKaS9mTXBmeC9nSXk1QUt3eUEyY1RKcFNv?=
 =?utf-8?B?RmlaRndqQ0pWamhBZmpQWlBNMmlxQVVxWVBuNVdGVHBOMHpKalVBZXFSKy9i?=
 =?utf-8?B?NjQ2SjBrSUw5d05CS0o4VmFJSitaV3Y4Q1BWWkJ3dzBlVTg3THRKVDJyWENV?=
 =?utf-8?B?aWpaQ3dKR2ZFWkUzcGhqUWxnd0dnNFBEb2dCR3VVUXZmMWxiZm4wU0lrdUtq?=
 =?utf-8?B?cFpuYldsdUZKNndrSnIyTzVTVTNPZjRsd1dZbTdXekZYQ3hxL3NTMVRJbzBI?=
 =?utf-8?B?YUhna2g1eWdURy9ZazJiZUgyL29NSE91eGplSjFlK05FM0RSZXVYMzR2dXlV?=
 =?utf-8?B?SkttbjRqVWVCMitMSTZOdFJyUW4zVVVkN2gxaHgzU2pyTG9hOTFvd0N4VWMz?=
 =?utf-8?B?N0thT3oyV1AvTFVyRmhQSmR1YmtPODFiNlg2YjFWZFZ0L1R3T2srOGdhVmJB?=
 =?utf-8?B?clhZMHdUcm5VdFdSaVRxYUFuOWJsOG9RQmoyODFieWZURnh0YTJudFBYTnFZ?=
 =?utf-8?B?VHdZMFA4VXA5Ym9QK2N1Y2lrUElKN2RLcmhwY0VCMzdFWTA4eWpDOCtEWFJF?=
 =?utf-8?B?STNYRjVsNEZUK21qR0xNdnJiKzRvMWtTNjB4MU1xNTBKMnZHbnVwVVU3Ly9W?=
 =?utf-8?B?T2t2WThyYVliVlp0THVidW11eDNWZENVSjc4ME1EV3EzQm13K2FVTDRGRndM?=
 =?utf-8?B?cGY3YnM3YUg0NGFreVNHTDlZN2hoMkJKaXViMzhGU2xVa0ttc0szRnRpMmor?=
 =?utf-8?B?c3BXVmxxVGRMU1dPN2tVUVdNWHBnaEJBU3ZBUEd6VFBRbytMcFlhY0t1cytY?=
 =?utf-8?B?L2hNdjlOZzdmd1JLem93Z1N2bUV2c0I4OXV0V2o3YW5yNFllR0V4dmMzSFRk?=
 =?utf-8?B?a3NPZTlCdjhET3hkMGQ1QVRzWUVMQ01Gc2ZLOElSeHlPQkpteG5DZHI5MzZi?=
 =?utf-8?B?VDZTRkxHZm5vUzBaek5LVUVjVGxyVXhSemJuR1pqaVhRbjdEOG53T2VEQWhq?=
 =?utf-8?B?dithRDI0Mmc5dFp1RW52RDNPODlISVZ0TWNUaTRwM3h3WEFSSWtxN0tYb2U5?=
 =?utf-8?B?OU51YmZRcG51OWYyeExXRVRQQjFmVXlLR1Vhc0dueW1uZGJaU2ZXU3Q0U2NI?=
 =?utf-8?B?ZDFudmdHQjc5R0ZUcTBTaWUrWURnK2dZM0w4S0tvVU1MejI0WURHS1RKdTZv?=
 =?utf-8?B?a1ZpRGJ2emNYNHdIR2VvRnZiM21lRnNhVkpYK3RlR1VnNXYybmIrdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fba534-065c-4ec3-45a9-08df47eb7df7
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 16:21:26.6879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0n7E0CApSgDKL4ucnsVa8kg2Cbbdov1MDzSvNcEo5jCySt0FbzpwerzR7lIPmZOXPFxQ3PlkhpBSc0gNQfnh/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6428

On Wed Oct 21, 2026 at 1:06 AM BST, Deborah Brouwer wrote:
> Add a method to zero the remaining bytes in a UserSliceWriter.
>=20
> If userspace provides a buffer that is larger than necessary, provide
> a method to zero out the remaining UserSliceWriter buffer. This avoids
> userspace consuming potentially uninitialized memory and/or mistaking it
> for data intentionally provided by the kernel.
>=20
> Use the #[inline] annotation to make this clear() method available for
> inlining outside of the kernel crate.
>=20
> Since clear_user() is architecturally defined and may be a macro or inlin=
e
> function, add a rust helper to make clear_user() callable from rust.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/helpers/uaccess.c |  6 ++++++
>  rust/kernel/uaccess.rs | 24 ++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)

