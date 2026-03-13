Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012038.outbound.protection.outlook.com [40.107.209.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF08D31717F
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 02:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367860; cv=fail; b=YFCARAr89cxSqkF4s0bQtKXiCyw3vKDl/DwF7d8DZxyU4eEwaAVzAJQDnidUCSxlflXt2AL+LeryRWmH8OgJxkEgYIICquyYvAXJSNMrJCBcY7buDxy4BU0QJ4WWwd3MU0tLqsKN4Y0352w1JaI5ANXctRGMVPUfJ8mMMuYO2J4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367860; c=relaxed/simple;
	bh=4JyP//QNwWIEOBeYQ8jL9wk71AnVHN4qYimTUjExyDk=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=RGLkJg1IwqObIhb1/r9vd8Bb5JfNuCsogP7BO/g67/VgT5Iuq8Iy9NEp+hjyGK0srIZgaaQV9gXmektyP7thmPP+U8HCQ4ahDHOTesA3YVIlzXKFk0uz8TOzUx8eV6Y883/8lXXUhncj+UleBShKIhxC2qQxphtSLGVNPoljXkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rfEgDqcb; arc=fail smtp.client-ip=40.107.209.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rfEgDqcb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yw8kojBtdhNUtsE31EWkoL0ogpDkKz5YXrWQBba+93aFtpGdmrCerVQ0VMIOdCZFWwjzQtPprBQR+G+DjJY4cD8GHVn4DsasJK9ihKsPari0MII6pOzjfTwlKeWqj8J3DOCsjP4mu5wW0V1+86PCVnR8WAcf6NG+EqzpfURLIwMKYzE3qmDfjZYWa40I0vIka3wSmalWHBJ/cEGXxunI7nHz5lzydKLHLx1MsI8OdcrqMC511WmEt3tG9McjSn98e/DFGHT90Q1QBVNkRJqcaMnITVgn54AFH1+od8oVAzFSHdN4mjZFABQX0/k5EMeRPuunK2E6td1ZzKPV9wxT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JyP//QNwWIEOBeYQ8jL9wk71AnVHN4qYimTUjExyDk=;
 b=oJuTQ8stVW4dVYYyfv8J7HoUotrDo9zxlLsmnd0+vVW8xKpdf0YMZA7G9W9gbqZGz/4R9G9R6vLuBM3bV1pSnhzFFvv4h7QQ3IBuxrUTbpARGEFAw0ffdQ18UniIYlTilhhhsTRj6PwvLL/xaiS86mklraPR2QcziMjdEy+JnZpGbzVbyjxi/LLG7vMMsMS+AGgoxKWd8/sPk4YVGJRtj9kJLn3BCFWHdh0RPaKmzvNqRkpHRmlNUSuQNjLjtPovVJTD+K5bymOFO5hSQZ6B8VSX9BjUF6RQ1PhcYT7SFneDID3ifoqjMzbY3VdFUPWXeI9txYg/oL7/lHR818evMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JyP//QNwWIEOBeYQ8jL9wk71AnVHN4qYimTUjExyDk=;
 b=rfEgDqcbx90u29jV4ZIdK7wYo53bQZXHtrl2tcz3aMRGs5opkUa+M/f63Wy447cNmpg9QnuYupNihM1wTqbSawUTI872QvY6DZVd2jQD3rh8C3lQK5gsg49V+U6swPgaEDbEpsYHXzxii++8KXtMnsptn0zw7xDR/q4lmNNOwVlG//d1GKIdBB809JCUPCwQvp7JSzNb4NqrsVRnjunaCOmxdSI5E3kDUeik7smBJ70M8H5H9zfyxwKX441A+dBN7n1k3opeRuTQaI6xS4L9ESD5n1+Hpp2ZBpuMSRNKX52ENJ8nBy8DUJQMc11maJ6Dn0lEt3vS7I/VFgJtOsKzxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 02:10:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 02:10:52 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:10:48 +0900
Message-Id: <DH1AFQZGHDAN.2618JA3M2OE9P@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 <mmaurer@google.com>, "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/7] rust: device: add device name method
Content-Transfer-Encoding: quoted-printable
References: <20260310220000.1897166-1-ttabi@nvidia.com>
 <20260310220000.1897166-2-ttabi@nvidia.com>
In-Reply-To: <20260310220000.1897166-2-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: acfa2d4d-276a-4019-6081-08de80a5c0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qJzsY3uPBqDs3DriQ5n8cHmZUj2e5kh9AP42gpaxFsBWTnl4mc9iJTA9/JnFoU9mARwu9NZdO3gc/ymuD/ptYOHeBxs4XlbQqllvxd4FD9K8W2+gshi2JX8i3+Yfd1xbl3tTKloNWDA5+ZB1zbS2zT+6QZoB9Qs0H0qnpBsm8868WBY9taB3kc2J1jvwwjyzu5bKt8zTovUHo/XTZfb2qM/CIJx4khnIDrSle+ReqmCxzcVBClcuNMLvrQmv+YmDbUdHR6bP46ZrZanxjOa8kz8UFByFF0RTEY6T3XpTRsTyWDjBwOGlqK57OyFJXDVlbd1qULrx43oH8ugkhtmuyh+4b+BqZ2rOh3Xh97DiP0c9YUTdBfuLYVvX3H8xQM5b1WAFSAxAazhu8E94Zd8RgmlnSbN8iuMKy9VCOLCq7SHJnlFEgAt4HUNmY/lzpUE68fzJS0KzsaNwra4NJ6ZhN1u+zjA/Sa0u/Jj8rsXaP8rujLoHyDdTp32EXCoZW4s8xYVisg5lSAjqvxWcUClstKZwGCNuyA0BI1/IYjWuPAgUNblFmPFqwi6aSSJNc5/JjmVCOdnANWRysMh1MoM8tmv8wZBWUhbbvpr2MDLRmIXvwXthsNYwzunuG4Q4Fcp+HyW04bo21JulUb81dy/kZF3R54TkSQwZ+zfKBVsgKmi/ODRNeob6DzbgnLzOm4mDaXYAGiaGGxRexS6sIyvlxJX+RhcZOvd/7jdQBcfQ2P0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUFMRUdMTjVxdzhnMXV3NUw3bjVZaGZNU3oySWdLWGJoenBBUXBDOERYMytX?=
 =?utf-8?B?NFJrdE5oSytMYVpQaGJ3T2ZZMHowN3o3elF3TmNwYVU4bFJmQWw4bHdON3Nw?=
 =?utf-8?B?a1UySm9LVzYzQTZCSWJGenVzSkM5V1hiZ3lXOWhBeG4vTnhjRzVXaVZ5Qmx0?=
 =?utf-8?B?dGVITllFc2pTWll0Ry9uSk1KNnFtRUZZNm9EZDNOOWZlVS9zbDU2aTBvU0JN?=
 =?utf-8?B?dmRVNVVKODRralVyTmtNbmhrTnluU2dqdGxyLytUU0tyZkJkUEhoMTZZTkxR?=
 =?utf-8?B?cnM1ekJkRGIvSnZiY1JMYkdXS2lYVFJxN3g1eThzeWFDMC9nQm1ramFDcUNw?=
 =?utf-8?B?V0ZtVHBnSXZaTTlhZ1lLVlhyby9VUVhOTmhKaWxiM09jYVVXZWNpRmJ4NXh6?=
 =?utf-8?B?QTd1T216dHIwUGpvM0k4Zk1rK2hXbnc0Q2p5UGd1TFZ3MmViNkc3ZWpRRGxY?=
 =?utf-8?B?UUd0MkxDUmRCUkFDdjR3bzZtV1cvOHFZTmc2N0Nxb1kvZTJXU0Z0Q2pBTVc5?=
 =?utf-8?B?SFltYnNjMStld2NxUmM4RU8zcXpmdExzY1V6TXQ2Zk9ydkFlalBWUHhVTVVY?=
 =?utf-8?B?NVNvWW9mZXdkR2JVZUo2ZlRoZjdUdk15emVsdUczcTlVQ01mZjRqaUROYnBD?=
 =?utf-8?B?K0hDanUySEIxd1UxbWtkR3lRQUMwdTNBNnF2Y3pFN1JnbEY0bXJUcjZlT2No?=
 =?utf-8?B?M2NWU2tuVzRJNUxKUlRoOGZFRHBOd2RLLzZ5RTVjd2tsZnZiZkdWVit5cFZB?=
 =?utf-8?B?NWVPTDJ2YzBzQ3JyUlczM1hKOE5OZTIybXVKMCtCNFVsOEZESkxZQmNmU2gw?=
 =?utf-8?B?NGYzQUlrTGZFcHJOaklRMTlhaW5ZbEdqK0k2b3M5UGRSQjVkV0pJRXlBb3lC?=
 =?utf-8?B?SXNXK1dYMjF5ODh1eW1EOWc2a2o4T3BZZFgvbTZzVno1cFRTS1hhamxLeksv?=
 =?utf-8?B?STAvUGVaMTRWNWhqY2kzb1FuQXB2SlpCbkd2YXZzUzJqdnVpbVFFeGs2RVlQ?=
 =?utf-8?B?ejBXZVlyMWhpYmwzSjlQL3RCZ1Rsa25DZTdBWHR4U08xUmRGTWRkZVZTa3lV?=
 =?utf-8?B?RkRyWG5TQVBCcTQxQ0wxVGZmbTg2dklZSmp0aUJyZ2lEcFNMVit1WjVQdWRX?=
 =?utf-8?B?S2J2cmdFLzJZb1phREVvRFA0WGtMMWVBc0swNnVINC9xYUkwem1kWGsvN3lX?=
 =?utf-8?B?L21yUmtISHVVUVUxc1BJNHNyYXIwRzJkZWNmbU42RkxBMHBMZTVWZ1JMK3ow?=
 =?utf-8?B?Y28zSzZGRHErcCtoa1JlMy9pWm56MEJEdzYxWWcxcDFqZzJrVzF2eTNkRitj?=
 =?utf-8?B?YzZya2hOUjk1RkdhMXh3Q2l0M1IrbmNFSjFUK0lYMXZ0VDdPMWp3bjgrV0ow?=
 =?utf-8?B?RWFDdFFHSWZYSGFZTGZEWVJUOFBHdnhOVnR6TDFndk1ZSGh2dmFKVzFOVXlx?=
 =?utf-8?B?cm1DOGgyZXR2ckZmMHQwS3dUeFIrdzFyai85UUpIMENVQjlIcEZOc21iaDNr?=
 =?utf-8?B?aG5OQ2hjZ1VJSDBxS3Q2RjRrQ3JXUzR6RDAreitSOTZPUE9ybmFxOVRWTDJY?=
 =?utf-8?B?ZFFUN3ZNTmwzMHlGeTFHQ2ZscUE1MUxQRnpYNDREaFVUYzdrL3oycHFpcGM0?=
 =?utf-8?B?a0pRV1hST2pGYlNqMWlpVE1HMGZ4YjhlZXdLbFdMdG1wR2g1TDhUWEdORzJS?=
 =?utf-8?B?eE9LNys5cFg0RG11VXRyTGdzWElrZ3lzT1VDNE9oUExDcXNmU3cvY0NUNVY4?=
 =?utf-8?B?MzVKZ2xlMDA0cE9kci9XQWJwOWk0czZMR2ZQSWpQTjA3SVN2SVNQeFVTUS9W?=
 =?utf-8?B?bm5wOGZ3ZzBkOCtlZGNYWVZJeUI0VTVoZHRKU1h3TVQzTmlXS0trc3NETnpY?=
 =?utf-8?B?ak5CY3pwbHowSkltNVRmUzcxbE9pdFFkVlZXSTk2dnBvbWpnTlhDTXJlaVlT?=
 =?utf-8?B?eHBoMGQ3alJpWXhhQWVlMG9OR3V3N1dKeU5ScGp1blR0aCttOFRpT0pCaUFX?=
 =?utf-8?B?cFhBOGovOFZDSnNxbm5vaFk3WDllRFByKyt3Z2hPa1FRbzFoUm96ekJGWWR6?=
 =?utf-8?B?WERKeXIvYjNLY01XK2lsbC9HcGxlK2t5SVUzRzVGOUh3ZVA4RVFCMFFlRUJk?=
 =?utf-8?B?bFRkNHdHMUJEZ2dwVHhhOVVBYnNiN1EzenVsWUxpRjBMb3BLbHRxWkFBTGJn?=
 =?utf-8?B?cE1hZmlGbTkrckdJM3lsT24vVitQNkp3eHhQVGxPVUJYTHkrRTZvZEI4S2h4?=
 =?utf-8?B?RXpweGNRZ1EvSEwreFhOMWRzY3oxSGJNYzlYYXh6NXo3ZkYwbW5Ma0dFYytR?=
 =?utf-8?B?ZW1HYjQrMlQzdmlPakNRbDFaRzJ2MGVpSG5VWlBsaHRGekVHVmt5cFNQSVAy?=
 =?utf-8?Q?jkkExU5pTXzMuRnRuINYFgSL78+n/9j7Kj/0mtZVqGA2h?=
X-MS-Exchange-AntiSpam-MessageData-1: C0jkd2rhpHmang==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfa2d4d-276a-4019-6081-08de80a5c0bb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 02:10:52.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqaPfZDyuaedRFNlFXEzQ2RogJ9P5NXwcH74pA95MAMzETDcgkpZo+/SPb8koNnzZrJLCC/+Ii/iOY3cqApnnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715

On Wed Mar 11, 2026 at 6:59 AM JST, Timur Tabi wrote:
> Add a name() method to the `Device` type, which returns a CStr that
> contains the device name.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
