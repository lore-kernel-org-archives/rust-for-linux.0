Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65F133E347;
	Fri, 27 Feb 2026 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772209817; cv=fail; b=U+H+xDEmXDREPckpVZ+4PD7EPh6xhnca/tSh+Hko5UHmfXCYuxI/vdAAHjp26r62OLW5nvNHIiGJF3BWJt/mV3QZjM505Fpny+LsEgJs+rngXvebJkfYRHy4fgkyCVgOuZDxn2d2yOcvIOgK473QbJ5PuEDnPhhreEG+yqKEjjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772209817; c=relaxed/simple;
	bh=Ty3VirTMv/bF+uaKS4f0y5cfbQ9rNbI47d5VnYeymIM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rGwBWfySLc2JnYEpl34WfvWaaBrAboxQlstQk7TtZY1iMB52xhpodLmb4zuO7Nawxy6B4cEh4X6R3zOCFF0SwkXIvWshKbq9vPWAoVFbrrQyB80jtd+FGeD22a2tolT+aOyEOgkoYIH452j533uDFDlL7ig7jyZJOE3ZkAx+VHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g8CaO2Em; arc=fail smtp.client-ip=52.101.48.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g8CaO2Em"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVeecTG0YBoxL3i6XktqyQHuF1M/xFWuI7zOCGsb958fHUQadiAC28BCpxiU5IWgUlIjv6YkWTwOlCCy23z0zSYAyHoFUA0Q3KGo8jxLbvoCv50W4SeK55K3zLWgJvynGGYfCitht2oumf/Wqp8R0Nq9bZVm1Ikor/O+fSyPOb/gTNE02sEqXBZvEIotrWrxS53tx7oGPZEpdp+8bTEaC5OBHPi2gMDC6yfEEU3rspup3+rafzEARMvWCnpR0JfMBRkGj9SGm+QZUscPgxZSEzeTHXizomTNBkNLBgUB9B9sfa5uVpPd/RnMUoSESCsrb9dCCV9sPAVVCsL+szhujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00B0OVofn+FgNsXqL5WBcAPfb+GoFUPcLrt1JK/G5V4=;
 b=ehXMkb9jV6Zyv5ghujqQhLb0AUcg3121SgnlX+pEIK/VdxCaabhey4p0xl5Ag4pryZKheh+wb0HZY5UrHEKdeXVkie4Lx/INbpgPAWcAs8AcDNSdoqz7wHebM4wRuG9DTxKHltDhZX904WjZK3xCG9dgPJd0WCarcBR8Jr0WJswql63kM4cAH9pe0mZqHtsWjt2NGQ6FDxvde/C0YVPW1k5U3B5r11FpKoUS35g8KIaN8VrJXiPRKPXabmH8zBcJG31Lamg8f+oT1iH2joIWpv1gUQpYt6Ki0+ZsYGL2pOT7YdPxiz8gB042M9cwBwzC9kPM+o+adEXwdzTi/XePFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00B0OVofn+FgNsXqL5WBcAPfb+GoFUPcLrt1JK/G5V4=;
 b=g8CaO2EmMgPL28Lnq+23YPsnHbtLiFpQRfv5YEfpe4t8h+9TgslzefT2c3cszeYrgOGuZJRTBmSShss2/NZkXcSIvw9JG8dobSeQnzcn5uqeYoF48Y0bzd/NA6dh74tDO3GkVoAood+9Ptios/3CaxSWUz9Na4r3rlkhpjdUVWFWCdjB5nVLG0wbNnD3XmZNTvR+IqLYaVqWjHYdNxCSKJAprh4+k6WrBvRcAyoHI4Bjjyc+6ywQrN6MvKrP2nyK1iTSGfweHAipr/kxxQz1YmR45ZHKz9D1ILiFOz1j2hUJCWrC7Hzh9EZ4UqX3i08YB3PuUeufyCwK0Ylh86nJJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.15; Fri, 27 Feb 2026 16:30:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 16:30:08 +0000
Message-ID: <3a7457a9-45bf-4522-85ae-41cfdc9671ac@nvidia.com>
Date: Fri, 27 Feb 2026 09:29:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/38] gpu: nova-core: fix aux device registration for
 multi-GPU systems
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-2-jhubbard@nvidia.com>
 <c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org>
 <DGPUTSI5OJ0C.2TCRCF3ERRIOE@garyguo.net>
 <DGPUWPJCFPZH.4NVAAQS1I6HR@garyguo.net>
 <DGPVFJES9GP4.3R0YQHAQP96EU@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGPVFJES9GP4.3R0YQHAQP96EU@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:806:121::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f051f6-4a62-4d88-e462-08de761d788c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	7yjKYUcI+wcDwcMpb+GSqhb56gR84t06DhJcxpXXB6tNxWOs+ckA/8ZJfGYtqGWtoFtYoSeV4oLqc6s9D8c3of8/m6knr6l48ZlaTnuI/4VcoIw7x7YVhCZ5tlOPBhv7X4XCT31SVvlk7+8HL6ewBnt7f2UlfHRFMk8aYZHagp5nV6yRhUIuRWWEq4xwHnrqQz3pMcVbrBpHLTogdxL8bl1Ccv2xcLs1MoTMMOGFSWapv3uqPzqlib/hRP4b7b/PpYjxLxRIYyRZ02ETJTGcmHFpfUSsO7B//kT30OyBpQnF2OS5PKzMRh8kOK9fEVSO9qkQmmhe6mtZJX7Ita+pgVgb2J5+8B84Xa8E5H3xySHkTc3GDuCxhkHgU8u8NSGAPNHYq+JZ7FT/z78JVNXaTzEHx2nMiudsgbe8HMBHHWEJlGpNFJvO0lqsnTJ2wgEwqEsM5AdPK1o8Y0/B+Y5yqgSBeGkyLSa6FivPAD9TTLo3gwBpXIW+OpD/u5wcZJRUN2iyI3YaSc/wqk5lP2d6F31eYrjcXBEbQpnwyPsQAZwLuwgVonf04zkEUwsHitjx8ffuYBD6Wkxc56r9wIoyqiU6QtxIBembk+WHBCvk6nSgV0jAENV/7wvFOV6B1Wzb9peoUIwDbFoDPVQxZLqwm4J7XxwZBVcy8F3XdA636+tqG61UqJboDqtDgdx4JWnbjIWhP0xB/SUmnarS/bsEFRdxiUzuQJsJ+hmONs3Ldt0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3V1dlBodE95c3pFUjFSMWp0V01DakVWTEwwcmlXdk8zZVFzS0tvNVJwamdu?=
 =?utf-8?B?Sjd2RVVudHdJOWVFU3pQR3R3TnZmd1IreGZTVklUV1p2Y3JGYU5vQW1NdGRj?=
 =?utf-8?B?OFVsMFVCUWloRHJ0OE1URlBMNFd1TEdjT3N2QVZFREtDTjIrZGROR0o4NGtO?=
 =?utf-8?B?LzlKdXROeWRMRWQzK1ArTFBNRjU5Y3ZVVUF2RGtKTjR1VWI3Um5aUzI4Z3Vz?=
 =?utf-8?B?TUtoTFNOa09pa0ZkQWJHSnhzbkViWGVxdTBEdi96cGV3VGE3LzExa1NxSnpt?=
 =?utf-8?B?Y2s2ZkQvVlRMYmtqcFlNM3YxNXhTL2VHTmpSWmx0KytsbVBkMHloaWJmODdw?=
 =?utf-8?B?amdNWFFQNzlzOS93M05GSWY5Tm5DcDdwTEJvQk9YVU9kZTh6eHJTd3BYakcr?=
 =?utf-8?B?bHZISldXWVA3Z3dHQUZIbVZZOVM3VUhUWldtRkRQaXNJQ3dTS2ViTCtKbzFl?=
 =?utf-8?B?dGl6akVqdnJaaE5FT2lEZHBFV0J1NUMxNWFYVE5NK2JRMUZ1L3ZqRUpoYXFh?=
 =?utf-8?B?OHMzckk3dXpiY0J2VFJzODRnZ0ozN2l0Z0h6MnNpRGpXMGk5SFhuRlRyb3Qr?=
 =?utf-8?B?Q051Tk9LeHF6NmEzdTZkenl5cEc3SXlCVWRISUJkd1VpdUtoSjZWZmgxdThk?=
 =?utf-8?B?RWY3dHNqdWpCMHJmLzdtVlNrL1Z4M2xzbGQ5anYvWkViRXFzM05jb0svbXFZ?=
 =?utf-8?B?RDMxUjY3OXQ3VjJhR0tsM0s0eTlQM095dUErQk1abGdPUTBYaDF6cEhTOGMx?=
 =?utf-8?B?QkR1TWxJaWQvam5DeUFCbVNDdC94SXJnYWQ0TGpjcVhaZHkxZ1RZTUdLUWpZ?=
 =?utf-8?B?ZHcyRnpQZzVmOHF1NDZ5dEZoVkphT090TDdLSyt2clF0SE8vU3VMR1V0cGxB?=
 =?utf-8?B?eXlJa0RtRDFYU0xFNk53bW5VL2JTbDk2QmdsZ1FqM2ZrZUtGOXVxcllvVlFF?=
 =?utf-8?B?eEdITXJ2ekpoSkl6d09VQlJxS0Fta0Z5QzBuZmdvR3hTT2gzYmtyRGo5TkY0?=
 =?utf-8?B?R0ZyZzVLR3BIY294SWhFNW5HWVdUQ0F6cnQ5ekwwUlRCMk84dFBWT0tlYzlG?=
 =?utf-8?B?NEpKSVRzR2ZtVTRVbTFzLzZKS3hESTYzSkNUbHFJeXRPek02NzhQclhiYnRx?=
 =?utf-8?B?YUptbHp0NWxnUWU5WWt6RkRQZThzdk5Ea05UUFl0UC9EUXlOUE5ZUXNWbVJF?=
 =?utf-8?B?SFlQREQ2dmpGN1BnbGpvc29tN050d2M4WXJJZzBNeWYvZUtoRnE1WVkybFlp?=
 =?utf-8?B?QXVXc2FSMFJIcVNydFF0RjNVVW5hK0cxZWZxdEttdWV3STlzbFZyYmdxSXpX?=
 =?utf-8?B?Q3lscjNjV3dBM3VyWVA3d01uRzhkak84M3NlOUcxaGdkOFNtZERiRWdwVVRG?=
 =?utf-8?B?V3JnOWZXRjl5TnFaUHFEVGhCM1M0N0NscFJBQm1NVXZLd3gxQWVEbFhTVFF2?=
 =?utf-8?B?S1RRYjVMTHhyVTE5NlMrcjFBZzFOeEtOTHI3MC94SllVZGwxVU10M2lIb2RC?=
 =?utf-8?B?aDZDRTlSTndHTnFyemtvUVZYcVhtZ1c3L0NvWkt1OWdyRStTcFZ4U3owVW1K?=
 =?utf-8?B?a3JPc2ZIR2dYb254S09RTHl4ZFpPa3lXK1NNNDR4dVFiejlYL3VvNXl6aVQy?=
 =?utf-8?B?b2dlOFJzem5KK2Eya29EWGIvendOVkx4WFoxeHZ5bzMxamVGdTNoL1psUlkw?=
 =?utf-8?B?MktVTEpDZFpTUXBmMnRLcG1UQnllQmZmVFNhQjB1RnZRUXNCeDEwNXV2ajdI?=
 =?utf-8?B?dFE5cjd4WkJONzU5Zmk5S1JKZkFHaVN1aCt6ZzdqbnAvTnU3VEMwMFowUzNh?=
 =?utf-8?B?WmliVUFxMzZuWFpCdlJFd2xrRUs4Ty9JaG5oQjdEZ2FFcW1IczBXZ1owaVpT?=
 =?utf-8?B?SUJrY1ZGL20rM1c0bW9JV1pyak44Qy81Zm8xSDVqWElHWGlWOXRpTkFPOGNu?=
 =?utf-8?B?NG81aFc1UEVWMXQyMVphQ0RIeUI2RThFQXpqbGU3eVBMR1ZlVlNETUhDQ2NU?=
 =?utf-8?B?eXNROTdQbUgxTmF1Q0RQLzd1Q21HWDFkN0VQRVRGMm93V0VRRmtTTVZqcEtQ?=
 =?utf-8?B?U3VrV2VxUkc2bUFVNWJvcmd0R0xhVi8zZFZvV2RFWGd4TnBmRFI2d2FvT3JD?=
 =?utf-8?B?cDEvRkRFQ2F0QVVwaUtTYUxVTjlPYjJhZzIwZTNkeVdVYkdzUTRpK0JkY085?=
 =?utf-8?B?WFNzMXFOaHMrVGNuN2E2T3gyQW80M2crSytoNGZmTm01Z3FxSzNjeXR3c1Z2?=
 =?utf-8?B?QWJDUkpLTU1oQ3NBSmlMOTZEV3I4eFBHWElENHAyWWpIYmNwSHJQUU5VSWx0?=
 =?utf-8?B?NWhMTCtKU2Y1K0tMVWxjN2FaclByN1BDeXIwcmRHc2lJbUQrMjhUQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f051f6-4a62-4d88-e462-08de761d788c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:30:08.3990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIBimLo3yKYHG6Ck9QQrgIaBqgcFcKXr5xdnsCDl4hmQvxMhRBQQQP2rfkWRqjtFmS/kJvCZ9TgMIpamE7n17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910

On 2/27/26 9:05 AM, Danilo Krummrich wrote:
> On Fri Feb 27, 2026 at 4:41 PM CET, Gary Guo wrote:
>> On Fri Feb 27, 2026 at 3:37 PM GMT, Gary Guo wrote:
>>> On Tue Feb 24, 2026 at 2:47 PM GMT, Danilo Krummrich wrote:
>>>> On 2/21/26 3:09 AM, John Hubbard wrote:
...
> I picked up the latest version of this patch and fixed up the LKMM atomics, i.e.
> the result should be correct:
> 
> https://gitlab.freedesktop.org/drm/rust/kernel/-/commit/d3f36fa57aa289c43e01da16c928a2cd971ad5dc
> 
> Looks like I could have picked v2 instead, as it seems to be identical except
> that it already uses LKMM atomics.
> 
> @John: For the future, please don't send patches in multiple series / ways. I
> think there was no reason to include the patch in this series in the first
> place.


OK, and sorry about the mix-up! I thought it would be "helpful",
but this turned out to be the opposite of that. :)

thanks,
John Hubbard

