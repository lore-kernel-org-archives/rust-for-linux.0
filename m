Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020121.outbound.protection.outlook.com [52.101.195.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF0A3B38A0;
	Tue,  7 Apr 2026 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563017; cv=fail; b=h78Ots9K6oTgTem51PK9KMTM0YbRipeYLBkOdasF0XxEsRJS8b+SpDWdUvMOxZdrSm48zvfq7VXHW+PCWgwqE8doQkhsz1cmSQx0nbrqPMP7HFiIWIxC+MbfGdg2clQov+awHhf+VwSYNgIy+ektI88OYe8jLUbR7IMem1ZyT4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563017; c=relaxed/simple;
	bh=65FFEWAkuj9w+0XStsjq9/gxDx1WDqfyEaltrv7Ixuw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=CB5ucgFpN1vVWqICR/24PHBqO+6D1FzPmxHBE1K++RJTK0NVNQj2K1X+7GvMM/AfiMfcrnt/yeoNgrCYa5MZd3ogj79k+nUy8qYpDby/LkJ6FKEa/lccUpa7WJVsmb8slpEX4hGzMwvpZ5ivr80foKMpkCecqZ3P8XgYs8F6v28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GtK6DUG+; arc=fail smtp.client-ip=52.101.195.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GtK6DUG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE/53BZ2sYF80AHymgD82Hi9idu/6p4FEOuFKHbzxrxmO+LfQCKPVrHHMXDu+AI3h5wdr627cSpRqfMiuF3KVtDEmzqSGmTgqINJxCdAGHDN6DmK21OcZXM7DZwKTRuNMGckvdv4jed3J5i1vBKd2v7m9Ub7+3nOQi2VeQ2hjYxrYPjCF/Qy946H1ANPsbdgYSFnWhbfgIpgWx19iMnHQRstuOX9aZIJVs730+HxBIoQ3mMcEIuV+1R8LkIZss+I/DJLOxjaAF8IDGtJWZvIxJkvQujeYSlJi6bzPSWdMf9jJ2NaoEHirte6ToKN7Of33B7I5HuthxKORRSlX/WNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65FFEWAkuj9w+0XStsjq9/gxDx1WDqfyEaltrv7Ixuw=;
 b=F57/uEUFl1ftwnJC2o3lXQ/UGokIzurb9yiALqDytblk2YTfVPQtlRl60mDzZzIZw2FLSjOGE0MS71w3VOQf6uX0QyEB9EuS+7QAu4qcaQ7mSoSi+mgwO7PshHPj+uTW0OMmJHFWwq1Rq3WT9aH0qZGHWFgB3QNahEXiQR7iXoW9cR/XFZlxi5s2YEpkXw/ynBvtpta3tcjDjijHSlBYJBDHxOzfAa9vl+OCLUFAspAFUqnDEQxG20HwLKOgXnOx11k//uQKdP9jkBlHhzaVOodd+PdSi96TrfOEqJLX/b72x8SaqjZ+UiykF3MkrlyYxzXjenoJat+U2S4Qq+kE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65FFEWAkuj9w+0XStsjq9/gxDx1WDqfyEaltrv7Ixuw=;
 b=GtK6DUG+rOTrLFYDQbfS9jjDGy7XSDVZRHJO03b+W4SaRaa4FL+DiX7ZnvlHNB00980g4XE49mJV6hPyzy2jNbbUM1kO9jy+5K1jyxbXXaQ/8pNGultfSUFPqmzYefag7mTBPXDmVJdrPBW/oGcfLJVvZ4Rs+QMcT/QxROuajMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8564.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 11:56:53 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 11:56:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 12:56:52 +0100
Message-Id: <DHMWK36LPD3S.2V9DV6BT60YJ4@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Christian Benton"
 <t1bur0n.kernel.org@protonmail.ch>
Cc: <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lossin@kernel.org>, "Philipp Stanner"
 <phasta@kernel.org>
Subject: Re: [PATCH 1/2] rust: list: fix SAFETY comment in List::remove
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
 <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch>
 <adS9JslFrhFK57os@google.com>
In-Reply-To: <adS9JslFrhFK57os@google.com>
X-ClientProxiedBy: LO3P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cb821c-70d9-4154-71ed-08de949cc230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	J9YjHTrGA+SYwbiCL1yyOUL9vikWN1wFfSssLdvL8C0Jx+pk9L2/OJ+d4V31CfseIXekdNpXzNK4SrjsaEF/Ocyseal0qihFrVFTaCsdtsJJ6yoFzsDCu3Ku/pOcpEau83bXUExnRSp+NMh8CYIZxuBQd4BcPkQX3HPQq/7VfwhgPQIZ0k5YUBbi1msqr85h2sWbVdNMRxNtqTwk+E5D4Zas7KQB/4kZjjzl/YxVnvfU9PcjQGPZlTB60in+zItE837rFybe1z1FRkobaOXZGIM7Hwxo3DkSJiFhTSQW/gKdhYm8+Ra7ZrKrbeFjbIxQuMbFinr9pKNLiCMG2MfxOr3nFX/H18GvMsccKk8vXnLA3IGwsOKoCaXHVq8dXpxrSZ7aa29iLUOz68Ui2KwpLA9N96A9ugZU8LYNMXRv0OzUPg43AbZN5X9NjqxXwUIww+0X5z4qlewkoJjSeA441mvTw/0woFV7rop+3xrKg8rv76deP1u76XmF1U47NPj8hWOh92BHiBbxihC81Jh7o/yEeMhWNhrdm296zhFXuAELY9Y6tzHZy4VeipHt5EqSyzJgcpNAgtygCPxbWl8Z24S6MJRwPUTIRTHnwhbBLZ3jOY4xI378nRxsQEl9twUh3f4d/oOkQYfbgrx8K8qX8lhc4/hj6QXZGHBodLkZL/ar0jn6ymP/YzSKEjgwkM/CtOt1NAYuSNEyqVVoru5KR7ja/rYEqmIdZsr1gjMLmvc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGYvVjFOeWd6c0xxME5OSHFXS01FRnZQR1ZGaUJHRnpBVEVTdkVoS0dNbjUx?=
 =?utf-8?B?dDVtT0YrYjc2cW4xWjlPODVmL1ZUamJBWjJnVXQzbGZLTDZDditnYUVxc3B6?=
 =?utf-8?B?MHIyTVY1aEc2OTRXN3VOdVdTSERCUzFRUzdnd1Z2Y1hCUCt4Y2d0UW5VaGEr?=
 =?utf-8?B?U0FZczdralRtbDhVVE1KWDZLSm8zeXpaby9sMDM2QnZuMXpJc1czUXBHNWhV?=
 =?utf-8?B?TGZGSXJnYllCSE43Z1hiczZ6dThERS9iQWtnR3JZRGl4WnY4MTJoek9aWkdl?=
 =?utf-8?B?Y2xLbzlzbmw4Y0JkVmM1aTEvQUMwblNnMUJESzF4UVNwU1FVZHoyMmlvU2xz?=
 =?utf-8?B?WW52SzZrbFZ4NnNnTFJFUEdyeUhQWE80NTFFOWNEL1ZvN3Bhd1dmR0cxUGdG?=
 =?utf-8?B?dFQ0anV6L3BuZFNFNWlTUDdzbHRrVEZ2dlVYbjM4REFXUkgrSDlCUng5RVJt?=
 =?utf-8?B?M3NoczZ3MjBvNzlpS25mK1VDTER6OGNscXUvWnBpVlpZajdaNzJMSG1CZ1l1?=
 =?utf-8?B?TlNEYjdaT0hqN0l5Z2tlYVNtckovZElpa2lPMTN6dDM1Sm9mTlZSa2UxVGhY?=
 =?utf-8?B?UUwwWGMwaUhDZUo2RmVuZFgvTGhtSlJQNW5YR2dvMTNtVGFDQVVGRWg0N2FI?=
 =?utf-8?B?Nkx0aDRaKzZBczIyN1lEdG5jamcrSW83ZmJNUXMvUTJUQXRnZC9qOFl2M3Vi?=
 =?utf-8?B?dnIyNHc3QWJzWU5KdmxnMGtpbXJSZUlvbzlUWkxRdlg5S3lFeFQ0WGIxcndq?=
 =?utf-8?B?VG9wWDhQS0JWbUNnU2xMMURDYlBlbjViTzRPbnU2YUhUc01VWUsvcyt3N21l?=
 =?utf-8?B?MjVmcitMSkowaW9EaDkzSU5mbklHYmJjdGI0d2lhSFlvRFlEZUhFdUlPTjZ5?=
 =?utf-8?B?WUtPaml4UEJwMzVCb2RlNDU5SHhJNEN3RlJIaWJLN1poY3oxbWFXMEdMcjUx?=
 =?utf-8?B?YUNBTGdYWnlXY2Z5SXBnMWZvWGJBR1RCVFMrZ2JQWUxDZ21mR3hyT0lpeC9D?=
 =?utf-8?B?RWxkS0hzYVNrTG1WUEU3QVpuYXNjQmxXZk1sbUNFbWxGYWNGREtkajNyMHVo?=
 =?utf-8?B?L1JtM2FsbWZ2ZHE4bzlnRFlOdkdKNWpTc0pQajBXYlJwUlFOMFVzd1NVWXZw?=
 =?utf-8?B?UmxUdkdkYXhvOGVPd0dDUHdibFVBR1ZKYnF4Y0huTGRWMTJUZ0luNm5hYVFp?=
 =?utf-8?B?aTgwNG9tbEpuSWZmekVEZTQvMzgrMDM5Ty8vYU1QK2ZRbnZhS3g1R1Y5TkJB?=
 =?utf-8?B?V2IzRVdMS2srZWltaWlFZ1gwSEJNemwxZlRFQTNveTR5Q3BMNDlLNTFISy9v?=
 =?utf-8?B?L2NURndJakJzVmFwdUNBSXJUYzFNSXBBcmdlaGJHd0JVcSt4cCsvem56L3Zj?=
 =?utf-8?B?bFBMR1ZNKysxOVBDdU9jRzZaN1R0Qi9zNUlxM2ZjaWViWWh3VVhqREMwcExY?=
 =?utf-8?B?SW1DRXYzSTZqRXMycmNwaXBraytrcTBDcEhlMy8wUlhkMnJvNTAvdmh4N0JF?=
 =?utf-8?B?c0gzTlRkbDJCVXpTQlhKbU9LbEk5SUhMN2xvSFlNMi9QQWp0bGxoaU9XMHpB?=
 =?utf-8?B?NFY5OXhiNmpYdUpHQXNQNS83dlRZMGhoMkpEOGFhOGFYZjBoa0U1enlpdVM1?=
 =?utf-8?B?U1Q1Ni90VVlyQnJZc2UyaURjWUtRWmt2RXA0aVo3VkphdVp3eFlDMTk5b0hy?=
 =?utf-8?B?TzY1ZVNnMTdPb3BxT2VqM21PRm5aR2M3SHF0b2htSHFCNzJuZGlncmFFUkdZ?=
 =?utf-8?B?MEFPT0N5NWM2cXNIRkhqem91dFZ4dEFtVllxK3ZPbGxNVkRYUmVDZmpicTQw?=
 =?utf-8?B?SDBBVmdvT3hlbWlIVEVYUS9NdnRSSEErRmZrcHMrMG1kOUZOZWs3Nko5RmRP?=
 =?utf-8?B?ZjZ5Y3h2aXhRWXZoOEx0Ykw5bkozcjFjdFBMOXQ4THV5UFljRm8rcE9yMzBO?=
 =?utf-8?B?NVZUWUpTVGUxNVBPREZualczNEM1WlJ3RVkwYVc1Skd4MWZJV21FbXpGRkE4?=
 =?utf-8?B?a1FvdVBaVFQvZXFNSjBmR3JKYVE4dTJXY0l0WmFGZXVXR1dHM254aklqeU1I?=
 =?utf-8?B?UHAvMkpicGVnbnJNYUt3TXR1bkI5alFoRE1iVk4rQkZNOExjT0ZycHhKMTFH?=
 =?utf-8?B?MnhRQ3dCdUdnbStjSUlqb2hXdWU0ZDlhWW04N0dYL1N4TGR1SGswUy9JRUZ1?=
 =?utf-8?B?Z0lZQncrSlVpQUlWMEZQWmFZeDVBZldHTjMwVVRkd1UyVXlLdUhiMEFjaUwr?=
 =?utf-8?B?VFRHcERIbWRMWG84cE9MdzAyNllzWmo3em8vWDdTOGdSOWZNOHB1aFhEbndG?=
 =?utf-8?B?SkZpT3ZuUXB5Vk9RVXhFWmlIL2pkSmtpYk9IOUpBV2EwemxpZTRkUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cb821c-70d9-4154-71ed-08de949cc230
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 11:56:52.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LY0L5z5bn4RzSjvOdKROblT21+PByyFcJRSMX9hIAeCBJ+O12SH2OiK8f+55kti8YyG+FNf3UcF1+hUrovhhAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8564

On Tue Apr 7, 2026 at 9:15 AM BST, Alice Ryhl wrote:
> On Fri, Apr 03, 2026 at 10:08:15PM +0000, Christian Benton wrote:
>> The SAFETY comment for the call to ListLinks::fields in List::remove
>> was left as TODO. Fill it in: the call is safe because T::view_links
>> returns a reference to the ListLinks field of item, and references are
>> always valid and non-dangling.
>>=20
>> Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
>
> Thanks. I agree that `item` being a reference is the only thing needed
> for this to be sound, as reference implies that the pointer is not
> dangling.

(cc Philipp)

FWIW, I want to change `item` from a reference to a raw pointer. In Philipp=
's
WIP DRM job scheduler implementation, there is a case where the list is
conceptually a list of `UniqueArc`s; each job only needs to handle that is
sufficient to locate the item in the list and remove it.

I suggested to him that keeping a pointer and do a list iter with ptr
comparison is sufficient to achieve that without needing to do additional
reference counting. Of course I don't want to iterate the list when I could=
 just
call `remove` function on the list itself; for that use case I want to chan=
ge
the `remove` function to only require a pointer (with additional safety
requirement that it is valid).

It's orthogonal to this change as I'll probably be more careful about point=
er
provenance too when making that change, so just a heads up.

Best,
Gary
