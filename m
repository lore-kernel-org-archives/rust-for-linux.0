Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2352C3DBD5F;
	Wed, 25 Mar 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446970; cv=fail; b=XTkmYxzRPOI1pGxrjzRcBNGWi14ICLV8GQwTYJ/w8+qbkc8eGeE42O+pR5pcLQopG3dfaTWWTq9TbiJ1IBT/gf+BX1SYHzb8uHb8f/6uSis6IBGnGwIihc1kwB8GqNLfUUNmzZhk/kYvg5g0t/XXhj1YNx00mBrQrf2PQhCeKH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446970; c=relaxed/simple;
	bh=zopmSQM7Zsz8614D4T0CMT6LDTJYrSzY/Au35yckFi8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rxHOzw9d24C8+15JtEEMu4jvywDTuRQ3KWjTH+FyugLajUlS9HXRGZ5mYHHQrVgypOsEsNNCYojCyKKYm8HiTtLNeT6OIJBMg6LYO48Zubo7376hTkKkb/6VrH60hGcJTvSVtOWTEchamfMQprCX92STV9ysgQ7XJH9kbUs5UQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nEMndyEh; arc=fail smtp.client-ip=40.93.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nEMndyEh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFLUZD456iLdacHQ4sICBXlMGwqekz52IT6L2LVVFPZDA0R+YjyJg3FZnnB8JzmqYy10p9hpRXpgazKxkSh0t4MtP6lo325BS9ZUPDK91urxrVnBgbwXbtV/YHAj5ef4eAgTSdvGZx0dos7PRkBiiL4zWiA3iN9ZQtaOoFeLyxr7p3n+Y0GnU9UfrYLy0j91sU6a8/CrUdYAiXzYp4iuq7YQFYSQ99TRxX7AIM9hp9I/8lOqD24TMG+Ke4Nb430zji4zu8vzDPKTbepqtooQeLhdGKsgpmp24ocjWAKOqb1THSRPbKRE3uCmOdKaKHKgTWCZKCnLxTturrXlipxxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zopmSQM7Zsz8614D4T0CMT6LDTJYrSzY/Au35yckFi8=;
 b=UFiQxuCsFd5UC9vCJS9tRI6JgNs4+ZC2cJqVizZJ0Wbg447IWzRZP8oxvd6MRN8atkOyIxpOW+/Chy1Alvybo2Nz3lxfCdT0p4BJiAiJxtm9nxeKI+CPKyhR7KG+DP4jvzqAifflPMsDHmcK2BlUTVJSak0O7/8EgsjgMjtpAwQpP1tpzahmWcAKlMSHvtmAiuQZOm/Pg/y5362Y+nJo9jye9JpIR9cb09wo5fDVtqgK1VyHPhPEKA66MhPkCkBAwQwvl/uudpth0Bfw53bvpfyqEpWFmDWdDbq44FwLMjWslOxeZ1PpYBKae1NUl1xT8kMc3XDe0E64c28L8O/tbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zopmSQM7Zsz8614D4T0CMT6LDTJYrSzY/Au35yckFi8=;
 b=nEMndyEhoFPhx4UzDDDIATBToO/dAF4voAUI1gO4l2+be8VNF4Ty5AIBq5FatYPiR38+TV8cR31TE6AgFSSXMmDFAVFJX/iIykJM9NYy2+bpgMN+evGyN2gjdt2Iri59TUceWwAAecEANUUhxNj2JVUa6jR3xzjRqqOMt3QC/BbzEVjAHM4ib5STu021ssumDxxKzdO5UgR5DRst8tBFCVi50QqKv6Aig1vfD6WWgh0FhsnvqCyyVuL/IqEE8xWlB8JvQi17nMkDI7wHdpCSjLmk5H7kRABNyUdWsKzIX98jcm5Pr32+p2IUE88FQ7nCVxnKLfVPT3sI/zs94dRQQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8988.namprd12.prod.outlook.com (2603:10b6:806:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 13:56:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 13:56:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 22:56:01 +0900
Message-Id: <DHBWY8LT8I4V.6G9V1VPIB4DR@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 05/31] gpu: nova-core: set DMA mask width based on
 GPU architecture
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-6-jhubbard@nvidia.com>
 <DHBTVQ5C8GWH.22YI7TVB7RWN2@kernel.org>
 <DHBU6553UHPI.1KNLKA6TPN79A@nvidia.com>
 <DHBWKM7YMGFP.2BDTKGCGRGTUA@kernel.org>
In-Reply-To: <DHBWKM7YMGFP.2BDTKGCGRGTUA@kernel.org>
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3777fd26-4440-492b-fb42-08de8a763ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ud6WSONSGp5QE06nUVc9NdxJDoCIommBB9JmGjSnsDwnQMgUZzAksC7+8xFjUy42KEPGdHLM7xbhPZgM+WfZFdlI8Okugqe+E3STIgIpY3MKQQNAwwm2TmA9Ampjlx2XyHru5ZB9OjDwZX8JzxWuSw+gmCQJ+iI/c6ItvEzy6p6anv6/OaoVT8WQCIoqxbDDG/uwzu5eJkWLdEud8kUg5HjboQkxfyGfgH0yM95CL2CQocjYfDsm5U1RlsYNiJVmE7SndGDQeo9/7Caa2+FzmHiZt6D2FeIkih6rh/OzdkUqxxgbgLz+2gX03p8Duieo8qoEJ2U+diTWgRuLTaTP/PCeVrRklG8f6mnuJtMemUxsPWrRLO3fhbYwghmYJLAXbyb7mWA7pejL6WD1GU8dc5/uGfJKdPxSEDAY3QvOIs5n1hHEuQKd4P/DIRipbhCCBuV+0xRp867yVCLAdOtY1edf2c/S9KzknJ0nsOeGXAzzOFvQ5lf+TrZlZg6xvw9t6Qk+i+Dctd3m1fFMgjs8EZkUm7Gt/SjVmSb/Y8/I1QvaI3SlHS5OvKfAPEukeQvm/nKVU7UsuQUBo3Q+vnFjf3JSVh5LLle5k+DpeH9dHwSvd5t0HDCOxA/xnijAfr02EN8kfbFP4pXY6h1GyUWpQI2V7Sx86rLpIAjMqnhlOZ9ONAEazHj8WyQirdswIQrtqO14h67KYpI5W5aTsbRXRwdiIZmr9YkZ2aiccI51Tqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzRBQURZaVI0bjE0aHMrWEtuampKQ1pJajF0aFZJcFRnZW9kTzcxdXJmaGF2?=
 =?utf-8?B?bmNzMmFCZDZxMjZOSEZFdUYrVHh3clVYU0RhRXlteWRleS9SRWFpZDY2ZXlO?=
 =?utf-8?B?ODJxMUE2cUVWZUxpdU9uS2hndnN4R3UwZU9ENkEzU1ZBbml6cFR6emZpYXRo?=
 =?utf-8?B?a3Ryajd0cW1hYzlOZ011UlI3dXFkK3B0bTN2K2h1N1dGcCtHemNwa3dSNWEr?=
 =?utf-8?B?bzR2ZXVka2dMSFVSVEovbHR6STMyL0ZGVHJ1aUtOMFZHckczbEQyelYyZXZM?=
 =?utf-8?B?QSs3S0NqWXBHdXlMVFhWL1pNNXdCZGRiT3BMMUEvelFiWUxKaE9mRGZ6Q0lm?=
 =?utf-8?B?RnpkQkFiYzZCZWxVYWtrTkpTMWViWDZ3SWpZNllGbGFuRjZsUnF6M0NzMnF0?=
 =?utf-8?B?TW4xVmhkMWsrQVB6RkdYU1pWaUMwUG1GRktSQmdZUEhaK3ZKYzRtcFhmbFlU?=
 =?utf-8?B?d050WUo1K2VsTmk2NEtwTGhHMG1QTGgzZGZJTThqVXNRTURMNllkRW9NeHVs?=
 =?utf-8?B?WkxWNGN0VitxMllCZHpvWnhFWkhKUlFHeHFFcUdKckdYVHlrUHE3eDVjUmJn?=
 =?utf-8?B?YVE0QkJkckpqYm0vTlhQcHk4VXJKeFMxRU5ndE5BVTNvelRsa2tRSmhrRS9T?=
 =?utf-8?B?MVhVYllWYStQaWp6YVI1MjRuOSs4alFmVlp2YkRNK3E3OElkKzJ0bWdrSWZq?=
 =?utf-8?B?cWpRclMzTGR2MTJYVkJnbzZEZVZyNkcxR01TdHNKdFFMQTZzNzdpV3R1WFhI?=
 =?utf-8?B?NXFwLzdKV0ZWMnc2SlhaanFDZGp2NGhVTFhqVENPc2didDVHR3BDSVJxRjRy?=
 =?utf-8?B?cDVMRjRYazJrcjY0dnkzK2hFTUdsSy9BeHU3QWVRT3JXeU9ITGNXZ3NyZnpZ?=
 =?utf-8?B?SWhFdnpuZkRjQ210eDd5ays0b2I2U1VRajdwaUhLUkJMVll6em83bUdpYmZl?=
 =?utf-8?B?RTlLalhIT0JyK1lZZ0ZUNThKYmlyZFFuZGJHVDlsR1BBemZMTHcxanQ3bnZ2?=
 =?utf-8?B?ckZCSHkzS2p5UHZJay9CNmNRVHpQNGZWREFrbEUxS25uV3FXc284RGx3Smx0?=
 =?utf-8?B?ZVB3UUZiOXpFbFlSL3NtLzcrRGorQm13YjBBUlp2YXpSRENTY3IrM3k1Q1Nj?=
 =?utf-8?B?R3ZTS3NOMXBPbjlJWkFXa05lVm1ZV0FNcVRoOVFvNithVVlsRVNPRGpDTnov?=
 =?utf-8?B?NXlGcjkwbnhCVHRDUytScGpicEliaFYvSjdxbUZadHRUY2lYUzN1Z1NDZGVD?=
 =?utf-8?B?RnEybE53d1JJOG5JS3JZcUJRV0FjMGR6OW96M0VwVWV1MlIvRVg0TThwT2wr?=
 =?utf-8?B?TjZWVEVrYlFOeTJKdUxVK1MxNTlHdm1xcUpjT2I2VFF5Q3dCNGVSeGdsRTJN?=
 =?utf-8?B?cy9wbE00K3hTYVJqTVN2MzFhYXVzK1BkSncrUTlmYVlvWTY2c0pjUStQN2dZ?=
 =?utf-8?B?RDlqZFl5QlV5Ni81clB4dkwrb1cwdnJvbTVjYUFraCtmZG1jcU1tbzkza3Vi?=
 =?utf-8?B?S21hNmZkRkl2L2k0K0EvckMzZk9KOHV5WFYrcXRqRWx4UDdCNDMrdTFNWE5U?=
 =?utf-8?B?SmdlNjV0d2VSVDk5bzlRRGk4MStDUUlYQzJCRTRTc3Y1cHRHNGdIbnJab2py?=
 =?utf-8?B?czRGMW9qR2Z6NzdhQlFpc2k3RmRFaG5QaUEydGpQb0FlN01qVEZaNDhBMlNz?=
 =?utf-8?B?bzFCMjVhaTJiRVoyVVFsc2prOTlucmUzMWVTU0VOaytOYVQzeE1Bd1hJV3Ri?=
 =?utf-8?B?ZHI1VkhwSkxISjZZd3FDNHphMWtINlF1NXR1cmI4NWlYVHM5YzNQN1VxUis2?=
 =?utf-8?B?aEZXbmF6TGVCUlAxYmRkS0VyMitZdEJHcFU4TEVtdGxtK3VWK0k3WWZ2T2dy?=
 =?utf-8?B?emxDWUpWQXlsVld6SzBkTURyVTNGY081dlI3VDhKVG5SRHlQS29IUUdCUkcy?=
 =?utf-8?B?cXFHUHNiU3BGY2tKN091czU2TmRqWTVReWJJTnZ5S2hPRGdKMktLbG9wVjgr?=
 =?utf-8?B?R3RxQ3paOVcyWnkvWjlYQ2JrL3MyV2J5d1ZXUUFOWnZZNGtXTzd4UkNPOTVU?=
 =?utf-8?B?L0gzUEZhaEZ3UXc5TFByREh3WEZXdUlvdkN2aFhpbWlTUkdXUFZheDg1dHNn?=
 =?utf-8?B?SkVwSWgwbEZITXgvSW5naW5MRG14eFhoMzh0RkdZRWMyZDAycy9hU3NtdGFl?=
 =?utf-8?B?dzVLU1d1aG1NYnFLQXFVbFpzaVZFVEV3V0hwaVNDMWVQTHE4UUhnenVRYzN2?=
 =?utf-8?B?d2Jpd3ZmaHJoS2pkQytLdjFQNzE0QTRoUy9sRTV3WXU2b0hMRGRQdEUrTDk5?=
 =?utf-8?B?WTAraEF5NGdHYVJTOHlaZkR6ek5kaU5LNHZBUXp1RTNKRzNzaHdJZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3777fd26-4440-492b-fb42-08de8a763ee5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 13:56:00.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRvjbVbUN/ACdroSb67OMkb3g+tAMjtGDgukeVqfou/Xhq0mH3m3zANUvd2KC6MjHY8F/C50HaKrcsA07nWUQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8988

On Wed Mar 25, 2026 at 10:38 PM JST, Danilo Krummrich wrote:
> On Wed Mar 25, 2026 at 12:45 PM CET, Alexandre Courbot wrote:
>> On Wed Mar 25, 2026 at 8:31 PM JST, Danilo Krummrich wrote:
>>> On Wed Mar 25, 2026 at 4:52 AM CET, John Hubbard wrote:
>>>> Move Spec creation into probe() so the architecture is known before
>>>> setting the DMA mask, and pass Spec into Gpu::new().
>>>
>>> Hm...this is not what we discussed in [1]. You implemented the change i=
n v5 and
>>> v6 and v7 reverted it. Why?
>>>
>>> [1] https://lore.kernel.org/all/DGC28K8J39E2.1X173NHT9ZJDI@kernel.org/
>>
>> That was on my feedback [1].
>>
>> `Gpu::new` carries no guarantee in itself that no DMA ops have been
>> performed so far; whereas in `probe` this is much clearer.
>
> That's not what has to be justified. Having DMA allocations before settin=
g the
> mask is not a violation of the safety contract; it is about concurrent
> allocations.
>
> That said, all DMA allocations are on the Gpu object, so there can't be
> concurrent DMA allocations while we are still in the constructor of the G=
pu
> object.
>
> Unless...one would try to create a second Gpu object from probe() (which
> obviously makes zero sense). nova-core already relies on Gpu to be unique=
 per
> device, as attempting to create a second Gpu object causes UB and actual =
memory
> corruption when there is no IOMMU. :)
>
> [ 123.966391] pci 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domai=
n=3D0x000e address=3D0xf7fef000 flags=3D0x0000]
>
> So, I think technically Gpu::new() already has the safety requirement tha=
t it
> must not be constructed more than once per device.

Yeah, I guess that's sufficient indeed. John, my apologies for the
back-and-forth.
