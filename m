Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020131.outbound.protection.outlook.com [52.101.196.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF8B25A321;
	Wed,  8 Apr 2026 17:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775670243; cv=fail; b=Iq3veFSRsVsgg+TuIcW/QpwM/ldAvmIX34ejma29ETiL/mOLaJJXMcTHAGFsgBeDOr1BKO4wZachccW27xbqMAyelvpvSPIrHo1zKk44yZueSm9iKHnZlzlZ6XWXksR9k7kIe6CDsQwfgF96reimo4nPODH+XRYYjrppU5lHJAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775670243; c=relaxed/simple;
	bh=R/G97Uo1SwrV9TpZeGTm0um1zQMIRJRoMz3gHcwFdGI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=KcrgZzExd8NaOKSPNG/yPUdHyUNYKlbkrsb3vVJ2AyPPX6KUnBaVWC4ydRG7sfgRyIwNPmKsWpfX+0YmmDb/ahEMjLIxqV43f2d4O03BBJ6/tnPFIf+B/MnpDnmRSQxhmd+mOk/kBLCLAXhpAEbt40vUeRCJuwFZnanBhBhhtzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rQ51ORzn; arc=fail smtp.client-ip=52.101.196.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rQ51ORzn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRtgoBtbmoj8NRrVRDtHG8bQiE7hOAiSXinMn9JNSPe7uv/+b9WFkVbeY4Iv36SmYVMkA8ZO+O94Pt/gq4Ujmj4MbOEgo+3TjSYxMr7lXj5hpaGDU08pytzNJiof3V3NIQ9O36imhF0N2hfk2Wc2IxFtvBEk4EiuqpjndQYXYJDGgF5EfSTqr9xuxVuv7LdcGJlJJckZN6fGj1HdeSXAZXpWX6YHzJ7FXm763+phr4HAUeJCB5B4mGZa4OPWLVTwm8yElsuduiDprsjN9M+f+YvkB5dOv/8MOzEXyOefBcbo76kaW6jQz4Y1BxxC0g2JZ5eRC5sdswSnwIF97UU26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuoVcBfAWxyDc/hLQGKY/u/w+tqsmX2BJngjUVgcZVw=;
 b=D6cLtOzGo/UGlL1pEBrks42pSEgXrguJzHJPc0Rn4cOOiGahTEzwyHsNWxQ3BkPDMb1IelZYa3f+pbFTdtt+hwcjVezuZRoU5YbI9dBzbMDOalj2558By8As3h51Lrdhp+dy5wmMTnOJmvZCCW9Wp17NyljQAN5rbU7HmEETSdYVtxpGzywTBsG9Z/Evh4s3XxVYrHatcLDMkNkwlThuFbLIeUbiutCzZetjKAiKRi1ptPWCuLdQj4DTmSt/m8TleyERQFmong3lvX6PGkt30fwylpBHXmpp2SWwuIvSF24OUTOtLc60mTHtYbIarwkVsiSmiJJKsgfTaOJhaxc3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuoVcBfAWxyDc/hLQGKY/u/w+tqsmX2BJngjUVgcZVw=;
 b=rQ51ORznM/7MDJfX507CNj73iZa3TaV+YRtqMszNPYJL/wVG8LO8bZ2+7GxYrm9K1yculWD6pnwRlDXdZqzChO1LFqy++0autLdRMUr/xhGNIzeZOL+v3uvo1snMSsQzRgrnOVxw7Lz0pjtrBGUY8dzgM/h6GFhYF1xO8dj/+1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7531.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:214::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 17:43:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 17:43:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 18:43:55 +0100
Message-Id: <DHNYKCR34P1F.1EZ3D0A8UB8S5@garyguo.net>
To: "Ben Guo" <ben.guo@openatom.club>, "Gary Guo" <gary@garyguo.net>, "Alex
 Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang
 Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/4] docs/zh_CN: update rust/quick-start.rst translation
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <cover.1775619061.git.ben.guo@openatom.club>
 <b5e1246269848fc95d118a722fb11eee88961053.1775619061.git.ben.guo@openatom.club> <DHNQOSMQJV1A.18UJB6VG0QK70@garyguo.net> <46eb585f-4983-4821-9be8-ef57571c3516@openatom.club>
In-Reply-To: <46eb585f-4983-4821-9be8-ef57571c3516@openatom.club>
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 796f9a61-2282-46b9-7d47-08de9596680b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M21237iHr54YkaGRvU6Sc+JeXj+F+942ObkpQDFC3u2ft2KJNXk1yc4kaAVTmZBPrUve8Hrhag8nQs6FNFaCpqSeObqlqXCx4q71tbQn+HjA4EO4mvgG0uIIIjkgl/BSNp6rL6rQbaUwNHP+YxkAFUBwmTEheSrAF3mkKDGUgyh+hgXUBtrFhbIZqMUxK/hwXc0+7c11etQFlHp+prIuUTKlILINh2H1s1Ba9QhPezvIUXzZ4ocUz0c+2X+GgQ2sDizCLzN8yFOFt+Z5eI8GfnYFOV5g1JDo62YtbUn3v0A6vTVlz3sLZkoZbUw3Su34XQ069dlM7rI0c9y05JIZwr/VSfsMnq5rhkA1bqR5hvoRhcurBK09RmNwBX74OWwUO00h/E7JzbLRmgxqgRAQiW6+u9BiPdWb/PiQ/okmNOYJHUgJJWVq+Jk3Ps1vc/evjYZd2KplXG3Uvcfdw0wJDGXww2qQYKQtV7Rs5PHSRrfruIg8YxpZ4+D3ewp96w6qhvvcvTp6g9RS4ZyNg9vQJAqzgynVWOegB6hfZxjyTL0YO8YbVNHOPOISaUg8ivN/Q3087csRPAwokaLxMnuOTrX+jlzlNWdpvX86BlKaySe7cYVBiIeUQV+AAG/dDXHnejNi+QoycsvmkL9EIoTgzdRIbU2rFT8FU2UPEnwifW4tlso5gC6yTlkd8HHzzhJvDFnpOmOoLXDNTtNBz/wKf8fQaEyJWId/C5iAsHuCESI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTlWajdybzhqa3diUkNIQ2lWVjJPa2NXYzQxTW1BbHJucHRYT2gvSDVaYVVz?=
 =?utf-8?B?RFoyRnlBSmdrV2swSFpCRWF0NFBJSzN0bVdLZUVPckl5bUtpMVBocnZtQ281?=
 =?utf-8?B?N3BrM2o0TGtrdHN3Q3g5eWFXYm5aTFJqcmJTMUJaZnF0OGRnQmF6THBwdkdv?=
 =?utf-8?B?Q1BpTG0ySWJvUzVIbHJEajRmRHFndkV3ditKUmMvbG15TFZ5NTMyM0ovcGxn?=
 =?utf-8?B?OFNud3VHOXViMG05M09Bbk9KdFBsSHU5OFg5djJrVkhGNHFxZDFKQjdrV3c3?=
 =?utf-8?B?c0FHN1d2eVdLSUJweXRpNWgxYW1MV0ZrcGFFYTM4RHJjSkl0a01RQWVJcUxN?=
 =?utf-8?B?Q1lwNXZEMlRjVFMrVlBIRStwcFl0UGZqZzlzTFRUUWVXUk9WRkdtMlN1d2JO?=
 =?utf-8?B?WTVJdnY2SmlaQnNyR0FXcjIvZTY3Z05GdXRHZ1NtY0ZYaXlDVmJZbWxyWlFJ?=
 =?utf-8?B?QW1CL2VBYUlIUGFFTXBqb2lyZS82S2pUdmZBcmlQZ2ZRTHdPWGtxdVNhRzZh?=
 =?utf-8?B?LzNLcXdsSEt5TVNudWNMWVZHYWdidzJoVlFpOW1uUTlPMGtzaVlGdXExK1NK?=
 =?utf-8?B?d3dLc1VUS3J1TFgwOFdGUTlVMHp1bHhPZVQ5dGlKTHMxMTB5Ulc5Yk5Zek9y?=
 =?utf-8?B?aDdHMzJKSmFTejdLK3MwT00xWmVYUjJXUjAxdENLVk1QNVpWNDRYN0ZGZkda?=
 =?utf-8?B?dXIxbGdHQWk4RjJKNmlMZ3c1bUVHdlo2UXRJSjNFZjkwVDNpWUdpaHRqTDhQ?=
 =?utf-8?B?R04ybkdlSTNYamtuUldxUERuaXlzS0IzQXlENXBvSVhaa2V2dGtUVFdYSU9Q?=
 =?utf-8?B?SVJzbkdvVFd4WkhLL3pMTWZiRFkyV0liV3JNUG16RjZTQkhzb1l6NTFkMTMw?=
 =?utf-8?B?MHJ5Sk1iYnM4OWRsNHB1UWxhUlZTV0xmV2hxL0k1bXo4Rzc5RFVvRkU0bFY5?=
 =?utf-8?B?dGJmMFpQekFPcXFkRjBtVzN4a0V4ZVhyQklzSzk0Z0dlQUxsV2VHWWxqdTV0?=
 =?utf-8?B?RUczd2FvblN2YzRmc1VZMmorVVNGQjBkd2IrMWJITitmWVJ6QUtIT0t0MnVO?=
 =?utf-8?B?QzNzN2EvUHNQRTVCV2w5MHJLRmNqSlZsUkZrZlpjY2l2NFVWNFdDQVJaaUtS?=
 =?utf-8?B?aVNuTVBBbHpzM05sZmtleTBUc0hUUWFqUXA2U01ydnJEazRCYmZDdmdxeUpI?=
 =?utf-8?B?cDc1MVJkUGdXQXJ1VW5oVHJNMWxFeS9ZaTdYMGN2SCtDeHY2Q1U3aDBacXAr?=
 =?utf-8?B?eTBRckhIWkhkWmNDVVltRFZhU0lZU0djK0MyU28waHRqdXhvdDJieTEva3E5?=
 =?utf-8?B?MHNSM3k0ZFlGYzVyZXBKK0ptcmFyYkxlRzZraW5xVnlITTRoK0lUNE5wM3Ey?=
 =?utf-8?B?Vy9MbzBjYW1kM0hiRTlpWTJvd2t0Z3Q5bjV2Q01QcnVra2MyMFRoRUZ6MDJj?=
 =?utf-8?B?K1RGQXBuM2JsQnRBekZ4a1k0dEtnYjl2YUVaMHl3SzFmTm9aMXFJS0RjMjZI?=
 =?utf-8?B?TU1lcTlkMmQwUEIvOXJyZ1p6UUFPQXg5S0l3S0s0d054dktraks1V0hNL0g2?=
 =?utf-8?B?ODhEK2pKUkhUOE0xckgxNi85bjFMNTJ3U2kwSFBzZUxqRmYrbUc5VXRmMGlD?=
 =?utf-8?B?V0VvK09CRndzUmMyK3FzRy83L2U1OXdOcUJtcEVSMWpMNTQ1U3lvc1YvOWVY?=
 =?utf-8?B?WWVTSW1Wd1hycTlmMHBjS0tJZlh0NFpmRmNnc0JHbXo4c292R3ZQY0F4TjBs?=
 =?utf-8?B?c0NxcTM4am84ZUUxalFrZXlFTkNxOTlzV2FPdFN6eHZCNjRXZklkUE9JQVVB?=
 =?utf-8?B?ZDNsbGRhcVNwYW55U0JhMGdsVkFmUURCRWRUUjZyUVFKMVUvZ2lkdFZORVFM?=
 =?utf-8?B?VzlUeG42TlE4aTlVaDJHSmIxbE43Wi9EMnRsSTlZVjVwQ0paM2lUazIrbXky?=
 =?utf-8?B?eEhLdk1HcGNkMzU2VVo5a1FEU1QzeVpucHJpV3IvWWlZSUhrSy94dDI4UHFZ?=
 =?utf-8?B?TmJHM3VIaVQ2ZXpUVFdqZjkwR2hDdE5KVzk4bkVRRm1WRG1SZWlKQ0tLUWF0?=
 =?utf-8?B?dG5wUk03ZStpRnZVdjYwaGxNd08ySHV3RkpqeHB3dDBmb3RFYkVYSE4vTStn?=
 =?utf-8?B?MWh3bDlYYWNBOE9RM2tYSUE5MUNmUnBsckhFd1B4aWFrYWRHS245ajVrWDlp?=
 =?utf-8?B?ZjJKME9NNkd1WGRIRlgwUmZUK2JnSmZZNHNzL0FyRWdCdVBOemlyZ2czNzFQ?=
 =?utf-8?B?S082ODAvcGx6YnJHWEpsMW0zT2VGRHNzb0hKaGFaRWlQb1BMclVtMm9NdVJE?=
 =?utf-8?B?R3VlcDhQTDFJVlgwNDRTeVM2ZlRvV3NpeXI3MFRqNk9qVWpqQzR2Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 796f9a61-2282-46b9-7d47-08de9596680b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:43:55.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll/rarlONTdLA8LuabgCgk99gjrzTUO4VWTPCt4fIIp18b4mce+vOIFnN06uQkN8+2PIzkaCuAP4uXEenjcljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7531

On Wed Apr 8, 2026 at 5:51 PM BST, Ben Guo wrote:
> On 4/8/26 7:33 PM, Gary Guo wrote:
>> Hi Ben,
>>=20
>> Thanks on updating the doc translation. There has been new changes to
>> quick-start.rst on rust-next, could you update the translation to base o=
n that
>> please?
>>=20
>> Thanks,
>> Gary
>
> Hi Gary,=20
>  =20
>
>  =20
>  =20
>
> Thanks for the review. This series is based on the Chinese documentation
> maintainer's tree (alexs/linux.git docs-next), which does not yet have
> the latest quick-start.rst changes from the Rust-for-Linux rust-next
> tree.
>
> Would it be better to wait until those changes land in our base tree
> and then resend with the updated translation? Or would you prefer a
> different approach?
>
> Thanks,
> Ben

I don't see the issue of sending translation of the latest quick-start.rst =
even
if it's not in your base yet. By the time the changes land upstream, the
original quick-start.rst would already be there.

Best,
Gary
