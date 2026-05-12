Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021113.outbound.protection.outlook.com [52.101.95.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF13E173D
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602081; cv=fail; b=hhdEqwiIfQhjlB88wg7Y2AyJEzasJJUzFHP45XI/ZlwVjdhAY4ehEg/YxU8SrEtYCpKxp7/GNhlqtklKRZQbiZH2TaFxA4JQRksJEaUu1efh/zuSITeeZezSyE3bPYx9v8U7NlKwEfBOvUSwdwrW9KTTplDSSBgDvWZjVXxQ6/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602081; c=relaxed/simple;
	bh=uB0X6h/VDB/UDxqP5Y1zN1hVeH5cHDC1VcNwEVub1qc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=EJfwBLwjk3muCK8au0m54n+I/QDxwOyetujRG3i32CVEoSs/wPQEqVhrCPjCMz8plw8U5dFmp5NbVCUussOlsZFNF16NZcqmTkwAZ/GtQ3XMRqe0SlpYIk17OpEaRa4YTPMBFrdh+Z3hU5O93dAEdbun/kDDXFseHVX55W97z8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=A7iB2axI; arc=fail smtp.client-ip=52.101.95.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="A7iB2axI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEuWf163j7gvnHShv5/ZdGDxDk33rJV1Tpr/YTZUUu6K7Gf9skZ2XU4+31iSNCNiUaCgdhBJOd6IiEttyE/kC6ScGf1Pl8ebIY/X5YZBTWEypE6KtDXgXyeDYgTpZAqLiy8cKYlO/Ag1qi7WjpmaJ8pop/h2sjZMd3XScqyOI5rZx+sV4hPMH0xdOzm12yBd7YHWg5//uEShHOI7PNwbGi0e5jv5eFj09D+nlR8tcH89Bo63u4KhDRNGN8DHT13NNhwl7VlJk25CJCHdTb/Ci6VyGypU9xLmGVgBH343wOmi5kdpcBWluJUMpdwm020j9XLnOWtqxfNVnEMpzrpgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OU0rmY60cnnEUYdop8+pI8OlUWBbRaV4v6NYeWiMA5E=;
 b=gmNBcQMNJU6e15O7qmnbuqKdhH6samFltFzJ75+I+WsTkzLrxVMAeyhIwc3IILxwjeuSZgYTBPaClwNrGC3vkDXvtl4fzXeC2xY0kAk/TqFEHHJ54fRTRQ6a4+eXlOQcXcJ/GtIKsJXJcTgjEdZuKSsdtFhi3peBhs4Snl29w+J8dCMXGeWZU48j3IpYwK4t6DcFMZPZGnO6XJXF1aSnhcJ4QW07PsdiDGr52vQPfmCbJFvW6WF+N7DRV58jM1w6oM+FS55fus76ypYbf7lqiXJHJH9pmJGMeNFnJ/X15acnEB2qgRUYflvwWr3Er/WaN+oWgJXBBgSvhbeGsK24GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU0rmY60cnnEUYdop8+pI8OlUWBbRaV4v6NYeWiMA5E=;
 b=A7iB2axIfyPh5QG3y3YQvDMHiXIL4qzkCG1gau9yqPD1El8renh+mZ7VaW3sdQz16KT9D/4dBeAAxGS3rLlUy8bLLSwEwBoRp7XFHRFhhPx65tp9zt/o6fnbDpmyNgKYExo+EA6KBPY2buhdld0CtD24eqeRJdd9rYyv9gU6/IE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8477.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 16:07:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 16:07:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 17:07:56 +0100
Message-Id: <DIGTTDVIEELV.2I39G0X7QIX3K@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: fmt: use vertical import style
From: "Gary Guo" <gary@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260512-clean-fmt-use-v1-1-7ae7858192ac@kylinos.cn>
In-Reply-To: <20260512-clean-fmt-use-v1-1-7ae7858192ac@kylinos.cn>
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c95c51-461c-4c6c-53cf-08deb040a166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	BRNovd87piBDhao2jvcXfglYQi09KLjr8sACs3yRi1wZ3FAmGpuwdn4K3m2gAM0+4/hutrqmaLyXicFzEiKjLYNIJQboUmGRUoeOX2W+UqJd2I/2wkk+/GhbGQtkr+6cyQtI6OhX49/7MR98zQSIQUd9LHUDkIQaopxI31Fm7KgAPnPHZ/urUYgDyOItTAd7aicqg+B4tz/ij38psCjFuQZpiggs/jJ4UoqGCzeblwaencs4ATkILwn2cs2SFnazOeSjvmIHaXV1m+kWvzGX+nXI3yORB2cGgCAj1qzALve1C0hZrg8ov+B46BFhH5CmPRj+hNnLQesXj8W7+VUxz5s0MegbKvCQBN0GrTokBsE7EPb+xV1lptP5IfpyNAoCAPjUZVPS4idaF+EUJfirtxtnXgWEQ8Td8OOib+a6/zT+WcnXJgV2dDqdvj72v96tc1Jp5UH5yeJiEwzYzwrk2l4V45ZXuWDgHBtF/8XV8NSRcd0c4/i6Z5oYe/z6I+/NhmyjW7njfhmbdm/vpUIrbF7qkW2D/5Td/RZi6+A3q7yw+Xu1VeLIlSyHkV0ZLYFlxGTykHZnJdAtsWtgyZJi7PeUzJNhTwbpGonDMH26AMedHsytvK6LyJF3eoQmhQBte4HDxLZgdDyf3h2nGex7VBFO79VJeun12OEW2E0Y/HAccjI4TIN/m6Dbnj5vDvHRLS4rGJKmwsHUCDiDjl4+1YwolUfz5I0KcOB5WdmN4p4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUl6RmxxZkU1am1LZWorVkFMS2NLMzA2UkVjRjlmK3JKVmZwZ1YyUzIwSlB5?=
 =?utf-8?B?Q3B0V2trb2I3R0cyZlBoUklVNGhWVzUzem5JNXZYa0ZleGJJOFZpVGtkL3Er?=
 =?utf-8?B?eHk1Z0gzd3FwckNzNXNHSjZsdVNQRmRTRnZ1Y3pYNmJBbXFoeUp2MlJoTmJ2?=
 =?utf-8?B?dzFoc0dHMENxY3JjYlVMeWpSeE1FYWFxRUg0aUw4Qnk3OGFmNFZYMUdUbERi?=
 =?utf-8?B?N2FOak5uQVZtcTRNMTZZL2pZaS9mSEpSeVNDUHRvYzFCSG16WWVFS09wcENH?=
 =?utf-8?B?anBWdy9tTmhQNWdlS3NHd0ZJaEJTejFWRldRdnNHdzB2aExwSE14MlArbGh6?=
 =?utf-8?B?SElsbm8wU3loZjJZL3U5MFhTTXFCenRjOFp0aVN0cE5BMmpONWZqbStpMGlV?=
 =?utf-8?B?MEhCYVJkOUFrZEQ1TW9oeXpHM3lsZmtWenk3K09jK2krcHYxbC9uVUtqRzVv?=
 =?utf-8?B?V2h4bTZoV1Q0anA1SnkyUXBUN0xHczJlSFMyR3R3UnF0d3pDd0Y4TlpxSW5C?=
 =?utf-8?B?R0l1dExTOGR5VzdoTnZtSjhRc0JnMGFaRkdkL1ZER1hvTTl6VmR4eWVmWDMw?=
 =?utf-8?B?L2Zsdk1lQmp0YU1QMHFzRDdCK2JpVDFzYWpuRlpCdVFOOVlDSFdNNEkveGJ3?=
 =?utf-8?B?RkhjWkJ5b3QvSG1ERVl5MkNrRzhhR3FjeVNPSXBwT1htbkhJNVVOZUxQMUNJ?=
 =?utf-8?B?REVWZ3NqSUxjaUhpNGJpNDN3d3BGL2ZnV0dmQ09vNjBwcnk5Y1V6Sno5RElE?=
 =?utf-8?B?UlVyd1dkMnZtZis4U1YrUEFkMXd5MXVGbGlyNmk1U1hsRlRYOUw0WllOWEZM?=
 =?utf-8?B?Ny91Ny9VRnpUazR4N09VaC9xcUx2TkM0NFgwRDhvbElZaU1yWmgzU241akh4?=
 =?utf-8?B?c1ExQ2U1QjlZZVlSTm5MQmVOWTBaRUJGNndCcjltdVE2aUdJbWN6eDhBekgx?=
 =?utf-8?B?Ym01dWRwVk93R1BlVHZJemxTU1N2MlUrbFl1a3dJWWFBSlU3bnYyZmdLTis4?=
 =?utf-8?B?WFY3N05MTGVxSGY5V0tha0hIeXMwa3VFSTBWZGhOVVJEa1ZCMWZOdUdXcVBQ?=
 =?utf-8?B?d1RtRWFzVTBiVTdDbWY0UWJ2dm52TnpwVy9jdXBDY3htSkIwT3EvTno2Q2xO?=
 =?utf-8?B?UTlxa1FXL1JYOTN6MzBvNUFib0xqRTZLOFdmZnFMeWNVVXowR3FtLzNCSTF2?=
 =?utf-8?B?UnI4ME5iZEpZN1I3ZWlKTW1XUTZpWTdwQTNST1RSaTBqbUx6TlN2WE9OYm5i?=
 =?utf-8?B?TU14R090a1VzczZGc2w3bGdjVVhVL2dqZFdqanA5YzZ2RGJHdk9aR1JLaFV1?=
 =?utf-8?B?eFVpeGUrODZmU2M4TWdwQ09PMkpCR1JIaWxrYjdrZWsyODFFeGZSdlVEVnJN?=
 =?utf-8?B?cU90N1NZOXRkSWdnM2haT2VIa0tKeTlRVm5hUW5mNk93ZVlKa3VRaUNwbXBs?=
 =?utf-8?B?Rnc2cEl5SlBuTFFiRjVwQk9aS3QwcS9tMnZaOXNJS2d2S1dSRnJ3eG9OT0hG?=
 =?utf-8?B?MW1mb2MyTTlHNWFTK0F4TVQ2VjlCNFp3R0hTK2RoTzI1VTBkSE95Sml2Vm51?=
 =?utf-8?B?VEJJRlIrRWg1Mjl2REUwSEVJR0xaRDhFek9RZGtIUXJ1SWwxZHpuamc5YmE1?=
 =?utf-8?B?OEpGMmNDeWdlVmVRNEJNT09KcEFTWDRRcFltQzdINEVSYWRxYk9uNWxwUitr?=
 =?utf-8?B?Vmx0dFUvVDdoQlRXalY5L0RxZ2ZKRnVKSzhRL2RmUThzK2NtaWJJUmV4VWZD?=
 =?utf-8?B?aTdySFhkL2t5WUFETEhXejEwQjg3QmNXVm9MUDhDNGxrR2lqRzI5MFgvNlJo?=
 =?utf-8?B?eW5rdlhieVhFTWxFdllxc0tOK2Y5amNLZjM1TXRFQUFSNDRTdjNvTFpJY3Bu?=
 =?utf-8?B?ZkZyZ1JEeExteG1YSzhjMUZzcmtVT2VzNityWUpTV0xMelo2ZzZRa0QzSzBz?=
 =?utf-8?B?UlVILzFCY2dMWGlhRFFYY2xTNUZoL3lMRE1NcWZDNkVPSGhKUDhJQ2VXOXJB?=
 =?utf-8?B?RDlhMURhc0JRTVFhamRJTEdjR3RxTWlpckhqdGJTZVlTMTVGRVRQd2RlTW5t?=
 =?utf-8?B?eDZHUFZQbjU4M09Kb3VRdlZHY0ZZZWN5VlVrQnhQNi9ndFp4MDJJKzZxbWdP?=
 =?utf-8?B?UmhwYWZtbEIwTW5NVm00WkQwZ3ZoTjVqRUdBMWx3UmY3MWNNd1k0UEFIQWd5?=
 =?utf-8?B?WEN1N3E2a3BnQ0dLY3paYUE3NWdIU2xYU2dsWlFpd2tVaDVTaUs5UitRV1Ji?=
 =?utf-8?B?UExaZC9ZRXVYaWZ1RWEyb0d4RFhOaTJBVHUrU05Sc3A3Nm1TQnhyME03K3M3?=
 =?utf-8?B?RmJHNE04OG0ybUhJbGFSYmlWRjBLTFZpWG9MQ1Q5bWM5U3JrWUl1dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c95c51-461c-4c6c-53cf-08deb040a166
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:07:56.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJ6BvO7CI45ssW5YTC/qz3toOGL3PkKsKKMR3d/FGrXoahV5M9aCZvaXMCo78Uow9R17Wr43msYuwRIumPjcFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8477

On Tue May 12, 2026 at 10:21 AM BST, Ke Sun wrote:
> Switch single-line `use` imports in fmt.rs to vertical style for
> better readability and easier maintenance.
>=20
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/fmt.rs | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)

