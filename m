Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115245000
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779758276; cv=fail; b=g4Rkipa4ssRSgklU4TgG/TodLcrk+FumY1Y0K3P6VNTNKKuHTWz1eDrWPaxomH6s5g56dGWo5V7sPSQn6hXLcOQU/N4mkr1WzTvrXNJsEQet7s+kSm4po3sklV09d7tXuId4E/ht48Zt2cONZcF3lQrBiyyZ6Qx64o6CkxwZ8vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779758276; c=relaxed/simple;
	bh=3F/GBqK/ImWt46g+QsqdqGg2+3qb6KE/wH7r+1DT8cM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=OgL2/nhh3pfak6lYHWKgZC3GVneF42oBZznP2ITaQ6Scfj+cogvydEwmvn6uEjvUFs20Ug0X2hIAi+Q2XS05uwtn6J9mhGwgt2bGkqDxMNo+ab6HngPA/R25ZYkKXc9UCIgWJmzzUxpQdbprZ9XL+x8dJuS3NjqN+vq7eUDzYXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dBA+pnkc; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dBA+pnkc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAJYjhRpGhxBk4xQCFy+e0Ku+PMFUmeDxrcEqaVu02gvlUP7r5TVI9O1wrXTpHe8HL6jcjAQYdDDvPjhK/EMgd5rcQFnJgkz7vWBqmuhXkl8qivskJ+Xq4bW9lkM5ItJNGZDSqJ0uC0xvI0y9+8ziFeyZHToGIdm67auZLrwJ8GC+NV9HsT/1Z8CUQiA5S3zQ3JfgPpJDINDDEvp4hIp5XWTANWyUTMB/awGSumHPyPCG0ck7AHsZapRGtlgsPxM8vvVR3uL/eyNKvkQthGQVkUAGuaUS3jVA9vozJhUHcn6ZBbk5X9avBcuU8f6mrZc0Qz24MPaGPZfN3mkABAYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3F/GBqK/ImWt46g+QsqdqGg2+3qb6KE/wH7r+1DT8cM=;
 b=l832vXA5OdTNTCralShYfp+DoLDT9y6IqvAAQ5kF5g0u9D+/GlmFiswaC5EOUlJ3T1qbMqi9PF1E73CXgEBlIuWyvPIVOZesgSwsImSFwh33VrNQqrJMreoV9eK2Cdex6Lz4bDFZN9Xtn/skIlWaDzCeCX4NkeQzgfcPfJ3RKJG6A3h8SCrtZIT8ZggybH6m4jnoy5YwD24ou5B6b0nwLBzmmpKwHMTVZfpWDBdT1M8CDDFcTdekihWDgKwXaBVl+2WJagsK2qKkJdSaa4wTO1Fyh8cz7YSDRpr4H495Vt2MGx2r1SKDoXYS0n7Wux+XSRoeKvqQimGJUGQTLNWVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3F/GBqK/ImWt46g+QsqdqGg2+3qb6KE/wH7r+1DT8cM=;
 b=dBA+pnkc3+itCVe9BmcGVIGd8RGfYcYFvBCfzfOKFHy+kDo+tm20MjgtaTwNK/QD8+rNLtVk3QWv4x7Ub714Tfwxmi8JdUV9kfGZ/pdGvYHpuTSGc7DymJ1pBsbCQUYZhnPAnZeYAlRdxD9gyjXOA5oJ9YCrxDAp1CPPF0X9ATqol/h5OhELr5Zm/Yk+Izti8NPuozPE4B20QVxhbd37fkHkrU0OQVA1UjnISWuZmPhEXbCpbFPmc6+ZTN3U9AQuvqvb3OGr95Dte1OphBzIJLYe33CW/NfpFAzLfmQVubKSEWhJ9oo6OhADQGfi4Q2XOfnMK+XB2jZyxd23jhfh6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:17:52 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 01:17:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 10:17:47 +0900
Message-Id: <DIS7NGV7P5H6.SBXIJFMNH3ZY@nvidia.com>
Subject: Re: [PATCH 1/2] gpu: drm: tyr: separate driver type from driver
 data
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <boris.brezillon@collabora.com>,
 <deborah.brouwer@collabora.com>, <gary@garyguo.net>
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260525230152.277820-1-dakr@kernel.org>
 <20260525230152.277820-2-dakr@kernel.org>
In-Reply-To: <20260525230152.277820-2-dakr@kernel.org>
X-ClientProxiedBy: TYXPR01CA0061.jpnprd01.prod.outlook.com
 (2603:1096:403:a::31) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: d649df06-5bf3-4f80-6088-08debac49b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|56012099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KB2Lgbf43APIWrJE6osgzcMD7rOgIgpTOlCAuapxwPTM0xnSRqaaiXZXCk1o1KxqjcdbP6jEzjeZDiWkUd22hwhOtumhVLoZyic9CFgRFvuGsoiCH88LgOY+FOBOZ6Ejy9RDLfHJsXYC9zZWLh6S8I0aOEhMJB1fajqI0oC3ohhjvZmq3rQTdGXpAEcWHbZt6BSLCTJetJkAyHX/+IAeGD2oPpBjrdL73bCkaSLkXM7xEv6aCUIVIGzEX+3WWQqQbMutNX/MfDZz5hTayHa8RnDA8YX5T172oVad/WNpsTHypImecXRybz1Kb/v+XlHByxAgsYGr5iWbjWq97hwPGzvBggwtaBtOXv8jNMOlXBGpOze6LeA6WZS9h8gn1bIG2ZHY4BjZ38r040l2ulk4PoEY4g4M1K48Sl8jj+rv7EmkQTDVtVsVvTJQCcDC0Q3Nxz17OrRBd7E+DYIvXhwNMyFpKXMeiQIZAbCkq4btQjYVfimWnGHacrsuK9Xz+ayYw1wWLfTiI1SEkJejl5qHX71dr9YungNFfGlqsNW5J69h+QF55y3Ni32CMS9GrfEcMg3f1uRdsDOjlj3VrZwQ0T0/aQFgNQf+3HYCAb59Yzwgv1qKhZb4fZ0w5SI7r0i5XS0BYt75XwEqLIZmRxc9GxX+418p97YhdRigeC6Ak8MOhPX1XiWVcvJVPXt+1+RW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(56012099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUhkeWFBUjQvbHkvSTlraFZDTDd6Z1U2NmQ3bkdpY0xCeDhxSDNhVnNtYWZX?=
 =?utf-8?B?QVhiajB5RkRTT2pHVFhoQ2diMVRzSzNOUTZWekFVcGE4SWJaMnJ0MDZmTHgv?=
 =?utf-8?B?Z2FDKzlvTjlEZ09SWXhvcEtuQVhKLzhQeVJyL3pNV0JGa0pqMnFWNmhIWHU3?=
 =?utf-8?B?SU5LR1psSWRQdGJ1a2cyZFN5ckI0Q1BXQVM1S3hTbFFHUkk5d3p1bUJuSTg4?=
 =?utf-8?B?VmpDK0g4cFJWZzFSaEN3Ukd2SDlvVkxqeGFHaTFoYWRwRTUrRm0wcEFpMU1V?=
 =?utf-8?B?QnlPWTBUOUZucXNIRHR1UGZvbUJNSkw3bU9odmdncE1IRms4SUlDdXFZQTJB?=
 =?utf-8?B?MkZ3TDVteW9pc0FnZmM3ZVRMdTFua1FFVkw1YWNsYkVWenFuYS9hV0owRjh4?=
 =?utf-8?B?UFlLQmhGUVlOZmpSMDQzTUQzN3gvVTBtOXNVdVpUUnFVL3VLZXF6ZDJkU1pL?=
 =?utf-8?B?eWU5T1pEcU5QUFBwSFRYSTZXTkhVMTNxZHZTbUNYOUZZdVg4eVpkZ29SaXU4?=
 =?utf-8?B?S1NqUXVDS1BuVExSdUdTTTR0VytOWFh4MTZ0QWxzRXpLSmdFU2FPY0VUeE5F?=
 =?utf-8?B?OWtnck9Xcm1FOFRKR3NwM1NTcGNhdXBMb05zRnFCV3AzbFVwd0VZVmx4OE5Q?=
 =?utf-8?B?TlVBclp6eFF4Q0FMTnNNTEtmNTFwTytyRTVNemJxRWY1aSsyd0dGRHhydStL?=
 =?utf-8?B?eGFvUGxCZXUxc1pBdUpPMktrYjVGbnIrdzNpMGN5U29QMzMzNEEyd1c1c1Vn?=
 =?utf-8?B?empBY0F5NXZNaktLV1N2azNGSjF6Rk1Jblo1TW5FWVNSM0dkV0VhZ0FaTVEx?=
 =?utf-8?B?K2poOFhzaktuMFZubDhvaWRCQTBxczJta1pKcUxLeU9MUjlyUUE4Zm5mZys1?=
 =?utf-8?B?RlBKbXovRFN0bTQ5VEpBZmMvREJySG9vU29CU1JubGhvckZMWU0rZ1dpSzNT?=
 =?utf-8?B?cGtFditTckUzbHZycW1sbTZLRWFJNHNPVGo5YW9BRHdCMDI4RFRCbTQ3WFhJ?=
 =?utf-8?B?UzN3ODR2b1hsSEw2alhYMFdGY0xtcWRXZWdWVnV3b3V3MXliMkRUSXhOQkNM?=
 =?utf-8?B?a29OZFh6Uy8xQTRuSW1NUWRQd0JIZDdTTmNEdzhJeVJsdjNCeUNtYXRPbUpy?=
 =?utf-8?B?NDVURVJBOXZMM0dsd21XbFRrZXR4UFFEbWpISElOdXJrN21jVXpld1QxT29j?=
 =?utf-8?B?cVI1OUcwQmp5MGxnWlZCSmZYc2swRVZ2MWJpQytXZHdaUUdoOGJrRWhEbHVw?=
 =?utf-8?B?R1BtNG9ZOEQvaGNoNVBiSUNrM3l4YjZVdW1RM0hSciszL05XVmpGTFcrcnEv?=
 =?utf-8?B?c1NwRTN1YUJ4N0kxRWo1MEhDN0hFUXNpVklZRDhGbEtUWCttaXNFM1pIV2ND?=
 =?utf-8?B?TkI4dzFyYVU4angrd3dNc2cyLzJGeDlBU1dSUnJ2K2hsZHpEb1dES25oQXFN?=
 =?utf-8?B?RE51SWplTDJzZlFIT0V4bjVndU1rQWZHdDFXU0wvdTJ2TUVzcHJFWXRFT1Bw?=
 =?utf-8?B?ZitKblFrN1RqVmpmL0RoWlNUWHdNNWhSRnVqOVBNalFBVVV3RmRoL3phenB4?=
 =?utf-8?B?NEo5UFRjM2k4OVdHYnlBbmk5dUF4KzN0YkNoSE1jU2RxT1l5ZTl4S1hNQUJO?=
 =?utf-8?B?aXZiRkZpdnFUZm9vZDZuc2lIMkhGM2UraWx6T3pvNU5Da1ZOeEp1RmRYcUxo?=
 =?utf-8?B?Y3FYU3Q3cE5WSmVaVVI3SW9ZVmpiZmZnWVdVV0ZWelNncU1kb1cyNkU1SnFC?=
 =?utf-8?B?OXZIQVdKdmNTUC9PcjFORVhnT3gzbmlwMzhETkxjTS9XMGhPVW85Qk50YWtX?=
 =?utf-8?B?L1N1L3NFcjNFa3g3MkVkRzFpTnZUZ3lqUU9uSkxkN1JtdFpiMUs4ZVhpYWlY?=
 =?utf-8?B?elFXdFY1aTNrTHFlZGZoR3A0SkpBcjQzZWdJbElMK0ZSUUV5MUxRWm1nMHNJ?=
 =?utf-8?B?UVZqMjN4cWhPYXQ5SVRXczArcHBTQjF0ZGgwY252VHp1WGtoM0ZOVlhWUHVE?=
 =?utf-8?B?Z29qVnhkUE1YTUZ6T3pvbUk0dGRpYlRPZjNLTWUzNjBXU3Fkak1LYlZxVWlq?=
 =?utf-8?B?SkgxUVNxbEszWHJtWHI5UXZ6U3VoVHU5YlhCOGVwenMvREJKNEVkeUVEbGlC?=
 =?utf-8?B?TUs3ek9lUHhsMHdiNjdXQ0VqdFlZVUc4QlhaeW1WL0pTU2RzNVpHZ3NlSjlP?=
 =?utf-8?B?NmVMbnhad3pDWnl4VjZwaHZFbThPUytNMFJ5WkZDUmFkcTc0c1BoU3NvS3Zh?=
 =?utf-8?B?dVVKemVHZE9xdnZmRFBJeHRvVnBLZCtKSlB6QzhFdktkUEt6T1dHVWkzR2ll?=
 =?utf-8?B?eG1IeTV0cHMrRFpRbGE3eVdwbDhaK1hHNWd4NE1MdW9hRzVZT0pFZzF4Mlpp?=
 =?utf-8?Q?IRZqpYVDuIf79g/m4mTjwoQAmaVYU8YYnCKkXkd/mN7Wi?=
X-MS-Exchange-AntiSpam-MessageData-1: LjfAsP8h/wYAPg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d649df06-5bf3-4f80-6088-08debac49b2d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:17:51.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrvVE3oBSVJDMTis/UeMoEB7FWJ2IgYpwYN9rOD6atSUOdo61pCaLhfkSedYW6kPQe5CDZTG6A7S/0hhio0ueA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570

On Tue May 26, 2026 at 8:01 AM JST, Danilo Krummrich wrote:
> Introduce TyrPlatformDriver as a unit struct for the platform::Driver
> trait implementation and keep TyrPlatformDriverData for the private
> driver data.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
