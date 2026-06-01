Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011058.outbound.protection.outlook.com [52.101.57.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7A3E8354;
	Mon,  1 Jun 2026 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337884; cv=fail; b=V22V1pds6/j5hy4RNtESKOeFOvGHc+nekj9ohX/f7EY4eOSfuQiC2I24ZSrJcyrRfjm4riHjgBidiITpkO+ItOERO21i/lq87Fo0qruWLZ/ACtzjmKpd2TW5/0yekwixbhFLXvb5G397sMvXS/imQECk1CsIcpGJ3UIiuzTIKag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337884; c=relaxed/simple;
	bh=E/LCXV3BdlSEutTdrkKLLDrZxiz7pL77PQilWhP1Mdk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SN9svKYfwQY7tIOjsk7UE4gbDxTvigHxdQtKROeHRMsp9hj+fNfBaBqTnNDNKGHNb/pDBJ2LiOoaNThowH0L9Y2TfmDpTSe6AOpOb3OFG3+dMOB197Bk/v0yZvmSpxT6bMGVksRP3s0wdTvGAYJSUaIPre0Y5osxCfyxzkNDY0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J99jZ1v4; arc=fail smtp.client-ip=52.101.57.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J99jZ1v4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qI6qrG/O2GCBYLjaP066+RZRl9X46Mtl/s+L97CUkmXaY5BmJ/w3IqIWHQ9UAdZx890w6Q6olMeetdH2IyABLjOCkHO5MrR7TkBSnc05H/y7VC+N6ilfBEvWtBgLeWL9pyP+IGLU7qXtCD3Gb7Yq5bqNd/+wzhecRQBe/o4VWx2zv0sUl25/XFVxjVCiGbP2GOg1UtDJGu72uch/O56RDT051Clfgnt4cbKR1Ex66uvOaBs/djjXCGsTQVUqxduSqpEHNl2JUC3LVpjl1yR/dz5KVLZmmazA5y5hhkpFFDezOioNvziH4EeZ9Q47exEJaqKqdMbwKCKjIq7rw1Nzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIvYEAISnve+GkDX2Msi7ji/yWC3NaUjmJwUwjG28cg=;
 b=fMqXS30oN2TsejFRYwl6YmxuYcCxOywqYfzBboJ5chCcHnZAG8Nve6pzVk12PVGTxLo9sbpi0w56l/9tvzd3shEsFvDb5NJKayanm1TpYCxnO8jWkzh5sQpkY83hUFaTIZUJjl67Le0F0Lni7uGMNpAtVX9FXz7Ne4yVU8v69VtIrUDU/dCbrCyDS+7wkYOQOuTs9XIIQVIUllI3EJ7KskhmLQm06HgqjzzHEqGeKeroYw8v0b4dZuvJbFdWhlYQBP5Yw9ge9X5r3jyHG2En2PkTH15VBgr1WnEvtIZ23k4JbytDtOn3Ajxo/rQuSI1X5TsakvB1OVHmx9FZh9iNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIvYEAISnve+GkDX2Msi7ji/yWC3NaUjmJwUwjG28cg=;
 b=J99jZ1v4HJzfmZq2743R15DSF9bKnQpHTvof9LBL0Ef54554jIc+6m3Fw9aAxMTwKshblmMhsKRH1JLUofPz/PFqgXDe3BZPtXxSNjBZOWMVgIncbcr6FoZ9Y+o8b473V5o+olPEuPlubDbnrx89R2MyOSc8+vYJmyPldPreO3wUWVYeLAEaZm9TIwmdnosWZlgjU/CVU1Vw8MjKcmZ6OpvBtlWCBIbvWTqvHrZMozl0dlGUD7+MdqDL3faGg8KhUXR37QYpDdyxzMBdS24GgqkpVe2eLDqWxaLnxwxuuep/ZkQqBk85EDff/5ajV8twpIWmqWuA2yU8VtAg2dqDdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB7075.namprd12.prod.outlook.com (2603:10b6:806:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 18:17:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:17:46 +0000
Message-ID: <864e8c8e-2694-4a07-8d67-02cb0d5cd6d8@nvidia.com>
Date: Mon, 1 Jun 2026 11:17:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/22] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon engine stub
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 Shashank Sharma <shashanks@nvidia.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-11-jhubbard@nvidia.com>
 <6c85489c0e8d9b49c01352e869f578c609443118.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <6c85489c0e8d9b49c01352e869f578c609443118.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d416e81-d220-40e3-0562-08dec00a14e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	mRMK2M4nYQDx6kmeorybpUEq/yZzCz7cpx/pdC5TumC8OQnwKmaLtAspcTe0TclE3m6MSiv8UzZ5NtcMyCJq+EwQ9bEdQUjW+xRhnmIAiK82BTncTRh5MFfHDOI/3yi/mGa0HbpyNIXhrP5CLbe4HBIbgIRFK2fMKEUVyojYg9MDugBmUQiPjbgMeoV6f9xwuiCOXUP521/+/Law1X2QxMKMLwJF7ALV2jzaTzXdbERpnxuREdpsMx5N9WxFUB3DON7VatYkmaUvlJGO6qY0hjDsD5/G8LAg2KrOSe3qUw+BJilcFU5OLaldifAb98ZNXH+nes/ZNI/gsD2D8abr6cZWxlEtFEGQjC2tShB+Pt3DB+HsbWSkfQxjV80xrCBRugixR4oqUcbVPwKmk08kw+cDCFPIA06KEN0Kuwf2wshc3HvsR3iQvXPARsYLmpokaegInWqt5Zpu8VgDd64sdb0Bqeu4Oxw6l5QefnfnYSCE4Rs4hOmwPR1xsRMcII5U/6xIOi3GQ2+Ozc4aYKFPQ+Is3sHvd1sCp+U1Dx3wBXQII6vD2kL2RWLddEiKxk14DB50cAfWLBTJGSP+BFRD47Dj/SfiiCHSgACc2KfXvr9qLE3OLAMDHJKOIl17PGYgP3GXIRSanfRIK+JQd6PNMOHmlqUrYSS7CL80vE3rTwWd6YOKG6BKYBs5ujaSR3mS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTBhdnIvbUMwdkVRUnJ4dFBqdVcxMGZ4Vks3VkptQnFzNUtLWVNNTXRubER0?=
 =?utf-8?B?cktDejVTQlk0cUg2aEVvcXp4ZHFJVVN1NktCYy82Z2Rob0xPLzBpK2F0Q0I3?=
 =?utf-8?B?REZFY1oxNkRKbFhPTlBHZ2ljbVU2b1JTeHpnZUJzMVVmYytuYThjSUhuQVhq?=
 =?utf-8?B?dzFwVWIzUFZWME41UURuNFlHSm92OGx5eUZWK3Qva0gycHdpZ1YrU0lka1Nv?=
 =?utf-8?B?MVpqVzhyQTViM2NvdVd5dldFS2s5ejZxTHBadDBtbERWZUNqbmhKMkEwZWs1?=
 =?utf-8?B?SHBqN2p6UjBSRGV6OWhCNExxcnFtQWUvQzN0RnIwNHJaQVVXZkRkOGh0aGwr?=
 =?utf-8?B?N2p5ei96WkZLbXYzKzdtVElZekdjQ1FmTmNMRVdNN0dnU1ZLbHlmSW5zNUla?=
 =?utf-8?B?aVRES2UyUE93d1o1WTFTK3FGUHAwcFJxbEx6Z0JxYmI3bDdQaTV0ajVtMnc1?=
 =?utf-8?B?NDZ6TmllbnU3bGZ2eHgrb1BMVjdiUXBJaVVQNUlqSitPdzUrNUlYSEJCc25w?=
 =?utf-8?B?Wm10eHNYSE1VdWtIdW15TTNPQzRLTFU1L0lEcWpMcWttcFgzMGowaTFDSWJO?=
 =?utf-8?B?TU51YnpvM0tTbTNjMFpoRllCdW1KaWdLNXlNakJxMEtTYTRiTTFoRzdOQ3hF?=
 =?utf-8?B?WW84L2tvTEppWlhqSWVNMDA4aHk2NW1tQ3gwNGIvdHB6dlpBWExVU3J3bkdw?=
 =?utf-8?B?UVNwejY4MVk5MEI4aThuTCtTZ2l6S0REcDA5UnJSbGtOTXJ4eTJxcWVhdE15?=
 =?utf-8?B?OGN3V1pJL2g0U1dHRnZJcS9xaUtKUGp0b3ZVTUp4LzAreXRXQ0ErZG5uZkM4?=
 =?utf-8?B?WGZZWEpRbXFlM0NKV3JRUm1vVm9ibGRIcU02b1Z5SGZobHBha0NWZFZ1dU5L?=
 =?utf-8?B?SWduS0o4NFZacWxza3Vzd2RPQkhsQ0RuRm1IRWtUbWRvMzdYMzJGbkk1TnZx?=
 =?utf-8?B?VjJoYTJIMFdwREQ1RDFTOXllam5seVU1aU9ocDBxdDRLYVJKL1MvbzJKdm5q?=
 =?utf-8?B?bXJRYlFZb1VFaXVNbXRoOXZ3ZEtHdXZZZ3ptUnNGUENMTVhjZFVNay9McENw?=
 =?utf-8?B?U2pMV3hPVjRPR3hWa0x1c0xGaG54SU5Vc2VlUzBrSmtONnNHd0VSb2h1ZEpY?=
 =?utf-8?B?dE9JY2FJL09VU1d0TFZxZkdiam5SczZNSjdiVWtnN0pxRGUzbDNqTmVaMmNF?=
 =?utf-8?B?U0JCZGJUdlYxQnEzRjV4dkJoTDBsbWdkc1QzUHkvaFM0ditvT1QyYW9iUnZM?=
 =?utf-8?B?ekhDdTZUc3kyZDlXL1lXUEV6WWJyMFlVcDQrZ1hwWml1bmRzcDBBd251b25I?=
 =?utf-8?B?QlBHQWowMEZlZ1luVWo5TkJwYzVRZnhtQ21IWkRXeHpSTk9zK3I2V3RUcTN0?=
 =?utf-8?B?SkEvbkdmcHdIMThtZHJIS3kwbUphZFhrenN0U0RNQmVpOGVtTFNaVFI4N1lS?=
 =?utf-8?B?VlcwcmlEZEVaTk53dEdHZXNINThrUXd3WXppTzllbXJEV2dDTTROTlRYemJy?=
 =?utf-8?B?QjAvaVI1MWpJVjV0K1p0dHJkV1ZHMjhTV2dLeE9BRzJDdThCQlpDK1UyVFpH?=
 =?utf-8?B?OEoxS0RGQVJ1L1hsa3FZSUJaa1RSbVViWWVsZjBtL1R1TFl3MWZJZFBLTlA1?=
 =?utf-8?B?MkhUZHNTMHYxZlNSc3YzdGg2NFNTL1BWcVBwYW5pVHRLMXAwdWVHTk9abFZH?=
 =?utf-8?B?T1ArSE5Xd3hLY05BdUgybVdjendzbGZYR2F1MlVGdmd1djdPQisyVzVFZXRs?=
 =?utf-8?B?OG9pT3VJT1c4cFphN3Z3bEFWS2MxVmRUd25uZ0M1Mng5SjdnTU94NngxNnlz?=
 =?utf-8?B?alhxSmU2MkNwTjByRms5US9pcHhnK3ZMMzQxcTN2cm40RDNqZWhvMXAzQnJs?=
 =?utf-8?B?Q25nbEdoM2tXT1IycWZlMWdNc0pHS1RLY1dHSWZyd3crdnBLY0ZCOUVmWUlU?=
 =?utf-8?B?UnZnNkhEWWZwK2NxT1ZhRUMwUlRHZmdlQW4rM09TdmVqam94L0UyUTVhNjNC?=
 =?utf-8?B?L0tzcm45d0ZHV284eUlheGxadUdJbGY0NG5zMEZhTXFaUzgycDlnU2hFWmM4?=
 =?utf-8?B?eTFsMVlCOEViYnM5b3RZK2ZHbEFmdFZDeVQ0c2xsK0lQU0JjMDVDdG1iNkJh?=
 =?utf-8?B?NkZ3K0VtcE54MDcwbHl6ZDhRaEZqYTYvUUdZNDlTcVBPU2pMWnRaMkN0N0Js?=
 =?utf-8?B?WnNvQ293WWk0b0dHTkl1Yi9ud2htd292Mk5NVnBEakxuejYvaUU5UVdRem1R?=
 =?utf-8?B?OXVSNjNqNTFSelFhTElnTkx0clIyWHRvTWxWWktqOTNFOXVxdjE4TXVYWGlC?=
 =?utf-8?B?aW42bFJiSXIwZFAzYWpjTjZTTzVhOWxXRnpiNmFUT1NpQjA1R0pXdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d416e81-d220-40e3-0562-08dec00a14e7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:17:46.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOBqzHJ0dBH6ycAF/jzP9NWhp8BVSJJQaGMmT1UcHGan3/GVocV9v76RVB8sAc14F4j3n0shvil3v33MesOcNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7075

On 6/1/26 9:10 AM, Timur Tabi wrote:
> On Fri, 2026-05-29 at 20:09 -0700, John Hubbard wrote:
>> Add the FSP (Firmware System Processor) falcon engine type that will
> 
> FYI, FSP = Foundation Security Processor

My first few search passes found the other name, so thanks for digging
up the official name. I'll update it.

thanks,
-- 
John Hubbard

