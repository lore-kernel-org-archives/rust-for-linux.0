Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D1F1C84D7
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 01:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046568; cv=fail; b=XoDnj6EJKfAYESn3xqTpDqC7J3w7ZZNaQ5TGWeUjVESYvvnvblUKLoKeHbKNIjWQcJQdTLAOZWXC95OgNJWfz74SVoDd/j4tSOk6nwvXV+hxzaDSwL0u8SgsbnOcvshQMtclI4PfwUgcdeTD6GPi39SLomaZ/95ZZIZOi/ZqTZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046568; c=relaxed/simple;
	bh=R7OaE8GirJAz8/5Nu+1uvhObxq+t4zB80ik39twW5wU=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XjW+/T7KYSNe0IoWWQ+1Rzls6vLDsZzd2TjTZ6NN9EcLjdC9KioGedpJk7XmYKaw0p0j6pGOQMRc9ofeMoPxYqnILIoyxochCs5TNAi5OdbhPUE5XGbXrdSd7tdne4F1H2VJTx0wf1rMjCCDh+PJD4ii+tSsVStl+rnv2Ykg1Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=byWGWodH; arc=fail smtp.client-ip=40.107.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="byWGWodH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVSD0E7AkFGz4VQqiVV7tzCODNHWFiqFBROAh9iF4R28fUcIiQrDJz6Yrq/a34XRNF8yoh7e8yqEy75lZxC9RaDakUwIXjNUDaR9Kov+AwotaDUFBE1hwd/WoBz4mfmh4vstA/TGkGNlN7dPOiLh0YF6jNc6nHoE8XcT1Y019x5JeJ5uJICVtgFvALql4TuMUdVyLZAHQDRrjYoXpXydcNOqzR3XugnAiEOVrxM0cuyIn7ZvpdE6usO2TnAFTj3yAkmOglineOechscUn7/LtiROYMIDi7NBYa4gYcT5n7vPav5zE9ThEMo0zyg7ReJfcosIhXmTZcxmAiNvJ8vc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqJ5TwRnLJCG0mSGD/PKz91VDTYcd2nROvIyvj3++4U=;
 b=qK2OPRBw0hhLYcxyodp9AXxiATh0f1Q4cjmF3veikHQFco2IaiMJ6ePrbgrVTluohDoZ+8oFGS6odJRcMUu33Vx0SSXz6OdIQ5qpsVgL0GwoezgrnnCA6PnVpZuSygh3jE94pJsyIR/v5swJI7yh+p41SCaitJOwsdk2Bi72r+tMgOHsanEnkabN6oVvtdgUKNkHDXv2k85BqC1tSxwN+sCyIN8RnD6YVGc/8yCchPtWJ51ZKfBkEmS+pMUeHUxg8EG+JvuPhSOnBSJeo9T8BuXTMA68d6xMKtqbBIcgEG11Q6fwjWaVZRyyQXSwfDDIHNNFPwzri4ZCko+i55xFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqJ5TwRnLJCG0mSGD/PKz91VDTYcd2nROvIyvj3++4U=;
 b=byWGWodHCgDekqCGBTAZiQ/0wmzTjRwXQeCsvxdSY+CgyVde00qCYNPyRP9rG0qrfy8ir1gIBfoyoX2Yx9IxwHZ07FRwqLGALdyfZcKKTfI3P84J6WcTPOhs8dWf8GSeIEOs/nUxJPdhFs5bz9kooM6nFwVf+FLmLo2luea3LLymWWJh4kd53WlFuKI6cSLH8OVOmTj+u/QOm2OnD6OVrroVleJvRXqgpLN4GaYuhMwHmtkqWj/uXu8H7gOwwzdNFb8/6I2ZMjfftKKqNtZxi/daDsuyPdrGRrQ+Hi1TCTT0qXofx/o7LMlDhmKCXRPIH8s/t5oO+2WIEWyXzMV7cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 01:49:22 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 01:49:21 +0000
Message-ID: <068fdcd0-7c28-4b45-9325-2f4b7f5dd7f2@nvidia.com>
Date: Wed, 21 Jan 2026 20:49:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] gpu: nova-core: add FalconUCodeDescV2 support
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20260121235302.1962185-1-ttabi@nvidia.com>
 <20260121235302.1962185-11-ttabi@nvidia.com>
 <ca0628cd-0044-4201-8f1e-899a85ee52b0@nvidia.com>
Content-Language: en-US
In-Reply-To: <ca0628cd-0044-4201-8f1e-899a85ee52b0@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0402.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::17) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: c82c7f35-5830-4adf-3a9e-08de59587683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1V6ZWhEaFZnOHdHV1ZSTXh5WG11ZDVUMEw2ZHNRa0Q2cWcva05yVUh4cmJx?=
 =?utf-8?B?SGMxNGZkazVaejhybHVmUU5oTTdKaDhsSTBTN3FEcXdycDR6Zi9MYTlDeGV6?=
 =?utf-8?B?eHdRMCtRaVkxaXR6dG9rNUdzc1hadDVEQW56ZmlqSmZmYUdUbFFyRlJXazdM?=
 =?utf-8?B?OVdyckJsUzlWWm4wZkRyN1JhZ2w0WUJ6aVdNSkcvWFZIbnIxWi94d0h6SWcz?=
 =?utf-8?B?eTNSVTVFbGd1MTRzN05nWWtxcTZJSjZaZnE5TklvL2JLSXd4cFdGeFp6b0xU?=
 =?utf-8?B?TGdwU2h1RFJDcDd4RW1aeGorTHRXOE95TTVSeEdSYWdxczRoN1BDQjZ4TzZ4?=
 =?utf-8?B?TnEvSCtQbkZZTlF3NXlkQXFuS3JUblRXNTRmUDF5RCtCNGJjc1ZOYVE1M3hZ?=
 =?utf-8?B?OUFveDdlTjJqcm1ZNDlqS3JmKzlhMXBDQllQSVBZbzhjNWlxLzZjS25LYXlx?=
 =?utf-8?B?MXB2akVXME5FeDY0UG9OUXNNcWRvMDdPMnM4cnNUSlc2c1BHNFgzOFZwWGNB?=
 =?utf-8?B?SUFsZ1NYNlhNbGx3Uks2Sk4rcFdKOHQwd0FIdVR6M0h5S0l1SDNvUVVlYlVW?=
 =?utf-8?B?TFhLSmVrZzVXNEJJNExYOWlYZEFLa0hheTR5QXlMZkFCeklYVHNkeUVnWTVM?=
 =?utf-8?B?ZldNNFNIM2NkV2NqMnhpZUgrY01RUHdtMVBuYWVvQjNkTjU1UGh1eXZ0ZmM4?=
 =?utf-8?B?c0RjUVVLMVMwOFlicTNKaWhPOGdwbzFLWmg4TXVrRHhrYThhdEl6RlhnSTE4?=
 =?utf-8?B?VjJiajBYN1NHNVp4SDVTb1NQejdKZXNESURiaG93TGRQbDQxS3dGaTRuUlYv?=
 =?utf-8?B?THBveHloS0FLTGZEMmQyczE3c0szaDl2VytobDZjWTNRN1JLOWJXSnJBeWRr?=
 =?utf-8?B?M0VSTVNoU0J3anVLOXlIYzlvRWFIcXQ5bVNzcWRGQVRVZ1FSWlprTE5JY3hv?=
 =?utf-8?B?Mm13YjlHK3VWQ2dNVVV3MDU0SjdpMndaUW5SaDNSZGVNSi9yOFVUNVFjN3hq?=
 =?utf-8?B?WUh4djVONXZKajJhZkRzbDF4SlVjTWNjanF2MXRhUjRpczRlL1Q0ekVCNHll?=
 =?utf-8?B?UWhlMXhQWXpWSEY0OUZCbzA2M1BkT244V2NGdzdGRk5aRGZJakxWa2RxVjdm?=
 =?utf-8?B?TlljdWNJaVNPbDFmQ1U3L0NnOFlqRWczUnhpdXdtZFd1SUZQZExQNk5VRXBi?=
 =?utf-8?B?L0lqYVNNN0VFRXNRaU4vdGIzSW15UWFncy9OMGRPc2VHQXJNbXRUNkJnMkRR?=
 =?utf-8?B?SHNPeFZneitndUZQQ3FkZ2MwTG5BT2tYNkZYajZVUElsNEdOQlFQVlpPSnpX?=
 =?utf-8?B?TDBPcmk1U3dqSG1ETUppNDQ0SHNwV3dWWmVxMngzc1hESE9KSnVodmJrdmlx?=
 =?utf-8?B?L1AvQW9BbkM3N2RIaFlqTFQ2eDJLUnUySk5oWXZDWFowQXNyYkc4RWlHcnl3?=
 =?utf-8?B?a0xPck9vK1d4WEoxdFp2amhmandYR2tZL0NpaUlPYjVESGxMSFY2V3ZIeGVT?=
 =?utf-8?B?WmNkalNralRuck5yU1BYbkJLdE5QODhXMGJ5cEtubHdnQlFVRU5od2RnRGhJ?=
 =?utf-8?B?MEkyT0NJaHoxejhneGY4K2tNaWQycHBXNlBaTjdRTXdUWW1tc1NYUWRuSDNh?=
 =?utf-8?B?WkJUcVZXREhwVUd4clUzN0tKd1MrY3ZKNTdVWDk2TEpLQWtOaXpGMkRkQi9U?=
 =?utf-8?B?UnFwcDZBM2hXYTNETlMrYUM5djh1Q1JYbis1YVZldzZmYkluQnVLMDlhY3Fq?=
 =?utf-8?B?ZHdVVnlpcXU3VmNiRnNXeW56bWFnQ1NjZlJFaE11MWZYUThZcEFsaEdWd2Nu?=
 =?utf-8?B?UExMeVNjQjV6cjEwaitZdVdkNFhXamExZWZIakV2ZWJZRVF2TFBzUW9TTWRv?=
 =?utf-8?B?WXpvVDcyQXVOdTNTMEpZbXRFQXRjU1o2cjc0cVpYUE5iRTgrbGlVaUtST2Jx?=
 =?utf-8?B?TklhV1oybklRcGxmTFo3NnZqSTdyY2RRZkoyakpGZGFVVTBjemlBWmRtdUZ5?=
 =?utf-8?B?WGVXOTFySmQ3T0JYQnN2MG8wNk95dENrUjMydzFWclk3N0p1MmJCWTczenJr?=
 =?utf-8?B?OVdUVmNzekdLV0U3RmtGOENmTlc3dGx4UzlwWHgxSXJkUXdXdi9TbnJQSTkx?=
 =?utf-8?Q?nPsY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkFDd252SlJ1NkpKVTEvL3pId0NTQVJwdE8weVdndjRhdzIxUkhxUndpNm10?=
 =?utf-8?B?RlFhVitQTzEwYno5SWJKeHhXL1U3VHZnekI4OG9Eamt0T2F4a2I2V3U1RjlU?=
 =?utf-8?B?OEpwQjJva3Q3Q3B2bWJRZDJEQ3o3UFlQNDJQZEZ5Z3Erd3V4bDl0SDZPaTRu?=
 =?utf-8?B?d3RocUtMRXR5eGFoUC81UTJwZFRJd2UzcXppT0JUV2lrbENsdFdIemMzaEQr?=
 =?utf-8?B?RkpUejdMREtOUnFMaGRoN1Z4dzBkejhZenNiSTJSVUVNZjZNYm1WdklMZHc2?=
 =?utf-8?B?akRpc1RCUXdpYnhJVit4bWx5Mis3ZGJFOG5lakMvS1dTVitva1A3UkIzbnZr?=
 =?utf-8?B?SkxMN29RVlpYcFlMd3pvNkNBTkxCdU5tUnhCZ29ZbjhKbjhxVFRxZ2UxOVhj?=
 =?utf-8?B?WW4xdndJdld5b3VNQmVwYnBpeE9HSGtrK0RLZTVDOTdGYjJ6QkcrYnhSUXFH?=
 =?utf-8?B?QmkvQmdEcEprdmxlbHBNNHVSZGFodi9GRG95ZExYYXNFZ2tIZFlkUkpnUnRF?=
 =?utf-8?B?NzYvc3BDMFZDUjAxeSt6Vkx1Tm5wczNmdTlkRDhHMkhQejE5V3hhak84VjNk?=
 =?utf-8?B?dTBIZXdmTmhPYmZRUTRubDNrTThWLytKek9ZQm10S2NWL3BkbEw0VDR4Q0Fs?=
 =?utf-8?B?Q2xrNnBVRithSDV0NzV1MWx2SGVKR2J4OXBIejNjemhQSkpzaGUzV2ZEdEha?=
 =?utf-8?B?OTd4dDdYQ2V4S0J2aXFyWWVidlhZTVlneGVuQS9rL3M2c2dZTHhDRHNIaVl0?=
 =?utf-8?B?dUxsS3VPRm5JTjQvc1U2SWNtdHFMN0g5c21oODBEbXQzSURXQkU3ZkdaOFFR?=
 =?utf-8?B?UHFtbmFiWXU1UzBiZGZnZkI3YzA3bU5jSzUwYWtmY3NzbEdsY1ZlRzVLdVhP?=
 =?utf-8?B?cjloZlpiejE4VENGcXBhY2lUcjlCRkhvK2w4SGtFNXhmRkZGUCtjaTVTbnU2?=
 =?utf-8?B?VHJ0Rmp0L2xXV2JFeHRBREI0OU1td0EwVzh5TzZQUnIrc3pBcG02Y093SVM1?=
 =?utf-8?B?RFRWcHk4bXpXcVYxaVpDVGdVbS9lSTlTQTNKaEhNT0poN0RxTEVKRE1LTzdu?=
 =?utf-8?B?cmQxUTErVFpsWHF0bXo3aG5tS3BldWU2Q3hFellsUWplVFM4NXRoYzE5dXRZ?=
 =?utf-8?B?RTNxK1lhL1RodDVNMGRXOXNZVXYxcmR0cDk0eExIdldNY0ZkVnNhaHZSRTFI?=
 =?utf-8?B?QzZseVJ6WmhXY1FlTFFXbDhNbW9RY0JzRkRaQXByTlhoejZPVDRWM1dqVnhU?=
 =?utf-8?B?aXovSElmL1BLN05WdkM4UzE0ZFlhMWdHdEZsRWxvM0Z1V2w1WWxqTUxCUjZo?=
 =?utf-8?B?a2RiZHV3cE4vOStRcVRQQ283MDI0TzN5Rmw3T1JoWmZNdVN1M0d2V2FHa2VO?=
 =?utf-8?B?Y2hpU3ZqaFJRZ0NCU1k5OC84YU1pZ3dhaHBhbXRXQzZCN1BseTVGNEdZZlBQ?=
 =?utf-8?B?OE4xUmpHWFU3RW9YQnRBbzlIbHROdHJGY1lCUXh1aTFwei8zVnlVcm5ZZ0xL?=
 =?utf-8?B?RGZZNTkzdm92MzN4ajVOUUd3YnJhenovSkJXVUU0eUt5VkhxNnFpUEloRlJp?=
 =?utf-8?B?UVlHYytWenRVU0tpWFd3dlkwa2VsUnkzbndLeUU2SGVnd3FMK2Q2Y3gvdmpI?=
 =?utf-8?B?U1oyQlQzMEM1VkN1WmJGdDdDamUwUmJIOVFWbUVJWldDUUR3SjR3bGh3TWZm?=
 =?utf-8?B?T2l1ZW01Nm5LRk16Rzh2c0hxVWdsWjdjL3VneDNyUklsR09iTFJzTmkwanRD?=
 =?utf-8?B?UC9OYVhuQS9ya2EvdmpTZ1Z5UW1xamhadUFpbHpUUVRaM3ZQZVRWYUlpV0FL?=
 =?utf-8?B?ZUlCUFVTeTVZcHQyTUNKaHVqcThMc25jay8wbXFiTU52SGhpS292REo0U2tX?=
 =?utf-8?B?VXQrb1JyQ2N0emRaL09hS1NpYTZTWDQ5ZWR1d3lza3BhMEJ5WmZ0NVZvUUkr?=
 =?utf-8?B?WFJyUUlIR281R1VFQVNzSU80YnNJejhka3gwT1RpQlRCMzB4Q1paZE9aVmtQ?=
 =?utf-8?B?aElXZE83NmJNL25rdnRFV3BQb3p0eU1wTlBJejZYZGp6T2JxZ3E3NjdvRmw0?=
 =?utf-8?B?OUt0OFZLdUhDK2JCVFVudHVEMHBPNVpQOVY2YUR6cFpqV1p2U1JSTlNLRkhU?=
 =?utf-8?B?MzNuMXhxbTlKZ3FaMTltRG85VkFnQm5QTEVEL0FZZzNtd3hXejB4cExLUEpo?=
 =?utf-8?B?cG5yb3dvTG9XVjgxbVFGUDJWaGVpNTJ3b2E5MnJGamVBYVpIS0xXaWdGTjVv?=
 =?utf-8?B?Z3Z1dHVaMzZxYTJ2WHJvNm9TTDZYSHp6bDNjK1FSYmVBRWRvQzlQcmhLZHlC?=
 =?utf-8?B?UXBiRkNYZnpoOWFOR01URDJjV1cwSmI5VE9iSnpkNXlEYUdxSGxodz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82c7f35-5830-4adf-3a9e-08de59587683
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 01:49:21.5240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvsbE1gISZTEyzx5+6qS2uoRL3fs7FE8FFwbhfIo4mmC90FUmq0nV8EISxi0+hk2jGCrmEEsSF3l4GDfSBNXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876



On 1/21/2026 8:45 PM, Joel Fernandes wrote:
> 
> 
> On 1/21/2026 6:53 PM, Timur Tabi wrote:
>> The FRTS firmware in Turing and GA100 VBIOS has an older header
>> format (v2 instead of v3).  To support both v2 and v3 at runtime,
>> add the FalconUCodeDescV2 struct, and update code that references
>> the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
>> encapsulates both.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs       |  203 ++++-
>>  drivers/gpu/nova-core/firmware/fwsec.rs |   46 +-
>>  drivers/gpu/nova-core/vbios.rs          |   64 +-
>>  drivers/gpu/nova-core/vbios.rs.orig     | 1105 +++++++++++++++++++++++
>>  4 files changed, 1354 insertions(+), 64 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/vbios.rs.orig
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
>> index 2d2008b33fb4..68779540aa28 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -4,6 +4,7 @@
>>  //! to be loaded into a given execution unit.
>>  
>>  use core::marker::PhantomData;
>> +use core::ops::Deref;
>>  
>>  use kernel::{
>>      device,
>> @@ -15,7 +16,10 @@
>>  
>>  use crate::{
>>      dma::DmaObject,
>> -    falcon::FalconFirmware,
>> +    falcon::{
>> +        FalconFirmware,
>> +        FalconLoadTarget, //
>> +    },
>>      gpu,
>>      num::{
>>          FromSafeCast,
>> @@ -43,6 +47,46 @@ fn request_firmware(
>>          .and_then(|path| firmware::Firmware::request(&path, dev))
>>  }
>>  
>> +/// Structure used to describe some firmwares, notably FWSEC-FRTS.
>> +#[repr(C)]
>> +#[derive(Debug, Clone)]
>> +pub(crate) struct FalconUCodeDescV2 {
>> +    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
>> +    hdr: u32,
>> +    /// Stored size of the ucode after the header, compressed or uncompressed
>> +    stored_size: u32,
>> +    /// Uncompressed size of the ucode.  If store_size == uncompressed_size, then the ucode
>> +    /// is not compressed.
>> +    pub(crate) uncompressed_size: u32,
>> +    /// Code entry point
>> +    pub(crate) virtual_entry: u32,
>> +    /// Offset after the code segment at which the Application Interface Table headers are located.
>> +    pub(crate) interface_offset: u32,
>> +    /// Base address at which to load the code segment into 'IMEM'.
>> +    pub(crate) imem_phys_base: u32,
>> +    /// Size in bytes of the code to copy into 'IMEM'.
>> +    pub(crate) imem_load_size: u32,
>> +    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
>> +    pub(crate) imem_virt_base: u32,
>> +    /// Virtual address of secure IMEM segment.
>> +    pub(crate) imem_sec_base: u32,
>> +    /// Size of secure IMEM segment.
>> +    pub(crate) imem_sec_size: u32,
>> +    /// Offset into stored (uncompressed) image at which DMEM begins.
>> +    pub(crate) dmem_offset: u32,
>> +    /// Base address at which to load the data segment into 'DMEM'.
>> +    pub(crate) dmem_phys_base: u32,
>> +    /// Size in bytes of the data to copy into 'DMEM'.
>> +    pub(crate) dmem_load_size: u32,
>> +    /// "Alternate" Size of data to load into IMEM.
>> +    pub(crate) alt_imem_load_size: u32,
>> +    /// "Alternate" Size of data to load into DMEM.
>> +    pub(crate) alt_dmem_load_size: u32,
>> +}
>> +
>> +// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
>> +unsafe impl FromBytes for FalconUCodeDescV2 {}
>> +
>>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>>  #[repr(C)]
>>  #[derive(Debug, Clone)]
>> @@ -76,13 +120,164 @@ pub(crate) struct FalconUCodeDescV3 {
>>      _reserved: u16,
>>  }
>>  
>> -impl FalconUCodeDescV3 {
>> +// SAFETY: all bit patterns are valid for this type, and it doesn't use
>> +// interior mutability.
>> +unsafe impl FromBytes for FalconUCodeDescV3 {}
>> +
>> +/// Enum wrapping the different versions of Falcon microcode descriptors.
>> +///
>> +/// This allows handling both V2 and V3 descriptor formats through a
>> +/// unified type, providing version-agnostic access to firmware metadata
>> +/// via the [`FalconUCodeDescriptor`] trait.
>> +#[derive(Debug, Clone)]
>> +pub(crate) enum FalconUCodeDesc {
>> +    V2(FalconUCodeDescV2),
>> +    V3(FalconUCodeDescV3),
>> +}
>> +
>> +impl Deref for FalconUCodeDesc {
>> +    type Target = dyn FalconUCodeDescriptor;
>> +
>> +    fn deref(&self) -> &Self::Target {
>> +        match self {
>> +            FalconUCodeDesc::V2(v2) => v2,
>> +            FalconUCodeDesc::V3(v3) => v3,
>> +        }
>> +    }
> 
> I guess we still need to decide if we want to use 'dyn' for
> FalconUCodeDescriptor or function wrappers with separate match statements. John
> also recently felt, I think, that 'dyn' here is more complicated (I was the one
> who suggested 'dyn' in v2 or so, but hey - in my defense, I am learning Rust too
> ;-)).
> 
> After seeing this patch, I think I realized 'dyn' *for this case* does add more
> boilerplate, because now you have duplicated functions which almost do exactly
> the same thing (seems much worse than duplicate match arms).
> 
> 'dyn' would benefit a lot though if the match arms were large. But in this
> patch, most of the match arms are just accessing fields.
> 
> For my -mm patches, where I am routing between version 2 and version 3 of the
> page table/directory formats, I actually went with match arms instead of dyn
> which was cleaner.
> 

Since this is not something we can easily fix though in a follow-up patch:

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

-- 
Joel Fernandes

