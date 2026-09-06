Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A48227EBC;
	Sun,  6 Sep 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788708330; cv=fail; b=TduVVgyjo5vSk34QVh6NAg4JlIdLXgkVPtwKLSL5xfcplTLMX8AfdNE/MOh3AXiGKpJz/huxTrT64IXwqmqsI+pqR2qhFTFchGgUtrO5jCZiMThRZhahVJBf7ZpAFnVhcxoqwfiMwdR8N3Q8mxCbRvTs65+BvjIo81+ROn5llw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788708330; c=relaxed/simple;
	bh=4KpNz/uic+6hNEY9Men2i+XRtLkX4QORwqD8sVMOXxk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=O4QlPaHkDwToSC4eBPwixIspjzUjvALQYnQlfXteWyoof0J5giuIvreOQ2jPykok0F02EUTybMly2mYMZFVk+AmPOjGLiXtGBqecl5JZTZJ6Rt9Yris2L+THilgiJT9bp+3DoZRDG+kJkNFTnAU97IpER+qRKPTOnM7SskWTjnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D3NUwf7I; arc=fail smtp.client-ip=52.101.43.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D3NUwf7I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKwLbCeRIo0sGbJBJuqgQI44g52nOve4NPgQH75Dg+EAo5ZgEmy/UVQA96eiyU6blk++yf8wICknOtUr5IvUbQ7JBrQ2rSOlsSIGzGsB8vCLbfbFslG90/v6rm9kMv0o97Bl0vPKxa2+QuIjwdxiu+ygiY4Ssoi+QdKxTlTHSxifQnyxpK5NkLkXZ4+10RztCvQcsZDchxBjbkRthOMs3htGwPO8HFHCMGPmo+wmm5U4ppoHDMSNeiJxqzkZQyybgc1C24O4Uz2H7jcGNCfOYE/OfDbJ9+K+gz54G7ug+LKAgfPiITZ2ClJ5bOxZo6qqUvsUAFrQYDkXA7hZAH2BAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KpNz/uic+6hNEY9Men2i+XRtLkX4QORwqD8sVMOXxk=;
 b=o2mjw1H3zRbf7WGPIdx5jI12qmUIo7UkIbuFyE3ZOMSmFCl32xcNPjkB5JaGmYiAk1AuBsidmfbOAG39EhjAWd+e8oSc4WN0GN2bjwtPpOe6FOs2Nm1PU53WwDOaAIbeqbIGRHkAgmjS95cQw+R8+0TQVA7uIrLBR1kApkQRgB2Lt5xxt2hjhBEaQlQ5WUc8i2l334NfbfFcTO69niidNn6G4A1NDMUaKsLBb0weDW3UuHLmEfrc9f77j2pVTTWS4llSaqpS0HVuu4oaQghmlKjIsBc+/cCbAjfdETkvYoS8tAcXFPZlhTkQVXbhtzpWYo/WwXAFvWcaQgJ+q8scmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KpNz/uic+6hNEY9Men2i+XRtLkX4QORwqD8sVMOXxk=;
 b=D3NUwf7ISrhU8rOb6A0CJhY7s7N/d9WLe0s8c2+oinBi4FDIutFVoD9QKfzwmC7dxnhIF8Vs4aJP3ND8o+g1cmfDmgolfbKSxlDWF9yS4kuxq+VLkK7dcCVEqL0cTmgwqKOr3ZqNrdF8AKxPdQ2Dxg08BQz5xbDkihMazCoXgMwWpgIzQ2l0jaMD3zmHuqAY7nAGViGYubC+kTJJoaCnlIocmjxFNxGEbka4Vv+bGkNRf8WzkAxexUKN78lJV+9IZti0jluWCV9C5e3+dzIZ8tiCDM4v7MUJnJW6UIioDAnU+NuSjVuBy4ChX6s+4zGojEnpsqVUhxVIPuV89HDsrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.13; Sun, 6 Sep
 2026 15:25:24 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Sun, 6 Sep 2026
 15:25:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 00:25:21 +0900
Message-Id: <DL8C6ITS18M0.1OGHNCDB165RX@nvidia.com>
Cc: <git@younes.io>, "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: num: document why Integer is sealed
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Younes Akhouayri via B4 Relay" <devnull+git.younes.io@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260906-docs-rust-num-integer-sealing-safety-v1-1-78057391302c@younes.io>
In-Reply-To: <20260906-docs-rust-num-integer-sealing-safety-v1-1-78057391302c@younes.io>
X-ClientProxiedBy: TYCP286CA0157.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: baba4eb9-caf9-4227-d732-08df0c2b124b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|7416014|1800799024|376014|10067099003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gRUkGvHO0+HuWoOOahm3cGBQ+mPan82mSjSxg7kxk1IS18FEfwFGy7SThVQImIDLLCHfc/JTG7qJs22IUGwbtKePjPRPCCetLg5852ICr/+YQ9wjda4tG9f31uhWVEmzYkRyKCMuWZzBTr6ZVT1bRo0Ogv3uoF44223BE4LCkFIE4M2QanqsWL5yZ7C+xA+EBH+C7X3rReWaZ4ZWVfOsUMygird30qvlVq+qtacCtC+W6K2bnfB6AC2ZSXGj5rD9CsqiCe+noabCIKQHgLkb5sqy9CLrPJB7vNlUhc7ziCe0FrLd7Te13YWD4MPbMzPgKpOM6hbcULhuucCb+U+4rLs0SNW7Hwk+cYvuAG7y+P3IFQAOIcrP+ONhEuV6dg4xdv8Um/OEnjBYeZ+BXPZpHa8wyKIOyv4Y8Lp5bFTJqYo3B6dG9gKemcpWZbWrkv3JBc1kA/RE2Uwb5cxa0NDD2PT7H0g3tty2hICbiaNIKqKx8APgzD3X8v32s/ruGAO94lwtoMmrr9mCxegaigEdg8T3c54Vw9QWdVTAUfU2f7gZmTFso6prhFhnUKc9MZYbLCf1Rq6A1hLg3zacQd4vPjA4YsB3xPoZAG+Q3IQEjJypC+3LkQNRwcixi34Dmv9dK0+7VXZV6WyzsJCr4Eop+TjLhRzhE24Ij9uCITmLGyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(7416014)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmRUNFArcTJ1RXYybHM0djZBN3ZsQTFpeEFlM3d4RHBzcGtqWERJUTRqZCtN?=
 =?utf-8?B?a0JZdEdZdjQycjlnWnBXUnBuRjVvVmhFeFFRaFY0MFcra2tFMXpqbVFCcnMy?=
 =?utf-8?B?am9Ma0JXVDRveGJ6cGd6Q3NqNDBVWEtGcWhmdXZnRkRiUUJuMzVEbUFIT1NW?=
 =?utf-8?B?VlVOZ3QvUG5hMUNyZXEyak5CSW1qbUpzYW45TkhRc3h2SzdTOExTckFBbWI3?=
 =?utf-8?B?emRQbWQrTlJyYXZKZGMxL00xOS9GZXdNdklrMWwrZE4rSUZnbEFkbzhzbnFT?=
 =?utf-8?B?ZEtpTEVlVmd3UHQySXArSGhHeW9mRGdMclhYSUtsVUNGR29QaDUvendNUlFB?=
 =?utf-8?B?ZHU5eGZIS3hHMmNnWVZUaG9tMWNPQWZFMXhCOCtrSzhSZ0FGcm8xdiswaEpa?=
 =?utf-8?B?bzlLREdiVlNFVWwzcXQyU1BzTmo5VUhqY0RrMnEyZlhjUEZZQm83V3FBVjZC?=
 =?utf-8?B?T3pZeVdxM3VlS0Jsa05yVHptQ1h3WnZ0Mm9wc2s3d2xyR1B1MU9wME82Y1lG?=
 =?utf-8?B?MklnNnl3dVBPQzhrM2MySXJya0w3SjhTUGNrSjhtYkxDRXdLbkRPalpJL3dI?=
 =?utf-8?B?bGtEQU5xaDErMDBtRFJPTDNWZTJUNm8xaHpUTFpFSjJXWmFqSzI2dFN0T3Bh?=
 =?utf-8?B?aVY5K2lPdSs1TG11bllJclZ0c0dxVTJ4VHppQlhIb2xhcSs0NDJEQXNjcGtl?=
 =?utf-8?B?TU82UHhQaUhvOXVDcWYvSzE2TVJTRWF0cVBJbVo1UU9RcnhKcnlYaFhrQWhZ?=
 =?utf-8?B?S1NESnlsWW9wQ3hKRG84UkJBWlBLMGszSFFGb2I2Y244NE9RQ2tOYWhCVVMz?=
 =?utf-8?B?b2RFZzVKRkVjN1h2RGNIL3JUZHQyM1Ava0hLbnBPUlljdjBQclQ5bExDbEhK?=
 =?utf-8?B?UG5KUzNSUjNzS0h6ajlsaEg5RCswTVQ1cUJmSkhEVCtIUGZmQTgxazJmUFR4?=
 =?utf-8?B?QWFUdkt0dUQzOUNaVG9GR0orS0svc3VBc2pCS3B1OVhXM1JnOGtBd3lKcXpH?=
 =?utf-8?B?TnlrVnlid0lpeXF0d2xOcUI0NnhwdGRTR0RTUWkwQXYzOFRrR3V4TytyOFVm?=
 =?utf-8?B?S3Y4cU5wRzBLUVFKS3QxbUgwZGEvNjY2YURJdzRqemZERENKODhmV3RBckNs?=
 =?utf-8?B?MzVkZ0Vxd0pMM2hjTW1MTEJZS0pvZG1sMGIyaEUrU1lIUjRnZ1pNbEsrZitx?=
 =?utf-8?B?NStEa2NQOUdITEFoNVFaY0ZMUFIwWGdWVFlITDR3RmdUcFowUGk2NXJ4OXpy?=
 =?utf-8?B?bkk0QXBYUGs0Y0VEdGRkNW52UVVlOFNiZkszSDZoeG5SMkN1bUljdjJmUWxI?=
 =?utf-8?B?UjdNa2lOV3hJVDlRZk5MV0JLOFE1dUpSZWQ5cHBvK255NmFNaEZ1ZHRETHl2?=
 =?utf-8?B?MUFxTGdCS0p0SS9EQXNteDAxdnRYSkZwM0VtQ2o4TWsvQlJOc3dBeG95bktR?=
 =?utf-8?B?VmFIZWNpU0s4T3BmVkJOdm1ORjlVdTVURnlpV1FGbTNBa3RuNHVXZXlRS1Nq?=
 =?utf-8?B?eUVFMFVQNUpuc2lWcWxlKzF3dG10UkRCaW5yTVNBMmQzUXlMZmpqemZPeTZO?=
 =?utf-8?B?VnVVb1BRVEl5R0wxR1VyK1dFQVhNSkxtSUxBTHFoOHZsaDVrMXA1UEtEZ3Vj?=
 =?utf-8?B?dXZqMzF0a05ySk9yanl3dGNnY2UxUUhaZzFxZTVrUHhJTFdNbzlGUFM4bjZv?=
 =?utf-8?B?NzRLaEltRW85UGNrY0pkUEdESExPRUNCbEpFaEhxWDgvNzZFdk5YTnEySWg3?=
 =?utf-8?B?d051UWVyMW1PUW5zYk5jMG4rYndNY0lLRlBvTjBHYlluYlZib0VYY082NmRt?=
 =?utf-8?B?WDQ1VEl3S1loV2VkQ0pHVm92dGZ4dlZBNHJETUJjbS9DZnNXU3pvQk5nMjcz?=
 =?utf-8?B?bDB1eitSSmdOK3FreXB6RXRMRkpCb0Qzeno0YVcxM3pDK1hLNzFsdDZSR2sv?=
 =?utf-8?B?QkhmUGJUYllHMStrSUI2cWNKYUxBekZOSGQvY3p1SGdkU0lhOER6NDllNVlu?=
 =?utf-8?B?OHNMNkc2WnZDZWV5ZGE0OWd3SzVGL0w0YzhOYkphT2hQNk5kME9qem5yRUhS?=
 =?utf-8?B?R3FIYmdhYVlrZjllbndIK1VremxHYnczWER4Ri8vWURuTHdpUm9PKzNhQmIy?=
 =?utf-8?B?aWtvSmlIblFkbER2b1NKZEtGNi9LUC8ydFU3bmdZdFJmV2FBODNzdUFzM25I?=
 =?utf-8?B?Q0hMdzdOMFBKMkxFK0E0TzNMNFBOQ2MycHl4dTdtaFRYMU5KY2diV29XbXVz?=
 =?utf-8?B?RDRObmkrb0JzOEFPOENWMUhmT3F1U3diZmdBNzRKaTV2M1pheU82dS91RmJP?=
 =?utf-8?B?SnYwUXRZU3BkRFljYUE4WTBXbUxSb09Qdk1Td0YxQXVSOHhuVVlSN0Z5U2Fh?=
 =?utf-8?Q?ukikTaTpK7vbM5iUEam1ecehns/mgaJ8o5SwSPYK0Nk6A?=
X-MS-Exchange-AntiSpam-MessageData-1: dTQCOubkvNmMjg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baba4eb9-caf9-4227-d732-08df0c2b124b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 15:25:24.3053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ApWtWVoNcbMnaITjlPio1Vp3Y3FromMe5Sp4EKTWd0hQkTtIdGlwsXjxl7uBXxIg3LIWPcRzVsq1HIhN9SadA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

On Sun Sep 6, 2026 at 4:40 PM JST, Younes Akhouayri via B4 Relay wrote:
> From: Younes Akhouayri <git@younes.io>
>
> Bounded relies on Integer::BITS and Integer::Signedness accurately
> describing the implementing type to justify unchecked operations.
> The reason external implementations are prohibited is currently recorded
> only in the commit history.
>
> Document this safety requirement on Integer itself.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/all/CANiq72m8kycbfQ1teyne-OtB5d5TsUcX_WW0FC=
kWB3Ayyg-qWw@mail.gmail.com/
> Signed-off-by: Younes Akhouayri <git@younes.io>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
