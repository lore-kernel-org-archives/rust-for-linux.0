Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C4189
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518886; cv=fail; b=fhm+PLgfxxeRKZ36k5zS9ThSwoDMH5AfG94u/GAvy0p3mCRGSag5vMPRycn/ifi/Ikb6gu6/XJ6VAawf6G+BQIc1KI8ZGhO8klG74q0Cbd869elyfF4LQrM3X+/2U4G+9BhsB6UVPyfCqs9sln45SurPT0ZbWY5XhaDBTVy+a9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518886; c=relaxed/simple;
	bh=Xl361v3U9+qo15UPtq+AIPAnseXbKyBHrns0OtNuviI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=CcY/FjQcSGJrwIxUo6vfF14XXx3EDXqRVs4yd3Ha27JcLZpwogRaXiZ6Q6rAJvOlDXNBEiSHwoQp9CjfyVUezOVDiqGcPcvrcK48dhKksXde3T0RV2twIaJzr8tYbxCPb5sZ18SZhCwFXJBiJUDTP8Z4Zqs3HlYvOV3EI4+jSDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b8GCdJVL; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b8GCdJVL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfd1TMDd/OX1jPS1limleiT176IL1k9HtoKOo6OQlK5eOhHyWqGL8tGF5M+Uglrb/oqEN7ukQ4GpOBvw8a1TMynuIALKoSmT4YxJnoRNiVVnDPuj+U9+ThJYjCF5gZzbjpY7uODcOoG/hlXE4YEgUqiCFNj4dSWf1wwUJIwtLF4J/j7jjYghOXl1ZFc6cMHtBz7wJ5uKGqlPH15QIMVjUXtA9U+QdxPp5MLU/YtE3b+QVYkjtUBie+jvMR3KkJaXxFOk4JwXx0hXrAd38kGix/kVmVIqMIxQL02g3XF6vYHRfEMQj64LRgM0c8PE8FYS8ZPF9K+NGzXnnBIbA6fS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xl361v3U9+qo15UPtq+AIPAnseXbKyBHrns0OtNuviI=;
 b=bCTCNfR839rvH31BTX46iO/+88B8/NrVCm5dQ05QGOH2j8xpl/FP8qMcbjzpQtZBBfqzigxICzTPDd/rQS398+bVrnlQMD2Rmisd2t4dVgS7Bfzk2jYiADZ8PMpHyrzg6ZOBkJw8Q8IvxDs/6AT0zfZjETj2FHdVluhQKjdgfZe14tWjMa7Q031IgAXDqUHCA94M4zHXhb6PJ5z8lSQ4yNOuIQI7ZztTyB2nduRcyuh1R31+sJd9y9FYAqdIkiw2ziPKd3jpErzkwbLRrY2Z5p0efSDIJsIasevqKd8TNPQGoPh7tCUFNdBB7ituma2sHfd2aBtXFtGtRpguqNFX8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl361v3U9+qo15UPtq+AIPAnseXbKyBHrns0OtNuviI=;
 b=b8GCdJVLH8z9ylEnv6eHd+FQvNTJK8dvsS+yhtzRbWbww04sftS8YyY+Y08ICZmBj/TcHn1Idt+z4nJXhfaRD8oF8EBtvOYK9aaVFN9CJv1E9QVZRljR64Sj1gMDpZFTJx8db+0l+bPcIzYlLBtYVhLp6/UDFxEe0Uc8caYUr4WvdMkI1zXbWfoSB8tiX8f4mti8LEGe/jTxImLWQ4a1OpLvCNDBcwNj22pH467v0Cgf4seisFdN+eLEHKta2ZdJd9euKKQQByszTQzf4PvB+bkWR5TVuZYx8vAoVYONBVUZ9KvCWE7eri5csY90DTa389nIaoe5NnCQNne2nFxjFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 18 Aug
 2025 12:07:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:07:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 21:07:53 +0900
Message-Id: <DC5JI56IJ8YT.1RIS8BHFCUXZG@nvidia.com>
Subject: Re: [PATCH v4 5/7] rust: alloc: kbox: implement AsPageIter for VBox
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250814093427.19629-1-dakr@kernel.org>
 <20250814093427.19629-6-dakr@kernel.org>
In-Reply-To: <20250814093427.19629-6-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: a355b24c-2ddb-42b1-61ca-08ddde4fde53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3c2c2JFK1BoMWVkamJmLzZZV2ZKZlRRM0VGK2ZCM3FKSWJHbEFZZkdqVWlC?=
 =?utf-8?B?Q3M3ZzdXTWxVd3NBd3ArWWd2UmdtcmM1a0x4Rmw2VkhDSE5PZzJoY1QvNUUz?=
 =?utf-8?B?STc3Z0hjYkU3WTBIOXdqY3RlZUFXVVJmeXVYVGV1L1k5Q285SHMzSXVlTWVO?=
 =?utf-8?B?ZmNqVnBCd3RnZ3h6NUtVSDF3WU9QUXZwdFhOcmhaMmY0dDZRUmd0ZlNjOEFQ?=
 =?utf-8?B?NkV6MGFlS1JiUFZTNjB0T0k4cE9tOTJRRjh4Ui9qZUVTQkkxa1poUkZaSU9Y?=
 =?utf-8?B?WUpFOHJvUWQwUWJOS01MRVNhbWRURHNBNk9YNGhad3JRUzd3bk40ampHVE1h?=
 =?utf-8?B?NTVhUUR2cnBSaE1HeXlFQkVWaEZsVGhPUUZURVR5RW1CR21kenBOT09vc3B1?=
 =?utf-8?B?NG9zdit2em1uU2RKSHFSazhpalNlK095bmxBdTNvQnM0WWZPcms4OGVTa0xY?=
 =?utf-8?B?aG5LakNFMmN2cWE4TTErWnlVclBkTDZ5UG1zZHI5S2NneFFzazZIcjVqRHZi?=
 =?utf-8?B?emVlNkRvQ0Y0UUJoamR4dTh0ekp3NUNCVXJlc2t4R2tZSTdGMUh0MnZJdzVX?=
 =?utf-8?B?NFgvM1VNZURyNVlGOFpwWUl6Qm9kOE9ubVhGMEkrZnRZWjNMaHJwWi8zZk4y?=
 =?utf-8?B?RHc5NlV5cHVFd3Y2Q3VZWCtkdzZ2QlcxMXdDM3NSOE9EQmJSTDAxY1IvOGpu?=
 =?utf-8?B?eFBaRHFDTkhyZFA0YmVEdXlVVzk5dTZNQ0VURWY0U1loZU1leW9admNCK2F1?=
 =?utf-8?B?dnBBWDFJZXRSR0t5Q09RV2MxVTZGdHhRODFWODhyTnkxZ3NBNGplMHprN0Nz?=
 =?utf-8?B?V0F5T05Pb3grNUlNM2xGSTRmcFdXVklCekROMzhHSVJrYThDVHBsNHp2dTBZ?=
 =?utf-8?B?UklJUk5ENDhVTjkydm80d2dLbUczOFJqQXl0UXBmb20vSVFEMUxJR0tBTkFr?=
 =?utf-8?B?RmdVTk1TaGlUNmErQmdsYW4vLzl1RDBYRjhFcVM2dlpjQVlxRGpXTXBId00v?=
 =?utf-8?B?Y3hLVDNVSlY3VXdnejlQRHYyWUFBNm94eVlTNDd5TFNSYnFKc3F1bVFHV3ds?=
 =?utf-8?B?RTBOVXZRTHM4NDZ4Z3ZlR29DOUZyd2Y1cjVudFNXMEdLKzBUSldQdEczWmtn?=
 =?utf-8?B?N2JRc24yem1keWlmdjVoeGV0TjBRRkhoSGV1bnlQMHdDblRSRkhhUE1nYXBZ?=
 =?utf-8?B?QmNRNHJvM0tUOEJvc0tsYy9MS2RuNktZeU44UEZqMEd3c3FNYmU0UnpNK3N6?=
 =?utf-8?B?NXRVWG1tYnNzR3A1QnFPcWpQK1RRTTVkbWtZNXprNituQklEUXNXQUJ4UTRH?=
 =?utf-8?B?WmU5QnMrNVdRMGZnTm5UNXpiTW9ZWjFjODdxWGdYR3ExM3BkNUt2eUNzZm1I?=
 =?utf-8?B?L1d3WC9DV0hMem9aRmxpbDlKalNSN2FpbzN3L0RwYXJ5N01EMExxRk0yekhF?=
 =?utf-8?B?REU3c2RxZjFwRDdKdkhBM200d1JRNmpWQVdsSWNLdFZkYkFjMkU3SzBKZTFR?=
 =?utf-8?B?QVovc1NreHU3OStSQUJlK08xaCsrd2pLL2tvek1HQkJsRXM1TXNMY3RzZnhk?=
 =?utf-8?B?QkFnUG55dWRkK3R5SHdXUEpoc3BUS1JRWlJEWTVkWWNtcitUbU1mMEZPYUta?=
 =?utf-8?B?S0daUDRRMENpZm1RS2xQMXFxZDlkOUdnT2ZrNzdxWmRCOG5LOWVOTDV3ZzRK?=
 =?utf-8?B?R3U0QzJiQjlhbHIzdUVFTFJCUnpBZXhmTlNuS2Nnd0g1Zk8rSFI3VmJTU1JR?=
 =?utf-8?B?V2RtMUJRUzh2bmVEMis0K0NmeGx2Um1EcGRSQ2NvSHFKZExJRlpIeEFUZE84?=
 =?utf-8?B?NzZUZlJJWHhWV3RUWnd5MFVjZ0c1aFRJMnFITHEyRzNrT3hXVHVmN2dITUZS?=
 =?utf-8?B?RTBMQy81S21ZZVpmRWwrb2hXSXR6T2g4NTdIZVE0djB5TE44bDJYcERacTRv?=
 =?utf-8?B?VGgrYStCa3V6Z0p6cnN5ZjJqYUJyWUNjOWxIUTh4RDJjbm4ycXBYd2tHWnpH?=
 =?utf-8?B?VGN1MTdFRlB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVQ3MFozdWV2cm92cFZzTlNONVkwVlVodm5zekFZT2llNjlWaHJYVnBwdzlR?=
 =?utf-8?B?UFFVcVBXaXBtemIxNDRJQWh6cCtyWis5OWdwMG5MNXAzSEwzTkRRMm9xTDVx?=
 =?utf-8?B?b0xGYXAyT2RLY2d3NW9KeVg3akw5OStCbENTaGNhUlg3Wkt1QUFtc0tZN09W?=
 =?utf-8?B?Ylh6OEpuUjhnZ055WWtvcVYzM2NKK21KTHdsQWxqOWxUcG0zZTVma21jL2pZ?=
 =?utf-8?B?cTZmSU1EdFk1by9PZlUyTzI0V0pobVVMekxVRVNGZlFuTEg1RUJNTzlLRURD?=
 =?utf-8?B?eGxHazNpZzVKVGc2dVhReDBWcmdNaTFwNGdzd3FzbEZ6MWpTZzJRanduZFhS?=
 =?utf-8?B?WFExaHlQV05uRCtXUjl4Q1FmRVlZeU1sQXc5KytseEpOYkdsd1FtUXJHS3lV?=
 =?utf-8?B?dWhxYXNJZW50L2Z3MWt1RVdhenQ2RmlITnlWMUwrUE45bjRzWlVKeFFFVnZG?=
 =?utf-8?B?cXlzNXE4aTNzUk9wUjBHWC81OG9oNy9YWndGM1BDZFBoQThnKzhmVUxrR3JG?=
 =?utf-8?B?NXJWaDdmY3hFcmNWczRkbWFyY3JHakQ3TDZQNTc0UDRISnEwT3VKUEVFcmpx?=
 =?utf-8?B?V1Z4SFVQbDc3SkhTWjlqWXY3VXlkbS9objEvSGt1UjM1WUdUWGhSd3RsN093?=
 =?utf-8?B?aWMzT0JBNkhaTng1RFZjVEVpZWY0UjZQQzdZUFBzR1pJekNuZWkyMVJ3dWU4?=
 =?utf-8?B?SVNlcUgzczd2TUlPRE1Ka1VSVVBGMzhzbXo0V1FJaVpYa1l5L2g2TnB0aUpM?=
 =?utf-8?B?L0NTUE9vUitUTWtDNk9raXBEeFBDcW1lYVp5RTgyZU9ndlNSdWtzNnM0Tno3?=
 =?utf-8?B?bFZHSHZCVVFoYzB3UXhFUzM5T3RaRGZ6cHQ1QU0wNjNtaFRwQm9lMDZRZlY0?=
 =?utf-8?B?VldHQXdJMEd5Zjlma0x3ZGdCRXRWNVF6b3JXMjE1bnUrajlXVnRJV2ZVQ2Q5?=
 =?utf-8?B?eERiWDIvYVVXekpaTEdSL0VrV21OS2hhUWdHbWNTc043bGZ6Y3llaERLSXBu?=
 =?utf-8?B?dFIxemxtK0pHQ012RjdYbjlVLzhnZHlZQ2tncmpzMjFOTzJSZ3dkNnF0T2hr?=
 =?utf-8?B?Vjg3cHNhUUt4OVJjWnlTenhTdnJ2S0RRV1BYNkxtM2ZJWjAwUEgxaVN5ajhY?=
 =?utf-8?B?aVlFMXZBeXltT2hKVjZhd2h1TWNTazkvK1pSRWdTUzBQY1I1ZkVSZ3pLRXFl?=
 =?utf-8?B?WXl3Q2dOeWs3Z1lYTGQ1MWQyZFBCc0ZlKzJIRGtFMVlEUStYaDVET000RlJO?=
 =?utf-8?B?WGNtVW5XR25KMzM2R2hrSGVScFhGOXBnQ1YweFJGODE3WE00QnZya2h6VlJj?=
 =?utf-8?B?ZlhId0FJaGxIWVBxVWNjV08zTzRKZ2xMSVIvM0dpT3g1L2tyUUZwSXpBTGpM?=
 =?utf-8?B?Zy80aVhxeElCZFRuQWwybW5OVTY5M1FhNS9od2p3MXgyS3RiSGpVSS9WU2Nh?=
 =?utf-8?B?bDh2NFRjMHFZaFFlQ1AwWnRXR25Mek90Ky9GeFBaZEZ2S3BWa2gwZjh5WStB?=
 =?utf-8?B?RjI1ZS9Ea1NPWXc1OW5ReWxSSUg1NGlNYm5qQlk5SUY2dEFzYnN5em03L2sr?=
 =?utf-8?B?T0JieHN1QjVkZFFOaERETWxNcXpkUzRJNTFrYXVudDdOQmxIbzY4ay9BNDR6?=
 =?utf-8?B?UjN5RC9WQ3ZOWUtCaGtBNE0wQ2lsZVpPYW8wSzltOTZnZmZoaWt1dXpvUkQ3?=
 =?utf-8?B?cjVja0krSWR3bk5neW1MbG53Kzg0a2c4UGZVbnRlL2JEem1QaE1qR3JMak1l?=
 =?utf-8?B?RmJEZHdpZmtObFpiTmZUa1RJWExGY2dwS09UYWtzWjhDVVJ5NVVhZHhESmlU?=
 =?utf-8?B?M2hSc1JoS3Q5clRrMzYrNlFzZVp4bTU2emFmOHEzTjhLWjc5ekMrRU1hYXdy?=
 =?utf-8?B?RUtYMENyVWV5aGpZZHJSOEZQa3lUOWVBQkNjMWwxb01ZMkIvUVh1dlVVOHgv?=
 =?utf-8?B?ZUswUHdTVWRQZkd1TE0wbkFmS2pTU1ZDeDRGcExVRnhKVm5rWnR5QlA1c3hn?=
 =?utf-8?B?cGhldEVIZW9seHo3cHpKaG51a2l5TU81ZFBzckdrNXc2WU42NEhqbUlESUJz?=
 =?utf-8?B?MjBlOTlPcjMra1BobGw0NmhZQ2JVUEZoVWtxVnlMQWg3VFhwRUN2NlpRbC85?=
 =?utf-8?B?NmZ5SkszRzFkSUhLR0EzUkIrNDVrQzlqWVFVdlZYakJIZW82M3NSZTI3SkxG?=
 =?utf-8?Q?tYiCCLJSvt1qVLV84Es9pHX+zvp4wqE3b5GBrylqPHjP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a355b24c-2ddb-42b1-61ca-08ddde4fde53
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 12:07:57.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqksXAoBKfFjDHRInyJLOwdVaoSK7AOMATN/Y35cA8tyhOyAnqcQPS++v7OxJs1CKhNWscXn0IFZM17Rls222A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308

On Thu Aug 14, 2025 at 6:33 PM JST, Danilo Krummrich wrote:
> Implement AsPageIter for VBox; this allows to iterate and borrow the
> backing pages of a VBox. This, for instance, is useful in combination
> with VBox backing a scatterlist.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

