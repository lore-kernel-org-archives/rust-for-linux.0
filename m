Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51D33CEBBD
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261480; cv=fail; b=Q2LnmOHXaiPdzx+bkCGNQ3H1RrtDfD4d9bgn+W9iNyw+f+HZ4zqziqG0SQP2R3IWcDqPs2m71oO6BnDDrHM5YFna9YLUvp7DUiQMiSKC1ZbrxguJeagnyxgdY8fJ7FfGNFHsIDFgLvkOr+0pegq9UDVimC4/N+/k1b0iUW01+XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261480; c=relaxed/simple;
	bh=DZDAE0PhGifTtWKlEqf8OdBramZ9HE6st6ewGsqQLEk=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=qkoZRQ97qIA9kvYLLhWy3T7lqlyhD9T//fDELBuE1ruu0/Rsi/II6BBW2464Fp7q+p7QnDsdrzK3Iqsxh4N2lVdnqHML1mqZ8hICYSkQV6GHDd+jvvqs+YloyuPzvvLXizrckGOfkt9xUUU3fFrRU2eNRQCe8WqKTuE89+nVstc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JKsnB4pJ; arc=fail smtp.client-ip=52.101.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JKsnB4pJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIg23TXxHlbDhqCnDMys1yXw5tpPUI0z7gIi9FQ8Hwrf69WCfU+tNIZQMSKBzt6Ro/M8Glx0sg1hSwh3ZML6/54h344x9Y2y2Q5LuBrwgFGejLq+qD6cp4D/eXC+JPzq2aZ8LrI6NdKyQ1pK7Mrj+w7PvgqQ0RDC4NRfP5KIzW1iML7wy6CcSXBdL2I6oub5qWHRoF3d9SjAcRqLC32z6ijMy7GmKGcga/4ElQcPKEu4P7TAicWweyzWYqjgL9F/rrAkLGHm2d+rYxHyPirRf0ASOxyuNU1v3gRjBYQ7ekSH4iHW6JA/PmiiRQkbf7LyyAZU04D4rivRpsy2B6PTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrtyYpe5bOl+tZUyHVsxFjGmTeyfYxSnMn9AdYuso4E=;
 b=ql1ZVtKMS28TG8ikr6exeFt9mUPR2ExkN9jkifFkn2i4KRu4QYUklK4J/fM8MF5A8YZJv0RNXAOIIYht3KPYh3y91LxEVGXkZht4BDK+AouqMOKQC+KJNpVuRtZb51pBMp8A6PU8EHHl/T33TcHfIarCbmcbIdKKbEaQ+Q+rfbCdRka1nIyFQGOalXg6becFeFldkPg63n4knbr3+Piyqe7bWb1o6QC7WqVdBp0UlCt1JkdXo3TTlL7stqwvWpNohK6xcGFq7pSGdtnHjNT9SpXXGsO6RSSrKJ/TZKXYjKnAT1jmX7k7ccdrKF7EWcVuP7B+iFgn/zmuNhCce7MMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrtyYpe5bOl+tZUyHVsxFjGmTeyfYxSnMn9AdYuso4E=;
 b=JKsnB4pJ95kgZtByHQt8zl6/MM+cyM3kBynPD8qgxHJ8+4ij6K+GLEf2VwUDRD/jZ8/5cCiFw5YKPNl+WPaf+dQzzbGDj68sbP1mJyS1wXvosJBjO5zYcXT0uwYT2FxkN6YWqrZpkJ5x5pKTZ76Y66fvDkKLanbeyjvxMyZRVRTFDl5Jc/NxUOKxOekF337zjC8L4hP2GrUsiRJWU8sYWe1IEkO2yvZM2sgphl3xd2ttHNOIKOyOUERelwXMY6TOG5XJU8mSQnnylFdTdjy89bhHMitJdeqYbQl0V06VLzTt+eVYplPI9lOewXf69z/uYDnbJrjEKDJyNBI02iWmrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 13:57:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 13:57:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 22:57:47 +0900
Message-Id: <DHTS5166DEXA.G18MTZS8U52V@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-5-ttabi@nvidia.com>
 <DHTRY8R0QQP7.18II4DQCILU5M@garyguo.net>
In-Reply-To: <DHTRY8R0QQP7.18II4DQCILU5M@garyguo.net>
X-ClientProxiedBy: TY4P286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f5c9b88-41ae-4b8e-2a52-08de9af6fbd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZoBCUZMf7J0UwxScuhgLl7T66GjqL3KSw17nY+dCckg/ns+Qjm5dlQJjN//GN7b04P+It6osdS8SmObBxbhrggIBufZrIbwaY1RAoerQt71iJJB/2nMmvWt0CrI7MVV4Pe1YKAK10ZN1kmpdfQoXiM0Ougqu8iOoLxRI9ERz6ErV6x8P4p37XL/8qF0K6uEk+pCMVMke2KxVXRwxHKYW4ZPPLBgEoGNvJQrHqY9s0EqWEY/C3R/AyNK7QCmytabBw8h2uz+sbEOdXPClI4nRXR3MnE1isREysG9wazdZzuuuyPrFWrNfvqYj97HoM4vX3JAuGTiIfTBKa+n6JJbC9Q1hU8w8mxosbgmzLAe2Jt+miUvSHIEEJcsUNUdiVKIVB66M3QHJ0J3BqEdRo15Gy76H8TQU31Kd/k3UjPjIZJojZ94x/B2kcbKyTll2ODe96pvOIAxpbhOH712qvQYIXmsLWCEFO9tWDY9MVvAgKlitHsJrssgyUpQnFZDcXortKM8uRarHwGD6fICWBZZJK9GXGpK7iUsT7wR2c1WKvhAk5ve9Yw953FUWgjQppX7g84p7ybsAvM6Vt7LJVXBbUr/Q0AIttaOrzE79zo5qBItfpI3r0K/paUi2sXLXzj9hi0V1vAVW3wAvSLQJy1XsG8OnY4G2uCmHGroH94XFue5ZtiVHr5Af4HdSlJk3hXGUhtFmaAlyfuNq46wPHYHSye3t1deFbJ6KU1O0lCHmjuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEV5UUhscjRqQXFKL1g5SldjWUp0OUd3cDA3RVY0WlFPUzdWb3JkM0tvU0tx?=
 =?utf-8?B?ZkxvUUJJcUlaRzJGUlR5SnJxcGxTSEN5MzFnbE9GTmxpQUNHZG9lSlhnWEsz?=
 =?utf-8?B?T204VERLS3AwOG9VaDNEd0lXUStlMFovSitRL1BTUkw3bGRIOU10M3loV2ZJ?=
 =?utf-8?B?WFZ5dllENFNDOTNnWEFaNE4yNnJzUlNFcEs3SGhFSkpZWjlyaW0wR05QWGZG?=
 =?utf-8?B?dHRaT3d4THhTNHpsdTM1SXYybGp3aUlGVndRc2hra2hhUUZNbUZOUkVmMFQz?=
 =?utf-8?B?K3dYOTRsTzgzOGxxTmhSdUhwQW1MZ1lTRG5aVU5mb0pqUGo2dDhoclkyT2Yy?=
 =?utf-8?B?blJOLzBkblNuY2l3c0wvWjRXUmpYbWVUWCtTTmFhTUh6TW90UGV4clpjWW5s?=
 =?utf-8?B?NFZ4RzlzTDdDNy9mM3JwYXlQSVNCNWx2Y1J2U01GTCtEMDRmbVBtUHBkY1Y1?=
 =?utf-8?B?MERoOU8xYkl2WnRHMzR6WGFnU2grU2pjeHk2OHdrMHZIY0Nkc0wydnljVjdV?=
 =?utf-8?B?ZUxGbDFmNnpHazd1Wmhvam9BMFpqbEcxTzVncXNSY1pmZHM1K0Y1Sm1aZHIy?=
 =?utf-8?B?SzYwV1lBZmxaNW5IYnVMSEtsSElsWm9QWmhXd0VDbDZiY1RLb3RtdklaaDFs?=
 =?utf-8?B?UWFSZW9lTzAyL2hVNk9BeE9SbUJuOSttMy9ESklkRy90L0xqUEVjbUVHVUVZ?=
 =?utf-8?B?YWFURDVLYlVwNEc1ZmM5d2tyNUwzTEFPQU56T1lydGMydkNOYWs5SEduMW8r?=
 =?utf-8?B?NjJiN1J0ZHh1QkFYSDRqUzJ5b3dOYTg3SGNBVnZEbkNRSDRjR3pxSURlK1Zx?=
 =?utf-8?B?ZVZJRFBrTHh2dU5WOE9WTmVGY21HY1h3ZG9SZHA0bnFBdnZiR2pETU9Pb1NV?=
 =?utf-8?B?VjlyeXl5ZDdkcW1nSkRVRDMzd29tRHBiQWlmbFMzMEpyelUvRGtwRTJGL2x5?=
 =?utf-8?B?Q1EvMDJtcFVVVHNaUnZzd1NhL1pPVUFWaFlCd3hNc1BYczE0d3NnSlpoSm1k?=
 =?utf-8?B?YWl5anVkTFl2aGVJcnBaZHJhQXlsL3h4RGZETWo5N0dERXNyQ3RiQ2VSNUE3?=
 =?utf-8?B?S2FLNHgzTWpZV1JXcDljQjBLZ0x4elRiZFZaaVNOTVg2QWVSTmxUMFAranRN?=
 =?utf-8?B?UlNtSmN0SVZaYUpGQUhZeEcwUHorU21JOHZGVCthamZSRFVDWlY5RGc1QXFt?=
 =?utf-8?B?dERzZ1Rob1ZZRzdWUHllNC81MjV3TmJYc092Rko3bjlJNklwWUZQMWRXM24v?=
 =?utf-8?B?b0lGNEtzS2dQWHdFM3NHWVN1UHVpbitUYXBTMTUrYm92UklZSWFBWHJLc0tK?=
 =?utf-8?B?RmpFbTNtNHFTeHd0RjdQVjBDUWRHU3pWS05hbzJVZ1E5NDNBOEtvMm50aWZM?=
 =?utf-8?B?SklqTEEzaDAveDBWRUFLbTlGejhWR3lBZTdLMHExaWNVL05vZ0RycTdIMzdL?=
 =?utf-8?B?cmViRS9NYVJ1SXJuZk9pd0hDa0dLbG0zZ05tOEVGU1JRWG5tL0l4ZVVYSTc2?=
 =?utf-8?B?cHBRaXRFQWRNbU5iSWNqcmRXYitwN29VUDlsUUhCcW5vM0lTbDlvbHpJaUlM?=
 =?utf-8?B?aFptYi9WWHFCOXgyTjcwaEU1Yjd5TjVJaGFaNXJpUTl5QlJ1clF2WXU1Q0pV?=
 =?utf-8?B?SmtUa3JCbTVHMnhjNzY3ZnlML0k3WGxDMktVeU5TVkFmaWU1VDhkTXdRam5t?=
 =?utf-8?B?VHlSOEdXbnUxbm5DVmV4enhHTGRoNmRSaHF1enZWUExnU0lxVmFlaGxlVTBO?=
 =?utf-8?B?RHV5MnRpdSsrTWhPNmI5Ni90NmV0d3IxNThwanoyc3VrT0VSWDA5eGZSTlhs?=
 =?utf-8?B?QnBNQlZKWW5lYjJrR3R5dGVmc1ljam1IblQxU2IwYUNjNWYyazhTd2t2QlZU?=
 =?utf-8?B?SUJibVk3MlY0Q0hRdGJCcktLRHYzRkxNckdpMVRCdVRtSDUreUlMcTYzZzI0?=
 =?utf-8?B?a0xuSlBrQWtsOFBWRXRJVWc3VUxMaXRqRjJQaTlCNU5KQ05LbHo5Q0QrZ0FR?=
 =?utf-8?B?dnNJYWNYQWdEeU1hY1pFU0ZzMytPSnkvZEZvUnZRZmdKUDFCU1RnNmpBZ29w?=
 =?utf-8?B?dmoza2xGUk9GZHZCSGVtK1dmZlMzM3VUOU9RbW1ZeFNUSFJiejdNME1OKzV3?=
 =?utf-8?B?WDlRaDMzNE90RVFMcVhCMDJ4QlltVXkyU0g1Wm1ZZ25wYTIrSlBYamxCb2xS?=
 =?utf-8?B?ZjV1L2srRHNwR2dGRjN0Ymh1UklJTzJWY3R6U0JzQmVWYUR6M1NsSTg4WkxP?=
 =?utf-8?B?QTRFRm1zelpady95KzFlLzNMaDU1WGd2OXRFaUN4M3o4ZnRlTTFnMnBrWHpq?=
 =?utf-8?B?ZllGcUpQTVdTejl2TElLVThCWWRtUzcrdWZ5dStLL3lQamgyWjdSeGxqTzdo?=
 =?utf-8?Q?IMTutErP+GdxmmNgkMLMaEU22XcArizGbKPWJ6vfFJ5FK?=
X-MS-Exchange-AntiSpam-MessageData-1: jae3UsBVui3riw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5c9b88-41ae-4b8e-2a52-08de9af6fbd4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:57:51.4657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAmFuhdOPLEY1KiOCMHi8k1zVgilAsRPP8NAjKMd9DBOjogYXjQkBJYCgUDFQmpReQb7ewHrbTm9A4Ub+edhDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758

On Wed Apr 15, 2026 at 10:48 PM JST, Gary Guo wrote:
> On Wed Apr 15, 2026 at 12:50 AM BST, Timur Tabi wrote:
>> Introduce FbHal method frts_size() to return the size of the FRTS
>> window.  GA100 is a special case in that there is no FRTS, and so
>> the size must be set to 0.
>>
>> Note that we cannot use supports_display() to determine the FRTS
>> size because there are other GPUs (e.g. GA102GL) that have display
>> disabled (and so supports_display() returns False), but the FRTS
>> window size still needs to be 1MB.
>
> Do we want to special case 0, or shoul we use `None` instead to represent=
 that
> FRTS region dopes not exist?

This was discussed in [1] - using 0 seems to be the correct approach.

[1] https://lore.kernel.org/all/DHRQL0KVSETV.2YWE5W5JFGHJE@nvidia.com/
