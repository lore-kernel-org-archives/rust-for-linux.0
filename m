Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA97368940;
	Sat, 28 Feb 2026 05:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772256841; cv=fail; b=bDTBBFoXLU/FnWmUH9z5k0HBWxm0sEOBtWZmii67Tw6aHw16JO8Ep/rWqNOyBgE89Ig/bO1a2PAYLlgOHEgXw2qBWrJWbc4MZfmatwB86GAPrDuoaHlxeRIOPGM5Vb7g/qwuN13B7g0Pv8Lmfjr6kt58Da1zmLO/7w7jT8iRSvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772256841; c=relaxed/simple;
	bh=aKUQagb1OGHZZ8PfT+uxWnN5zazjkcsukRyqRNVI2BU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LCSOpSRfADwLasexUbtWZKYVORoJCHh+duslgjUFY3zlyBnE+Djyew90EpIGyRwRqNS4n85q0vzxPT3YSsgF5dT7tP5+r3slkmchFgqozDCsq4ZcdQ/CHa/QJfmmZZ6R3tftwpa8LThL0zUHPSvgis3gSJVCR188Cq74MoKl2fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nhd5SpLn; arc=fail smtp.client-ip=40.107.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nhd5SpLn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVZUvctywO5Oj3B+OCIt/+8Bp6WJ1c4WLdUZZIMH8oFZYy8kT2sAF/M55gdIHZ99bX5PF91avTZM9ltBRMJZ81OIMNdHcJRoJOQHvL+sL/ilQusKuKvKncZBrCZcZf3MfE+WM6I6RQQfYQRn2gqfRUuJy0U8cBgoa4L54rdApk6ip67HlZ8pCC9F0YDb7w1I8fCuiKdgKc8FSnyev7s7K0P4t4RzAhVicVv5nWo12Qacrg+olmYycofY+s7FSnx5Jib9IedVfg+EFcFlJiVHGwvRSMunvDBLqqwGRP+3UE3sL3MfasBlTJaanEZaIOLARbA/RlVgTOcaq4ygfdWVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKUQagb1OGHZZ8PfT+uxWnN5zazjkcsukRyqRNVI2BU=;
 b=p5ebDxgL5gNC11FuhGc8AdP9XSCfyGULqolb+2eejFulgpr4islgnl1zGSdZq8VSWj+rtJxm/r/Cu5JQRP6w2tegTArcgX9CW+Uk2pYRvA3Iyz5BnAXwJQx3RDYWd/UTB4gaz4cLWtF057Boc7MQNLpdhBtYdNxJO8j1EbaH+pje1wV3KQyahTRo5JhhNr8SR8XpZbweuW0nWK4Sb1j82Z4VTwVnefPSxDCe81sirFN3ljVa8Fg+DJqzksEdKPjiIkfZJNmXUfzf8BSxvep9GU9nwQbJ2waM/ucVPFzc6LbxSqwn2Ne4VlN8nGSBCtXbeGqkgaIagrQYtDJDD+pz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKUQagb1OGHZZ8PfT+uxWnN5zazjkcsukRyqRNVI2BU=;
 b=Nhd5SpLnWH4QXKAGrSdIb/UQ00DhE8mlSnTjFHvEpWvIH4i0+9YbrM3wgs9/eEfacaMkMv/EShaRFMs7QkJgwfGv82AyWEfUPWPFUcZgsUvchZHVPGLkExsUY9lDBz1SpagI8U0YqHSZEUFl4LkHTKPhy00wUbsvGjOPyZJKOfB+tx8OSj4ehS2rzJpMTp3WJ8TskQtusuVjdRhHxeX0v/dIhQG0zLWrKKO2s6WHocCChbTW+X4hKxjmTowiZyfFRVswQMkbTvANY7udN3k8DU22id/ZmYqoE4eHVA0OMx4zI9DAAlDqT0wtZhPG2erXCq3dSBTwkd5dmRfoz1dXKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 05:33:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 05:33:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 14:33:51 +0900
Message-Id: <DGQCM4WAVVMG.3717ROA0XJVX@nvidia.com>
Cc: <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang via B4 Relay" <devnull+y.j3ms.n.gmail.com@kernel.org>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
 <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
In-Reply-To: <DGQCKLKCHRD1.25W93SR8LJ87H@nvidia.com>
X-ClientProxiedBy: TY4P286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: 33fe0592-cf39-4cf4-ba45-08de768af6d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	/WVWEp/J/FAfQqfABFO4inzP9bgMlt6raffuda9keK6+SKMCviltLTTy6b/2/GrqZxmhp3nOqvGpfJK1pq+TwLCcYwzS2LbTOWNFaYszo9+wP5nVD2GjAsG/GBkpop0KFb85NGKp1wDrqMchM6Onao4Emgv74tGvKO1fEYS2V16FTiBcukVfKpaWozumfdXQlxgZyTv0KNLmmvIjRqKigll9Kk/v1RacpcMopw50x2lyAVaFqO4+Xxp+UN9fhwm+vuMlq5J0mrygYOGJh0QLUWryaDK3KvLVGHl5UTzhnQI/ksCHt8Q3GW/W/CjEm2HFOXXr87/Lr5LlAWMyW3A/wzZyY4FXC2QLN6KhJQR7lSYZWIYK98Ma0d6sackCvfEdS/m9UTdvEVUpLlD0Br1pptfmlKmWSX+t0KEYOEBaTPWPoPHPbiJ6FKLH5g9x0s5aqE7C8YhMoDurcuJIeiC5TAfk2JJRZZUoJtvJmlrlEoVXzrHl6dJnPXI5u2KCFNespDED1tUDa2hYb73DveX4at+B6QoLM9+0HtbtlMeYUHzHYJDG2ARS7TWplwkI/VHL6tLi7RUNSsIaafmJg9ct0Qes1To3VUR2qtn0hQHRpicOpUhZnX+prifOnpYAxgHxZDH74wDSIsfQ0F8fqTzbyiPx2mZ3d1QZ7MqxG2/suVDnOyCCt0/iQVChnnemFybQgSqLTx3hvRXYOAM0QISo9TfMT6b8VN1Olz+rLRLtirs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlJGTHhHcHNkakNpQjlIL0VKZFh2WVZ4VWhiNFJna0UyZ0laMHpjQ2EzaWtL?=
 =?utf-8?B?ZTBCUnBKVGpHMmVFY21XbW1LdldkeEhVenB2N3VqdVEyc2Rxb2wwam1ZRHdM?=
 =?utf-8?B?Y3lpVjB0UTRQN1ljRlpGMWlTQWd0UXNUcGloUk1ZRzFhVHBiSWVIc3VnRVAr?=
 =?utf-8?B?VXQzSDcyZHF1KzVxaVVaeWR3WHFYMjJBcjZvV0kxMFIzeEVFMzV6elE5MVJI?=
 =?utf-8?B?b0VBRmZsT3E4ZmV6RkgyVE5rVUJSZWVKN082c1drSUlaYzVWTXFFNDI3TTM5?=
 =?utf-8?B?cFlJdTNubkFjekRRS2d0MlY5dDYraDdtNDhHYzVkeUs1V0k1dFg3VVI1cWdT?=
 =?utf-8?B?MVl0VlhMeGRiYmR2dUU1dG04VzQ4cVFWb0VYeXo0RGpCaWMrbmNWSit2VHVy?=
 =?utf-8?B?ek1vdjZhVS9RTUlmQVBOL0xBVXRlVWUwZFpiQkd2KytRL0JGRHNna3lEcGE0?=
 =?utf-8?B?L3ltQjkydUZyYmV4TzZSWDdGT2xKTHIzVnRFdjk5dkk2RHA2WFVua3laQ0la?=
 =?utf-8?B?VlEwSFE4L1BqWWVXNlVJd1F4cnQ4YW1lMUZKZlhSS0lTUUIwbGdEQUNYYVBH?=
 =?utf-8?B?eG42VTBnRTZSWEM5bTM4ejhwK2NHY0FlUkJRL1ExRVkwN2ZrMjVLRDlzdHdW?=
 =?utf-8?B?R05kVXF2bU1sWGcwUXRJM2MvdU43dFBLQlV0d0FTQ3M5dEdsbnNZdEZoQXdN?=
 =?utf-8?B?U2VLcmRZRnJlTFZ5Nm1QNko5N0I1YnFweWFVOXpkN1NSZDBWMDFjN3ZGMWJD?=
 =?utf-8?B?T3NiT2dnVUVZazBnakNMTElJWDdra0VlVWU4aFltLzY3YUFZa1BuSDdadmlH?=
 =?utf-8?B?OVNDUmcrS0pNdGhDeFJaK2hvdjlkK01ZelJBTU5hWEV2UzM4WlY1ZGZyTSsr?=
 =?utf-8?B?cDN1aks4cVl6VXoyRlJwTFVOVVRtL2N2dC9YOEo3MW1tcHRCME8rNHlKMjd6?=
 =?utf-8?B?L0V6OU9GNHZjSXliYW1HMFl2NUR0NnFUQTQ2eTZyd09UTVlwSVRWZFdKaFZY?=
 =?utf-8?B?Ti9FWXRmbzJGWkhoOVdhNGJCaERsYkFMbC8xVHBHbVYrYVdwMTg2ZmdZelUz?=
 =?utf-8?B?RVlUMHlPM3Z2OTZUWGd5Zkt5b0lPZzRpS2hEa2tBb3NjUERwZjdiVlBJbXBs?=
 =?utf-8?B?S2ZnZHo5U1lLKzd4QXliZTFsakpDMmJpVkUzVmdxdm8xc01abm9vcGh4WGYz?=
 =?utf-8?B?aDM1cjg5OVlFVGIyK3ZtTng5WkNaQ29zZlFHTHdEK2NIcFVoLzBQUUp6ZWNx?=
 =?utf-8?B?amxhS1BZNm0zWU5pVTYyYVd4MnhvbGlaMGsxenAwWFR6Z3cwekpUZDgwMmd6?=
 =?utf-8?B?S1ZjeFhMQzVscUdkQVMxZ3BUaUJCR1dFdE0vOUdRaHpNRE0vZUYwOUJOZzkx?=
 =?utf-8?B?cnR0dk9wNEhmUkRzYUZGTmZ4U3N3WFEvanY2aHBQSkR6Q2hmbFVyay9IL2VY?=
 =?utf-8?B?RmYycWhKT0lhU0VSaEJDUlNJQkx1S0J6VGMxNTNtUCt5T1RMU0lXdlVxU01K?=
 =?utf-8?B?dlMzN3ozTWdFMS9aZ2t4OHdiVjlmUFBFZWpWOVlQT2ZZVVp3OERBTjk0d09z?=
 =?utf-8?B?TlBBWHNYV3BkZFZQa09tdEhCc0E0RU43MmNYamptc2hRWUVtd1JibGhpQXNH?=
 =?utf-8?B?NEIxcUJPSk5wM0MyRDBVRUlkOU42Y2toV3RQQ3d1NzBxYWRVMWxrWm9aZ1hq?=
 =?utf-8?B?VGZPdG1xbndwb2pHOG5meEt6emRTOFE4STRmUFMyY1pPeWVRNWxnaGx3T24x?=
 =?utf-8?B?dDgxMiszY3RUdU5VZFVrY2hVT2QzUC9DajMzTVhUbXdjbkNzejdVenJrWmdw?=
 =?utf-8?B?MFE2WXV0UWRaalAzLzVveTMydVk4R1ZxTHgzV2JGUXBodDA1MUF0TWorbDFM?=
 =?utf-8?B?Mnc5R3F1cjdqWUdTNmlYY1ZXaEhwZDJFT1JxUllqL1haNzhEWTVzaWlDc2JC?=
 =?utf-8?B?eGR2aU1iSWh6M252VHBScWtXMld2RE5BblYwSERrZU0yeGwrU0J4NEhwV3Nz?=
 =?utf-8?B?ZmVRSC9WZHV1YVBscDcyeU1LTDkzdWJjcDV2Yk8vdjBqQWUzR0MwT1IrTjNL?=
 =?utf-8?B?ajhWcjJuZjlsUzloVlN2N3VETE1IOGlMT2xVQXBZekgvYnBwVVZVaDJkSEpZ?=
 =?utf-8?B?QmNhUzh1cVRnU0Ztdmd2Y1E3Uk45ZnBVdm1lVFNBUGExczFWYXF3RFRpMzJU?=
 =?utf-8?B?Y0tyWmIxVXlpMExiS3pESjNhS3owSzFBVjVxS3o1cVpqL29ud085emVvSWRN?=
 =?utf-8?B?SDBlWDBBeXNadlRYNWJFMFpINGtITlhvWUJzZ0xTa2RTNUt1dUIvZ3hVQnZi?=
 =?utf-8?B?N2taK1V3UndEYU4ybTM0RlhEQUU0NS9jVm5rTFdZQitJeHNKZ3dibUw2Y3JC?=
 =?utf-8?Q?dOzSJX59OWnv3chLK6fYGw0m3D5LpmcFjhkB8IctF7QWi?=
X-MS-Exchange-AntiSpam-MessageData-1: fex0yhaf/92kCA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fe0592-cf39-4cf4-ba45-08de768af6d2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 05:33:55.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+sTtyyxHQ81MjnlSf3/rwCQcyTpBHjE6t242qmZ0ZfeqACJsmW138UQot+h+/v4QajhenaebMI8r6+ClGHhjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195

On Sat Feb 28, 2026 at 2:31 PM JST, Alexandre Courbot wrote:
> On Thu Jan 29, 2026 at 11:32 PM JST, Jesung Yang via B4 Relay wrote:
>> This patch series introduces derive macros for the `TryFrom` and `Into`
>> traits.
>
> FWIW I have converted nova-core to use this, and this results in -200LoC
> delta. Obviously I like this very much. :)

Forgot to mention, the commit updating nova-core is here:

https://github.com/Gnurou/linux/commit/27ef02934a34a88a26ac117b7a46bff85d01=
4c0c

