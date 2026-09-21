Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012058.outbound.protection.outlook.com [40.107.200.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E093264F7;
	Mon, 21 Sep 2026 04:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789966446; cv=fail; b=XnhWYx1fEarpPCn+fmVWgXQnhe276IYBo947vy7NjkTHUXKARJSgnDqTu7jVECs/t3Rgbi2LIWFwaJAa4obPokO3FDSKyzOpREqYhb9WxZdXUvJFUg1XB3dgUaHlVv2adJmWzTLAKAyX1zoHJM14qH/6WgHu1PqHiroR+nfMM7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789966446; c=relaxed/simple;
	bh=IuEo5NTMg+Xnn7jFVzT6ns6gB4QaMqdXJNdovuANjl0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NLCzrmCumZ9DtmmApvw6JxrP5odil8Al7bCoiQHHqYzOEsAso/YSIxYzMUz2epEUblfgDYytClVugSxvRI8RgNvDEsnYucoq5lvW94VzeyOq50NFu3qlUPCBbZlF1FL7ZsHKZQss6eUhg2lj1yIWKFK5quES6QnhvKT4mbAAiCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WZt8EHki; arc=fail smtp.client-ip=40.107.200.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WZt8EHki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxccVWFS7dTSPutNKzRi0mLdopJDm1s+29BBEc+sKP6GM3W0/RSmhV/3HwP8EmgVO8M9Xt7/aLSLkaS3+egoHZll1jAnIvkHnkIHkq88RD/9voy+FDLbeJj+jxs1XHggHPTBvrRSPiJXGKB/6bDIH8nMhy/jW+A+lPuDvufE/fLAzGoUDUMTxBqmO5mJeD5HQX37GqsQFBUN1ZexQoXSIzliaK9ol6EoIJ1WTz1z1yIq79g5EZTtdakhpHv99Cc+X88RMpjl3AQJxaFuc4wGoCAoCltBqTdMi/ue0OvyAWXgvDoTBdYaFEJJmK1YFRgDuJASkNqDM4a+bAdEzoENbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuEo5NTMg+Xnn7jFVzT6ns6gB4QaMqdXJNdovuANjl0=;
 b=YMOUSWYl2LHRAgjLhYjI80904amrhgAWh3p9cUgMXA7/n/AvFnAkzb+NoU8reKZ1kdN2zZ9AHunghiBJsmvLB9NUuRSH2BHXD8egWs2cOTYceXxlkvoluYxdpHZBOdeiWzDHx26BKlrs+KvPt5VQadmZmk8L5jNcKcvQf/grvccaDofBTlJJCcqqozCIF9M+sf+AavJPTrDLr8bREbhJkVxcfknteCh/o2j4Xg0W/GP/3KpKTDThksGZda2cELABvdar6D/jwKIWKMbs+hExGLjGFV8TXI+Ywr3cl08yFQA08Jcl56aZFR1n9Spo6UfyqxTQ0l5Be8C3tdOOfUOI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuEo5NTMg+Xnn7jFVzT6ns6gB4QaMqdXJNdovuANjl0=;
 b=WZt8EHki7MsEiTX8a7Dd5QEOxc682yzQcW9uYvMCQ/wiGA+olpsfa+EaGejfDFcuK5yKJcm7kiSwaA6IwV97gmlSnPuUP7fbTBgrFNzQQRoGa53Rvs9tyl9LZ5hxJhAuX435x/rGK2V25gsXBGVP5IjqklBNd6pl/lESc2ZeSFV+vwfepxZel8o78V+UtdR4dENa5N7NFeO+sELKVMuwV4nzCKR5ZE9SpdDNO+gqVqw0gLuHdgCBMrc8Ec7eDCOut+DmxCuoahSXDgscJJBJrscMt51BkEVwCJmJSN6tKDykUzSnhhS9JSuaEMROwYCaThxOB6sg87I6SktYQkxmKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 04:54:02 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 04:53:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 13:53:52 +0900
Message-Id: <DLKQ577P79LN.1YVO66REEP2SS@nvidia.com>
Cc: <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: list: document safety discharge and add
 offset_of! check
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yilin Chen" <1479826151@qq.com>
References: <tencent_F3A825AD475CB58F5C0D1C833FD3353E130A@qq.com>
In-Reply-To: <tencent_F3A825AD475CB58F5C0D1C833FD3353E130A@qq.com>
X-ClientProxiedBy: OS7PR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:604:24a::19) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed39045-614e-4899-9305-08df179c578b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|10070799003|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KP38/wV2S886IVEvb9MSwqJygr8N/m9iLCV0HZoULY1FxX/MhibZXNaAtm5P2nuB1gjgx/U/+p3pRx2JrGXoW2+OZEm7nrX23TxHFVKPmjHJ+vptXMwbwxyDgoPAAkpjEYZY9RtVTrdjQByUp03Pw3HsWDBFQEx18A8X+vE9sGGrLWBSf24l6wg2JjmGXkkPZwJUqhzcTxZG0cvq67KGzL+iamnhTbcwT1UjfUUqObcjLj71ttkMsltgVWLU9YA8tfxZGEt2tN5gYsfz03jwqrP4CsHd4UCONmXMjDBlqmh7NJY4PQQpjBNg0gaoMHYWvWvIHPIl7Zob7qccCdgBa2fe1dwMQhxssmc2xY1iG+ZDzs7pgRv5jIde/v38Ir9FnjK7fdMyBEkXbiWjN823JAZjz+69L6hK6Jk51m6Gt9iWA/dlj4a0lQmd/tz3YShmZtSsedcLchGYoi6OZSE1yRGlXC4YP1uOM4hs6SKRbGNLG9TXZjRUDxhciofH/gvx19EZeBLAUOOGY2YqbGPlQcoQZPgv1L66PQczTitqgGp7vtAW4tcdahWgMrzoeFsgvpImb2PBVYdoQXQJBJGxjIzZvr2kCHXT6uVn+lvFsXNfbVrk0yDgssREfLanm7T/1wskWnOgTkcnbGXWh1UhNHLOTasoX5v14FxcOvq4IBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(10070799003)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmtYYzc4WjFTVlFZeTVsaUJpY08vTTluc2pvSjNoREZQQTFqeW1QZzZkM093?=
 =?utf-8?B?bzVpVGJJUGZ4VVV4NUs5WSswN0NBMEFtNVhEMDVXcFB0eHhNbEF2NTEzM1BO?=
 =?utf-8?B?MTRGTTc1dVVNNEt6UTl3NlNEL041d1RlSUxYbCtENXcrRmxvQzFCVlBnK0xE?=
 =?utf-8?B?WThMQlAzNTNzNVpNTzZ3bVNydU5aeUVnOEd3M3NCZE52SDBoWWcyWm1kMWNt?=
 =?utf-8?B?d3kxZlBiUVRDejRBa3BQN2YvVFJjT1plZEozZ1pEQXQzOWpNa3ZNSjRUU2hy?=
 =?utf-8?B?V0NrcTJGUE5UY2dER09ud1Ruc2ZTMkM4b0MvZE5xd0t3SDVjVld4aVpsc0lV?=
 =?utf-8?B?enl0eXAvUk9NVWx4R3R5amNtM1B4YU0rdWtXczcwVEM1Ly9LNXIvVmU2enM4?=
 =?utf-8?B?NU9ycTNtNnAwNkNvdnM2VDQ5SlNCZmJOK0RFdWgzT1RXNGg1ZUVQUERFNE1X?=
 =?utf-8?B?djNmWGxHNnh6dW9OUGprd3lQS1dMT1FLV21qQkxlODk0RkJLSDMweUxzYW5T?=
 =?utf-8?B?L05nWnRwQ3BCV3dOcFB5cmQ0SUV0NG5qODRaeEttY3VVT3JjUmQyZktldGdy?=
 =?utf-8?B?b3BTb2VpUDRKUHFabFFDUjVTVGhUMlVHUzJ0UGg0Z3c0V3VKakQrKzl5SVFj?=
 =?utf-8?B?dFFvMGRUZHNMZ3F6RW9sc0NSMUlDNGNOSHFsdS8zcU9TTkhYRnBQVHcrK1g1?=
 =?utf-8?B?RWFOT0xjNHIraTIvYU5KNXJEVjYwNkp0TGZhbEpHQTl2RFpRS2g1TG1FTVlY?=
 =?utf-8?B?VGd2NFBNcnBpeXJXaFl3UFo5YkNOc1NWd1E0M1pPMDErVFZlcXNuay9IemQw?=
 =?utf-8?B?T3QxNXRidStRSlFZa2RzdzNCa3lIQ0FTTXFqTDVzb1AraFlGRW9TdTZseEtW?=
 =?utf-8?B?UFFQU0pac2VTMzhrT0dSNzVONDd5a2Rkb2FHSkl4OXlXVTZqOGtYaDBKb0p2?=
 =?utf-8?B?VkJSS0pYU0JDakIyL29uQ0Y0T0pabHJFRXdGaGYxcGZhNlgyMURjamE3U0RI?=
 =?utf-8?B?a2ZXTmUwcFBkR2dIN0k3ZU5aSHg3WXVrZ1BBV0MrenlOdFNvMzk5WDRDdk42?=
 =?utf-8?B?WVdycWVLM2RyOHdJUUxXbTY3aGd6NUJtOXNNbGpMeWgvcWIycXU3cm5GcGxu?=
 =?utf-8?B?WDBjL1FQdkRVTURNUVlpYWNoUEZUYmVobCsxQVJhQW4wSXdXVlpDUTl0cWFQ?=
 =?utf-8?B?cWVreDJoM1llTFNaQzlnc1lsZmpxdlBRbXJzWnZMVTBqRUhRb1ptTWU0Rm1h?=
 =?utf-8?B?VWFtNG5RaVNqRXNYTVZKckpHTFFoN2hYSEtNWUZZR2YrVlI5d0FWbWJJM3Qw?=
 =?utf-8?B?eURmREdPZFZBRitjSmsyL0xXT2QvZnpHQ2p3ZFU0bGNLT2VwblFZd04zOXZK?=
 =?utf-8?B?czFjank3UVd5TVVEM2k5TUR4bmYzWEl5bHpoVzdXaEZNbDBubEdnSW9kY2M3?=
 =?utf-8?B?cTRHUGtLNkhOL2pXVUFmOXNJdTBmeUxoaHFuOUVYb1VvVjFDQTFUOThXeHlB?=
 =?utf-8?B?SFNUUUVlVXQ3SWQ1ZnAwSGIvb2RVaVdqZUhPOU80NTZKRjNSbGx1MVVEVm5K?=
 =?utf-8?B?YkQzL0FabHQ0dE9tWlZkMzBlN3o4bjNXOUNyYnBsSEZweEx1MFJHdjN0eHJw?=
 =?utf-8?B?NFhDNU4zQmc3cmdaaEoxQ3N4dmVlYUJjRmZJVHB5am5OTnlDeUlxUHNzUjZQ?=
 =?utf-8?B?OERxNFB0L2tza0hQaW5hOEsxcU5yM0NNYkpiRjI5QW56MGRtUVJWYkw5NWhO?=
 =?utf-8?B?cm9uQy9oZnRTejNqOUJScjJzMjRFV09GMlZvcEZscE40TXZCbERoUDNwRTVl?=
 =?utf-8?B?WDVycC9xc2czazlDN2kwSkNaODl5bjl5dUZ2UVU2RzJvaHFhbDE4SzJMTTEr?=
 =?utf-8?B?T1RoVkYvaUxYS1lBQ2tZNkZGTTNmR1dRc1hYdVpzdmNBWjkycmJnWEttV2tF?=
 =?utf-8?B?bGhGTkhaeGdCM2hHY1dpZWlhNXNGekt0VzhRUGZ5QWtFeVZEUDNwV3Jqc0xq?=
 =?utf-8?B?NHJ2Z3BTS3N0ZmcvdzlnQS9KaTlBeUZVenBMdVRTeFkxNjduT2tnM2RGaHR4?=
 =?utf-8?B?QXI5cUtYS2hJS25seVNzZHE0QjRGMW05ajJPdVVCTTRuc2p1UnZYNnE2czE2?=
 =?utf-8?B?UzNmYTRpTjFpV1U3MTVjeVpxeGdsSFozRnhtMWhQZ1R6a1YybklkZ085dm1n?=
 =?utf-8?B?VVU5REQ5OU1qeVBqcjZNQ2JGOTRuOHBMdjZvQTU4blhkYmVVR2hQVHNFWUhE?=
 =?utf-8?B?cWJ6Mkg4TzRvanhJa2xmTVZCUFNzdUFDY1YxRHdBWjFVRzB1Q0Y1S1dXR3Ro?=
 =?utf-8?B?MXd1eENpRVJIYndJVVVCS2I0QnhWbmh0SlpKalEwdzlsV0p6MWVudmdrZVJR?=
 =?utf-8?Q?R/JptsOQbTHdV6w1ddIU4c6n+ju/x6Tcu70wh6ZyEOthx?=
X-MS-Exchange-AntiSpam-MessageData-1: qWXs68TWbmKh0g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed39045-614e-4899-9305-08df179c578b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 04:53:56.2312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCIsviZ1drAHvnmXkhQTRvOgYj2WZZCU5AJAhoQQRJvxoXeKgHRToS6+Cyt09/f+h1Uc4CO9w8NU8mC8UNduFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383

On Mon Sep 21, 2026 at 1:14 PM JST, Yilin Chen wrote:
> Replace the remaining "// Safety: TODO" in the Rust intrusive list
> implementation with explanations.
>
> Also, the `impl_has_list_links_self_ptr!` macro does not perform
> the field-path validation already used by `impl_has_list_links!`.
> As a result, `addr_of_mut!` also accepts paths that require
> implicit dereferencing.

This paragraph sounds like it is an independent fix? Let's put it in its
own patch please as per the guidelines [1].

[1] https://docs.kernel.org/process/submitting-patches.html#separate-your-c=
hanges

>
> Use offset_of! in an unreachable branch to ensure that the path consists
> only of actual nested fields. The value is not evaluated, so the check
> has no runtime cost.

This one also? So if my understanding is correct this should be a 3
small (and easy to review) patches series. Your reviewers will be
thankful for the split.
