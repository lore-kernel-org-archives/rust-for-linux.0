Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FF169AD2;
	Mon,  9 Mar 2026 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079600; cv=fail; b=IgRN0GGhOMrynCL2FVmx7Yjp6v2bMzPVTYhLxBtkT6Y32+7AT30c2gqConsp6955Zea6Laufnumf+P8cufi66atZ/k4RohtCpXxUonZ7B4LGxdMmOnY6zpPxpcXrZKkJb1ovw7EtsYjDDCS+dbvXjhKXBVzFvQNE7ahzqtuh0Hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079600; c=relaxed/simple;
	bh=12YHukrNMTMw8wfjpvbIhJ24VcHuhJCV88hCq9H1bj0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iHJw5w4orp4d5B2rxm5fRKJn48j+3lZ3aayZj2BYqjbSDT0mkaWWYC2w8nF2eFxAMdsZB7dJEP9vlPzcuxyShW+50bY42dC/lc+yhhLO1Jl8vB97wpJfzDAwdXwtH+zAfz6wHm+1qwZ9iqihD5kBe6xqh4VbuUSaMp6yEupH6Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KzdKOXdL; arc=fail smtp.client-ip=52.101.57.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KzdKOXdL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vR/xRf03jX+h6bVHiRh+nedptc7rSPdcAJFp6cWDQlejqW18kU0CNYMm6KmqpUa2YDGcj/suV5xN90BIAOv0pnEXdTvxRKKM5fDp14gNNLwMvEE4/M6Z3RfLuePMlQ8BwEOdr2zG/BEtiUBps0JhRLK01hpAewG57kg/D+WtrzauuvXiFzsHkK1CcJRIOKbOTNzJ2tr2e1eNTXvj0/dvIvDqc9fFzksWjFKTCcrPaOS62o3XsSSnaZdfs7LTjmd7MP63hN/JL23CzKVxqSpWgcnoE418QJL+5Nvm35PZruhNNtq31kx9ffNWVHQebCTpQHRZnBwXJ41ZpW5WctK/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcefuFXQzi8X8YU99wv2uq5V8OZRASTQNbxWV3itfDU=;
 b=Ola+b8fZW/nYx+CACCrYj5Vg47EDQTF+0nVQ5yO7L8lMOSAkARMlsJysRdjN2OjcwI2LotxSfX/YiT5UO7rvHvmcexWG5NX6KzGWMY3rsjt4VeFTLHzh0nD/8OdKwQQfTLZq1abJELaC51g0p3PjmIXhtgz+HmC7626IuuB9ActIa8Ruza9j7elfTA18xN6D3lrbEROtzqMrjLcc7TxjGh3gEq4y/6QzCqcAB4UhXUlqyBLO5zO1Tp2U1LdJbSIySGyq/OAol6MqxG4e3VRTYInMYPMZUf2Huz99H55tWXIicJAPBIwx507BYjdTT9/B5I5uWs1aN7QSk9Q4SWh0GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcefuFXQzi8X8YU99wv2uq5V8OZRASTQNbxWV3itfDU=;
 b=KzdKOXdLMOuFRgCpREEQHfNNLnxs2f8mYQrFwdp6XvgT2Qf5riSNjqWjpOOMZ1kp2smI/jnJJmEFbxqgKEp+OL58EwGfPh6z4J+S3Go6lIa+D/FukXo361K+yxpiwDQUg8yWZw8u6GBDCbajAxySsFNF1fvrwCyVYbDev/IJvSIsOUyNtzGCD7GeaceI310RmwDORlJ7+ad/yYtDsJ15opHlsOZEzBQKmgnjpjQpzbWP35qEDBjjTncqH2jCWiVQV1V/SJpxwJLMSr5kUkFy8hbg77/4+KR2/bO1MpzPyL4DQjFGuqSpMP1qPuFkOEd+6obeMJStM/7tkMQrh7WGhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 18:06:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 18:06:25 +0000
Message-ID: <51449e88-5c3d-4d47-aa93-0aaf48b66cff@nvidia.com>
Date: Mon, 9 Mar 2026 11:06:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v8 10/10] gpu: nova-core: use the kernel
 `register!` macro
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-10-424f80dd43bc@nvidia.com>
 <3f0329e0-6718-4a5a-958d-4a8fa263e879@nvidia.com>
 <d85a3776-4a73-457d-8722-82d8dfc58591@nvidia.com>
 <DGYG7XXC7MUW.11Z1EROJ8BUIM@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGYG7XXC7MUW.11Z1EROJ8BUIM@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: af100f75-6956-4334-940c-08de7e069438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	ceydfVVWIv2oVRYJiSZ0FJYZjygj83a+sALhJvBJ6kg/maeXPnocHOftVtecqu1fAnK0Q9nNQc2jTkh5C0qqjDvv/18OLsVsHhq11zdIieNbvIAhXNVCD636bq3ygxOChGWmiHaio7EeIgk77TVLX6woDrvP3gbT3201Y4X2QfG9YKY8QbBuTSmm1FBlk3/ckaurRNbb49ETkfgbs0EjGDStWUVoxlW99dH4Obrdof+omPh5XfoY+ILH4slkK+/jkY/RMidNxzc4nADphyOgd4By6kU2NjWP4btpIsX7Wzh0++3t6fA4oWz7Vy8/II8/f5Jjk+ialue3sgXas8QLf9RQb3OHM04kPbikKnSy+0+MBlHImyUiDFOToHgOyN9eUMfqu2MwLhw0nso57QDQWIr9TsRlQ3jRj9cHyTsw2T43buL9/JSnT1nfSZ+BE7nBW3Gx0PT7BwHr6bT49dtm6xiCrZsT7N+qFi88YiFxQefq54coa2obnIDFJmD7ykb24g+NB6E+JVPakweH2LGpUaSe0MhTQ89pe5ZxS7b3Ayzf684s8b9u+2BLqEtCxjr3XXuJVkAHxr/9of/CKfgz5U6UWIpEhZC0qEfqzbjvbaBWgQlbki2/lwnyQTb3h2N7FvvKRqwoP8/K73YfgCdQbRtbJt95lOBt8wC4Sh9CX45vSgEvhNLfhO237HQWpcX8vdJanKFtBwqfPbQI2dLLTaYpEIyFxyq23YUFeg/Kpw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU52WjlkaUMrUk9IYk5UOTJsMFZBRDB5WnlaUFNsczlETTdoMSs5bklNS2xU?=
 =?utf-8?B?SEJrbTc3aHZ6eXNueEJpZG9KV2ZUMzBScjVLdXI4SEk2OU9BSDZNUXRzNEI0?=
 =?utf-8?B?aUFKOHJWQzNLQzNhNkc5Uk9VVlNRd1FMUmhGYXB2VmxoSXEzMmZYQm5XUFhD?=
 =?utf-8?B?WjNVOFBsTHcyc2N0ZWFBS3RxdW9iWE9zTjZ4Mnd4L1M1QkF6Z2hJbGl1aVJs?=
 =?utf-8?B?U3JvdDZ6bUxnaktuYVJlMlJKVlpveFQ2bUQzb2lHZW9DMFNpNkJaWFhZaXpO?=
 =?utf-8?B?YzJ0Wm54cDZ3djRLdVpIL3I4V05LQTZUVU53QXZqalZ2c1NRZnJ3N0hFWm1B?=
 =?utf-8?B?SnErVGZKK3hvdzlueHNncURsdXBCVC9zMzU5RHc5Ly82Y0QvZCt2dmFUZ1pH?=
 =?utf-8?B?Mm5iTkFxZkFPM1d1NFAxMURXUVArbVBXakdLaDZSWWJmbCtjb1BQZC9EMHZJ?=
 =?utf-8?B?M0NrMXBkZEtpQ0tkc2ZCR21CKzdZNEFrYjJxeWJTQzBBN3BrRjh0WHZRYU53?=
 =?utf-8?B?dTgyaFNnZWtIMkxiYlJQS0lwMm5Qam0zbHBBRExpZ1lHb2ZqNkxucEZWT1Bq?=
 =?utf-8?B?WDJGeWpmNHhxamhqdlFSaEJWSVN2bUlNTWNMUUg5TGx3eVoyRVdQV1BrWERR?=
 =?utf-8?B?dEErdHhTanJ2SUVaUks2d0s1T0VoNkd4M0pTZ0ZIT2c2QUtOckpicHJEQ21L?=
 =?utf-8?B?SkFoNVR2R3FrbS80ZHk3Vmg2K0Uyd1FRUmZRWnlPOUhnZU55Z3FveUNDZTR6?=
 =?utf-8?B?RjZkV1lBVnJqMHIybWV5aVJsODU1cUh1cmlyVUMvUUM1ZlllbC9rWmp4d2Iy?=
 =?utf-8?B?R2UzNXRxQ2NXTk1Ob2E4RjVuUVlYeG1yVzllWjBkZ1RranYxVmxINFNjOGZo?=
 =?utf-8?B?V1BzcVVkVXZIalg4MTNMV0ZBUGhGeXBlQmFVRWVIMVZ1amxWd1ZiUzRNYnNZ?=
 =?utf-8?B?eUQrbW9tdmpVUWdwbDllNUNFTHJZWlBLcjBYQWJ4Wmh0Snpmc0dvaXMydFRS?=
 =?utf-8?B?cUMzWWtaczBmRDZqb2N0RFR6QjZFVUltMDllUlVTemxzWXdBK3V0Wk9CWEtO?=
 =?utf-8?B?cmhJT2VQalVMVGFFZEdlcTBhcUdKR2tOaXVCaFEyMG8ydEx2RjFwY0xIU1lH?=
 =?utf-8?B?ZjdKQkt3NW5TbVhjVE5rNERVaEh3cmFvWnV0RFpSSkdXS2UrZXQrWTliMnF0?=
 =?utf-8?B?dGxKU3MyY1hOTGpEMWlrdEcwZFYyQTkxK2ZmSnYxU0NvUFhaNFdWaE5oUTQ3?=
 =?utf-8?B?eTB1c2k3d3ltdHN4VjFMblJpcTR4b0RBZTRiK1VrZnVnaUtqUVNrQkRDdVRk?=
 =?utf-8?B?TlN1NnN2T0h5QlRtN1R1MHhGSHZWMUhWNmMzZFNGaVlUQk14MGZFOWhtUFdx?=
 =?utf-8?B?dkpPSTVmYmdsd1E5am8ySDlZSnJKOHBON29Zc21vTTJacFJjRTN1VVZVaTJL?=
 =?utf-8?B?aEpRME51TzJIczBlTThRR1BiRFBCU1FnbWduWkN3Z3FvM0l2R2tQUU42NVlr?=
 =?utf-8?B?bGZ1YUVZQStESDJndDhIYmlrZEllZlJla3JxN00rMC9CM25QTVlKMXg2YjhE?=
 =?utf-8?B?eDN6NjFnK204U004UHcxTFM1d3ptSGpPY2RTUW91aDRtbERLQllONHFuTUlI?=
 =?utf-8?B?aWNMVExLTVRmUU1VU2VaeWNBUGF4OUJuS21nMEo1cWtxTUxVVEY4QkhvZmtH?=
 =?utf-8?B?a1NUT0xVMVFpbGdkWmtqMGRPWHFyZFIrMUFRR2pLYjF3bVYwZkdFRUdUMU1D?=
 =?utf-8?B?bXk3T2hZOTFsRzNvelhkRzQxZTlxbFJEV0tXK2lzL0Fsc3FjZDlMTnp2R1hR?=
 =?utf-8?B?bHJUK016elRsTUt3T2pROUsvbXpSK1pJNEsxV1RJQ1ZMa3F1Uko0UDZPUFNR?=
 =?utf-8?B?eDhqakh6VThrQ2VhS09heFJPZHJpNFVpbHd6ZFc5bGtWUy84RnlmNGdjMHJt?=
 =?utf-8?B?bmpwUnVwNHQ5QmlZRktTL0pDVDFjQkRZbit2OUwyRVhUQU5qeFRabXFsY0Vr?=
 =?utf-8?B?clFWTXMrb3p2RlJOMXFHelNEMVJJR095MHJJRWU5K2ZVQWNHOThaMmpKdS9v?=
 =?utf-8?B?VkJKaHkwNjNZUDIwaUQ1N1FvY0h6aVpDZzJpL3NoOExZYmJNRDRaWGJsVVJN?=
 =?utf-8?B?TEVYMmkxb2VXN3RSSytWeXlCNytjMDJvSGp4elhzZEJCUGtUTmZyNElqTzRP?=
 =?utf-8?B?MTVHV0Z5Z3RseU5sbGtkRmRQaGRXa25yVFIxZEdvU1EzTWRXcHAwOHlPZkFa?=
 =?utf-8?B?eld1cjdjdUlqb3pIUXRNR3BpMG5DZDE0TmxlL0dLdDB2eVk5MitFRXNVY0Yy?=
 =?utf-8?B?czZYSDZaTkN0SlpPMDkySkJ1UHFETmVLelJVWk5EdjRQR2hjZ1p0UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af100f75-6956-4334-940c-08de7e069438
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:06:25.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/VsOSGKMAd1BLoZxTweQ0zO2P0u2zkyEFMELvt3W5+Yht6febdlsxe0mfbVANC2H+/o5pkf0hcep+vFEHANYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342

On 3/9/26 11:04 AM, Danilo Krummrich wrote:
> On Mon Mar 9, 2026 at 6:34 PM CET, John Hubbard wrote:
>> On 3/9/26 8:43 AM, Joel Fernandes wrote:
>>> On 3/9/2026 11:14 AM, Alexandre Courbot wrote:
>> Let's break down the remaining troublesome part a bit:
>>
>>     regs::NV_PFALCON_FALCON_MAILBOX1::zeroed().with_value(mbox1)
>>
>> * "regs::" can be omitted with a "use" statement, right?
>>
>> * ::zeroed() maybe should be the default behavior here, and then
>>   it could also be omitted?
>>
>> * .with_value(mbox1) I'm sure this is necessary, but the construction
>>   is unfortunately much less clear than .write(value)! Thoughts?
> 
> I think this could also just be
> 
> 	bar.write(regs::NV_PFALCON_FALCON_MAILBOX1::of::<E>(), mbox1);

That would be quite nice.

> 
> as we would want it for FIFO-like registers.

thanks,
-- 
John Hubbard

