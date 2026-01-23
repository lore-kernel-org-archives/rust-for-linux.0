Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E9321B91D
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 20:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769199369; cv=fail; b=jReso5P8O23fhOJizDHnN+asGcEgHRzZBMjlfcSBcg+SgN+5Gl2LC8V6+/QYkWh+qMvWia3U4fWyKx6Np6+juiu0Scx5XuamnUyvJNU/oU2T+JAnnc5R4RCML5iVFWdSdQoB/yxS3geKPigwSzL4KXELnKn6HdUAJ8QdlBIguzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769199369; c=relaxed/simple;
	bh=q4fECI78/mCFKenaZGgYezeDg2MAGUIU/6QgYl/gKIs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fGP+XRzb1jpJUGg2NcImFIw2UTy4ko54CT2Xzdkk4pTceLZQ5xxcmdr3bIESlYaXIT18e5xgoSL3u3bgXy9ymNg0WWfTLMDrxg50zFpV+T7PJGBdKZZIMLzofqJWQZAcpkV7z3LgnYYYSRH2HmlaMduDcBmxeLcaiflqaZjy5oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lJ2THrZP; arc=fail smtp.client-ip=52.101.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lJ2THrZP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Edu8Ag+UFOIfQ9Tklqlj7PrdP5eYCAEcsvVSRedFHWWCa9M8uO+NwtALcrjN1C6ckcq35o1Xv5oMCLtoMnF8g5/UaWTFBFlgI5L1EFhKNZdCO/3Ztktj5yc6Gb/ymK9nPRGynbVVFWihRWW32a2Bn1tym69O2h3lYJeNsht63hXGBy1w1dFMBqXfY0TChwU9Y+hlXYdgt1COc4hfsKIfB90SHWck2e3OzF1ox93Bm07hhSym8KQnhTY10H2e5jRlOCLFmrlFFDZ8hFQIe3Hy/NQSfsw96I5jv1EFboXErO9nEZhX9Iz37zoJMfyQ2BxM78o6xTk/owYffzKppTZJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxKFcUOmjeJtPxBaC5Sd66v+XnyTejYsaba/DV/ILac=;
 b=E6k+n5Y1CcrN0bOMyHEiS0eRxLIL43EF/jlbzv0miW489R4O8YwY3p/Fm9Aan82zfmIofBBwHr3hvq0GLxaLDQBkam0YK7VUA4NTae1Heyp+H7JmUex0gF12j6HIqZ2MBX/mvtcj2tOt5oYiLdr4HqttZnNvgNZMa1kfOmPMt8WccO0fNN/I8mL2Q0MMktqKYpKehB5B0Qi7w7E3puzBAwImnwF/U5u4bIvqFpeQ6HKgDT4bswftaLuLyc6ihuA7iZoTPijXjlZBz730Q9NChv7uL5xovw65NkZJOS8E5drT47BBQglXNBIj6jlp1aEgxDtPig8pG3K25QkBM7BJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxKFcUOmjeJtPxBaC5Sd66v+XnyTejYsaba/DV/ILac=;
 b=lJ2THrZPm9YSiZWfimR9HZeTIKmhg14/m0tXYyYphpNMNxONNpbEpgiqpkdIH9USb3bGebHUpxZ3p0tDN8zpbXYI51Au3ON6XyvLEOsXRXdWhykLVC090ayAe2QnY/aladm/Y0MkdrXqZqrNLqyHE9ooNn/L9Ans67g+HMo0L1c4vGwBOzALI6XDCy/U8V14oqZFcicCd5Efmb3r2ZDaYmLwJUHBSCRR1tKoMwxt2OfVXHtUs1yzIiPu5oZHYyq/zH8ymfTLpfo/HkvBcvrBzqU34CMLl+OfJ7a4oP846+GsLuh8ocCPKnlJ/yEvBHKe7lEJgYzNGkMYPEwd9t3ISA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8319.namprd12.prod.outlook.com (2603:10b6:8:f7::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 20:16:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 20:16:03 +0000
Message-ID: <70782bef-c6bb-4cca-9ddb-aae840999567@nvidia.com>
Date: Fri, 23 Jan 2026 12:15:48 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/13] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-12-ttabi@nvidia.com>
 <DFW69A2VGB81.1YJ26924JUFII@garyguo.net>
 <accb58c1792f771b6543af9adb9228b34135302b.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <accb58c1792f771b6543af9adb9228b34135302b.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:a03:338::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: d3239f33-2911-4dd8-1427-08de5abc3b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjZSMEJkeHJSNEdhbVlTaFRoN08yTGVSZ0pIVGk2UlZaeVA4SFV2blVjR2VI?=
 =?utf-8?B?MG9pK2krZHZVQmoxWFhGTFM0TlhmanB2ckdzYzFpNXMxcFZGdkc2VVFYdjNO?=
 =?utf-8?B?VTlVUWF5ck8rRllmbzgvb2lkUmh5UVFlN0Z6eUNCK1pzZi9lM1J4dkJhai9x?=
 =?utf-8?B?YmRyV2Z3RzZIZGRVdDBXbGhiaEF1MXZOS1lEYTJrWTZzR2lGeDRYaURZbVc5?=
 =?utf-8?B?UU5qUTdDYlE5SXg4bWFMMkpKNDJaYjdFRG9ic05YZkc2d2RTNWFEWDFzdGpL?=
 =?utf-8?B?TkNXOVdOeVdZY0ZVWFA5emtzanlMOGVaSEFQaXVRY3ZSZXRwenpLWmYzMmlw?=
 =?utf-8?B?VGg0RXZTenBSdUkvV3owQmkvaExsOTJ3RUZPcXZtNWQwT0gvYzUwTzU0UjZa?=
 =?utf-8?B?Y05NMFEvZlA3RGxJN1JnREVxNTNKTG1pN3VuU1BLZDJHd1hJTzhTMGZMZFVk?=
 =?utf-8?B?dXk3c2RtM1dEd01LWUpiMjkzcDd5Tk5udUFNZXJxYlVZcFNHdkJrV2gwdExU?=
 =?utf-8?B?c0RIZXpiQmhhZ3JFRFQrNTdROUl1Ky9sSm5FQmFpdTc1Y25Yd0pWOWFjT1Nk?=
 =?utf-8?B?SXJKbW9MZ3VLa2w3OS9KQks3UnJHVVd3c1JxNFRHSXhyVVB2YlIrSjVQN0M5?=
 =?utf-8?B?Q242c1pHMnZVQ3FBY04zQlVibUdVVHUzVVpjRzRFc2IyTVJqcE8xcS9YU3hq?=
 =?utf-8?B?cG1zY3hiNDcwS3h3SVd1elpudXRIUEFMWm1pZHc0MlB0U09mSTd3SEQwblEz?=
 =?utf-8?B?aXFYY1o4T05zZWtPbnB6WTFqZkNEcTJQNjBSVzF1dVBkT2xUOUZJQXIzRCt4?=
 =?utf-8?B?aW52UTE1ZjRzQ0ZRM0NOVzZVOFlFUGlubXVlTmk1eHNsZ0dMN04zZjZZR2lX?=
 =?utf-8?B?NDhjUDdlMGxKZVpoSVB2MVZLOFYrOFF0U0J6VlRhVXhnNHVKTzNtZGpVbkRC?=
 =?utf-8?B?RFR4cVk5MFZETDl0am01Q2JFSFN1WVkwaDE0bnU0UWhDa3k4enYrTUNlMzNm?=
 =?utf-8?B?NVZrMTBySzlkOEtpRURCcm1wTEtvOTd4UzhWWFNxZENTcnMxNk8zakhtT2Nu?=
 =?utf-8?B?dUFucjB4MHlBZjRoUHEwTnIwdmdSSTBENFNKMFNaV2pvZHMyRjNTSE13K1Uw?=
 =?utf-8?B?b1FEdHFrWWs5Mk1BQUNIZDZpek9kT2pBWEZDem9KZkhkN2dpdHcxRStwOFEy?=
 =?utf-8?B?T0Y1Y3dnN0l3cnpPNWxzNERrdlN2Qk82UGNpMU5XTHFkUWRqdjhkL1V2Z0lR?=
 =?utf-8?B?bXc5YnlObHdBd1pDY0hWSlR5eks1SktIZ3ZvajBaRlAvanNRZ3VCSUdseW5V?=
 =?utf-8?B?Q2s0ZzVYaTNDdWw2aTM3ZXJsRHJYd21Kbkk5d3pTVlAwanBES0MvWnNwTGty?=
 =?utf-8?B?VUY1UW5QNjQ5ZmVpdXVYd1VKNFpqdGRXbFZpVVgxU3l6QmkyeWhkbytKdDUx?=
 =?utf-8?B?b3BXeFBEN1VJaWRQcGZsQmRNazRuVFVFdlI1VGRkRFZ5eGlQR054bngzMFhS?=
 =?utf-8?B?aW9kdVYzMXJXTkRMWEtLQm84TFhUYmJ0TFl0Zm8zYTA2N0tlbUMwQkloQ2wr?=
 =?utf-8?B?bVpmaStvVzArUkQ1QXVScFJsdDRiMW9oY09YSDlwTkJYczRzdTRyV211N0pq?=
 =?utf-8?B?YzFRQ0RpNzV1dUF5ZnVuSDcvTm9rU2Q1dzZEaXlOWlFEYWFkL2hDYlRmbTll?=
 =?utf-8?B?N2RDYWZEeldkeDNZc1RqTU1xUENXcjl4RDZ0QjF2dlRMbytCZ0NSWi9zZzRl?=
 =?utf-8?B?eDF3RnNtdTRhd0E1TDJMMDZiQkI1djJqb1dYOGdXTCtydFNUaXFGZVArdnUz?=
 =?utf-8?B?Y2VQUUI2NDFMRHQ2TXRVb0JFRjk3aWFUcFlyb0UzYnVmNWVpZlRHNFhML0t0?=
 =?utf-8?B?VW9FOC9hYTRPTEdncHc5QUErVVdUVExINTlveE5rSGlKV2dwVXNWcGpscytW?=
 =?utf-8?B?QUJSMEVnbzhYdkk2cjUrL1pCdlpoMHdnOUYwRHA3T1RQaGVtWm1zUEEyRk9X?=
 =?utf-8?B?UHJEWWRPNlhqQjRRai9iLzVLMW5NK2J0NFNzY1dYeUIrRXVEY1h4eXVuWVlj?=
 =?utf-8?B?RFlvQ0VPUXZBalhET3VHd1ltUjJQa2Z3S3kvaEhEdDg2emNFa0diQWJkUkYy?=
 =?utf-8?Q?HjAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmtEVTRmNTREdW0xeDNqSis2RDlXa2Ztejh6cGVLZ2lkcUFkbk5Hb3QvWTdq?=
 =?utf-8?B?eWJOY1pXYzJxTUVNalY2NHd5bFdzSjVNMkdyVHlZaGErV3VZQ21TQTNwenZG?=
 =?utf-8?B?M0hHcHprK3VYdkZ0UlBwVG95eXBtRFBqZEdibSsreGpoRGZGUGdZeHA0bDVm?=
 =?utf-8?B?QVJkWlhncmpOQ1U1L25qREdIa0IzaVdVUytvMTEwa0laRGhRTFplU1pxRWFx?=
 =?utf-8?B?eTY5TlFZQzhvZG03cGFnUHdETWtPbWc2d3RYUDlTczZWYWpqbmtlNXd0OWFy?=
 =?utf-8?B?RlJRVTFZR3M2R2pjZlFYVlIyWEtJaERweVJEZXFqYkE1R0hya0dxU211Wksv?=
 =?utf-8?B?cXpnZ2lCZDk5YnBQNU5FVmNhY0JiakV0Zk4xZUlIanBlQXFabDJQUmhKdzVp?=
 =?utf-8?B?VmZkVWJuc2dDOEhlR1MzblNKYStQQW5pUFdvWW1LdHVsa1EwZWFIQXZXcmlM?=
 =?utf-8?B?aFlxODk4ZTNlYTF3NWtxTXJIdXREeGdvVGt2SW93T0VTR2Y5MlYwRDFoS0V4?=
 =?utf-8?B?bUszeDNSNFdIVHp4WnVZMlJYdmRVSlgzck8wMFpMams5ak5GYkl1ck45K05N?=
 =?utf-8?B?YVhOVjdYZ3lMMjA0bzlyS0pGaHRxWmtiOWdLR3VMRnpYUDF0UUlBZzNsQ01U?=
 =?utf-8?B?ZHN3UDVYamxGaU5LN1Z5MmkyWS9KcFozUlc2M3d2UityTmJ3OVo0TCtVbmZS?=
 =?utf-8?B?VndBdG5ic1ZDb2FTUkFkK3BsK0lBdGtKYnRtWlRkZEp2Yjk2bVUwNEVnM2NW?=
 =?utf-8?B?azZTOFA5VjBYWUZrQ0lPdFVyUDdURmh0Tjc0RnhnYnN4bTFya1I0VFZRRXJR?=
 =?utf-8?B?ZitKaUEwT0phYVdnU09ucUNjeUo4cDNCUHlkYllzTWY2Z1Vld1FuM2ZWRk9Y?=
 =?utf-8?B?S2h0U3pJQzdQM2ZTOWRMakhaMk9rUnNtQ1h4SDBqNUtHUk9jK2lTZVRxc05I?=
 =?utf-8?B?YWZ3dnpZdTMyY0QwTUxaSDBjeENrUTdDVDJTMHNTT1pQaEY2ODNaRFR1TWtw?=
 =?utf-8?B?cWJ0eGpmMTVuZmcrdStJMmRDVldDTWorM3RhbWs4alBVb2h5MWxKV2I1L016?=
 =?utf-8?B?LzIwN04yNlNZajZBNVJjZmsxUnIrK3FGbkV1MUg5WFZDSFFvcC9vNjMzTVpW?=
 =?utf-8?B?b3ZSUHNQQTFRczNqeWpBMlBxbmlETGFwWTJKd2hDSWg0SG9LNHNpR3RnV2tN?=
 =?utf-8?B?S0wrMlVOWUNnM1hJNHB4K3BicEdvSUcwS3d5b2lVMjJnamdXbzI4MlpwcWZj?=
 =?utf-8?B?bGtKUXpmOWVrYUJIY1VBbk9vZnFEbkViQzV6bDlaVVBQQXN4UlZ4enpwd3R0?=
 =?utf-8?B?WmVCK3ZpWkdzcFZEZjh1ZWFaNjYydjZrRks2bDNNUVZuUDZaaEdIRTZJZm1n?=
 =?utf-8?B?eXBJNkh2UkRrSTBzWkVpdmZDbi9ERURVMkxNSExsdUppblJpVkJycE1ZNDg1?=
 =?utf-8?B?ZnhlQjR0MzgxQ1NyQ0EyRTJYNTZCN2pEei85aVRpckpmNXRzYU9YQjRnZVFx?=
 =?utf-8?B?Y1d1V0p4a3RKZjZ4NkhmRnZmMmxpdU4vVTVpVEVNd3lmSCs3RndyTG4rYWVG?=
 =?utf-8?B?SmdkYi9BbE9od04zclZTMUdqb2UwWnNkbFlsVlZraDNteTk3VHNtUTFqc2Zj?=
 =?utf-8?B?T0s5eEROdURXOWFzSVBJWlkyWXd6aHJJc2RmMXdlMk1YNjFZY1JsWDFaYlho?=
 =?utf-8?B?eDR3QUpwblVzaXdmd3VWNUEyY2xWRVpWV21BcmRoYU5GR1ZQMklEWW51aGwy?=
 =?utf-8?B?RzNsTi9nOEtWeEpsRCtoeHg1OEI4WENZdG0reHM5NVg5VitsTnVEeXBFakxV?=
 =?utf-8?B?WE9uWmp5cWxBOGxZei9NK09vc1c2a04wV1hxR0ViM1piQUpmbEp4M3FIdmdz?=
 =?utf-8?B?V0Q3VEwya24xZ2ptcHkvM2lTQXd1YklOZDczRTFWTGpNVzJ6aWUvNkJ2aCtx?=
 =?utf-8?B?OE5jcFowT2YyMFh5UFA0dHFvM3NiZm9XWFZGTzRDVDZqOURXOGFLQ3d0TjNt?=
 =?utf-8?B?NTNaSU4ra0d1VVA0OWc4bHhQY1JqbmJBRWN5MnArZUdobEo3NGE3SDlRSnNk?=
 =?utf-8?B?VlBZOHdGTzZxZ3VSRDVkUm95bnI0VFQ0aFZiNmFTRjUzY2FUYUtjUE0vcFVD?=
 =?utf-8?B?OG1KcTRnTWtqWFowY2lNQUNQb250NFk3bjU2Mm84dm9ZYW40dW84aGhvL3RL?=
 =?utf-8?B?cXlBRWdkN3BnVlpXYWV6YlFzcFdVVU1IKzJvTUJZb2plaTNocTVFZGE5SUxN?=
 =?utf-8?B?Uk5iWEpkT2V5eURWMTNBanZLY3ZJMVBrdkRqUllxTFJ0ajZrRVNCOWc1b2Nk?=
 =?utf-8?B?RFkzM25ob1BMNUJrcGYveGt5U2hoRHI2UFlJTDEyU1pBa1NUYXJDUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3239f33-2911-4dd8-1427-08de5abc3b95
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 20:16:03.5523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJtAX4NWM3Jh9DiyTkIOxPaVaOcqmA2CYZI+bSQn7U3DWBW+L6l0q20H3pm2iksRszDKVUHgbCNyOBe0HHv3bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8319

On 1/23/26 10:41 AM, Timur Tabi wrote:
> On Fri, 2026-01-23 at 18:14 +0000, Gary Guo wrote:
>>
>>> +/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument`
>>> +/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
>>> +/// to that size.
>>> +#[repr(C)]
>>> +pub(crate) struct GspArgumentsAligned {
>>
>> Hi Timir,
> 
> Timur
> 
>> This is not "aligned" to GSP_PAGE_SIZE, but rather just "padded" to
>> GSP_PAGE_SIZE, so calling it `GspArgumentsAligned` would be a misnomer.
>>
>> `GspArgumentsPadded`, perhaps?
> 
> Well, this is Alex's patch, so if he wants to rename it if/when he pulls it in, that's up to him. 
> This is already v8, I'm not keen on any more bike shedding.
> 

To respond to Gary's feedback (as opposed to when and how to apply it),
I'd classify this as "polishing", rather than using the pejorative
"bike shedding". Because polishing clearly makes something a little bit
better, and I think there is no argument that the "padded" name makes
things objectively better: more accurate name, not longer, all good.

As for the when and how: yes, it's true that we may defer some
improvements, and I agree that we could do that in this case.

And...let's try to avoid (perhaps inadvertently) discouraging our
reviewers; we are lucky to have them.


thanks,
-- 
John Hubbard

