Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B01013FEE;
	Mon,  1 Dec 2025 03:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764560104; cv=fail; b=rdqNirMiBgF9HFoUs0ONVuxMDLmd5eX4GkxJ5BFUNSpxsXzBkU7dI4VzxTEGIUnoU6a2exAMJ7ReMS4Bht0GX7cqTpDd66vPEWk5g5hnkd0Kj2bo8EUluo4f/M+zzlyscuDIfiTyuEuMH/5tCRGtMziXicXviXoRVXr0+6L+ams=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764560104; c=relaxed/simple;
	bh=YyLhcSDAL5EMX8DhVoxkIcFJrfNy24w4F5UGwJw9ERA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gerUvt0yC4z18aLhmSm9o6hQ2GbSdx96YxiLD9kw+2E/qtMDofWJGHzZvZBUBGMcQ20O+lDB+veZCHWJ4TwD8LD2q3hlGIDGMclEw6VphwJB6KvK0SupJ4M8Wufl0UNb96GAjK6Xf78PJqdjMAX7do2bc5cmuo0G8pVmAyOJL3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R+wXDEp1; arc=fail smtp.client-ip=40.93.198.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R+wXDEp1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkmDHvFVN7chT3CoBc9u+Rrjho7llCIxIZb5m9iNmLShsQ5QTzNAkTflwXfiYuucVpbeyUFCE5feORqUbXET9+YvuuaSv0ddAJiyBZ1hpLOcihRH7cHYQAftMgPnB2vXajx4GM5Vt5chXec0VD/7ojjADCu8oaFS4KMTZJYDpqeShDsT2OB0Q4ikGrVoSMXMhLKn7rGL+nTkEOpcjaAF6+a4pSTCHJApzEozuDfO1p1+E9IRkHWHKn3maENgSye62w2WNS93vqs8X4S7EFOAke2vpOzPKrMEhn6J0Z5DaQCYVoKucI3aXsS+Cg6YyIH3L5vv5f2q79ARO/ybsD+u0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSCX51NHxMp6zIF5Tv1CSXSE+MpnvrlT8qbt+MwPPIA=;
 b=DznMbRq06Qe26uSokKkh2ZxcTZJCeoJI40ULAKPYO+s+ijWsOaZBA/KEfw5ToDpSNTw9XD/hjRbUcQE1c4DtuhOKCvoFxXKIwpZOMRWKS/kv0Bl0ny3sTo6J6epoakTigjvHL1FAADDCAHN/6U3wsM3X+XNxlKV6i8IP003qasjbyIAvhIwaER/8h7TtgbbiHszfScavkZwRddpKTfEYCNOlqLQWgU4ZfZld7BK2vpjDktC54WqEgN0R3wljQW93HynnaqhR0mfc0IaKISO2Cs/2XE7nDYmke9KO0OYPJVWRa7o3et+EUuXzhIZgHB8tJSd4O7GhXt2Y0j2OoSOa7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSCX51NHxMp6zIF5Tv1CSXSE+MpnvrlT8qbt+MwPPIA=;
 b=R+wXDEp1rgvZGU2RMLwuIVW08p6OiCYtA1EduRVspA7tAfTJS4MzP0wE/pObPOR9S1Q2N2/9ixw0e9X7ACKcVaSGLZp2/AM55WKH7e6Ge5u35UtlEODz48SJokJR87CRKV4ppZHmdkgxAQqR29zqdht9XtApUyTfWnBt0lNq24dwRnYMAqn+eEiIlIZI7C+WAnrfo8AJjOdeune/nl8jL6IY0EBGEyFIaR7axCaWbI1IjV+pxXETRuNBPFc5IzB4cLe5RbvNoFEFgMwsNrpltMInLU9RImPA39Japq5BN4Lwis0DKCbJGvc9DqaDZKj7glEKtqjG7oGgLYanp9q0wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 03:35:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 03:35:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Dec 2025 12:34:56 +0900
Message-Id: <DEMKCLMSAUUX.1Y5ZKG3T3PC1K@nvidia.com>
Cc: <david.m.ertman@intel.com>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: auxiliary: use `pin_init::zeroed()` for  device
 ID
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Atharv Dubey" <atharvd440@gmail.com>, <gregkh@linuxfoundation.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251129124706.26263-1-atharvd440@gmail.com>
In-Reply-To: <20251129124706.26263-1-atharvd440@gmail.com>
X-ClientProxiedBy: TY4P286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: b24a37aa-b38f-4a4b-546f-08de308a9b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWtsWEJjNXMwR0o3NE5BajV6MkNIM2JneVhZNlV5ZmY4NE1wZXpmNXBGNFB4?=
 =?utf-8?B?cnJDbVVkNnRsd1RYeDBheHhSQ3dLMDR5a0FsOW5PY3V5dHpjd1pkenYzWjA1?=
 =?utf-8?B?MTBoZzk4Y0NyU1hMSUZNVzVod1NUZmlYUm1ZYmswQm14ZjVQbDBra1hUbVZo?=
 =?utf-8?B?VkRqdG5HSXBRd3hRTW5wbWJJTDNJN3V0cWhYbzFHdVVBN0VzaXkvUWFsZXhX?=
 =?utf-8?B?QlRMU2J0WXpuMTJlSzNCQnU3V0p5eXdIZ1dnRFRmSDk1UzQrM1dtb0ozYmlK?=
 =?utf-8?B?ODRuNGdxdDhNU2E1WTBYeTU1MWY0eTRBbmN0aVRkWnREejFvMjZqSEZldnNM?=
 =?utf-8?B?WDhzTko4V0pYNWlKMk1SSlFFSk9tSnRWd0M4UXQ3ZGV4aUE3d1VEV1pQc0hM?=
 =?utf-8?B?V0FwVlRQdjIyM0FHdmhSRW9NR1grK3VaNGk1NU1CaVV6dTJaRGFsajgrSkFT?=
 =?utf-8?B?UjVzRUlEZGIxbmZRbER1R2x5NWhCL0wwOGJSQ0wxcWFMcHUwaWVkMkQ1MUl5?=
 =?utf-8?B?emJFbzdwOWFYSTBvQ0I1MlV6SDM5ZVBCdlZPai9RejFoQTdzQlhXMEQ4VVl0?=
 =?utf-8?B?ZjhsN25FNDBpOWc5ZWN3VTVlZkVlTXBoeFQyVEN5aGE3T0lxR0x2VFEwbFhB?=
 =?utf-8?B?SGcyVExTdWJPWnZHS0krL3plLzJsdkVEQlhLamh5dnVBWDZPQzBUMVpKNzM1?=
 =?utf-8?B?WXRnQnZuMzZKaUJpQXlKMlpOR0ZUUWIzMzNHWDByQkJtcUllaTk2QjlZUk56?=
 =?utf-8?B?bkhwaWFjVVc1QWhhOFBGQmkwY1lHRXVUc2VnSjZQUi9wTGxGTVdJdzhMOERL?=
 =?utf-8?B?cFltcW43aEcvT3ZMNUJnaXNMMUwvOUJjNGJ6OGdjL0ZNSC9nb004eFF5OFpy?=
 =?utf-8?B?dWZiNm52dTA2elF0REpLWDRQaU9kTGJxbkh2VktGRElDQXBVZm5pTXpCUFIw?=
 =?utf-8?B?a3lScnFobGdqM2xjSUNMWmdlZVdkY0NsenhTMlZQQ3l2UWI1QVJaYzUyS0x0?=
 =?utf-8?B?dlNVc0V1bzUxKzFIY0xIV0xJWGlvTkxtRnpqM29SZkJrS1dRaUZ0alE3K1Az?=
 =?utf-8?B?aGoyblF2S05qL2FWL0dRS2hROWRReHRtYnF1c0pnZTV3TERkRmhZSVV1UHhU?=
 =?utf-8?B?ZGZVVFR6ZDVPU21iYWN4K2N5UWZrd1BHZlhLTFhPTU9hYVF1VE8vM1QwK05h?=
 =?utf-8?B?eEpmWjlVZ1dibTlpbXczRGl1N1BIOTZ5RW5WQUtpRmkxakozckVubEk5ekNN?=
 =?utf-8?B?T0ppeVFzOEFTNHR2NFBjZ2puRXFiZkMyZVlpdUs5RkpkTlI2SUJGNTlRSERs?=
 =?utf-8?B?RkdXSksydzdPY1N6NjdMSnQraWNaL3lnN3RZM3BEQlo5MVBsZ2J5V0JmdGhT?=
 =?utf-8?B?UTZNVEM5ejhCbWZsYUwvZWxhUWJqeWlVcHFabkJOUU4zbEFpY0R0czdDRkZZ?=
 =?utf-8?B?TzdCbS94Wi95a0gxd1VuVDRFTnhMczlqSkZCNkdPcWFYNVpkNmoybkswblNk?=
 =?utf-8?B?bzZGQVdiR3hHSnBka2p0VFhOMytuakVRc3BXNThVQWxCQlR1VEdLL3NpT2FH?=
 =?utf-8?B?dGRRVHZkZ3ZnbDRDVUdDRzJFN0xqRVJsV3B5ajgvQ3Z5eXNPWDBPRVJGeVRr?=
 =?utf-8?B?ZWpYMWJHcjdXZ2FmOXRwaGpOWUU4YTRWcUcremlKSGtBOW1jdm9yYnNCWXlr?=
 =?utf-8?B?WHMvYmgvbU03T1VSWTVnWTdKUEJKMUFINHVqblJzR08wbm9zM2Y3YjZZMFd6?=
 =?utf-8?B?aWpPeGswQzNaNzh5Mkw5SzgrT2NObWhJSUpWY3lTeC8rb3FBSkFvSkhLOTV4?=
 =?utf-8?B?aXBXbm9JbER2YzhuZGY2U3lnWThSS0VTOFVVVC9uc0lGaVZUOFhMSGFIMC9L?=
 =?utf-8?B?SkhGSjhYVFhKK2ZlNWNvZS9ZNy84Yzd0SWYrMHE0NWsraUJ0NDhMaXd4Q2M3?=
 =?utf-8?Q?xplzg9DHx96F9ylx3jdQFMUORNUmpal+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDVBTkxHWndleWE0cHQvKzYvQi83Wmg1a1NjMWxRaW91bFJXSzlZRDFPTFlh?=
 =?utf-8?B?L04yN3M3NjJ2RlBxK3kwOVlwQkJpSUYrSGM2eWllNGlBSWxvRGhVK2hxSlRI?=
 =?utf-8?B?dFR3ODc5SSs5WEpreC9iRmlFZnI1VXgvNmpaME5acTlKcjdHbVppUCswbHdN?=
 =?utf-8?B?MFVORjRCOHVYQW9mZXJINnpxTjFkaVBMQXJGb3R4ZkM2aFFZaE5zQ3NHaFdC?=
 =?utf-8?B?MlQ0WENiY2pjaWVSM2VISkVVT0xjeGh2YzAxMUM5eWFSYzN5MEV0MHVRMTNV?=
 =?utf-8?B?VTVPSDhMSzJobExBN2JpYTRTQ20rZ0FmWlBYemp3ZWN2L1lHaUdCSHF4S1Bm?=
 =?utf-8?B?ZVp0MzhadTBvWU0vOWFKSFVXOW53a3UxMjI0elhnblFrU25kcWZ3VnVsVm84?=
 =?utf-8?B?QTJYa1dIWVJJcGhwVFJiS3RYVHQwK0EwSW9jN1ZxeVVBdGtINklSOUt6b3pB?=
 =?utf-8?B?blV1THFIUEZIRWpIYk5YaDk1aUg3dHpWK0o4a0FhZS9wYXhJYklHQXVBbGFL?=
 =?utf-8?B?S0g0anM4blB2US96alU3THI3UjJsTU1rUHZhNmhKSmwwMk5QRjVMNk56RzQ5?=
 =?utf-8?B?b3MyL3liVDRWejI3ekxpSWUvdk9TVk1KVklYSlhnM1BGSFpmVXNCbzNKR0Zm?=
 =?utf-8?B?cis1R2JyQWMvS2JSVjV1SnVSUjdoakNTanJzUDVxdHJtbUI0MTZjcmV5Nm1E?=
 =?utf-8?B?MEorUVhTQmJ6TDExbzNEb0NpWFVSTXVNVzU0cE5GdnVLdzRubHVWQzdzSnB0?=
 =?utf-8?B?OUVXZHZYYWdDZFFMd2RqN3BhWmJzNWFJakdzQ1dXNDhkVElSMVQvNXhVSG1S?=
 =?utf-8?B?TGY2L1dkcEVWMGdYQ0JCQ2N5VktTWHdkeTk4UGk2K3hrZVRBc1hHRTBkaFI5?=
 =?utf-8?B?eW5IQ2tHaCtkK1VlVzlCYWtqS2lCa1l6T3lEcXo2MHBoUzlkWTZMZlpkYnpW?=
 =?utf-8?B?dWRUbUFpRmgwNlA4MVBOcTZyVHUyVkNUZkgvYmdLODZXblBwOHJLUVQ4U20v?=
 =?utf-8?B?M0RVanBWWG1nUFBGUEFxbFltdmV6Ly9BbExvcTR0MWJPSjV0UWxQTVhHNEU2?=
 =?utf-8?B?UVRXZGFoRVVwaThQS1ppanU4R1BKNmtZK1NiYVptdVpzb3pLTTI1WHNENVdZ?=
 =?utf-8?B?eXF3dkZrYWU4alh4QkM0S3BrRFdjcCtzKzFtSjE3MXJhR0RwVFRObzMvb1Zs?=
 =?utf-8?B?SDhHTlFTYXRRZ3prcjd3alpLT215K3BZbDJXVVlXdUhqTXQ0UlNIOGozVTNk?=
 =?utf-8?B?ZXdoTVJQVFpUb0ZPT3lsbmpSbHhUQm9MTHh2cUNUUFR5YUg1QzhyN1JndFNi?=
 =?utf-8?B?WHJEeU9WVDkvVFZtcUMrYVVONkF0UzBrWW5Lcmt4eHJranpVNUpkTUVhZEl4?=
 =?utf-8?B?UTFjWGF2cDVxdGoxaTZlQXpZUE5wanZPcUc0R1o3RTgvaVI0UVEvSW1nUmxO?=
 =?utf-8?B?dnhMYUFDQk1aQ0ZQRnA2T3BhQytPWDhaYUJYbjhmek1qVUVxL20xVy9FU0lk?=
 =?utf-8?B?MHpMZ0FnV2xnYmU0YUJZM1d6MVBRdlFMYlp1NEZQWUh1cHNXRnBKOEUxYytw?=
 =?utf-8?B?NjcxRVR1a3ZXSHhNUmVoei84YWVCSldseGZLTU5rMkIvNmtKS2Y0VlpnejJX?=
 =?utf-8?B?bThlVTJxaGRYVDl5MWE3STREU25za0o0RkFnL2JMMjV6em9meTByRVBlbjdz?=
 =?utf-8?B?NFZEVWRhdHlaaWFiblZVaGxMeW5rWkp4SC9ZSGxJVHF6VGE3TmRnU2VBd0tu?=
 =?utf-8?B?U1QwQU1haEI1b2xseFRJNTVuaVR2d3ptMlZzSnNROVZBZmsxWlNhTTgyVXZW?=
 =?utf-8?B?M2VncHpGU0kyOThJem90UGpGZy9oblV5TXpxcVJjZlVUaHp6czBpOWY4Mlh0?=
 =?utf-8?B?aUZXa0ZmNGNMcE52L3dBN2lmZThLVFFSRU5qOHQrNlZIMk1OWUZvbmtidG9X?=
 =?utf-8?B?eUNsMVRLdE9JdCtaZm9saGNuOTZ4VUlYczNodldtUHBsTFRFSS9tcTJJSml2?=
 =?utf-8?B?dTJ2Qzk4KzhKTGtESklIVEp4M0FLRStnQWw3NkdtM0EwS241RkVXUEVFaGJY?=
 =?utf-8?B?ZEREVWRGeU1zYUkzb0o1N2pXbnVFZkhJN1dGeUltTEVPbHFnRUMvQkNRb2Vz?=
 =?utf-8?B?K0VXN3I1ZTVuSk9CRkY4SmpEaWxCN2RPVVhWcE5TNk5obm9DaUZmMW5uYVdj?=
 =?utf-8?Q?ww98tqBK37mRU4OBMhOQOqqmCOcwlrDvJ8UvQg8mh2fx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24a37aa-b38f-4a4b-546f-08de308a9b0c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 03:35:00.0368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQxQjoWCsef6ojSmrdE2B2RFma6kbcz+YqkkDL19onVAJ6LXn0ipBt/J85EEjIKbKRPrDo/8Bx05Mp0aigb8SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085

On Sat Nov 29, 2025 at 9:47 PM JST, Atharv Dubey wrote:
> Replace the previous `unsafe { core::mem::zeroed() }` initialization
> for `bindings::auxillary_device_id` with `pin_init::zeroed()`. This remov=
es
> the explicit unsafe block and uses the safer pinned zero-initialization
> helper.
>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>  rust/kernel/auxiliary.rs | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> index 7a3b0b9c418e..67c5d356d754 100644
> --- a/rust/kernel/auxiliary.rs
> +++ b/rust/kernel/auxiliary.rs
> @@ -108,11 +108,7 @@ pub const fn new(modname: &'static CStr, name: &'sta=
tic CStr) -> Self {
>          let name =3D name.to_bytes_with_nul();
>          let modname =3D modname.to_bytes_with_nul();
> =20
> -        // TODO: Replace with `bindings::auxiliary_device_id::default()`=
 once stabilized for
> -        // `const`.

I'd still keep this `TODO`, a `Default` implementation is more adequate
that `Zeroable` here even if they end up doing the same.

Nitpicky: there are two spaces in `for  device` in the patch subject.
