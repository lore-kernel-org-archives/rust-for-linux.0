Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641835CDF1
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 03:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773632689; cv=fail; b=SYpZrpQXymfOdSHANuKkTtMlGeMLEu39xZCNLijuOk9PYEFVUumVVgEE7U1O4MIlCbg6pxOC3WH6eJv5Frl7YxgbNGklXLsdgi8sMm8IlpwjfbHX2YWEJ2X0C9xP6raV8MCezLsClV8Z3FYPQYESLFmz8nw7PEHiIx0M1gk4TYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773632689; c=relaxed/simple;
	bh=8t9XuOaSkzrpHsNm4aKCuQ581JWCefv3VkyvRAkNftw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LwUrf7HXdZel6O8PsP4j6GzgvPtqCLLux/VaIajYDinzYz7uAJiehqcTMZh+e0lWFhI6CoLp5ixKR44xkEyrZh0YToocclK/FSOZ6Y74aD7csBRdR4sGANmN+yvEC3aVK1QN+MsJonknKBDELpBJumQl5CwV1hHpqT3HZNJcHXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I4Rktz9A; arc=fail smtp.client-ip=52.101.62.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I4Rktz9A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jidR8bG0dIbPSder6GYHJbje3eGEb1xOryWk+FP+lh0BXHTQSV2EDtlkAdWAiG3KKy/pNenYXvWaEVt/f4xVs5yd4VUqKO/BRoFiZSmGC+DmPoWWyH2j9BJAPlHIE4h8lu3N2PN8dHlERFWk/uU4QkvYhwkFzdCr5S8kyLg2myMnxbPenGkKCmhm+jwPbuMiWyQq/I0HgE0KiDrlpWv/5MTWbz5Z3aq8FtGvEKixXft+c3r3utL4KdvEpSuK3nUuRokgInjnxWQdH90edwR8my6dZgmVGniBrr38wMs97QbLW8nwZVJSIVEbNLKcn2ctVYrRmIGc/ANo/y5CWBumKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlMIYdaj/Bcv9Bl4YpheUSLEIIHGuAH2MpkNRRYes5A=;
 b=pET3vGZhec88kDJ7hVSNZOuz5IX0LoFkcb3p/fGgeEzSLq6SSqF+7UtXcgnPpzpQF/99+X41WqV4cqjFAu7+qMMruBGKmyCv8Pj5AEtGdfkrudGknI4jMUHML+gJ/hF+6d0LIgPFXjTUN2ajGwNdWc3p6lmZZKa0vtb83DicnNWxnoNbkwTbsIOR2ShrUaBRswDNtLOQ82UOZptaMEUid2sBHJBFbGfkkUtAPR1Q6v8brR0G2nYhX5C72r7DHFxo4pBDpBtiqbIWfR4dv97LmnNztK0Z2NyvmzQeIPAyzqDN0sGEn0gc0XG+1qmfUqPBzkH+HzVl7/eJeBDwfFfEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlMIYdaj/Bcv9Bl4YpheUSLEIIHGuAH2MpkNRRYes5A=;
 b=I4Rktz9ACtQuiD9k4xd6S4Boa0IYYLSsuDkoLIT7WQgYvXPnqKPUU3ZCfJ3E6qStSkxayYcoRUXjMEe84N4NG6BawP+rQyOiIek9sD2VTPZZkvlOlcLahzhaXflrV/aLmZdxtjfmpDh+e89DJwB+Xh7/ngDua+ieIJgXuAsTph8gwnsMOxaqsSo9dLofFjioU+sR6uqK7GeYcYa+/DmC+YeKUImFlhqNlgX5AKazjklZFCCqb6WOVn5A+k7/GrRsmCqP62gULukLhEUaIJl1WqXXUUmX0JdlBiW+Y6gzmNhQ4v3xreWLtpn4oh+m83b7yA0Rxxzeo0h8af/IPC3DLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB8836.namprd12.prod.outlook.com (2603:10b6:303:241::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 16 Mar
 2026 03:44:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 03:44:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 12:44:39 +0900
Message-Id: <DH3WB8IAXW6L.28B8V0DXXXU5G@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "aliceryhl@google.com" <aliceryhl@google.com>
Subject: Re: [PATCH v8 3/7] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
 <20260310220000.1897166-4-ttabi@nvidia.com>
 <DH1AG9IDZIDO.2610KTTZ29MVS@nvidia.com>
 <ac909647923d01f1e00e40bb0af83a546fdb1f10.camel@nvidia.com>
 <DH33IXMUWQ3T.1QMJSFCCA8NTV@nvidia.com>
 <26a6d9f2f22603a71f36f73c98590aa1a0077a95.camel@nvidia.com>
In-Reply-To: <26a6d9f2f22603a71f36f73c98590aa1a0077a95.camel@nvidia.com>
X-ClientProxiedBy: TY4P301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 267cb90e-acc7-4949-a358-08de830e5c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ukXpSYEthSzglbRYBGIJea/jV9j7kv2INy2Y6ZTFHFchAUxpbP06i7pfJ0vxTybfGGCQK+c5vvdssMsIYGCWCLBSFCy2o4F8Vm3OwJMxAbtn67xCwyMooqS8PoNXL+yG/JdSjZaq4dPZp24p+lRyMbSEimEcIFA6k4fetIhPgWcnVAph52HMlrlfOQ1LFWF47dz7eoJH650LNHLb7VGsQ2yiMgQgW1WH8Vnyp6P+y48ArKafiCdkd2gzeSsO4AVt9nEVJjLmvQXdEywobn8HxkQ0bQoq2Wu1BCc7oqOQZT15ikcd4SbzA9DfI1LkgQKLTH3i3W49mhVAuol041/rn8ufXw3Ogoq00026iz8F8Y9YOFvSedHxaGUnrSDQs0xEjevFsx/B+DvAOdpTgydzLwLr3vahm5QiTP8pbPczfZPhaz3FE4r69G98Uod5kP5kqDf5NhTQ/DhStwnbx+9h0X4wh0uAp+Uc+J+05ED8c9uf5oJK+MIwveeBnJBmchGj6lsZxFOxjh5cLUNxQUL8IkarDqJM66C33eiXg5Cix3NJC01NZq/YSWaf5EII8N74wL/JKOBswFwVeloLCRYbK74/SlAXWlwAIDLMXFaC6Jrje1otRbZG55lPaspyUZA8BmfS36rul8XPzQKjKCQwh4v89bROEqynUYotS9BSscGAIHl98IoNFy+6Y7/50JhK6KQrQZOhyu5IsPUShJpoKbVtNrTIqhmrRA27Lartzvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm1ISUxlTmtRcjB3WE9neXN2ay9oQjNyVG5uanIzQ3k1ZlYwRFFzaEdKeHVW?=
 =?utf-8?B?VFNnaFdLNFpiYndrSGNhK2VNOThaTkVtVXYwclZtTVY4N05BQVJaSWpVVUJ1?=
 =?utf-8?B?bTlxakpTcy8rTXF3a2N0ZFRTdE11a280VXhzSENHbkZ5TXRxR3g5cnhyU3lF?=
 =?utf-8?B?Q25ZSytPaGphdXV1b3lLVkhrM0VkVC9PMHZCTXBEZlQzcFg3dTR5QmlhVjZm?=
 =?utf-8?B?ZmhvczcyOTB1Vld6T2laQklBc2IydkJwZFdsdWg0azE4V0hvc3pnemJxZERY?=
 =?utf-8?B?dDVhcDhiYXIxdVo2d0s0WW5nNDE1K1RMWVovT1gvbjBVTk1vLzYzN2pQUE9B?=
 =?utf-8?B?SXdBSnRZd1RPdXhwNnhFTjNBellBeFp3L3pwWHYxb2FmTWx4UDJEWkxQRTl1?=
 =?utf-8?B?NWdTNERhSkI3SWtrVE11Z1EzVE8vSnluVmxXbjNrNlVXTHkxVDhVK0lJUVhX?=
 =?utf-8?B?Z3QwZE5oWWdEWGFyejVEWlpVRVQ5bVRZREVXdTVjZXBaSmtnWnBORTdkR3Yx?=
 =?utf-8?B?Y1VacGZsWURNL1ZpdGI4VDUreUJtWkdDUTZYdHZpeWxiYzduZWJWWTRma0cy?=
 =?utf-8?B?U0JkYzN4OW9wd1YwbS9HZld1UVhaNUk5SWFoOWZKcUprb2FTSGtYdE1DZDk4?=
 =?utf-8?B?cFZYc1ZXZS9oRkVheE4rVWJRMEZWbG1Iblc4cWdWRmZQMVJBY0tZTkx2bldE?=
 =?utf-8?B?ZXRTdFRMcWFSMWhzdGhYR1lRTVV2dGhIUGl0R2d6VHRPdlE3TXA5Z29SN3Jx?=
 =?utf-8?B?M2U1cEJnUzB1MFBjQzFGSTJHNUJMbitVZENxMi95NDVJdXJWY0NucHp4VFZ0?=
 =?utf-8?B?OVZudkQzY0FmcU01SGpLTndNVTZIRG5zZjIzdTM2WTZWU2lOS0FLMytNM1ll?=
 =?utf-8?B?U0VmQ3llL1FsUHlIQSsySU5pRlpGSEFacmJwM1BaQ1dQblhTRzJIOXFqZ29o?=
 =?utf-8?B?eWZGZmplcXlScTNnL2VUWnduN2xDUzhRdHJKWG90OHFmZ3BQOC9GNTRlK3cy?=
 =?utf-8?B?a1hrck9WRXNkSHlhRER1RDREV3pITCsvOW92Ny82b0ZybEFuSkxLQStUMzF0?=
 =?utf-8?B?UldyZUswUFU4Tmdmekx3R1B5QnIwZnRVYUpXQ1BzUkVIUVFIWkNPMmJna3VG?=
 =?utf-8?B?aHRFM3l2bGlKMVZCb3hIa3A1SitsVUxiMHRMY2kxNmRVeXBnQzIwUU5ZUStr?=
 =?utf-8?B?L2ZOekZiOUtRWjU1azlqamV0ZnRFR21HWGhQVjc4U0pYWFY3Y3RZZE1XdnVV?=
 =?utf-8?B?RzZyTkNqQ2JTK1BXNHkydHY0dy9PdnVuZnJyM2hrMVpUK2paQ29WaDFOMkpn?=
 =?utf-8?B?cW56QnAzQlRoZ2lZN1hkc0Y3c0kzQVVlK2FEOE9XNGlKc3o1UU9iRUVFNDRr?=
 =?utf-8?B?dmlVY0FGdHhjUzRUck5ZbkE2b0syVEwwM0RhYlhTQ1JpVllDQk9YZ09zTmxv?=
 =?utf-8?B?RWs0eklpWHdPalhnK2VSRGZ4RHAzOUpHKzcvc3NNTlRnZDBvNU0rbzZiZjRI?=
 =?utf-8?B?WGFEYkQ5ajMxeHBucUZCSjQvdWFTUEFYa2VBa20zY2w1c3pHYjNLbzZ5b291?=
 =?utf-8?B?Q21aVzBKQzIzS2ZFa091ay9JRU05KzFRNVMycmEwYWVtREFOSGZKOHA2NUV6?=
 =?utf-8?B?U01mWGJKN00xVkZjU005eDA5SWc3ZGFlT25DY1FMYWx0YXZXVHNMSDlZNHVw?=
 =?utf-8?B?T0laZS9weUl4R2pqQndNRldTUTU1c3d5d0lldCtjazhqQ3h6NGlYcm40UTkw?=
 =?utf-8?B?QUk4cGllSXptOGh3RU1pV0dBUzQvOHI4Qm0yN3hYSElrdkdMaERDK1RyM2t2?=
 =?utf-8?B?V3Jja3poOVFJaHNETXZwWjNSNUViQUtDdFJXdDQybE16bEFHVG1wYkFENG8y?=
 =?utf-8?B?eXpIU01sUEtGczk4bnFvYzY4R1IrbFFaSThKT1BUWFN6bVRjMTFEK2EzWTdY?=
 =?utf-8?B?UENwdWk0TGsvYXZJb1YzMllwSHhNUEJzNG1MOUhzMi9wOXJwU2t1YnlCY1pG?=
 =?utf-8?B?Rjl3aG8yMHY1UTloOStuK0V0U3JYeG5WemJJbzRhUDZjUjVPVFVNN1FQTTBa?=
 =?utf-8?B?cElyaHhleFo2NzNqWVVsQ3k1cXBrbEQ4aGRTZ2VnRmlhYTFLaHcyWEpaKzVC?=
 =?utf-8?B?R0Y1S1lyZEU0N2JVZ0p4TUdJSmpoVkYzZVdSdDdhYmU3cjRXcWhsT3UwVGhT?=
 =?utf-8?B?ZTNmajlSSkRHTGlnNWtIYkUxbUN3ZUw1Zi9FYzhLWWFEeUpvODQyUEZPaE1s?=
 =?utf-8?B?ZWUvUDVzZkQwdWswa0pJZ2tkRGFLVElBRFdjNEN5NnRWNUVvZit4c2pRYnU1?=
 =?utf-8?B?alV3c3E0ZWNIYnFoZzBGN0FhbCtyaGZOV3RCNW1OWVZzdzFhZ3V5bzFkOGlE?=
 =?utf-8?Q?lLUq/x8GouCGyeuHi2LHopdxnuGXkLe6FYHe5fBz1rZOc?=
X-MS-Exchange-AntiSpam-MessageData-1: J8vUEYsCi2Ci7A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267cb90e-acc7-4949-a358-08de830e5c63
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 03:44:43.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3pNxZDqylyTrDOs17nemEZ9DPqVeLhXX3wWyN2VqednntHHB8/GVnrDShH5Q8nXMYyhEPDzG6ZZCtPqhfOnIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8836

On Mon Mar 16, 2026 at 3:57 AM JST, Timur Tabi wrote:
> On Sun, 2026-03-15 at 14:11 +0900, Alexandre Courbot wrote:
>> > Well, yes, but there's actually a bigger problem, now that you point t=
his out.=C2=A0 If usize is
>> > 32
>> > bits, the try_into() could fail if *offset is too large.=C2=A0 In that=
 case, it should return
>> > Ok(0)
>> > instead of EINVAL.
>> >=20
>> > So actually, we need to keep the is_negative() check, but should modif=
y the try_into() to
>> > return
>> > Ok(0) instead of EINVAL.
>> >=20
>> > let Ok(offset_val) =3D usize::try_from(*offset) else {
>> > =C2=A0=C2=A0=C2=A0=C2=A0 return Ok(0);=C2=A0 // offset too large for u=
size =3D past EOF
>> > };
>> >=20
>> > Are we going to assume CONFIG_64BIT forever, and just ignore any possi=
ble errors if usize is
>> > 32
>> > bits?
>>=20
>> This is not Nova, so we cannot assume CONFIG_64BIT. I guess we have to
>> do as you described above.
>
> Yes, you're right.  I forgot that this was common code. =20
>
> Still, I wonder.  It seems incongruous to me that, on a 32-bit platform, =
offsets (file::Offset)
> are 64-bit but sizes (usize) are only 32-bit.=20

`file::Offset` maps to the C's `loff_t` which is a version of `off_t`
that is guaranteed to be 64-bit. The kernel core APIs (like
`file_operations` seem to all use `loff_t`, so it makes sense for Rust
to follow suit.

I suppose the kernel uses `loff_t` everywhere where files are involved
because without that it wouldn't be able to manage files larger than
2GB. With that in mind, the extra check when converting to a 32-bit
pointer makes more sense.
