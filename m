Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161AD2D6E71
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 22:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208881; cv=fail; b=NTxl/1+POge3Q6mmrxnM36ufMhMEybehUoHCfKjjTeLhTumBc+LsM47mW7ycSb3r3uB3rKzlevrLWtcForPAZWyl1cMWPs9HL1/WMk+RbNkQ6VK4gYWbiYj6WhmSKmJ94azlYV4l6ZuJJgTrhxBEb8iEZmTRzgbmYb8aQ/mDoJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208881; c=relaxed/simple;
	bh=AAAHLbJQtjDUw0cdoXQwq/j+1SeCHqrMC6J8CB0VAY0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ARIc4dybcdoxS11/qD7lPBQoOPlhqNj6X9k7/wgrdkq7p9CEdqMgKSyepjPRFfkt3Gye6uk3C5JUrTTti00fdxQ9CaFlQgDsyoenyxf5b4kvO8ChF+UvfQhKx4HqX8Tqm65944VLAYvNRqSnUNiWrBVIo8YxNHXqRYjIS/y2Xgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MSa/T7ax; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MSa/T7ax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEyQVY3p3L9AQW64B5sQnNX4QKvn+6pp2jD/951PwcQ0Emb1mhsUVkvmXr5bJ3LdR2n238EnFHAur+hkFYW5/58nmlUN1Bcy1EtxRhIyt8ruYhtmSBZ7sIlnmz9sLl0fW4+tV8NTRCrY4Hp6ioxFMiNk1s/0QVUkzmBq0b63B9D8FtoTFRTgmRXzusMGht25x4MMucL30QLKxujAXvf6+RT7o+4Gnnfo6daWpG42YiwRLNwGfIS4PC6rIzimdRJ0tfO1wdc0D0KEoT9jTwczpDYgqFJw8IG72Vgyk+Smc05OOYa/shr6BTFVAJ3ZrhG2mupaUqLa+6ac75Ed6/gvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7UMUT09f5tEhluLeBON5iTsvufOofLmLdKbLNMw5L0=;
 b=kej4UnmgFGtc92A1n0LvyA72RRF2YhjjU79okEu6466DArTxaAND1uZajSnF+zh0XTjwyT1xaK842UduYZXWYK+zY7DJXQzwA5nfWoJUMQosY4/efH2qHJjz35eGaQGO9QoLJXIEY1szg6KN2/hFOLGGWUGG3QSHTF7tyiGxUhhrsx2sZkAq/Yhw2kvbtwymP4K/vmJNefgLXBNuTFnpPxREczZZipVhBkiha+nWBgMrFdPYDdMSu2E0Tj7qoRToxeO1m1qs1zBqOmxoTJgBMaI5gxeC+gLn8dLgImge0QvK4lAVs2GpESO1LcD+HyDTdUP0JPI8BBroTCGShUkqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7UMUT09f5tEhluLeBON5iTsvufOofLmLdKbLNMw5L0=;
 b=MSa/T7axrOMYMMy6eN+sB3qec2vhvO6FVpa/voSOuve4EKsK8Msz3dNqqJNbCXu2JmDOU2LuYbJw90ZeUn6fgjPNJ0y7wyYn/mzBE1WLJDjAtLzyGg5CsXKzFiHVThyIw/Id4v0D9adsw9MXP8TRbUnDX9sofHrfjb/QAwnKYlDMSeCx1fVYrM44fBAAiGn/S4fO5XkO+3agj21d5GmeGIbXmYYggmD1S+FkQYW6zL0wApwOtyDmnZR8dET5w45A7sWa8S0/IpUozc7sQhzSKu+cmOtWb3vNQRv/LximQTQg2mYsTZ1m6oNt4Z1xLr6wd0YKr60FLXI1v6PoSZZ3YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7162.namprd12.prod.outlook.com (2603:10b6:510:201::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:54:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 22:54:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 07:54:29 +0900
Message-Id: <DFWC7A81FRFW.3347HWNH0CE6L@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v8 11/13] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-12-ttabi@nvidia.com>
 <DFW69A2VGB81.1YJ26924JUFII@garyguo.net>
In-Reply-To: <DFW69A2VGB81.1YJ26924JUFII@garyguo.net>
X-ClientProxiedBy: TY4P286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4f701b-596b-41ab-d602-08de5ad2605e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REdYYWx2SHFBZWk4S2lsRDJmSWl3QmhGa2FLQldZVzdtOXdCNGNsaWY0V3hM?=
 =?utf-8?B?dWQ0UzBUSkwyaTZicDZ0MlU1UFJZajQxZWpFQ0s1bVg3RTJjV3A4ajloOFpD?=
 =?utf-8?B?R29LTGZ2RVh0bTByZWJxYTA5bTZPQzFDNGlxNzRtNHdLWGptNit1ZFg2c3pT?=
 =?utf-8?B?UXc3NldmRGVLTG9WNEdhUVFDVGxsZloyVlVpZEhkWnliNllpQ0hXUGYxS0pC?=
 =?utf-8?B?aVVRQWZUeUJmUGFRQkFDQjc2MGR0Qjc1eWN4aDk4cjkxRk5RNHFNd2F0bDdH?=
 =?utf-8?B?TCtmNTUzYlA1L0g1S2JoUDdCRjJWUVArU05aRlhKTVg0d0o5dG4rMDhPYlRZ?=
 =?utf-8?B?b3JtNUdKR2R5ckZZTDFGS2wzOWF2WW5neThhZkI2K0h5TEsxYXZEQ1lWWkRX?=
 =?utf-8?B?cUNnY1hHWjVYUnFGbHVkbkZOek1sMTZySnRCQWl1OHNOWGdOdmVPbjB1V3J5?=
 =?utf-8?B?MWw1bjVrUE9MOWt2RGZEVlJQMW1RM21IdVg1bXlFSkF4OCtnYkdtSjIxWHkz?=
 =?utf-8?B?OWlBTDdjbmZHZmkrRklBWG9FdVdEbDlwYjdac3hQRDZkYVhXbWxNR3lVT3Fu?=
 =?utf-8?B?eDBBZE5saDVGSFNpNUFRWENVRGZpS25wSnhvcDZuY2s1NzZGKzJWc3poaXNy?=
 =?utf-8?B?YThCWGllSlFHMkUrTVQwMVUyT05IWlNqb2dYVElmejUrV2FVc2k4U0R1WEpX?=
 =?utf-8?B?dUZ6cEZKVXViaVVzbzJnQlk5RW11SlF4VEZTUTd2Wk1VcjZUTC90cG5RT01Y?=
 =?utf-8?B?VEw5Z04wVGtJQ1NwUjFKcVU1b0YxOHBMcEpuSU1wRzY3SjU5eU1OMDh3OXVp?=
 =?utf-8?B?eFBvc1BmZjkvMXNDc2pzVFlocHZsMy9oOGZINnA5WGpicmZVWFlOZkVKekU5?=
 =?utf-8?B?R1BTUC9iVmhwNjR3RHVQTTh1TGZhUnNZak5lb2UyaUZEZmh4L1ZZUXUzaGR4?=
 =?utf-8?B?cGRQR054L1pqcFNSVVNVQVdiVnFTbTdxd1BoNkVIbWRKNVNkVDhYY05hdlVF?=
 =?utf-8?B?TTdiTzhWV1ovWjYxR0h2eG1XbGRqUEFPWTR2djRrdkdTaGpROFY4K1ZWUmU0?=
 =?utf-8?B?YzYwMVlXU0xqcWZzMFd2N08vN3ArbDA3MFMwYTZNd0xrd2ExZnRzMkxmNHRv?=
 =?utf-8?B?WjlkZ28rRG5ucWlzSGxmTC9HQXVlSzhTQjBnd2pLUXpQcDAvK0FiTUp0WU83?=
 =?utf-8?B?akRBL0p5OGZOdytGOXhhMmNUTEp0VkJNNUxqQ2ZURmVoRWY2cmFMdmRxU2hE?=
 =?utf-8?B?UlhzNEFQbEJXZ0FPVE13d2dzM1U2cmF6MmJFZmkwaExtdFRDdUtpNmdvVWFG?=
 =?utf-8?B?d0R0WVNjM09hWkZMRWUxcVp5MXY1NFZqU1d3ZVl4WUovVWRaRDE5YkZMZkdT?=
 =?utf-8?B?Tzd4b0VDOW1oc3RZcmFiSkZqekNRYmpQNUtBOXVyZ2JuaEs4S1NkSUY3TVFU?=
 =?utf-8?B?YVBNRStzTVl1djk2UFBsSmxQSEdHRHJxcmZ6QTB5RGhvdkJlQk9FSmpJZllF?=
 =?utf-8?B?NjFiQ05QVW9tZHVZa2luajd2L1QvUm1OYko2Z2pqZndQVFdZVmlVT040REdh?=
 =?utf-8?B?UTVXeldyalJ3blVoem1zeXZoWkxSanZYc3JNM3ZucXdSVVg3U3FucVdFTHVZ?=
 =?utf-8?B?RU1tdm5LRnVGclVDbVJWMVl4b2FwMlFkQkFzNVMvb1ZZZlQ2cDJnWFZ2NmVs?=
 =?utf-8?B?a3dzRld1UWFza2VOU2pmOEt3NkMwcHZiRlhDK1paUjNIV0w4QUtuNHNHSHJH?=
 =?utf-8?B?WGVxY1BGT0Q0OExTdDIxN2RmZ2djV3o1Z0VQeG9adGRaUTNlZVBiYVRTQTBG?=
 =?utf-8?B?WlR4VVRtbnhoNHJLTlAvcU5xVmwxUTExd3YxSWZwMlhNeEdmNVYwVFBRQWdE?=
 =?utf-8?B?U2oyNU0zVlN0U1Jnb3ltSlJGSTd6bGFTNkVvNEo0MTRGSW9WK2dmdzNZcjZo?=
 =?utf-8?B?alhoUDYxc3h3Q05LQVJqaDFvRnhKL3gyZUNjOHNpZ0p4SXV1dHljOTRSL3Rm?=
 =?utf-8?B?Z1EwUVh0Vi9pbCtVSFlNYnJsd0trTzkzN00rVjZCQzB5QTlEcS8zOFpWdVhU?=
 =?utf-8?B?bm92anZrcWFzMW81eDJXaFdkTktTbTR3Z0FWV29NM2kvcXdyMzVuWTh5WHkv?=
 =?utf-8?Q?d2NQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWNaZlMxbFNwYjVhWHdqd3ZlU2VFS3RPdmJoOUJYZFFjSWpsYUNCTXcvcmxw?=
 =?utf-8?B?cFhJTTIxNjdVVWNiemRRbG9Hay9HRFkvV1pNcjRHYkRVbXZnRVFKSWtPcXZS?=
 =?utf-8?B?ckJ3SXFmRGdOajZDaGRWZjJpWm5BYlN6N0hZM3RRNnl3Ym1jaGhZUjN5QjNP?=
 =?utf-8?B?enAvVmEvV0laZjJ0L0p0cGMyOFJPYmoyZ2FTN2VjbmRYSlR4amFOUk5VV0lw?=
 =?utf-8?B?ckFCUTlQOEJ1YnVrMVpsQVBmV09aWnhnc3JKVENRT09NQU1tREdSL2s2cU9z?=
 =?utf-8?B?d21yQXV5QmxVb1ZkeU15SitOdk5oc3lrdDRZZXNvK2hhR2tNYTVzWXl4alZH?=
 =?utf-8?B?cEY4QVlwc0dzOGdmSmdLVWoxZCtvRTA4QWtvNHVxQkRUTFFrRVVUV01qeEpV?=
 =?utf-8?B?YkR1VVNFVnkwZDJCeExUUWJ4UERJV3hxTG5rbmpIV2hxZ1dWWXNuelBBbjVD?=
 =?utf-8?B?NENGdUhCVVRCTE9halRuejVkLzF1U0JiWmFMVkowN2VwaG9Mc25UbHVpVjgx?=
 =?utf-8?B?M2E2bWg2bFRESzdqWjRJd0g4Ym1UcGc1ak5tbnBDRTRxeXA0NGxpc2JHREQx?=
 =?utf-8?B?OU5JN3FUR2EwYWI1TkYzSkVFcm9oUWp3VXdwQjc4YjFvSXF5U3FmMHVkaTNi?=
 =?utf-8?B?Z1lzZ2c5b0VaM1hSYVRqcGo1c0pWd1ZPTjE3NUxpT2tvVWZKOWZ6MGFwZkl2?=
 =?utf-8?B?NXZPRld0Rm40WU1nTHQ0cXkzdUg2VC9xWGVkWG9ieE9tbmpFNno4U2hYNXcx?=
 =?utf-8?B?SklTMFJYcllpZk9jcjFvMGtkMEF1UGpsWVpSZVVTblFtZXhWanUvVkppVnlG?=
 =?utf-8?B?U1BnWVhQdEp3QzZNUDdPakJFU2lGT2M5aGlKMjBoZTdLQTVIWjNlOG9Tc1Za?=
 =?utf-8?B?YUxxdDdpc2xRazkyT1pYaTdqcHpCNkRTbDhSTnpQNytpR1Vjb0EwV0QzNnZz?=
 =?utf-8?B?d01NVkpWUURXemphUE1DQ3hybGtPbTNrenZkclE1eC9YeCtoQ1oxQUc3a01q?=
 =?utf-8?B?YWlKTlhCb0NEUTl2M1NVVU5DUldUODY0cVlnM0tzT0huaG81a2tlZUlGQjAx?=
 =?utf-8?B?b20vdDNEMzFuS2xDNFVxRE00ZWJPV1VETHN0SG5ySVBMa0FTRHdIQzcxa2Js?=
 =?utf-8?B?L2tjYTFvWWFMWEpyYTV5c2M2b1kwN1VpVFRFOFJVN2JsdXlXWVMwSUEwSC9u?=
 =?utf-8?B?RDRXL3ZSekd4bUsxc3E4ZXIwU2ZUNmQvS0QxTFN0REVYMHdpK1d5YndtVDVw?=
 =?utf-8?B?ZjFrcWgvcTVzeVE0dUd6Q05YNDRlQWFPYjhDbGprTXB6MjhWWWZqZHNzdzVa?=
 =?utf-8?B?NW5PeDBhSnBLQmg4bHRTREZ3MmJ5bllhZDQyQ3NHZHpFa256TmpGOWk1VFAy?=
 =?utf-8?B?WldQbTlpQVJEWHJDOTdBTTZJdW5UdTg4UlUwc1dGSWJHUDJkR2ZIRGRxSnAy?=
 =?utf-8?B?d2VuVHVPU0xodTJ3UXJEQk5oZm5PcTFGQ0dnazFuNWRPeDc3a0k1b0Y4bDRm?=
 =?utf-8?B?SHNqaW9vemNkdlFBalhOc2ozMWRSNDFyRjhMUUFTaXRJejd2ZEk5M0k0TmFL?=
 =?utf-8?B?amdiM1FGOU1YN2hKb2l1YWRidW81SVR3YUR2cDFzSjB1RDB2NGRHVUhRa3F3?=
 =?utf-8?B?MkNYTE5peXRCN0s2NkluR2JPR0RVeStSclk4NkZCK2g3aEJLMzRKZFJ0bllo?=
 =?utf-8?B?MHJBTGlCd2RNUUNPVTZVV3FSenA5aHVLa0hJMHd3WGdaZTBhZmR1aWdOTXh3?=
 =?utf-8?B?czkwRnNmcnpHcEdlR1lveXhUaWp6ckI1UVNQZUtmdmZkRlB3NGNQVDFwUmY5?=
 =?utf-8?B?dDNST2pTejFWTjNPOGhxWndBektFTnRMSFZJTjZTSnBjWGRJWFNKZzdrOGFr?=
 =?utf-8?B?VGY3M2FFaUJDS2htYWRkQ1hZNi9JTUlGZkJLL0tkeDEyUjRucGdueU5SY3VF?=
 =?utf-8?B?WEVkUzRIdko1c0ZUUVFwT0pFcmFVeVNWSFBPUlV5aHQ1dlU2MUNWc3JFUWRO?=
 =?utf-8?B?d055QmJXRW1qWjU2RU1vU3NuRG1ZUVlxN0V2QWtxM1h1VlBQczBpdzA2Qk9B?=
 =?utf-8?B?UmVxMzJRYXVBUWQ3RVZBaFNQWVFjcVlsejY1MWF5Q1lRSjRDaG02ZEROWERP?=
 =?utf-8?B?aGdrRWFqWU1kaUxSaDNnakljYVBSTGpUbUVxNElRcVovVE9QTnRjODRMTkgw?=
 =?utf-8?B?b1FiU0lyMGlVdlduZkZySjFxM0RoWHNKN1hSQUJhK0h3QTFlV3VCa1F3Q014?=
 =?utf-8?B?YkxSRkxBVUVIYTFnVkl5a1JoY0VBUFhBUlFIYWhuRkdNeGdhVzJTMnY1WG9r?=
 =?utf-8?B?c2lWN2VsTGpZUzgwWTErbHRJbHRvS00yRjMvOXViL3I2eFRYMFYzdzQyajhQ?=
 =?utf-8?Q?H4mGwB39XOUZp2aw6/uPX8Qexs3V7Om8MEVoH1H0QIsix?=
X-MS-Exchange-AntiSpam-MessageData-1: eOHzHmuMiv0GXQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4f701b-596b-41ab-d602-08de5ad2605e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:54:34.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLerI75pkniXvetQpc7YHJWgKyI52pnilC32E2MzRTwj4jGsVpHGh6VlTfWVT5pIFJnUVYX4oro0+tPCnt6gfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7162

On Sat Jan 24, 2026 at 3:14 AM JST, Gary Guo wrote:
> On Thu Jan 22, 2026 at 10:28 PM GMT, Timur Tabi wrote:
>> From: Alexandre Courbot <acourbot@nvidia.com>
>>
>> On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insist=
s
>> that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
>> aligned to 4KB.  The logging buffers are already aligned to that size, s=
o
>> only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
>> adjustment by adding padding to the end of the struct.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp.rs    |  8 ++++----
>>  drivers/gpu/nova-core/gsp/fw.rs | 14 +++++++++++++-
>>  2 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
>> index 766fd9905358..bcf6ce18a4a1 100644
>> --- a/drivers/gpu/nova-core/gsp.rs
>> +++ b/drivers/gpu/nova-core/gsp.rs
>> @@ -27,7 +27,7 @@
>>  use crate::{
>>      gsp::cmdq::Cmdq,
>>      gsp::fw::{
>> -        GspArgumentsCached,
>> +        GspArgumentsAligned,
>>          LibosMemoryRegionInitArgument, //
>>      },
>>      num,
>> @@ -114,7 +114,7 @@ pub(crate) struct Gsp {
>>      /// Command queue.
>>      pub(crate) cmdq: Cmdq,
>>      /// RM arguments.
>> -    rmargs: CoherentAllocation<GspArgumentsCached>,
>> +    rmargs: CoherentAllocation<GspArgumentsAligned>,
>>  }
>> =20
>>  impl Gsp {
>> @@ -133,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>)=
 -> impl PinInit<Self, Error
>>                  logintr: LogBuffer::new(dev)?,
>>                  logrm: LogBuffer::new(dev)?,
>>                  cmdq: Cmdq::new(dev)?,
>> -                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc=
_coherent(
>> +                rmargs: CoherentAllocation::<GspArgumentsAligned>::allo=
c_coherent(
>>                      dev,
>>                      1,
>>                      GFP_KERNEL | __GFP_ZERO,
>> @@ -149,7 +149,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>)=
 -> impl PinInit<Self, Error
>>                          libos[1] =3D LibosMemoryRegionInitArgument::new=
("LOGINTR", &logintr.0)
>>                      )?;
>>                      dma_write!(libos[2] =3D LibosMemoryRegionInitArgume=
nt::new("LOGRM", &logrm.0))?;
>> -                    dma_write!(rmargs[0] =3D fw::GspArgumentsCached::ne=
w(cmdq))?;
>> +                    dma_write!(rmargs[0].inner =3D fw::GspArgumentsCach=
ed::new(cmdq))?;
>>                      dma_write!(libos[3] =3D LibosMemoryRegionInitArgume=
nt::new("RMARGS", rmargs))?;
>>                  },
>>              }))
>> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp=
/fw.rs
>> index caeb0d251fe5..89be26b597d1 100644
>> --- a/drivers/gpu/nova-core/gsp/fw.rs
>> +++ b/drivers/gpu/nova-core/gsp/fw.rs
>> @@ -904,9 +904,21 @@ pub(crate) fn new(cmdq: &Cmdq) -> Self {
>>  // SAFETY: Padding is explicit and will not contain uninitialized data.
>>  unsafe impl AsBytes for GspArgumentsCached {}
>> =20
>> +/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgum=
ent`
>> +/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to =
force it
>> +/// to that size.
>> +#[repr(C)]
>> +pub(crate) struct GspArgumentsAligned {
>
> Hi Timir,
>
> This is not "aligned" to GSP_PAGE_SIZE, but rather just "padded" to
> GSP_PAGE_SIZE, so calling it `GspArgumentsAligned` would be a misnomer.
>
> `GspArgumentsPadded`, perhaps?

Sounds good, let me convert when applying.
