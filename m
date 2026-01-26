Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B6298CB7;
	Mon, 26 Jan 2026 04:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769401905; cv=fail; b=cBIPgbfZCprGwilwTrA72DANF+NC2ATrakfaOhFPgKWWJeLBvzWhXdvRU6JLBH1rVGMaOX7DbCn7QibbxffNZc5igrYtXDjlsuQdT6h7zMdw8TXo32qE3idyvOQeZkJogUz3AyVs161tHSHsX88Ayjs0ADHDFMOKEiSIz5ymb1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769401905; c=relaxed/simple;
	bh=A8c+cnS+2mJz+YRzZgRIJ5FSshOgtOfMUTFzVbHZDnM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KDnBs/rFQY4S2dOeYpuHDttOAYg+4l7Fq85YkMgdrbxOuMAJkpn4DyKl4TbrTQ4VY2qxE8ZXixV3P3qCQh3MBUMzwyp3UKem9x4MCF6i3Hm0lnqnaThQ7nV3vzhyJwfu1PnWDKoGUsTOTyuWuBWuBqm07oFtVlsqPiwsHMdp/iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UZb75hzl; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UZb75hzl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y54/nu+JugRl+HQIUz3UBohu682AmzZ6c935kxxwlxmb5uXroURqV3xNNjxxsUD552mtp2Wo2Irmn9FGQw6kwuwPVIInz1LkkVW+Zq5lxyV/C9klL+XDcuP5H+7b6+XKRkFqnF59b+ftGAHd9Hr1wBBu+WcneF/6ajA/nHAcdAdOhHo9kJM2W+DWNWgjT60yVVarXstUdizShbSriZpCTXjUShltPNhONGeW9tuGp5l56BcPAZkhbo00VzfVghyRuH18IqOVmCTQH7iEfOX7IOKB13TFrv540gRDQCpkKx96vPtvx6FYilKx26Y2G19u+A6h97B7jROWq1MtiKyAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6afLV+EWkbMK0rF09OW87a1c8PBcJs9/0p2WsHOtV4=;
 b=kExQwLhYpeUogq/u52Cgx1joeTAZ99O9MfkdsAb80DpK/Ur4p5Yk/2oD6puAHVIhHhGjGP/YzAGX3xNL5SERAOgFo2gAZxggTHe+tSgo1mrhJR963QmCPIA97GOSw7kv6zKV3pRbGlj2FpnUw3jrrQCQDxuD76mC49/cwEBjspRWFBtj9kr7XR66Qw/1G70q3d4vcP0kOzF5YA8NXKwKiiHuDj1abAHU5P+nOqdHbVJbIuMF+/svPN+gRhdQrQXbmtsjHw2Yig8sbSzySWknJ6cVqtZlX61gAEoG81Ph0sheY1tZluKAHIjAVrvWhhFNE93wrh8UQ9ia56Sgy4N96w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6afLV+EWkbMK0rF09OW87a1c8PBcJs9/0p2WsHOtV4=;
 b=UZb75hzliZHZfrm8G/XCTplM0yEGoPOoPTc76g5Ae0yA4NYZRkYGebUc7LvRTX1lfQjHaScuFdQQw8ro5bMtC9+0pPiD8yrZ6V+H+W0ULqzCAH+sLnB3TcHNiYyLJWoohmTIz9MIza9kXFR2zbu7gCgy3lneSnC6BL/6jSS8cTc9GYOPjF8DBwF/TkoQvEubXVvEwydXTw8vpGM3GJe/zZyYuy/SgPMkga8lk7BLW/0gDFrQDyv2evz7ASrHy0OThI94WaTirZcE7b3zLbcvaU3UApqVRYoKGrzji3prGMsPoAYuQBw/A5DaQ3CI04KLb/C80pf+ZYTMltfJhBhPMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 04:31:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 04:31:37 +0000
Message-ID: <edac88ac-664a-4bdc-a702-b6f41d9cea41@nvidia.com>
Date: Sun, 25 Jan 2026 20:31:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
 <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
 <CANiq72kkRJVsp_BNszRDy5DaQ6qKhB7e7g16qvEQK5gBtVrYug@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72kkRJVsp_BNszRDy5DaQ6qKhB7e7g16qvEQK5gBtVrYug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c06a65-77b5-49ce-2ee3-08de5c93cb22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TngrOUNaV3N5ZTZoeDVJTTdzZTRMM1ZrUmxxMmZMaFFod1JnbjF4dEM2R1F1?=
 =?utf-8?B?MjhqYWdsTVN2ZkpxS08wWG5xRk9HRkhRREh6WG1UaE9iM21FZDc0SUYxR1VQ?=
 =?utf-8?B?aXZwdlBFSCs4RW5UM1FIUGpGZmZkQWpKWnEvb2hLcHdTVG9va0lQajNKc080?=
 =?utf-8?B?elhDWUdRc1h2ZkxWV2Mzc1dYZlhtTEVqazZITjNSNldTdWpwZndNNnphYzds?=
 =?utf-8?B?K3JHWTdleVYyNHdnSHRYbGh2SUZERTl5L0J0REo4MnI3d1owbi8vNXVJSVFZ?=
 =?utf-8?B?cmllenQvbkNaOFFsa1J5aHpVVUw2U1NVY0I4a0FwSndDSzEyV2wxYlk1ekFk?=
 =?utf-8?B?S1k4U2JEbTZmd2FQMTBLU2lydENCYWFTRGY2aXZKdjRtckpueWF4NFcwbzlw?=
 =?utf-8?B?eXpSdjFVY0JkdWd2NWF1ZUN5RnRLNVlpbzc0cCtraTdjMjAvUlR1akZSQ0xD?=
 =?utf-8?B?aFMza2Nwdlk5NGFPRC82TWtBTXFUeUp2N1I5N0hWUnUvVUo5cnZ6azlKamJD?=
 =?utf-8?B?TzN5WTgwVXJabmozTFd1b0FRMXpaRTdYSzBnenczOHNYbEx3bHUzc0dPUDdi?=
 =?utf-8?B?aVdaSkpNNkpmbVE1dEVwY0xWRUhzQ2E0L3Fqd2tiZXBQYWx4M282Uk1qTlZB?=
 =?utf-8?B?K0xJSzdxeE82c1pTd2pGRHltTFRnV2FVek91TGo0d3UvbW84OXhTQjBJeGZG?=
 =?utf-8?B?QitFS3daUzVhams4QkdlZ3g5Tm0vS1kvUi8rWmN2TzF1cXU2Y1IyU0t6bDgy?=
 =?utf-8?B?aWhWU2NUTGdnZGNSTGdVZ1NTbDhpNU4zcWcrTXZnVkJQb0hMeFg5bll3eWxS?=
 =?utf-8?B?S0cxdEJsVkNDeGM0L1ZkSTJMTG1MK3VoQWRJNm1nb1BscmJuL3hLbG5RYlkr?=
 =?utf-8?B?QzhQd2RrMUNpL0xBZ1p2OWowVG1pVXNtOFk2OGtBanc4NjhMblFaYzdWdEFL?=
 =?utf-8?B?WG85em5yWmoza0xKZ25nUDNmc2M4czF3RU1nZFI1Z290c3VERXl6VC85eW5U?=
 =?utf-8?B?dE1jMVhVam9BRGZRM00xOXg4OXJLMXFTTnQxR3p4WFV0bUZDN3l4U29CRVFm?=
 =?utf-8?B?RVRwclpMZGpiWnZDZUNJdEkrTHVBTHZLZ1BEUlYydWQ0VTlWdFV3QnNVSExv?=
 =?utf-8?B?cVhIUVAyOXpRT3BXdU9sNlZVUHBsdG1zMU5pQ0FCeEVqMFdzZHcxNGVwbHpw?=
 =?utf-8?B?c2NwWVcxS3dLZzIxMEVZV3pEVEVuS1MxekkrSnM1UW9BaUU4RmNpS0toVTlw?=
 =?utf-8?B?aGpoZm03RWpWMkpLUG9VcjhORTlwZldaeUZ5UFd3UmpkTThDZTJ6d3VaZGc3?=
 =?utf-8?B?dytOaURVV0tHVER6YVBiaDB2OVZ5QkxCWWtlMXMwdkw2ZmNYMlY1Q2YzekE1?=
 =?utf-8?B?YytXMFJaNEgvQVNXd2FNN0dSMmNhWHJka2FzUnZKY3ZIUUp1eDVueEY5N1Jy?=
 =?utf-8?B?VWJ6RDNITFdRdERBejFlMWpoVUI5Y2p1aHRUWTRNd0dYMXNzK0lQdzkwcWlT?=
 =?utf-8?B?MlIxYytESnRULzhqRW1qYzN0Z2FWclBFTmJ1OFZESmlvVzA5TnBJWTRmdDBT?=
 =?utf-8?B?M2dCdXlwQW5rbTd4dGZrSXhTcmhkSFhpNGprWm5FWkl5ZVRkWFE0QmNkdlRD?=
 =?utf-8?B?TW5ENzdaMDNIbzVGZTg1dXRLdktOdTU4ZnlmLzMyZEN1S2x5bS80dTIwSDVy?=
 =?utf-8?B?RWovT0x2SzVTQS8wWDZQQ0FGOGlOcmNpNmxyeEFHWkY2aVJVTnVYdTVPWTlU?=
 =?utf-8?B?L0NWemp2TU5OZnorR0dSK1NuS0Fad0tTZmNKcW1oMUFtVGRVdTU1bStBd1VG?=
 =?utf-8?B?V3o3RjAwZzFHM0Y4Lzdta3hZNVFabHVzbUtMVWlvUkhod1hhWkxZZ3hHaWJ0?=
 =?utf-8?B?VEdMTTlkakFxdDRvSjRZd3NyZWhGQ0xXRUJoSzk2aGxlY1hRenV0SWVaWHZj?=
 =?utf-8?B?U09hNVkwZ3JBSnpkOVZPajRLa280RXo5ZEZScEVkNGxVN0pWb2pyRGVySUhz?=
 =?utf-8?B?UlhtUGxGSHpOWTk1NzROQ2kvcHRPZWhIQTB1MVFad3ZZTkhhOVRMMVQ5OHFJ?=
 =?utf-8?B?ZGdvS3plMHNKRFR4NEp1MHlPaEVrOFZxREVldTd6R2pZT29HZFlxeFZVbDQ4?=
 =?utf-8?Q?/teQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1BKcWllMTB0M0V6ZUFUTHJBakYvdktvVUNIZll4WFZZdXlHamwxQ05tclo0?=
 =?utf-8?B?MHM2dG9mWDR3WGhGQXI1TWtWNlk5NGpYeUtWZXViQVRaTnVVUnVXdlczcHdC?=
 =?utf-8?B?TGtucnlQdTRWRmJta0RHN0dGUFNqcktaRkpObUxOMDlKNzdJTWVMQkxTUlRU?=
 =?utf-8?B?WDg2MnRYQVR4MllucHNUQllDdnNxZUNPdXN3a3NWZG1Ec3ptUm5VZkYzZXZw?=
 =?utf-8?B?VlJSTWRpamdaRnVwZjNNaFZDdUFsdHFBdUcwTC9aYkhCMVlJY0Z0MnJkUGlM?=
 =?utf-8?B?NGEyOGk3RlkzbFU2a3lFUEQ5NWJvQXFnbVRxL21UQndLbWVGTUI5aWZSSjIx?=
 =?utf-8?B?dTA3cFBZMXpRd3ZVUHIyL3NkZm5SZEtsc2duVmtueDd4aUh5czJUVjY3WkZD?=
 =?utf-8?B?NjR4K0s3d3plNDh5ZW1NYmcxOTNueDhianpWWDVUdG1mbldhcUd1OHI1V0Fs?=
 =?utf-8?B?SkVXOXViTzFPUi85MXhpVDU4a09tblRqcitFWGM4NEtvNkpqeGhsMEdLTkIy?=
 =?utf-8?B?eDhUdWpUa2VDTVZOQ0p2Sy93TnUzbk4rLzBGSU5ZUU95TVl4WnRvNW5BM1JC?=
 =?utf-8?B?b0UyWnRNMUhGUEFFaTk5bzRpUjhER2RxWFY5Tzc1VEhoTDZZZUFqck9Xbnkv?=
 =?utf-8?B?Si9QMGxRWTdDRDZJQ2RoZFRJZDJoV2w0QUVPZ0VTQ0tPUVFRN3JBd3o1YXQ3?=
 =?utf-8?B?NzRGWjRWbjlKaS9zaHJFSkRITTk0TWt6RVlkQmpxWkJ5UlhSN1pwUUg0aE5N?=
 =?utf-8?B?UkJsQ2RiejV3b1d1Rytzem9TelBKR1h5ak5KM0hPaE5Xc1l2dHRwNnBhSEVM?=
 =?utf-8?B?UE9ab091Y0VzN3JoNlhBdGZZZGE1c3dPYThSb0VZQ0R5LytLNXVuYkpZUEt2?=
 =?utf-8?B?TG03dWtBYmxzd3VUOUdLcVRFcjRVdDh4Y0ZtMENFamZnbVhwWmVXeUNaZVhT?=
 =?utf-8?B?L0ZyMEZheHR5SWdBVENtRG1hVTVHaFFCcEl1aDNwNHdDbTNGYzlENjBPOGEv?=
 =?utf-8?B?eDl5RGM3bjJ6RmJjQzhUcmg3eE1aL1hMUHoxTGxiOUxscjZWOEhXTUhVRi8w?=
 =?utf-8?B?SGFDaDN1VEVmSnRwYXpqcGdFY0pkR3p1Mysvb2FlK0orSUNXVVF2Y2tQZFZR?=
 =?utf-8?B?dyt4ZXhQU1Z0VEtST2dMbHRGeEZXTHpMWWR4OW9sdElDNVVzckduK0lLQkQ4?=
 =?utf-8?B?cmVCVmtlNWNCUGJEY0w0ZTh2L3dwV3JpQllrbmtaKzdaMlYrTmFaVjFmOUhy?=
 =?utf-8?B?UGUxUzJ5QURPWkRoTkVWY3lkT2JiYThMVTF3SWVJalFjZ1ZnYTdPK0VuSzY4?=
 =?utf-8?B?azlIRWtIc01reTFLV0k3U0JYWTdaUkpxMXdtMEpTaXpUbmlNMU1qejRYNGl6?=
 =?utf-8?B?a0VEd3ZQdDJDT3diVzE0S0dpc2VWb011bE41Sm5BU3lRSWdUZWQ2KzNKdnZp?=
 =?utf-8?B?VFE3WnZLVVdROUduMEJnMUIvRkFNTkd6dWdPNU8xZ0JIWXlnWGdTd2FiZGdX?=
 =?utf-8?B?SUl5STJ2REVhTGo2c1JjMzJMT212MVNCc3hTblNRZFFDWUczYXlJcmtLUHpy?=
 =?utf-8?B?aVlTWmc5WSt2Z2Z6RzU5QVZVR3BZcTJZcUhsTjMzbGtScG5ZRVhtYlVqWWor?=
 =?utf-8?B?ZEFxV25UOWZUSDZtK3cwL3QzdGxuVUFuOFhJTlp2dm1GQVF3TU94TDU1TXJC?=
 =?utf-8?B?a2RiaDJOMVZzWmxtK3dDMU91WFBoZUxZNitINUFzdDVKSXkyRDMrSjJEMDkz?=
 =?utf-8?B?NTJURDAvNzZVVCt5d2U2d0RmeVRnZHRwVHFDVVI4c2dDdDVvRkw4d2hXd0gx?=
 =?utf-8?B?OVFjeEJiZVFCTGdEakJKOW9vdkZkQjg5bDQxVGMxVC9TYVhZRFhvNTRtMHYz?=
 =?utf-8?B?ZTh5dUVOb2ExVGtJN1R2QXV4bHZZV3c5RTFOdGVLN3ZnOE5FSHhmamQwQUxQ?=
 =?utf-8?B?alEyYjVaWFlWMmVxdWpFR0xEc2Z6NG5HZlp4SFl0NDJmdnJYbzM0OG12TVU4?=
 =?utf-8?B?QjZSN1ZyR2tqNFNGcHNyL2lEcEVOdHZOazZvOHNBelFDMWovdmxQQmNvK2tE?=
 =?utf-8?B?NlFMNG5HWkVNZnFYM0t0NUlXNVhSNXRKcXdadk5YZjN0MUtwZEZacHlQb0hw?=
 =?utf-8?B?QzRmbk9DblM4WHFEY3V6SFF3SktmNXNpbFBGTFBZa1p0cERuNFgrV0xpangv?=
 =?utf-8?B?Q0swUDQrVmVmNzJaZ2d0bkU2b3JMODFtcHA1Ty84ZTNZWkExWWNidVJBZWsv?=
 =?utf-8?B?dS84TSt1QVEzWWpLMDFacmU0NTJ4TUJ5dVVsdW04ZitLTE0zWUdIS0xJZ3ZD?=
 =?utf-8?B?TnhOUFhuRGVDT2U0eVZwL2RpYm5odmgzNWZzRnV6c0JWYmlGa29wWDlyUi9F?=
 =?utf-8?Q?rV7H5mNmWeJE+uuU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c06a65-77b5-49ce-2ee3-08de5c93cb22
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 04:31:37.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk0epG0SNLVg/jIABmUgORVOqjs+xBWT0LxadQakvZCP1/BoUbZ7M3p+00k/5iXMnuXbmmcy0m5rjGhgO9dAEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739

On 1/21/26 8:15 AM, Miguel Ojeda wrote:
> On Wed, Jan 21, 2026 at 3:58 PM Gary Guo <gary@garyguo.net> wrote:
>>
>> Another top-level question I have is whether we should define multiple registers
>> (perhaps all) in one macro invocation. That's the strategy of `tock-registers`
>> crate which is widely used in embedded Rust.
> 
> Yeah, I suggested a multi-register one for something similar in 2021
> and even tackling extra automatic codegen there, like e.g. adjusting
> the value as needed to get to the proper unit from a sensor.
> 
> Not sure how useful the multi-register part in practice it would be,
> but it would allow to relate several registers together if needed (is
> that even common nowadays?). Or perhaps things like the

For the NVIDIA GPU drivers, maybe not. Just a data point.


thanks,
-- 
John Hubbard

