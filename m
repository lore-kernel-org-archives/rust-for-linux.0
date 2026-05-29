Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020126.outbound.protection.outlook.com [52.101.195.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A43E1231;
	Fri, 29 May 2026 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780057073; cv=fail; b=ME5cYd6q1s6ZLZNVAOgUJp5zUDFCwDE+vuVwZyRa/Oi9Y1DlIwzLmWpAzNW3p/YqrRjKzbE/9Ufh+l2IjuIkQO40TlwwFB5kW5+rsMSuTww4xE2kpBrIo4T3CoePjSJy+VI4OMkSPQLwrxmLct3jxWnjVCnxSU7jRTemMcg0sKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780057073; c=relaxed/simple;
	bh=pv+35rmrhhzo39aOW31RQ8XJ8Bwz+viZU2Jh2CyimU8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XT8eqLErBthoY4Bi11XtCips+Qq0SwPojSABV3VtQEpjLDJVZjn7jiQsmf6+Z4To/BSn88fSqD7LsEoZ2Sa+TM1P0AEUvybv1q7tWE9T0NP2Jadn0t520UKuKmh8yEK4uVOPLOXItQwXYMot/zoOyMLE0gGy7Q+DjkwsrYHCK3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kcCMigjk; arc=fail smtp.client-ip=52.101.195.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kcCMigjk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFy2xBI39bS6JUi33/FB31ul10w46rEdH/WHRX8pzwWZJ/+7ma0A/Uvt88jH49jvzewnUUmG/BkvGUdL4VDzESBQ2R3N340qIH7VHOx/6nlBI7ETTIJU3kvhb6sA+e+Ezrzexh1uBxXMbUcTzHlxNhhldHKFYt87orWnWd5oJsMfQLUK7NfZdx3or92UXC4z2qnBpTNpG81xCctuU7GvyB7NeBOGUB78lDvSHh2O2JNf7s8cm6PvdIGQfm7m5TILfxik1ry84xTXe1pXP7phnhv+Z/U+Qp6hGUJZYqGaSd5cF2b6T5NweXckGUTNIr69KWx6yg+hVE7Bsfx4lEsCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evFSl6reJy3lq4Joswy8Q/5XrD4+CnW9uJ15pMopzcQ=;
 b=nQXgpjbFdPviRDorE1pYmx/UML7mToHFJgmVY3C0LCnzInjnPE0mZda94Vkb4B8V1+64ZF8Mrcla+CZ2zoO8hrOiSJUCAfyMcv07Svp8U2RedvDHz0hFypxUt8celrqJy30qvLYEkMm5unIX5hACWjTaI5Yw6LT6RFfyL8/h5WK8N9W7C0TBc4YDKMNH2qjKW7V1W7qP6f3Ol1114oVpyY7DoB1k8AIQ2XevRh/yQ65/icR9IHMLXfOVb1bC7Fsv9CuMtxaonmOUfNOTipLaD8rnsbI5ayYUUA+8h5zP38t4Y0UcSzJhcRhvldEscotB64Tv0PL8ddvFkRlNmDhMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evFSl6reJy3lq4Joswy8Q/5XrD4+CnW9uJ15pMopzcQ=;
 b=kcCMigjkXnvHlurUUZYbKzTITE8yG+Y6/56qihlBo5qKsuTsijr6mT/4f7C5H02aOhwMMsfXWsgAVKklLD+YNY4wD/xT2d8pmHjAVcfcJtDSYVUgeoDtSOupL6C16SO7q74IGx/Ep1zyAtagqifbfQxXq0AamRN08+NAVg7ncHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8757.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:489::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 12:17:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 12:17:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 13:17:43 +0100
Message-Id: <DIV5KDONJ2NX.1HCIRZLQBZTK9@garyguo.net>
Cc: "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: page: mark Page::nid as inline
From: "Gary Guo" <gary@garyguo.net>
To: "Nakamura Shuta" <nakamura.shuta@gmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260529085316.27432-1-nakamura.shuta@gmail.com>
In-Reply-To: <20260529085316.27432-1-nakamura.shuta@gmail.com>
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: 99799805-a65f-47f3-e46b-08debd7c4b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EifIeGHu8I68GNnltzqDmeQvlhufJsdLV+nd6JuLfUbD0ZUKirllpHTIPqB6+MDmhBzwYKiOP2bnbZR0TSo4tuo3+efHSr/qOYdfGFRF/gMPXARm9gk+7uxoe452PZ/gPl7yPjmHct+cR8w/QBH8bKM+abGlc8PvuxAvc8ZrICpQhGmJCCBgJdWvfYACdobUlQ68JMevRqkk51n9cufW6bcmvRn73YWb6E+gYTb/BQWhlU5ymHJ+i647VYcUUFvmRQuuVoxYOKQMsIafNy1y0fqEOpgZZjO1FNNX7RGl7JFvvmNc8dBN6Vv9G6wJjAXkEnzMfcgURe+yGIXixwAD648gA9uOTgyJg9OTLFidS/13PE4zuv1piDTzPRBFvVluTExqU4KTHA9I8H2k2cu8bUjPt+TnWg/4mx7FcT7o6lc+Li1pCa9yM7/Z0nSvgwlIvC9MXmuHoFWOfSKjmhU4KVJf2fdKLSlPiZKh+5vqTg6NXb2ZlA0KOYQ9+CI8Zga8ow5WMdG7Zk0GfccToD3mMD7EsNtPAVA3A76AvW5x6qtFopdMFDdthCjN7GjwU7twSfmhpVC00TX7m/TKVL3dGNLMAPivPsr01o7OjHHW5UGEOzqHnRoNBr4CGW/Z/Y7jMId+jpA+F1Z0llQTSR7mOcZ/hMAJ4yFwy93fryXiOXivzO48oJjxAOynfAPHwMPCWjQQ9spZTxFFgIBwQoklog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTRxclN4c0dUemlrajRNRmYxNlNNSkNNZnlHUloxM3Y5YmY5NmZsU05TVk5o?=
 =?utf-8?B?c1VMbDRZNzM5RmpjaTY2ZndPdElZRzM4QXMzamMyN0R4UTh5L2N1cGRXSTdQ?=
 =?utf-8?B?aVVlSU1LZHZveGZYaE1JcjdvZnVSQnd4QlVkTVVFWlhTYTNneFE2Rk5NWXFj?=
 =?utf-8?B?SzFyR1pXZWZINDRrWjgzUENNUG10UEV3Z1V6RzdsdVBGZmoveVRWZy9OYllS?=
 =?utf-8?B?SHV6cGxJRlZMTy90Y3NBR0ticjBmdG80TUtiOHZLUldpN2FSK0dRTXN3dmV6?=
 =?utf-8?B?QWRHblk5a1RHSXRRSDFSQVA2a1FoUFN2S1pKdHVqaTduQTlNM2ZjNk11dWdE?=
 =?utf-8?B?WUxEa0J1cHNBME5CalJoKzNLY09yM1JlZ29OTEtiMjQ2bjdEN2N0K2dVWGVJ?=
 =?utf-8?B?NTF2MkhoazhrRUw1RXIwVHdpNTVCTjlaVXg2QVJ3R3BVWGc1bE9KUzExaHIz?=
 =?utf-8?B?eHdyWW83bnVXVjBrZGZueUsxN1I3M2xxNEFSejBaMGZpdmdVUDF1dFJMMTNr?=
 =?utf-8?B?OEVpQk9VOWVXbFBmY05TM1BLdDBUUGdUWXhLd3VwVmE3TGlTVGs3SUtpdlBL?=
 =?utf-8?B?SDIwNjkzWTJCMnJyQ01qRGZ6WEZIdnhDYmtVczJQUnFwSUVuRzhyWjRUT2F5?=
 =?utf-8?B?NXhGTjlFaUplU0dzNnJMWXJza2dBVS8xZWsxdXhvMGliVmF0dmtQL1lvTUta?=
 =?utf-8?B?NGtHb3pDK1RocDFSeTFzM1hQeTA0OFQrUUQyMUhrU0V2MVN1ZkNQQzVSTm9N?=
 =?utf-8?B?cFpBYm5kVVFIekdhZVloMkNrTWpzUlRjNndHR0ZURDhPNTc4R3lyRlhEV0tQ?=
 =?utf-8?B?MENpL0F0THFLeWdPWlNvZ25TZ0ZnQXV6akdsUFRDQllVcWpCL3o2Q3NNamFo?=
 =?utf-8?B?QkF0T0pIWnNCREhLUENvYnY1TW5CTXlrNjNFWHJiTUlTaXZzRUp1dGpVUGhk?=
 =?utf-8?B?b1Bmc3pyeHduNUgrckZ3WGdyRzlXV3JYUy9tUWtRLytEQWtxS2g1T0NOM3Zv?=
 =?utf-8?B?eitBQlJqY0JPTzNQQ0pQVUJ1aEdaYk84L2lEc2dzSG03SFVIaDhlYllnZ1g2?=
 =?utf-8?B?YjlqcFcrMjFoMDk0STlkb2cvcVhCUS9wVHMzM2F1Sk9nUmNwQzlueFoxV0Nu?=
 =?utf-8?B?NTZtZFpPRy82dEZpRUtRSzl0SHVnMHc2Z29FVDVpUEM4TVEwYTdVUWRrWFJ4?=
 =?utf-8?B?aVl5V1IyTUp6Wk9RNzd2TEdpamp5cnhaTEJHcy9UQUtnNkhMSDNRRDVDR2Ju?=
 =?utf-8?B?dk0xaXorSW5WUWtNd1kyTzVhczYwclZFNm5jbzR3TDZpSGtuUVlHMEtkdzJo?=
 =?utf-8?B?RTBSNTg2ZWM2elAwM3QvUFI0Vm1ma3JpckJUb3NnQmZuQnNFRE1zdVVrNmxG?=
 =?utf-8?B?cFVoWjQzc0JGNTdhUHFWQ25vT1QvNHoxUUZlL1ZNWGU1Z0k0RUtIMEtCRGoz?=
 =?utf-8?B?MWQrODBvS0FuWHVENFgwTE94VzdQcS81Z214RFFaeDZrVWxTeHlmZnM1cS9r?=
 =?utf-8?B?dlJEdFhGWUR5OFh1RzVQUUNxSFQ4SkZwdW1XRVA3aHJFbUlpZUJIQ1M2cFpw?=
 =?utf-8?B?WVhXbjBsNGtQdE5mMUNNT0hhZzYxV282ZTNrRHVGUXNzZE9pOHh1RUp4eWMw?=
 =?utf-8?B?ZVp0VWJhclA4T24vT2Y5QTdlQldKNDRhVU9OUWFOMWRMYkVJYWwvTkpYYjBk?=
 =?utf-8?B?eWV0MVJ4bHlvY3lteEpCZGE1dzFvK3JLMEM3a1hoci95SVc0TTRTLzZNRElx?=
 =?utf-8?B?TEcyakNLL3Y1ZkJKMnBFcGNoNUc3RG5aY2VxQU51ZWgyMXlVUjhhUFRCVmJT?=
 =?utf-8?B?dmZHR2hlM29SL3hiSkNnNDkyaEgvbjFQMUx5TC9UWHU1aXY3eUkxQVpzazlK?=
 =?utf-8?B?MHlnYXVOM2pnbjkwY0g2ckVTUDhCcDhzQ0ZwTFVsUFR0bnZDOXcxVkYwcjhT?=
 =?utf-8?B?SE8wWTdOR3ptVUJ6ZXNYVDB2K3RJcURNQWU4d0N3WjZDOWQ1eGFidzFRQnhT?=
 =?utf-8?B?UUJoM3FPZWZ4bFM2T2ExRDBuZFZxVWh6ZzJxYnR1OUlSRWZyUzh5VHp6czBs?=
 =?utf-8?B?MDBnQjBPUFpkdFRTUkdNTnVYVmpBTjREbk5IcytWNWxpM3liUTlycGFPeHRH?=
 =?utf-8?B?RThMdk1lSVNrL3pFbjB2TFdRTU96bFJSa2hNemN0bzZQVFZ4Z2kyVzhxVlda?=
 =?utf-8?B?RXB4Sk8zdE1xMmt5RTJQV1E4NEYyYThuZmEyQWhwSVFaR2dxbzlDS2I0K1VP?=
 =?utf-8?B?QjBIVmtPMUk4MDdOaFArRkh0dll1QUdpU2JTZ1lSY3hzREQvOUVJbGZQNzlN?=
 =?utf-8?B?NFNUM0lhcW9hdjhLS1FuTjlKM0NYclFxS2RoWW0ybVUvTmlsRzl2QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 99799805-a65f-47f3-e46b-08debd7c4b61
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 12:17:47.2070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HF46ss0kInsSNg57geY+2sWlwPil/2aIkLLRt0jols1Xlf4NAdNIn8Y5o9jHs+2JbHaOWraLRdqwX2we1QIrfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8757

On Fri May 29, 2026 at 9:53 AM BST, Nakamura Shuta wrote:
> When building the kernel, the following Rust symbol is generated:
>=20
>   $ nm vmlinux | grep ' _R'.*Page | rustfilt
>   <kernel::page::Page>::nid
>=20
> `Page::nid` is a trivial wrapper around the C function `page_to_nid`.
> It does not make sense to go through a trivial wrapper for this function,
> so mark it inline.
>=20
> This follows commit 878620c5a93a ("rust: page: optimize rust symbol
> generation for Page"), which did the same for `alloc_page` and `drop`.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/page.rs | 1 +
>  1 file changed, 1 insertion(+)

