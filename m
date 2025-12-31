Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B335D2FE58C
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767211110; cv=fail; b=Rhid0iXmhu1Bum5r3oAZE3zpy/Gb0so6Bf8qzCcu6LxSAd7dEpoY5ydMM+4SSUiVZYj4jvjXfl3R/Zr6rtxqhrMIrefd2sFYZlU4B/omlG5Kd/wEGzYNQ0v0wlFYT2C2sqjDs1gpJWGoIeMQsACGBn6mME8I1q6qAhIU+VY5D4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767211110; c=relaxed/simple;
	bh=RyQRTqdbDzeeXLQBOqsQgV2aow3bWLvD0aeixyDKD7U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=co+NUEmBBokEbmk973ydtf/D/K3bSBUbiiShMa67wBgRJCKdr/zbXu7mPpNBAs9cdV111HMdDrbV0POR6w+VaiQBeTu1UM4EPnxF+tswjyIjeaB4skEwb6XmWd6if3oWwSh35qn8S1eQ1fhDIGkQ1jK4K6RptZQEAKUQuKljTGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SQ5fF5bS; arc=fail smtp.client-ip=40.107.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SQ5fF5bS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kl99gO1Nhy4hv3mmBxlZCSAvkE9VqheS+knAuE9dkrIBc3wntw8qlq0OP8JLwPucJKVnA5MGgkNMtG9ElbnCHW5zPMFp+jdVbLXTSzyVl+TpHffgkLOxIGBR/YLsn7rQWQwY5yeKrenX3wFVNM+RICXRZROUeqt+D6RWZwdywUz+VkabOzEn3q3ffYWOcGbZQktP0uh7Jg09r/dzghz8MWdHbUSPjODtTlPVbUa+xqVnCdG3VRhs7fByAVYcH76PsR+4mXhpfg17YlfX9DZvMALnPN5qRylaSBFn7d0o0Ert6GcnYLra5KAge2SZcaCfWiHN/aVXgx/K5B+NRFsUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgC0ll5CuwNRfL13fPyMkqWB/XM9A+TqcDLinYiCDw4=;
 b=AJtkmyRWyn0S7Kh4kAXERlOQuEUhApZ7gT0syhp0d8ph7qu/kbPScT+dSgBUHkT/DAmp+IU3Q5tfKbCENUfsDtpTPe5TuwcLVhPXIY6K3Zxv6xTjDrYqb0zQWSBCRo7wzPoR+nN9ZKXIvYxhyrK3fucsGNWinlD8VcJQ6EreXzToXbUg4LWjccjXxj8sVase2MFsZ1ABGti8VVmxndMOU4Pd6Hm9V4S83kIIK883gOiD7WEPHZbOEH2YTItvS6MU1XWeGfPaLqr9Y98TkfR/ht2cPG8FKP9adAPbivFYEwowFlrLGKqGH437KooNjS2rmtvRiY4QQJ5AX8E2x5TBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgC0ll5CuwNRfL13fPyMkqWB/XM9A+TqcDLinYiCDw4=;
 b=SQ5fF5bS9ciRwJ+M/KU4mHZmqdgMsZscJwC+e09YvOpb4iN9+fJJEXoAF48MaX+j/u2ruud2z5Nvh8E1nYs2l6fO+1YyJNUl1/cMs9UpLABeG1m8ywUKFemUqWrBE1WO0rJr4iVhXPLdwRe/6NZZ5wfiFviDpHVDusael/uo4UiZkIw2MH94gNY0be4HjzdaV5qAl2gRXVUYyiSVCsKd5C3q/qppyfqwo33tlFXstZ2SGPrPDOOBiQQsACldKuUTxtNW6BoHhkPPw3GCe1CEoK0jrsWJhz69uZTlQIuDrMMnLf6iLeWfsWaPUeO7/35iWFo+jG5vtqTWOXdv2qSo1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB9034.namprd12.prod.outlook.com (2603:10b6:930:76::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.14; Wed, 31 Dec 2025 19:58:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 19:58:26 +0000
Message-ID: <ae5657df-bda3-408c-83ce-c6e915650886@nvidia.com>
Date: Wed, 31 Dec 2025 11:58:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-4-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-4-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: fcde701b-1e6c-4da5-f64e-08de48a6f5bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFhCZU1PYTdIZFVITFI5MmdXU2pkZVUrR3gvSGFxT20weHhDeWpJQjI5U3Fk?=
 =?utf-8?B?d256TnU1UnQzdVM1a2pyOFFtMGNWbXgwNko3RS9CRkxEMUFzU2ZxZnowMVlq?=
 =?utf-8?B?SUtqZjZibE16Sm4xUTlvYUJjTDMvOE1sbVZ3alcveTRXSjVONWh0Uzl0ZVpF?=
 =?utf-8?B?Sy9Rc05YVUpGZUxEVDJ2NWViUEoydTJPUm5pSTJPbWtVVDBMVGdzaVB6RzEz?=
 =?utf-8?B?Zm9QWkJUS2twQVNiTjBJV05JWTJXNWRWQ1YyVkttS0lYd3U3Si9DN0x6WnIy?=
 =?utf-8?B?N3Qwc01BekZNRW1SUEluZXpHK1p0NUVjajdvZVJqSkFmckozT040dFhQdFVy?=
 =?utf-8?B?L2l6Y0tpbVh5aDNraXdBT1BkYnRoMnBBanNaMWZzRFZmckdlWm5EeXFGbUd0?=
 =?utf-8?B?ajBHU0RRVldkbkxjYXNYT3dSdlU0KzMvdlZzT29vWDdtYWY1U2ZGNG02c1lJ?=
 =?utf-8?B?M1ZkdnJqanhlQ0NpQmlJZ2lwdGFLYzBkS1pON1lEOEVUblZEVk1oSUtEVlhG?=
 =?utf-8?B?NmQreVdMQnBFZXNnVlpKUTJSUUZkOTRWS3dPS0FSY05KQWlvNzdmaEt3N0dm?=
 =?utf-8?B?bEltZnVhTnJ1VDZLRkZyZStPK3l0dFU5d0lBemx0Wi9JZ2k0WnFHRDlWU1Vn?=
 =?utf-8?B?SitYTElDdkR3cjMwOUpYU1A5UE1aQktHTU9mNEh3ZWovUjBjaEtVQzlTVWZU?=
 =?utf-8?B?bjVVWGVtREdUNkk2VUFBVDcrMUVVN1JSK2M1WFZldVlSckxxWlRBajZvQzBp?=
 =?utf-8?B?RHFSUUZ1aXNiaS96L1dGckZDRVZ1ZEVVanJpNHB1UUNDdWI0TXRPVzg3YWt3?=
 =?utf-8?B?alRmZFNEWXdWWFNOUEJJSkRxNW42OXN1bW5VNUtqaEptZ2c3QkkwZk5pRy9T?=
 =?utf-8?B?Tk9vWFk0aGpYZitqdVNDdU5JTkx3UHNWSGV1Zm5DZTVPR2hjV0JwRm9lNlJ6?=
 =?utf-8?B?S2FnelhTY1IyUWVncHA1NTd2VUhFTERkRmUzY0Q1ZGhIQkhTR3E2Uy9QTGNp?=
 =?utf-8?B?RTVNa0hNdEVpRCtMbjBwMHIvUDNSa2c0VVF2dHZ2clF1Z0NPQWcydmlxenNN?=
 =?utf-8?B?cnkyL2xXWGNqaHRWNi92S3FKVk1QWUsxOW5WWFJ2MW1xNXAwYlNBeGFDbjFG?=
 =?utf-8?B?V1FBT3prVGNrV1pSVmd6VlRMdkpEY2ZkWHNuVUE0WGRuV3dUcXpkVGJVK0NK?=
 =?utf-8?B?di9SN2NxaURkejd1dGZFQndweHhFTlpQQzV2OTJ2OExnTXdOTG55dW01OW5a?=
 =?utf-8?B?cEt3dDMySjhHTDk3OUdaemxzTDd3dHhMWWdYenFuRC9RdGhiZXBQV1RrU2V6?=
 =?utf-8?B?Z282a3RYdmN0M0o1SnZMemc4QnRHbDhUbHM4aGl5dlBIS2xTdU44bzJKNEVj?=
 =?utf-8?B?MjEzWGh4Rnp1YzB4MHF2TXJicUcrcVM5djcrOGJFZXpTcEZLRkl1YVUxWGtv?=
 =?utf-8?B?OWQzdWhNWlc2dno5U1hTMHY1S2NVZXFGZlJhUFJWNlI4c3BaWWJSejZRYTBG?=
 =?utf-8?B?alNaZVVDVUhiS0RRZHRZbVVlREtYNDJGTnJXL01LazFmSWhoK0NIVHY1YnNM?=
 =?utf-8?B?cXhFdW5WVEwyTkc0QkpuWE5GZkhGSDluRlREb1NVVlMzL2RHektCeWhvZlQz?=
 =?utf-8?B?YktBaXdyQlFsdFFQSU9CeVVGa1FXWHhzR2s0ZkV1OUJzcFRjZ2NDaDBtUHFh?=
 =?utf-8?B?ZktlU0xwZHdHbUh4VncreWxHbktFcDZCUGpuOEVjR09tb0tnNTlaeWZhMXVW?=
 =?utf-8?B?YlZvZE1sZ0hyM1J5eVFYWW5USlhyTjdKUXpnN0ZOQ2NiUE8wMHdoOFhRN2hU?=
 =?utf-8?B?UnV4OXFSUUtMUDh0cXVxK1ovQ0hmUzVNOXpqZXlUYldXWnBpeTkrbll0Slo0?=
 =?utf-8?B?VXFnQnhNdG5wMFRBWEw1VHRhdThwT2VlY0cwcEFPRDgzekpHQytYcDRIbEZ6?=
 =?utf-8?Q?ntWkJD7MCWdASrAmoKg+dpOCw5pY9k/z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2h2VUUrS0cxSFZJV3JYbzRHTzl3ZXUwT1VGdncrOE5JSDBSZzVJTGExTnl5?=
 =?utf-8?B?ZE52eDhHYWRZNjdiOXlsSUdBMjZEaDBVTEJ5MWdpbDRObTVNVWNHY2dhcHRE?=
 =?utf-8?B?OStGaUM3L09xc0JseHhMMGpJaXA5dVZrbTl4NWRxVk9wM1pXUkpVaDBKd2hK?=
 =?utf-8?B?d0ViS1FSYXA4cVdRc092OCtYdkl6c2hBOWIyUWp6cktyNjhTNzZTb3ljVHQ5?=
 =?utf-8?B?c3VwL1hldU1Uak0za3pzKzQwT2s5c3VhRzJrc3ZDdnBIcEV3djhrK05vVGlz?=
 =?utf-8?B?TEpwemNCb2dQTUN2UGdWbit3dEtMVkRMRWU0bGtzU2hHejJyWEZ2WTVNRzFR?=
 =?utf-8?B?aGFyUm5XeER3TzArWCtOQlM3Z0k2UHIydVhsNE0rdHBsTVA3RUNER2FaZVFV?=
 =?utf-8?B?MUxPWHRUOGdyakFMSVBoZ0dZTUxuQk9PM2Q1bDdmRnJCNTB3ZlB0Tk00M2ho?=
 =?utf-8?B?eU55ZXREOTBvTlA5K0NuNEswYjFicGJvdXIxMVZkMGtVWkgyMDJnTVBaN2sv?=
 =?utf-8?B?aTVFZ0hyL2l6S3gvMUdZcWQ1YXFTQ2NwMlZiMW9ZVXg0RXU0bUdkVFdRK2pI?=
 =?utf-8?B?a2RmeGpEd1ZmdDVQWFRkd0pvR25LbDhCMitmVDgxRURhTXFoK2JWdFNXekZP?=
 =?utf-8?B?cHc5U3NtL3kzUkkwdithcFZOSjFDSVZrN2N0bFVYb2w1ZU8vVnhvOUVWczFq?=
 =?utf-8?B?V2lGeW82Ynk1bW15U2gwOG5QcTY2NkxLVTRrTWF2b1o0NUIrZnYzdEpvbCtx?=
 =?utf-8?B?a3YrRzIrQm15SXhUQXlUNWJKclp5cU1VZ2l4SnBCQURRTHFpREE1cVNvdVU3?=
 =?utf-8?B?OHVvWlpOaHJHRmF2SlZndHFTMUZnZ0dBc1A1c2gxQ2xBbUR4MXpEK0pWWHJ3?=
 =?utf-8?B?OGVneFpES1R1djFYa2VMS0VuMHZaa25LbCtKbXNPdEpkTVd1anp4V1pDLzNh?=
 =?utf-8?B?c1lDMmZyczdCQnppamo3YTBvZmR0ajdvYXVlOWNuaXZJdzF1cGN0cEM0NnUw?=
 =?utf-8?B?TXhKVTFQMDAyd0JjTjZhdGN6akhadTBkamhOYXFYazVYbk1zRS84Vk53cDNa?=
 =?utf-8?B?Nm5DeUp2cWhzYjVTejltR2d3bzBVVzY0U29VcnR4eGx0SXFDTElMemlUL0lB?=
 =?utf-8?B?QXMvM2plSGc2MzZPTG5iL1dma09DeCtCZEZzWGlLTFplUG1PWG9wNU1pSnor?=
 =?utf-8?B?bFgwbmhIT3U2ellsSXpweXZhcWl0QVlwQWc4SDVHSkROWGU1d3ZuQ0duOE5k?=
 =?utf-8?B?TjRoUFRDUzlDcUhYc0h0NjlhMVg2VjI2RjJxbXRuTzc1RFVhbnNDVXZxTUF2?=
 =?utf-8?B?bnZWZXhEV3ArVTcxR2YzYk8wbUFMSXVKemxFREEzdUlON2JFNWtzVkJmQkJR?=
 =?utf-8?B?M1JVcmdRUVU3QzBzNGJTeUxnZjEySFdvWEFIbjVDSFJPRDRSNk03a2xQMEdR?=
 =?utf-8?B?a1BMZWh3UnhsdGxHMkRFUStpalJzUmlVcjRuTTRqTU1tckZ1bURsa3MweVh3?=
 =?utf-8?B?b2Z3aG5TRTczTkkzd1YxVUJ2dnp6eHp6RUIxTUtVeGNBaG9mRzBVT2NVWFho?=
 =?utf-8?B?OWtwc0NFN1NJUXFUWlZVWXIrSkduTUU5OUVJWDVrTWE0Y0F3S1luQ3ZITjFk?=
 =?utf-8?B?Y1dyVHVUaVRqaDZyTE9KRmQwRWV5M01SaTdEMlhHR1YzMHovTHoxR1VGQlNS?=
 =?utf-8?B?ZlJKWm9taWJFR2lCdkxTOGhYdUc4UlJ0SVNMU0FaN3NMRzVFSzRlL0FHWThE?=
 =?utf-8?B?dkhxK0ZWRzVhWTUxRkRWYWZlVGJHbE8zUWx5WVI4V2MxQlBCcVcxMVJkdVBB?=
 =?utf-8?B?RXpJTElLUEhaeGVBNHg4V09LVzR4TTdOOStHb3E4eXZhaUR4NXVzK1FSNUc4?=
 =?utf-8?B?VHlmR3o3M3hBWTJJeHJhY2pzY1krSUIrYTE4Tk9ickw1amVSSkRoMnlvbXNS?=
 =?utf-8?B?RHN6Z0Z5Y3gwZUZldWdabEJ4Z1FHRWc0NWVNN2RWUmRRbklUem96TGUyQVhx?=
 =?utf-8?B?bFJJSERhSlZzdTFIQVhHZGUzaE51bGZrTFdLcXZRYWlVMlpNbXl0M3RlcEkv?=
 =?utf-8?B?OGxjMzhnU1pmL0JpS09nQVRVMU00dDhuSWdCMys4QU0vdTFTclBQQXA0T3Bx?=
 =?utf-8?B?MXU1QTVuRUIrTlppa1Z2ejRPYzVZbUtmWVBFYnF1eDQzVythVkJqMWEwaldy?=
 =?utf-8?B?ZENEM3hOSC9TVU9UWDJXREVnU25MU0paTkhDSWpvNFJmTFFQZW9kMVErbVdK?=
 =?utf-8?B?V3pqbm9oOExScldYdkhySVU4ZHd1VTBoWTVkVGVNODdkbHdUMkNlaGhRWStN?=
 =?utf-8?B?ck5JamQwU252UHVtWTdjNE9LaFh0aGoyVEZCd2dLdHpOeDQ2VHlHQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcde701b-1e6c-4da5-f64e-08de48a6f5bd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 19:58:25.9322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyaHByYlJCZXbFeDuTnjUFVgA5PyJ53adFgR7y7L2LTxrDrgTFwEHjJowcxGiR5JuIAsQ2PK8wFb7IyqNVs4nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9034

On 12/17/25 7:29 PM, Timur Tabi wrote:
> The Turing/GA100 version of Booter is slightly different from the
> GA102+ version.  The headers are the same, but different fields of
> the headers are used to identify the IMEM section.  In addition,
> there is an NMEM section on Turing/GA100.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/booter.rs | 28 ++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
> index 1b98bb47424c..86556cee8e67 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -356,14 +356,30 @@ pub(crate) fn new(
>              }
>          };
>  
> +        // There are two versions of Booter, one for Turing/GA100, and another for
> +        // GA102+.  The extraction of the IMEM sections differs between the two
> +        // versions.  Unfortunately, the file names are the same, and the headers
> +        // don't indicate the versions.  The only way to differentiate is by the Chipset.

Very helpful comment, I would not have figured that out without it.

> +        let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
> +            (
> +                app0.offset,
> +                Some(FalconLoadTarget {
> +                    src_start: 0,
> +                    dst_start: load_hdr.os_code_offset,
> +                    len: load_hdr.os_code_size,
> +                }),
> +            )
> +        } else {
> +            (0, None)
> +        };
> +
>          Ok(Self {
>              imem_sec_load_target: FalconLoadTarget {
>                  src_start: app0.offset,
> -                dst_start: 0,
> +                dst_start: imem_sec_dst_start,
>                  len: app0.len,
>              },
> -            // Exists only in the booter image for Turing and GA100
> -            imem_ns_load_target: None,
> +            imem_ns_load_target,
>              dmem_load_target: FalconLoadTarget {
>                  src_start: load_hdr.os_data_offset,
>                  dst_start: 0,
> @@ -393,7 +409,11 @@ fn brom_params(&self) -> FalconBromParams {
>      }
>  
>      fn boot_addr(&self) -> u32 {
> -        self.imem_sec_load_target.src_start
> +        if let Some(ns_target) = &self.imem_ns_load_target {
> +            ns_target.dst_start
> +        } else {
> +            self.imem_sec_load_target.src_start
> +        }
>      }
>  }
>  

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

