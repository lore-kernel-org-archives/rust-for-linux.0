Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C143EBF02
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 23:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209352; cv=fail; b=taerXcH5iEiuKfCp6mwWC0IqMAce4rsO2xaMWx1u5KNSrl9s+49UGSW201d1Vy8lugml4dkWsgGjeic95QbPP/EqPDzPICv5/R3M4EEQVNKHzt+IhjOx6cE+LSIHiVmb4pzOxkxd4evZOHN9KRt443fVzMXxxSyaqrQ8PzJXc7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209352; c=relaxed/simple;
	bh=vvkFHTwFsEfeOp71MnvZ+ZH6tjrDd6EOv7Io5pHcTtg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SepZLK1pRFJBMoVF8gljgWDLpDpTLGttSGi9G0kBTHcqbrXwkSN+l76r8s7XZ+I8tcEmuH5/4tlOviGKoj4TYGd7OmrtzTQ1zvUCDb9b57lkYtUp608LfI/hce5wvTWL0faXPDaR3kr5L6PDNu5DwBJj6BB02XybFuFLT4H/45c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iFnXMg61; arc=fail smtp.client-ip=40.107.208.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iFnXMg61"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ky7I5WjnUV58tAJhbnTQK/6CCy723uaTfmadn+ARM8xUUuXWlqP/flfGlqqF8RnnDuZ2RulAxtPBe4zeC2GCNl5J+w4YkQwt1KR8XbXw0KplIPmbm4DJjb4u44kwUJ5DFF5sFWeJTN6E+uNMh2nGuAPHfOGZudfhEJwNbTC6zbx2MdbwJgnoj0LCZAdZnC3wyy8JTRN2WdeJiPkIyqiDup+JX49yFuRy/6EDvBhUsB1wqoP1aWMwvzT8qIlOcuA4qeZnfD1O2YYY89pck7Sp0mJ2+/sQSu25oTK3r5u8cTwsj2yakKuUo+FFq25wQOaXMwMXyj1FsddlhgJU+hah3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ID5jg6F6+U325J5/nTAzVOGxpZxFs4gN7lAzP2G9hwM=;
 b=M8QN22nS5eu8tz4VzQ7IG3lieMIsK9KpHqdDGHNsRwbmET6mw1weGUEJdP+LRe7wpioQZEtcvnIrMcUpMrZi4RkUur6hSFa2cmUgmfwbc6kQh74RgaB/ktkxK43rMqqYY837EY3gNA8J/cdVaP2lOJE1xf2eIFGFB8qR/NuZA2fnnFbcHpqF00Ju4u+otmP4FGswBCic4aFQwm31yWDeHbC6D/novSesH6m2/7sqEu/UE/LAn4/00xiIaAr+LV39lTaSyrtgkwqIh674p3UV+aF5qcwrNx7F/tiR1PqcCDmk3tS2wcBiyFcd5z8dC56hUTvwNPqrj2b4gk0yhfvhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID5jg6F6+U325J5/nTAzVOGxpZxFs4gN7lAzP2G9hwM=;
 b=iFnXMg61toPG8mdBLLHMaU3R/ofLM3EblkAcgC6hrVWNr4FuuUTcPIbnpqBIwP5Q4PQ1TqrvRuXx4H1/ZrvbehMcDoEAMhKt+VQnFn8VpF/Lcfav12UWISep9rdmYuQAPxGb0Z0GjI8yO9XJqpUlsFM9y51hESQV7yzMFD01YEu0ipWyxBJb9ODmDqdId6Gg+ivFlD3B/2ydd0HLl85KNylPpHRlU+eAcLinrg15w+VwRRtbQdUl3uuvYqU3XXwxwcm3typ2MjYenUYVMRSnSlduH9zRRth27vC7az2BirBXb7SO7FHiGf2g6ZZf6628qZNZ7z3FUV8akLA/1aVe2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPFEB07C8E34.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 23:02:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 23:02:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 08:02:24 +0900
Message-Id: <DFWCDCK7DYN0.2VQJ6GJM22Y9I@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v8 02/13] gpu: nova-core: add ImemNonSecure section
 infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <20260122222848.2555890-3-ttabi@nvidia.com>
 <DFW63WY91QTU.1EL0WDLU4Y5RO@garyguo.net>
In-Reply-To: <DFW63WY91QTU.1EL0WDLU4Y5RO@garyguo.net>
X-ClientProxiedBy: TYCP286CA0206.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPFEB07C8E34:EE_
X-MS-Office365-Filtering-Correlation-Id: d0056726-e84e-45be-0f7b-08de5ad37aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVNwWjV4aktkalZHK3hIcUd0djNjSHZRS3NtM3VwdmxNenF4azdUSXFMd255?=
 =?utf-8?B?bEdmeGhHZzM4YWlqWG1LOTRsblU5QmdKanhUTFhPRW53b3RKRmhNZ0NKYmFP?=
 =?utf-8?B?TERKV3NhWVZ6VmJjSHVxejlMaTR1Um9rWWc4Q0dQUWVVbktURlM3dk5tUlhB?=
 =?utf-8?B?QWRYeE1QTFZJN2JaNzFXMDY5TkxDSjRsOGJVbDVNTWVWTWI2UnBqLytlNUMy?=
 =?utf-8?B?NVJuZ0RPRElnNUc4dkN3Nk9ndEpla0V5Tk1GemhSVmhaMDNLcW5vamQ4bnJE?=
 =?utf-8?B?SVB0bDhnUXROZjY3ZWhGK051emdWSVRNa1Y2djFZOEdGcXYvMVVTMWhHS0M0?=
 =?utf-8?B?OG4vck5teGNNWFY4T1kyL09EeVdKb0NSby9JU09YNDEyWUR3K0JUbmJXVFVR?=
 =?utf-8?B?bTBLTFlYVGtlS2F1eUhidmJIR0NBc1YwNy9rZ3dQMklnL3RxNmlBZGEwcXpp?=
 =?utf-8?B?YTlES3NTYzlJVHhuQXcxajQzMVJsZGNLTld2TVJiSm1qN3ZBODR1VVJtbmJ3?=
 =?utf-8?B?dzBxYnV1cTVwRC91RnBTOUlKUU9GeUVmOURkMGZKdUxNMldsejVJTkJaekRs?=
 =?utf-8?B?dCtrVjhxdE05Wk4xdUx5c0J5QXJLTnZUcEM5VjZQQlZDdlJJSzE2QkxQRTE3?=
 =?utf-8?B?c2xyV1R1Wm9teW9DZ2xod3BKYVpqRFo5K1ZyUlV6aEZTS0xnY2hqVk10UGVh?=
 =?utf-8?B?bnFZdmdyQ1RFMXBLTUFmUFo4MkRIMCszWUk4THJiK1BJMlVjVWxiS1JpbHo4?=
 =?utf-8?B?RlJsYnY5dmw5clYycm05ZTQ2ZlBIVWIxTzRPWTJxbGxkakI4ZldheFc4OUNp?=
 =?utf-8?B?ckczVW51YUtTZDNWdWFkT0YzNnlla3M2elJ0enNVU2pHOEFUamt2aXlRMUZo?=
 =?utf-8?B?OGZZdFFQZWloamRGMHJqOFhvUnM1bk80N09iVnJPSEN4ekpIRmtGKzE2VkRQ?=
 =?utf-8?B?WDFDT2hVWDd6MERNVVVVMlZWa1c5WG5NRWtOUGtnelgydGxHRVBlVkVJSUNJ?=
 =?utf-8?B?ajk2VlRYNWZoeGxmYWFYZmhhcVlCWFM0WGU1clo5L0c1aUczNDBoelRab2VM?=
 =?utf-8?B?dkhwZ1MxZU5Yd3duY2F5NFU4TlVuUzZsb2xza3VFbTgrTSt5c2dVazhwOW5V?=
 =?utf-8?B?bk5QcHlVUkxNcTdRaXlNWE1XZGJjeVpwekpLZDdKWjFXY3Fpd2pjU0xZcVhI?=
 =?utf-8?B?bGduQnpHdDFUcDRTdmxnNlliMWY2b3BoNDRnRitZaEJtRmEwc1NMKzVmVzRJ?=
 =?utf-8?B?SU1IZTRXUmdLZDEweEFUeHhKNHdVUGtXS3ZUUFN1cTkyNHFwK0FvWlB0Z2hH?=
 =?utf-8?B?ckR0ajR4eHc5QXNVUmtxNzNIR2N2VmRoWUw4Tm9JSTZkVW9XcG91QTZhR3ov?=
 =?utf-8?B?U3pyRUJYampFc3R2ZE5WOTVEWmRVQnM2MUV5eUZJSWMwcHZmbW9LcEp1VWNP?=
 =?utf-8?B?ZWVWdnVrOWQ2aUJZMHhQZG1nNllSb2RSb1RXUHNMcTBEanUyenRER2xaZ0tG?=
 =?utf-8?B?cUNxbHBOTkQ5YUFnTmFsTjVWU1BSb21WTHNGbFEyWWwyNE5KaGEwdmFkK0JW?=
 =?utf-8?B?UFVwcUw1ZnhYUDZUdnhaUVRyaUpGbno4cGFudlpRelVBNUpjaXBTb2Y3ejJj?=
 =?utf-8?B?cGpYN0x2MHBBZXFZbVRyWFBpQUJBOGhqRnBsMy9Kc0x4T2s2YWtSYW5vR01h?=
 =?utf-8?B?UXhFOTVaU0RCUi9iNHhCajdvbVA0bHBHd0pjdG5kRXAzNzhtQ3VpdnFwTXhX?=
 =?utf-8?B?b200TzRTU0hEcmJmdzZobkhKMVlidmUyZ3JHa0RUSWV5QnlaTGhTMUZmMUEx?=
 =?utf-8?B?aysvKzAwZ29JejhXUGExaWtvaWEwQ3kvbjJnZWliNEVPVDgyMVJwYWxCUmYw?=
 =?utf-8?B?M3pUemh0ZWViZ0pvZ2VSTVU2ODR6VlY1U0liWlBPMmFBaGVuaWNGenZaUjhI?=
 =?utf-8?B?bEhYSlBCUExXS1FNb3d1a1dpWjJJWVFaTkRremNaQUZRU2x0NkZ2RXFtTTBX?=
 =?utf-8?B?cXpNSE5KOG53YUU4am9zVWdyS1dkT2dPRzlNeFF6VGovampQcDJ2V290NnNH?=
 =?utf-8?B?ZlpxNE42S2U2Yk1vVkJlbythYXU2N3JIb2lTY2xsWWpLQndJUUtlbWo3Wi8x?=
 =?utf-8?Q?w2ds=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0tqMDZiQURYUzVLQk1kelhYa1pMWmdaVmx0dS9oTldKaG1VOWlnbEcybXhK?=
 =?utf-8?B?K1ljNjNxRTJQdjVzcmpaY0cyeitaWjQ2dWFidzhDdjRpS283S3N1VDU0UExv?=
 =?utf-8?B?TEV5YXRFc0VsK2lqbFRCY0h1ZS8zUXFBQkwxTUt2UDBLWjA5ZjlSSnJ0bHBQ?=
 =?utf-8?B?RTdVTUE0S0MyMDNBd0ZjaEVYWlFrZ2JFbVY2MEM2TzA1ZlhiVUdkK1hDZXBG?=
 =?utf-8?B?M0p1S0VYNVhIK0xOT0FORVlmZVRZVE5GRjM2a3hnNlprbWZHcElud3BPdVFa?=
 =?utf-8?B?Yk9NajhIb2pKRDNEbjZRL1k3QW1oZHBxRUd2Mjl6UWx1RGdnYnhOSGNrVlBp?=
 =?utf-8?B?QmgxeTlqSnVJSVR0RDVkWHlHMnU0VjdkWWVnNm1ucXc2RWZEOE5vNytCQWh4?=
 =?utf-8?B?SGphMUppd0pIWnBkazJQS1F5a2VUeXpvV3QyMSt3dnU1LzNPQ0Fxalc3N21X?=
 =?utf-8?B?VE03R3JKeTh2VHdHRy80RklSZUVhSkphM2xWVjZBWHJZb2FESHA1NlpJcitV?=
 =?utf-8?B?b0VtYk1vd3IyTXRKOGJvUTI5aGtIMTZLMW9IM05IaDVKRTNqOUR3RVE1dk5r?=
 =?utf-8?B?b0czTUNOaVpmMVE1WU1MKzBEWmpUU2ZjMk1FeVZxM2dQT1JGcythTXZ1TDRS?=
 =?utf-8?B?L0NnUjc3UzNET2xic080MHdEcm9zTjFlQWdxM29SeWMvdWgwYTBIWjFVTlV1?=
 =?utf-8?B?N012alhjYlB5QVl1Sm9ENW9MTTFqamdKWXhxNjVwbmczMTF4YitKRUJZak9R?=
 =?utf-8?B?dFlqSVRTNDBiK0xodHByRVQzWUZYQmwzcmo0eEZkcmQ3Z0FGQXQxYVZUb1Bx?=
 =?utf-8?B?bTB6UWFmN09lSmZsMW1Cdys5L3crNVljYWt6c1NhRGU3eTY1S0xwVmljK1ZL?=
 =?utf-8?B?ZC9NdE0wYzlnOU1hN1kxUkZKaFUrd25MWVBOOXRUWHRyUXhhMUU4NWVzWnRE?=
 =?utf-8?B?N2pCRWJaZjV1d2VJRFM1VVh4aGJMd1lteVpnRUlyTmJ4OEM5R2UzbVk0SmJh?=
 =?utf-8?B?ZjRnMk9zV3FvY0YveTRYNCtTT2JFR25qNkF1cjZDMzdvdjh4NytlMUVnS1oy?=
 =?utf-8?B?Zm1JemRqTGZDM2ZsUjZOTkZReEYxZHorR240d2x5YjA4Y0c1ZlVIK0NPVTZB?=
 =?utf-8?B?Wlp4YjVjQmhKQkVwTXlreFBzTWU0WHcwaXJFN2tpM2gzdytRWWxaZEdvcGNC?=
 =?utf-8?B?cXZZcG9kM2pYbUhucFNaT2FCNUUyWVlNK3RDMGsyZG5jNkkrQnNXRFRCRVRt?=
 =?utf-8?B?dVMxVGtmeVdLb1VKSkJLaktlOVAwcktFeDMvV2lROEJnWkJwbmoyTVMxL0Q2?=
 =?utf-8?B?VjRRSFVGT2tlZytVVDJoSWxQemFIbktrRjNLNHJORC9FRjA3blBUa2gxY3ll?=
 =?utf-8?B?N00wcjlwYU03L2J6RFA1bkNpdm9IZ1NmdVg4ckpBc2VuUXVVN2tkWWZmTHlP?=
 =?utf-8?B?V2tCUzhQd2l4TXQxZDFQajlsQ05XOTR5MWc0dGhjOTZOU1pLK2pQM3hqMXVi?=
 =?utf-8?B?ZWhFTWhvUlhXWjhWWTFxYnVKRXlURXl1OWZVOTBoRnpmWEl3eWJZWml2dktH?=
 =?utf-8?B?bmRQRjRBWUtzVisyWkpWa0hxelJVSEYxQ2xLcHJ0bUlzMWdpLzduZFQySEcw?=
 =?utf-8?B?VTFOOXFGOUdsZXAzR0YrQ0FWV3VraG14OFptYWIyM0hmRDVxUGNTdDdwU0pF?=
 =?utf-8?B?ZFIveVlSdnRwd1BwL1pOODAzK2k0TUgzbml3TXV6Z0t2RitlOFNhNFYrWU03?=
 =?utf-8?B?bUFQOXFlWGl0WEJndlpYREJtQlFYMHh1MEM0T0hTeW1saXY1RVdjL1A0OTky?=
 =?utf-8?B?SWc4RHpZTGpjd2pGeFBVWlJjTVhwNmlsbUhmTm84VXo2SndpWjhaemZndzBl?=
 =?utf-8?B?eCs0SGJsMlhDeG1HbGc5WHY1dGp5Q2JOMnNCNkhlKzZ2RDNjZ1NpOW53NEZD?=
 =?utf-8?B?NWkrYisweDhkUFExa0dKUllXa3E2dVlIZTVZalQxUGk2aVk5dnBsNm1SMUlL?=
 =?utf-8?B?bmVDT2dlVjJjaWYvcmk5MXF1ZHV6M0FDZUJWdXlxVFNxc05hc2IveTdzYm11?=
 =?utf-8?B?Y1ZjMW1nU01PdHRLMytmcm14NlY5Z3RCRUx3V0lmOURLVGYvNXRtbG9kYlFz?=
 =?utf-8?B?S2JrR2FHTjlyZE1UMHArd1dtY0JvRW9MYmZ6STNjYjE2VDdEQjMyNk0ySnBZ?=
 =?utf-8?B?ZVVFWmIwVkxhSWRmeDF3Z3hvV2VNQlMzS0VEazNIUmdXQyt4UFo3TnlJckFP?=
 =?utf-8?B?QWlDOVlsZUdnbEhQMjJvT0thSHR6RVNXRCtDazU1S1lJUTJJbFZZVTJ4bG9h?=
 =?utf-8?B?U01DQ3FXa0JpZ0twYkRBT05sb2Q2RkE3L3NQQVQ0Qm12eFJRZldhdEJFM2Ro?=
 =?utf-8?Q?lZ2lZQTKOIni5NCygJZeKYQ8Goycax84jGwQghnxfFjzh?=
X-MS-Exchange-AntiSpam-MessageData-1: FmUtwILWIYVA1Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0056726-e84e-45be-0f7b-08de5ad37aed
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 23:02:28.1208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxPB7O3c1ARLCPkl9hkyOtFqdNxUpEiCiQA/uUnJaTgus5T8kDEKxuhUWpG6By4XRxoEy+AZkkDHlqhnGQIZow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEB07C8E34

On Sat Jan 24, 2026 at 3:07 AM JST, Gary Guo wrote:
> On Thu Jan 22, 2026 at 10:28 PM GMT, Timur Tabi wrote:
>> The GSP booter firmware in Turing and GA100 includes a third memory
>> section called ImemNonSecure, which is non-secure IMEM.  This section
>> must be loaded separately from DMEM and secure IMEM, but only if it
>> actually exists.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon.rs          | 19 +++++++++++++++++--
>>  drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
>>  drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
>>  3 files changed, 31 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index 310d4e75bad3..0d1a0f86d83c 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -242,6 +242,9 @@ fn from(value: PeregrineCoreSelect) -> Self {
>>  pub(crate) enum FalconMem {
>>      /// Secure Instruction Memory.
>>      ImemSecure,
>> +    /// Non-Secure Instruction Memory.
>> +    #[expect(unused)]
>> +    ImemNonSecure,
>>      /// Data Memory.
>>      Dmem,
>>  }
>> @@ -351,6 +354,10 @@ pub(crate) trait FalconLoadParams {
>>      /// Returns the load parameters for Secure `IMEM`.
>>      fn imem_sec_load_params(&self) -> FalconLoadTarget;
>> =20
>> +    /// Returns the load parameters for Non-Secure `IMEM`,
>> +    /// used only on Turing and GA100.
>> +    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
>> +
>>      /// Returns the load parameters for `DMEM`.
>>      fn dmem_load_params(&self) -> FalconLoadTarget;
>> =20
>> @@ -460,7 +467,9 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
>>          //
>>          // For DMEM we can fold the start offset into the DMA handle.
>>          let (src_start, dma_start) =3D match target_mem {
>> -            FalconMem::ImemSecure =3D> (load_offsets.src_start, fw.dma_=
handle()),
>> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> {
>> +                (load_offsets.src_start, fw.dma_handle())
>> +            }
>>              FalconMem::Dmem =3D> (
>>                  0,
>>                  fw.dma_handle_with_offset(load_offsets.src_start.into_s=
afe_cast())?,
>> @@ -517,7 +526,7 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
>> =20
>>          let cmd =3D regs::NV_PFALCON_FALCON_DMATRFCMD::default()
>>              .set_size(DmaTrfCmdSize::Size256B)
>> -            .set_imem(target_mem =3D=3D FalconMem::ImemSecure)
>> +            .set_imem(target_mem !=3D FalconMem::Dmem)
>>              .set_sec(if sec { 1 } else { 0 });
>> =20
>>          for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
>> @@ -546,6 +555,12 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
>> =20
>>      /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare =
the falcon to run it.
>>      pub(crate) fn dma_load<F: FalconFirmware<Target =3D E>>(&self, bar:=
 &Bar0, fw: &F) -> Result {
>> +        // The Non-Secure section only exists on firmware used by Turin=
g and GA100, and
>> +        // those platforms do not use DMA.
>> +        if fw.imem_ns_load_params().is_some() {
>> +            return Err(EINVAL);
>> +        }
>
> As pointed out in last round of review this is unreachable code.
>
> I am not too against in leaving it in as is, but for checks that assist
> debugging only, I would probably use `debug_assert` myself.

I expect this bit of code to go away when we address the remaining issues
with the last 2 patches, but let me add a `debug_assert` for now.
