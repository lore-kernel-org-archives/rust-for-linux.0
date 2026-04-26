Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013035.outbound.protection.outlook.com [40.93.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152EF35F8D2;
	Sun, 26 Apr 2026 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777209072; cv=fail; b=S3uXKJv/rSGzipc/h2YEdIn43u2AyxjWn3vrURv8X4NCkJICUE1X8cqwMG2Yi9QFMLskRbm2U3vhjjG5wectmGH1J29ChTMqrQ8OjNeRDR+wtq9jt0MZJKNPQi/wTtkvXyUQKuUzJ+SCDYRYod7LPQ4VHBJgM/po405DJ/1S1Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777209072; c=relaxed/simple;
	bh=QtMzVOZzAhedD0bob/8xncl7lCO2+P3ovUOvxO/+kj4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pqYFLNa9Fs2TnpXhriqWfqISzFXc6eYg2ZvJTZ0VgJvHaXcX/k6stpNTyUjenx4gLkNp3yhq0ao4iYdRIjd3BQPZK2gPXgfXf/0tIl6Ojy89n44hbDPZsuUVhePDz9XGl6Yw133bkI4aB/rS/ddsbV2uY7LwaxQVa+v9kHaYqMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fvm48s+P; arc=fail smtp.client-ip=40.93.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fvm48s+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj/Didfux1j9FQiCfMwoUt9N8Nffu7s4Qb2iT7KlVMna/b6HR87e4EzOFffjQdo8LVB5csWNMAK5QqHl5DQ5HjcIOD5d01UGATHWdRVX3d7W+1K35kf1Cv3l44I7fdXgfTnxnrvKO7uQZcOeumbm3cwK6axRDl/eubJ0laHYIehDRDEfUnjN+tZVP20bm/H2wyYbVJfk6ZeHuZODdFmtqAQCHkY7Sfkbegn1hi6sobeXyJiBr4gV/ySgDzDug1Wplr7Zc19M7jSTx8jh+BVWMchV/kst1obWrnZt55b7K9TcrNxj9kaYihYk/mDlhqjvqKQg6J3rSCpigOGjR5nXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtMzVOZzAhedD0bob/8xncl7lCO2+P3ovUOvxO/+kj4=;
 b=dMR1s2kWuIxrYVVXmeXwgdzanUURaq84aEsvi0IiLV5OJn90pGuU7swrG0XJSDVxZtTLAUWHhwynbyc/XK5P5+/kBwlYHnJVH6is6Or6cfHQumgCzPK4u66SvbHLrmTwz7SdT2ISh6VSwk0bGzunK2CoqyFOgoGmQHnHKRk4BXPi6TSwzmdlAbsnxTOD1VNMVJBEv6HVml7rPnsKFzv/jNPKOVCJywVIxK3/tGeAB40ZMfLn1o2xGtAHkVWi+ZGcqNJJ85R7Rxzv4ywQ1Wxu3NJ/rSY4fDlMEAKPuWTBqBHQEQsYHYLRyaqZiCInQzlHfsJaiV6NLnU7mcmrLby6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtMzVOZzAhedD0bob/8xncl7lCO2+P3ovUOvxO/+kj4=;
 b=Fvm48s+PhipwipSwrNqcd1Q+W6AGuO9e4CAGmG1xwKsiHzkgn5vtfcF0rJ5KJVSiNmwHos6RHBULgkN6ycEUg3lRHZIm67KroFQ0W44n0sjSSwtBXFY3PZAeD4HdsCsYjTmtfp1IBaP1yVoiSIvqIvPSeEWberv2Nnhfds0nP4ImkcFyo8hk8Nicq8Q/0R8DJ2rbjLbbljoX0uTI4FFkgkGtPdYtQRtMyfob00CiNrLcXefQVehpsbjhyBAKojyuvBwS1IcZtkZ6fKEf7N1Lc29H4mHI8laC6hRrKT80FfmE2fsHkf6N2rL/hZ5SVjFY8Y7L8+oe6JnItYeMYZVGOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.13; Sun, 26 Apr
 2026 13:11:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sun, 26 Apr 2026
 13:11:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 22:11:01 +0900
Message-Id: <DI3417MXPI5F.1DMTUFZULXTUF@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: add doc test for `Vec::from_elem`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>
References: <20260426-doctest-alloc-kvec-from_elem-v1-1-e364341a759b@gmail.com> <DI2SFMAZZBUI.3W0BML3IG81Y8@nvidia.com> <69ed9422.a70a0220.2a0a5f.f624@mx.google.com>
In-Reply-To: <69ed9422.a70a0220.2a0a5f.f624@mx.google.com>
X-ClientProxiedBy: TY4P301CA0124.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 038066af-bb35-40ce-1f10-08dea395468f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S//D4hKnO40wXioATmo4B79zG1che9uAmMA+04BMFSuq3YaP9V7s/BAO4ICLHu2G1ZNDNT09ImGnyh7EHgTGh3s5chgtR49XBPHzK/G9aj+7OohnWKDQQDSHM1hbue3lkl015RAqtdbp8tRG8CKk65eVwbF+z7uF0GaP9IKeRP1T8wD5RpVdYt8T8c4B6vqELO8hfOr8U+xosdOU1E7BAkx4CNx6lWNLVLhPY1jfAQID0QN6LBTqIT8i6t/HbBGdDH4BcZRlz1+bmr/moyv0fC5yn/M8kfLpDroGMFDO7Sd+Sy7V0sfS0le0Nc4iKWbQHJ9jV4bDOMv4dPD156Nz+g72SpOjuNSjQgtrUZ+pp7KbhzAnl0PV7pKPeyfRMyRBfP6SQ7gBoMNbGIN642i1enicQDaWqOnzfgPdbROAzCFgvBNJ/coD1R9GAJ27IHWqXSmMxHRob1V1+w55R1hM7+YPzj4aHa1PxFp380vNMqo8VN2956F9NcLmBes0+0QAPIkVQ+59ENzaBxc+J2hT7cDi0VPGcefSosOLdxKireNBIXxk9TklHPSxqsWuhKi6axBzFS6jSjfrd1Ab8q4sXQgyam7sN2ZWRhd3SRWWb9iub8vV4NsJwLYH0amxhUMwlXzPseMIni9GoBm5PBfMf5jjxNaE7XDpnxk1q44LJMQoHlby6i/w5KkQIYKPHihQi31d/AkM0LNDSiTztR4LRyj9tVPZyMM9SfgT6ufHxK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEtIYUZaa3pQV3ZOenFJdGhqQVFnTmdKeUt0MlcwNzVsSWp2ejVqcnYzbWxp?=
 =?utf-8?B?Y28zbGpiY0cvMyszNDkrbWdYRTNXS3hXbVFYYVc0bWRId0xTT3NFeWJSNWZw?=
 =?utf-8?B?MVB5clc1cnBNSFM0SVNqVWZXN0hqT0VWNEVlekJUdjdjQTViSzRoYWRZWkVC?=
 =?utf-8?B?SlNncFVvNFQwSHJ5SnU1UDZYOXViVUpoVzNRUGtHY2I4SWRDZ1BjVzlwelRX?=
 =?utf-8?B?Y1FmNFpnTGNrOUVTKy9WSEtxS0djVnU1WThqa3RmbWU1dkRUcEdTczhrbDhV?=
 =?utf-8?B?Q0FqSCtxcFBzRi9TN0hkNkxhSXhsKzR5cjdpbFRhVm9QQmQya2l3TzNDZGdV?=
 =?utf-8?B?NTQ0U2liYWdUSzZwWlRNUDI3THgwcnlMeHRla3J2bTZmNE1NdXJVN0ZpKzRo?=
 =?utf-8?B?V0Q3UkZQQ3pQVFZmemF6TXUzdU4zenUxV2VINEhKMFEyTzhjMzZEam1senNO?=
 =?utf-8?B?T29Jd2pWZVNMTnphTnNScXlPU1hTNjlhcjFYV04zR2dUeHZyaHYwMlViZlpo?=
 =?utf-8?B?MUVVRnlDNEdCQmI0ZEFDcnNqdzV5eE5mdGl0Y21HU3loTko5QW84VGc0Ujl6?=
 =?utf-8?B?OCtWVThmaWVack8rNzltQ0E5QWdOWkhDMFNuSi9VU0VmRW1COVFPckxPWWZ4?=
 =?utf-8?B?dGJyb1VSZU5iaUdiQmVRcnJFT1JmZ3dlNFg1dEhNOHh3eVZTQVlXVDBXZ2xU?=
 =?utf-8?B?MCtpWHY4U1JEd1ZuUWN6VU5aLzIvaSt5SVpFdXJtdDk0eGlpK3lFNHZFV1Jw?=
 =?utf-8?B?VlVXZ25obVlPZlhTMzN5UmNFT09GSkZEeUJhaHd6Nm9iM3hNSjk1M2JocUF2?=
 =?utf-8?B?NnZEaEtQREQ0Z2ZReU92cW1QV1h5T3ZGcGFNMEZhMjE1TDA2UFk0cU9HMUxT?=
 =?utf-8?B?c0ZqVTBDVit5NUNFN1c4R0hMVHIyek9NM3M5WUF6Y0VLRDVLeENJOWgwWkJY?=
 =?utf-8?B?NzdjQlRITURtZUwzUHpsVHk3ejNFd1YzVUdHS0NhdWFPVThvZyt5K0NENWho?=
 =?utf-8?B?MVNDdmhVYVlqM3dxdlh4OGtleEtaQlJDYk1GaHRLZTNYbjBrc0RHL2FNQ0ta?=
 =?utf-8?B?R3JEQ3Q2N3ZjNE9tWSs1Z3NaaDFLZ1I2ajFNcEFPdmxYcjJETnRTV3BkWUJp?=
 =?utf-8?B?RXNrbXFaS3FKZ0s2VGdhOVI3SU5xcC9BeWNRa1Z5WWNXRS9GRlozTEQyMkl0?=
 =?utf-8?B?QzZiQXk4VEZNVmtUQlJVeitoVSszNjZnOEhUR2lUSU9tUHpjbk92R1RXYkxX?=
 =?utf-8?B?Q0FacG95WDVjZjhYcENSYjRDRjhEUldQR1BQZEVLdjhiVTVSamp5amprdnp3?=
 =?utf-8?B?dlNzYWlSM0lkSmdQMEZYVXVvalF3SXppTHgwSjdNSjJkMDlRR1BsYy8wSTcx?=
 =?utf-8?B?cFVTcnBqS2tNV2VpVFZVbGdRREYyRDAvT0VzamJSU3YzbE5zM3oxVFNHYVFy?=
 =?utf-8?B?ZlN6Vk1PaVJxcnlxNkdXMW1zSDdrRytSWEZpWFFHV0hiS1RSdE5Mekw3SEdl?=
 =?utf-8?B?Y1J4SDNtL1BXaytoNVY2TWd0RW1YY2RZSk9lRnErNldNM0pJM3luWWp3SEcw?=
 =?utf-8?B?L2piT3RMRUxjcG9hTWpWLzlSMGF0amJnMWk3cjUxRXRRelJXSkwwOEJJSWdU?=
 =?utf-8?B?Zk9UYkdDM1V4bi9USGIySlRNT01QUXUyTEtqd2lBNFBVbXNZcEZJTkN6ZWtZ?=
 =?utf-8?B?Q3VpaGcwNFBZSmtrcjdhb1p6SDI3L2hxSWVLZTMxaFBEL0pTbENCZ3FSZy9u?=
 =?utf-8?B?Z0F5T29uRmFHZzc2aGxOSkg3WFJyYit6ejEvOFV6YWE1YXNlY3N4Zjd1VzhY?=
 =?utf-8?B?SEFPNVlRSGlobVZxRXo3NGZaQWh2ejA2QWhLWHl4a0I4U3NjMFZHcjBxWjg5?=
 =?utf-8?B?WHNwOFp4WG9sbHNVckVybEJiRWR2NFlrci82L3cwOXhST1BqUEtpTEVmdzBP?=
 =?utf-8?B?MldJTVAwbTJMYkk1dW9ObUV1RWNaU0x1UWNZUzc3dkQzSmVxaGhYc1ExVUNv?=
 =?utf-8?B?MldRYUlWTnpCWk5SYy9WOUp4SmVQK0JmVmI5b3dyc3o3QjdxeUNBWGdpUlFq?=
 =?utf-8?B?L0VmemlFVEhhaUV2RXV5Z0tzRG9DMEd2bEFJZ1Ewb1pBYmNSbkJWakY5Q0tO?=
 =?utf-8?B?U09ZeTNoU0ZzeVhyVXRSdWhTNDdtVEZKNWpCUVFuajFUeUVIUFZYRm5mM25t?=
 =?utf-8?B?NTJKcXlzc0hOanBmK3NXd3dFQkVNcGZaZGR1b1pOVXpKMXhmMVJ6STF5dXNE?=
 =?utf-8?B?T1llMktmaUVaQSsvdm12eEd5ZndjQy94Si9ORHVrbmZRWitrMUpJdWxZV2h5?=
 =?utf-8?B?NDBhdHc1WldIenBUVkg3M3JycmtCM0hsaFhCcmZ6cVBtVWkrSFNTa20vUUln?=
 =?utf-8?Q?ESuvIlgxwyvBvygrFZ5qOo1w9KAdEkYo7m5qsiC4aNZcY?=
X-MS-Exchange-AntiSpam-MessageData-1: gntiMB59r8Fj8w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 038066af-bb35-40ce-1f10-08dea395468f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 13:11:06.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIwY0wr4HT2l4MLfDiMkrd8Mai+FkE0N8WKqMv57Jrid78PqzhEDOs+FWNFCBswop0sDKn1Krea1fHhTfl6zSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067

On Sun Apr 26, 2026 at 1:27 PM JST, Hsiu Che Yu wrote:
> On Sun, Apr 26, 2026 at 01:05:36PM +0900, Alexandre Courbot wrote:
>>Received just as I had finished testing your other series. :) So while
>>I'm at it:
>
> On Sun, Apr 26, 2026 at 01:00:06PM +0900, Alexandre Courbot wrote:
>>Looking good - just one thing, when sending a new revision of a
>>patchset, please start a new thread instead of replying to the previous
>>one. Otherwise things can get pretty hard to follow once we arrive at,
>>say, v10. :)
>
> I just realized =E2=80=94 should I have grouped the tests targeting the s=
ame=20
> module into a single patch series (like the one that was split into
> two recently)?
> Would that make the review process easier? If so, I'll start batching
> small doc-test patches together before sending.

I don't think there is any hard rule, but usually a patch series implies
a dependency between the patches, i.e. patch 2 cannot build without
patch 1. For what you sent so far this is not the case, so separate
patches is fine and maybe even preferable as they can be applied
individually whereas maintainers tend to consider series as "all or
nothing" (there are exceptions of course).

>
> Also, as you pointed out in your other reply,=20
> I had confused `link:` and `in-reply-to`.=20
> I'll make sure to use `link:` to reference context for v2 onwards.

No worries. If I may recommend b4 [1] for managing your patch series, it
ususally just does the right thing for you.

[1] https://b4.docs.kernel.org/en/latest/
