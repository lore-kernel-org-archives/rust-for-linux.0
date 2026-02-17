Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A02212FB9;
	Tue, 17 Feb 2026 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340496; cv=fail; b=DsnerQk1+34Gio4hm2JayvejAfVhEc6ef7R1MXx7hpT3gYmlE7WR+wRVIqvS8ildBsKC3Hc6aJh2/R0rIW2HysNjQ7xZTpuVj0tTSyLJ5ptC/KQ6kYrbqTJonM3IG93N0MO80dD4WR0ZBfdJGsJC+FPku1veLjZHQDBjqfwSryw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340496; c=relaxed/simple;
	bh=/uiGeUrBFjo0gdXyhwVzuk5Ckdiz/ZtokQYWHAsAlo0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=afQOa+WfOWjLzZ1W13X1hrJn+aheqZwczg3bJMz74vkTT+RVYPfx+5FgvQN/w6Rst5U3TfkdV9fU2BgcrNFuajrpUSW98I2JdCRpfn0V65tEt4KuT+/Za6tvXFCHfe0XHIe5//MV+V+g7kTJdxyJwqvhXukctv5AWJ/SJfTJ0Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uYMJTsbA; arc=fail smtp.client-ip=40.107.209.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uYMJTsbA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPjJ3iwEt/CFoOKv/E4NS3EPlE/eSaBgEXp+Smy+cpxhy0iciE4VnCoGWtv0+k1qRnVrKfZtNtZrSaZhENYDk1Cy8F+LmbARa1osEiN0sB4tbNJZS986e9YGaHGRzy3jD9KQ9fyt/w1vvNy5YHx/i4KnSboYX6gzKhQqYDSJkLxgdh5SaJrtByV+cenH4LO1vkbTKLr3evckRy1WyddfU72LZWHKRkYt3BI7Ww/ZDXA8MJQ0o85UXDZKi6GaCgfaBtb8cVLwd/oSCSwUomT4osQVX/aLwX1lh488yAS88f0pvFJ0ke0sWz5HwtajJk8zZ1jpKheunEdBGTn3OCMbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlQ6MNH2ZU/DPf2OQa9qyQRcr1isl2M4vYzB5hlRhwQ=;
 b=SvpIq+9jjv6PzpgsNsOqs44y4GH9HCzyXrl3Iijy3eloKzFU5U1sbkK3OUK6/lXle7osg/oqBkCxW1A0vkpToUVGlaArXyuxrTefg1VDmV+Tr6yRYDg7oRDr9UenTDZPnYFCOzYSOnDb3VwCT7fUGAqEju/uKl21ew+huAvi2t/pgpfQ+VadXZH7g0fOV3BLL0XWnY58qaDwx7f7XpcnqRssPWKq8AcbsOa+h6w+T4Z4gTX1neYIxBD6lYtUfvWX33MlLZeioDkr8DrUuIVJ8z8ALn23Ey7OD//+Ejxn7h6MSWQvgiWurkEIK28VHHwL6HLuf/gF42a+KiuPniv4IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlQ6MNH2ZU/DPf2OQa9qyQRcr1isl2M4vYzB5hlRhwQ=;
 b=uYMJTsbA9RLo3w8RMk5npWV09yWM9hdus2lXNDbnUS5FDciM3GN+vlnspQIhqXh3q/A8dIWed6U5YaF+ShNTmgpIRH4Kbk94Z+OE/B6V1tqs1Ni1fUCtCYtCt4jtmx7xb2lQFRFSCVmuON7V++/I2aDWHAiR2aKtYNSPw16p7Qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9403.namprd12.prod.outlook.com (2603:10b6:408:217::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 15:01:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Tue, 17 Feb 2026
 15:01:30 +0000
Message-ID: <5f793ad7-71a4-4a55-ac2f-1d48a897a886@amd.com>
Date: Tue, 17 Feb 2026 16:01:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
 <20260210101525.7fb85f25@fedora> <aYsFKOVrsMQeAHoi@google.com>
 <20260210133617.0a4be958@fedora> <aYsvc3Q8h-Gg27-g@google.com>
 <20260210142631.6f8a3411@fedora> <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com> <aYtJznZcCEYBffil@google.com>
 <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
 <3d90656315ab0b52f4725ca7c2cd10859d1e4f69.camel@mailbox.org>
 <CAH5fLgjNS1e420UX7muyEPWX3dZ-JsA_uy3=PM7QLA2NuoKJmw@mail.gmail.com>
 <50ee6f3f-82d3-4eb6-ae3f-9f032f3caf1d@amd.com>
 <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3fa96185ef99f56947360355dc55739d66043f28.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::26) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9403:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca32a79-7510-4595-27ae-08de6e356ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UStFaERvSFY2RUFyRktOdEFsd1A2aEcvSVpqcS9najF3NWlCRmxWZEdhZkFJ?=
 =?utf-8?B?QnJlUWE5ZHdYdnpvT0JQakZuOVl5ZDJuZEEwRXd1c0FLQ3hwWCt5amxHb05S?=
 =?utf-8?B?NCtvNUNHMmpKU0E3ZENiTFlMT2d4M09qcGFwMVpBa0Fma2VNbDJ3RW5BZC9W?=
 =?utf-8?B?UVZmc1h6ZGl2RVNOK2ZNTXErdnNvZG1RWmtYaCs4c3Rmc0J4WXh0bzM3cGJV?=
 =?utf-8?B?RE5UbC92b3Z0NlVTY2RkTHIzWXlBTXFKMld0ekVmVHRqUEs4SkY5VG1Fckk4?=
 =?utf-8?B?MDRUWlJEcVVlZzFuNllLSHFFNjd0K1FMclpxM1ZoVURIWHhKNzlpQk50d085?=
 =?utf-8?B?SWduTy9CbnNlMTFnOERnQnNqQ1BhcllkSzRxd0hvYmR2WFdnWndhWHVpbzgx?=
 =?utf-8?B?dXBoUjdFZFlNNkY0RDZQVVNLTzFyN2NLWXlqZHRYRUs0SEp6eFlUNHF2RFNx?=
 =?utf-8?B?MWlGQlFrdW1xM21UMUpCaGFldVM5aDJkZW84NEY3SW5yK0FUTkJPWHRHWGdK?=
 =?utf-8?B?dHp2K3dKZDFYbGtyRDRtVFhXU1VoVmdQYXdwU1pTT1FoMUdlSHV0UklzMjVS?=
 =?utf-8?B?UGRFdmYrZVpJL2FicFhOSkpjV0tqRTFYY3ZOV2E3c2dWMEptTEZha2owL1o4?=
 =?utf-8?B?ZU5zY0JuRWRpcHFveFErREJZRnhWNjhxVE5JM3RKaXVaM1R6N1dXSS8wWE1T?=
 =?utf-8?B?OUpGL2x0NDNoM05SZjNXUlpQVjltNGNIcS96SVFhVlc4NWZzV2E5VHhyekZZ?=
 =?utf-8?B?b0ViQ3pvYUVMQy9SQm9OSEd3REhtSVRxRmQ0SVdQWjVKcXkyRDhwcmJmNlE3?=
 =?utf-8?B?aDBZT01HQkFXMUtYOW9Nc0g5YmlHWlN4M0dCTGw3RU8xRmJsZnp3VkZsY1da?=
 =?utf-8?B?NWEweGt1eFlsK1FtL3BNRUdjOEpUMmlpZW15UGkrZkFkTGxvNVpZWm5KcFFG?=
 =?utf-8?B?N3F1Vnhrb0NDLzBkSDhjVGZYVUs0bW14ZFpod3lVUFB0Q2FCV1BWTGNoRUgx?=
 =?utf-8?B?WkZiaFhlM1JIZEVpNmNYSk1IeCs4ZjZrWjUzQ1lqYkh4UFVtL3o3MVpZbGxj?=
 =?utf-8?B?NjhwMGV5c1FXbVRzcVpkL3daa2g1aGlMWmpVRU9YeEZLV1RKMTVoM3ZzRysw?=
 =?utf-8?B?UHFWbUxyS0M5N0VncnA1emJnaGtwRmtXTnE2aDZFb1ZEM1Y2bXRubEZWUy8w?=
 =?utf-8?B?Y21GVS9ZTktaRzFhdmxhRXVvdVlRSXY5WXU1OGs3WUFLWHIzUVFnZjdiY2Fj?=
 =?utf-8?B?Zkl1dWg0RDltMjBWRkdCeURGem1adEpzYndnL0x2YVFKK1plRUdPd0ZmNGZZ?=
 =?utf-8?B?S0pPYXozKzh3YVZjMlphYTJ4bFJYLzlmVEJEelQ3TEVwWnJmMHBJUU4vd0Vn?=
 =?utf-8?B?dlE2RlZ6NzdLWi9aWXNUSm8xOGU2UTNBcEx1MTd3RHQ0U0xEbEo0R0tuWDYz?=
 =?utf-8?B?b2tqSkcxTEVXeWJCTmg3UHVwNjBSM3MrUEJmOXphMXJUWmtmQWdRNndqU2ho?=
 =?utf-8?B?YlRUbEFFWE9NV2JTWG5nQ0VnRHRRNjh1NmdNNDI0Q0J5UUVwUXR3RCt6bk5B?=
 =?utf-8?B?WWhramY2dTFJZm9kUzE1QmtmRjdDcm9OZkhPc21kS2Y1RklYaEx0bUR6V1M3?=
 =?utf-8?B?ZmNsdHJNWDVzazJwTk9aRnVtNWhnTzVqaHNzQngwNTlKSm5CTFpCUmY5NkhB?=
 =?utf-8?B?YzVBTHNzb3lLVnVrSE1WY1hzSS9jVGloQW85bmFBc1R1WDQrditGSmN1ZFoy?=
 =?utf-8?B?QkxGeENhVDNQMWlNa0JSQy9icTR5MTdwa0tuVmt4WWFQSXl2bTE1RnIvT2Ey?=
 =?utf-8?B?UGx4S1drRmU1dEhpOGRYNFV4TEh5Wk5ZODJCNHU5L1o3ZUtkU01YU01UaFpi?=
 =?utf-8?B?MDNma2t4TnorbUVvUjl5RWhtdi9QWFhqR0RFTjRDTWFXdVNmY0ppSXVHZUhy?=
 =?utf-8?B?YkorUmpBaDBOL0VtUVk2YTlJLzlxTWFDU2toTDhUcFdEQUxBZHFrdXloVjgw?=
 =?utf-8?B?eStJeE9Ya2xqaDhkUjJObEZGRmE4NitaRm43TE5CVTVHSWRkalREOVNJR1B2?=
 =?utf-8?B?WXNpRktWYjBpbzBmVkVlUEFDSk5KcUpoWWY3WDQrSTR4Z3oyUFRmTFNaVHRp?=
 =?utf-8?Q?3SSU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmhzS3JhNURzYWNLc2dvTEw3b3N4TlhzTXRYWFRyTnJHUTI1aDlLdmc0ejB0?=
 =?utf-8?B?MUwxTXhUL2FiQzh0K0JNVXZySWlIek42VVhnR0s5MEs0ZlRnaVRLeVdaR0U2?=
 =?utf-8?B?Mk9ZWmIzTkJDTE13MmxVWFR6REw4VlZSZHU2WFdZSXhyWjBtU2ZYMkFMcFVk?=
 =?utf-8?B?RE91K0p5ZUpOLzlENjhDZk5Xc1BYQlFtMDNKMGNQSDR5dFFPNWJhc1RGTEFn?=
 =?utf-8?B?eGhxN1MvbTVJUmRwb2g1YURKU2dLQ2hZZ0sxUzBibUJvdWVPNGloNUlCL0Q4?=
 =?utf-8?B?VzducFRSSXZRVEVUSHpaVFp3M0Q1TFIxV3A1Slo3VCtDTjhBUVJ3c2hnSC84?=
 =?utf-8?B?Rm4zM1BOaS9vMmF5ZC8xVDVkS2YwUStJVDd6OWhBek5wN1pGTU4zZE03cFNR?=
 =?utf-8?B?bnd6bjVHQk1SdkRlWWttS01jKzQ0VithMmpXbVZnSUVkNE0rVXdYcmcyUDd6?=
 =?utf-8?B?OUczS1EvUkNQTGQzUHJkdWpLMEVWRkx0N3ZyNXNFVVpVVDBiN3hmQ1V3ZFRq?=
 =?utf-8?B?SkE3TjFpc0pBYjNvekhFanEyeXN5c3IxQzlJTVp5SDY1WTR1UEtUdE83SFRD?=
 =?utf-8?B?UDJhVWsxK2pOc2RWVTJNaDBBTjRqZWZmUFVUMmp6SVVUYjRzdTVaSnBwNGRZ?=
 =?utf-8?B?NU5HdG9MSDRndjkrNEoyVnVQMTR4K0FpdFRqNjRaVVRHeFZ1ZUNQdFJBNS9l?=
 =?utf-8?B?bG1UbG5QZmRlUWM0NDc4YVF3UlRGakxwNVNCWDZ2WG1pVU54UXpWbGpEdUJM?=
 =?utf-8?B?T1ExbDNjcHBnejFRanpIY1diLzRNeTY2OSsxSEd0dENiSGV4aVlYWHpMbTZG?=
 =?utf-8?B?TmFscHRJRm94Rk8vOW16QWtGZWZzWHU3SVp4WlV1VDN4V0piWCszL1htZ2Qx?=
 =?utf-8?B?UytkNSt2djE0NmRFWWp0MnhhVFJOVlVoK1JLUUJBQ3IwaEFNMlJyMlh0dm9H?=
 =?utf-8?B?cHVIQnFXV2VIbXNIeWZJWVd4Q2xDaFBRQlBSdU1Db2s0Z01QUHdDS3d2cEpr?=
 =?utf-8?B?KzVVYVZHRTg4Nkk4dDJxbE1GbTYycENBOFgxZW9qNGJKMUIrNkdmbFN5d09J?=
 =?utf-8?B?RU9jTFBFWDl3MGdSL0QrWElrVVFlSHlUQlcwclZ2dHpNUjgwU0FOQWtYaGRl?=
 =?utf-8?B?bTEveGcxaXI2eE1TeUg1OWh1alZudU8rRmdkb28rVW5PUzFrdlA5VC9GMUdp?=
 =?utf-8?B?dnpUSEF0MlRUOUpWK2pGNEhydGJaY2liaHhRMWdSS2hqVkpCcEs3UDZBMVkw?=
 =?utf-8?B?elRsa3lxZzU0OGRuK25FUDgwTFltR3g0UTZ1Uk5xMms1dGZzRk9yZ1F5NlNY?=
 =?utf-8?B?MHJ3S1dsdXpiajBMMEg1QjViSml3bnVUTVhaYkZaWmpuR1h2VlhUcWlSdC9i?=
 =?utf-8?B?V1RYZ2hQWWNkV01YbVlSeFkvUjl3R3FRSU1xQllRcXZTeWJRQnZrOXdCZlh1?=
 =?utf-8?B?TUdNdjZZRnBBNkJzRzRLTWhENFlxTE9ZV1NEMlVrVXU4YU41NnlHSnRyVVRZ?=
 =?utf-8?B?ZXFSeDZkMENlR0w4SktHdmp4ZjRyRGZUdkx1KzdJam0vZUc4WTRzT0dkdUhj?=
 =?utf-8?B?ckJzRmlGSzd3Qm00QzBscmFWdkE2VCtnTlRody9MdzF4bFdiaVp3SFE4N3Iw?=
 =?utf-8?B?Wmp6d1FSZHZCbDNDMmJLMXRHUWpMSXpUbmlXbHI3MXhMcG5pazh1VW93Tm1R?=
 =?utf-8?B?MDFldlk5UkhrM1RVeXZFT2x4MldXZm5UdUxtc3FaZmJMdEg3c1VUaDdoeTZ2?=
 =?utf-8?B?UlhpVjkvbEtwZDIwcUFzWm1PRk1rdUdQSjduYmdnV1RRblpQNTFLQ3F2dHJi?=
 =?utf-8?B?UElHd1dBQzlxTEFHVWtwN2dlN2RKbi93WC8veFo0QTJ0SFRsR0RBcVJ2SzVk?=
 =?utf-8?B?cmQ3VndrWk40aFgwRENpYlJiemtnaWFvOEFHNWFMbkNiSGZiRWxmR1d3WDNy?=
 =?utf-8?B?Yy84Zkh1M29oTWtYcWdlN2FxSE5JYnhtc0dkSlp4aDlHdlppWWRQUE5JMksv?=
 =?utf-8?B?NzMzZU5QVnpyZVFjbXpZYkJrYnlTZ1cwTjQ3NGN4VUFkeFd3VFdPMzJzRWJP?=
 =?utf-8?B?dms3L0xhd0JydGVwT0JYTkNVKzBPdlRFOENwQ2hJWktoWjNzUmM1cEtRWTRK?=
 =?utf-8?B?aTFKNWxtcXR4bW42UEVqZ1Q3SDhhdmYweEdlNlkvdWJ0U3ZxMkYxejZrd1Fh?=
 =?utf-8?B?RmVBbXd3VkFVR0gvckpCZFJLK1FiN1ZCVDdnVzU5Y0xYaG43OEtuaVdQMFJZ?=
 =?utf-8?B?VkRKRmEyZlFNQjFIMGpBL00xT212aXBxMzRIY2RFQTdQV1JyQUs2dVZmLzdn?=
 =?utf-8?B?Yzd4ZGR6TkVSamR2cW9EbmtnMnptSlFKOWZDZkVGaGkxcWFVaTI1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca32a79-7510-4595-27ae-08de6e356ec2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:01:30.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bg0agJHEkhHZ/IDfHMcLxPblMQHGs+DZMClOi8dCRdSUNNVWjLFSWAOVnlAy1MXU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9403

On 2/17/26 15:28, Philipp Stanner wrote:
> On Tue, 2026-02-17 at 15:22 +0100, Christian König wrote:
>> On 2/17/26 15:09, Alice Ryhl wrote:
>>> On Tue, Feb 17, 2026 at 3:04 PM Philipp Stanner <phasta@mailbox.org> wrote:
>>>>>>>
>>>>>>>
> 
> […]
> 
>>>>>>> Thinking more about it you should probably enforce that there is only
>>>>>>> one signaling path for each fence signaling.
>>>>>>
>>>>>> I'm not really convinced by this.
>>>>>>
>>>>>> First, the timeout path must be a fence signalling path because the
>>>>>> reason you have a timeout in the first place is because the hw might
>>>>>> never signal the fence. So if the timeout path deadlocks on a
>>>>>> kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boom.
>>>>>
>>>>> Mhm, good point. On the other hand the timeout handling should probably be considered part of the normal signaling path.
>>>>
>>>>
>>>> Why would anyone want to allocate in a timeout path in the first place – especially for jobqueue?
>>>>
>>>> Timeout -> close the associated ring. Done.
>>>> JobQueue will signal the done_fences with -ECANCELED.
>>>>
>>>> What would the driver want to allocate in its timeout path, i.e.: timeout callback.
>>>
>>> Maybe you need an allocation to hold the struct delayed_work_struct
>>> field that you use to enqueue the timeout?
>>
>> And the workqueue were you schedule the delayed_work on must have the reclaim bit set.
>>
>> Otherwise it can be that the workqueue finds all kthreads busy and tries to start a new one, e.g. allocating task structure......
> 
> OK, maybe I'm lost, but what delayed_work?
> 
> The jobqueue's delayed work item gets either created on JQ::new() or in
> jq.submit_job(). Why would anyone – that is: any driver – implement a
> delayed work in its timeout callback?
> 
> That doesn't make sense.
> 
> JQ notifies the driver from its delayed_work through
> timeout_callback(), and in that callback the driver closes the
> associated firmware ring.
> 
> And it drops the JQ. So it is gone. A new JQ will get a new timeout
> work item.
> 
> That's basically all the driver must ever do. Maybe some logging and
> stuff.
> 
> With firmware scheduling it should really be that simple.
> 
> And signalling / notifying userspace gets done by jobqueue.
> 
> Right?

Correct, I just wanted to point that jobqueue needs to keep the workqueue rules in mind as well.

But you really need to double check what drivers are doing. We had more than one kmalloc() added because we had a warning of to many variables on the stack in DAL/DC...

This turns into a debugging nightmare if you need to re-init the display during timeout handling.

>>
>> You also potentially want device core dumps. Those usually use GFP_NOWAIT so that they can't cycle back and wait for some fence. The down side is that they can trivially fail under even light memory pressure.
> 
> Simply logging into dmesg should do the trick, shouldn't it?

Nope, not even remotely. A device core dump can easily be hundreds of megabyte in size.

In other words it's the HW state you usually attach to a crash report to figure out what's going on.

Christian.

> 
> 
> P.

