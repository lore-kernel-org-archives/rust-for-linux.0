Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880802D8DA8;
	Fri,  6 Mar 2026 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772775479; cv=fail; b=qcWIM9TxktPegDSJQg6I46pAoV41L13iTgfAt3J3D5TdGfJJFFgjUTM7XuQgbqIPcnunh3mltBsIQ0DNcQqFHPLIDkwF8dnaz9Ne2IRifVt3YzeDO3IY6vXV4V2IJYqaWpJ2bdGg+n3cNYAZuZI0VKJPvkzIwxrKxScfjLcmQBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772775479; c=relaxed/simple;
	bh=CH6MHV5hEWqi0Xrxppfc560B5evWrXF6bD3s+2w33EI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=rpPUtfK99DpuoBtmSenkOc63RJ6iaIcj3RXkTLYWvlYyFHjw7zNtOn8AK8bydQu2nj3N7StIivBqKEtd/BaRveH9V735vuc66rR/A59OJ0ERHhT+irMHuwoW/yNv9hl+C+siHh7kw063qgolKgBoSz39I2smHKfu+orHJTP0F+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qUpSZDLw; arc=fail smtp.client-ip=52.101.48.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qUpSZDLw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQXT1sGJfArpHkGVQ9cBg1agkMJHnx+1CN25uWLmuISbvT0AX04bqZo6w6aJn1y+QoIB647GqkyWxgYPOey7rCluswX/r9S7nzY3j6kscwwJyStOkvWhxtIo6EwWIRNJF0zpKs+MH4oBPnXYACS2eS9c7L/QbluzMyv/dnRHHLuKwLqu806GEd+hV53CRpq5TVmwbLAzhDdhkCFxMmfz6UVo8JL0kpnW824Aaex/c+yIQoTc+M3C5c7yZ8wKcPpJwD2sYOcD2I0/fRYBh0L9jwFsr2ndl4dzeXz/3GLbR0UoSDJTOJFpPj0DGNS0QFfN6mU1xFJ29NP46g9t+tVtrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/S62/+umZFW88JTx/oj2Cn5+Ta5li3LebZO47xrFOU=;
 b=ucE3YfKzdVHcvKiydhxbVTKmAMm1YqCZ41cSJhggySWlyammIefPNba2mGEo9xrQI4tCO7OCcdV3qDjIslQ+uVoRAT0Cwim54bL+wkX9Gynj6SUax1xr/f5jPaXlVMTrEGJUY3hUD0OKDxobap8IOv4ZoOK8kEJILg+ylwvZqUMTwvHrY9BXGA3DseHSDxur7x4McepJRYVQT/WvqPI5rqj8rEsbb6LsH2E5XSuTba/PyJEA9yzVNn6DvzcGZXnnd++SOKGJExI0iIgnrzW2a8K2AbGTXsJYjuvD0NdtmSPzhQMAuDhbDI3TvgutFA5GObXZjbyBsBvtUnCz8nTx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/S62/+umZFW88JTx/oj2Cn5+Ta5li3LebZO47xrFOU=;
 b=qUpSZDLwpo0rH0y9JOsFOsrmp4izPF/9vCfAihtLOVScururFRgCIuYgqIvNsc/jg4BV/0U67UipXFqgZlXdz83ONixRP+Skihz7Y8ccWNQxptvrWTfeL9E7YW/E+mpx/qzm06x1iehFZsHtVaf+mvLCyJSbz6RqZQ3h2dIudJ7Bce0UFcrYDE4H5+NaTVXPpiCjCW1dIzb6IDdLUYMkjvAjRnORs5hNTiRUYa4biPqYhkUk09/SEa8DS9KQvFVkenZXYC9zixM635oLEmMO0+hX+EXVhoLqDZoiIDV6x1Cz2eKv3R8Wrj6Vl/z4SBshPpbTT7g4Rw3DJJYrsnQ+OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 05:37:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 05:37:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 14:37:50 +0900
Message-Id: <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
In-Reply-To: <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
X-ClientProxiedBy: TY4P301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: e17f0710-a6e2-4032-b467-08de7b4283a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	sE3QesoOcMN29JcDtivTUl1l/7jHtBrfCdUfr7QtWQa9XiPqIX4qgGIsHSQLi8aRc7Y0QuycKmVihVKCKgFTs8744QOQtrSYqyMmn1FiIzXTWxn8lh4KcBYYS0t/6AXum/934MmH34iKd6c5Gc4453UZuHAwspXdmuzElMy1k7QEsOrvWVC+5lsrZHRtoHAxZt9UtBOmp4l+tpSiuAsRbyBPy6pdCDwXCvwEouCYi6NHfN6IVpThoLQq9tt6r3WtOrqRq8cZ/+/9Asa4tpmMZsnDIEqZt5pHEqxURqz+5Pdwkcw90YF7jprPBz0y8aaI3Jbr/FNQNwe8/DCFNAU2tREI7t8JefR485ulmU7W4KKyAulLZ+CMHdyB8dsAhqSEg9eAjBkIXh2UWXeTHfoacGlh2KlB4ZkBw7FEEqyAge8L2yoA6jL5SY2bOMK2YknDHMRi6tM8Mcbg6yiqA0JdHoF20tMGMThLHFeHLSr9ROxSPnYG/uizJNBv0Dwrhaape2IUaFvMQ2pGasVZhDPtsmGXs7UyU5/lEbgsKyIAzbU3TDzolOpGvNz2znLKfJrz0bDjvagv6BUjAc7oxY5H7JC8cHVUWd3Uus5XBcEMS59DAj7GjvoL4xBpWDvVBKHRfkX73hzFiRX7QiEwnE+zp3MXFZeam23ouiAlujNwONbKfsjA6YmLBLQNcaoP45o5UF5vUMGn3BKZ8uxRaukMNyIKEiDrYAquDipkuE3JgTwsbGKohYGKhDCI+bQ8PFSs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUM3MElwMkRzQnhEZGpsdEkvZllzMTlicGloTU9IeDR5TkVLMEF2UFVnMkcr?=
 =?utf-8?B?Q0Nza3pxRXRPTHN0YkFPVmJ2R2JtRm5wUmplMUIvblptaXo4clVyZ3FGUlpp?=
 =?utf-8?B?bHlUL1lhdnZ5eklzR1BSQndWalBhY044UlI1dGpwT1QvSk1DZDgrOFVMcDFY?=
 =?utf-8?B?dzM0Z2FCN0s1SzZnMUlWM1UveHZWS2sxbDBFUUZQYkNSMitvV2lrYngxc3k4?=
 =?utf-8?B?UFhSZ2l5S1dIUkNhY0pqZEpJM3pta0V0WWdaL3psb2VyRHU4cWN3NkFYaHBB?=
 =?utf-8?B?TkNYZFprSVozbDY5TVM5eEUxVXRKSjZRa3lhZnEvazdIbk9lUmcwTFV1WW15?=
 =?utf-8?B?VU1lZkZ0Z3lvNzhMMUcxbFl4RGFEUjQxME5GQlBYcmZTYkUzcUZxSk1QQWNW?=
 =?utf-8?B?YTN2SVNQWFIvOC9DRDRMaU1NcGtuUmtQYWtjTDV0bm1xaGI0Q1FFckhNZXBG?=
 =?utf-8?B?dWNiVmg4NUxvN3Y5aDhhTnA3Y3JMUHFoc2huRSt0QTdENTZ6aEgyTkFvMTUz?=
 =?utf-8?B?eXpDSGNHblhRWGVJc2Q0WEFGbW1hUVkyNWp6ZldDeEZhbzJqZHV0V3ZMRFZ0?=
 =?utf-8?B?WlRmUU9IZW0xUm1kbExlOWZIM1VQWUlOcU9VMWxjVFhnM1d2WHFPUXp0bGZh?=
 =?utf-8?B?cjV5OXhCQTdmRmZRVVFFa3llRThnb0UzMDY0QTN0cVE4OTlvVnNzbkFnWEI5?=
 =?utf-8?B?UHpKTC92b2o3cEZkd29PWWpYS0N0b2JnbXFjdit3UExrbjlPNkE2Q0tBZ2k4?=
 =?utf-8?B?eURkSE5iWXhhS3d6ZG5OY1RGSWdKTWdYVWlLdHFXWEFKRlE2TW9QbnA0WHJP?=
 =?utf-8?B?cWY0VzNkeHNkT0xWRzZUYTVYY2lzNjF3Z2NNejVSVnNNSGJyQUZIdDFsNzJp?=
 =?utf-8?B?SElrdUNSTjZrMzFQcEpiWEZWZVhCWkV4Sk4zSlpIeWtHd2hMaWkvYjhPdmQr?=
 =?utf-8?B?OFFiYVlxUUw5blZHOHp5ZUdBVWJXS0pTTzVNUlhZMGNjZUdPbFd6UEVWMXhr?=
 =?utf-8?B?RkFFellINGZkeGVlYjNESUZFYjBPTnFJaWpzRnBHa1NROFBGQXVKRFpscHI5?=
 =?utf-8?B?ZHFtZnUzWkZDWEtuMkpoZFNjaGtkTWtWak9iNkg5VDBpdkNna2FuYmhSMDVV?=
 =?utf-8?B?Qk9IdnpXdEN1QmZrd2tZNlZDWS9LU1hyTFovN0N3VGExUUx4aUxkMUVLNnBW?=
 =?utf-8?B?ZGtVZ3BaZURSbHVtQlZCZjM0NFdFdEFFZGZwRFV5V012bVZIMFViU01NK3Rq?=
 =?utf-8?B?eDlDNTZibGdMcG8ySTJHWUFyY0RXaStDOGFHaVYyVzQ0bkZLUnJnNkMvelNi?=
 =?utf-8?B?d0VxQzFXRVNPNVUrSERPNzVwbzUzK2JjczR2dDE2bmRwOUxoUlJIMVB4VDBR?=
 =?utf-8?B?c2dTUHdMVTh5SkhkQVBLY0F2enhwSFc2VXJkREVadTgxVEVTczJGUXBmd1E4?=
 =?utf-8?B?RDJ3UkIrREcyUUdITzUvTTd4d0kyR25rSnF5VTl3WC9WR0xKZ2M1MmdCd244?=
 =?utf-8?B?S1pHeHVWZElRVmtJYW9SVVk2RXArR0FvbFl3aXVpMU0ydnBlcVBuZjVGRWJj?=
 =?utf-8?B?R1lzbUlQTHAzKzBHUGxxWXZKdTN2WmwyY0JkTGhNMlpyQjAyWmlObzZaV1VP?=
 =?utf-8?B?R1AzWkh4VEM0V1RpMXVvWjRvMyttSTBWWEhBL0s0MW9BeFhpdFptek9rWCsz?=
 =?utf-8?B?bzVGZHFVSHRPK0M1dUZleE1YWlhXMDc4Sm5EZFhxWDVTb0FXUkNkOGJ6dHE1?=
 =?utf-8?B?bFVIK2hIdktranFZMUlaNlJUemVkUWlIbjFtdnIxck5uK1diRGJ4dE1mbk1T?=
 =?utf-8?B?Y1liajJ3VENpU2RwVE50NkNtb293bGp2d05heldudXY0R29neGNuSi9WNkZm?=
 =?utf-8?B?SGdFMXpvdERQOEZ5cTFqRGpkREN2MUZrVGtKYm5vUjI1SXdhY0NzUUpMR3ls?=
 =?utf-8?B?ZDF6SVFiSTRPaE51YXc0QmwzRDRNUzFpUVQzSW1md01jdFFhTlVXSE1vOWJ6?=
 =?utf-8?B?dGN0SjZPbGMwVTV0VnpuU3VJaDg1UVpTcTdRSE9Gc0tSSjdEWDdib3owU2tY?=
 =?utf-8?B?Y0VYRGpBb0o5ZFRSVTlYVXpzWjMwR0RRRXJlZFY4RjFiM2pkVlFjWlRBeUl2?=
 =?utf-8?B?ZHRGTVZHVWJvUTFjQUhjNzlhTzFGSVJySXV5QzRPTlJPUFh0MXFCa1BWMWlL?=
 =?utf-8?B?bGNieDRWWVU1Nzg3WU5zT0V6VzZpZ1hzZG1vaWc2NUhXZGxhUGxNaEk1N29k?=
 =?utf-8?B?N2pMekJLZXZDRnQxMTdQTlh6YklFK0E3dE82cDdIQUR0cFFRUWp2Qkk4Tkhs?=
 =?utf-8?B?TCtQR0ptQ1R1aS9FcnJIRGhpSTlFVGdFZVdGRmI5OVEzZzNsZmlZSS9sUVJk?=
 =?utf-8?Q?C0fOsjmX6ZpLP+ZEOZLnxVvzx90m4GwfB4oJoGJTCfZy/?=
X-MS-Exchange-AntiSpam-MessageData-1: eDr1BTbaIwQMHQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17f0710-a6e2-4032-b467-08de7b4283a9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 05:37:54.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/h0Qe+GRufUNjH6ac0IsgHdi0fqTM9Uml8fIC3Mhu+OLuhjzXJ2H3bvRyH74fyOpbuP+H8/+cRgVL8KmPIqcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520

On Thu Mar 5, 2026 at 7:15 AM JST, Gary Guo wrote:
> On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
>> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>>> On Wed Mar 4, 2026 at 8:37 PM GMT, Danilo Krummrich wrote:
>>>> On Wed Mar 4, 2026 at 8:48 PM CET, Gary Guo wrote:
>>>>> On Wed Mar 4, 2026 at 7:38 PM GMT, Danilo Krummrich wrote:
>>>>>> On Wed Mar 4, 2026 at 7:58 PM CET, Gary Guo wrote:
>>>>>>> On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
>>>>>>>> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>>>>>>>>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>>>>>>>>> So, to get a better idea of these two options I have converted t=
his
>>>>>>>>>> patchset to use the 2-arguments `write_with` method. Here is the
>>>>>>>>>> difference between the two - it is particularly interesting to s=
ee how
>>>>>>>>>> nova-core changes:
>>>>>>>>>>
>>>>>>>>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:li=
nux:register_2args
>>>>>>>>>
>>>>>>>>> This looks good to me, but the fact that this turns out nicely ha=
s nothing to do
>>>>>>>>> with write() now taking two arguments. I.e. there is no reason wh=
y we couldn't
>>>>>>>>> have the exact same write_with() method together with the single =
argument
>>>>>>>>> write() method.
>>>>>>>>>
>>>>>>>>> The contention point for me with a two arguments write() method s=
till remains
>>>>>>>>> that the arguments are redundant.
>>>>>>>>>
>>>>>>>>> I.e. you first have the location in form of an object instance of=
 a ZST (which
>>>>>>>>> in the end is just a "trick" to pass in the type itself) and then=
 we have the
>>>>>>>>> object that actually represents the entire register, describing b=
oth the
>>>>>>>>> location *and* the value.
>>>>>>>>>
>>>>>>>>> So, let's say a driver creates a register object with a custom co=
nstructor
>>>>>>>>>
>>>>>>>>> 	let reset =3D regs::MyReg::reset();
>>>>>>>>>
>>>>>>>>> then the two argument approach would be
>>>>>>>>>
>>>>>>>>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>>>>>>>>
>>>>>>>>> whereas the single argument approach would just be
>>>>>>>>>
>>>>>>>>> 	(2) bar.write(regs::MyReg::reset());
>>>>>>>>
>>>>>>>> That's only for bit field registers that has unique types. I still=
 believe types
>>>>>>>> of registers should not be tightly coupled with name of registeres=
.
>>>>>>>>
>>>>>>>> Allowing a value of register to be directly used for `write` is al=
so confusing
>>>>>>>> if a value is not created immediately before written to.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> So, if I would have to write (1), I'd probably be tempted to impl=
ement a reset()
>>>>>>>>> function that takes the bar as argument to hide this, i.e.
>>>>>>>>>
>>>>>>>>> 	regs::MyReg::reset(bar);
>>>>>>>>>
>>>>>>>>> I also can't agree with the argument that the notation of write(l=
oc, val) - or
>>>>>>>>> write(val, loc) as the C side does it - is common and we should s=
tick to it.
>>>>>>>>>
>>>>>>>>> This notation is only common because it is necessary when operati=
ng on
>>>>>>>>> primitives or when the two representing types are discrete.
>>>>>>>>>
>>>>>>>>> But this isn't the case here, a register object is already distin=
ct in terms of
>>>>>>>>> its location and value.
>>>>>>>>
>>>>>>>> I see no reason why register values for different locations have t=
o be distinct
>>>>>>>> in terms of value types.
>>>>>>
>>>>>> That's not what the register!() macro currently does, a register typ=
e always has
>>>>>> a unique location, or is an array register, etc. In any case a regis=
ter type is
>>>>>> assoiciated with a location.
>>>>>>
>>>>>> If the proposal is to disconnect location and register type entirely=
, that would
>>>>>> be a change to the current design.
>>>>>
>>>>> It's not what the macro do today, but I don't want to ask Alex to cha=
nge it
>>>>> further before landing the series. I do think it's a worthy follow-up=
 to add the
>>>>> ability to decouple the location and type. It's not incompatible with=
 current
>>>>> design anyway.
>>>>
>>>> I'm not sure there are any relevant use-cases for this. Do you have re=
al
>>>> examples that would not be represented with array registers?
>>>
>>> Even for the cases where there's a PIO register, I think it's beneficia=
l to just
>>> get a value without a type.
>>>
>>> I don't see why we want people to write
>>>
>>>     self.io.read(UART_RX).value()
>>>
>>> vs
>>>
>>>     self.io.read(UART_RX)
>>>
>>> or
>>>
>>>     self.io.write(UART_TX::from(byte))
>>>
>>> vs
>>>
>>>     self.io.write(UART_TX, byte)
>>>
>>> what benefit does additional type provide?
>>
>> Well, for FIFO registers this is indeed better. However, my main concern=
 was
>> this
>>
>> 	bar.write(regs::MyReg, regs::MyReg::foo())
>
> This specific case is indeed more cumbersome with the two argument approa=
ch,
> although given Alex's nova diff I think the occurance shouldn't be that
> frequent.
>
> It's also not that the two argument approach would preclude us from havin=
g a
> single argument option. In fact, with the two-argument design as the basi=
s, we
> can implement such a helper function cleaner than Alex's PATCH 10/10 (whi=
ch uses
> `Into<IoWrite>`:
>
>     /// Indicates that this type is always associated with a specific fix=
ed I/O
>     /// location.
>     ///
>     /// This allows use of `io.bikeshed_shorthand_name(value)` instead of=
 specifying
>     /// the register name explicitly `io.write(REG, value)`.
>     trait FixedIoLocation {
>         type IoLocType: IoLoc<Self>;
>         const IO_LOCATION: Self::IoLocType;
>     }
>
>     trait Io {
>         fn bikeshed_shorthand_name<T>(&self, value: T)
>             where T: FixedIoLocation +
>                   Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType>,
>         {
>             self.write(T::IO_LOCATION, value)
>         }
>     }
>
> No need for a `IoWrite` type, everything is done via traits.

That's cool but will only work for fixed registers. If you work with, say, =
an
array of registers, cannot implement this trait on a value as the value
doesn't have an index assigned - meaning you would have to build a
location in addition of it.

So it only solves the problem partially.
