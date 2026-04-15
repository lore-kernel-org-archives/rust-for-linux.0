Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2037823C8A0;
	Wed, 15 Apr 2026 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776222603; cv=fail; b=tzUD9p9tKZD7SzNwifv5d+CuI0Og+oKR1qol4u3xN+kn1OQo3fgEgnOjU8WctDJAFY+lZ0af9ulZ/oEdmoC7rbD7YSnh/JndfhEHJJCGmvvhOTwr25B1gSRcdKkcsyaBNhMt52ZO8QAyWPwWXPM0Pefp6TDYo3p8mtVzNvhDEgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776222603; c=relaxed/simple;
	bh=tZlr7jX89gb/brydU6iHSLqAbe5bw9n3iQDl73IKo5A=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=CHPnFaNCsCrVzlPCUtnWQgP+bZ9CXnb2Cnug9H38gBGOZ5ZpCiIBD/bvuunHIg5NDGs3Afw2kzDcG2XTpl3SyW6DQKdcfqANdxfbprjz43d3NNmfvtcry3mpW/mObS4aWIuD+ZYyxZihKwgLR8MmrWRb2A6JZWQ98FxSQV+GOFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S1MaHMvk; arc=fail smtp.client-ip=40.93.195.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S1MaHMvk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5qw1M40sCZpcRP0dab/mR3wP248vh5M6yT1/1KTFW5ef0NcgYCXeTiqKO76GGEQgnJvIBKF6vPskrz0vnVJumHuJJxB2MLulFliK2MKEHA/6uUUlcr8RWfpIJpqDS0AQRXdYOEPwUhuY3JwpONGzRaXU4PadDfc/nQSSxEde5rFPk3WipTiVJW3hzB8OcqAjZqWZ0q5JzZBA52F6CqGK9DmZITvZhdMZNj2OYF6JT7hHcuRn1N5xV+Kbjy/4jmevFOmDAWCEArsIzuIe+D6PBZQsn7xbbZO4C6sdg1BgZJYZcZjM8B/xIdZdtEfqpEi6HZPGuommyaFLlURHd6wuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nj28oQwTbRJthg0IAfAnMHoOgAnb1R08G5nj61JWA4=;
 b=NhkNtA9qoHRNTQNBS/lhxcpUQ9s2YG7P5p2VmzNEDXmhvX7pNlzt9Uw5YNp+H1hEtSGK7Hd/QuQQxROXoJ5jsqrmE6Vq24GEy0Tw+v99mHMOfra7bfnkpSVOdkdb3s8Y7OnGG7/MabvBmAOsJzlPu0crFnOTT0oYbWPrK5TF9XTgaE/rGq6XFcxsQwXkXgA8kb6VXcUjP+RYLEFIZ+U6NI9Mrhii5QqgizHVWXyRVeMqdCSmye6VmP6SPV+oYFRVH5orAoMWqStJcfH4/7RgaplH7eoMwp8sB1t8+CWnI7aMwY8veTjTmC9s1mTrESmubX++JxK1V9bo4AFaW3ZSTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nj28oQwTbRJthg0IAfAnMHoOgAnb1R08G5nj61JWA4=;
 b=S1MaHMvkWOkF+o7j87J2BOtn9K2mBSVzSTA5CjuQVtWdYLFGt+aL0oiFOF1cakdW5nhvKQeY2rbggAV72aUffPx7qcYJb2eGUMc1ejTBn0fpC39lPzLI3sx43B2yvKB3B9UT0WJ7Er85Epl7O5joBneR8wtwzhSJJ5pTf7UKiwTt5PZNg8/Q1GeNwORl9r8htd5BmtEcSMgekFxg5TzK6uK1/7L+l/+ngzetWhGpO2X3RihVOL+V9Rx22k4nr+t1wUZIt6rR2Yp/rKym1yundFAzlTT0UrkFpV/1CczoapdBRvT7lKhXMe8YYzMh8bcRDZ5C801Mf4o4H5TNhqc4bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 03:09:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 03:09:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:09:53 +0900
Message-Id: <DHTECYR3QRZK.DUTR6VNOC5RV@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] gpu: nova-core: add task for device address type
 wrappers
References: <20260411024118.471294-1-jhubbard@nvidia.com>
 <20260411024118.471294-3-jhubbard@nvidia.com>
In-Reply-To: <20260411024118.471294-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 15fd6f8b-c3e2-4e9d-702a-08de9a9c78f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|32116099003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4EPTp8mUp+uLUfCRoNmLNVVhYGPJcoCQuuVdPipDqKeL7gYz6adJr5f5LfIrXc0aCvhgHPA/9EzMJwnavuLWZTb0jpwRLsjmqmdPmWnrBnuh856lpYfQjLDu/aBgF5bj4XGbzCY9998ZSdXNVKuX5lrDA2anvyKTIsYNAUpT3IuMX4Jdt0hPqH6HtPk5lJeIMvavY44MGABYUdE85WrwHbyKBdE+xgQ8Ggxzg/le5xPknFm7eMcfz9yWt0dzgyV6O+DL1lYGlmSUc8AYZ/UbVlJVAS1Uj6rqCbbnZxp49euA2FwAATV0t4k1/djIPXt5gVFp+D1jhSjjRFJwelyOGBu7b/CldilT5QUVZypYf69JxThvHiJjrrMKdXDd+7kg8EErLBDAW5UKMHSRkTPLKpCTBRWdKaZ+IKVXJcCf+MQrx2hZB2sCSZbord6XaVngMewPuv1Pg/N3KRGCh00XC42DSPi8odcUodDnVEAHXEJ4SwHSnlCXO11lVN3FGG0bOdHG4YkL2e9LfLXCS7X4xeTR7uxVcqk3KZF6L3zMwscsO0ifi3Yt7omOE1PEXb0Uj0OujElt4oMWGiZPDHx4khueRT+ELjJpu3BRpSHbCDwCpQE7e/Msw3vo38AiyGST0co+/91EkgIZf/bPycHEpprExR/EOVA5ys778kho3fPQkTRAWs7WS/X/c2VtWqCmFbKu1J4dhy7TA83vJkvG/kmbXvtgTSucSgFyjo7xf9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(32116099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDlFN0pNOHhDeHc4by95eVkyMm5qQ0VaQUxQOUI5YnRrMk1pZzNZdUZJM01p?=
 =?utf-8?B?ZW9lV0lwMEllUjk1YTR3RTFJMm1pZFFXTFN4Ti9qbzY2dmpNc3dXYSs0VGdY?=
 =?utf-8?B?Z215RVBMak5xb2FuWGJBcHNVbHI0SFd5ZTJuM0FVcGhlYnVIcGNiTnJUaVhX?=
 =?utf-8?B?MEtoalZhY3VwcWpKUTZqa0tlZ3ZkMzVDSndYSkQrKzZVNUl4TUFzSHQ4NG94?=
 =?utf-8?B?eEc5T21ja1FVNjBKUU9jUFpoSVJZOWlxY2dtaDJua2R1c3VBQlorbEpwY2Fo?=
 =?utf-8?B?dXlzckd4ZWhVWWcrd2NkYkNkU0o4K0dyZlZyYXRJMGc3dzRSRkxTY2hoVkpZ?=
 =?utf-8?B?M05KUlRYanRYWm5laWdOZjFVZ3BxUzlkK1JzL3dMQ3hPZWw5N3FsOEEyWVo1?=
 =?utf-8?B?T1FFckdWYm5UQlZ2MENab2tEc0oyMFRCWEU1U0wyMFFwQmlNV2YrVjIvbTRY?=
 =?utf-8?B?Zk9IRzVsZDIwQmpzRGFlWmoxMzJ1NVoyYk5uWEgySEhUZFMvSWxDQXpIQW90?=
 =?utf-8?B?UzlFZDZ5d3JwazFFNmZ4ZFN0YWs3VnkvcXVmR2dHSUhYbU05WnNZUm9JWVVQ?=
 =?utf-8?B?UTBaaTRRTHE5NEc2WFRJTHkwSDRKRmZlT05sQ0l1TXZldHFjbURHcWNoN0w5?=
 =?utf-8?B?bzF6ZW1TbDB5b0FITkNucW80L05CcXRvamxSRkhmQncvdFROU3lQVnRpaWVr?=
 =?utf-8?B?MHRYRU1TUEFDcU80OExNWjJzM25mMDB6SkMzVFl0Y1RYUzhRV0VEeUNlUmNq?=
 =?utf-8?B?cWJVUkgyQkpXL01aNitTSmFkYTNNaklKWDdJOFlvUklZSW5pRDJOYzVrQUlR?=
 =?utf-8?B?UWxlUjVwU00xekR5YkpoYzlqdUY1ekF6UXVRaFpNaHphWHFSK2JYSHF0SURW?=
 =?utf-8?B?NEZqVVNsZis2MzFVV3lLM3Nxb3dNTjlUMkhTODhHZEhDSEtHYUxwWFFsZ1hC?=
 =?utf-8?B?YWIvY1NsczVTMWU4dnJOU2I0czF2TWpBdnhPdXR0NEN1L3YzbnZ6VU8wdElk?=
 =?utf-8?B?R2RqVWVRKzVlTTN3M3FNM3BvcnlyQjRpSHlqRmVsUGRUY2RVcmh2cnRNOGpO?=
 =?utf-8?B?T2xDVFEzRXRmQWUyZjVUUVZZRFExWGxIdG84Z1Z4MDJQMGZhY3E3Wjl1NFhY?=
 =?utf-8?B?NDdWTWsxVnZ5L3NSQWE0R0M2ZjdyQ0M3UmxVTGpIR09vVkVjbTdBQS9Ya3RU?=
 =?utf-8?B?RzYvSWVRQWp3SnNKRXFEN25aWUQyVkZJQmJUZ1JLQzBDSFplNHNxa1lRMTJW?=
 =?utf-8?B?Y0JYRlNEUGRsT1h1TWtjZ1lpQzE5OExrVE1odjZXd1lpblJyQmowSGtPZXhK?=
 =?utf-8?B?SUhnWTU4ZnE5b0lkVFhyb3hxQWpPNWp0NjVaOXE0WlBMcGlGVnJIZyt2akpy?=
 =?utf-8?B?cVpnaDVGa1FSalhiazdRckpPcVphakpsVjVPUEZtZ09MZWhCbnpKNlRHRlcv?=
 =?utf-8?B?MWNkRUNjdkpIT25CZlhEL1VOZnU4aWl5c2g3SDR5VlY2Q1YxRktkSEdabFNW?=
 =?utf-8?B?MWFocTNGQkxiY3dlc2h2OVFqVGFQd0UwU0c4WE5FYlY5Y3RidkFHVGtRR0Jh?=
 =?utf-8?B?R2tXSXlYQjM2MTV0TDdyd1lNRTNzRjAyMkFLZy9wK0lCVEI2SWpqUFA2WnhT?=
 =?utf-8?B?VVhaL0p6b0Z1cEg2L2hJdU5DZFRQQjZoN2RKcE9tZWRPM0F2NlcwamtoWjRp?=
 =?utf-8?B?ay9OMUp3K0UwY1BZdm0xb0JnMmNNdGZuTi9aZCtGVTRSa3ZLUkdwekh2aFFH?=
 =?utf-8?B?cGY3SXAyalJya2cydUl5empWZlZxT3cxVUZLQ1pZVEVUTE5BS0dROVlKQ0ht?=
 =?utf-8?B?S1pZRzFsbHE2elVrR25zcnNmWDdzbEwxSnNRU3dNVHR6ZzB6MU91QlNFeUoz?=
 =?utf-8?B?UWUwVzI0MkpweEpleU5PeUhHQmE5MXJMVUZkR3J5Mmo1dTNsRGVpc0t2L2RE?=
 =?utf-8?B?bHNIajZuQlNpKzNGRFZ4NlMyZ0EvMlg0UUUydlRnNDZ3THJKK2NzL0FBMHZP?=
 =?utf-8?B?SW4xd0g1c0FIMDVBNWhhbkQyNUxObUs5OFk5SEt5RTY3TlVUUy9IQnVmV1Bz?=
 =?utf-8?B?UXhSMy9tdGYxbitVUXRVNjE5Sm1ubGo3eGdMRlhyWk5weURzMFZvNnJuT3V4?=
 =?utf-8?B?eVRLZklQY1cxSUF4V1loVkJndHNqdmdXQStkYUxPdHVLcjVWdjEvZmkxbHhL?=
 =?utf-8?B?M3ZyTnkyRmpsL3ZmUUh4QnFKNXRWMTQzTXFlUGxmRXhkUEZOZXlvVE45eE9r?=
 =?utf-8?B?MkFpemd6VU4vZlRnQkN5MTJzRUZHME8yR0FJTmovMDF6Y3hNS3RianFzNzNK?=
 =?utf-8?B?ZEVzbzVHOGlzdjJnRjh3K05pUExsa0l4cFRoSk55Q0l0MDdneVROYkNaOUFw?=
 =?utf-8?Q?kQ2oXqz/AAsprdHUwOdpnDfwO9VvhBx7CU2cvtD3npUiw?=
X-MS-Exchange-AntiSpam-MessageData-1: Q6bgNNCTztJJaw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15fd6f8b-c3e2-4e9d-702a-08de9a9c78f6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 03:09:57.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2qJU8YK0HEyCwcBZXzWpThm+YIpUEgx2OsEdITEdWZw/fTK/9KWu2BfKz35bCUilnKJufA8cBsCeOg0liGLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817

On Sat Apr 11, 2026 at 11:41 AM JST, John Hubbard wrote:
> Add a todo.rst entry for creating newtype wrappers around integer types
> for device addresses and sizes, with a marker trait that generic DRM
> APIs can use as a bound.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  Documentation/gpu/nova/core/todo.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nov=
a/core/todo.rst
> index d5130b2b08fb..595a94e9ee2e 100644
> --- a/Documentation/gpu/nova/core/todo.rst
> +++ b/Documentation/gpu/nova/core/todo.rst
> @@ -88,6 +88,20 @@ SR-IOV [1] is work in progress.
>  | Complexity: Beginner
>  | Link: https://lore.kernel.org/all/20251119-rust-pci-sriov-v1-0-883a945=
99a97@redhat.com/ [1]
> =20
> +Device address type wrappers
> +----------------------------
> +
> +The ``SizeConstants`` trait provides ``SZ_*`` constants as associated co=
nstants
> +on ``u32``, ``u64``, and ``usize``. Device-centric APIs such as GPU VM
> +management and buddy allocators could benefit from newtype wrappers arou=
nd these
> +integer types to represent device addresses and sizes. A separate marker=
 trait
> +could then serve as a generic bound for those wrappers.
> +
> +| Complexity: Intermediate
> +| Link: https://lore.kernel.org/all/DHJJJNP5T5FZ.2HWBMOEEKH9ZR@kernel.or=
g/
> +| Contact: Danilo Krummrich

Danilo, do you ack being the contact for this?

Do we actually want an TODO entry for this even though we don't have a
concrete use-case for this? Nova is 64-bit only and will likely not use
this feature, so it looks out-of-place to list it here imho.
