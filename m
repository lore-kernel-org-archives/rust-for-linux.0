Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021141.outbound.protection.outlook.com [52.101.95.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A4288C0E;
	Mon, 27 Jul 2026 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151898; cv=fail; b=GH70J6pqzIiafBUouxIIlyV8nRBzCtdgz7H864ISaUixvNRtAkoiyscmnIC8ILuzlFMC6Qv/Wh1wH1Cb6k4cMP0THRRVakqHeFCwrnBLEUhfiK45/x+3xpcFxt1oos1SSt3OeM4LFBQiqF94fqwTqAfpzMqsCLbhnHdHrt0xjg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151898; c=relaxed/simple;
	bh=2HoGCw7RFSDUzpfnFXTCyhMJHd0lTxJX52qbtjahJM4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=n/AjZClnW24oanOh/Z7gGbDzznPqC6qsqZmVvlGC1OAhAKUm3+n5ZGiutBUoSs/3/ite2GOD3CUMtCyQPwXv0ts9EB+Z89dP2Bn1mGLu6VM7J/ukyNQZ6/P93huDoTOQKouUhPHkrCPHZuzgv9Alui8MwHk5C5FfgEVGqqJWhB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=AfE4sZUr; arc=fail smtp.client-ip=52.101.95.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="AfE4sZUr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLBY+S2CQMSJk03MKtH331WSr+NwDpSXPuL9U8Cu2d0d025U81tpfXesjKK5SyqnV2SpnuPAgTpjrzXeg6oiLWO9D5iPf26xwSdn7tWgNYCBriLc6QuwFpQ9qk/9ZcuDA/UYb0xNI7RzQfZrj/XvBnwsE85kj2viAhS0gsKDI4HwAMQtizy3F1nNDryF/xuqHp8UpOGO3G+cVSrYoA97DHVRn5y8mLmhNr/CnHKhQoiWiSWjkgMeEqBLsLLo00btWCxEm4ck+NcVPIhv0AXCOxZsyGvVa7id5BgAIhBvNdZ0XhHCGm4EVhnYluMOQy7BkGNho81oRGjhV9QTXgGIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8FsQh0rmfLX/VKoTcYRNK0h5ax4+GSsCphRDStoMT8=;
 b=S2PAR0cbAlXrAdpZRl+ExKwbalm5v7RJchum8FM8/DB+M8JWLshv+BrDLI1n4NyHrklA9PhzOY7t2zUtWgLEdPmoFuMDraYuis1nh7XRoJOcw81Q7oqVTnXzGDz4H6BLXWkt/xjzwFXQ1PuULYtCfxTkR1Xn4ObjZlbT48f8LZEFnDGy4u8osQcRFmD3BzlGpG21G5OWMbztFlMmVl/abpucwE5I1tSVbCgwCDCDhlji0U1hbzQqDtSqRUMOKnK+qgGEjDISsYe+7SJASWu9n7H00tnfzv6ZM1OusTyOEnCY1zjEBekE25SlBl5WDxWiXLtPPbE47LptKMO2t/wrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8FsQh0rmfLX/VKoTcYRNK0h5ax4+GSsCphRDStoMT8=;
 b=AfE4sZUrj9WBToGupLuymfZ3phJMK5RfAEJO6K2EwruhIkCJbfk9HSb8zASWtwSOo3ZtNwaAIn5g4Og5NPIERdnMW/ishCGrmLtY+/nFXUy9/gyJYkSFx+JGjPCypqX00CqCQFMnsZy+MriZSbDh7gsxCWFRtpff6nfqY8pCubM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6323.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 11:31:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 11:31:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 12:31:31 +0100
Message-Id: <DK9BJ5H2MDKW.3GRTCRJV58F5V@garyguo.net>
Subject: Re: [PATCH 0/3] rust: pin-init: upstream synchronization for 7.3
 (round 2)
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
In-Reply-To: <20260723-pin-init-sync-v1-0-dabe7f902cef@garyguo.net>
X-ClientProxiedBy: LO4P123CA0123.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b921ee-d57a-4bf7-0aff-08deebd29b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|10070799003|1800799024|921020|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CvdZi/bU1W4qhugAxCzG2BF9xfU2+y1vmj/CvVZJRs6qvN1wLKDT11OrOZbmSghslPVkiN9sUoYNt6dUIf08H5YH/8ABBcpZPvi4LtnSYLLPcZwyVUuhPLrKsQ4vX+ui6EhVsJoa4FbfQeOz8t5ro6I7vWTQy68WCi/RCvwxhbrBKq4NRP2FzDwnRgKeDWgjeiMjVUQkvVX7/00jvjgH91OnAhZAQDhnZtUTn0BrbpDrUHi2mcS0rXNjUcCUHHvUSeFRKYOi+2IKuLLrxJyDzp2AyN6YcDqfM7bAGRLUP5eYwRJid7q52tA3qAqmFrJpx/dzYx3ZjKqVPQkCmOpcEde1Zj/vGb895R3GoJp+/ifnvPjP4XKKytQ1pQZfVPqy0wRjpx4VP+iBJvvCG+bfcwihYHeTlHusFtQrNmAdPBs5iHkuFXSKXer1q40oQIg6wmG5i2FheuWh2qG/mzxG3rBgRa3gIXpx49P5wZhg5nDuZ+MmBbKNmBRYyadK4A9u3GsJh1DO4QwjAr8VgQNMFnZVmoRzuweKZSYbeM/7g8WdvgBkjfCvwM6XcadOzO2A3MmD4ujfVIb7hSZF10Q7OWL67c/udr5V1pQWsd0PnIZ01fvIPrh9cCXhjmU7oxHEuPWAoWUirwDkCRQLH5qzhKDknOJMb4P5xhf/NEXBbf/xOCA1PN01fuIrOCYz3WGnNmCnEc8lWBtFBJGItFRbxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(10070799003)(1800799024)(921020)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3ErNzV1TmUzY3Uvd1JnRWhZWlpidVY3T2NjYXVabEtGbmFtYVl1ZmhBcUhr?=
 =?utf-8?B?WnVLYVZDZ2VmbHZNeUtIdjRXT3FnUG9WUWlRYnlnNElBNDVhT0gyV2dLTStB?=
 =?utf-8?B?ZGJsSS95ZlYxczNuMEo2RjhUYjNJc1hjNWIwbHdGdElPSWg5OE9LTzBycCs2?=
 =?utf-8?B?cmoxUjFjL2tDQkhINnVTTWJZWFIwWGlyOW05b2hpVVZibUlzd1JxTnY3Uk5o?=
 =?utf-8?B?c0JmRUd6U0hoN2I1cVlMWWFJMjQ5cDVSMmF5RktLaUNxSUNDVFZIYWRQcVBQ?=
 =?utf-8?B?enRwbCt1YWptUk1hdTBUMm1CenI3MDROZEllNGMzbStudktvZ1lmMFVXZjIw?=
 =?utf-8?B?VER6bWFZU1grVE1peFhzN1NWK21GUDY2ekFBY1grSllBWklaUWdFOWo5cDBI?=
 =?utf-8?B?dkdmWVh6Y1ZEMWhySXRJK1pBaEQvR01QSkxmSHpLSnI4alJFb2lYNmdSa2pJ?=
 =?utf-8?B?NUhYSHNsVzBJMkp1eS81aHJDQ3BmWlNGazAydmxNQ3pqSXNmc29ySWU2M1Uw?=
 =?utf-8?B?VEExMmZyQm0xM21JMzJZaWxUbHhUcFdxa1VDZlhLNjdoclZpY3g4MlE1TFFF?=
 =?utf-8?B?Qk96V1dubkRCL2RSeHhyWXI3Mi9oeXZhRkdSbnNLS0xLOC9LUXhYdEJOcEsx?=
 =?utf-8?B?QXBRbTAwTlM2TDllVnd4YkhaUWNBTlJic244TXNZSDdubkd6d2htcXBCYVVC?=
 =?utf-8?B?WmJtd3BPSWFhN3NXdnhROG5DS2ZXUmFHenozYmVLaGxBUTJhcFNuYXZHUnRK?=
 =?utf-8?B?a2Vjb1RmY1NxRk52U0w2V1hMODIxclc1U1RGczF5TEhVWGF4c3BHc2xGMEhI?=
 =?utf-8?B?VXNzdnB5c0lwQ1RYU2FTdnYxcnJoV0xLWDNHZVQrMENkUXNHZXdremtXOXMz?=
 =?utf-8?B?V2VhN0twS0VzQlYxYm54MHZHS1Bkc1ZobUxUTzh6RzZPRjJCM3IzZU9xM0N4?=
 =?utf-8?B?RDVNRDN1cmdJbmRxYlBSNWJJMzFoWWFiVGhScTVVVnE4RVQ0cExmZjNGMy95?=
 =?utf-8?B?ejM5MXNxZjU0Sjhxb3pqTGxibVRnQnJGekN6T2VLQVRBYVBVOTdSTWRhdXBS?=
 =?utf-8?B?b1hDZThKWElZRnZwN3dNVVh4a01ITFpub0xMYmMvelpScnhwd1lFNnNTQlZv?=
 =?utf-8?B?cEhZT1lHdmpaLzZROUlBVGtmMkozUGpUVXRuUDFCMnVnTGZ6b1dHQXRtenZk?=
 =?utf-8?B?WFpwazBlbU5uTmFjR004OXJyNG1OOXU2RVVaREg5K2E3TFhXdk0rNXhhZTZP?=
 =?utf-8?B?b1U3T3ArYmV6bE44RlhncGk3dW5yM0V2S0NEbTVXdTJ0SGVmSjBNakN6T2VO?=
 =?utf-8?B?SlllZ0JEMXZEdlJWSk8wVEM5bndkMmwxUGhueTZzUzk2V3V3ZVhoemMrbkMy?=
 =?utf-8?B?YmJITWZtcm1ucEM4WUc1am1IRXk5UzdqNUxvL1M5ekc4bXhtR1Jjc0diME1G?=
 =?utf-8?B?Y25KWGR2Z3R1dGlBcFZtOHp1Unp4ejk0dTEzWDkydEFwcGhLTENhaFlML2Jy?=
 =?utf-8?B?OHJHK2toa29FNXRBb1RqMmRHdGJreExXanZ2U2NqM2FKL2k2bHJMdndRV3Ri?=
 =?utf-8?B?YXpIWFlWeUJmanFBaEJaZmlJb1lXekphN1RjTmxuSllBQU1RRUJrZENJdVJD?=
 =?utf-8?B?M2E0cU50SHE0VFNTMW53NHVQazdvZ1BQZDBOVXhwdEVwMlJ0eUVjTy9sK1JM?=
 =?utf-8?B?ZGFFYTF2TU55U0NwYllZT05RR1dUMkZPL3pTYmZDdHJHSjEyenZIRm5acFY4?=
 =?utf-8?B?dTZnejg2VlIraG10WHRhU0VDblduNkthMUl4WThQaXN3ZEVKRmFybzFrUW5Y?=
 =?utf-8?B?aUlyY2M1clNyU1VJby9mVW1oKzRRVWFQOEhCRWM4L1hROENyY0FaOVdSc0Rs?=
 =?utf-8?B?bWN2VHdPdUlLay96dS9nck0xc3VRUEJSeERrRDlhN2pZYjI2aWdHYTFwL0xY?=
 =?utf-8?B?dUs2NjdZUXRRajRNSjAvcnFFTVNka2JiTjhUSDc4MUhHVVg2cU9EQXF1VXlK?=
 =?utf-8?B?T284cFhZYjVoaUlMNWF2NDkxcFBkOEIrSUNwWG95djlwTkVmV3JNQmVyS2Nh?=
 =?utf-8?B?MExCNnAwTDdiU2kybzhLeDNBUnI4UHc1azNWYmpKY0cyZkhoNUM3WUpCZHN5?=
 =?utf-8?B?b1p5elp4TmdHeThicEhvUCtZRDlsanl3Ry81K3BPcUMwNGF1eEhCTXNwQjV2?=
 =?utf-8?B?YVc0NzB1eFFiOVNVeHhWN3UyOUVEWVlXVE5MR2FieDVoK0xuRjFjY1dGb1FI?=
 =?utf-8?B?ZllCN2xKOFhudkhibCtRVDUxM1k2MUdBV0d0N01RY00wajhiQUJ1VEl6dlha?=
 =?utf-8?B?bEFVRXpVQnljeFdNeVZDVTYvS0lHRkI2MFN1NmYyL2VEVCtwaGpBZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b921ee-d57a-4bf7-0aff-08deebd29b81
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 11:31:31.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNd1TjyE61ctpcH4wukqBBB8+H9LSXQ5KXZETyY63Q0b3z4oqaITE64MLnC7T8/xcsX2fp9riGoZLmliBjGDYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6323

On Thu Jul 23, 2026 at 7:19 PM BST, Gary Guo wrote:
> This is a series that synchronize pin-init upstream.
>
> It includes the following PR that I intend to merge soon:
> - docs: link `Zeroable::zeroed` and `pin_init::zeroed` in documentation
>   https://github.com/Rust-for-Linux/pin-init/pull/158
> - internal: rework how `#[pin_data]` handles cfg
>   https://github.com/Rust-for-Linux/pin-init/pull/161
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Gary Guo (1):
>       rust: pin-init: internal: rework how `#[pin_data]` handles cfg
>
> Nicol=C3=A1s Antinori (2):
>       rust: pin-init: docs: link `Zeroable::zeroed` and `pin_init::zeroed=
` in documentation
>       rust: pin-init: mark `pin_init::zeroed` and `Zeroable::zeroed` as `=
#[inline]`

Applied to pin-init-next.

Thanks,
Gary

>
>  rust/pin-init/internal/src/pin_data.rs | 82 ++++++++++++++++++++++++++--=
------
>  rust/pin-init/src/lib.rs               | 12 ++++-
>  2 files changed, 74 insertions(+), 20 deletions(-)
> ---
> base-commit: 0c20f77a26b89bc911d31cd79f1abe1a7ae57f60
> change-id: 20260713-pin-init-sync-de5399bfa9af
>
> Best regards,
> -- =20
> Gary Guo <gary@garyguo.net>


