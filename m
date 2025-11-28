Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6853E19C540
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 06:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764312702; cv=fail; b=sKCX/7WlvCePG5lyD2Nqk4G+tX87f54CfkOrn/+uIFAoKX73i6eilU8wmVcz6lXDd45a2UX+AlyAxW4+5mrCI6XBK3DKcxxQlkMUnxS7RQNPqrKVzDgTS/uQD6twBuoBuvWzP9Y+8Z4R1DqY1OAi651r8ilhpld1ZTaFS2D0OcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764312702; c=relaxed/simple;
	bh=5S7wDF9Nwom5wgkdZu5t2t8AismwbkpsSgFCCASORzA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=TGKJmaP0diCYEj6k3nvNEO/Oi8BhhrZchcd8AY4wCsUItJOPJAXcez70tIyX3C/fCKwyXRoBuY+fgsaRFM2MBqWWfuKYbs+wr+K10ZKGf19PPH+YWO6H9qCFlJhHDkn6EXwoiX2C2K2aBq8kGyG6GHjZqGq6gzYTWCQcKd8tnsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uP0IGUUs; arc=fail smtp.client-ip=40.107.200.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uP0IGUUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dH+n7KHsFsxOXBwYS72b7/ivcirjZzIBtFISeCrL0hMbKMPjnj73vr/zF1KAw3N9Uir4J4oVHuDr4jgjZ144hqdhipPwJufy9k20nQxGAZX0VEk0s4SMUfRrNFLAFF9IqmKG2oHhdtpXD59Co/7NWNVFPvxrm4PVjiOd7BzeR7PJXTeGUO61154StmaMD3vfMbQn6DbEm9ftQug76NjOpkFHVAWZOTPosHWQSm4c64MFzZeMZ7WHeuvOhHo4b0p6nUCyDjQsYKPlae7qD5tqJar1YEQTCuKEU/eRYdh0Iirm10fJXgpkoeEOBlQqqSWAoKxNQl4VAXC3BcStEOGQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dbnVgoV1sygrOQ+0mi04j4yQeX/h8hvQDRg8rmyRNHM=;
 b=CDWElhyYotdYsR9g2hwEhTIBh8wQfxiy4DH9A3N/B1AC/e8zRpOZTVCwNPDmHO764vmp4dfyuxF1YZF1yGYIU8asB4JddzuedZ3RvEmH1UQud+hSUsUu6uzIc7xgD5zz4qVFBHU3O01oG296KoQYkliO1pLYk1PttxgkThDr0Aa/au198fTxor5IqYigJ7G9jxPSJ8WkAxwS2mGBLBe7RWnkgFSYMv4+OPJUsVDz9bt7W1L1EDLnROD5+yNiVZFz6uPMRb33HtbufVlPMVC/D365CHCYrJn66gqzIfpjzZeEQjPx2Nsrt9iLRJ+OC7lXX/27uT3QI7QvqXn+cQSuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbnVgoV1sygrOQ+0mi04j4yQeX/h8hvQDRg8rmyRNHM=;
 b=uP0IGUUstnqtU2x/V5A1GdVWcpkEn+LANY6U62IvRo/Oq0zkLD6ZaYiP20mMT/QCkCF6ZYOKNgEeqh80XylauKBseKn8ezTP7hdNhgHSfRK1PgCp8QMz410rNV5Iqe8BPYp+cJQV1juT9QDQAUbnk++G1zH8G753oMOvV7rF1SMTQFjRRU/iKuDo9CwhOAwvS+pLHdzR4WvCmcUrfeAD0bvfoN2T8k9phO5ifkG1PYKBBkq2MtU9i/cWn0h/Crq32+nUJKTxXsDgutxFHSaxQiaVGzuxVIl4pCSMrjOFtG98fbANozLzEsbwBbqPvcT+0lRNz0fNmRSeN+SvKArvSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 06:51:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 06:51:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 15:51:28 +0900
Message-Id: <DEK4NFX9KS3U.38DNRG7ZMSZQJ@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, <dakr@kernel.org>,
 <airlied@gmail.com>, <aliceryhl@google.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: Return Option from page_align and ensure no usize
 overflow
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Brendan Shephard" <bshephar@bne-home.net>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <aShM9CAyRPe2gYpK@fedora>
 <DEJIRMFOO880.1V1IA1QDH9WQ0@nvidia.com> <aShdutWrmU2q7gUT@fedora>
 <DEJWIFG5Y65B.17EZVKB63RUJ1@nvidia.com>
 <CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com>
 <aSkzK4QDU6pN2GMS@fedora>
In-Reply-To: <aSkzK4QDU6pN2GMS@fedora>
X-ClientProxiedBy: TY4P301CA0110.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 15be96e1-4778-41cc-47b8-08de2e4a90e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWdhRGlpRXFJZ3dMUksrNmZzeXdxcWoyRk1aUm5MRVhrL0U1MEs5K0Y3N1pa?=
 =?utf-8?B?V1ZKZzU0OUtjdXB6Mm1OT0R3NWNqS1J6VFd6aERoZDdQV3dwQUhENGdlVWgw?=
 =?utf-8?B?aXpCU29GQ3YyMURFNjJJaVQ4VzB1QkM0eVd0dXpRQVZzR2o0ZWJSdlRRbG5a?=
 =?utf-8?B?bHRrU2cvVVRxTVlNelpHbmpZSGMyNnd4bm1iK3RpR0xST2x6cUFBK2VzR25Z?=
 =?utf-8?B?YTNxWmhjcDBPNFRIeFNMb1hqRTVNVkdaTVBYZ2dOTllzaXZOVjZyb3FTOFl2?=
 =?utf-8?B?MjcwTnQxeWptWjREOWdudmNzM3JXQVNIWXVvMXByeFJEUGc5RXJ6VHlIc1Ew?=
 =?utf-8?B?T0Fub0RxeXV3SFE4bktRc0tYMzJSbnhMWll1dDZiL3ZTdTlrZHBRcS8reHU0?=
 =?utf-8?B?aXduN2lUYXVPb005QWtDWkxFSjVSMFBRYk9BMWlUQUJUNis5VUFQZ2liaVdU?=
 =?utf-8?B?MFI4RnNpck1leXgxUW1WUGQ2K1BWYVU5d25nTENKVVRLRC9RNGR4b0l6OFZy?=
 =?utf-8?B?aGdvMzliWjFkK2NzeW1vcEhjZ25JZXFZT2JWRVRiK2srTVA1blR3ME1qMDFN?=
 =?utf-8?B?c1IwTWNjYUVhS1BmYVdHVG0vNTZFV1o4ZEd1c1BVWFZlS2FJa3NrUWV6TXV6?=
 =?utf-8?B?dVRaTVBnT1lEVldHN0dDWUF1OXFVOFM0STVKTWZ0dVlvTXVpdTROSG9mQkdn?=
 =?utf-8?B?Slp6cVBqOU0rUGdpZ0RpcW01VmtzU3FFYkNzbHpOMnY5Z3V3REtySkk0TTh2?=
 =?utf-8?B?YmJTeVFCQVlISjVTOGFHcThYOE9GYVNaR3RJbWNvYWVoYmhxUGg2ejhZaG11?=
 =?utf-8?B?Zm5adldEYTBudlZWQXJCaWt2VTltTmhPekthRUVLR2tFRjJNNUFqNE1CNmZk?=
 =?utf-8?B?RjhlVlZyTXBOY0J1WStETU1iUC9ydXY5cGc5cTVkbUcrQnZvQkp5NUpVNVRR?=
 =?utf-8?B?eWs3TnAwc1lzN1BaS1NzRm9COTF5VWYvdzQ1bmo4WkhsbXBBK3pIRTFiWjZS?=
 =?utf-8?B?NitmQzRSL3dvRDhuM2V5R05KUy9HM0VpUzdmMUsxYThwUEJVN3VHM21vQmdv?=
 =?utf-8?B?MElEMHh3Wk9Bb08vY0hjSW9tK0N2amsrT28rWUE3Z3RnWWY1bFVQbjY5WmZi?=
 =?utf-8?B?MFN0L09LMDNpYy9wSEtHOFVmbGxMWkdEa2g4c1BjZkpBdmI2SDFSOXozT1gr?=
 =?utf-8?B?RENmTzBxa3Niay9NbHFGOGhuck1qN0tWQTczTU5ObGJkdGV4bVhQeGFEY3Q5?=
 =?utf-8?B?MGlDRGlmOVFoWjE4dDlWZ2pLV3ZvcE5udi9YNzIyNUpSTFZzV0pMZEUybFRw?=
 =?utf-8?B?SXJRYzA1cjBLSVpNeEs4TkpFcmJJRjZmWDNERWI2RVRLUStWdlpJL0F2RzJS?=
 =?utf-8?B?cUJUQzkya0RNNU1JSmt3bjczY3dqZmVxMDZMRmgxdDFMRUZJcDZpMzMyWElT?=
 =?utf-8?B?VU5ZcGpqckdQbExhOW5sRGhsejlTS1hzcU9xN1YycXZSZUxsZTdBY2JTbFpL?=
 =?utf-8?B?cGxwbmdZWGtKcGw5TVhDZU1LQlpRenRpbGlXQkN5TGZHRnJNdEgvcW1sUzdG?=
 =?utf-8?B?N0IyaE5ualZFSXZhV0Uxc2FzbkNzTGlybkl3SmJ6Z3pXSThvbnBjdjhrVGRy?=
 =?utf-8?B?UGs3NExaUU93ZXhkUU1yN2loYU9sWnVXaXI3dDBpT1k2Zmdta3F3K1kzbENz?=
 =?utf-8?B?ZWtMcWJiNmhTaUZIYW5JcU9SNmQ4NUlTOHRNK1F5SFJmaEx4REFjaS93YXF6?=
 =?utf-8?B?TnIrQ09Hd3BUbzRLTkRMY2pzQ0k4UlJyZGZTVkZqbEFKaUlRQytsVlVDTXRv?=
 =?utf-8?B?ckhpU0J2dHVIS3p4WXJ5VnFLVXU0eFJTcVlaRjdmUzBVM0FWZldZY01QWXV1?=
 =?utf-8?B?RFE5TTJISWQwdHEyN2xXODRxYkxrR2RuaDBDdEJMNEp6clRYK3BQZ1F1dzNU?=
 =?utf-8?Q?ywbjXr4bWN0wG8MEek6Afm4P+yZ1aKrq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yjk5Y0RMZnR1RnlScmdQdmE0ZHY4OXFiR3h6WXFPcHFydUhSajJNdUxva3hC?=
 =?utf-8?B?SUlUcVowT3QzNkFhTFZHSnZJK1JveG83T0tYWC9tMmt5V3Y2QlhUVnpVb3l5?=
 =?utf-8?B?WklyZTA5YXNZcG5DRTNzUlBqdzgycEE3UDhuMi84WVhGVTBOWUl6THNFa1Z6?=
 =?utf-8?B?V2dlT2pWOXkzREtpOS9DTnRUaW96S2pwNHp2MXhsV1U4U1hERmdacFB3WlFY?=
 =?utf-8?B?MVgvbjEwS3h5TnVaWVo5bnJIM1FkUkNTRzUxOVVKRkh6VGRpRVNuS3RNVFR1?=
 =?utf-8?B?Y1BSNW9ma3c2Yzk4bUNNOGpZd0FzTUg3Q3gyQ1dvWVdWSjEzcXRmd3VDV3hn?=
 =?utf-8?B?NlJ0NUwxQTZXM3hpN0YvQkJXSWwzaTJrZ2MvemM3ajZvYXBXWHlQYWpJTjRZ?=
 =?utf-8?B?dHVHakg0Qnk0VkNkTUs3VytyV0xBQVNiSC82ZzFzNy83T3FnbG5CVENWRkky?=
 =?utf-8?B?UzhIcWxMSk1YWUhMMEhKbUZtZUFOWFp3TmVLYVRHNmp4WGphWTk1MGRJUFFr?=
 =?utf-8?B?Mi9qZUFlK3l4K0gyQ3NUZ2kzSVg1OENoQVc5dlJiRzVMVEVaTHZSRzBOalNU?=
 =?utf-8?B?eC91ams0T0JaTkVDcGNsWDJxZWFHYkpmdUt1aFVkSSswVXRWZHl2L1NqM0Zx?=
 =?utf-8?B?YVpSSFRqd3IrVytLcDdEbWx0bll1K3BTOHRFeVQ5M2tFVGFVdy94UlVES2sz?=
 =?utf-8?B?VklSV2tidENVNXZQQ1RaaGxmRWJwRjBDNDRGTGlKVXRUQjZrQy9ZOExCbVQ0?=
 =?utf-8?B?ZXhPR1BQZHVnWFdyK1VUOGhjOGFlb1k0eXRpTVV6NjJ5SEVNNHN3TkhmcFZP?=
 =?utf-8?B?K1lwWkxVRkQ2RzJhZnZQYUFPbjlPVmYxTTRZQ3NxR3dzQ1lEaDlKKytGN0xk?=
 =?utf-8?B?YURKVXlQU3U4TTloSVdteDM1MVE0MzJpVG9qMExuV0FuZmE5V2c2UWdkZzVF?=
 =?utf-8?B?cllSVXRZZlFFMDVZNnhDWFl6Slc5Y2t5NlpQQ0hHMEZqTUl0cWpaMkJGNWpl?=
 =?utf-8?B?VFpmcWVHUjZ5Y0JhdHI1TnNJWWFvMVRUWTB5Und4ODFNb29LTmJpUFJMdVBF?=
 =?utf-8?B?M05maGNuMEVZaXBydUc1S1RSeFgrcjBhdUxTVkc5NlE0RE5EdTBTU1pFRmpK?=
 =?utf-8?B?NjRraXB2QndBemt0WEpWT3AwQTMzTjl2OHBKbWJraTdOQllFR1dPTFJwZmVl?=
 =?utf-8?B?NEtzS1lxRnBKdXdxVmFlQzQ3Mjd0bmZCUWdXMVJtc24yQVZpL3BxWG5FZDhZ?=
 =?utf-8?B?amoyMURmQ3JlTWVMYnFiQ0ppTFVBZzlhUVZnWlN0L2dRMUNHcElXRmtUWGxj?=
 =?utf-8?B?VHduNjg3Sm1ucXdLSG9MSTh4R05GUmgwNHJheUNFaWhjL3IyZzVUb1ZLQlN4?=
 =?utf-8?B?dm4vVUNrMTdKYXI5d3JQVmEzUFd4bHNxcWVpVUZDaVVkanVYcnFmL0NPb0ZM?=
 =?utf-8?B?RjRGT0F3UHBCOHNqWExWcC9scldmZW9CQXFYUjhDQnMzZ3duczdldEh3d0hy?=
 =?utf-8?B?Ulo1aEtSMW9uSGU1MkVWeGNuT1BzUVJvVWR3d2dzaVV2OTcwYVA2ZWxWeGFN?=
 =?utf-8?B?UXl6RE9wTjFVTzlnaG0vekx1SG4wM3NTZ1M1UXBMVWhXSHJCbHVITitIRm1u?=
 =?utf-8?B?dndKY3kzVzM1QzFrT2RVa3lDYThqTEtjL05DbTQ5VGh6MmVOdmlhRWZCMlFt?=
 =?utf-8?B?WG1rRnIrbHBvS0VnRU1Wd1A4dlo4b0xHYjA2cUg1NmFTRWl4YlY3L25oVThk?=
 =?utf-8?B?WXNxY3lIdDMrakY5c0g1OUF2Q2FLbW9nQ1J4UXE4QjZGQkRwbHZSVFdiNVFz?=
 =?utf-8?B?V1cvbkpnbHlPcnBuSTBFYUVHVFBzRElIVGUrbTJBd3R4YkJyVDdOdm03eTlC?=
 =?utf-8?B?WmQwRGVjOXVRblg4ZUVKdG9STXRVUngvNUxjdUJJckVJYXBQZEZzMXhUSHpI?=
 =?utf-8?B?MTZVV1RiQlQ4SmlheGt3RjNCRkovc3VxZVlxMXU1Q05JdWxmMk1zM2tyRThS?=
 =?utf-8?B?WnRrYThTcVI4NDB1WDN0ZnN4aFBpZ3c4UGllK1lQQnpXNXFUSVdnbmp4aFQ4?=
 =?utf-8?B?VU5QdndOOFNlOTNIRUsxYURiRDUyNHE4ZmdCL1dsdlRXamVIbVltSUxHZWc5?=
 =?utf-8?B?cmlXeG5xWEh0MXU4K1Vhc1lQZEVvRXBkb09MSWRhQ3JNTll1Qi9qcUE5T0sr?=
 =?utf-8?Q?8+fHqZtHJWgTxr+gj18ra7So+rkv+RVhgGkkGqPlVKLr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15be96e1-4778-41cc-47b8-08de2e4a90e4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 06:51:33.0989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWqAL/tlhFs1a8BzRSwkfvNxqoPKIOU7y1mXferOYn5luuoiEsZBUkEf1KVluhT1j7vOK7z/mM8Z9JE3LSyfVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518

On Fri Nov 28, 2025 at 2:29 PM JST, Brendan Shephard wrote:
> On Fri, Nov 28, 2025 at 03:12:13AM +0100, Miguel Ojeda wrote:
>> On Fri, Nov 28, 2025 at 1:29=E2=80=AFAM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>> >
>> > Ah, indeed. In that case, can we make the if arms symmetric:
>> >
>> >     if let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) {
>> >         Some(sum & PAGE_MASK);
>> >     } else {
>> >         None
>> >     }
>>=20
>> Early return style makes the happy path less indented and is more
>> consistent with the C side. However, here the happy case would be the
>> indented case, so `let else` would be better:
>>=20
>>     let Some(sum) =3D addr.checked_add(PAGE_SIZE - 1) else {
>>         return None;
>>     };
>>=20
>>     Some(sum & PAGE_MASK)
>>=20
>> Cheers,
>> Miguel
>>=20
>
> A wildcard entrant to this conversation. We could do a match instead if
> you all might prefer that?
>
> match addr.checked_add(PAGE_SIZE - 1) {
>   Some(v) =3D> Some(v & PAGE_MASK),
>   None =3D> None,
> }

Clippy will likely suggest to turn this into an `if { } else { }`, which
puts us back to where we come from. Miguel's suggestion of returning
early in the failure path looks good to me as well.
