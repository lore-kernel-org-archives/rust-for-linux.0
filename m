Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AA228980F;
	Wed, 11 Mar 2026 13:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234104; cv=fail; b=CbBXaOkDJgwT3mCcXt6tQqabw+H/Ek1dBoGbw6xiaYSsmNhhqOzpgihEH6RRUngJp9QXh/TEjCYDixssEhfgSX+TFZWvd7fluksiVU8MfWoYFK9hPyCm5DZMIbUD2n8zy9JFR6jh6tsDXdrDdTC/9v3BxEAGVbFgLR/rZ55Hwic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234104; c=relaxed/simple;
	bh=jal7S8971foiKrqBeOqOkdJyB4DmnQbyz127RNzRKeM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=V6Q0iu5NS1Q2tYs1DTtFKMmutj66+cYvKGI5O2d4SeWlLXGv+tgXxrS+ierA9VflOEahZNSwdzS/mru2eD3ZpVMd5iS/tQrVYKCraL9t5Ewz2gYJ0UNm3ce4o1MPZn8SqUI8w61DlPPXjPW/KHnQv+Xd+P9w91sQIjJhK30IpQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RAxtpIu0; arc=fail smtp.client-ip=52.101.62.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RAxtpIu0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtoJrjjREhfDUWe68S+XsiDo+3WB+HSshDoh2qhJ3wv7D7LXkJUTZGVgm8JB95wYW1A4hYSMbVbcjsFUHn0M5UJxEC/zr54Oo/DAlGI1ias9vpU0JWzvnKBEyaQNXQeEvha+O+3FAz+0wZyVn5GKZYO8FxBlZHosmcNEGzjfs0idchYrhVlP9ycaye6/u6nPf40iJSLlUeWtS3plbwOcwDHbYo3ejw/Zw0xCe17hTYDT6yY0gqKYMe7UUSwfYqfvHAcLM3aVF3ZavJpOGyFEh2snatsVXwV7XgVYTE6+6U5KOElgMLTelGjc7aK3nTTN3pT9SZnPbyJDr2FyJrfYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoFAli/q+tUsaoZKKWf1kWNbygvZNjUMTkkEZ+Orx7c=;
 b=qRHOgtgFqtxkfAqXrjzewVjLoSeEI904+s29ZmBQVZ3AbXyXQu55wwA9Sa23H4Fn60dZDddeXUcDYGhgzR/J+puEeAPOzGMgPGYJ62e0aTmNDxN2GUyoj8ZoiE5TNjv9EeFBKUHTYtavgRX+SqaZvS/iItSoz1Re1VpjmXkKaErCvVgFVQ4dZtZYEslNd7YOo0OoE+6DrTjMTuL/O03RSrP7yO13TnNE6a/4b8zsToxU8rwyKL5Hp95OdrgawtwScuP90nPdMMdDTwhFX7f/Y+XFH/w+eA2u2tHJb/afAFPe1TSYX7p4zfGMUcGeLpi3rmqIvo7eeNzj+KUeWLJpsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoFAli/q+tUsaoZKKWf1kWNbygvZNjUMTkkEZ+Orx7c=;
 b=RAxtpIu0CUx8gVrs7R1LAcVovXleZzVHjjCVtqJ0Ghl2vfX3xn0lQqkm/xPknjJZqV3V4FHiQxd8MK85bgu4LQQ98IUJafTgeBd3ndQVnlse7MAJI8aMvgJAQ9zuxQFNQadKkqnceHIO8chBOWyU7n3i+lntx8pCbbvtyfNcDSZMKq8R+tTZ1m5cSCumsQIW3SABeEpJ9kJ1Wb0Zq1dabcTx99rSFzUsnFJmkxbb0dpg2Dl7DaA49w4hn5bbJQT7zNvh1S8gzbevpHRoJAFCtlWzX542mnG7QhDcaW4P1WO7ra7rM1FxPLpcE3fxsJmG7FNDP+yH+yx1ewlkmDqPKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 13:01:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 13:01:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 22:01:32 +0900
Message-Id: <DGZZ0W7ZQ6DO.3NBYFWFGPPUN8@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 00/10] rust: add `register!` macro
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <DGZ9WXGUA19W.RYEM63UQQ358@kernel.org>
In-Reply-To: <DGZ9WXGUA19W.RYEM63UQQ358@kernel.org>
X-ClientProxiedBy: TYCPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:2::27) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c79cdac-01bd-4cf7-7805-08de7f6e542f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BXpaRUnSD8vG2ir2FF3hSS6LhU6K1EsTL53kqTOsNzATvD4lE0wMgNhmJsZmbUXHkElZKooavvryC3wMdaC0E5fStMSMuPp7RggjBZMQbLkCVQMBySsNTLblFbDtgsN2oQ0IXPNTFbhauvbMqPEuni2zFmc1XStFsOt2OloWilNqtPhMahHcYranvNB4NedwmdzZeZr34zm+otU7VQil1N3Thqjiy4IMyiTzhf8LWqWcaN3GWWkshsuaKU1Hsd9WAborzJ0jVtz5qmo71riU87LJmp0cJ7fiQmKmayG6c5nsi3yX5KTcC4VRAhGE9RBgZ9/5o7HtDbkKDdHj6WVsCTRQuEhDsqviZMhZrggi3ipEe6CLhbDl2eML4gsFqLhXw48lvAHBT0xXt3M5S2oD1A2rWHYV6Rro5BHznddZry37TwbC2RzCrSBjpzxPfeiobQnBA2CG5Cq3FFAWSMQg44NIV4zoiQQwyqo3414DfgKFKwybuZMk34ghlCJmsyFv9JPQAfL8Yv06Z0VTlWyZbYtXv9AVdJBQQo7la1qXH/jNrgjrpwiMmEA6W6zsYxqyOIjA72sB0zX/tfulLpophTF8Eol3feP8nvQtT6pIJFLw4gsfwsptVqJ9FZkr2K7YamVkL1coDOHiNqUd1AFxDB6sKhGx+lkYBA1y974rOyqJEKvrqqS0WdQShai90VYAx/X44HwBUTb6XQS/gcRicV/x+Q/Mh7GLFHc4uddhbpk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Snk5b01VQmg4UUgwNUlNUmU1WENPMGlhWUE3R2loSHdwQkErSmJiNjNONlkz?=
 =?utf-8?B?UGlyRmFVSFJuS3pQTG5nN1NNVG5MWWJQenRkbTdhY0FzNk9ieWpXVkhMeXJt?=
 =?utf-8?B?TXlrcXJ3d05KT0pRUTRpTFJMSFI5WTZ3WTg0MWZOd1N1WGc5MDJWeG5RNk4x?=
 =?utf-8?B?MU5uc3RxanFaVVNMc0NFSm00WVdJd0hhMWJLaGxEZmpORk0vcGRNVGZpeTFF?=
 =?utf-8?B?REdOdzJwck5HMEhDbzJaRlNYTFVPUDVhZVBpMmx0blpXcWRLL2NOYWZPckFJ?=
 =?utf-8?B?ZitHREVPcm5TQXJaSDEyNzN2ZEh2b1hKM1dLajNhTTlkdXcvbS9pY3gxV1pq?=
 =?utf-8?B?c2tvNUpPRVNtelBiQjExNzh6cnlLM04zMkE5ODIrelpRcnA2RjhLS3B1Y0Zp?=
 =?utf-8?B?VFl4SXNzY0psVnYvVUJYNW1kb2dmTkxEYjArdEI2bjVlWS9KaVk5STRZLzl6?=
 =?utf-8?B?Y3ErM2EyQjhjd3laclV2YW9UcmxhajEyODVoNXd1d2M2dGl5SmRicVllQW5N?=
 =?utf-8?B?T0NVZ1JOcHBQVkhhOFozU2xtZkJNVllqcEFvcGdHVlNGemt0cVFqT2pNeTI5?=
 =?utf-8?B?QkxLa2ltQkR3MXNodmM5dGh6RERQS01leXRmMkZNNzFoQXBiZ0UyRUtxSDRy?=
 =?utf-8?B?ak5NWjVRRFhudURNL0RDd0IxRHpQSllMK01CY2Y3ckwycjYweWJpbW1pMkhk?=
 =?utf-8?B?MEZydTdsWVZzd0ttcmxKZktPUmk5UlFPRjZuR3NrUTd3YkRsVVZhT0VXYXpX?=
 =?utf-8?B?TVV1TjlmVWZuR3hwMW0xWWVSY1d0d254bmF3WXlZTDZ1SjJFYk41S2dWUDAr?=
 =?utf-8?B?citqZ0lBTW5xQXJQenZKNStyeWpXNlhqd0lHblhaSW9PMDBINFMxbG5Iandw?=
 =?utf-8?B?YVNmaXJiY1QxUGJPK1JhdE9ZeXdhNTloMFgxUUs3MnhKSERQN29ITGhUS1Qr?=
 =?utf-8?B?d3FnWURHUElSMkZVYWk0MHVpMHh0ZWNSdVNpQUliQW12aGZVa05CU2ZyS0l5?=
 =?utf-8?B?M011NU1PYUJFVFZzeTg2b3g4dys0QmF6NlJwZlhIYkFFNjFrTFEyanZSbDA1?=
 =?utf-8?B?UVVQRE5heWZuUkwzZzVsQ3A4dVVlaE1JQzNiNWNqRHhWRnc3eHhha2JOTlNk?=
 =?utf-8?B?TllzclN5bEw2NDhXNDVTOHhxc0Y3VUFUTWtIOWZkUkF4V0NkQVg0Nnl1Zmxz?=
 =?utf-8?B?T3lYSTlPRm5GSEhoMzhueXQ2cXcwUUxKbXdwRkJlMlBGdjkzQUdKUHlUeUFo?=
 =?utf-8?B?cXJwYjJOdmsrVytoRU1MbUoxMStrUmIxNnphUnFHTW1aZDZyV0ZLdUpQczUw?=
 =?utf-8?B?QWIyV2RCdUZqZVZqQzlZZk1MWVB5UjJRZlhPRE5nYmFVeHBlMlBoSCtPMEh4?=
 =?utf-8?B?cTV5eGFEVXdCcWg5SjcvSkZlSWkvY0h5VmdJRjErWEVoL01ORmNpbGdXc1hX?=
 =?utf-8?B?dExvUFhQZTlxQVltMFF5NGNWRG4zeWl4WnRsK1MxQVE2NUZ4ZFViWlg1MFpk?=
 =?utf-8?B?dFJ0NjZXbGpvd1pVUEdaeG83ODFPQlRlZ2krRE90dTNYTnhHOTVGOHF6eWNx?=
 =?utf-8?B?cFdBUyt1QThyVWZ2d1c2MTNkbUt4R3NGTVExMVhwd2Y4eHBZMjQyMGdHaEpi?=
 =?utf-8?B?dTlxSUVsQmpTMTAyZEJjM3ZmbnJtUktJWU1nODkyc21ScFVXMTY4NkhMTkR6?=
 =?utf-8?B?d1RNclVhNzMxUlorL01iYlZTN3NETXZGWEZMengvZ0E3VkdKVFZZNmg1S0Qy?=
 =?utf-8?B?R09qaTlUM3RIZWM3eW5sem55MjErRUxnQ3FLMW1uWC93d1dkckVEMGxERnAr?=
 =?utf-8?B?QlNwSWhqTWQyblAwVEdWY29MalRTRXdtQmluL2pPczViM2REOXVLTzFrb1RR?=
 =?utf-8?B?Q0xpbFlyMS9nbHZEeXZkQi9oalFDRzRZK0NSVEcxMStBTkg4QklkZzRpRWlD?=
 =?utf-8?B?UXozVGh3NTZqZXAyNFlGWFRqd3ZqbmlUUEwwZDhOamNEcURiWEp1Z05xZnAr?=
 =?utf-8?B?Ym14QnpWaEhjeXdkL0J0UFl4WlR1ZWZEVTNzby9wQWQ2NXJFOTF6ek9pU0sw?=
 =?utf-8?B?NGVhUlBKMjIyZzZlNEJwbjBzdnJEZ1Iyb01VU1ZaNE1zd3dDM2NDbDNzU3Jq?=
 =?utf-8?B?RmZhY0p2YUhsNjF5SDhmZ1RPa0lWTlh6Z3lzN21MVkU2VzZzblorTGRCRWx2?=
 =?utf-8?B?S3p5Q2ZGZnB6NjR1K2F1NzBGTURNSWRPZFlzeVRDUW9EM0YyUUxXTUd1TEdS?=
 =?utf-8?B?b0RPZ3UzTFpWOVZINnJ0ekprRkl6NEQzUzVWbFpjN2dpWFNkRnNpTmpaa1Zx?=
 =?utf-8?B?RVlnZlJ4Q2FMT1FIYk9Ob3VaSnc0b0cwMkVYWVlueFlocFBMVmFNdjdpcE9J?=
 =?utf-8?Q?x48mjg6R8ZR/P5q/YdF+k0yQ1HuMVWhzKNTGKm1zJYGuG?=
X-MS-Exchange-AntiSpam-MessageData-1: Mb94oPip3z04Lg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c79cdac-01bd-4cf7-7805-08de7f6e542f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 13:01:37.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GVvADNFXWkNbwbq8w4jGEI82yLQP5t6TQMrjRy9TBvT16E/ODIPNMu//ohI+MMo4IYyKaFefOSrfeHafF7ntg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105

On Wed Mar 11, 2026 at 2:20 AM JST, Danilo Krummrich wrote:
> On Mon Mar 9, 2026 at 4:13 PM CET, Alexandre Courbot wrote:
>> Alexandre Courbot (10):
>>       rust: enable the `generic_arg_infer` feature
>>       rust: num: add `shr` and `shl` methods to `Bounded`
>>       rust: num: add `into_bool` method to `Bounded`
>>       rust: num: make Bounded::get const
>>       rust: io: add IoLoc type and generic I/O accessors
>>       rust: io: use generic read/write accessors for primitive accesses
>>       rust: io: introduce `IntoIoVal` trait and single-argument `write_v=
al`
>>       rust: io: add `register!` macro
>>       sample: rust: pci: use `register!` macro
>>       [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro
>
> I did not look into the root cause, but fetching this patch series my bui=
ld
> fails due to a build_assert!(). Maybe you have CONFIG_RUST_BUILD_ASSERT_A=
LLOW
> enabled?

Nope, it is disabled and I build with Clippy so I am surprised you are
getting this. Do you know which module is failing?
