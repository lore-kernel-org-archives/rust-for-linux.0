Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013008.outbound.protection.outlook.com [40.107.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9525F994;
	Tue,  3 Mar 2026 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526685; cv=fail; b=FEH14bUbkat1ApoMvD6Qmn+oQuAHzbrcW0Uch+g6Am8butNe/Tcdms+gpQzSr+KwePAg/k6R4utze3neKQ/NsHc69licIxLnt5sOkLj9x/LfIGi2nbCTLF0osFdYapbsqZdTV9lWOeU8JL+hjYGEfW7iBtOmAQeLJ6Il+5F2GY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526685; c=relaxed/simple;
	bh=Lxn1/ZOQgYNhwuln+ET3DivNFK8oaUHGPeCAO5UXpj0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bVr7IfMqvehMZIBLR0fSUP9zP3Q/fliNZ3ha+pI3wiV+jOQFjqsGaqpH/6saBjgMgnFxPMFG1q2FHAsagPHa1wGbtFh3sXRyy68odTd9WnU2Gx0GzymgGFKcPGm4s2DJ8NtY37lybdvEIo/PKpKEFpkLN1pfQPCZTLpvLEnNX7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dfoRfZ7f; arc=fail smtp.client-ip=40.107.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dfoRfZ7f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR/l80dtGyovs93ZHXNhrunpKIDYfJaegS0vvFsSjL72LOw6C+9qiSZzbHHOy4J/PWlSeqVnIBmp/2Vcf4FjqqUFaoEOTUB48CO8Ko3pkiqpmqZvYanLXNxTGBR/pVkZxM6Eu+wVFWb0+ijdQV/ZDyI8vFR4bcYQfjfaHd7C98nQ13+7sv/sPWA7AURNkRq+QshOcMV+FvNhTLjOU+uUDU5DdtOrBQtetADVuyGNO61xN5kSPFxLZaw7sVw/cwrYmd1j93EBEIrV5pvW0J0ne5KT1LvVndBVB3z+0XVHDiUnkTGnGFDkXUzBBZESOB/TL54eoRegZkW/8eA45d8nkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Axi/oSffMngQn3CEMN+9af2HW0aDrlc71sUyAam8iuY=;
 b=UQSlkEPErWWhqLg+Gi2vHdunrvZ79E44tQs+LSv+bqUKoX2ZqT2qVoRol2TnuJ7BocWM+rHJ32MID8MjsF88cOULKrne70avoKSpr1RaQv5mj1LuOKcEkCRYTxFsBMyfBcGeygr62ckJ+FXZG3ndjZ1gS9tEmUiEG1/2rrRHqa8xmBh7AtJ92BMGI9GF7x7IZdQi6wkqPkevkTPUha0/u8DCVQ7LFZYvzCuYOlq/+knlq6IZH+8ugGmk6zApT5hnwVSgSROQyCuHjZOXFeov/X67x0n4vCfURSVuQoPZ48/qq94LmTA7saoDufMn/sWZhUxaDVRTLKS/EvFaGj5AOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Axi/oSffMngQn3CEMN+9af2HW0aDrlc71sUyAam8iuY=;
 b=dfoRfZ7fJ8rjz4iiFWhlfKoaPzRq1SlvBhePLGVel0NQ9ozb0C33gsZ+4OXXtFSRyvpzDbCD0qYsYNBWwq1ZtSMNXqGX7BshR+oXHLGhEP0uOhngGZ07VJRo+dvkfmr6S6wdBhraa+4UqqiehJz0/tZBNL4h1cdIaOwbf+KIXe6BFEikmlfHL4ZgfyAKQ/9SHiThzESHJqE3a5b9ruiyUZJxlD55Gp8jJS1Zi3lbtKQqsFmAOvPaq/BtR9c4X/lRPUQTwJPdDzM5iN85sMb6OVX2+dqodoRI9l1ER15TsJ/+RaKouBB1/LCrewkRq8B3iCO2OX+h6CurgIqBFxJZ6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7360.namprd12.prod.outlook.com (2603:10b6:303:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 08:31:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 08:31:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 17:31:14 +0900
Message-Id: <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
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
In-Reply-To: <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
X-ClientProxiedBy: TY4P301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: f6274278-2dfa-4a6f-41b4-08de78ff3d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	WeGipbpW8uA81T+6ZRtcwUOeGEyuytrsI5r/PZ51DlcpNHkp1neCAywhiyRAgML1JFJ15DRHzr7QH1Daa14DpT6UcHFEOZo4CmsGz5eq0s33/Za+TXok/nCc0Lc2vtSogGXqcMRlYvzRAs21IM3mREJBCBpsNl8K8Fm+IH/d+U/quhoEmyVCR3Z/dLZpzdOIqlQGC/pRAmZJBB8Xrcd+nV1iDZcjj/GGsnWccAW3tY5EHkB0IxigVSQAbDQxg4XmngCxpHmm+8YyCU6W1RK8rmYZtIxnFscZzaFGIBIjr+IMwLQ2Dmgmzv+QWE5/gVMTKJPOGHPR84jKdR9ROoZSPjH/BQq3bku9MmSezeiHQuUxYZRHLgRjs7eh29bqHdDvfvHf1vuzlAGN9UXE/XED8UguaHxvWkaZiRXkArKy26eWzYjVdtwITyZiC9fzBCvpjp27c59GoLitl3N378070GlHtujr4Lj4aKjeGrEaH0kTRBw2VdZFkhnN9e1Odv0i6+iAAwH/n8e4njIpgy6J5BguzEvO5BJZlyvw6E3K2SpWlX6Wq/srqAg2UQ5XsKhxNG6g5N0jKo47vMxWEG7xQ7yw75bxv5WvQUcJ+vs3DaHRUAQOF20AI6RKsiWh1SBaFUH7BZXmIwRkSBhSJFD3RGvo81LKCLFvQswUrBnaeWmXEP3+2tmOmIM8yAboWJ0TAM03k49WtxnVeJNDg+n8wXxGflu0Da2agVV4wP2zOgE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnhuOVpqQ2RsRzZSZjY0NnBFUHRoYmRmUDVOeFQ2dFJwcWhIcTlreVV2R2hZ?=
 =?utf-8?B?bW9NdlVaMnNQNExwL3pQcERHdHFaaWd3a1BuTnNHVFZRSnJWUTlRMkhKdWtp?=
 =?utf-8?B?S1duUENnVXdkemNkWE5oQmRDQ3FYZ1BPNnFZc21ERU9LVUd2a3F0V0RYMi9z?=
 =?utf-8?B?aGdJL0xmMkFzTi95T2RBbGY1bUQ0Z2duZFFXb3pYc3lhRWxqRWJzYXVuYzBQ?=
 =?utf-8?B?QTVobTJHUE0yRzJBSG9MRWV6UVJqK0xTMTNhYUt1OEdxNnJpVG9TanMyb0Fw?=
 =?utf-8?B?R0N1UmMwbjR4eFRrd0tydWg3WXJyQVduYXo1N2F5RWd6Y3V1a1h3eDJTSWxR?=
 =?utf-8?B?a2FTcjFlTzNIdHM4OEpjMnExeHh6UXc3aVlvdUw3UXJPV0QySlRoc3RsNVkx?=
 =?utf-8?B?MUI2MDkxRHlWK3dwdnV4YWw2MkZIZSsxQVh0d29VZHlESjZueTNXVVhnbXFK?=
 =?utf-8?B?UW9zWGIvZGk1eDd2YjFpVW9nSVcyUDhYaXlNSjZ1Ty9GQ08xakVybzA3ckdH?=
 =?utf-8?B?MUdpeEkrTWRsMEpKRXVsVnlMYmhqcmJwS0czNFlyZitBa2w5Unlnek9XcEFw?=
 =?utf-8?B?b3VXeThsZy9SZHZWSS9WR1pxMUhYMEpON1h5bll4L1F2NkJicnp2SHUwS29h?=
 =?utf-8?B?TmtYL2RQaHVldmNxSlFOcmh5S1lhc1ppcUVoUktCK0tYT2laVHZSZ283bkNw?=
 =?utf-8?B?NGdOWGlnSFRuREphc25ZZUFWc29za0Z6L0FyUVFQb2R6d21lODF4OTZOZGZZ?=
 =?utf-8?B?NE1WSVRiclZieGJWQ2Y0eS9OUWhreG9tU3VvZGZkc1dzSExoMHRRMXhiSHpm?=
 =?utf-8?B?M1FyM1Fack1rcDVHVVRqaGI4OVZJOVFiV0NiampXR0xuK1RDaVVDN1htdCtu?=
 =?utf-8?B?L3VaYjYwL3Q5L1RnK3QvQlRXUDhWZDUxNk9rd2FXdTdoaFhiVy9uVld0MzNu?=
 =?utf-8?B?NUdRTis2T1ZmcjVMSUNpQ2RGQTh0YkNOaVFxV3IyRGMwQUpaYmpybWdhY0VX?=
 =?utf-8?B?RzZJRWRJTGwvUTN6NGZFRW9TSExmU294K29yNkdLWVk5TDRsYUR3NnRqWGJu?=
 =?utf-8?B?ZkZzeG1LUUNZSStYSU92MVZOVC9RTTU5ZUd0MFpKcnJhdXJJeXhpenBMVEI5?=
 =?utf-8?B?YW5saHdrOVl4bXlKRDgrMldyY2NiUisxbUFoN3pycVhzMDJiMVZ5THVFUDA2?=
 =?utf-8?B?M1ZJYUVMTVJIeERITlNPNGpIUytWRFh2Qm50MU4wTWV5K3hZUVdNL0dEZnlQ?=
 =?utf-8?B?b2NpUHlKQStBa2dQbFdVVXJiS2JTRnVXUlg5V1RsNHpsbGI0bGs4WGo1Z3J5?=
 =?utf-8?B?eUI4bUlvczIyL2xDaS9NdTNRRWFHMTgzaE45V2U4ajZsZkpKM0FMcndGeHBH?=
 =?utf-8?B?NHNLMThCMEhJd1N4RDNMQkpXN2gwSmtoYlRBRlpydzBOUGhwZ0lHdFA4Z3JZ?=
 =?utf-8?B?V1hWNkNIeXI5cVJ2V1F2ZkpFa0plQksyVXo3UU5iTXhnWXNhNFBUUnpoL2hH?=
 =?utf-8?B?cmVleE9tN0IyTlJMZGpzMHdnTklMRjRoa3oyK2dGVVZRK2F6U0xxZEErYTlG?=
 =?utf-8?B?TzZqVzhvallMN1ZRRzNNS1QyY2Z6QUZ0N20xUFJ5dnVibFo0NEVlT3ltUVZY?=
 =?utf-8?B?ai9SdVJvaWtnSE95V2ZWcW9iS0N0aG9TTFpxdFVIZlE1VmJUQ2hlMWI2a1lY?=
 =?utf-8?B?WVRlendXc2lwNnJBcGxmWmgyOUdLbmp4QnVGUEdRcE5USnlldjNnK1E0YWdC?=
 =?utf-8?B?QzZmQytEYTc1Umx0YnJnN2ZsSkorN1dERDZ6elhJR2FHTlZ3akFTWUw3a25R?=
 =?utf-8?B?aXRmanpCYUZTQTNsbm1GTUJqazB6QjVZNkZXdjRVb0lxOVFtekhkKzA3cUZM?=
 =?utf-8?B?YkMxbzhNMURiMGdQRVpGM0F3UHdOOThTaDRiY2V1dkMvMGQ5K09iQzZaN2Vt?=
 =?utf-8?B?U0tpTzFBU3F2TmJ3clg0bDlHd2dYVWZ4YzFSYlg5bFpvSUwxdkEvSWpZY3lM?=
 =?utf-8?B?NCs3dENYY1ZaZU00ZlhPOUlpeXZsbis5Z05DTmZxQ0phK1IybWROdGROMlBG?=
 =?utf-8?B?aTBTbGNaSTdtN01ONUtESEtPTUpzbnVwbTUwdHFkb0d5cUJTSUxUNmZHQ0NE?=
 =?utf-8?B?NXJMU1hPYThCZHNISHQxU3o2cFIvbXBRR1h2ZjQ1ZGRDR2NGSkJadklQaXNC?=
 =?utf-8?B?NEpLRmsxeU9DQXM2NmpyTnVid0xGb0JCdCs1VlVlWXdMcjYxTVducU1PVzFz?=
 =?utf-8?B?V21YM2hFMFVWaEZYN0xTMTAyVHcyV2VZRWVXU1dmemd3UEdqR0d0RktJN0ZE?=
 =?utf-8?B?MGEya0JGU0ZiVEdheWxkOW5rNFBBQ0lSRWpjTkRWT3V2S1Z3VTBEN2dRcm4v?=
 =?utf-8?Q?bee+FCpQe2Xo9Tp8UFwcA64vD6N5aGVCMTNBfz1lYvbEE?=
X-MS-Exchange-AntiSpam-MessageData-1: ZkWDgOLDbapZow==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6274278-2dfa-4a6f-41b4-08de78ff3d48
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:31:17.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAKHrMVIBJo13ovkjKFXPYqzbOb9sITEsd6jqISOdV77grgJMqkPYaWBLqW3cbYeSkR9Ae6S20y8h/ioLzLMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360

On Tue Mar 3, 2026 at 5:14 PM JST, Alexandre Courbot wrote:
> On Mon Mar 2, 2026 at 10:39 PM JST, Gary Guo wrote:
>> On Mon Mar 2, 2026 at 1:12 PM GMT, Danilo Krummrich wrote:
>>> On Mon Mar 2, 2026 at 1:53 PM CET, Gary Guo wrote:
>>>> On Mon Mar 2, 2026 at 1:44 AM GMT, Alexandre Courbot wrote:
>>>>> That should be doable. Note that we currently support `zeroed` and
>>>>> `default` as initializers, so having the same level of coverage would
>>>>> require two `write` variants. I'd like to hear what Danilo thinks.
>>>>
>>>> I wonder if just providing a single version that starts with
>>>> `Default::default()` should be sufficient? For most users, zeroed vers=
ion is the
>>>> default version anyway. For those where default is not zero, it perhap=
s makes
>>>> more sense to start with default anyway; if explicitly zeroing is need=
ed they
>>>> can always do an explicit `::zeroed()`.
>>>
>>> I was thinking about this for a while and also thought that we probably=
 only
>>> ever need a version that starts with Default::default().
>>>
>>> What I still dislike is that the common case becomes write_with() inste=
ad of
>>> just write(). (Just to clarify, the name write_with() is perfectly fine=
 for what
>>> the function does, it's more that we need it in the first place.)
>>>
>>> Also, IIUC, if the value is not created within the closure, we'd still =
have the
>>> following redundancy, right?
>>>
>>> 	let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
>>> 		.try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?;
>>>
>>> 	bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>>>
>>> It's just that this case nicely converts to write_with().
>>
>> You would have
>>
>>     let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
>>         .try_with_offs(load_offsets.dst_start + pos))?;
>>
>>     bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);
>>
>> Note that the `default()` invocation doesn't mention relative base, as i=
t's just
>> plain bitfields without offset at that point. [ I like the fact that thi=
s
>> doesn't need to use closure, as I generally prefer code without them, pe=
rhaps I
>> am not "rusty" enough :) ]
>>
>> In my view, if the code is complex enough that you have
>>
>>     let reg =3D ...;
>>     <some code>
>>     bar.write(reg)
>>
>> then it probably makes sense to have register name mentioned again (this=
 is
>> typed checked anyway so you don't need to worry about misnaming it). Oth=
erwise,
>> one might read the code and be confused about what register is being wri=
tten to
>> at all.
>>
>> I think for explicit location parameter makes much more sense for relati=
ve
>> addressed registers and register arrays.
>
> I am not too worried either about having to repeat the location in a
> write if we needed to store the register value somewhere first. That
> case should be covered by `update`/`try_update` anyway. What is less
> acceptable imo is having to type the location twice in the same `write`
> statement.
>
> I spent the day testing different strategies to support the
> two-arguments write with both explicit values and closures to create a
> value from scratch. That included adding a trait to produce the value
> and making `write` generic against it: if both immediate values and
> closures implement the trait, that should work I thought. Except that in
> the call site the compiler is unable to infer the closure's argument and
> requires us to explicitly specify it - sending us back to square 1.
> again.
>
> Another strategy is to make `write` accept only closures, and implement
> `FnOnce` on immediate values... but that requires the `fn_traits`
> unstable feature.
>
> So that really leaves us with two options:
>
> - The current one-argument design based on `IoWrite`, which carries a
>   location and its value,
> - Or a pair of `write`/`write_with` methods for immediate values and
>   closures, respectively.
>
> I'm ok with either, but the first one looks more composable to me. I can
> send a version implementing the second one if people want to see what it
> would look like.

Mmm looking closer at the two-methods alternative, it does look more
familiar in terms of Rust patterns and less hacky in the end (i.e. no
need for `IoWrite`). The drawbacks are also manageable. I'm torn.
