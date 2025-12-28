Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD32580F3;
	Sun, 28 Dec 2025 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766908334; cv=fail; b=Dxo6kNh1tkbC9z00vrETDfSLdX5nBLnKbRn2qGQ3D5YCZTYoq8UrfzOSJNEi2NkU63EXft+muepyw90oRZnwKsd471Ypsl8vY6rnIiHWCEeaBBjq02V/OJ8zffxSwUxmMR90lh6loLSHu73TPIwB5W2DuDzxsWHhCrrmmIeS/A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766908334; c=relaxed/simple;
	bh=TkhiKYA2aD3RXhTii4gybAxVGCyKrQTJhLdKa6ruYRk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=QVASvYuXmy9M6p4jilgJUaP9Yb39YOIYTpd656K2daC5SjDVY5pK+xuBkpZHGXmmu1qEmA6cAj5b3VqYvKBKcNyDtZtbQLUuBwmEZtt5LsMDLoj5VcHvsLX1qN+tIgnyXVsmrua50iKxTnoKpuQHA4iJmR8OX6xK7ptXG9K2Ku0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VeeS2wqN; arc=fail smtp.client-ip=52.101.53.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VeeS2wqN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEKlR/ta0F2jDswJj4hlT1A8C+8vMxCtv1i+cMHZUarbA6VgrCAHcheeK1syBfX48qihU8lMyb5TiweuLJSbA+4hTmQdNcHMykb3GdGI/iReKKnCfvafeIKxgfaFla+EoFJhOI5GR+atDcQdobGJ0UGawU1xiSRchTLRnkgPprEX/DJ5ueXs1JhI7jAp2mqTbZygqqhuxG9qG3ISDBJEZ4GvH1c2qak887uUmX0xgow+qj1BAnqBqdLPu6FEn/8pPTHz72d6bKDNdi1fvR+eOJJOdyqC7m+/dJnpu3C2VkXL32CRhkfDQ88cOZUpTjF+YiTdQyb0w0edM5WDLtGtmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkhiKYA2aD3RXhTii4gybAxVGCyKrQTJhLdKa6ruYRk=;
 b=L9F0w4B/cQMU92OMz6+PSb15xW7opvnyPmUW95y1qMZLBifKYxGXMMfVpmmjCnKnWCZsZqve6fyrpZyaRGO87ezcWxhoUQNP3OM8J7N31vnFy5aUnBjUhKpiF1uKl85miNmyqqLVbw4JUQDBdESIfCokkFHPR1zL/z7t7xLs5c1gHz+rwYY0mEuIMVvCoWEQfZG3ft8TKxBXv5YwTAD8JGNjcPg72Oomnb5ZtUgsjibpWGUYMXiOvNn9FrCMB4prYs+rmmbFH2PWzTujK5XrHYvHZNkD3wsKPfW36ALukrtne+QqGcJ3mvV1d3P02VEx6Y1MApZ05CyYKYGAfhdfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkhiKYA2aD3RXhTii4gybAxVGCyKrQTJhLdKa6ruYRk=;
 b=VeeS2wqNleb8qoludIuW4fWTs/EmlcR3afvUe6atO/Az9seEpwWKJQqaZ5xoxtEHyn7ej6iK91CxcNAu9PFjTzvC6r10QIav0IiiyF33TpCIzBZi2MaL6o9FGEYH51qBpc4pXM4RTCdFVHRVbmBIHYyC65howpobgmK4FVTlROrWc64GitorpOcXnPxd+QyxvnC3Zv+LnG0osPHSbbqd6d52h6TjfiCbFPnDpTcDISipZB5Es9qUVhdWhcP8eOwVjsNt/bz1Gu42TuTvl6kyPIS/pNzb/O6WR48HBBtiUfBdyEbEfXBECXQ4gD0vXS+btfyZRNTyG+iBzGepHAdXIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Sun, 28 Dec
 2025 07:52:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9456.008; Sun, 28 Dec 2025
 07:52:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Dec 2025 16:52:11 +0900
Message-Id: <DF9OQ9N1SCN4.H1FXRSR3FU5E@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: debugfs: use "kernel vertical" style for imports
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <mmaurer@google.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218165626.450264-1-dakr@kernel.org>
In-Reply-To: <20251218165626.450264-1-dakr@kernel.org>
X-ClientProxiedBy: PA7P264CA0485.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa89f41-465f-4605-5c16-08de45e6015a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkYxRFFZblJrRk52a2xtVnZlMGY2ZWI2OVo2K0lKQWNXNEc4cVdLbWx5ZG1i?=
 =?utf-8?B?ODVqL2ZSZlllQi9vWnpoS0hsZ21Zbk5FdzNPQmk2NXU2bmNzdWNRbDFxZ0xW?=
 =?utf-8?B?UmNxaDYxUjVTZldzUFArWEhHK0QxRnNxc2gzelVFVmFvT2M3N1V2YW1NV0lq?=
 =?utf-8?B?amlublZ4cUQrTzNCb1U0ZmZpZUZGVVU3ZkVBNzFaaVF5bmV4MG40M0hzNzRV?=
 =?utf-8?B?bENmL0Z5WHRXV3hPa1RoekF3cnN3Z2tvMm1IZ05BQ3VYUGViYmMwTTNPK015?=
 =?utf-8?B?V3NHMkJiZEx4cDlUeTRIV2FWVDVZSlRBVktMOHhBWi9zY2FjbVpoM2FKWEJD?=
 =?utf-8?B?TWN0TFU5REVsNlNoZGpJdEswTk1yNld2SHg0SHhaemI4RnRuQ3c1SWFFbmIv?=
 =?utf-8?B?Z2dtaWdtdU9EdlM4RzVYbVhFWWllUVdOd2wyWnUyR1RqTEpmaEhLSlB4Qk1L?=
 =?utf-8?B?cEc5QmljSEUzNnhGQ1JBY3NVMFplbnVuYkVUOWtEc012VVBjcC9FVUp6NWNh?=
 =?utf-8?B?RllGZ1k1VW5WRHgyN0FWU1ZlS20wbFkxSHBud2pNYmxYV3RMSHNJZ21FcXd5?=
 =?utf-8?B?Z2tiYXpiMUp0NVFjd0JkTnlWZHVlS3hMcnJoS2ZONDFzTFpXTW0zSEhUa05F?=
 =?utf-8?B?U3J6UlZ4dVNzaExLT09vdkxXODJBMkhsdTRzWDJIb056c24velZzYVIreURq?=
 =?utf-8?B?RWNZZWl0dUhSd1hSWXJDZVhUbWJxaWd4amxMelJlMEc3ODh6OFFFaXhRd1l2?=
 =?utf-8?B?UlhwczZsTndxUHVsQ21QWmpuN2xLNzMyK2hXcy9yR3NqajZoZmN6UlVlTUJa?=
 =?utf-8?B?QWkzUmZZYzFMbXgxeWdKT1BMMGpsS0FnTm80WEs2TDlDUGRLRkc0YUFtcFhr?=
 =?utf-8?B?TjZJcEJIUzlDSXZaMHQrTUwyRlBxVmZKYUhENUdrdWpBWFZmc2VnWTRhckl2?=
 =?utf-8?B?Wit3RGlVTlZrcU85dlA1L3FZZXF3SGsvelh5V0VsQmxpQWM3TE1JQ0x1RTNU?=
 =?utf-8?B?K3pQZmorbVJJZW1XOUFXRnlHWG5DODNkV3Y2SEZmSUtyQ29BMGpSdHBiMWlX?=
 =?utf-8?B?ckx2VVg3Z3pDSEpHQ3RjTWlXYmhvRmxibm15MVd5ZWdLVjRMUU5TOU1aL1VI?=
 =?utf-8?B?TDVLM2gyeDJlZThkQ1IzbUEyM2NHN01VZ1kyUi9wT3dPOGVHQ3p0VjlPQ29o?=
 =?utf-8?B?N1B4dVljUFNqc2dwT1hYVnRsRHZOTE11NHVRcGwyNmhicEh3SkxMVG80Sk5h?=
 =?utf-8?B?YUJVejhWYXh1RXlCSGRlU2dIN1k5ZXRScFFTNkQ1NTVSMGtKVGdOUElKZVV3?=
 =?utf-8?B?Smo5LzZkOStDYXNvdXRseHBvcmdGb092MTg5cWsyVzNjR1FDczVBYlBUTUdP?=
 =?utf-8?B?MXRLMGVocWdscVFqYXFmUnVQOFUzMkl5N2ViV3cvR2xCQkI5NWJaK0FEaWp4?=
 =?utf-8?B?WVJ1eEIxWDZ2eVNrMHI1SHFmMnJyMWdldVdNOHYrVXVQMGVDQmRjeklBdGJ6?=
 =?utf-8?B?V2lxSG9kQ2RnUmRqQ3dVVnVOekNYTDlpdmVUUVhMSnB5Z0RHZHg0SXlONUNE?=
 =?utf-8?B?d1NCV0ozUUhtSjZybmlzUndjUitZWEpLNjZFVnhxLzEwcXBYZktreDJtM0N4?=
 =?utf-8?B?NEh6OFpWUUpsY25pdnNMSXlLUTlJcE54MTRQeFUzbjlGTVZrZ0FnQmNteW1r?=
 =?utf-8?B?NEFCZmtCRjVCRG45NTNpM0hZL3hYaUloQjZRWXNhNDUwQTc2U0RWT0xWanNS?=
 =?utf-8?B?ZmhFcWR1Tk5JMVhJZStRTnc1aG1TaFk1azgyWUVaOVBaWWNNSjBwYTVtWHVZ?=
 =?utf-8?B?Sm5XM3FSVGQvZ0h6USt3VkhWR3YveDlaWER3TGJxQmRmTFkxSDNLbkRSTENI?=
 =?utf-8?B?SzVjU1hNSnJidUxKQ1I1UXhmNEF6dGF2OVRsb3FSNHZwRk5leWdYa2lOd3RB?=
 =?utf-8?B?NWdGNnJwYUF2bFpqMnk1UkEvMXBMQTJUZGdNU2JUSVZrQTJPR1pCcTNwbGRs?=
 =?utf-8?Q?W1alA3AxRMWmqudevzVsepCdTP80Hw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGVPZUE0czNwV202a2kyK3RWOS9VdzNIZkcyWFFlMmNvVHBYV0ltc3NZQWV6?=
 =?utf-8?B?azJRNUtKVXVWc0l5RUVKaEZ0UWU2VkpNWm9uTDBZTjlLUTZacUc0NklRY2VY?=
 =?utf-8?B?cERLbHkrUUtBZk5rYkNCclh4ckN1cklnR0pzOWltNzFGWXpTK0NkellyREFD?=
 =?utf-8?B?YzV3V0VNemRlU3orWHYvRFB5Nm5TV0daMEdOemgzOWlYTFlWME94MTZBYUcy?=
 =?utf-8?B?VG5QL29VUHg4S0FuK2s4a0NwL3ZlZlJ4SVA3K0VvM0lwUGJScnh2ejVVYlBJ?=
 =?utf-8?B?dzlWeEdTS2NFVmh1emN1WGN0dXI3RjlWTUVpOUZKZDBYd0xTVFZaWE9sOFIr?=
 =?utf-8?B?cUwxaE9vV2Z2WllORGtoSUtSejQxOFA1dE1EU1ZBT05KVE5kaW9FZ25yWlRW?=
 =?utf-8?B?MVdXSXI0ZDNnNHdrUjJ2K1FhczV6NU14cXQ1ZVljTzdLYkJtUDRKOXBKUjRL?=
 =?utf-8?B?a3lwNTBtZ1dRM2Y4V01SQ3BjbzJpSDl5bFJOdThqOFJkVkpnRjFSQW9qSW5p?=
 =?utf-8?B?d3BoT3lZWlNqd0prTzVPeTZwSkNaTTFnMkZpSExFMXlsaE50eWZYSU9jRTRO?=
 =?utf-8?B?aXJPd20xbWpVVXNJbUdJWXNIUUVML0NUdlZKd1RVaVkrRytCcjl3dFQ3KytK?=
 =?utf-8?B?RVpQN1JvdXpzUWZzOWwyaHV1S2R3T0dnRFhxRk13S3U4NnBCNkI0cUZiK2Rv?=
 =?utf-8?B?Yks3SkwwVlVBS3ZTRmJoMjRvMm8vT1NsT3BXTnBPdW12LzJoNHI2TXo5OGYr?=
 =?utf-8?B?ZHJ3TlV0d2p3SUlhWDdHWnVoekcvUEdhc2IxWjhIeFlydjQ5Ylh3VnFZR3By?=
 =?utf-8?B?b3BXSjN2L0hzWldGMWsxeU13U1dhbXBUeThWQnlRclNzczIvVXhMWk1TV214?=
 =?utf-8?B?R3NveWxLMW9BUmVjRStad3d1UVpMeXl6N0d6aWtRL2pmeDhOSFR0eU9uQkRG?=
 =?utf-8?B?UlN3KzdJY0g3S1l0Uzc2bXJ5eExhQlhreVZ1NlJkYjBVRGRuQVNobG1TdG9Q?=
 =?utf-8?B?MS93SUdhVTJBM1J0Sm4wNTlTdVZVajJaUnJwV2ZmVzRKaDNVWDJEaGxrMElM?=
 =?utf-8?B?ejNteEU1WEJYQjh3aEZ6QnZNYjlsc2dSQ0F0a1Flc1l1OWhON2tRcklvMldx?=
 =?utf-8?B?Qm9TejVlSDlkVjdnWkJjeWtvbENuT1liSzdZeldITHVHb2w3aDB5QlNBY0NJ?=
 =?utf-8?B?WW4zNkFuZ1p0SUc5emkyVzJmTE1yWVZHNzYyckh5ekhYVkRaWkZwbzVMOXFR?=
 =?utf-8?B?bDB5elRONDU3VmxUOTBLY2w2SVF1TzdWcUVJQnJtYlVzWktKdDgyVGl3QnRt?=
 =?utf-8?B?UXFJd1FsV05hMXEwcHRmeUhQNDE2TEFseWoyR2tCb1dkcHplZTRvRXVRdExt?=
 =?utf-8?B?d1EyQ2NNOGY0aXBWZ1cvc3RxRkVYOW1YNjdwOTRSVlB6OGVsZHZpYVNSejNh?=
 =?utf-8?B?OGVVSmRuWVVLL285N1U4QWJzK0hla1NiSTVZTzZiaWZoeFZNZmg4d3dzNmhu?=
 =?utf-8?B?eUhwS0NiOWplN0FKaFhhRGs2UStKK055bStHOTFiTUdxdXAwWW55Q1lTd2hk?=
 =?utf-8?B?Tmo1QVFQSHB0MHRCZkxsVlpud0MzZDg0MGZhUUh2RTFJdkcyV0dyV3lHVG50?=
 =?utf-8?B?S2NkaWZRV0wyam5yaHFRSXNlNlpSSS9zQ1c2b05MUks5WWxmSXduS054Rktz?=
 =?utf-8?B?RFpwcHNCK2dwd2diL0svNEVnU25nSVp3akhQeVlSU25CN3dINmpJUVMySE1B?=
 =?utf-8?B?N2JPbm93bG5hYmp3V1A4WGp5UStad1FjbXdLSWo5TEo2bnkxdFhOTG1JMDMx?=
 =?utf-8?B?bXRtQXJSTWt3YTBJRDdKWlEwVWFSV1N1UEx3UTFyK0I2clFKYnJWRHlUUlQ3?=
 =?utf-8?B?ZjVuK3luYzhVN1hPbkZqb3ZHeDVOZmNOOVpDYWlSU012WkNUREgwYW1XckZF?=
 =?utf-8?B?MkRreHRrNmJSTVJJa3FBcXVSa1oxQ0ZvRDU3Tm5ScG40bzNBT0pyTFlXcWtn?=
 =?utf-8?B?U2Y5elBQM1piNkFSajZQbmFvT2FyZEtobGh6RHpma1dWc3crVTc4cVRUNjRp?=
 =?utf-8?B?amQ2VDhjcUVtZVZYYXRkWWx2eHI4R1pvc0w2WVd0VW9wL0hPTktWSWx5SHFL?=
 =?utf-8?B?a0xYY29VY3VvaU5DK1RYWno0NzBTZEtMNUs0VTFzNHhKTTFFZVhPcklIY3Bk?=
 =?utf-8?B?Sm42S3RwOHpTc3FRMXcyaTNocG0rZmttcjFUZ09oSEZmN3ZTOFpuQUhzcDBL?=
 =?utf-8?B?RmdaZHdHZXBSMENsZ2lXMXl5b2lqSnRMNlhOS3hva1B5MUQvY2NFb09vUHJM?=
 =?utf-8?B?QTNFTnhURTRPYzhXelQyMW1EeXJXd0dxTmtwWjNpcU9kdjRXa3FBQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa89f41-465f-4605-5c16-08de45e6015a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2025 07:52:10.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Z3gS/ODdIE4yHrJYMEakCvJqKwSK5AsiXdeAnkpHbganq/DTD/fMPqJdySLLQo7rpDBgfIcGqQaRIRP/waoRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782

On Fri Dec 19, 2025 at 1:56 AM JST, Danilo Krummrich wrote:
> Convert all imports in the debugfs Rust module to use "kernel vertical"
> style.
>
> With this subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
>
> While at it, drop unnecessary imports covered by prelude::*.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

