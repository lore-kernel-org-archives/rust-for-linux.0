Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793337754;
	b=gfs709zKDaHCfg0+zkxHIaKTejBJuUmwIwQ7kiFGG1OzLGhuhWlPqrIw/wgKyNGUpUC+
	 cRH8YSmBNOThv73qmWVOgWAVEOBRFttSffoXuFJC5pV3yq1gG6WknBo4J/dJkQyv7qVOM
	 bvjBLnOYvvHCDLto1OsE1FBsjpaSFVBYP66NDhkR0/lh0T3V6MGyuFRRxS1SCA19/GSXr
	 CKX1UqxRKeQLoPXa8cYyRXpCOHhV3Ht3bwLR5wuIBJ5+u/UtoyhEJe1mLWs1Eh0INKIpC
	 MxLheeTp7hRLi6VgIL/hPfFv14ZVar/8n3JKoLe3tzhO3UNtHH28SLZnVx/VPa4J+PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337754;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bafZVUE8NxdY/i4qGhUnkM88TJsDWiby+dWK/Le9ceo=;
	b=xFLYM6iG1XVp6fJFlY1HnXEOoraN0vjCYyq061NLwoO22vpA59MBXaFb6FXNdH83tpZw
	 EMqiZ0JMSsITeS2Qwc/+/BvnhI+951HiothhMZO6yqHRoRC+5r+/2Yzk+c4a6UIt9PFG8
	 vhfk9Zzsz3DfBeaFKMrDCCUONJYG28EYpVZRmlE5CxwYBlyNU7l7S1bZWYNy6T1txcrrv
	 9vmfWjD8qnkfK8ST2OViKmrqxx1g0cfVfd9U4yt1ujHvi0WML2Rt7gne7gKL1Woo6JW9M
	 Vw42KyH5lErt+ND3USLRfcEYZOWAxz5D8uM9OT7F3k4jC3bU67SY1EcrobUTV+8zI3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GekwxoxC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.14
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013014.outbound.protection.outlook.com [40.93.201.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A2606A31E
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 05:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 260A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GekwxoxC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vawQjlP7Ocx21R/t/h10Z7ZZ3dCRA+UALcEwdoGozsPBEOfcag2p7JYjnLD8BI6rvKnHXtMJwgQiTMJCz8Rc4Hmctgt+YDSK/w2cSNmodiWKN0lbDHl6bL1Lv4V9A5L85Xufwub82uIhZNy5IxKE/SgTtzJDlPQpVcBqLi0hEU/rXsb6WglYQ3mb9hDW57whwzAN4R2u3ZeMywWsbptEOGiDGuK0FVEGoR48YdDqpBeYbPULi5g+UnxltF9pR3Pa6X+yfPhY73mw0jhdIFu1RDGTDoW6bmjYAktkka7bXOHt7PmQicGfznDnUeNQ11RwdZI4M/aUSJre0StjkGbyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bafZVUE8NxdY/i4qGhUnkM88TJsDWiby+dWK/Le9ceo=;
 b=aeT3J32cjJRB1yCptbUg5vfLdqMU8LcZhsR7ByZD5MEyQbp7wd8n99Wl0Ev1NJ17KERmwoJbL6xvfP+eAIwbUfHHcmHvD7HVEMSGVhu9qPMx+m/LSISAqwWG7yoSjfX1Pc1BxjUpFoMSm7lSzeC249UO0ruCYk9hBdnPFL43F1KnQiX4KYyzL+Lx8l9Kg5nF8NR+UC+d7FDlmDe4Y2I6aUrOmmxmYgQKYnq7utvHr+5HYBrHxhM9E7sd3ykUyIy+TqhHytTwJ+7uXt470FBf/W1satazORYPMdDH+Sg2R4i5icOTrp51W3OIwIkO9bgysFCabxp10kzp0ZdM15BM+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bafZVUE8NxdY/i4qGhUnkM88TJsDWiby+dWK/Le9ceo=;
 b=GekwxoxClRgK5gv/jdz8Ez8+EGADPocjNNfeNTzOZJCOnZp3hecGTXFBV5jH95OpCqVRFwPuSLXmYZQF7HflBFdiobRpGx1Ff7UEmJilauO6UFK0d628n+iRtDOYfNdEc70yGOI9lO1S3e4aBndCF554IPBRTJVGAC+DUJrA+VS72ATwlzNRIajzUkMJ1Cw+D2ffSe0ISu/TQxfAeYvd3YcVzOccsmmyXKl+qi5NJV6vC34BjYKnGf+mxGrvzJk9lCh9nbei6ov+lG4PQRZFpkq0mEfZAdG9PWusN65+5r/mBHN6pF95YvDrh8mJzVeocBVArQ9oBAAfpCWeMUGNeQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 05:22:29 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 05:22:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 14:22:26 +0900
Message-Id: <DMHX6B824HCE.118N55GSMR1VQ@nvidia.com>
Cc: <a.hindborg@kernel.org>, <ojeda@kernel.org>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <gary@garyguo.net>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tamird@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: time: remove leftover "clock source" wording
 from doc comments
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "FUJITA Tomonori" <tomo@flapping.org>
References: <20261030044803.3863267-1-tomo@flapping.org>
In-Reply-To: <20261030044803.3863267-1-tomo@flapping.org>
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CH0PR12MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da92b9f-be8a-43d1-3ad6-08df3645ca88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|23010399003|10067099003|11063799006|261028144727099003|261022105027099003|261021121427099003|56012099006|261026140227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HB11VctgK0hO9oGTQwXdUVxs81HRm4INzThA0aEacNrfnqApNYPxw08Yr6rX/SeMNf5ExtWyjzW1obY8OPtwR4b1cCz1W2bDHNTbXgiwQW+eLYV7or7fAEkzAbvSypnksmR7jj+PXD1Y68visdEJ87XHL9a3Y1J6HyBM5TAkF3r4FFCbwiqNlJAEQ7vEm/isQOOhkKh1ubXGd7s5uQ51OL4XLli2ZWflS3feKdaDJVRu+CncBIafcJIXtlawJFlYsiitWXoAYmPfVlguPXrCJfuqeZR/TtxHlMawzVnanRBsNgU+qeuIQriez4GK1gLRzfMdWMeJ+3lQKN7SfXplkPjuRYsfal7xzhiKPyZYChZLYoTr+SAqSdy0TOgunjRgqkm9b0kmHi/2CH867btLJl3SsvglND9qrlsIfbxKJV652Fk1+TT0eBkZTDy7dOJoLvYxY20H3F2U8JDRDgmLXVDDi9qVPnEQBWlewTEKDa+9dRkOYW9OUA73GJp9Eah6CzeRTVxqQVlWW6WLbXuIdE28mw3C0pzTiLyqfCkJGrVpoXLjvgevr2NwSoNonh37CI5rWajF8CRuq/HLrCK4lf9ryOd1vI0uv90gxXAAdXnjG41qRIDX1LSJMMcDzQy16zztLX3+XYysPYSxLVUSPmYpShITDoQueht6W8IPjbk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(23010399003)(10067099003)(11063799006)(261028144727099003)(261022105027099003)(261021121427099003)(56012099006)(261026140227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXBDTzBqZm04cmNNSUtod25JMW9oM0ZTRGt0YkJtY0tERmhSQVUyaFRCQ1VX?=
 =?utf-8?B?UnFyOXIxOUVkN3J6MkxkNkE0cHR3Z2pCNkw3bVFNZkxXZzBkbENCUWloNkpL?=
 =?utf-8?B?N2NvWjJjMW9UNkhaTkw0dVhndVozemJnS0ZqMERDR0dxUTl2cDFWaHBrS0RG?=
 =?utf-8?B?UUJtQXZJeGZpVjFqMlBNZlZnMzJNQ3lGNWNEbmlTSjh1c1BZN1hiTGtPZUV6?=
 =?utf-8?B?Q3BPbHlMbS9yWFFXTFdYVmo5bWtiWmVHS0cxYUJhNUVOeXNFdEthNHVRZElv?=
 =?utf-8?B?YUQrRGt2bkxQdjNKUU9ZMEE5NnZoWTNrQzJOUVdaVkp2V1NybVR0dFgzMTl3?=
 =?utf-8?B?MWwrMDBxN25vNGJJT09vNUEvYnB3SndaVENYbktSU1JtRWR0QlBWdk5PcTJ4?=
 =?utf-8?B?NnpPcDdUc0sxSmF5ayt6VnIvMUN4TFUrYlNEckpZMmZEZlJsSWhWcUpCblJV?=
 =?utf-8?B?emcyVDJGZkdhY25QMTZvcVhZTktpZVNObk5NQmFjaTJ4YVFmbjdCbWNrTFh4?=
 =?utf-8?B?dWVlUEtMQ0lhME81TlA4cGR5QjM3bWJ0RDFzNnNDUVZJa25KcU5QMDdONi9H?=
 =?utf-8?B?Z2RiVGUvTmd2c2laaFV4cFV1bnNKM01hbFBFY2RFSTBQZzd6UXVvMDJxNFYw?=
 =?utf-8?B?MFZOOEEzVWV3N3lic0hkL0J0ay9xTU1zODZNVE9hVFJ6Qk12d2xreWljaHl3?=
 =?utf-8?B?Z3dYdS94Sk9nb0szdlpLZERxRzlCNDM3cm03d0ovRVRYWHIrODllRTVaOUFt?=
 =?utf-8?B?ZkNqaVdZbnFPSkdFSDh0WnduTTUyazJBbXlYUnVHdUFUaENWUERONmZxOXZ0?=
 =?utf-8?B?V1BUQ3FVNkNXNjk1OEo4MTRDZEhVOEVGdWlNbXVKbjRNNm9ES282RENENEVN?=
 =?utf-8?B?ODdqbk14d0lyUENBRTRJUEx4b0s3dVJhZVV4Ry9HSGswMmI1QkxjYkpnRU5Z?=
 =?utf-8?B?ak1sVXBOeEZVUFlnSVA5TWdVd0N6dnFuTmZkdEc3YndPeHp5c09iL0FlS0dq?=
 =?utf-8?B?Vit6WG9Yb2ZxenhJYkhQV3JWSk9TaTdXRTFpNG5UT0JYRWdManFUNDdVbkVZ?=
 =?utf-8?B?UVY5M2wwSzJTU0VkMmhiRnRTRzdseWtuRnRxREplRWs0KysrSWVHYmh1NCtK?=
 =?utf-8?B?azNqTnkrOXNWemQ1SVFhZDJXb3piZzdxZTFQU3JUalVSc2Q4R0RSWnR3M3dt?=
 =?utf-8?B?WExBWkdNdjBGYTlnLytSaThMR2tTdlVEQmE5OEV5T2tiemE1Y2JOVjlvTGox?=
 =?utf-8?B?VlNXc25oNGFvS3MrMjVRRTM5S2RhNG9XdlFkSFpEMmtwT3k5dDQ5cDgyKzkr?=
 =?utf-8?B?MkhTV3lZZFk0TmhYejJObis1TllocVBXNDJvbmMvM0ZpRzE0Nmp1ZXNRTUFU?=
 =?utf-8?B?REtnSUtiZDFiRHgzNGluMXJtYlNYMFFaS1YyRm9VQkNISGVjRnpBemdsbGtY?=
 =?utf-8?B?N0pTbWhDa1l0eGJnQWpKeWpoRDJHYjBDbjhnT0QvYXcwRXdOaVZ0YzVSdFdl?=
 =?utf-8?B?ZUMxUU5ZL3R0MXpuUVdDVFBjcmpEWlJINyswQk0zTE96Vno2a3FwMjBBRUly?=
 =?utf-8?B?cisyZGd0WDBlRDFDTXRBWFZEcEdwUnVydVNkZE9sdWp4dzRVWXh6VjRQMVNi?=
 =?utf-8?B?UG9wOXNJVE5aa24zcTdQMjc4N05EaEpCdUhwSjFmS1ZRbDVwYUlVUXl3Skla?=
 =?utf-8?B?NTJUNjNZbllkbGtDNFowWVRGU3hCRFFpa3lIY2EydFVkdjdMODI5VTVic2hl?=
 =?utf-8?B?RituS3FleXJFdm0rUE9sTHEwM1pFV3JGem9PMXRqeklmczliRlpoWHB5SUdF?=
 =?utf-8?B?QnRHZ2hxM0ZsSlNrMEVTV1IxS1lnVjZ3ODRIbjd4cHNVL3czODMyZEZsRHFa?=
 =?utf-8?B?TUdLYmlwZy9sR1VRZ1hvb1Rwc2RYU1B5N2ZCd3ViZTc4aDY5Q05CQVcrN2Rs?=
 =?utf-8?B?VkpnTUdMY1NKYmM4WEwrSzJ5SUI0bDVOaUQvamJXZFpVbkVNZFk2R2N6YVhR?=
 =?utf-8?B?a3k0SDVUZjBwOHFNUFB0L2NVSlZDam1ycnQyUVZCbzVXTkdjVUFpdWUrQTBW?=
 =?utf-8?B?UnhkelFvMlk0WVlqcHZNMk1Qbld0YmxqdUhPeEdvYzRNOVZFanZiYTQrVzRM?=
 =?utf-8?B?WVlMU2xrSzlONnhLMy91WitLWDFFRVQxWGdQY084SHNjeHlTRXF4aXJyM0Vu?=
 =?utf-8?B?MEVnK1RpME1jU0VGb1NhZ3JoVHBVZlJIVVlRV1UrR1YwblhPN2ROS0tpTFFC?=
 =?utf-8?B?WUFFdnlwZWtMMUlpdUcvZWxCMktEZHh0M1F5L2ZPdkZnRjgzbi9uRnpNN0dl?=
 =?utf-8?B?QlUxb2dGRkZMaGhoNjdVMGRVYno2SGhHSGxHOFdQemFUb2lnbWdGemlRN1pH?=
 =?utf-8?Q?Fla+BsfeR8ZLiJS7O3u3k2xVwHcAJgOCnGyaFCOl4lcnX?=
X-MS-Exchange-AntiSpam-MessageData-1: cUXOXVEewIHmyg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da92b9f-be8a-43d1-3ad6-08df3645ca88
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 05:22:29.0500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYChX5voD/eEk7Z69Jr+cLzqliCw4k2QYDPPSeCPtr1oUiI56UohhPZVp6kVUGZvgNuBI2MQpYf9jUCyR10IJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488

On Fri Oct 30, 2026 at 1:48 PM JST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Commit 6a8e2c63f2fe ("rust: time: rename ClockSource trait to ClockId")
> renamed the trait because it represents a `clockid_t`, not the C
> `struct clocksource`. Two doc comments still say "clock source".
>
> Replace them with "clock". This matches the `ClockId` doc ("Get the
> current time from the clock") and the C hrtimer_setup() kerneldoc
> ("@clock_id: the clock to be used").
>
> No functional change.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
