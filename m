Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ACB7E0E4;
	Fri,  6 Mar 2026 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807590; cv=fail; b=NjynjUkqit8mRKzmktpgD6rbPn4B4lqHg8dNDqq4/YU6zVmQ8jeNtL4Xf6gN5VOz6VdbANTifzZUTQALYr166+u7pGcgw5Ex5jtqhzBVQuoWYdWg2EQadQa2Yg/o44GCIbauK8x8RC7ZIIII66V6IuVpgLubrl5eQQrH29PcUbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807590; c=relaxed/simple;
	bh=EyRQ3WOnuFznp4gh8eV7bDLbcMkkP3ZWhOGf7ohbOVg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=p9Tq1/M3x6tZP7qhgudQwdGMBl/jXf29dnmxGkhGzcJcv10odRP8SylgmnxEJJJCOb6Y20EtCjhCby38H3IIXrXWJ6lmatRjMCE7+rlplOLWGePOFSzRsQO5cQTwNvAcGmKxg8gfC3gO9MOR3kv6lXdjOEjtgYryVV/7OtuBo34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q3blkxHy; arc=fail smtp.client-ip=52.101.56.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q3blkxHy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ3n3CXY44t03uddQXuqYzYseBzuXORXC5lt7Ayqz7bCUUO1HmuXodnBlp/aQYO8TkMkZD/i9RS6tBBMdK2BaP65XCmEpqkp4APDarQTNku07KYoMRgkogQRkDO6uU68LFkZ6E5Pv76XlqLi/PwesfCxWEjBnjsNSUHW3Elm3wSsRFqzFwppnl2J4G6lFIBxHoPjgeqLq9/zj3+ogZ1MGZ+vtktenQTUbREzh0mN6icCk573slCRNLzFnBdyMHK5qjNuKRpt+Pn5PimDYrG4jUxAcsfWatmaS/H+U1Ig0m2iGQ59gwQmB1jdzgrdWmOOdLoPhRq8fzDE8AP9I4kE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkpNojOvAubsQxl052gbW6oGKtbH4pNaIfejBoxiWv8=;
 b=q1q1UX/ifctr2ZwIr98fmCAQcJzTqe1j7Y3ivChUZcPUV76TRTW1vrvppLaxMNr+aUD53kt5Lt95hTrL3H3+ngll5o4Uz4h//OEVT160n2yAAx1BG1Kx7dRstbnAVoaA/qvDNE6+KJw7fxbg9CYq5ULBUy5mOP+rDHk13xaBw2BZJaSilX0I/mSDbJ8lh56T3mAR/9h30ydIXpWYXKHkaLGH6Ph9hUNJcSwJUAC6X6LKsZrV4HlLGp7oWnWQmlRtaHR01zZLgXYcaFYEcvneO29M9oF1MdtoPQiA3FyxX0nFzIpXZ3mq87qgU60gPdHwtFsiAoAclFkTr+CvuC8dZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkpNojOvAubsQxl052gbW6oGKtbH4pNaIfejBoxiWv8=;
 b=Q3blkxHy8poee4R/ttUhMqo0tnzIr3bD09qGmDfwHVSP83lugK1Ans/671K6jFps20Oub27RSAygrAI5jkJf7LoeB14BzMqcpaniGKxOm5sRm4nlS5IWbgI3GjdgDooVpoJmv8uVC+YAP3zmRBco20eqvlOWhobh3mnBLW6Bdz6mgwZhxSAx+e08hrWGxK3DQZupcCsctUXf+/OjKY5KaqqgvWExZWMnj44lFiyiZHvOqK526pQSDvmjYJtuEXtrBdcGNDi9eG/H6UVQf8sibwYtxTeENm5wDKYUo2+y+jnbwCcMj7YcwlSQG17Fn9qKOr/LwZx5HPd7tEWVWTEj3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 14:33:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 14:33:03 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 23:32:59 +0900
Message-Id: <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Content-Transfer-Encoding: quoted-printable
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
 <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
In-Reply-To: <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: c20e046f-c16e-43f4-3e0c-08de7b8d45f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	RVa/Cp1t4Z+yLoazKxk+SQt7IdoZQSEMyzVjBtmUVZMZ145A/eFcNNezkXenlzggD0/2DbEfPV8KCqI6N9/JUyXfoQKPhXd0937oAslqUOlZwzr2KgP+XAVPSvSxLxy1wyhpbz+TlZ/wKMZAVha9toS3EUF9JN+6141zT5gFstABVAXIFXVq6qt6MtK/H2gGnoAXvqMzf+PHvjzwM83fbSs+txLyp3C/SEk5u2+xGr4u3D8zg26Oap8yu/ENYZykpgaibTZmAefe3oyTAJERzUH+bwopNBYu0wcb/lXSv+eY7bBRPqYzmuAVqA+4PweX1ZGl7ouFBimsa9i2sojX9pB46f0JHGCpX3q/OWT5fZvEdCixsC594vGx4fqdgtrr1Caqhc4XJ+CrgJ3b6RH4p/PVlOV2V0JFYBb1MRgYAZ7lSBmLkXs6GFfey1QaSB41F22sQXIFhS4NY9pGwZ0nxS4kaw8Fto3pcjcny7iW8tkVsiZCdkYbWlKx4z3//glDTvZPKRIQXqcVRsA3Fp0Nn7jKZL/G49b0MbOR35lwkmcs3NzU7sA3U7J3e8vckQLi7P/H1M+4b4xt+Ho6BIvMsaqZ6uIQp/9mU/db2vQCQYTEZ0Gy2i5effJOezIhZ1Qt5tYh7j3+Yu/EGuiZ7kbbskzwr1S+UHFkb7bSE0pD/gmNUNytKrcnwZItmimHi3Y1kkFyyr4T1mrjkJSdr+pyEbHQjuKIjVHfsl2kIff1My0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1FV1ZuR2hMRjhDQUdkUThQUDlZcXdJcXpSbzRuRi91Uy9ZSlhlSDhjMVhl?=
 =?utf-8?B?dlZDMDM4c2hNYlROMHRSOWFLNnYrYUJPSVVBbWsybjZJcy9Da3pacTMwcjlR?=
 =?utf-8?B?SEYra2NGbEU4bzNoanhnYk5RMFQrdXovZnc1MGJPbnZNYlhqSEtKY0dCeTBP?=
 =?utf-8?B?ZHhlU1FMWEtqWk9iNTRQYTZmcDNJcVFvZDhGc2ljWnBhOTY2cTUxTk1RUGRI?=
 =?utf-8?B?dy9uRWxjL0JkdnJ1MGtXSHd5Nnd6ck1JSEg2TUhTTENvRVlzaTR6Sm1NM09X?=
 =?utf-8?B?SVhHa1oveDc0YWxjR0l4VXhCVUtvcUNVUFlqNXFUblBJREoyLzdjVGo2Ujkw?=
 =?utf-8?B?blVtc3FrYnV2REx2YnBHeXZqeGNwT0lNUmpLWWlHeXNHQjJFbFdRcmdnMVBH?=
 =?utf-8?B?SnlvOGhpQ1FEMEFJTGgyVXZvVnZqb29uOVZXTm9DTnBMMVUyeTdjRjFLQzZz?=
 =?utf-8?B?VW5ZZWZqV29hMWh6aFNoT2pXTllxSmpFWG5jb3ExMFU0SHFnNW9CMVZHUUQz?=
 =?utf-8?B?MHJLY0xKTzkxczlvcW53K2x2NFVyMmVJcDNRNjQ0dFZUUTFvOGd1VU1uWlB6?=
 =?utf-8?B?dXpwUUNSTklOdWFINkYva3lHeHh0V0QwYlB0MEN3b2k0RmVjYWtYVkdxek1v?=
 =?utf-8?B?ZWNDaWppSjFLNjcvNyszZnJVZVkyMUhjREdRUW1EL1BhbjZhbmRBeUJURDNG?=
 =?utf-8?B?SjhSUW9wellXUzM5U3dtVDFsc09nV0ZzUVVYL21aemNFK2ZJVWVwZXh2TnRD?=
 =?utf-8?B?SHd0WjZ4TmVuTlJEY2lqRENHOGZlSDVuQTNDT09oa2R3MXRxOG1PVGxzbCtU?=
 =?utf-8?B?V3VFTWd5ZGpIZHU4eFhZTDAzNlFvbEhZR2xMWnA0NlprS3BYNDhiUk1EWFRr?=
 =?utf-8?B?OG53NnhFNUg4eXRSTjBLRy9IMmtGVEhxSGNpWnBTNVhrRGRydWZqQUdoZE5J?=
 =?utf-8?B?SFIzbE9DUGdQTUhQVnpDbFkxNExYVzRPdk9qZy9iVUNibXVveDlKT1ByVXl0?=
 =?utf-8?B?alB5YmxkSkg3U1JwMW8vRGxsWVZMMkVNUkdGNDNKaS92dlVSdTMxdDcwOGVF?=
 =?utf-8?B?c0s4cEc2S051aHlWOWZtOFVkdkY0RXM1WGliY3I5KzZOV1FQMzYzUW9yTWNF?=
 =?utf-8?B?UCtoYmUxYmhHU2k4UzlXZDNoWEZiRW1yRDhmZUUyZ0xweVoxOWNjQkVnWFFW?=
 =?utf-8?B?NVBtdCt2Y2RRdW8xUE5FbEFlWnpWb3V5UjN3WXg2NXA1dDFYU3FmZ1hVbWkv?=
 =?utf-8?B?M25OZWNCdjR4bW5HbER2cDVsUTJ3bmdYYXBBMC9pRTFCLzAzNUJTM2hDSm13?=
 =?utf-8?B?ZnNWZDEySnU1ZlJtNmpDcHZON3k2a2ZRWXVBeUVlUERBOVRVd1FDS084WlBp?=
 =?utf-8?B?dDc0WlhMc0xhMlRDejRCcnFzdkJLUDVtYTZwQ3kxaDcyMzlCQTRHeFlVVGNa?=
 =?utf-8?B?NEpVdVZTT2s3RFNSemhQbURLY09BaVZWUWRwZ1dFTzU0bjZGRThkZjlFZnpR?=
 =?utf-8?B?aUQxTmg2aGVHeDhBQ0pOMEppSlNGd2lHNGpiRVovTWZwSWhzZnlIcWplb0Y3?=
 =?utf-8?B?bVdicEZ1M1B5d2tBWkxaZERhbWR4MGk1bWJSb3lSOFJ1UlcrUllxZ2FDNEZl?=
 =?utf-8?B?WGJCcHhuTzA0d0NxYnpNbzRPL0p2bnY5MFRZVjhTYTNZNDc3bjhHcGxqRjda?=
 =?utf-8?B?V3dWejNYV00zYXcrYVpRMXZDS3FlaU1EYmtXcmVDVm9PSXRIK3dPbTR1Z3NE?=
 =?utf-8?B?QjZFMllxdThtZXZ5aVRmdGFIU1Jxcjh5UnVVaTVTbytUeXZRTWEra2Z3LzFn?=
 =?utf-8?B?OEY1S0lmc0E1Tkh0WXh5eXVURWIybGdwOEdIQ1hmQ3ptNXQxek1iSURqZ29H?=
 =?utf-8?B?blRpUmUxemtqTm1lS29KL1lkNUd5Z3NrdFRjSTFLTlJyZHN6Sm1TU2ZIcCtY?=
 =?utf-8?B?NFpXYjY0MHhrT2dET2dPbkVtcGtndzlIZHB0L1ZiYjhFdWQyRnVzaVdOUGZR?=
 =?utf-8?B?SzZSZ045YUttdGpjVGVXZ1JNOThDcWxsMmdYUFQvRUpQdHFVc3JPLzhPZWUy?=
 =?utf-8?B?YlBiS1BFYldUK0I3Z0hlKy9FZGVVSHBaUVdPTzdBUkc1MXBGVTdJRmxhSUJU?=
 =?utf-8?B?TVJLRUZsZ0tRbmxWMXViaWY0RVgzNFZ4YUptSE5lMi9HaTUyU1JLWXA0c3dK?=
 =?utf-8?B?VTBPM3ppOElIcitwY0tHYkdyVDFJZFh6VzdWQVdTalVtK1ZndWlINTVnclht?=
 =?utf-8?B?Qi9leTJvbFAwZEhqS0x2blZJQmtFbmV6Z2VVTEhkajQveGh6Zi8yZ0NLdXJa?=
 =?utf-8?B?UDQ0dHJiZTJlZUdyZUJObnZ1TW9meFFUS3pndjZMUkowYm96bmVldnViVHFM?=
 =?utf-8?Q?kNnd4W/TMwCN55oZRkrw2CAORIXePv1qJJLVmWqK+IB0j?=
X-MS-Exchange-AntiSpam-MessageData-1: KS9OLWQcSSMljg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20e046f-c16e-43f4-3e0c-08de7b8d45f4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:33:02.9424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDIXJSE3Mv+MoYktT1GnAxO9ZyKhpWfdAv5DyCM/SEnaSzplIgV9OVpyhlXnSwOg//oJG4O3+HkHgxAi6xkoow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601

On Fri Mar 6, 2026 at 10:20 PM JST, Gary Guo wrote:
> On Fri Mar 6, 2026 at 12:50 PM GMT, Alexandre Courbot wrote:
>> On Fri Mar 6, 2026 at 8:35 PM JST, Gary Guo wrote:
>>> On Fri Mar 6, 2026 at 11:10 AM GMT, Alexandre Courbot wrote:
>>>> On Fri Mar 6, 2026 at 7:42 PM JST, Gary Guo wrote:
>>>>> On Fri Mar 6, 2026 at 5:37 AM GMT, Alexandre Courbot wrote:
>>>>>> On Thu Mar 5, 2026 at 7:15 AM JST, Gary Guo wrote:
>>>>>>> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>>>>>>>> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>>>>>>>>> Even for the cases where there's a PIO register, I think it's ben=
eficial to just
>>>>>>>>> get a value without a type.
>>>>>>>>>
>>>>>>>>> I don't see why we want people to write
>>>>>>>>>
>>>>>>>>>     self.io.read(UART_RX).value()
>>>>>>>>>
>>>>>>>>> vs
>>>>>>>>>
>>>>>>>>>     self.io.read(UART_RX)
>>>>>>>>>
>>>>>>>>> or
>>>>>>>>>
>>>>>>>>>     self.io.write(UART_TX::from(byte))
>>>>>>>>>
>>>>>>>>> vs
>>>>>>>>>
>>>>>>>>>     self.io.write(UART_TX, byte)
>>>>>>>>>
>>>>>>>>> what benefit does additional type provide?
>>>>>>>>
>>>>>>>> Well, for FIFO registers this is indeed better. However, my main c=
oncern was
>>>>>>>> this
>>>>>>>>
>>>>>>>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>>>>>>>
>>>>>>> This specific case is indeed more cumbersome with the two argument =
approach,
>>>>>>> although given Alex's nova diff I think the occurance shouldn't be =
that
>>>>>>> frequent.
>>>>>>>
>>>>>>> It's also not that the two argument approach would preclude us from=
 having a
>>>>>>> single argument option. In fact, with the two-argument design as th=
e basis, we
>>>>>>> can implement such a helper function cleaner than Alex's PATCH 10/1=
0 (which uses
>>>>>>> `Into<IoWrite>`:
>>>>>>>
>>>>>>>     /// Indicates that this type is always associated with a specif=
ic fixed I/O
>>>>>>>     /// location.
>>>>>>>     ///
>>>>>>>     /// This allows use of `io.bikeshed_shorthand_name(value)` inst=
ead of specifying
>>>>>>>     /// the register name explicitly `io.write(REG, value)`.
>>>>>>>     trait FixedIoLocation {
>>>>>>>         type IoLocType: IoLoc<Self>;
>>>>>>>         const IO_LOCATION: Self::IoLocType;
>>>>>>>     }
>>>>>>>
>>>>>>>     trait Io {
>>>>>>>         fn bikeshed_shorthand_name<T>(&self, value: T)
>>>>>>>             where T: FixedIoLocation +
>>>>>>>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoTyp=
e>,
>>>>>>>         {
>>>>>>>             self.write(T::IO_LOCATION, value)
>>>>>>>         }
>>>>>>>     }
>>>>>>>
>>>>>>> No need for a `IoWrite` type, everything is done via traits.
>>>>>>
>>>>>> That's cool but will only work for fixed registers. If you work with=
, say, an
>>>>>> array of registers, cannot implement this trait on a value as the va=
lue
>>>>>> doesn't have an index assigned - meaning you would have to build a
>>>>>> location in addition of it.
>>>>>
>>>>> For array registers I think it makes more sense to use the two-argume=
nt version,
>>>>> no?
>>>>>
>>>>> The example here is to demonstrate that we can add a shorthand versio=
n for the
>>>>> fixed register version that can write a value to register without men=
tioning its
>>>>> name (as a supplemental helper), and the basic write method is the tw=
o-argument
>>>>> one.
>>>>>
>>>>> For cases where the type doesn't guarantee a fixed location like FIFO=
 register
>>>>> or an array register, mentioning the name twice is fine.
>>>>
>>>> It's still tedious, and a step back compared to the one-argument versi=
on
>>>> imho.
>>>>
>>>>>
>>>>> [
>>>>>
>>>>>     For array case, you *could* also do
>>>>>
>>>>>     impl IoLoc<RegisterName> for usize {
>>>>>         fn offset(self) -> usize {
>>>>>             self * stride + fixed_base
>>>>>         }
>>>>>     }
>>>>>
>>>>>
>>>>>     and now you can do `self.write(index, reg_value)`, although I thi=
nk this
>>>>>     might confuse some people.
>>>>
>>>> Yes, in this case the semantics of write's first argument would be
>>>> dependent on the second argument... I think that's a potential footgun=
.
>>>
>>> I mean, `bar.write(Reg::at(10, regs::MyRegArray::foo()))` in your examp=
le is
>>> also kind of "first argument depends on the second argument" situation,=
 just
>>> with a bit more boilerplate.
>>
>> Not really, `at` is enough to know that you are accessing an array.
>>
>> Whereas `write(index, reg_value)` doesn't give us any indication of what
>> type of indirection (if any) we have.
>
> I  mean not sure `at` gives me that impression at all. It would just let =
me know
> that I am accessing it at a different location. If you omit the `MyRegArr=
ay`
> part then there's no real indication that this is an array to me.

`at` is a function name, we can change it - I picked it because it is
short and reasonably descriptive. The point being: we have a unique
function that indicates unambigously that we are using a location for
an array of registers.

You seem to reject this design because the syntax isn't obvious and
natural to you at first read. We are trying to build something new, so
of course if will look a bit alien at the first encounter. That's why we
have documentation, and I think it is not very difficult to wrap your
head around it after seeing a few examples.

>
> If `at` is only for array, how would you represent the case where the sam=
e type
> is being used in multiple registers?

That's not something that is supported by the register macro currently
(probably not a big change, but not something I will do in this series).

But to try and answer your question, such register types would not have
an `IoLoc` implementation of their own and would need to have their
location constructed explicitly. In accordance, the construction of
their value would not bear any location information; thus there would be
no redundancy.

We do have a case that is pretty close to this with relative registers.
These are accessed like this (real examples):

    bar.write(Reg::of::<Gsp>(regs::NV_PFALCON_FALCON_DMACTL::zeroed()));

and

    bar.write(Reg::of::<Sec2>(regs::NV_PFALCON_FALCON_DMACTL::zeroed()));

But for register types that can be used at several arbitrary locations,
I think this would be even simpler. The different locations would just
need to implement `IoLoc<T>`, where `T` is the shared register type.
Then, considering that the two-arguments version is called `write_at`,
you can simply do:

   bar.write_at(REG_LOCATION, reg_value);

... but this design also makes this possible:

   bar.write((REG_LOCATION, reg_value));

Tuples of (location, value) do implement `IoLoc` themselves, so we can
use this little trick to support a 2-arguments syntax with a single
method.

>
>>
>>>
>>> If you want to make things more explicit you could also have
>>> `bar.write(at_array(10), ...)` or something similar.
>>
>> Is it possible to generate an `IoLoc<T>` without having `T` mentioned
>> anywhere in the call to `at_array`?
>
> Exactly same as the `impl IoLoc<REG> for usize`:
>
>     struct AtArray(usize);
>
>     impl IoLoc<REG> for AtArray {
>         ...
>     }

Right, but can the correct `REG` be inferred when the call to `at_array`
doesn't bear that information? The type inferred by the second argument
would have to be propagated to the first. Guess I'll try and see.

>
>>
>>>
>>> For the array case I really think trying to shove everything into a sin=
gle
>>> argument is a footgun. The type of value in this case *doesn't* tell us=
 the
>>> location, and the location needs to be explicit.
>>
>>     bar.write(Reg::at(10, regs::MyRegArray::foo()))
>>
>> "write the constructed value at the 10th position of the `MyRegArray`
>> register array"
>>
>> What is missing here?
>
> This is completely un-natural if I try to read it with fresh mind (try to=
 forget
> about implementation details for a second).

That's what documentation is for. Please give it a fair chance and ask
yourself: would it still look unnatural after working with it for
20 minutes?

>
> `MyRegArray` here is a type name that is a bitfield and not an array. `fo=
o` returns a
> single value and not an array. "at" here is saying that the register is a=
t a
> specific location and doesn't really indicate the array nature.
>
> This is why I insist that I would prefer an explicit location
>
>     bar.write(REG_ARRAY.at(10), Reg::foo())
>
> would have no ambiguity whatsoever about user's intent.

IIUC `REG_ARRAY` would be a const ZST and `at` a method returning an
`AtArray(usize)`? I still have doubts that its generic type could be
inferred automatically but it's worth giving it a go.

If that works, then I assume fixed register writes would look like

    bar.write(FIXED, Reg::foo());

Unless we have a specialized `write` variant for them.
