Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781EF1BD9C9;
	Sat,  4 Apr 2026 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775267212; cv=fail; b=s8f7hVsr8g65Q5t6dVGQBPBpi8SfVC96SHjZ6qg9Ouve1k4pclB0BMz4HW5zqkQBwvTI2hOkpaE8i308fNNxSlzBvtWSB9lTsjotsEtt0tHP0TphwAvzamfzEAm9hE2NeG4f8WxGiAjqex88hAdSc6U6nO7AOWlDpkxi2dhujqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775267212; c=relaxed/simple;
	bh=eNKi6wBPgMJSBpogaxiGQkDaPH3roUIqrjzdAqBBITo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VgnrJlKPy+pqDkxT7ZZW9GAAa0GWlygXclVVSR+cX2Tka+Ga6VoZJCvQrCaurKCnGECogSVpitxcFojbJy+kybZET1hREev2k4TgVVpUzJ9h5kJD1hiFsSkCWbp91vych21tzQMNLYiAFTqo550tWMm23MocqygLASl1E4vFIU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hy8uAP5+; arc=fail smtp.client-ip=40.93.196.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hy8uAP5+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gghdvIU4gJRSlGnlGTmLzFdJat7l7KuKQTC0/F3AitQRYJeZv6NM+epTsOTtEhcDJ6pnNLbL65WFq+FmUHLU7guABCC3ehBDZOJ0tqDysgUBn/L7JSilQiOqDyEZfPPZmXsc9J5J9hOiIUWu9weKmJ0LqlXgJRG8S/jp5ge7EOEeM8y4mjvMa9s+FvpfE1/5N7xJntgr8ZnCJhtQ4nYmo4xOKteF5Zk+kn0Te8C2Y+6/qz4DqgwJ5tcqqIm50Q+25E9lQBxt4i42nKPVwH7+X2oDwlPAVjwMS9JoFOpLatvHCQKRUfeGmaFzVwBUA703co/dbE2y+U5a2WotNitGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VmBrwovx0yFj+4PHFB5VturU4tNiguLpXjghkkxnZA=;
 b=hdieJ0xx2vqTUzlonyrUXkavKWYJLZAxpkdwKgvMczObYXjYoqGrW0Px9Kan1D3iHeJucxxiCO0O74Tu8ckO9+rnVJzWTMyI9frh7DxMeWxBKvsNw67ZRzDOIalv57JnG3CZ0Klc2R5Flbl6eS8wAMTzpjYpd9LaxNeyMKEuuKXaWjSUahXyyh1xSSi97sAsZydWlZ7DCOQTTW3aMe48/tb+GJnlKlz9E5ANW5RB1eZ/3GhFXc7xxlqAMEBbaHIJKAKPgATfU3wHzCDiB37o3JihKjuEPuHzXjYiez49i06BF9uw+w4/hjrJ8NiOza5D2pb4SCWcQWJuS5Q+7BBDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VmBrwovx0yFj+4PHFB5VturU4tNiguLpXjghkkxnZA=;
 b=hy8uAP5+UlJBsxJIj29Vc2qS+zxIkkhpLqvlzSX6Kofmruy6DVJEZ5RYN8EonLQawI5DPQ51stmu9kbJ2kHyVeTQ7G37A1cmneWDKZcVcFEafCEpchaU2I5ydWsvb4FgPhNX4qVP/EbZkYO092xVcnlVsMclvUQQ68EzmV4yJwsgugz6EXSKAI2a6G5RFyquElDMMOLMCSGSjn7VVa+QgreDc4jSTZLArMiY84rrV1mm4I0b3EUNQpn9s4mT8lL085FRfbOaRDhv80IgLWQYlbQqZS/w+NhYgTq0MsDPfn0ukJ5uWnQGScugHT6ZkYbN3TuMAn3UJJSKZ/zWkBiR4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 01:46:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 01:46:46 +0000
Message-ID: <710444ee-0c0d-4257-9e4f-1f0c73e79ee7@nvidia.com>
Date: Fri, 3 Apr 2026 18:46:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, '@google.com, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
 <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
 <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
 <DHIACQY3YL4M.3F7LSF1BZBUY6@nvidia.com>
 <f2ba20ab-7c56-4e57-ae71-06b35a696a44@nvidia.com>
 <DHJJJNP5T5FZ.2HWBMOEEKH9ZR@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHJJJNP5T5FZ.2HWBMOEEKH9ZR@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:40::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf1894b-5f52-417b-9ab9-08de91ec0755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aDyPx6e+q416rSZAsPgqrWnHC2K0vYVJlDmmamdRIQDzgdfa2nyLPc+9S9ZlcLMGb1jSSdvT/0zGN1T8sbVfMSOmf33cUPraz3+Rz84PF1eQnJjeaqs0M9ySqpOZiFQN68Tdoe54Bd8Jov4EKkg6HL0l0pXycbuW6v+EUONZOICZ1jKLGdCBErzNJzp4TqTeUnfrIqDIvZWOnLlFyrqJH2EMH+P7JvK/YuI/QIJA8T/ymUlIpsul6iKdYhp2XwrxNnKRcgiLVbVpCsTOokT4113KYK3gNpPqLFl8cCTEC/Z4HWw3vcwC98UqqkFY8nzlWQZN79wHvNFOLh25PR6PQvfu4XiJ1t+PpoJqhU6EEyWr2UOJ6vXkntFvpPWxZ7gujP/99cbXAvdNiBr76mMwSPlue3nvKR0DeaCzTdgtREcpehVCMhmK52LdyftEhImWwm5rVUSMvYS37QUpWnmnosCdzDUuespKNS33DrszGr7dDt6WzBXuoRmVk0OPTdzlpV/kN3/Ko7dTdPxEB/d3HgadhsGATBj5QTP9Kn15DIlrk0VwOGN9GNt2BFf6mmechadRYcRVboCIgSDghCymBcsCx5NeIZoA036/hnNopqbVCdGUxetCgRMRmwVmbugu9d3SXhOBZNUOwUFjYjavt4fC0dXUFCp+pa4QedkpexeRhekdgqDwdJn1bao91PVsppOgIxFNSFljPlCwfB0rRcmecvSNWLe7Rk0xjUBqcQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bytxNS9TcysvY0hKZ2RXamZXNUx4MEFNSWJBOTNtQWthT21qcm1LUmtzR2g3?=
 =?utf-8?B?cmxRRkJ4VFFVb3JYM0kreHZHbVJDcVZjaUlVa3MwdmxmbHUzaEN2MDBIS2Vk?=
 =?utf-8?B?bmZCS0VwdGNsMVcrOVNScDgrSW9xaHEzdnVpRFlVV3BTeEoxR1BYR2Q0RHlt?=
 =?utf-8?B?RmRaRkhwYktLSFJ4VGdWL3dqMGorZ24xbHU4OHYyMnpvOENibUg4L044alJG?=
 =?utf-8?B?YTRmeGViRTRhaEY5OHhNWmRLMzZIRU5CVFRmd2hkVHdGUDh5d1BNVDZGaTNI?=
 =?utf-8?B?V0V3VGJueVZLRVNLRGkwdmM0LytldFFjSis0Ykp1MFRZTWZLWW1vV3VWWXU5?=
 =?utf-8?B?NitaTCtPc1lzeWpVUHRVekJwUWk3ZXVWWHpXdFFycVVEYzBMNmN6TFQ2UWoz?=
 =?utf-8?B?OFU2OTgveldhTUxReGNGQW9BcGRJV3ZGcVFEYjQzcHgwNEdkcVNjZGQ5c0Ir?=
 =?utf-8?B?VEc0WUw2eFNGTkJlb1Z5cTV4eXBuOERrbkkrSFZNUTFQQmZPSWh3SjhWM0VJ?=
 =?utf-8?B?RnRrdWFCY3dyKzZScnN1dFBNaWZ1dnBlTEhxQWphQzQyNnhnTDBXbS9zeEhP?=
 =?utf-8?B?RUVaRTFONHZjVGR5SmMxZmtGL3NHYXFxYWhVeDRJSDhkT2ljc253QnFVZzZx?=
 =?utf-8?B?Qld5R3gzUzNOZGNmM1g1VVAvTDIvTkxGU3g4NjZHR25wekQ3Z05RcWhOUmND?=
 =?utf-8?B?bU53QTZ5azBWaUQ0UDJ4RDJ6d0pjRTc2VmtpL1Z2ZzF3eUVPcmZRa0s2YldB?=
 =?utf-8?B?MTluR1BiaTk2RHc1U0hxOWNIVXVpVWVTMmF6ZmhnT3htY1k5elFOekNidk8x?=
 =?utf-8?B?dlp5aTVOeWhPb3FWSU0vbVlmS3ZSNFI4aEM2UTF1MTRKMWpmR0J2Y0dGc1Vh?=
 =?utf-8?B?Z1dRZzZIbDY3MDUwbEF3MTlYblpzVjJ5LzU2TmRtT1ByREpHTHpNeUYyak1t?=
 =?utf-8?B?Q0FYdGY2N0J3NGo1aFM0am9ROVljV3ovWUZmMVV0Rk1jcndDTmozblJqZ3Ux?=
 =?utf-8?B?ZTJBYncxYXUxTWVpMUcyTjFjUUVOUDgzOGlkMk42ZGMrZ0xOZjkvZ3o1Rnhr?=
 =?utf-8?B?eWhtUlM5eWRzcDBXRG50Ujkxb0FWZDFuSS8wR1lPN2wvNEY2dnNKWDNHVmdx?=
 =?utf-8?B?K3pCTG13em04OHhIdUtlS2xtR1JDWWRUQmhZU0QvNno4OUxDZnN0OWoyZFRI?=
 =?utf-8?B?SHhUa0tOWjNvV3FYdFVKMWNIRkZuSmZ1K3VHUDVLNWlTYlVCeHVObGdhT05F?=
 =?utf-8?B?N3EwK3Z1dU11bVZvZ1UvS2VXWXJaZVB4WFhRcU8vOWl6NWxaZW9KMHFUcllD?=
 =?utf-8?B?Q0gyaDNoZVczVjMvdVptMjdUeFZOeG5NSENZT05UdmwvWXI5QzBGWFBPUXNy?=
 =?utf-8?B?SGF4L2NYVEZDMjBweHltNTFyVGxlb2h2a1hVU2VGL09EQnJORjd3M1JZWEEy?=
 =?utf-8?B?allnc1hnTFNlNHdDNUhtT2FCWDQrT29JeFRPeVM3eSt6bWVJbStLTTQ2c0pn?=
 =?utf-8?B?ZC9ZZ0tyVjRJRlhqak5CUjdoZlcrMURTNUJJTnIwMlJNZnhtaXJyTUNYUVd5?=
 =?utf-8?B?UHpnbmpNZkpBcHRsMzVEN0NVbzkycnVTQUNiZXZtNEVLd1l3c041Sy9FcXly?=
 =?utf-8?B?UHFEaVJuclVlci95NlEwWVFoK1lSd1hFTW1TL2RJNFNnczZyengvclZOTGVt?=
 =?utf-8?B?eUNJdUNNdUVKZytSR1EvelRQZ3RPaXc5YmhlMkM2SSt2VElicFBqRWdJRmtG?=
 =?utf-8?B?clFnTFoyT2lIajdPUUVtQW1vUnhBeElZanQwR3VCMlZySEFoVU1kSUs0emlQ?=
 =?utf-8?B?NnBTQVI0endDTjVzcFRNTG5KdnZsUStHeWpOcURKVlQ0U2QvSUxkbEpodGx1?=
 =?utf-8?B?Rys0bWhPMFFLMWw4d0xpNnZKOUFrNEdyUnJoMjdHTlZTa0ZqdmVhN2NITHYz?=
 =?utf-8?B?Uy8vRHZPQ2JZdTJTYVkrZy9NVGxwOVhPbmdzaVQ5SWRKWEMyZWppcUo5emdp?=
 =?utf-8?B?eDhkQlRYSElNcjcxRXI3NURlMnBXdnhhNUFEMzNmOCtsZ2ovQ3o2WUZjWTVv?=
 =?utf-8?B?cDhOdTNjK1p4OEpvV0FTUlpBczZXdFNrVFdNcUhiY05VSlJ1NnRXZmxZRjNl?=
 =?utf-8?B?RTQwRDFURmQyUHdKWnFVUlhjT0w5bDdia0hEZEZnTENSNnBQcERxZ0dtTTRz?=
 =?utf-8?B?eEtrNmR5c1VPRkkvMmJDQzV3RGoxQkpaYlNublFMWmtndDNCUnR5TjhrUzVt?=
 =?utf-8?B?MmNFWER1d3ZrUlRNZHhjUmNtcjJPK2pXOHI1aTR1UkxOVGQvUStyZk9CUnVR?=
 =?utf-8?B?cVBLNHVJMiswK25hZnVZUVdwQjBodW52OTJlenZWWGNJTHVkZGNzQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf1894b-5f52-417b-9ab9-08de91ec0755
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 01:46:45.7471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2CfKPCGC0W1v3JXbRl+xNPQE+IAqIBAXS1WZLyAlXbcrWtHv9Q/x069nEz639QLxT6MnDSltENsVxb63j60uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838

On 4/3/26 6:07 AM, Danilo Krummrich wrote:
...
>> Anyway, I'm pretty sold on SizeConstants, so I'm hoping to stay with
>> that, are you OK with it?
> 
> As mentioned no complaints from my side, but I think it would be good to add a
> TODO for creating those type wrappers; the name can be revisited in this context
> or a separate marker trait introduced.

OK. It's a little too "future design idea" for a code TODO, but
it fits nicely into Documentation/gpu/nova/core/todo.rst, so I've
added a PATCH 3/3 for that.

thanks,
-- 
John Hubbard

