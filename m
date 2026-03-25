Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020116.outbound.protection.outlook.com [52.101.196.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7A02857C7;
	Wed, 25 Mar 2026 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453964; cv=fail; b=XyzhoPvEbkxrs8NcxbIRGnX3CXi4Bsiw8Uc5V8WMad1biGVslPsd1NT0FKX3BNbWBN9KcM/qyXpSYf7OHoV2QTmcNU1nEzLcDjIDoAh5Y4D8ZYfE9TtSdhxsShq9fcXQe1RgH+eWr29aFtY+KI0zZB0i+ngWSkPSwmVb1m/CfdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453964; c=relaxed/simple;
	bh=WDpStIDNIomwVhzo8fQDxEsXxhsNjnGineovdhQqseM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iEm/rKG/viFxU2KKlxmAQv9u1WyCncEckQCLaLqXPITNlzgaaJsGcYlK3AALlO+tfTwGcVy/kNTBlSo/+Z1GWEwFUIJl3EZgen84a8f94CRoa3s7VL4PtMbkeeAqisbsKipR1Mry46sl+WI5hpKGx4TBEd8VjSYbcXNjs9yjdwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Jijo3I5c; arc=fail smtp.client-ip=52.101.196.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Jijo3I5c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sihk3jdzZNDDb1KJeIC3r1nH8W2oDdYi1DaZqRr+PgNB3B1pTo8bTx2JEjDTxC9gVkCjIEyp4lflSNQUHmpLr/nS881BxMjK+9RDoNfv9kBpBQf9ygnF3r0tCmOLEOQCHuZfyfOeao5J/+Tof1go6FAxEqcwJ/sVS/cFYEKkvVUEnz3qhkPlK99+UEF47d1kKUncnzH4chNJlausfEe+sEC8kALdgEEbVy5Iwouhd9AamxDOVPUeVC/sCA9GTJKRUkOBRbjNoO+9kwXz1PbfJTfMgljyViVD272cgvLI9WtZ4yUbXp14dcyrbMKgVOmxMrg0gCvAKFXXMU99gWBz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvImfu8Opjw7EIZiVou+M8XXS5e29keA+0wZpaUvsFs=;
 b=ZUTGB+hV15PrQid5DD3qCr/Vd1oepvv+w74F509BS7V1sNcpLsvd7YIYIj71FcOzd06yxup717oLx4g5uIc52UPNxBJ83vBiwSlNLrMTN8k/6ZdMb/RuPD6Ghuc30WkLeocK7IY32jqMQGPS/hj/W4Q1aClJCch5qeIT3Y6kToA1asu30qyYJoN58eSFnfcZEduE+ZThVeoU8vp9T+LCb6L/c5vDFRQ8PwvGPSKxQm7aCPdT55L3ED3uEqKruGctSx9P0i7/IJI0xZxD01g9m8vkbTCP9UoyrOS3BJpYCq61o7TH2LL2KO6StvYAjhHukhpsmMBGqT5DLP76HfsVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvImfu8Opjw7EIZiVou+M8XXS5e29keA+0wZpaUvsFs=;
 b=Jijo3I5co1a8+4PLN+SaDmLZNl3HCR015C1szQH43NtgJQBAa4Kw2H7gkUO4dgy9k97H6hXPnPcJhQPze8ngV/mYpJB7izz+yz0t1scRgFEIppFKwrYEUIdDtqMPrAFX2UyLyrUhLmAxqdGycBnR81/3I//cY/cdbVp6kSRdvok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6247.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:181::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:52:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 15:52:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 15:52:39 +0000
Message-Id: <DHBZFJELDKGM.3JYEGNCGBH75A@garyguo.net>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 16/31] rust: ptr: add const_align_up()
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-17-jhubbard@nvidia.com>
In-Reply-To: <20260325035242.368661-17-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: baf1d307-a122-4c34-9c4f-08de8a868b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	bgWGx4Q0nFiYgakTDYHeKwOMCETZu2kTk9F7rS67e6WSXK+/3t3ZnjxIFHkjz4mM4PJrfpcczk1lStunmyNQy/PIfvP5kWNgL+lbmhveC/jrvj5scr59APbs4yZGLiElwsrQoQt2i8a5n8yEPViY55phPJlpXKBSdGvz6YGJk8or5khTnCUgsTikmyFkQ8p/J7j3zkk/5jxqiPSaWodvZVz0axdjU/QTq8bEqp1oC+0zMFBe/jonnTOEWBDEfDt8ehBeb8qr95s08Ua1Q13L5K85ryGV+mlkzxLQx0mR+uGbElGfvmYeOKu6y4OkwORo8xLI1WH4qCBAS1ZkCB4ddJZbhE0Tqvl7MngppXkTzDbtM2nwv4ZSvtYIZhtmXCUayfG4RgeFvaiZ6VWHorYUfyyqDxi2Jjc+upUd8DORrgOR9/l6xoax3jpJOo+dJKQOV/d6jVy9PSCCNk2k9QnT7mvcC95rifK46i0czoiKwoNvEa2SGfNzqvmWWksfdn/b1kyzkVqlbE28wVbB2ylb2ClW3DjnkjpEcwpJkS7KYJbcO5+zMxxN7ctpNB/GfLJtNIUxbFu9x6WzObRD8EE0uX2iw5eoO4ERSlSYgpCwn9jbebPXzDvGuvdueFFeCzfGksdr0BEHH0muidSQqkN7FAdkPFWCchCzy1jpFpbrp62rFj/Sbf+HzHd1Vhc+lho6Eb88NN1sEIT19bWJI+hTOlkBAiuUM9X67Uqjf1mLX0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXVyajZzcDM4RVdyVEJydEQyVWQ1ZW1rRHRHNzdBYXRBVjBHcUM3NkliYW5E?=
 =?utf-8?B?NHlTUXlmMkRlMWxTTzhtSWIxWWxpTXNQL29zcTJMWEhNWjlwWWRxY3RIeS9D?=
 =?utf-8?B?RmtSb0FOK3FKcVdybllwZGxUSVNuSHZlUnlTam5TaXZDZ1BSNURINmw0QzBH?=
 =?utf-8?B?dDNjdzRhcnRHWjQ5YU94aSt0SVlMU3J5Ymh2KzFmcjhqVU8vdnBiQnpHSjVB?=
 =?utf-8?B?Z1ljWnJhRXRlbXdOS2xYNEREbmpNaFcwenF0QkRxQ2FMQ2svdkl5bjZZb05m?=
 =?utf-8?B?THc4NVk0cWRWMUdpUndZODZFaGxUWjc2UEFkUE5Oa2trMzUyUmxHdEdaL2du?=
 =?utf-8?B?VUNNT2hjczR4dG8vV0dNMTF6eklWdS9sRVpGU0RaclFZa0o5UHprWFd5Nm9I?=
 =?utf-8?B?b1FQQnYvL1M0YW56K2FnREhzRjg1WVprRExXbFB5U0NMRTRBZ0ZmUmNEMUJn?=
 =?utf-8?B?OSsydXR0TWRFZFZyWFhHd0wxSXhFRXVDU1daZ2REQ3BzMW9jbW96dTZNOEJK?=
 =?utf-8?B?cmlsUHV6SlBHMnlXNlFlYlV4RGlVTm03V0hhTTkwcXFScXdQWlhkclN1Mkhz?=
 =?utf-8?B?SkdaMStYeWxDc2xpRWpFRDUyTnQrR1RBczJwSXJqZlVQN3Z4Q3pRWXlUMFdO?=
 =?utf-8?B?T3VKRUQ5Mmg1N0R2U2JUUzhOYUtHc29SRUtTY2VHUUc4S2hTaW9pM0NzSkZP?=
 =?utf-8?B?ZHcvUEt2azk2c2pTTU5Rb2tiQlB4UE9QUVo1b3k2dHo3T2dXcDMyRS8zcVNx?=
 =?utf-8?B?a2k3ZWgxNnkrcU1aaWVlZVpBQnROdmt5UHNoT0JYRXgrWFNqck9Ld2JwN3FX?=
 =?utf-8?B?V05PTy81TnpwQ1RqVjVOa2JRK1hQQmt4M1B3OWhsYzJSNEZ1NnI4dEVoRHh1?=
 =?utf-8?B?aTVhMFA5SmxEWmhDdmx2R3lBcnpWT1RxZzF4MG1NTERFWHdFR2hKRktwQzU4?=
 =?utf-8?B?QkFnY0NOTS9sOFBZOStPamdGUDY4WERJajY3Vm1yamRwUllsVExiblUwQ0ly?=
 =?utf-8?B?REp5ZmRYSkc1Ujd2ZXNZT210ZmR5Y1lPTUsvdnV6WVNSVFA5dCtLc1kveXEz?=
 =?utf-8?B?bmQzTWRtZkpYSnFRT3UxTDlIQ3pEWGtVUFU5M0sxTkl1SnNMWi9xU2J3N040?=
 =?utf-8?B?Y3RKNy9UcGZ1SXYyM0lFb1IvYUVaeGxOMERiNElaY01vZ0tqbjF2cGNGWFNz?=
 =?utf-8?B?blhmdlk5MXkrZ1BXNkVRRm5EcFdzZXVOR0FPaHVNOG81bDNKY2pTUWpLZ3Y4?=
 =?utf-8?B?UmhNeXkzUlJ0VUVyZUlRNXh2bk5tcnVJWVhPT2ZKTDdDc2k3cng3OFFRVGJO?=
 =?utf-8?B?ZW5Wd0x2am10Sy9WSUZ2TTd4NXB0WmRzYVd0bHZOTVJXakhkSzBWbkVqMGhj?=
 =?utf-8?B?d3BicUVPWHkxZ2ppbU5rZUFmelcvY1RzTXJmTHpYanY5Rys0UFNSMXNOZXB1?=
 =?utf-8?B?ZlY4Qkpxb0dueHFOWmdhWlN5WmJkeVQrZm5kOStWc0NQWTBxV3RpTUh3M0NY?=
 =?utf-8?B?UTRFT0lkejV6ZmVPS2FMTUZDcXJMb3Z2bmVseGlzNGpZRkdtZURvcWxrT0Vo?=
 =?utf-8?B?dytGY3FNN0pYaHZkVGRDVGJqSVAvelErZCtWajNWdFpwNS9HTE5FUEx5UlR1?=
 =?utf-8?B?Y2hha2doTU9RTDZVcCtHSEdJOFppcEtTUTRidnNaUWVZSXo5d1lQbDN6Mm1J?=
 =?utf-8?B?dFpEMUJMQ1BVOG0vMHVSY0tMVXNHU0JMcEZIZkN3WmxxOVpKdFVlaHV2RTdT?=
 =?utf-8?B?b2h2VVNXdFVEUlNMbnlqUWZZdm8wc1NmTXU3S2dPR0llRUlxcVJFRXhTbU5F?=
 =?utf-8?B?UFQ1T1FyMDNvLzdhQ05paHQwTHl0WXFkUFVlbDArU05JWlJ6c0puTEJPaloy?=
 =?utf-8?B?UzNKc1BoekZXMTYzaG45QTFjYVRBN2c1Q1U3djZWeVMyN0c1bERiUVk3L0Nz?=
 =?utf-8?B?RHNCUHcveHUwWndMZEp0VlN0YVRXOEF0K2Vhd3JFejRyUFU1Q00xdHRsUThM?=
 =?utf-8?B?Y0hiSFNvbDVlQ0Z6WHNkQmpJUkNxWFhIOXBMaHJrMnBNeTlUUno5dHptZDA2?=
 =?utf-8?B?SFZpQTlwanFlSXJZUWxzOHM0UFFmdnhabGdUZTdaTGxqb1NGbzR1Vkg1MitB?=
 =?utf-8?B?VFVUV3p0UlIvR1lzT1IvKzljZlp0THB0cHpUVGF4K2dlUzdydFU5cW9NcXQ3?=
 =?utf-8?B?TUUxaEF0WU1QRzVPeGVTVURxYVkzOStPcForSUFBSXdpeXA4ZnFnSFFWVzNQ?=
 =?utf-8?B?R1FZcHpNbHV2K2dpcFM3SGNla211VitPaitpMGg3N1pzYXl1akRERnJVbktZ?=
 =?utf-8?B?MWxtVHhmS2dkMVNTenNGY1dIdStvYk4rVWtESmpIZTQ1NmdOSEFKZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: baf1d307-a122-4c34-9c4f-08de8a868b48
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:52:40.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwEFwvSs3hzZmJWwfsFoQjP0DQXYyYjSCZnYmjkhbfn/8cey7FntffJURZIIr1dexn0c5xnBNbbDR03kuHJx3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6247

On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
> Add const_align_up() to kernel::ptr as the const-compatible equivalent
> of Alignable::align_up().
>=20
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/ptr.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

