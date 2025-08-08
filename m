Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4765318DB2A
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 03:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754625249; cv=fail; b=uiAuoR0/bEEN4VOU3lXvFw88CcYgSaG0qgl1I4FpeNbgTUFB5PtCJaDIaIZQ1+aqKjESSqGC2cz3Ga4Em/3aMedcfhTovD6KMqy09vM2joths465ENNVO4i4Pn7ancCiGuXn9TYor6E5eh+8o2kuC75MwpYXh6JBejZ+pzGYxbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754625249; c=relaxed/simple;
	bh=r7HCHWyIpZArCY6j1YF2Ndl+pbfSghv6s/n19NsR9Iw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=I8BhbrwDCn80PcmhFAMPXEnO0upD7XCi2T+tfaoFZKvrSja4b0g+5TgcWHqUjN0LQl0QzE0DVciAo7O4vutlmB3zeraxCz9nsEfkDEH4U2mtO81v/rziFk/RdKMFJuEiFC6+fXAAU/6bDZf1JPhbHYEl8x93erH7AD2llCXXrGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f0VlambO; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f0VlambO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTeS/xnkxnLtdkgFNesFR3SkA37jxX6sncDfzFh13nDQAlcgCFZyXhcCvGpLWGt7OwBRnyKUyMvXlKebpgaLIf/Es0ulKYPBrgZZumrCA5AMADrG6HoI02xJzN0Se2GuPRQS8zxowtvE2wSgnnENMuJL5jafvkGYWS1rzSQ2asy+ZPdNzrP3nt2cZdBXAGOWpUQLoQ7QtN6L17Y6x/Fv32ugmA4YBKw8qIUZJ3P09iu/XEfp4DsSCR7LnDDjyiVf3s0vxb7AlybCqPjlgMuS1Zk79bZKlD/oUT0/6AMoFHTPFtvUay18ZODUI20VKdd+/NrTXi5g7NkKzHQGRQNkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7HCHWyIpZArCY6j1YF2Ndl+pbfSghv6s/n19NsR9Iw=;
 b=R5VqajVg8HCzpnF1KaA4rq1sWf4UcCJhb4COWHUx8OgCIA5kpMGYNRuIYMIM4bQ5BP2OUG2QA9IQRCqyTEJK1OzmWAghcLYiXCwr9xRfa3bSneJ80gH0fUBNnD267QgeI09w1xPgRp/Aos/0LUPl8A9FwPlOx4mCuDl4ZMtEA5jYzopJ/flBvyz51xSz1eu3EYheF/yzBCJhjs45pgxJHEDVD2f2IXGfNTq33e58eb2ky2iwh7jfSraI8xJY1+TGkTl7ziq7HB3289bnMJl1Vq6XxdtxkBW4XL9bQDRcQtzCjyqWoUHya2/fSqxQZlfn1O6gJW3u1T4ScrTtF29EvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7HCHWyIpZArCY6j1YF2Ndl+pbfSghv6s/n19NsR9Iw=;
 b=f0VlambO7FppARvWHZgSX067nPlHxbjp3VQldW4FyDepz9/WGVMhP1fYLVfYlwYy2cMnhCiMwmFf9C2AHMgILNiyZOLm8wXaRpK33HjyWQu7Oz3TF2TJCf+0HhXG/fIzQY8RfX49iL+/yYetkODR81wNnsx1OpkJCH4aZ3xnMMUgL3gCX3QqFXP3oxr0FZl2bb0G8IPuQiKEPmGB/tbEO9oMO+7ulJ3zN048+/xyRWcKG4NrLBMtS11eDBox9St5g2uzTSVDsKPLDwRzxDeaiDgZPOnqUsEiZJ3xRO/t2EGLcEBR329ibkDZR6lkNHAedJLp7DxKk1Wy5mlFaeCLjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8267.namprd12.prod.outlook.com (2603:10b6:930:7c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 03:54:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 03:54:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 12:54:01 +0900
Message-Id: <DBWQQJZ5RXVG.KXLVV08KAVYK@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] rust: alloc: kvec: implement PageOwner for VVec
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-7-dakr@kernel.org>
In-Reply-To: <20250806205044.85085-7-dakr@kernel.org>
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: e057ce7f-2429-46a0-46ac-08ddd62f37ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yis2Q1d6Y0hHQjIxUEFmZVN4ZzgvdzRTelY4NC94NkRvWXBMZTFZNk42Mys3?=
 =?utf-8?B?ZGVmT3VISnpvRVE4VkJadnhvaXVsTk5KYlJQTUx3ZnFkdXpOaWRMVHhhYTlz?=
 =?utf-8?B?K3N0MllieW03bU9ybkNNQ3BvVitKM2pWWndqTzdXL3ZQRGQyOHRTMnUzakl6?=
 =?utf-8?B?eDZpaENXL1hRRDR5VUJpaks0citQOTFsTm4xWGlXSzN4dktKZWNJVkRtODN2?=
 =?utf-8?B?NVVOZkZhN2xNeWhYcDc0UDNtN2pVZ2R3TFRNeGU1enVndGdNNzFFMnV4WkFR?=
 =?utf-8?B?MWlTZC95T0x6NXV5aThwZElJeW9xSHNnVzhBci9sZVJBSnR2aVNCSTkxQVVl?=
 =?utf-8?B?SmIrM01CTjNGcElDUlNjM0x2OEdTbWQ5UzB4RVZsODhEczZiRFhKbS9XV01u?=
 =?utf-8?B?WXJ6eFZ6YUJnbWRxL09mdTlFSXpldVFUbjdXdU1sb21tNGw3NEdrSlJKUnF5?=
 =?utf-8?B?QnBtM2hFV2hTcHpNeHpmSTIwbFJnUXU3OUFQeElpcUNkRkZFUlhoSVA3S3oy?=
 =?utf-8?B?M0tEdSsxbHViSDQ4VnVqRURSRDl2Qm9TbmxuakkzTThiNnFwMDRlc2tpZFY4?=
 =?utf-8?B?Q2NqeFJBTUFuTnRtVUlvZFlsTVFwVGovRy96Z1V6dG9mdC9YWjlRVmQxMm5O?=
 =?utf-8?B?Vmw4Ujg0bU8yZ2pieTQwSTR2ZUMyZUIxRFN4Z0ZVRVU5TC9ESVpIcGZMMjVH?=
 =?utf-8?B?QVR2L3lXVC9ERjhNNHFyNzFsazF0WnFBU2p6dnlUczBQM3dEaEpiaDZzUGlL?=
 =?utf-8?B?K29hNzM1Ukxudm40SnJjTHRXTjF4UFZOL2d1ekdaekVaSjY1TGI0MzlLOUZW?=
 =?utf-8?B?OVAyZ0xQdE9GckxVZWtaZUQ3NGY5MmxiSmV6K1JQQUFMdXJra3NwN1cwSmpi?=
 =?utf-8?B?N2Y2a0ZUSzhoQkV6YzdwMWVRNmNwUlZLSE1rN3VJYlBHSDcxUmVWbDY4dURU?=
 =?utf-8?B?R3plcUhVdFFDZzNhS3h1eWhkV3NFY05CLzBjQ205aU9rVVBoYzVaRk1JVVFU?=
 =?utf-8?B?K3lzS2FLc1FMZW5OekxjMVRSNWs2dXlGYkd3bjZweUpwTkFsd1NLdWUzR0py?=
 =?utf-8?B?S1RsbWpzVG5YTUt6d2xZNkJPQXhxUllFU3JhbEtZZkNOMW5vOEdMOTluMjN1?=
 =?utf-8?B?M3Uzak9EMG45d2ZHRk9rcVQ4a2plaVVuVFVacm0zVy9adlZZVVVUQURVNE1a?=
 =?utf-8?B?ZGJwN2FqbUN2MkRhMnJQdldtc0dDS0d0N0E2T1lpa0tpQWQyY2ZYS0lwRVpQ?=
 =?utf-8?B?d3c1VnJoQ2t2TFBsTkxwOEREVWNFWVZ5NFFtT2hFZmVOdENOWEVaOXg1SlBS?=
 =?utf-8?B?blk0UmQ1NTQ5WlNMTm4xVzhOemQ2YmpXWm5ycFlYcHovR045MFNoMjJZOTNB?=
 =?utf-8?B?YU8vS3lvUUtPcmdTTGxYcUlFeWZnYk0wbkF2cHAyRy9RT0tqVkxNOHNRN1Qr?=
 =?utf-8?B?WVFMTGpyV0cvNG5rU3U0MzM0L3ZseTRtY2Z2UUF6SE1OdFNXbDBGL2daeWR0?=
 =?utf-8?B?NGZiWXl4MDBNaGErZFhXYUpuZnFkbmFUTGxXSUgydFVKcENmYldXV0JMaFVx?=
 =?utf-8?B?LzJVaEZmbWJGRHhjT3V1VDVHdXVoa2JVdmhwY1ViMXVLQXcybkhKcHhzWlQ2?=
 =?utf-8?B?TW5vNWlvT2VJZC9hbzhubkZiS1lUMVo2OCtSUCtwRU9uUUJkWHdiNTNmVlFp?=
 =?utf-8?B?MGVBdFI2NGg1ZjV3RUlJaFpCNDFRS1Q4cHN6VUVOYU5RYkZEWmFhMXBzRWNJ?=
 =?utf-8?B?b3UxVlFHNzhpY3F5NVNFRG5LdURjTU0vcU9XbHR4bThVWHdDc3JKRXRTOXNL?=
 =?utf-8?B?M29QazBkVkpBeUNJMzFVaW5jYVlHVGtkWGlEOG1mYnFMMGZDbm5uRUlhVmxi?=
 =?utf-8?B?bTlFWGkza1pPRUI4bDhESlVnMjYzeUlkTWpLN1FleEZyUGpCQ1dBcERrWjlP?=
 =?utf-8?B?SUtJRWM0VnhDdTh1TlVNbDMrQ2xjLzRxajRhQlF0UGRDUC9iUUlYOGNvWGFu?=
 =?utf-8?B?TjhkYnJCSFlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU1UVDFhR0F2YnQ0UzhZSGJaNElGdW9HMUt6cDhaRTFMOUxlRnVDb2tpUW4x?=
 =?utf-8?B?L0tPVEt0UXRmdHIzajgvOThxU1ExQVpKU1BoamhBdnJEWnlJZHQ5ZDFDM1Zn?=
 =?utf-8?B?TGRaQ0FScnBDRGdlS1g1czlxWjJVQXZlUllOTmVlY1JOM201Y2JVWVpXcHpF?=
 =?utf-8?B?eW4wRjVmYitJaFl5RHZFMHhoUVlESDJsZ2xWVW9jTTEzczVGTTJDWEdhQ0Ns?=
 =?utf-8?B?MVB4QVQvekZkZzhLOXVSaVZ2M28reVJmeGFSVkZTMlluUWVSdnQ4Vk9GNy9Y?=
 =?utf-8?B?bWtmeGVha3VOT0E0RitIUnBRVVRvb2dVK3pkNTZLOXhxU1FSNElNd1NMaUZT?=
 =?utf-8?B?VWsvV2ExQ1duS1NRZzFCRjN5Sk5nS2diN25Vd2JsOXJibzlyUmZ2b3RVTTAx?=
 =?utf-8?B?UVNyNUsrSWxTT09LSXRYU3lWM1hMcU5wM1kvTnowSUd3SFR2Vm1nVlBlNzdR?=
 =?utf-8?B?TDV4R3Q3a2RYdlN4MEgzMlBNQURzdXVTRXVEWE01ZlFMWU02eHhRRHlDc3Zy?=
 =?utf-8?B?eURSTFE3L2ErOUQ4ekdvdTR4Qlg1OWp1WlAzMUdrcFowbGZHVWYzcDJCcElR?=
 =?utf-8?B?YzRTVGtTR0NXMU16UUtGSlIvck9ycE56SjJKR2Q0Njdta0tuMHJ3QmlYM0d1?=
 =?utf-8?B?ZFZXTUN4aDYxSkh1dUV5MTlCeVhzdEtoc0dsZGlwYnZPNmZ1YkZzTEV1RlMv?=
 =?utf-8?B?SUN5WlQrSmF6VnpVbW43eVZ6b0VHNWg1L0FlWi90Skh0VDFIZGU3YmxYbUoy?=
 =?utf-8?B?M2NWd1lRLy90U25LSFFNY3piWDFoL1N3QVVoNGovbnR1K010ZkY3TDM5SEl0?=
 =?utf-8?B?YnBwa3lhNjhtRGppNmZIUlZHTy85dkJLOC9OSlNXbTU0Sm94aXRxaUkxV3RL?=
 =?utf-8?B?TjJodnArY1M4OUJYM2R5OXZjeGNLeUdES2I4KzhRdDR3eHh5M0Ira1F5czk5?=
 =?utf-8?B?V1NLRUI3QWZMWFNQQlVmbTJmeFo0MUxER0d0NEkwUzJDTkM5bm84UmNWT3hs?=
 =?utf-8?B?bWgvcE5NOVZOK0N3eTFrNGZoOVNweEZjWTVTN291T0hURUNJaUw3VGliUHV2?=
 =?utf-8?B?STZvbkhQNDQrTi9VbmJOeXJENjJ5TnFxaWUwZ09yMk44eXFIWkpzdkVlTHdk?=
 =?utf-8?B?b1lVdUdKV3g3RnBjRXRuWEoxcE5lVlhsZ014YkFwaSt1QmJHTTR5L1JnTVlv?=
 =?utf-8?B?cmM1eGVDckdGTkRnS1ljeW9NZjRBV09HdHQrZE5tNGhWTGJWVlBmWjVzRmxI?=
 =?utf-8?B?eEFkT3ZRYk1VYTE4Umk5Q0VvMGRiVk9mb3RpQ1psYXBnZ3huVWhUV1lxSFQ3?=
 =?utf-8?B?YUtYV2UyVC9WOVFmQ0NqZkQ3SnEza2U5V2JWV3ZYL29NNVNiMjFBSEx1NVNK?=
 =?utf-8?B?VldEY2ExRUFwVFZHNFZGRWtmZ3pSSVg5YmRGMUdKTzczOGRjOHQzYUJRbzRW?=
 =?utf-8?B?cnJpamhoeTRINWdSRVRPTDJwQUlLL3pjaGtIMVNMeXpHK21MWWh0Z2JEcHU4?=
 =?utf-8?B?RHhLQTNiMjZ1WmVPRWNSYjZvb0VNWkN0WnhISTZ1SWE5NnBrMndhMXIvQ0tL?=
 =?utf-8?B?V1AybzVSM09sa1ZUbE56bUZDelFwVnErYWRVZWlRNmdWcnVZeUNGOC9aSGEz?=
 =?utf-8?B?TmhHR3lIellSeGRyNmtIdEMzWElRaG1Ea2ExanY4bjhob28yeTRTczNtT1Ax?=
 =?utf-8?B?Z0hRZVRFYjd3ZTFDSnRkcDRCSVdMZXU2c2prZnVpOEk0YU51ZFBnRDVZN1RQ?=
 =?utf-8?B?NDFadW5KNlBwRU54ejBYTWlZYWZiMWZYaFo4cGtKTDh0Z3QzdWVjNzlrQitz?=
 =?utf-8?B?bkdENWVHYS9GMG5CNlA3OTRBMlI3OERCYXFLam1wOHBKK0FVYzZNdktrcUNq?=
 =?utf-8?B?ZVBuU0NBOFh6ekpha1JoU2s2bW8xSFFSNVVKYnVTMHF5K0F2TkNsTkRDTDd6?=
 =?utf-8?B?M1pHcUg2MHNvWVI5YTNLTUZZb0MwSjZER0FiQm1wN3BFN2NUclByTEdlQlJn?=
 =?utf-8?B?MDBqR0srbUxJNng5a2hQYzI1RFMvSGFyYmo3bzlpOTdpblIxUHVEODJaSHF2?=
 =?utf-8?B?T3gySTNVMzROa2xYNjRkYWZ3elg5RVYwWXkvVE85eTROS3poZWdyanRxdXVR?=
 =?utf-8?B?cE5scWptTWRnSVMvM2ZtQ0tPZFlwS3BwQXdwZlU3NE8wVk9BK0RmNmllVHFr?=
 =?utf-8?Q?8yjq/HtHxkCyBghBx+MM33d8lUuyaFRtrfJoIV6sCxQ2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e057ce7f-2429-46a0-46ac-08ddd62f37ed
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 03:54:04.7819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6f2r3zhBnfLXgLHR/qAPtiYvd2KM906p36Td0yHbvfhSX7I8DhAqB+7oRgNKB6RW+4smtblbK3zrX7otPgkyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8267

On Thu Aug 7, 2025 at 5:50 AM JST, Danilo Krummrich wrote:
> Implement the PageOwner trait for VVec; it allows to iterate and borrow
> the backing pages of a VVec. This, for instance, is useful in combination
> with VBox backing a scatterlist.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

