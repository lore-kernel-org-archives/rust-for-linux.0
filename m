Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2231331202;
	Wed, 11 Mar 2026 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236584; cv=fail; b=prbuKfPf19CRE/WKBNN1rjwYTW/Y1R6OF2M3KFvK/0NZ3A+bPsgA8wgEJV+YktoDVv3C9ZoGBZrUojJQj3y381RnhiPZLHaxTwFSk5ZwkZTR0/Ew2p1vqrb5TOWGz2Oto/326eFQ8n4dKlgjZyBu1ZUIdKZ/jmOBmy3uNuWZQkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236584; c=relaxed/simple;
	bh=nPY3KSkYLT/07cfvYBx/cbnMj4zuU6M+VeXfCjYeVs8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=lVGZtKg5T6Nyj/DiQi6PqdhlZf0aCgcAHnrzZwOlXtcwuSOcQ0XywX2/zOtE74EqKLTzqjiULJecJZvh4KPA7o4Xcx5V92GGpu/6WNpkBiWcKAFEUIE8iOIYNCrEgjvcDrzv1w9HosYe3GvgzMuhLxyJttDk14qp1rO0OqFHt2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DfREs4if; arc=fail smtp.client-ip=52.101.52.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DfREs4if"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUJtGYnKWmLk1gOQmRUhbSUjLE72PpDgQyLvTojDt47NWsE4ZISwmRUxzeKkGxxKgf+0dnYSaGXG2FLvPv5olXXB0K7iA7TwBHBw8+LsfZlia2xSZNtTnnfW5y3MEyUSCqDGdnUJHiAnuLhIJWpdY804QQDhaAdQnsZ1P0GI3SVBwjACjEgwuzkNE5UYgJukrzm27uD0IDiNeAZcjPJoDRpiCuN67Qr4V2/qGFlax9Nw65231HThlsBifQvFIK6g4CzCpAxlDHYYP6cbVKX4jbAOlVSS8haIkBKi8pd3Vgd/FBTPCAcZIa5FaQg/XITDTOc5mLJ2RufTjgIKhkYozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=992x4HJzfvKi/3lu0z/uf93tbBPLhivQPn+cMDwOA/E=;
 b=Ky8b++GrDJ8JTda4HHZeAE2tXfkrAQcVEHYCfYgqiGA95kGedgyWDywL8Pvdow7DroISnclZsTyP7jTBAD+ZqZuzn5dF2w8c4guXbDXg4Nll5b3TMrRNZNCnKOKZ4SkNEBKnwToagRcPpiM3gBpIeIwrspdE9iUFKeJhtPZnDVLT9YVr/PAd9+tIZjTkbuxdFJqqv8QGG5JDgMVyKrFcEJVBFMM11xJzO3u0zWl84zjn2qIbAygTkswUVM//mheGm4otubR5AXmiBCPtpOTyhoXUMjNwlDHAuxlDou454KhOCLmNl/ljSeM6Yzs827gk1I371VzmgH8EUDmJX67Qew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=992x4HJzfvKi/3lu0z/uf93tbBPLhivQPn+cMDwOA/E=;
 b=DfREs4if287w04DFyRuOU1SkNTfNZF3c02qzMdFnKieoAnCly44MVT9FNx16tD1nmuZwpRT8PfuriAcCYYJWB5i0KhFgOubd6wLlWJQlWSBLKuqnrCFr4/WEnqlJasCtQiCekS14lZTPvbhF80CzJIAN4W2BiLD1Av+pqUi4u+0+YTfTRuwx2RnbfXMxTPLXOhZZak0gLqNenFENaSApTsyLFaQyoKXj8WaiROCFdgUGuQka5b/0RLCPGPFnfb26BHSQH1IMcMnmbQaNc0XNJ+Fv+4CjRMLzuDGMqdkaUzEVxcijN03sL9QZEGwfZxKsLoPgqs3p0ro90JLk2y2UTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPF28614436A.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 11 Mar
 2026 13:42:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 13:42:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 22:42:54 +0900
Message-Id: <DGZZWKFHTUGW.2437RRXG8FV0@nvidia.com>
Subject: Re: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-7-424f80dd43bc@nvidia.com>
 <DGZ8XPCCUDQ5.14RUPZWK8L509@kernel.org>
 <DGZGK7BW0J65.2T447EQK6I0HV@garyguo.net>
 <DGZZJ18RP1N4.3OMOHZU9WEML6@kernel.org>
In-Reply-To: <DGZZJ18RP1N4.3OMOHZU9WEML6@kernel.org>
X-ClientProxiedBy: TYCPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPF28614436A:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cff5c8-cef8-4549-231a-08de7f741ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rNx+CqlLXlMgENbArY+ElVz3+GTT4nyaf5DEMq50EBeYZigHPhlqOAsNA1jJZqak+0oncIjhPDtLeZYt1V+3CdaVBlRPAV8WE/+5lqSr43votX1tHy0Xlw9Zl/795Q8ONGzyQh4YkynCCYkdz6V9Um2gii8VZWbu0Zu7a9DN2jWc/0mAE0UW2dcvRqEAqyKHfm0Q91vCxvT6KZ5puR1u04hhNLy2Xeeua+OFnsPydl2ZV6mHeU90puHa+FC2UWWfAYBpCnS0BANkN64Ss1Alna1c8ouBEJ9uAQKTN6PEbF6Fj17CMsLz5BNyGKRVzCTvVO0zEhKjUhuXFFyCmofNT2uhGU49y+rdFYO2lgs5Q+O/OpqxMmV3OlFAllDLz7ubZcoNkLydXku4DT3dfeLEzGYVOR6PPpxSI/TyUR5cCx8mC5ZF6+FAosdC8XfSIMBHCxKPy/21i/dGcF76lAFWi98KgETwMM3HgeYWTSBIg0EW3j3aF6k34AlJLkv2ps4ZeXAJRhhwlEGt84KGhHUS+wVOKVhYxfCyk1LY7hBE63Rz+MABAh9umclYd6JXVMTqkQgaIn++evvDnEtE33zj5ty/PraX7FUtkCXajSNNGwSo434x7gEntMIPz7lQKwWlSssXzBEfGIwrtPCYdaWIk9ZV4wwVpymyAbaCWUJOOgc8YU0OU0vVw7iNaof0Em4p4lxF55jNWTdX3kkg/j0TowXL1YejI8slpfgdKVeTlL8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0UyVXp6RTZwc1AyV2NJZ28rTFJBd3dNQTR1MTZJazZyWW9iaUVwNFVtNEhB?=
 =?utf-8?B?TGNmVFRVZTk5UDVtK2dQampjQU91TFBQYTNRcXpIZlJaVjFMSDczWjNMYVpP?=
 =?utf-8?B?TURwaFNmbCtDUk00b2NvemQwc3lRSndTR0RGQVZXUFBHdi92bHp1UWF6Nm91?=
 =?utf-8?B?bGJIcWMzc3FTa2pUVVRLelFlNU8yczdoeFE0OHMrdnNtUk9ab2VuM2NLSG1v?=
 =?utf-8?B?SkJENjJwTlNzUzNLK1E1ei8vSXhoVlk1c2FwV0sxNlNZTlBSR2dCNmIrMGV6?=
 =?utf-8?B?VzlsSU4ydHhOZllTQktyeStPdEkzTTJSdjg5Nm5QOVpMMlp3Y1hoUDRPK1Ju?=
 =?utf-8?B?Q2pvbXgyeVlSODg3cjFUTTVWQjhkN2ZORmhqRzE2V2ljTEtVTHQ1bjNoYzN0?=
 =?utf-8?B?L1dpcU1WQWJkY3ZRL3JKUFYvTmY0R3hNcUNUcU1FN0FHVkRPd3hTSjJ5MVdR?=
 =?utf-8?B?bHBudVUyRXBWVEt3UERnMHZRV29pdy80M0ZKdTlaVnM3WFRMNDdvdWFqWXV1?=
 =?utf-8?B?cHFpZDVNanVUUFNoeEk1M3RZVDU2cGZaMUNtSDUvajViRzM0cDZqc3pSR2Vh?=
 =?utf-8?B?eGVSTDl3OGJueEVFZjV1U2I0ZkdNcWZGQ3drNFlXTkhsOGhCZXJQMW9oSlNj?=
 =?utf-8?B?U0ZNcnFSbkpqMCsyc3plRzVaa2hKaGlHTXV5U2xENWdBV2RBbWU2SFNxYmlu?=
 =?utf-8?B?dUNrOFBVZXpEME4rWm15QklJbkNxQTJQTmVBdlVFTENBeWdmNGhkNG9ybld6?=
 =?utf-8?B?Y1V1dE5jOVJrZGl6MGhmSnpjbThkc3VlT3dOaHYzakx1bzU3cDlucUphRlVM?=
 =?utf-8?B?YndkdEEzTWFhNFl2Y3FMSU5vS0lMbVhpdlNvc3JDMmlpOC82aFMrZGFXTTgr?=
 =?utf-8?B?MzErTFpFbDl4NHJBbUVxQjFzemxzSHdYSlQ4MmRKYmtqOFVhU1hiTW02NHpa?=
 =?utf-8?B?bmZEeFZyZVJKbDRsZXpuY3Rqa3FOR3ZkUE5jSHNGWVlZZktBYWI1K2duVEhB?=
 =?utf-8?B?VUNGMmdUNWlFa3NMQlZQV3YrKzVzeTcwdVRZZ3o3NHo3enRrTDdrbWF5Lysx?=
 =?utf-8?B?NXBLc0Zwb2pMSURLeXhNVWVtdzRXUGZ4VmowTnl5dktGdXl3YVRmbWJCYVU0?=
 =?utf-8?B?REEvSlN5RlNxQVFndVFxWHg5NHlaVUxTZDdEYnBBV1hnT0Vwcy9IWFpsb2Jy?=
 =?utf-8?B?NG5iK0ZiR3VVVFhEUVI0MGtWQllFNUNkOW8xaE1idzRQby8wN2MzU1JuSjBE?=
 =?utf-8?B?blU4Z0ZicVdZVkZidVN0anhmRDBZU3hnRkt1d245VHFUWGtuVXNyWFFqdkJq?=
 =?utf-8?B?eEcvSFFJcjZraC9OR2dUTityRFN6NE52UkhERktlWFlrb283aFQ0Z2JHYmhG?=
 =?utf-8?B?MjEyQWFNRWpBcmczdjhTZ0szRitCUDZIMTFXR05MUkl4RUdSZ2pXc2o2NHZr?=
 =?utf-8?B?MkFpME5xN2pvY1JEV1NwSmdMcVdaQitwU2RheEZ2K0FzbFNqNit0bHRxYlpv?=
 =?utf-8?B?NG9UNVdOeFNhYXpUaG5lSm0wQ1RTVlY2VlVyRnZ2aEpFSmZieW9EWWhJR3RC?=
 =?utf-8?B?dzRvRVFNK25qdUpjNDBvbzVqbVl2d0ZyY3RPdTJRUVZjU01MeDJFb1QxaUlo?=
 =?utf-8?B?QTJKOFMycEhPclVjY3pVaU1wVG10ZVdTRW9xVWl3ZWJHUVpwc3FLUENCSkVW?=
 =?utf-8?B?SVZYMWNDUGRjWDJ6dnBGN3MvaEtheGc3d1R4MmZ5bG5OSFlVQmVkdVE5ODR6?=
 =?utf-8?B?R0lreVpWa0xIajJCMHBvSk1ZUWg2R2k0b3NpQk9JU1ZmODNBVWRIQ1o3ZGp4?=
 =?utf-8?B?MWxhWTdRTUxSUFdMaXB1VEpoTnpLWUJWUEpMVFgxbGdsT1JFZmc2cERuaVI3?=
 =?utf-8?B?U2p6NkFvYzBDckJlcE42MVM3YlhzSHJWMDlEL0tEb09FQnVBeXNtU0xHRDV3?=
 =?utf-8?B?V2V1WmtKTFpsRTZ0Z2I2djVsLzMzYTQ0ZnIyaXhHQ1ZJMmtVRGZyb1hHZEN5?=
 =?utf-8?B?RVRPRTNNb3dEdERFV3hMRW1CeDhoSXRDQXl4ZmRjbWhSQ2F2NUdMMW5XeWty?=
 =?utf-8?B?Mng5eEQyNUlycFdtejFUMDhhNHRUZjc3STFFRnU0ZnhaUFN2Q3hsOXM4dXVm?=
 =?utf-8?B?TVAvTzdxaVQ1RVNIVXRGSC80UGtoKzgrR0ZrUzBVR3g3aTZvTnc0cFZqZWx2?=
 =?utf-8?B?L0J1dnN1M2UwWkF6MXJZWm1DaHQwRndWQ1RDZkZzV1E3a2M3QmYzL005Y2xM?=
 =?utf-8?B?anFuVUsvcnVmRDE3KzlCZUFUV0s4QTZsRWxZUUVJbTh3QnpEbHYwRjBSZUNG?=
 =?utf-8?B?WEtIc09FM3BtdnRXUjFTL29uUDZsMUlHQWp1dVdja0RIbnlrbXZHWTA1ajho?=
 =?utf-8?Q?tNI8+FtNimqnuMCmlSNK7xYV/yoYtzlT7rY2INB1pCCD1?=
X-MS-Exchange-AntiSpam-MessageData-1: Nk+Eb+lWvy/sbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cff5c8-cef8-4549-231a-08de7f741ae2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 13:42:57.8732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhBEAJRl4YhfRWOQQoFuYnpTi60Pgtpw8rgPTchdSyGu0PNeR783kmUFQUDdhvAjW7s4eInS72SgBbd4Bxc9FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF28614436A

On Wed Mar 11, 2026 at 10:25 PM JST, Danilo Krummrich wrote:
<snip>
> IIUC, the return value could be a generic tuple struct with <L: IoLoc<T>,=
 V:
> IntoIoVal<T, L>> that dereferences to V?
>
> I.e. the current write_val() already allows this:
>
> 	bar.write_val((WithBase::of::<E>(), reg))
>
> so, a corresponding read_val() - both write_val() and read_val() should r=
eally
> have different names - could return the same thing, just as a generic typ=
e that
> dereferences to self.1.
>
> With this you could do
>
> 	let reg =3D bar.read_reg(regs::NV_PFALCON_FALCON_RM::of::<E>());
>
> 	reg.modify();

That's the tricky part - the register methods don't modify in-place,
they return a new value. I don't see how we could avoid a closure (and
mutable variables) here.
