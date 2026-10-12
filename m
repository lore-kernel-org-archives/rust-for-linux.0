Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DF9EEB3
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 00:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791764494; cv=fail; b=Mfky1MeaIeNDXJqzmVqb06RAFv4JsJvx1FvRvylwIHmOYKpSb20FB5MtLCIcFKEge3vmaWQZ4q9MMY3ucemvsjaAe8VGs3Tsz4aUicLaDELnkyfBGnIiy8m74fZ/irCPs1uW056kFbPJj+hPmPsvJ/cRMuDChz5QdoIpi5i4HUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791764494; c=relaxed/simple;
	bh=aErRz3Wc3XFBYLTtfPrp8Rw22X2bJeFpcIkImkmm0So=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ehqelp2xHcq5ZxAyeAcSI+YNiRXrXkoooV+Pt4Pq7HYkOboUHQGkBsB6P+FdimSLlGp9b2474iBlFQgYo0mMJJr8a6lQGg3K/yKT6vgzauMQXenv+El4H5a+te9G357dOupbOoSt6CWlz+tIQlLGN+q+RHJWSclS/1nZwyNKjrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rj/6Zp4N; arc=fail smtp.client-ip=52.101.53.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rj/6Zp4N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSLEMJrTFWJb4YsaDYZFGp5so3t0wJtZ9G6Cs1aBw+k27jK2NZvoIZMlYHd5SnSgcEyE+iwcMa+w4QDCOo5e2AjaTN6dVE1cLxm8hUvwICotF0fawja1jsn2tESZq1nQXQq+/vYAe6ncV7Ene38COw7YNpxSR2ez/0MjVGzilJ5ZpylwJBcIZP85w5g5wLuXkjyVTh9UFHbatKm4Y+gIpSF8bNLsd4AHsxEUK3N74keLjf2Fk1Pb3cx6kAoW8kGK3eEO4dFSULk4B+evQVDFsiNaj3ExE9gqNjh/pA6z2oBuTm8AjXbwCon/ZkXSDsCI+4QCh4tT/uZh2+O6f6f5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aErRz3Wc3XFBYLTtfPrp8Rw22X2bJeFpcIkImkmm0So=;
 b=kPolzsbccILg1RO1n6FWhYcNyKSY0w5v0hNgFKYUX6bsYOY0QXwEBrHJGEuA4hi8hZBuIk/g0NsUfRYioJ6CG0CQxe5Le1PTlfoyEnVqP3J7Tfp37oZTVJNoDdyNAI63+8R+MhJw5XMgH/ALpxP2YKhjgWYABJksGgnhuOrGDd/BpqrndWoxlbzixO+Aqc8fZIJkLcDFR8Q+HAtqDxH97Y1oulXLxgtx8ihhkIb8HmrHqWmzaU7iUJPVoaYFNvsPaJBOn5bkcUKavLM47YHSCIZceZo+OqHqlOelabcIoCZgVlYmB2T5XL3JmS1GB3c4I8WlsKjWu9i9VCXdQMP40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aErRz3Wc3XFBYLTtfPrp8Rw22X2bJeFpcIkImkmm0So=;
 b=rj/6Zp4NfvdsbRPiDaarC+BNyuQSjxlXYX8bZlpSDKhoTzgd7MVyMTSiKCozDB3ucN5kwCB/q8ewfztabB8PjnrSwcGQsX4y+dO34ebn+oFUN8vVoNocvWBC7S7oxKCQ7az/I7BzZr+X11Pe6+7p5k1BlQprRT8l7bARjAeTdrKkj35FYs8xiD9CdMmVUAicO8+eBKRN9z8/Fox0YgCQJZdqOAmVBb9vq9SpemPFJWy5PmMp7mqiCoTA6iKj7Fkms5B2WlzznYYRj0ROSVxPtYABLev7Frna2CWDEyUzMBpV/Nvnzcl/GWSVpqgsbVGkTsPYUAmRuyov/Ca00sqhiw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.20; Mon, 12 Oct 2026 00:21:24 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 00:21:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 09:21:21 +0900
Message-Id: <DM2FHZGKS6OA.W3GBZJFVVIVY@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Thorsten Blum" <blum@kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH v1 0/2] Add NonEmptySlice
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Francis Laniel" <laniel_francis@npnm.eu>
Content-Transfer-Encoding: quoted-printable
References: <20261011191540.56199-1-laniel_francis@npnm.eu>
In-Reply-To: <20261011191540.56199-1-laniel_francis@npnm.eu>
X-ClientProxiedBy: OSTP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:226::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: e0dc80e3-4d62-404b-005a-08df27f6bfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XITLyAEHoK9LBNyydFaUAf3OoQd9FkhVJ7Bk7qTGLnOTNfcuIRjc+6sWWW7ANp9H5Dc3WD6ebfrPYqfp8pPju3yad2SNa4M7M7WyYShsPGyOq9CeCB4fXPimyLO+urMmkD/7wagje33y0CTpXtzR8NfN7xt+SzwZ3OdZx76vHCUZhaM8KTlXrzzwZYr1jWLi+hlw+rXqNZ4I+ysy3941PL6PZvtedgO8g90hETteF0kqQMTGdupsUFuThohXl6rdTscNFTbtG8ywZ5nMGM654BuMXHg0RdyZRe1KjYBzfsieq/MzJ+IxrUw87+teX4W3Q026Y5AqhVec98/Ag8QpciJUHzmQoR6U8a98KtxZRnxanRTqhWGFzsTe7aXIQYBR9FYXMmv4/Ej0t4CzqOlSU44Pf8mAXN1Ye87MGP/q9QXUWcxiso2ZgxSKeMjdaHrTXge1XVG28TB42JFuDwE2FhkUZZLD8xcwkCbXx9Fna6+o2Ae+npS30NPyiLc5Wa4gTwqsbFMv6PNmY/7dWGuki6n6+Dotb+taNJDdgan6UGlSnxabWrjrdQClOiU2m9afQ9k7qn8ijIAYe4LyQY231E6zvtlZEphiPUtH48jchb8qUFNp77ZcT8DTkKfvdhAszeH0EEi5ZUo8EKfc9mc7O/46Jq6VD6E6D3U1znADTUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk9sZ0hUWTJnNnlCYWQrUVlJVk94UkN4YUNNUFJNZFBKY2NtT2VSN2VIUHVU?=
 =?utf-8?B?TDBvQ0hoOVgwQnVEQTMrRTB0TzFHb3RzNlB4QzJFOVllWUVIYzRrc21Wb3VG?=
 =?utf-8?B?dStRM29RcFovcUFrWU5JWmxLeTFXdHB4TmdVckNTV1RHOWRmUGNWQUZ0MjU4?=
 =?utf-8?B?R1BORnZyajRodGh1YUl5cVZBc2lDbHIvTUE1SXFvem9WaXNUeVZWcWl4MjNB?=
 =?utf-8?B?U01kdXhXYUNlRHhzSm5VQlZjYjc2Y2lieElJcG5RV3JuT3pRVFlFZE1xYklL?=
 =?utf-8?B?azQ5NW9QQ2JHeFkwZFR3WUlBbFc5SlRTWmhEL2lqVVNjYXd2RFZGZUxJMUwz?=
 =?utf-8?B?OFRtdGpwQzM4SXpBZ1dlNHFwaXBhTStnTkhyeFp6YjJLUGtualczc3VpWmh4?=
 =?utf-8?B?VGE0QkFTSHdwZ3VPZHAvQWxscGZoR0d4ajVOMERZeURPZTNsMGI4OXhrRjZX?=
 =?utf-8?B?TjdFeFNRQTdDQld1czdaNkxUY3YrNXdGNnpRUHJCdjl6c3BIbTg3MWFQclhU?=
 =?utf-8?B?V2xjeUdWL2VUY3NLclV4L3ZlZ0dadVdtdzhjc2ZwQ2ZsYitGRzRZdTQwRXVS?=
 =?utf-8?B?aVBHc0ROMHpUQnJVSHRlaHVTUnRWNk9YUXIrSHJJRzhycXZodk1USjk3NzEv?=
 =?utf-8?B?UUV2dXVZdTZlb2l4ZHo3M0JyY0MvRnZOSHFuQlNuZEx0VGt0UVBLazJKVFZ6?=
 =?utf-8?B?TS95SVJRVDNFY080UWFsZkpmcW1TQXNUVGJuSXY1TjlsSllBQzRtbEM1MEZT?=
 =?utf-8?B?eGY5azJtbEY4NFFYNkk2Z3lEbmZOSGV2Y292amsydkRpRlBBSU4zb1BGckxC?=
 =?utf-8?B?bDkxRSt0aXV1UEp5ZCt1SE9uSkc0MjhPbXBJdlVhNmkzYXVBUDV6Si9SWjEr?=
 =?utf-8?B?amhwS3RlSEZ4WHB2Vld5MDdBd0tyazdRdnc0Vmczbm5MZWF5aEJaZlU1dk5B?=
 =?utf-8?B?WUFZNk5reDRZc0tES2VyY3BEdUNvRHBVMG9LVTlDTnFiYjNCWGQ5THRoa0lJ?=
 =?utf-8?B?bkdpY2gwQ0ptdUxTd1JJa3Q3VnFCS2NINDVyVjNFZDVkVS84NmhtMnVzdWQv?=
 =?utf-8?B?aStKd25BVnM5STUyR1htREhBYVo0SVRjM0QvbXNadVZ2b1RidVBNL1VUaElF?=
 =?utf-8?B?MGRXVmwzNkVUZ0IvQ2NBWnlwL2E1SjVWaWtEd01QSmU4WFN0LzBlZnl4UjZZ?=
 =?utf-8?B?VjJXbUpjcnNEejFoclBLN1dpSmhKVFNmOCtMdFg1SVkyU205Z1ZVY1dGemhB?=
 =?utf-8?B?Yzk2azlwc3F1UGdWTVc3OWlpNTB5WUFBYmwyVGxZbTFxMERmdWc0Q2ovRGFR?=
 =?utf-8?B?ZG0zS013OFJ0VDI0Q0dmcTRHMEsyWEtLQ0V3ZVQ5LzVmMlgzdmJES2NUeTZC?=
 =?utf-8?B?OEhLV3ZwS3FjMXMxemdtZk9UM0Ird0RZQkk1R0ZCME93Y1dvZURURVVKNHNl?=
 =?utf-8?B?OGEwY1IvYUpKRDRZWHNYQWcrWlNMUGFJcFd1YlZ3R0xyaWN1L1dPV0NrU3Rk?=
 =?utf-8?B?R1JQa29PTEhEUDVpY2dWbVU1aHlTMXRoZnJIUFltWlJmV2VnR2hwVk1Tb0tY?=
 =?utf-8?B?QUZacHJEM1pLdDBPTWhHQ012TUdRcHgwS1ZBblROU0ovS0MySjRNQUYwdTZT?=
 =?utf-8?B?UDBCMEpKOGJSNjIrN1JwK0ZJZWQvZmJpT2xPQVgrcDBIZnBhOXVvV1o0T0tt?=
 =?utf-8?B?OFMwdzJkUE1uVXRFK3Rtc2x5UCtwK1BFdlY0NHZ5cHd2bk5xcFpnV2JHVkph?=
 =?utf-8?B?RVVUbmE1VWlOVmI2akxvb3JNcWJmYUw0OUVJb1hvcUNtdVpQbVNndm96UWpY?=
 =?utf-8?B?UTFmM1JGc0FFMUNBazVuMU9VQU9WYytETUpOSHJiQTFOc25LZHRGL2hDWmNx?=
 =?utf-8?B?WUhXMkp5STlJMW9VbEFWMFN0a2F4VDhzYkxoL1RjWExSNlBaMHhSZ1g1SUwx?=
 =?utf-8?B?cmVZYUhZbTJGdFppamU4YW0yZFZ6TjZsVjErYlJ5RjBIemxHQzhaeTV6RkhZ?=
 =?utf-8?B?THR1QmRwTjdRSHA1bzVYaDBDeGx2bmNtYmtjMDI3azJ4bXBWVktTVy9kTCtK?=
 =?utf-8?B?NUVqK2xjSG9FNlRxQU8wR21qSzcyYVNld0hJdHRnbzhNWVhVRGlmdS80blJy?=
 =?utf-8?B?OVFaUUZhQkE2dUl5NVV2dkFLKzFRbUtBcjhPeTI0WW5SNmw5UFZoZWZRNExG?=
 =?utf-8?B?OWRzdHI2MUpxUHpURFJIdDRZK0xORFFKRjRBcklLVzdqQzRicTJTUGxmU3M3?=
 =?utf-8?B?T0k0OFY2OElDUGpBblRmQ0VNbkphUjR2eGNUTTROMjlJeW5CV0diV1owMHpK?=
 =?utf-8?B?cEYrTTR1TW1vSEk1bmowbGQvVk1vQk1RQkh3eXZNbVVRYVhWcUxxWG1PYk9E?=
 =?utf-8?Q?G+76KyMS6S7L23gsCAr2RDl5IJP0cG2YrsUilwQDTVYDO?=
X-MS-Exchange-AntiSpam-MessageData-1: cDyMQmDfMnmz4w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dc80e3-4d62-404b-005a-08df27f6bfd5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 00:21:24.4926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMqVzE6hXjtIjWRcztnwYSB9ZncMuUS5d6ImvdTuKiQiK1OzNGTDmCakSqJCEoSSikPflFwYJ8pCvdtcpeJFYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144

On Mon Oct 12, 2026 at 4:15 AM JST, Francis Laniel wrote:
> Hi,
>
> Following the discussion in:
> https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@garyguo=
.net/
> I wrote some code to add a new NonEmptySlice type which ensures the under=
lying
> type is no empty. This way, caller can use first()/last() without relying=
 on
> unsafe.
>
> For now, only new_mut() and last_mut() are used in uaccess.rs. Please let=
 me
> know if I need to remove the other functions from slice.rs to only what i=
s
> needed.

Thanks for looking into this, but have you seen [1]? There is a Github
issue opened with some comments [2] and you might want to coordinate
with Lorenzo about who is going to work on this.

I'll try to comment on the code later today.

[1] https://lore.kernel.org/all/CANiq72=3DrwnogLqmpxnsvhsPWX+mBtH62=3DYu_av=
QEYEmkWSVidQ@mail.gmail.com/
[2] https://github.com/Rust-for-Linux/linux/issues/1262
