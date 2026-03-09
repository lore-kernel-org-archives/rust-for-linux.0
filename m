Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494581D5ADE;
	Mon,  9 Mar 2026 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773022823; cv=fail; b=nXpwf4OPiGKMZiiVCsZdC8onHXAyK/CN5ro4rjI6fc7g1py1AG+MXAth3G5eDfPvC9ApL72/rgNBSiuQalehYA7AeJjZ9RTijktmkPXg/e9+RzSok2sGv/vB1wnOQDuFIm/2BmfCsvmFj0cCMJhmFTBMvd4njBy3sPsP1+rsoLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773022823; c=relaxed/simple;
	bh=yykcu8xAo/fpIUj+8d3H993ydjDDinoPvoQxZfxRj/g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cNyLbVe2IU9BuPYjmNeScZ+fKkZCudYcJrTe6cx33ivOseapDt+gwrzRDUZWxtd3e92/JyxEBSiFyoVDy8QLo1Ma/ntkwGNwXHvODldj6E6RTLBoo1swX+2dzSo7umuhAlLG9Iv/OeDM98mXvSonXkM5wOCCo8LNUjjCBgQdVNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bX+X9omp; arc=fail smtp.client-ip=40.107.200.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bX+X9omp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5e6aqhQ5yXB3/ULByP58l2zZwVS0Zc4ydPUbXzHCVw6wf0iz60IYe06Kj91UZHqcY8xAu5bNB9pfd9UJyWRaJ/XPlaHPi9n6//BbpNJWww5fVluecnzROn0/w+f0A02Ml0erU08St8ytQoYI3E7iq1mX0IhGWFMFGOVtIC/62R/N16az7VHKinEfvcQ0ASodPKFJtDzhgWT966SWacOicZeRWO7MqpLwfnHwrgqI8cHfoQP0ggaBZDtNHtOlZTifqqwVdFE53t0YjzatvLPJ5b3PJVfSwkCbkUL377eQdHmuCihBZgMYhqn3gyne1qcg44b8hce3I+bB0CVFXQ3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJOZQtGUrvavot1fXhXoUZ1z83FuSe2bgrQ+hKnwTrc=;
 b=Omaks0tggyhM648nsBEAHoiK8FdX3DUbM6wJ07IQXtu3/KNUxkO56jBg8GaW5LaOyX4gyNUgh3AyK11xBV7xI+Zc3DEMbE/m4XDJKd9pbrRtrkwO3fbEvYq6qGDObN9EPa5KAt/5b+L2XQ8w6x2ZrQR9+HzI083IKAEloChEJQKFOFoktIVxhnGCZkCGdyYH8PpZKi2klLBAcnM0d9KknsDxxQjISimCB5AORoSgsEji/6MBxyhnzb9HZIIWlkxTRZIf/bwUB+IkPMBRhEaGuYxhEDKA4vDbexb6cg4oHGoft8kSIXV63v8VQ38pzbsj608rS7Iedb4xVoUxKgD+yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJOZQtGUrvavot1fXhXoUZ1z83FuSe2bgrQ+hKnwTrc=;
 b=bX+X9ompxqEdz5wPcfVm2fwbUFvugIrTM6T/B3JUqgGNs1xM44OgwqR/5+wxHkIuUsSHsU2+TSdgCtbtW8oI2Wv/w328i/yYeWc7J2OXZQi2CQZHzOXR10jlbb21mJx8+jPWPyChqdUY9sQjfuI6wYVAow9tVtK6KGJHQi8QG++o/tPKYF1j5etFaIVUs347OVTBTYcvTHjO41rf6SGJsu8M6kDcTL1wftZRHvRdSgwR6huUuKUm/t55ccPGezmZcXBdVCASYNG9qf8yuEn2KYPa5h04ep35lPSA7ZJc+b3NBLmHiC+g2XyQpNEbqD60PSWRfXQzFdlzGCFXKcT0pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 02:20:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 02:20:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 11:20:14 +0900
Message-Id: <DGXW4SG5QR2B.3F9D9DY4ZUUN6@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGXVJHQQN0N5.QF485SVNLCNJ@nvidia.com>
 <3771a92d-5d8e-4069-8372-a6e964725e9e@nvidia.com>
In-Reply-To: <3771a92d-5d8e-4069-8372-a6e964725e9e@nvidia.com>
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6a899b-be5e-4f55-dfa5-08de7d8267fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	SskZ4Kd1swNF+aNoFY38jZjX6DJt7ZmHHXuYHzlFAKdre62lSmsQw0lb3cfR7BQdHb4uXF76y0gIiSRAQ9mrkmfLFERAjoni1K6++OFdpTz6NvdS6k2LdqUnlgMzyiWaiQ9rgJjQW1porTJ/Hi3yxwUzWaq5NxHDmhwy+LQJKqASoUQnfWySeVsLh9JZoOAVBC1HL1XFwnvH2PCPujEM16utnqBIR+TswmxeaYli6ArH8/lTKx5Qv0QXDbjqrR/7RzWsfyHzM6KJFIpprmG9kW3CrLwZxLNVfiC6R4eEch2PvAUozVdYyFvBixETvkHz2Nk2Yf/nEUMd7UXP0tuFo1L/jcGFOZpUNRVvHo9WnizChtX8niaV+8QW5LCutP6K749efkNFxWofWp0L0mieGJn8ors9M0bk2UtqbdhoCr8DKIYz+w6giOc+O8AaPKpF2CHGa2QkrCOJp5/naod/z0xzhcxzVsZtmXnmRwZ87HdLMXU90Wpz/LAE/sKFoIrwzl0XE1oDgY9wXqum5gsY4I3DLshRd9skZG8Sqmn2kdHfQ6uMb/6j+n+AYQpRW6QG2L8Tk4o0WvWkzLXXkH2A2W2GNuRVNvM+Dik/MzInoPaH8RClZSfDfgNAzok4cyp9UlIz+VN/BNK86H23E+55njcD25lH4yA3tp9M7/O2HWpVVWpSCVIwsQBUZ3Q4vnG5tky+C12bQSh2tc0YAQaa4BNwDdZZ32d1HDK12Kd0NWwmBu3/VS+FVFrgIZxC1iA6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVRYUW9udFp1TDdWdWxWblI3ZEQzTGwyVkZMaHN5TWp2U0RFWC83aHNacTlQ?=
 =?utf-8?B?eDZsZ3hyU2kzb3RPNDFNSFFFRFcxdG02NDJvZjc0SUdMNUtsZ2hJdE5xaHV0?=
 =?utf-8?B?OGtxKzlkVWR1V3JBbUs2VGRVd0ZpMjFoMXpxempVd3k1ZXZldGJSa0s3d1Nk?=
 =?utf-8?B?YjZ4c1psWjQrVHh0RTU2eUJ2enRlaVpkbzk4a3lJQkpTTVdTMmFSVHUxMHVB?=
 =?utf-8?B?eE1yZGVxVXVUVjBTZlZCS3RPMnNpSW9FNzBKaUJoK0ZpRERHbFVZRU92dmlu?=
 =?utf-8?B?cjhsMlNrWm9HSncxUDVLVFBwb1JWeTd4dWRtb255QU90VXFvMG04TnJtdEdw?=
 =?utf-8?B?Z1RaNTJxM1ZhUXNXQkM4YThmVFhmWWtJWVNlZmt3bU1HL2lzTWx4MU5mVVNC?=
 =?utf-8?B?akR0Wm4zY1Q1YUNMTGtGc0hZdGZjbjdEYndJT1F3Y0tEd2EyNkpsRkU0SGtk?=
 =?utf-8?B?ZnhNYVo0U3VjbGdpVEMyRWJSblhxOUNiMjZGMmR5MklRNXRmWHhpOGRxSlRB?=
 =?utf-8?B?N1NPbVdNQzRpLzhkSnNUVnNZUUtzb0M2b3VRalhZRUtvck1FRHNYcHI5NWVn?=
 =?utf-8?B?Vmt5bWh5N2ttcGh0L08xWG9saEZFd1l6NnkzQnhtQ3pmV3ZwY2I4S3pKVkN5?=
 =?utf-8?B?TlRtUStxQ1ZvaWNINktUTXNzWUpnNnY5d0FINXJXRjRVSXZmWjJ0QUtZTU9k?=
 =?utf-8?B?cUE1TTFlUHBYK1lHald0c041OWdZNGVubXBOVkJtbXgxVEdNRWttaHFva0Jv?=
 =?utf-8?B?QjlWTnZTRFA3dENoZXRnSm5ORy9BQVgrWTVPbC9sVFM0SXFQUHR0czlYWjNG?=
 =?utf-8?B?RG5sMlIzejBVMisycnh0andrQ0hYcDdyTUcwYWlEYmJzVVdUMEpic0h2ZDlz?=
 =?utf-8?B?SlhJZ2k4WGN0N010MW9XQ3ZIT0FqRTRjcVh4MlNtUzZTWlVIcEtScjA4UnhP?=
 =?utf-8?B?WEl0dkVJQVluTEtGejVEaGZOWVZMQnpnOTVYZW1ocVVzWmpkVk1Gd2FiWEcz?=
 =?utf-8?B?OHN5OHhBZ203QkdVdFlwSlozTXcycmlxTlFDc1A2ZWM0cEdVMDR1eSs3ZDhE?=
 =?utf-8?B?eWhpbUxJNHQyazN0OURWZkU5R2FhVEZCN2JpdHRkYjFkT0RyTVhiZVI4eVQx?=
 =?utf-8?B?aExidXphT0c5U1BqbmpCbXpJN3U5UVhValhMb2J2ekhHSzZ2ZTdla2s4MG9u?=
 =?utf-8?B?LzRHSllqSnIxdm9sa2xiQ01yemdocm5GbXdrWFAvRnRINUFTZm1VYXJBbkxD?=
 =?utf-8?B?L0NheGYwblg2K0xJcGhGSlgrdEJwVnFKWUo5UlpKTjR6dVQ4b2Rqc0NUL2E2?=
 =?utf-8?B?TEUyWllkRWtmREJSNDUrcUdRY2thQzc2djQrbGZ1Y1JyU0p1bkdzWmdncVUr?=
 =?utf-8?B?VzJBY0NtdmFxb1VIMVNGeGRIdVJJN0ltOHk0VzNGMExlRDdUTUJDVUxCajUz?=
 =?utf-8?B?WFU4dHBmQ1Y5dWkwdWVWTHRGZElwelJzZnVYeGRTVTgzYjJEKzg2SG1iS25R?=
 =?utf-8?B?RmQzOTBmd2wvWmRNY2I0aVhWK0J3ZStHSEJUbTBsUlRHUEhpYVpEUkJ3OExK?=
 =?utf-8?B?T2xJZStVUFZaUHV5SFI4NU5MT0NJSVozN1U1eEF0UHpTdG9Mam8xbzFmRTVH?=
 =?utf-8?B?MDA3UzBJUUdrSEdkSExUcWc0VDN2UThIT3RlUlQ1SFRoVi9hMStRazhjMVc0?=
 =?utf-8?B?cmx2ZmxWd2F3T0RGMjB2MW9aZTJydFZZUnNVSEl2QkcxRzJrR1JBOUtyY28v?=
 =?utf-8?B?L21FZFpIbC9zaCs2TGpiWk5Ebyt6Q3dTbFp4cjZQOUd5c1MraXFJMUxLSkpt?=
 =?utf-8?B?M1hzOFpTWXc2cTJ0bTczZmFpLzNyMklIS2FBRlI3WmJibjBqMDNPYzZRVUh5?=
 =?utf-8?B?TSt3Z2ZTa0VDZndBT2E1MUJwelg4RlVUb1ZzUHBWWEFIV2NrZFo1T1BRS1JB?=
 =?utf-8?B?d0s0SUtDUW5ZNkUydk5IVDJLZkVsUzEzWU1NZWNTN1RsR3Z1aDNxRVZPbEdE?=
 =?utf-8?B?cjhvUWpTQmZ3QTNtZFdRR2VPT21WaUZqUmN2MXBURzVqMWlTSC9OTHNoRFhW?=
 =?utf-8?B?bHAzVFNFU2h4c0xIOU95cXB0STFSbUMyRWIxR0NpbWRXbVI5NmppbUViQ1lx?=
 =?utf-8?B?SzArdnIvczFudU05T2NLV29aaGttNlorY1BEQ1pZSlE4OENzdkhlMmIrcGF4?=
 =?utf-8?B?Nm1qTWNsTjZIQm5PeUtnUkRxMmVZWFd6aTZCZlQvUWtFdzA1NXovWlpnTXl2?=
 =?utf-8?B?cDRhR2RvQ29HS0ZBa2hMKzBiRFhWOU1NL0N5NDR2NVRIelB6WnZ2bTFzaVlG?=
 =?utf-8?B?K1psL2hQSDk5a3pxTDBZYXJwaFVPWmNxaTNIcC9nY1ZoTDcrQ0hRcWY2U28y?=
 =?utf-8?Q?4XZxb3ULRwnUcOXc4iK24THXbaXeDzBvE9BgMVPkxAyU6?=
X-MS-Exchange-AntiSpam-MessageData-1: dSGZziAm4OXvaA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6a899b-be5e-4f55-dfa5-08de7d8267fe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 02:20:17.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juHzg64g245DZJ9KIsyC9zpxirJ9jSiAPjXohoevK3BufcdVMSHZb2nUCGlx0NZtxRHQX/dsiglHxrEeAHx6Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893

On Mon Mar 9, 2026 at 11:06 AM JST, John Hubbard wrote:
> On 3/8/26 6:52 PM, Alexandre Courbot wrote:
>> On Fri Mar 6, 2026 at 1:52 PM JST, Alexandre Courbot wrote:
>>>        gpu: nova-core: create falcon firmware DMA objects lazily
>> [acourbot@nvidia.com: add TODO item to switch back to a coherent
>> allocation when it becomes convenient to do so.]
>>>        gpu: nova-core: falcon: add constant for memory block alignment
>>>        gpu: nova-core: falcon: rename load parameters to reflect DMA de=
pendency
>> [acourbot@nvidia.com: fixup order of import items.]
>>>        gpu: nova-core: falcon: remove FalconFirmware's dependency on Fa=
lconDmaLoadable
>>>        gpu: nova-core: move brom_params and boot_addr to FalconFirmware
>>>        gpu: nova-core: falcon: remove unwarranted safety check in dma_l=
oad
>>>        gpu: nova-core: make Chipset::arch() const
>>>        gpu: nova-core: add gen_bootloader firmware to ModInfoBuilder
>>>        gpu: nova-core: add PIO support for loading firmware images
>>>        gpu: nova-core: use the Generic Bootloader to boot FWSEC on Turi=
ng
>>=20
>> All the above pushed to drm-rust-next, thanks!
>>=20
>
> Amazing! I'll start testing on Turing locally, in addition to Blackwell
> and Ampere, now. Exciting!
>
> Congratulations to Timur Tabi, and all of the expert reviewers and
> refactor-ers to!

Note that you still need to cherry-pick one of the two non-merged
patches for probe to complete properly:

https://lore.kernel.org/rust-for-linux/20260306-turing_prep-v11-9-8f0042c5d=
026@nvidia.com/

I should maybe have pushed the whole series, but would like to get at
least one Reviewed-by before I do so, for good conscience.
