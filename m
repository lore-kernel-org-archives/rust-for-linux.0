Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022086.outbound.protection.outlook.com [52.101.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3816836495D;
	Wed,  4 Mar 2026 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662545; cv=fail; b=hLATgVGutn6URQ4HWU1uYON6CJI5FYhjARgzwZY8zR6w+uChy5H2FoX8Mt5Tfl6QSB3qTbrG8KK21w0Bdl2C0EKesHswBf3R2yKKqjF3vryNCatziFZwU8OUmT7DY1dkPopCz7cjr1CQOhz/alEXu709u2IJ9X4+CFUHMwWAKK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662545; c=relaxed/simple;
	bh=h8S8vYto8BqFyv65uAk6nojidn4VOGjizA5kkolbB3A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=M0qELvHurlSDgzqui97dkr82FkvPdfARe06xchhATk067rhMrR6yMujiAmQiRtDZ6QUOlfmX48Ldk99jZPUUwyR2KxghZV4PNtzprPRru9IuPE1pYCN2Ny4EVrXoivZSWQv0BloM3+jFD2Pq/Xo01BzTD7H2tAs9pWI4z5ZyQPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XinvfFbP; arc=fail smtp.client-ip=52.101.101.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XinvfFbP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzvT+/1tyyaEIHFmm16R10+EXo603H8VDlqvtwyWUoLSKrd2K5byYKaxyymC9Ifu9ET/Qpk3rl4MtQKM3s7R0OQj5cDSSdLMW8olf1CtaA8J6ksR9hHd+3bz0DnL4Ku3MHTDqfEa3/mljA/DiKKLIjbtBEW+T7v2nNjUHRx7nwSPcZLwGDjDmZw94SjzZtprxErnqsHuYj94eNp9S+BncAu7ZyOPVakvl9gcCIwbmeqkep4nb4i1M25W1ll4zANJD/jATxqzbf94nE9+tU5MecXYLMwxd8OhAPYfXTUbuArof2IfkE1t0gi4xwDU1YO1UCHXN2meu3FX61wyUtnUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyhW/7z7v6Xwgw6dCm85U42HcEI+YLYUP9j4dms2CvA=;
 b=dlv/pzV2cWSMRz2QB8h3NYVIzvbRchXdkAXgtUKoYAMgIGvCBHg1H+3sRI/xOrlDGiZhwXXX77B8x83QGrYbhklMh/jMqCuOpWTMjzAGYGSZLTCgVqq96hvtddWd8Hnqac+NDtyl2wH610lOHmTaISfeClB5DmhjhRdrEgLS3KrJW7hbeVirCVaLLc0ov1ydYHQlWSg4j93EjN+cSDcmfIGcTyhVSqEIsLIhK6ZCM6wx7JBPrJpDjlyewmR63e+WCbb5Qgv0nRcbficoznDcNqAOfX8derdM3Y3ZLJLcVdGhw7vUdETkUAynrr0SN5p97tn+Jc1dcfBvVZwkxoG2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyhW/7z7v6Xwgw6dCm85U42HcEI+YLYUP9j4dms2CvA=;
 b=XinvfFbPTL73/YUbJO7SbCeZvNa8Hrmbcpp9xwiR73kVdhbSUSp/dO83b3XESuv0bx90gqNFSOwZjFbtcbsWsno4sUWGMPiaLAwpV7N5+fRPgM0MPi8GobnbnqQeAvCeB3xxqxEvwEFMH/30MBGQF97H7jFjzu/L3kcRpgAVb2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3528.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 22:15:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Wed, 4 Mar 2026
 22:15:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 22:15:39 +0000
Message-Id: <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
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
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
In-Reply-To: <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
X-ClientProxiedBy: LO4P123CA0364.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3528:EE_
X-MS-Office365-Filtering-Correlation-Id: a4762d73-64b4-4272-7057-08de7a3b91d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	KZofVDjN3Q2dZLWn0GcLQl4svtJrQSNM+nO2oN/GImWMkDMSpZc5TK15bs6jW7KhHAdW+FE6cSRpeWBIE5REbEaodnWcd04XtNN640pfFQMvurv9ozx7puumcHDc1ST8XJlr584rK5qMJxIQAsQ6fHr3tA0TkMD2uax9BA5aYJJiO84yt5GhQo+HONpIBDyQMf5V6w9OSLXzpH6ioIA4kluONc8jZJDxM7Q/l26c8W8ESfEcZJ5nUqi/ii/iMCADhGWN+1/1SfiC7oH1Aq/byKsmAsfAWT8QIBR8NnYRenoey/clmYVqoNEx0ZPZ0JHHA/iMoXNIdTsf0pEZEZwU2+XpKE6GYNJfA49hFoxKNAU2sAay5G/zEdwLafo0vmmsRmAZTEf9lYzCUkA4DYdIBCV80LBSBh8h1VZ9sbvkdof8AoDlyzv4uDNDHKPG+4cIAKv335SMN1Wg07G36ucyXBiR73tt2ggVsyqpwhCJoCvKV7mlWnCpL2LVZSBNElW05s7uZULovPZlqFoWXZzFyyED4mLr+ov4gkXPphFq92IXLhGfrWM9efYyVJhqQAh4AJwLGysuOnPFW8EBf3ltRP0b6qYMPlDW/rAO/qf8EIo1kDa3e34SYaS/oyhO88qz+i+X3qB48Qhp76HEBwPDAPJQc+AGGbsRP2uJJ73CGOK8wrPgD0evZ2Ame0FvkLQQSBcv7flONmPxRTEiRlR8uSZFSVo5+Wd0M7wqLzPbo8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzBXNFQ2Vm1zTmFUM2JOR3NJdGVIMWJYdGpYMlQ2ZXMyWjRHT0NucFdzMFdw?=
 =?utf-8?B?TEc0cUdQM21kbk40andzVzNxT1NLU0ZOVnpIOGZDaVlFOW43cjExcTBhd0Qx?=
 =?utf-8?B?MFlFaC84M3MrSlc4K1RNSFpVK0dCK1lUOXpzL2lYVHpTNFo5VGJVU1BJK2hs?=
 =?utf-8?B?NDNhcHZ3OXRBZkVVT09vWWZTNTlIUTVMR2p1bmJLVm1scEwxYU5GVDhTTzVF?=
 =?utf-8?B?WlB2cDRSOHIyalpBdHd2dDJKdWVTcTBxbmEwMktvZHJlR3Z1andhVUJoaHhy?=
 =?utf-8?B?alkxVnRqTUJ3OUpyWHVYRjI5Y0U2UTZYOHNOeEtXeWZjZzhyZWdGQ0JlWmpj?=
 =?utf-8?B?VFJOSENnd29RbmFQODZJSGVYM3VmSVVqbFJWT2htQ25KWXVJNWQ2Wld3Rndp?=
 =?utf-8?B?UTlqdDVSd0psdCsrZDZqcndhVlN5Y2tsZkNnWWFuOUhxZ0c0U2xYSGFINXV6?=
 =?utf-8?B?T3NxcmZwMjlQUlFCT3Y1bFhHQzJ0aG13Yjh0LzRzbG16MWExcWlDdlozWjVm?=
 =?utf-8?B?WXZSNGkrTmVINHdmcmdTRHIrM084T2NWU1JSbmNYSUpaam5Dd3AydTRyMktz?=
 =?utf-8?B?NGExU2NFUXV2dU1lUUVldklSc24xd2xCME1kWHo5eVAya2tTNHlUMk9hVG0z?=
 =?utf-8?B?ZzBNM0ZnMVNRVlpoa1VxdjZkbVhWRDVZTFg2Y2lTc2x5TGE4L2FxWXpGZUgr?=
 =?utf-8?B?eEk0aHpsa1hlblBiaHVOTWlnT3dyaFZBR3I1eFkxeHZSMituUmQyQ2x4aXVF?=
 =?utf-8?B?bGtFbEJYU1ZFU0Fmak83L09IT1dNZ1JrUUJrclg0ekVFaFpZbHBKSVJxNXpM?=
 =?utf-8?B?M1dHVzJaRU0vODlyUUl1T0V3Nkp2Tlc1WkRQY2lteGRZZ3hNaUl0WmwwVjNi?=
 =?utf-8?B?MFNuTGVLb3d5ekdaZzlGaG44NldlQTFCRyt0K0ZnM1hqV0dZOTUxRVhtR1VP?=
 =?utf-8?B?TnNIaHpCL0Rodkdyb29CdkFZcVRDdDVRaTRrQ01mVjhscHRkaitDVjRmQTRC?=
 =?utf-8?B?UU9TaTJpN1l3VWJERHNUbEZ5WFp1VTFoa2RWenp3MVBnNFJJeFJYclhsU0Fn?=
 =?utf-8?B?RlZaQ0Q4NDlBd0sweGZzelpiendRMTZmeTlQd2szNTVOVWc4RUtpb2M1aGgz?=
 =?utf-8?B?V0pWdEhRZlhuVi9ycmFaSmE1TERnTlMxcStWZGJVRTljMUhJTlNwdDlTUEhU?=
 =?utf-8?B?d1JxUW41QjNseHlwbFZwRFUvai9sK0dqNnpqUmdPa1l5Z3hWRGE4VzFaOE91?=
 =?utf-8?B?dS9OSjQxNjBhRVkxTll6WWhvWnV5Y2oyV3U2YTF0SUlxK3RQZzVUaEM5Tmto?=
 =?utf-8?B?QXlDSHRxeDlzakhYQjFnTXR2cHpXMlQxRTJybU1uSzBzcUNoVElaaHUxRitv?=
 =?utf-8?B?N3RhNFQzeThpUVFtRWpuOWUzTHhNY3ZhcEhZQ2dlY0ZBL2NDcklvd2s5L3hZ?=
 =?utf-8?B?dW9sWTBXMkJVLzYxRVphTEEvaDNkRmFKTEN5RHQwZkRTbGsvQjU1RnBDaDl1?=
 =?utf-8?B?a2hZMTI5eFVmNUo3d00xT0Vad0QwTjYwVU1oTTh6dVVGbkdKSHc1UWpFZ3Rn?=
 =?utf-8?B?cm1HaHF0YllYcUIwOFVIWHN3dmdxWm55a1VuczBWeXcxc0o4d095V1Qxa0ph?=
 =?utf-8?B?aGJyUnVGRTFzUEFrbnM1cU9CWnJQYlR0UWpVN2N3RzZLdXZlSlFyTHc5Mk5B?=
 =?utf-8?B?Q2t2Y2JRU0NJenh5eVVwcDZUNjhrUExjeVlQcGM4VWNWVEJBOTVrbjVMR3VU?=
 =?utf-8?B?YUtsWWNudE5RR1FNenNuakFTYVliS1VvSzZSVDhwZmJlK2gwSGdWVGF1MldP?=
 =?utf-8?B?V292aXJJZm9QemhUUE5JekVDQWxkemFiM3AyTkt6Nmp6WHoweW56dEZsU2Zq?=
 =?utf-8?B?cGdqclV0ZnlpMmRGTWZXMDI1bkpmbWtUcTY0Vms4UHR2aVhubmk3OVdZL29x?=
 =?utf-8?B?SWp6Ujg1b3p1VkRaUXpVZ2hpWmdmN0VmY0Y3UEdBT3NsaENWRDFjVThOWmpt?=
 =?utf-8?B?eVFvZnVFc0VPMFpHUGszL05jRm1udVBjbU5vcmxLYVk5a0tKS2lLc0hvM2p5?=
 =?utf-8?B?a3c1SHFxMGw2aFFsTVF6VDdGYTZTUHQyQkZzSFFiMFJWRG5vc3R2cHl5WEQw?=
 =?utf-8?B?WFRkZndCemlOVFZkNXh4S0ZRb1lsb1ZvOVF0S1ArNGVWazNJOTVEaWVJbkE5?=
 =?utf-8?B?TTdsS0xsdnRxTXUzL2NoVHBXbVVCV05PSWdBdkZtdExpcDBybnB4aWFrNmls?=
 =?utf-8?B?dGlyWkMzNTlWVmhrM3kxUHN3aGZhOFBGWk9RaGI5M3RqcVMzRXZ6WE5sMWJw?=
 =?utf-8?B?VEVtTEl6SFUyWXFTQ2ZaVGlOeGFCUkUzRmkrcExLTGVESTFUSWdxUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a4762d73-64b4-4272-7057-08de7a3b91d8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 22:15:40.2844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+MxITUDy6NPRFzceh4Q4EyeVzESThKV5/CdgSE9sbTAXYEItSWQYQygEwd7iYkWeLbhQ1j2YqciGM34ShF0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3528

On Wed Mar 4, 2026 at 9:38 PM GMT, Danilo Krummrich wrote:
> On Wed Mar 4, 2026 at 10:13 PM CET, Gary Guo wrote:
>> On Wed Mar 4, 2026 at 8:37 PM GMT, Danilo Krummrich wrote:
>>> On Wed Mar 4, 2026 at 8:48 PM CET, Gary Guo wrote:
>>>> On Wed Mar 4, 2026 at 7:38 PM GMT, Danilo Krummrich wrote:
>>>>> On Wed Mar 4, 2026 at 7:58 PM CET, Gary Guo wrote:
>>>>>> On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
>>>>>>> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>>>>>>>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>>>>>>>> So, to get a better idea of these two options I have converted th=
is
>>>>>>>>> patchset to use the 2-arguments `write_with` method. Here is the
>>>>>>>>> difference between the two - it is particularly interesting to se=
e how
>>>>>>>>> nova-core changes:
>>>>>>>>>
>>>>>>>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:lin=
ux:register_2args
>>>>>>>>
>>>>>>>> This looks good to me, but the fact that this turns out nicely has=
 nothing to do
>>>>>>>> with write() now taking two arguments. I.e. there is no reason why=
 we couldn't
>>>>>>>> have the exact same write_with() method together with the single a=
rgument
>>>>>>>> write() method.
>>>>>>>>
>>>>>>>> The contention point for me with a two arguments write() method st=
ill remains
>>>>>>>> that the arguments are redundant.
>>>>>>>>
>>>>>>>> I.e. you first have the location in form of an object instance of =
a ZST (which
>>>>>>>> in the end is just a "trick" to pass in the type itself) and then =
we have the
>>>>>>>> object that actually represents the entire register, describing bo=
th the
>>>>>>>> location *and* the value.
>>>>>>>>
>>>>>>>> So, let's say a driver creates a register object with a custom con=
structor
>>>>>>>>
>>>>>>>> 	let reset =3D regs::MyReg::reset();
>>>>>>>>
>>>>>>>> then the two argument approach would be
>>>>>>>>
>>>>>>>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>>>>>>>
>>>>>>>> whereas the single argument approach would just be
>>>>>>>>
>>>>>>>> 	(2) bar.write(regs::MyReg::reset());
>>>>>>>
>>>>>>> That's only for bit field registers that has unique types. I still =
believe types
>>>>>>> of registers should not be tightly coupled with name of registeres.
>>>>>>>
>>>>>>> Allowing a value of register to be directly used for `write` is als=
o confusing
>>>>>>> if a value is not created immediately before written to.
>>>>>>>
>>>>>>>>
>>>>>>>> So, if I would have to write (1), I'd probably be tempted to imple=
ment a reset()
>>>>>>>> function that takes the bar as argument to hide this, i.e.
>>>>>>>>
>>>>>>>> 	regs::MyReg::reset(bar);
>>>>>>>>
>>>>>>>> I also can't agree with the argument that the notation of write(lo=
c, val) - or
>>>>>>>> write(val, loc) as the C side does it - is common and we should st=
ick to it.
>>>>>>>>
>>>>>>>> This notation is only common because it is necessary when operatin=
g on
>>>>>>>> primitives or when the two representing types are discrete.
>>>>>>>>
>>>>>>>> But this isn't the case here, a register object is already distinc=
t in terms of
>>>>>>>> its location and value.
>>>>>>>
>>>>>>> I see no reason why register values for different locations have to=
 be distinct
>>>>>>> in terms of value types.
>>>>>
>>>>> That's not what the register!() macro currently does, a register type=
 always has
>>>>> a unique location, or is an array register, etc. In any case a regist=
er type is
>>>>> assoiciated with a location.
>>>>>
>>>>> If the proposal is to disconnect location and register type entirely,=
 that would
>>>>> be a change to the current design.
>>>>
>>>> It's not what the macro do today, but I don't want to ask Alex to chan=
ge it
>>>> further before landing the series. I do think it's a worthy follow-up =
to add the
>>>> ability to decouple the location and type. It's not incompatible with =
current
>>>> design anyway.
>>>
>>> I'm not sure there are any relevant use-cases for this. Do you have rea=
l
>>> examples that would not be represented with array registers?
>>
>> Even for the cases where there's a PIO register, I think it's beneficial=
 to just
>> get a value without a type.
>>
>> I don't see why we want people to write
>>
>>     self.io.read(UART_RX).value()
>>
>> vs
>>
>>     self.io.read(UART_RX)
>>
>> or
>>
>>     self.io.write(UART_TX::from(byte))
>>
>> vs
>>
>>     self.io.write(UART_TX, byte)
>>
>> what benefit does additional type provide?
>
> Well, for FIFO registers this is indeed better. However, my main concern =
was
> this
>
> 	bar.write(regs::MyReg, regs::MyReg::foo())

This specific case is indeed more cumbersome with the two argument approach=
,
although given Alex's nova diff I think the occurance shouldn't be that
frequent.

It's also not that the two argument approach would preclude us from having =
a
single argument option. In fact, with the two-argument design as the basis,=
 we
can implement such a helper function cleaner than Alex's PATCH 10/10 (which=
 uses
`Into<IoWrite>`:

    /// Indicates that this type is always associated with a specific fixed=
 I/O
    /// location.
    ///
    /// This allows use of `io.bikeshed_shorthand_name(value)` instead of s=
pecifying
    /// the register name explicitly `io.write(REG, value)`.
    trait FixedIoLocation {
        type IoLocType: IoLoc<Self>;
        const IO_LOCATION: Self::IoLocType;
    }

    trait Io {
        fn bikeshed_shorthand_name<T>(&self, value: T)
            where T: FixedIoLocation +
                  Self: IoCapable<<T::IoLocType as IoLoc<T>>::IoType>,
        {
            self.write(T::IO_LOCATION, value)
        }
    }

No need for a `IoWrite` type, everything is done via traits.

Anyhow I don't think we should close door for a more universal approach bec=
ause
a specific use case is shorter to write.

Best,
Gary

>
> for the reasons explained above.
>
> As for FIFO registers, another option could be to leverage the raw access=
ors and
> make a location type dereferece to the offset, e.g.
>
> 	bar.write8(regs::TX_FIFO, byte)
>
> The same goes for the array case of course.

