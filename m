Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022105.outbound.protection.outlook.com [52.101.96.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AED239085;
	Wed,  4 Mar 2026 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772653739; cv=fail; b=IGpO+6dlQcrKdc/3Spy+SRTMP24GmnpQElZbse7H8ecWajjm0eXnsTgEUa3gqZcqODkm3pIeLGQQhO13IOGL3yr77HiBbhH3dALqV+Koa4uAS7duu0vDW+cpX98kHKb9pDNY4XVWeWBBkNTveiTr+vRHnsDzRu6dIawWOIufbfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772653739; c=relaxed/simple;
	bh=RBJxukasbC49VUIjQdH4e4K+CJNFlkKGvvbt6SrU9D4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Yq8sni42wDeP1t0j1YD2JC5H2l9QP9MeN3bFrR4CvWXbuPGCZLDIic/IDjZG5f2LEAdQPoXpMYlwhI9ZR6ZYU/YF/fut5u93wmEIf4IfiuuWt3XuQz1MhC82ZvLon9hDFmqLn5+VG/rUbxSSn6v7bck/DyMDFi2b8ImqMZCp7Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=erqQmjVz; arc=fail smtp.client-ip=52.101.96.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="erqQmjVz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZad1xAiSaoOtrfJVLS6JPC4+tQlk23LIMK2DrIXSGOX0+xAsnf0BOy0epyQHRNEDRbgLQ5GV696VcWvPA6IWVWiAbCrCJEEsNqHt4uoTSIkTJS5jS7PszRZt5WVijfSFG+/TRR1EVXhX45Maz/DnoJfvUwr6SgR1q4Ij5JdqGvz0lmgXk9L3FeWGB8br6qBUFqxMAgeTxh8eEuT/5ucr27HddXg8Ctf24Zgy8PkhnjmBZEIRiWIZrnw+9uHXbLA7E2ybpUn2vmsypwn4T/vQjDwNekek8x+U9ZbL5uxM+oSvLQnq19CjfS5AIr93NEEu3kVvIdkEWJ4GJpNZEjkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYVIyxqKo8aACmLP7aYMC5FBiq07bjvcDVqtueFnn/k=;
 b=aMHyvcXetGxxB9IMd/UYdNmhlHqBpoR3/KiYfZblv1G1qT4luI9LliP2JQNS85n7CSQUoNkiiUBXNM8o4UqOZyLb699e96F0rbhQkq7TeTM4hO8IWw9XSdjcctSqxV/OQMG4/u/R/+jlIn/fArfEdmYWW51emdcVuQQ5GiMAAdjHoAOWHSLKpZfsalm/k4hIy1vhQQ2AEMJVUte7ktjNBWc/L2HOpmFoU9AFiahYVr2XtlT9YKs/p29HBCIe7TqeMaIZXXMakIJS4G51P83IOYxa232A5ijwzqbVZ+qgVhRHdCC58aJMBYZj0+4jeHgGnDQOSMBKPwMmwdOqYFoAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYVIyxqKo8aACmLP7aYMC5FBiq07bjvcDVqtueFnn/k=;
 b=erqQmjVz9DiLz/pvzuP3YvFl4YxN7CQpmCoi+LEH6gSOhJ9DJhc1EfVSIOH7Z6kuq7udDrbUCELbJpWYZkV5Vim2pStBW/datWS6F81CyolX+tCqTLSQ5orVGrdMAIdMXyWVhYMKoqjHBqwNEDLDw0uEF5iwH/c5gPPeCcqpT3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB2364.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 19:48:54 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:48:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 19:48:53 +0000
Message-Id: <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
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
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
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
In-Reply-To: <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
X-ClientProxiedBy: LO2P265CA0485.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB2364:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f7d660-29e4-42b9-517a-08de7a271133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	n9yZfxQNghtvjKDKTBy5AAKz1u4CJrnkN3cr2d9+0p5YuBD14N8DnvvHA/ZlEeKtCxhZxxNpPqDPnxNmSGCpyQLS/kYLDhub/nNAskAbWg20qS5dHZ5jqIXKy0Wak8JaOyHTaPONrJo+0Q5lf89xhb5EZe7cNj5EqVullSQoYQSQ7nw+HaR8coS80Ws9JMhbac+oKRffvMEwivyJB+XwPdpu55JwVf+2rJ8YF+4WEJ/zZChmdFP4Q4wozJUlP4O8y/PMEsE+YjSci3D6b1Er+C6ZYhe6TMYuqVgH4htcSMfabW8V8r2oo/oyyhVrYABiumtiHeznFm6vVO56lpRRtJI7/mCqMIqWmm9T3v/GkwfUqYtUKwt6ZVUgieZGslCJQ99cSDP/yKsKLasUBxanGM4iSBNTg2jPo7qZ9KT3nMg+rzYjUehytFZmHDOFuauCQu7MsW9EMONwyEz2ZvHmpU5cL+yxjFdwedRcQlGtj+dB1c6k6Co5zFQlFVry8bIBboTG9k21YrHlDIWhxDmoyixoYdqonRoyOQHuaCgS6+5yDcAn25AI70Wp3SEfeRtTzvkZxGGmv8wclMN3aZLcwNnvYvvictuCf7bwb9XoW4thItTazYMM96fynMgDE5Qr4WtYIhF/Lic5AqrCQD8jGkZpvcIDJli0KSUi6dJgvlbbeJ5OWeGDuV7/CMANb0k4+E/oEC6U8HCM5NdNyef+FlNvlPd9JEXz4RZVL5qDufc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UytuOWZmanpmeU9OdjBQWkgyNlQzVGVYcGJUVllFaDE5WkxMeC9COHA4ODNX?=
 =?utf-8?B?emNWaThneWl6Q21nWW1IVGZZRGgvTnVCOWtKQVRITUlic1pYWmcxWFpPUFln?=
 =?utf-8?B?dWk0WWVxZWpQcEplMEw4U1dUSnNaU1g3L0FWWVJ2Q1ZYalpLOVVTVFA3OFA4?=
 =?utf-8?B?YWFZMGoyd3FMdzdyaTdoS3R5TzdiQ2FaQzNHcWg1bG8wQ3N2TW9mVk10bTRt?=
 =?utf-8?B?VXlIajhIVThFU3lkMjk3aGp5TTE0ZENHcTBMZ1RiUmVGTVcvUkR3V2publg3?=
 =?utf-8?B?WXVZSGE3UTd2N3R6NXpCUjg1NjFvWGNGSE5QQlZzVlUzeDlidGFkOS9hTjh5?=
 =?utf-8?B?R3Z0SDRaUG5zVVUvY1JKRGE1ZUYvY0NHWkFwMHB3aWhFenJ2SFpOeWpoYXRi?=
 =?utf-8?B?eDUvUzhkQnpjQlZqSHYwVkRFNmhoZ29pT3hGVkQrVFBjUjRoNTZNZVd3R1ZF?=
 =?utf-8?B?UU15NURCZENJNWhrS0lDNGRqekZ4OUw2TVpvVy9jem9pZEpHVlRhUjIxQzJB?=
 =?utf-8?B?c29LTWU0YmYvcFhKSHQ0bTVvWkZKSFdnamxrMWswa1BDbktZc3JOU1lCRm54?=
 =?utf-8?B?SGIxYzY2V2ZnVlYwTHVzc0ZvZ0QrWkEwSmlmZXFnak1RNzRWMlN0NXFRQmJY?=
 =?utf-8?B?Y1Jnb213UXVJb0daWmRBQktqcHM4YldMQndMRm50bVExbm9KRzJwa1hUR0lk?=
 =?utf-8?B?a1RycTZ2ZTBrcWNFOU1TRnlYb3JzR2QxcWxscE1abmtaUXBYTStOanlqNjR4?=
 =?utf-8?B?R3ZxTGN2RkFQRmpYVm04VmFTUlZ0eGszMVJLMi9qNmgvOTdpeFh6NEZuRUlD?=
 =?utf-8?B?SS9hUWVPUW1UbWtMaHNVYTVuYk1jcVNTNTJxV2hoR0dtaGY0bmRubS9hN0c1?=
 =?utf-8?B?ZVRxR0NMRVFGL09OcFRMeEYycE9NbjhFSHk0NTFSV2czaUJndDhRTlo3TVNI?=
 =?utf-8?B?U2M0VncrYmIxd1B3b2E5RDM2a0lmdm1jK2tUU3lqWjZHcndZbGVEWEtiYm5Z?=
 =?utf-8?B?bGRGUmoyTGJWUWtDZnlCRXVDNGFWc3Z4SUJHc21KeEVxRXF4dWRMQkFOeWxm?=
 =?utf-8?B?NGtHN2hXRUcyZkVwL1N3UXUvYitoUkxLMGVLWlU1OGlHNUNlQ3Ava0sxelJK?=
 =?utf-8?B?L2MwRm1DdkRMN1RNMmZwbi9rZkpQdlBXQUEyT0xab3dEOTdkRHNzM3d0MjYy?=
 =?utf-8?B?eVd5YlkwNWVWc1pXam05a0lpRWRTSFFheGQ1b2ozOWx5MWZXZjlSdWxtdEZF?=
 =?utf-8?B?bzlhSll6RWZHRUxrRUg3Y1pKS2tOVVJjL0IyVyt2SHpFUVAvU2U5VTFpbW9z?=
 =?utf-8?B?SlRzd0RCVnhuU1lER25NZkZicnUySXAxNmNXZ1Vtb3FoaFRZMmFsMnp5Tk9Y?=
 =?utf-8?B?V0ZmdytaNDJXZ1BOWEhhd2pmQUtXTFZHYTA3Wk0yYTBLRk9Rdm1pMStzV0lL?=
 =?utf-8?B?SFo0ZjhObmdKU3o1cHFQQUhTTEgwbHBDUVJBNHpEZnlnN0lmRWpZek01NTl1?=
 =?utf-8?B?aFYwSThiWWNpZHNaNVF2TEN4Q3R0d1RBZjdzZkZnMEdhMXpMd0ZuTThmOVY3?=
 =?utf-8?B?MFhmWlQ3VDVIY3lDYnhWUkJwdGxDVHhqOVJWb3dHWFEwMURVMDJPcEQxbDRW?=
 =?utf-8?B?TTJySGx0YStnZWlqRFRGc3p1aEFZaFZ5U05rT2Nwdk96Y2RyUzlMeE8xNFUr?=
 =?utf-8?B?bTZVSlZINU5UVEFLREJsNTJnTkZZK08xeE01VTdaWGFLZmVUWVFjVCtnOHNJ?=
 =?utf-8?B?NWgwTFY3bTdzVWVwUHhGL0dhR3BOZGR2L1F4d3ZRenNLRUxNcEtqZVVRbDYv?=
 =?utf-8?B?WlFQL0E1eElhMUxFNnQ5RkdwK1BBeGdnTUVkd2lHbEZRaEJuMWlNV0oxVVpM?=
 =?utf-8?B?U1R3L1FTS3dDRi8rTnhQV2hOVjA2SU5iUVp4MTNSNDU1eUNpaVNGenhINWY3?=
 =?utf-8?B?cVQ5K3pZUXFUZDlwWkc4RmkydlMyeUYvL0NXaVBQN2h0ZGsxQ0Z2REJlcnJn?=
 =?utf-8?B?ejBJMnppbHhlbHVieHc2ZG1zNXI2RjJxcVNXMlc5bWszR3BUc0hrcmpuMXlT?=
 =?utf-8?B?RFUxTzMzcXFvc0pTVXhRbXNaaXozU1I4K1lXY3lZTHE2WExXTTV1MlMwZysx?=
 =?utf-8?B?czNORkhYdTdpRU5SSkN2d2NtaVAzNXdQSVFxLzhhdUF1V1NIbDFFcmlJemE1?=
 =?utf-8?B?TldYNzJmS2g4SDhJRW0rRXV6aE00bDYxM285Y1UzWDdqeno2MGtpM0pxeWR6?=
 =?utf-8?B?VTAzVEpRVVY1UTB4MUkrdnZoc3dIbmhzQ0NURDBnTm90VDJabVVGWWJIUGxl?=
 =?utf-8?B?SUhSVlBXR1FUT29rRmNnNjE1WFlPS0hDNlNhVzhVcmcvYlg0RXVkZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f7d660-29e4-42b9-517a-08de7a271133
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:48:54.5255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXF0XJBpge4eJ6KkQIizoGXKp0TzywwRes+DXVz4nZzpSWfWV/+pw3BERLnW4Mq7I5iKlAYsZS1D0Sh1MSKAkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2364

On Wed Mar 4, 2026 at 7:38 PM GMT, Danilo Krummrich wrote:
> On Wed Mar 4, 2026 at 7:58 PM CET, Gary Guo wrote:
>> On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
>>> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>>>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>>>> So, to get a better idea of these two options I have converted this
>>>>> patchset to use the 2-arguments `write_with` method. Here is the
>>>>> difference between the two - it is particularly interesting to see ho=
w
>>>>> nova-core changes:
>>>>>
>>>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:r=
egister_2args
>>>>
>>>> This looks good to me, but the fact that this turns out nicely has not=
hing to do
>>>> with write() now taking two arguments. I.e. there is no reason why we =
couldn't
>>>> have the exact same write_with() method together with the single argum=
ent
>>>> write() method.
>>>>
>>>> The contention point for me with a two arguments write() method still =
remains
>>>> that the arguments are redundant.
>>>>
>>>> I.e. you first have the location in form of an object instance of a ZS=
T (which
>>>> in the end is just a "trick" to pass in the type itself) and then we h=
ave the
>>>> object that actually represents the entire register, describing both t=
he
>>>> location *and* the value.
>>>>
>>>> So, let's say a driver creates a register object with a custom constru=
ctor
>>>>
>>>> 	let reset =3D regs::MyReg::reset();
>>>>
>>>> then the two argument approach would be
>>>>
>>>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>>>
>>>> whereas the single argument approach would just be
>>>>
>>>> 	(2) bar.write(regs::MyReg::reset());
>>>
>>> That's only for bit field registers that has unique types. I still beli=
eve types
>>> of registers should not be tightly coupled with name of registeres.
>>>
>>> Allowing a value of register to be directly used for `write` is also co=
nfusing
>>> if a value is not created immediately before written to.
>>>
>>>>
>>>> So, if I would have to write (1), I'd probably be tempted to implement=
 a reset()
>>>> function that takes the bar as argument to hide this, i.e.
>>>>
>>>> 	regs::MyReg::reset(bar);
>>>>
>>>> I also can't agree with the argument that the notation of write(loc, v=
al) - or
>>>> write(val, loc) as the C side does it - is common and we should stick =
to it.
>>>>
>>>> This notation is only common because it is necessary when operating on
>>>> primitives or when the two representing types are discrete.
>>>>
>>>> But this isn't the case here, a register object is already distinct in=
 terms of
>>>> its location and value.
>>>
>>> I see no reason why register values for different locations have to be =
distinct
>>> in terms of value types.
>
> That's not what the register!() macro currently does, a register type alw=
ays has
> a unique location, or is an array register, etc. In any case a register t=
ype is
> assoiciated with a location.
>
> If the proposal is to disconnect location and register type entirely, tha=
t would
> be a change to the current design.

It's not what the macro do today, but I don't want to ask Alex to change it
further before landing the series. I do think it's a worthy follow-up to ad=
d the
ability to decouple the location and type. It's not incompatible with curre=
nt
design anyway.=20

>
> If we'd have this clear separation, I would obviously not object to this =
change,
> but currently it's just unnecessary redundancy.
>
>>> Even Nova today has quite a few registers that are just bitfields of a =
single
>>> field that spans all bits. I think many simple driver would probably wa=
nt to
>>> just operate on primitives for these.
>>
>> I shall add that I think the fact that the registers that are *not* fiel=
ds still
>> gain their dedicated type in Nova driver is due to the limitation of the=
 initial
>> `register!` API design that *requires* unique types due to the `value.op=
(io)`
>> design as opposed to `io.op(value)`.
>>
>> I think even these ones should eventually be replaced by just primitives
>> eventually. I see no benefit of
>>
>>     bar.write(REG.init(|x| x.with_value(value)))
>>
>> as opposed to just
>>
>>     bar.write(REG, value)
>
> Well, you don't have to make that we have to use init() with a closure fo=
r such
> cases. We can also do something like:
>
> 	bar.write(Reg::from(value))

This won't work for the array case, right? For array you'd have

    bar.write(ARRAY.try_at(idx).ok_or(EINVAL)?.set(Reg::from(value)))

and now the register name is repeating twice rather than just

    bar.write(ARRAY.try_at(idx).ok_or(EINVAL)?, value)

Best,
Gary
