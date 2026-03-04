Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022101.outbound.protection.outlook.com [52.101.101.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788F83D1CCA;
	Wed,  4 Mar 2026 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650725; cv=fail; b=Eq8rLl28WD0VHMSJ2dQPyoaUmgrI9wMpi6h8UuUbCEn+Rc5bgyL07IErYP05/W05yzD0Zu/cteZO07QkDZWf3a4AtFWeKnSnl1yK6t86crW3ctP6j8hhqK1b8upeQopRXcHYQUfyRGZAAxX+1rDRDlmP0wud9wwfJFiB4OVVHR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650725; c=relaxed/simple;
	bh=U0jfqSGI1UBL35/pg7DXbvzIAjj5g9Kt4Jk1oWruQYs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kHt4+8+6vG+ykkXFVb6c1JPuRcpyGGsT96eBFpmcJt932YZG8jfEIcQWGst+kOTl7koZrSOcJwc/hssMJO+ogJaA/BU3ub1MVhGQav9pUz2l+hKmwFmaB70DeitP4nBTL7cp1l2Nt0FXNI7jX/f3jtio0TlZK6+SmAhGEpcQgkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gy1epN7T; arc=fail smtp.client-ip=52.101.101.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gy1epN7T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UolQiwHOr2M8T/iTVAi+eb6EDlY8hA2GWgroNyut7gvqG5O9cGxSmUcxrD8ZGpznWTTEbz/2O23OK1c0vz8TM99qT0egv7T2NzL964JAjVzE37R+EhoW6HM/kNzRDcTPHSxvneOasODOCO9O8wV9ZRI0ijZj3N/8T69ci4VJLDCjqPFE9EalSf/4meH5ZAxbi8V+2EQ9mWWCPY7EgAJUGJOlmapuEzPmTrEs3xuBjcb9elLJw/e5R5WyKlRxCHVKmIJA6x4sx+mo4NsbN5NvyQYWbj8bqWtFDtdtFrAALDPS91I6e5k/H3/VzOutsXylPKrSfWF0MuWeMRFbPh/2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecFrp9znb0UeEe/aNjU9AUuTVCrsyHyIwbMUWwvPgcs=;
 b=YWWg0p0KvOH8FnbgoHLF3ou5DJmOMR9r7OgyIQCStJDd9DfF5Mn85/0F7vcsV8DkXnkXrOmMZqx9C02g0LwbZImq2E40JAXE8W7PJJwd4NVS6TLnPyjYcB9LFybD7if/Zc4GayCGrcFuQYctGfV2yYXh49KzvidqxioEofLtvvfWnVT2BsBsnnKgQBqorV+ceoyOKcAZeXMw0YOn9AS0DFVUVrfp3+Qlmi/bPu7JXj/NrLP8I1QvmGcAqFF4tWeDNIl8XYQxI96DAaCprjlXoc56NNXX51/LD6CDWIWgLCB2Ih8ekfcGwghwaouY/ssTtCatfPSpU+qzEhTRd6afew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecFrp9znb0UeEe/aNjU9AUuTVCrsyHyIwbMUWwvPgcs=;
 b=gy1epN7TJDfAOH6rPiL6uMg95yZ2yJoInROIrj6qjm6Gt4y8bytwq5YX/LSoz/twV5RRL+8ihoymKmWNRt4zGIoIzT2WhefK3BgHT1juCUt5xIWLxG9ZcSW5zv3Hhm8w8kkYPW5jExP1jtgZEVlgppeIqvJYrTMkg7hDcdd3el0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB3289.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:187::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 18:58:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:58:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:58:39 +0000
Message-Id: <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 "Steven Price" <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
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
In-Reply-To: <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
X-ClientProxiedBy: LO4P265CA0165.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB3289:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f585f9-7c66-4ba6-6092-08de7a200cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	sZTSkAtrsnRZVuXOs92PbxlNb15hy8Z9mdBPZqz70n2qLHPgQcX34hcxAHZh1SIprNkZaPdRUBYLIpNUHEppiUotFE0hIJABLT10bkusi5RIDC1j0Pb/poEzkNSF13Z0wFndWHDuUQpl1fq0EzjF+msUD08fg14OgYDM9wm4bgARlRsD0/aOt4idHIvhYWx4pz2c8ZctIzPhoXYU7PDPhHEfY1k0wlqCSiJv+pWbEZPG+pLpCk++aVyt5zs9uQAdWqIHhOoOpfNjodgZ91JXo4PIdaiRKH0jUeN1SbRQb3uAO8OXdgMK6p9eS+owtXJQrnaW6QT7J6xMW8NElmoeaJNqqSLfezDtuFtIRh/aLe/4ryQraSodEGoOFn9ZeV38RSC2fQ9k5Ex6kqLpHKNg57All+3Tq0BJHd3aYm1Gkcv+/fBVNUV/FYiEJEJJQ1e/GFD5Wk+rdzQASuE9LuES7Dd8TiX3Uzwb2oWqDH/YU47KhrMgS+lvIHPLDX7W1AUSpuTcHiCzXkaTCjUFD4UxP/QvnqA299P8+BTR6hSkO/MjDeU54hSOoxeb5NlBRLO45Y/GRI+KsxSleaKF2xsYvSg8nPvWVr/qM5WVZN6QCC8lMarp2ec4bJSO7ucnAoMVVMN1XX2mfib3nIcHjqLLZJ6+dMbfuoEW0cD5DMrwrAGY9Qy8kT64rlEbPm7wEq1egiOJ9UcHGQs1M4FoKDcrOj/OrbF+LtJSlM4Cj19dohk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2pEeTl3VENkZTh3VDdPcVUveVdZWExZNUVnM1paREhNNWdDVFg4Zzkvblps?=
 =?utf-8?B?TTVDbERYLzMwSklxeFFPQ21UQUpnZUZxUWZ1anVGWlVVTHlSeWZseVJKMDNY?=
 =?utf-8?B?ZVNxWExyUzdUS2NmakttVjRqMDhMbm5hUnhqV1JZQTR2OUpadzU1enkxMHVp?=
 =?utf-8?B?Q3ArUUYyZmxiTGtqUXoxN0JKNFpXS0NISDBZdSthVkd5UFhCcFErTXZZSGc5?=
 =?utf-8?B?Y1ZHS0NVL3hUNHYxOUNkRlZQSStXUm9VekZna24rUVVLbDZmU04zdHdzWll6?=
 =?utf-8?B?KzBkQ3EzVjJic1JjS2x3R2Z5UldtRmQyK3VWMWdZQUZTcVlZZE9Va2RqdEdF?=
 =?utf-8?B?VTQ4R1A3aGVSWkFsaXR6djhWWE5TU0tSajdWQ1lBdVp6Sjk5ZmNub2tXQncv?=
 =?utf-8?B?aWxIbENaQUUwaldDUzF4R2FKQkdmNW9FTjVHUU1aNUdwbVRVWWFYV21hczdy?=
 =?utf-8?B?QzJ0SFJ4WnpPTjY4Zk5PSVVUTTJ1SUtDdUhDNEc0cjZKdU5jYTNWWng5MnpC?=
 =?utf-8?B?QWtMeUt4eUsrR2g2Z2hxa0RzdU00SDlldkhld3FmdmdLby9JR1I5TUl3aTdQ?=
 =?utf-8?B?eG9reisrVWlyTncrTnFaTEZzQyswaGdUVlJ2Z3BzalRVVTlzWUhtcjZoTFFr?=
 =?utf-8?B?OEtGZHFNWHZGckNsQk9JZThFM2VEaFB2ZzI0WEVwNSszMFZyemJDdzVlNmxn?=
 =?utf-8?B?K0RybkpLKzhVL09zckEyZjlLbWp0SlgvU3lkM3Zpcm5ldy9BRWRseGdwZzZS?=
 =?utf-8?B?K0Y4eS8xckp1OWRBeGl3NWxSSkxxNGF4bThBV0VYQVg3K2grcjFweU93VkZk?=
 =?utf-8?B?aG40bEhibjdHUmVqUzZjL2hIbkVZMUp3OWRWbFBzUUQ0dVB0a0pVbEFEaFAr?=
 =?utf-8?B?U3lKL2Z0Z1ZwL1V4Tk83ajNzQ291emNoalRsV1RHN1puVFZDZExoZitQSWdH?=
 =?utf-8?B?eXhZeGY1c0gxWlRVNFEwRHJrdk85T0xabzM2czlucnMyQy81N2VsWUFSN0Yy?=
 =?utf-8?B?NlNmODUzVTlEUHJFOFdFbFRxU3dzNWErbFJOdk9KMFRVTmZ4VUppdURuckNw?=
 =?utf-8?B?aXFwUjBLbUlHTVBKS2F6UzduSFlpdHI0U2JEcDBKRlRhV29JZHhCVldBSmRC?=
 =?utf-8?B?aFgxS2NobEh6THI1WXQzQkV4NkJ5Tzdpcmp1QTcxQTRGUHZsNlg2d0prQXpY?=
 =?utf-8?B?QjM3Q1c0WnFQVnJaMW5JbWtQRkh3b3pnd3c1c0owMElXT3RmQTBEc0VDOHhO?=
 =?utf-8?B?TTN4MENXWXEwZThWbjFLMHRHRjVwcXdPQ2lwaGlMdnYrR2kxWDg5VDA5d0lH?=
 =?utf-8?B?cTFkYUVkcmdCMkJ4NkRESktLVTlkUkZseFRYeExiTlBqN3o4SytjdWhteVlB?=
 =?utf-8?B?YXRNMG9TS3dXQURGRXJ4NWZETUJ6NG1UVWYxNmtwdDI5U3lOUndSOWF5Z2RW?=
 =?utf-8?B?VWFKdTNoSmM4TmlUMVB5MTYrMjQ4WnRMU3pRQlJ0aFZWMHFNQjdnU3ZWaVR6?=
 =?utf-8?B?WWQrek5mdnBOd09nN0pzYVhWbk0yVmZaZ0l1enMvMmZLdDlPTXpOTFJScHdW?=
 =?utf-8?B?T0xoaTI3RXRKV2ZzMzZBZHhoRk96eWI0ajUvdlVsczhVeUlkMWYvWWw2L3BY?=
 =?utf-8?B?M0IvWWdSejBSTWpESk9kck1aOUx3QWxnMXFwOElpVUIzWnluT1VrR0NsT2RY?=
 =?utf-8?B?RWFnMzN6UDYrbzRReGREYU1BaTQrblBHQ0twejdlUG4vaWZac01zcjdpVFJi?=
 =?utf-8?B?a1lEdnUyQUxDMUZvQitIRXBMajVSOGRManpBSFNRTk9tSFB0YkI0eExlQU80?=
 =?utf-8?B?czZ3OVI3WnlXUllnbjRHM25vTnlHV1FiZG5QdmJNRVFpVXNuOWJBQ1IraGJG?=
 =?utf-8?B?eTFmemZtTzliRzl4aXpCVWtUNStnWDc3NDJ1L0JmZzg0dGN1KzlCUURvS0Jr?=
 =?utf-8?B?MjdmdGVsYzlpbXliMUI0c3c1VERyVUpabWRGSnFRUlB4U2I3cklIb3YvK2Ix?=
 =?utf-8?B?Tnh3L3o0WWlHVTZXR0lqWDBMYWo0aTlnQVNaMWkvWWRQWjNOMHRtenVyNEVL?=
 =?utf-8?B?anh1QVdlRU96Z0hhMmhEYVJpY0tPS2x0VXFRQXFLNGVHd09YcFdqdnNjL1lx?=
 =?utf-8?B?SlZuREs2UW41ZFA3T3dpM2paeFF3VWFRbS9hWUt0VCtrbWsrVCtzVDNvdU5h?=
 =?utf-8?B?WEh0RFgxbURiNUlVdDYrdFBncXQ5aC8zY1IxanA3QWY0TS9TUUNlRlVidnFV?=
 =?utf-8?B?RFBWdVV1WmdheVMyYi9wcm5YZ0ZqU3Jwb0tWTWVrdStrNXhRN0VrTk1Pc3FZ?=
 =?utf-8?B?YnoxZTI3T2d4TTZGNlg4K2R4azAxNTNFSFFadUJCRHJoa1pVMTRUZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f585f9-7c66-4ba6-6092-08de7a200cb0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:58:40.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZAFXiRcPbMLtYa9qcatRbj1wCo7ksdb4sa8smJ7Ca7ffLyLVoxrLskm+iCYCOSPNYZ6G3bJrDG6zv/xhTt7QHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3289

On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>> So, to get a better idea of these two options I have converted this
>>> patchset to use the 2-arguments `write_with` method. Here is the
>>> difference between the two - it is particularly interesting to see how
>>> nova-core changes:
>>>
>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:reg=
ister_2args
>>
>> This looks good to me, but the fact that this turns out nicely has nothi=
ng to do
>> with write() now taking two arguments. I.e. there is no reason why we co=
uldn't
>> have the exact same write_with() method together with the single argumen=
t
>> write() method.
>>
>> The contention point for me with a two arguments write() method still re=
mains
>> that the arguments are redundant.
>>
>> I.e. you first have the location in form of an object instance of a ZST =
(which
>> in the end is just a "trick" to pass in the type itself) and then we hav=
e the
>> object that actually represents the entire register, describing both the
>> location *and* the value.
>>
>> So, let's say a driver creates a register object with a custom construct=
or
>>
>> 	let reset =3D regs::MyReg::reset();
>>
>> then the two argument approach would be
>>
>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>
>> whereas the single argument approach would just be
>>
>> 	(2) bar.write(regs::MyReg::reset());
>
> That's only for bit field registers that has unique types. I still believ=
e types
> of registers should not be tightly coupled with name of registeres.
>
> Allowing a value of register to be directly used for `write` is also conf=
using
> if a value is not created immediately before written to.
>
>>
>> So, if I would have to write (1), I'd probably be tempted to implement a=
 reset()
>> function that takes the bar as argument to hide this, i.e.
>>
>> 	regs::MyReg::reset(bar);
>>
>> I also can't agree with the argument that the notation of write(loc, val=
) - or
>> write(val, loc) as the C side does it - is common and we should stick to=
 it.
>>
>> This notation is only common because it is necessary when operating on
>> primitives or when the two representing types are discrete.
>>
>> But this isn't the case here, a register object is already distinct in t=
erms of
>> its location and value.
>
> I see no reason why register values for different locations have to be di=
stinct
> in terms of value types.
>
> Even Nova today has quite a few registers that are just bitfields of a si=
ngle
> field that spans all bits. I think many simple driver would probably want=
 to
> just operate on primitives for these.

I shall add that I think the fact that the registers that are *not* fields =
still
gain their dedicated type in Nova driver is due to the limitation of the in=
itial
`register!` API design that *requires* unique types due to the `value.op(io=
)`
design as opposed to `io.op(value)`.

I think even these ones should eventually be replaced by just primitives
eventually. I see no benefit of

    bar.write(REG.init(|x| x.with_value(value)))

as opposed to just

    bar.write(REG, value)

Best,
Gary

>
> Another example is that if there're multiple registers where fields have =
the
> same meaning (e.g. a device address), then a user might want to just have=
 the
> same type for all these values. We've already have an example of register=
 arrays
> that share types, and I see no reason to forbid non-array registers from =
also
> sharing types.
>
> Forcing all registers to have different types is a design direction that =
I don't
> want to take.
>
> Best,
> Gary
>
>>
>> So, unless there is a strong argument why this improves anything on the =
user
>> side of the API, I still feel like we should keep write() as is with a s=
ingle
>> argument; having an additional write_with() method seems fine though.

