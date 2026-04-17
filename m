Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD4D22CBE6;
	Fri, 17 Apr 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776434802; cv=fail; b=j96WAYBOzJNCS5zeAaCXksoEzSl1+M/odNICtSvpIVOjUn/hKKzYNzV9eEjb5/5V2sP17RpfM16nNnhSGdI5Mbl5Brfr3YmX91kbVXyvJutVzxlcfJwTfASnBHfsFs6LcRCc/QeICVQd49QdYbC9uYhiGqFbQ8YoQ8fyxVYmeRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776434802; c=relaxed/simple;
	bh=wCv4D0YH4Hq7riwYwZAGyNAJKip4CTcP7FY+Qeea7VM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=KdGdhA2Yx1BflzNVsOqPLWa+f46lBv+KO9tWVw3Xs1e7Td1lxfTZgeqRZ+Yq0z9l46naRXoaQTtud12A6BYXmQkf1q8fd9JL5wVNsdzYcON5xHBQ/1/ObErf9tCXC2UKYQ13MSH+2VwF6FZSgb3LEOcYY0tObBl+Axd823BZ5tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uSDIWdXu; arc=fail smtp.client-ip=40.93.196.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uSDIWdXu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DG8jYXGIdvTHt5BhTVCy48tSUpvjp1gGp/IPk6Dojos5LMeQAX/Va7RQ/ZBzkrSyH0RE4urKBDIgJa5z1HGaFsEfAZ9O1jEodJFRbjk+tVzNTL4Sfk+7p7vzBwn8mqFDzwesEDeAWQA2hs/qmsR3Mw3XCApFG3zM/bIR31KcVTWIwrEP82hjnCpY9awtVvntqWJeriqMpdlEBf3E4doUVm9IueOE87+ttAa3eCtq+7MSE/Sn0YSsOgn3KYfWHbNeSwVF5MJMLcRDSnTy5NPr2UrHwfPD8F/kXdh7FAZO73RivzhnHCfuNqVSvlrJWZ8UL+vHOPAXgAa/raR8o2/9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCv4D0YH4Hq7riwYwZAGyNAJKip4CTcP7FY+Qeea7VM=;
 b=ZWkO06o4+WnHULoWMp3XblckmxOczKzYt5WTdibcq2ws2NqMEbm6ME83Uf5TpKwDdr8VhbuViisXTdSuzIuYMzABzij0Pm9Ah03U61ouyNTAYxIlMKDutOgj1BsM8udJ3d6A+HIw6PCLUJPwmm+OUR2cNhBtjG8teitpMugkSC1XpmE5qO4d+wmxkLnMk4Be59XDbu7/6V7VNCAEvlFrWrFa/U5A+0gnoX6Y69PXxaY7Rec4LqqbEE8ZLcwipnxtAubaBItKJCG/9+5kEmpSh2fdQ7r43xAJPtLNJiHHtDt8gXTC53A4vGsH4PNYAUZq+s8ebTcb60Yf0TNwpVpLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCv4D0YH4Hq7riwYwZAGyNAJKip4CTcP7FY+Qeea7VM=;
 b=uSDIWdXu/+rSfm/TpL487Uwt8xJYyeHG5m07srR5FiSI+vhCLDDCfMjvVYZPUYspBcGzS5A2yH2mgCbuYiPd7hJtjza4TpgOiGvVxkLEeIFLgz2fZyvg+B7C7fQJPtvBdM3UmRg9BL5nElJk98YKMsMOa2aJAYUR2r8FzQud6JWx900W3BOtsxfrJ4DBmIHomBaLU29ROADNjgXNIrh6uv7uU/8PSAOAel7A6vjGHW+s1FMi4XSwIld52tKclYY9eHiB3h+8W7EI4g8LEebVWIHeK2UMZc4zwOtB/oDZ5k2S1/K0Psb2/AcWfHiY7Zsk89lCnRdg4smDH1yto8JrNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7821.namprd12.prod.outlook.com (2603:10b6:a03:4d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 14:06:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 14:06:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 23:06:30 +0900
Message-Id: <DHVHKSI90H02.143VLYN9JY4FZ@nvidia.com>
To: "Alvin Sun" <alvin.sun@linux.dev>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 1/4] rust: sizes: add SZ_4G constant
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-1-41c6e9bb061c@linux.dev>
 <DHV3SQ191564.3FMK513OJUMKV@nvidia.com>
 <cb3dd598-04f8-486c-ba6b-9965d93170a0@linux.dev>
In-Reply-To: <cb3dd598-04f8-486c-ba6b-9965d93170a0@linux.dev>
X-ClientProxiedBy: OS7PR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:604:254::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae1762a-ddcc-404d-fb71-08de9c8a885b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wXj+firHaI4Z9QnAMv6osNPTZndqLafl5umBEhk02ikByVpIoQYh8G2xV9Uin9y0oYSSZcQK8B92+2WijT9t4tPay3TlNTxNeK7lR3rOPPr3M2ybkBiNFjG7b7yWcYhGETy+7lVIEQTQmtbEbgWQDoTNfWHwTHLa06EkD8CmyzIDlMSEYpByztGc3fW/dfFeA2ENh02RWnu3iUoDOjYBFeVcFwqbLv2pAtYHfQq4YPOirkvao4mRxFZWjMzqYqXlY3gzi2D4A+vclr+gc0ZU61N5clSbOhbwL7CJ/zIYzjE6xlKeqtK/tg2DM7VIB66mIfTio3edMUygrd0ysrGN2R2Yj1TAdMPJQsONE4WaYVSHVTOt4CATsUiQDRZw/U+WCx+5TsjTzyMPA0b4qyF7foUHgnHCvssIG+6gGR5TQF24umtAtSqqZ6G62mBxwZsu9jkQ15MErgs5hiL2/7JOGkR1JByeohe48/NtGof1QC8dZdkKqZz4Opewdo1tQ6iESUFabspW+ehdHpPW705trVH4B6YDHruQIF2FR15i1bp/feN4lpYuFHkRI0MvXT4Q462KhrvHu31zLkN/y7icSPFFZ63Wq4fSUUQJ1+gXm030juo86oKh4sfsLuBJzeTK4vkwwgG5ixFw2a6SPo3Vx7Ynksrsxf0bzH5BjkCZnM3IyHpFDGPcXv+8C8Lsf1bLsVIsgJmpoL5cB9bfbcg13u9HkeKO9bbGCKaU6TtSJlo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T09Sb3NJZzh5YjRCOUxLeUcvclgyV3ZGby9QNHYyU2YrVHl1Skg4TjhWby8z?=
 =?utf-8?B?dEVLZEIyZlV0NkpLUFBGVEdsZWRpUk4vUVJXbXZxbUFYMU1tS3dLdU5Wb3Ar?=
 =?utf-8?B?OGlvcC9kTXJOQk5TcGJQeDVSdXpFaVJxejNkdEpYZVgzeVRVd0FGMHlNc2l0?=
 =?utf-8?B?R0ZLQThKdUU4UzFhZVBqUmw0U0dBZXM4SEJpTk9idzc2OFYrMkVnbDhGZmFo?=
 =?utf-8?B?RWUyZUcwZjMyNDZmTTBkZUFaYVJEMUYvYjVmSDFINzJVRmx0SU5Ib2p1MGU2?=
 =?utf-8?B?UG9pcGhoVUJxR3NHcHQvSEVzSzU0dVNzV3l6L0l2YThFU3NTTnBzN2ViN0Vn?=
 =?utf-8?B?Zmc1UnYwc0RhL3RPeVFURTcyYWdKOXlDOHQ3dmlMM1VPRVJ1dVIyL0pxbm0v?=
 =?utf-8?B?STI1L2RudUpjMlo4QkhuTVZvSUNQMURvYzhzUUljOWdmS2RnMmNWQS9Gak1Q?=
 =?utf-8?B?KzZvTXhFMUJkd1pucWk0Umk3YkhaOWUyTHpBSk1oRTBZRmNnQVZBNmhzd25J?=
 =?utf-8?B?cVhhRFM0ZXdOZ1ZWeXQ4aFFaVlBIcHhseFRsNnN5MlBpSVFGQXc3Vy9EamhB?=
 =?utf-8?B?d3FFNVcxb3I0b09URVhzZlJCL1NVaEFoRG5DTnJ3VGtaQ2tjUURTajFKcldG?=
 =?utf-8?B?V20xMjJlM29nSjZhY0VISkxvL3BlV3FFM2h2djQ4US9pekN1cnk3REpUV3I2?=
 =?utf-8?B?Wlg2QVFvNkJORHNOeC9xSVpHaWlReXBHU2NZZ0xHbzJqSWg0OUkrL3kvVUFC?=
 =?utf-8?B?ekNhQzRsdWx1T21lRUJtUTV2SHo1MHEvZFdPTlpQWmdJeGIycmJ4MW9vSFdi?=
 =?utf-8?B?RmJ3TTlqTHJlVUZvbTNRVFcvb0dWYlFmNyt5bjhYWVVrVTBmOUNXNGZQRExU?=
 =?utf-8?B?VXU2T3VZRWl2M0NUbzh1Z1Z5a3dFTU16WHFTQndKOG5kZ3hueEdmOXZjaHB6?=
 =?utf-8?B?UjhGZTV0T3A5b1IzOGkyMUFrZmlNdlVOcGMzN21rMGR2NjFXaDl5dmZVVzN1?=
 =?utf-8?B?LzdpNzlpUDVuZWhsNndxdmM5c3VuZFVFeG1UTExHZkJUek1OV3ZlVWR4bkZF?=
 =?utf-8?B?akQvT1hUelVucHBEaEpSS3V5WkgwSDl2RmVKakhxSWZjZ0ZMcWo0R3lJdkZW?=
 =?utf-8?B?UjZWWFZRemltMzRRcmErZUNKd1labnB3aFcwNU0xQW9JK2JucjV2aFZmWXR0?=
 =?utf-8?B?RksyTCt5YTB4MWlDWWtzZTJrZHhIWUNGdUVqT0U2U3FVKy90Z1Q5LzllMFFN?=
 =?utf-8?B?UmY0U1BpSnRONFNrTWlWK0trQnMvWm4wZTNYZFREck5FbkVWR1U2Q3BUemZI?=
 =?utf-8?B?aGZuYUdMUFRyM1diUHBVTSswUDkvWUVzbHhxWTZWalhiK0pYS1VVaGtZY012?=
 =?utf-8?B?ajQxdzBVdHk3S1BaK3g1M2pEVlgzd05sSHV3VnU1bG1DVnMvVjBtUlZIMG94?=
 =?utf-8?B?WldRVk9HVnpPZ0FKdWZtTVFTc1FyRlR6aDRkWjBLVUJsNEw0MW80Z2V5eHh6?=
 =?utf-8?B?aXZ6aDdNOUwzS0VjSFV3RHNWSGxjdFhDUnJtOWYweU9HcFJDSnB1MTZ3L2c0?=
 =?utf-8?B?NHkvVDFPblErRDQxM2swVGs4TXVHVVZmdVZrSjR6bzlzUkZSOHRPYjQ1cFBU?=
 =?utf-8?B?Z0RqMEQzdlJiQmtkK1FFeHBKUnVRL0V4ZlB5cUl3MVhSUUVwR0lOMkt5cDJt?=
 =?utf-8?B?U3RGMGtMVEpsVnVyb0JpTlpCSzdEQW1idUZQNGtCK3FKdzBzMlZxR3dtU1FH?=
 =?utf-8?B?QWZXaU14MEhvOXlMQWU3bXlaUWo4NlJ3bTlmd3ZLbzdmWjRDRlJpOHpxZkg5?=
 =?utf-8?B?UStjS05oTHFMUFA3emhUNzhlL3JxczNkSUZTRTRZWE9ScWJUaUozeUlFSnRR?=
 =?utf-8?B?M2pNT3RqdnVTTnFxVzliK2NvUVR5WWdWVHZNWnhjRExFbkRzRFcrSUpMRlZU?=
 =?utf-8?B?Uy9kOC9IRUdJWmtyU0cxR1lTRTFSdlFpSEo4OHVPV1ZKS0gvYUhXZGpvdzgy?=
 =?utf-8?B?aWV0Y2lSbUdubXJ4TSsrWURKVU5tdXVMTktUVzZLdGtCVU1KQUljc2NOcWMz?=
 =?utf-8?B?d0Ryc3FDOW9MYXJ2d2F3RFdJQ2wyTmlGQXk1MHdwYlVRMkthbk9RNzdzTGFR?=
 =?utf-8?B?QWJqTHFINVFWRCtPRGtSVlBmRFZoRW9McnRhYkZMSWhRWUV6a3M3V3BWWkdO?=
 =?utf-8?B?U3hKWXZOU3dHLzI1TkMzTHVvYVlaQnhZN2ljNWgzQ3d0di9sOG9XU0hMVlM2?=
 =?utf-8?B?aXpJTXI5VzVSUitMdy9qNDVJVXNzTmFlL0pvd3Z2MnJFd2xBTkRxdENRc1I5?=
 =?utf-8?B?eVJEckp2cXJBNjdjREhhYjhXREQwNXRlZ25QVVNFWXZHZm9IcEhjSUNRN2px?=
 =?utf-8?Q?oCCyxostuWYDIulChwBi2bXAqrzKrjJKQuuGe5bTAjQ69?=
X-MS-Exchange-AntiSpam-MessageData-1: gtIJZG90gWjCdg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae1762a-ddcc-404d-fb71-08de9c8a885b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:06:34.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEfH+odvACS23qm7kf+ZgAPHcQnnTdo+6DdqxCJudkYoA2soCEkB5ZDZmI4K/zNn8vVDPQyLFQV2mGC/BoM0sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7821

On Fri Apr 17, 2026 at 8:56 PM JST, Alvin Sun wrote:
>> Finally, maybe I missed something but the new value doesn't appear to be
>> used by this series?
> This patchset is a prerequisite for the Tyr ioctls patchset [2] that I'm
> currently developing, which hasn't been submitted to the list yet.

Why not have this patch in the series that actually makes use of it?
It's a bit confusing to see code merged without any clear user in the
same context.
