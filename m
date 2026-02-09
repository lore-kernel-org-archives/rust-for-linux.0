Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EF11F17E8;
	Mon,  9 Feb 2026 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770603766; cv=fail; b=SovSGWmDwgqPZ7oBaPT/KnbTRbFlyA8u7PXvqwz20yDXMgfbqd6fzYlVz37WypeUnAiPYGfIc2XaLhup6pwfpX2CsAJrvcA6T+lRztrtzL5E5haHhf9lm4tUVN4HF+ETRZgDGzn6j0aUoAsfw9lzzHriyzvQLOdwjUw1WwGVfds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770603766; c=relaxed/simple;
	bh=S3o/5MxFDtpEtgtVFIJethy/odRngJSzY95DhxSjlmo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ho+epH9iaxni3I50QEHPMKIMAl4cly9xHz6PA8/ml0lRtfkrwI/q5Ffwdt0UAjXAm4HxfXVnpvvY3Rb78PzUpQuZ4/dTAMvxwO72h/Ldz9CCA0dDE1AFcOb+qTbqwbpR3xLdfM+iUziHcbr007cuy7/x1bwh3sLHymcTjl0Ag/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SqfYu65k; arc=fail smtp.client-ip=52.101.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SqfYu65k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJzdM7S4TPc+5Cg6Oh+Z4ChKNG+tNilh/rBVOxUpWH3Wju/oFPAutiL/SPV9dPQeIfCf6T73gDBE3Hgj7SLedtWs+a5SNBHQNyksxH8QnC+ruYuFQOtyIvScBHJ2tma9zrfAdafnxny+tybcG+ZCvWpCJxcj0qPJgu5NnrGTU3rO6amofDJxYhHWktBl8sjE9LBPYnV4orqrSJH+k5Rms40mUhGzf1LwiLvdWYkcfy/M8JzkVG6eVKK17/DC9+TDIuSbkNuvSr/7hszliJ+UwvjBPINHs748//imTu80wB3i+P9HBpBWiivDvPQ4XU6UwlyfhLGOpMzGFiktWJm2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02T1VXEGak3wAgWIZEm0X4CzKBLHINMWFIpoK8kmzCE=;
 b=cbbeF2km5HztFTHroCxrhIBYku5h+zwKdYBCRZ/bwQfhQBYHO3OHA1ZJbPsk3/416l8+it6ySddGBesFPb8M9H5P5mw3GrYN1EtpoJYAqzm2KmOb8BDpzmHT2DDa9osT/igQLuvFFob8BMnVJHEZlkVRc8Zbcg5PaPJRjlLU5yqMCFcmo/JW+Ryz+1vssVDyMA272q5iYG3J50Af2lI9MLd1GdiqWzhZGzlOwwdAwFgJgbv6Ac0VJSsr5VsvSGdi3NUO3q/w7Zg/p6Q9EAy7aoxNUJoVoUtfWQwFXnC8jsA7PntFfTEtJ7rfTu+bwppuVUX7ntaJj1fjMBKA0Q2n3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02T1VXEGak3wAgWIZEm0X4CzKBLHINMWFIpoK8kmzCE=;
 b=SqfYu65k/YeCYZMfAs1ww0u6ArNqUzwy6NhTnQWQyKcOtWb6XrHE3cexx+ZrT4T4KjzAup0jnK2x80avPpKSGwbvX6LYKI7TCcSv/d1+RTUD1624mBdsUhsq31YOPnU3zOaBddKFmXMiLb5Q7TjCsq4uj6+4NbSx7f51IvdZI9gZ8tm0Ak8LB9RpftEQJX1NL2lQpNp2dRJlYV4Zuo3o7uPcvhnXRXoUv/DEcnRxdy1GjxmIjXa64QDn5qresKrExUhP+5SG3UW3uqQXfGNv4xTk7HuTBNB6ONLp/e7GHhnaN23TIu2y9w+W7rlXfwi119kVsbTfZZ0Q/yEjnVzcug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PPF170E97DF1.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 02:22:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 02:22:43 +0000
Message-ID: <81280b58-965f-475b-9d46-d03347617d64@nvidia.com>
Date: Sun, 8 Feb 2026 18:22:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/30] gpu: nova-core: clarify the GPU firmware boot
 steps
From: John Hubbard <jhubbard@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
 <20260206042123.303281-31-jhubbard@nvidia.com>
 <46121c46bb52e7f8578367232b772f234f20be86.camel@nvidia.com>
 <bbfaf5b0-6e10-469c-8a01-9575ccfcd8dd@nvidia.com>
Content-Language: en-US
In-Reply-To: <bbfaf5b0-6e10-469c-8a01-9575ccfcd8dd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PPF170E97DF1:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d8c592-6c5c-40e3-9c68-08de67821af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnI1VWg2K3VFQTh3WnptWDVSN2w0SGZ4MDVxc1VRd2NxTUliOUJwZU04aFJp?=
 =?utf-8?B?TXphQkhiRnZ4a21ITTBTUFdGN29MaEU2UFMxcm9rSWduZXBWcXl4Y01GVnBV?=
 =?utf-8?B?bUpieEp5QXZ1dUxmUDNxcmRFNFBYY1Z5RXQ0M3ZoSW4xdEI0ZEROaUhNczM5?=
 =?utf-8?B?cDZKSXYydFdiZnljcmFwbkxQME1ybml2RGRNakN1VEhtU29IQ2xIRU9PbHc2?=
 =?utf-8?B?T0UrZ1IyZU02cHpNVjNXVXdabmY4eUpkVDdzQVRLNE9LU2xiWERZY3ducEVD?=
 =?utf-8?B?MHlDK0ZpV0x3MDE0ZzF2Q2Z5TVJqbU1NWlNtZnZ1N2RZcXNQd3RGU3lFVXRI?=
 =?utf-8?B?N0tUNXhBOXNGUXAzbW53Z3M3ZUx3NHNtaU1mWk85dmxIKy9qSUdOTVZQZjBC?=
 =?utf-8?B?aVlrZEZxb0swRE9TQ1ZOaFA1OVcrT2tFd1dhbDBub2llMmp4T0kydW9xSVZa?=
 =?utf-8?B?TzdRSkZPZGdYL1NYNURhZU1HVmRJdldhUkNtVnVsSHBGdnljL09tTDM4Vi9k?=
 =?utf-8?B?eG9NMUVkTktlelE4RVlFd0YvQnc1RFNQRFdBZzVTa1dZOGVwempBMmZSQzN6?=
 =?utf-8?B?OGdnaWU4cUwyeXBPSWZzZlhORUhZN0ZGWnpOK0Q4U0t2Zk1Gbit6OWE0dHJs?=
 =?utf-8?B?UUtpdjdDWk9YMG1VNndjejdxS2drbnduOXFiRFRhUmc0SzhpQTgwdDJRVnJo?=
 =?utf-8?B?L1RuRURkdkVOeE83bUVIOXZyWTNhdjg0dmtCQ25PL3RWa2VkejNVVWhTWEJu?=
 =?utf-8?B?aTk4RkYxK29Ia0ZqZkVtdFdrOThFU1dGc2RRVm5rR0o3RUpMcDBmTy9oS1J2?=
 =?utf-8?B?R1FnK0ZyVnh6L1YreGxmZlRrSHBsMHkwVUF0VDF3TjF1R0wvVzFRdzdRMFl3?=
 =?utf-8?B?dFZZMThteUxsSjJtOGlOT0tsUThrV0dCOFRmUktxNXdHN0VkRnc1WVQ1SlYx?=
 =?utf-8?B?U3IrZm5WUHV1WGNMRW85dlpjMDNkOGdpVFhlbXVoUGM2UEVLR01Kd0c1Vkc1?=
 =?utf-8?B?TlZibnhxdXlqT3M3UGVIRkY1bldLV2NUK0E0QVJJc0xmcDdRdHZ4a1dHV3h3?=
 =?utf-8?B?S2tkeUl0bUpZMnNxUXJoY2RvNkk1MGdCcEVzNHl4RWRMQVEzblpVVGpPR2xP?=
 =?utf-8?B?czRteVdibkp3eGpZaWZac0lVdEovNFQ0c3BZVWVjdFVxblN0aFlUcERDaERS?=
 =?utf-8?B?aHNPQ1JHbnR3YThYZE9yQkd2Nzg3WjhiT0pMcUVRTmFIbnA3Um91eW1sZzBU?=
 =?utf-8?B?YllkeE9rTVZqMUlQWW1DMVMrZWNSK2VHdGpnVGlQcG1TRmZaeE94dmVQWDVt?=
 =?utf-8?B?ZGh4NTAwVzhKa0EvTDRKcSs3Z2FXNWZqZllvYUVjL2dITFRpMlN0RDVEQzIr?=
 =?utf-8?B?S2VpRXZjd0trdmJoUE1kV1dWZDRSYUd1N2tDVm9URlFXUVNocnBvdk85YVNp?=
 =?utf-8?B?NDY5dDBFTml4VFkyT1pndlNzc21nZDdDTFgvRStQZzQ1Sk81VFF4Sk9CaENC?=
 =?utf-8?B?NmU2NlM4S3BINEN4b2orUTVwRGxuczg4dkpiNUlVL2RUdkNZSXBNV2hLN3Bn?=
 =?utf-8?B?Tm92N2hhREE2cEY2Nkg5S2prcUp5Q240Tm14YnhCK0tNcVVtMm5SNTZoQTIy?=
 =?utf-8?B?NFVaVjFPS0syUDdLZ0RrZGdiWFZ4eGRURy81cHVkQm15QktIdlZST0dGOHlO?=
 =?utf-8?B?cnlnQTBDK0JPQVRic0V0Z2VFaGN3WmtJWjQzenplNVQxK3FUbHdBWUloSG9X?=
 =?utf-8?B?RU5zcEtHVHNjZmlEdU1zVUxHSFlzN3ovTVJhaEdYbXV4MnFsaDVqUWVVaC9z?=
 =?utf-8?B?Uk1uT0lQWHd0cU1QVWFENkZFQmpzSUs4cE84Zm9rNGJ4OURSUStuVzc2VVVK?=
 =?utf-8?B?OGxlYldTWDZaNWozL2NWWlN2VlorQkh0dWVjR3JXOXF5KzVmT3pzNXVNVUQx?=
 =?utf-8?B?RHZDTkFvdnM4OVZGcWE5eE82R2lIcHRMWE9sNGZhMXpQd1dENml1a1FuK2dw?=
 =?utf-8?B?OHZoUHJTSHhyOHovNElkNS83M3NNUkxRTTUySjZyaTJGcmNwRmNPbVhhdWhW?=
 =?utf-8?B?RHM4TzNCQ0pLdUJwci9TQkIwRHZhYklKMjRiUjZiWWhMQmJMNm5XYzcwZ1VI?=
 =?utf-8?Q?Zm9g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UCtRS2NJQzFCVCt4Q3RTNWxLRVV4aVBjUitRdy9JQnVzV2ZjQnU2Y1N4aU5t?=
 =?utf-8?B?aTV6NkNhVnRWZ0NWS1VyMDJ6UVRtV2RWOTNqMzRwSDdUd2grYWdyRjR3WC9Z?=
 =?utf-8?B?QmVUQ2dUWGV0Z3ZPV25FRDR1Snh2SWRRSnl2b28wU2dkUExYamE3QmFaWFFl?=
 =?utf-8?B?OG1ZaU9BTUppdlc2NnpxekMxK3VWNFV4bEJ4OVFrYzBQUDRFdkVjdkVEUisv?=
 =?utf-8?B?YTJiWXlCU2E1eGE5T1lDQjJ2T2w5eFNtT0Q0VFI2dlp4ZDNDZjhMTUNNeVd5?=
 =?utf-8?B?akVTWXJIQVZDR1N6V2o1b2xyODRRRVo2MUVxM3diS3BiNDJSU0lnVDBld08x?=
 =?utf-8?B?VTdJcXdhV21MRWdLaVZHR3BBYTFtekgzRmhBcUkrdm9SSDk3dzA2djQrNW84?=
 =?utf-8?B?YzlncHZ1YWdqb09oNHh6UEJxUmRZNnFBMUJkWW9UVHR3bmNSeWtLcUpxZHkz?=
 =?utf-8?B?dkIwOG1FSFdHdXRDeFVkamR3MXJzb1J6Vno1Q3U1KzhabXNMYUMwaWtyNUlx?=
 =?utf-8?B?c3FUY1F6WkNnSk1JcEJ2YVJsU0tQT0lGN0Q0R1pRRzRLSkdOYnNuTEdzS1RL?=
 =?utf-8?B?Z2dNSGNkTThkdUo1elc2Mk9Ccmduck4vOS9DZzBtL3NRSGhXdElLUmtJYXkw?=
 =?utf-8?B?Zy93bnhhaEk4YTQrWUV0TDBBSWxqY3RoMUJxaXp5UnA5bE1HQ0JjNjlnZmRP?=
 =?utf-8?B?QnRLb0Y3Z09ZUkQzbkh2UFZIc0FSOXBYVDV2WHNMVHZ4bUZBWGE4ZEVrc2dY?=
 =?utf-8?B?OHN5N21yYnY4ajgzNHlPaGx6OFNndnhDRlRSRXFaVjlrUE1iWGRZN2grVjBl?=
 =?utf-8?B?ZnRsd2lWY2tGWkhUditFaytoS1FFMjVmczhtUGRRVHArczY1YW5OVXZhMkhL?=
 =?utf-8?B?TmwxUS9Xd3ByS0ttWi9TTkxqUkUwYk1wTDc4K2x5M0NrMWhNRFZON0gzL29Q?=
 =?utf-8?B?TnFjbWdrU0V5UUlTaGtYbFhEdGdiWEtYc1d2eVluT3c2RWFwRDN0L2s5TGpR?=
 =?utf-8?B?bmwweVpiK0c1em9CbCs1UXZDRUlyTE10aUV3YzBBOHhsTkFyaHNCTTVIQUlR?=
 =?utf-8?B?ZHB2K3FtQnlLUkEzWCtIU2RJRHNNVWQ1RFdYd2xBRXRHUjg2Wm1tbHhjbEtR?=
 =?utf-8?B?NlZWM3l2WWRMaXdNNy9uMm9ZbkI2M0U3aEF1VGN0bDJ5azFHc2VUSno1QVdo?=
 =?utf-8?B?eE5URTAxM0Mwb1MrbzJJcjB2bVRNK1JKMEs0dFg3d3plaHRXQnkwSTJtb21r?=
 =?utf-8?B?bjk2ZkdMQnFvdzVLMGtMaWtqRHlpZStZWHlXV3h3dXpWVldEa2xuSW9BcTZU?=
 =?utf-8?B?K2I1Q2g1Skxoc1dycitNU2RwbTI1TnZPOFZjMlJWdDlKdFNpTWVzMlcwSEJB?=
 =?utf-8?B?VktieHNsN3Z3UDRmUGlRKzBNT3A1MlUwL2thM2RsQXRQSlpmaWIwSWpGdWdt?=
 =?utf-8?B?OStZc29NMnN6Tjl1Y3MrTVA3YUhkNk83dDBYa2g3MUJQRkpVaTVzUEVMWndx?=
 =?utf-8?B?anZsV1Bnd3BkTEZzNzdDWmZTS3VsUTNSMWUzbG95cEtpeFlualJqWGJ2SmdV?=
 =?utf-8?B?cktadFplamVzcjI2NEdWNVZtQ0pGVitBUnU5alZleFlxeE5uZlR6aVlyRzla?=
 =?utf-8?B?TlJRQ0xHTmFqTjd0UmZVY2F0YVVxUy8yS1hPT2Z3S085aE4wWXR6REFEZWlO?=
 =?utf-8?B?dGdlYXdoaytLTnVIdjlvbkZDTjVvZWtxeDhGb0drckhRcFZRaVorc3B4TVJS?=
 =?utf-8?B?U0lOR3lmOUY3RktDeDhPZDFUMzBlbDNRUnUxQnEwN2xJODBuclAveWVSa2Zl?=
 =?utf-8?B?VTNBUk5Da09CQ3N3cmtPTmpoaGpGMzJUVlZQUmNBWTQwMVo2bW1uVndFakhU?=
 =?utf-8?B?U3V2VG4rV2FRY08zVUxYSVBIRmdPSWJFQmpCVFJtY1JQdHZOSFNTM2pObkY0?=
 =?utf-8?B?VnZ5Mmhhci80d1hpYksxMlFhWVFPcnlZSDl1VzlSRGk4ZzRsTXNmcEI0T2ZR?=
 =?utf-8?B?MUxGL3pDQlJOTldZbENQaEhlcWRFKzlkanpPZDdZbmg1Vkw3eEVLQWl4S1kz?=
 =?utf-8?B?Z3NSZUJnMUppRVFteTd0RVdxOGIzd3Y4Nm1yakI4TFpIaFNFQzdFditZSUhN?=
 =?utf-8?B?RUVuUU1hY01MODRhbUs0dm01Nm9zSWlvMU93V3dqeXZueUFQUlBFeER0ZHZO?=
 =?utf-8?B?YmFqV3lCUHpvczJpYWlkbzdiTUNsSUFDSk9TZW9RcE4yWTN2TFhXOWM4dHp0?=
 =?utf-8?B?cWJUb0xNUUdYM3ZaVVNjV2JrZnYzaE1VSFVmN2dKdkkzdWxSSDJUUFhObElr?=
 =?utf-8?B?cVZJckxOQXVTK0dpakszNDZEeWZYNEJEcGJ3SGx4aXVuT3pxWVV5ZEFDbU93?=
 =?utf-8?Q?bA0A5NRuxi0B8Z8Q=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d8c592-6c5c-40e3-9c68-08de67821af9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 02:22:43.0707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoqokcZzbxplbhL6qR6czPLlLnHrUqZ0QTfFc5DNvJS7/RNhX3CBL0izHc9xqgzFitPGSBWdDWWIwZjvp7sl1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF170E97DF1

On 2/8/26 6:14 PM, John Hubbard wrote:
> On 2/6/26 10:43 AM, Timur Tabi wrote:
>> On Thu, 2026-02-05 at 20:21 -0800, John Hubbard wrote:
>>> +        // Reset and boot GSP before SEC2
>>> +        gsp_falcon.reset(bar)?;
>>> +        let libos_handle = libos.dma_handle();
>>> +        let (mbox0, mbox1) = gsp_falcon.boot(
>>> +            bar,
>>> +            Some(libos_handle as u32),
>>> +            Some((libos_handle >> 32) as u32),
>>> +        )?;
>>> +        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
>>> +        dev_dbg!(
>>> +            dev,
>>> +            "Using SEC2 to load and run the booter_load firmware...\n"
>>> +        );
>>> +
>>
>> Looks like you accidentally deleted the "if mbox0 != 0" test.
>>
> 
> OK, I've added it back in for the next version:
> ...

ah, *correction*, I spoke too quickly. The reason I removed any
such checks at some point is that they are wrong. This mailbox
contains the libos address after boot, not an error code.

Open RM also does not check.

thanks,
-- 
John Hubbard

