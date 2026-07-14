Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020138.outbound.protection.outlook.com [52.101.196.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305FA35AC3E
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026625; cv=fail; b=kTnB7383hKT5Z/WQtB7xnr3Did3CdMuaz32gOXyjz/zEFp+2F1CQor/g8cLd2z0QMATym4pecSkEHB8O2Kf9wybOoC1a3yzySYjOOnuXCfZw9s/SQvy9wwNm1JkHlkBI01UNHGJVnjjcrmwrQuFNG35aGknJT7vTqe79+CILaDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026625; c=relaxed/simple;
	bh=H4zFsATN83l0bmAnfZnI6/rFZQ8S+SdVQvigEAMZrMU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mV7xybTgXeex3x+ZR2461NenJtwo7yjERZrhTNkq4TtZe6m/0fgm7ZJj1tDA3vRkOBObNjAIaUn9v91k4oi9cUv+8f7E0+gtsdJ1cn1U3eDfo0rtLmGkZcmzO6E/y9+MgzdqVIrpPfmPn8f6MAbm5VmMv0SvJwB1DUyfwCXpadE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TGA8Cg9C; arc=fail smtp.client-ip=52.101.196.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TGA8Cg9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjYlyGBAo328Bsfy3aSpgBj/nUBZet8o5EpLlm2lXnzVDrCpsbvYn7gUkf1T8UzBPxE36ljxK8S/cNGUJ40F/NmziOr04fnFkgTDVo7UmdZ4ZVbtPWj1OWPWJJ1x3ckTO4qzHblrFxyoPUoruQiQle4y2v3172oIIvxc37RrDu45Qz1Qnsl/rU5Ql86RHqKrLumWCIn7zagWNR2ay39vDkn9jlnWLlIM2JoZdQxfsikkA1Nsg49RhkSZv047qPAFq5y0+00WRW7EBMsRcDLrWKqK3Eu8CMkItE392BteD2ilccdV6fDOfM5Qyz2OiUBoiCJfD9l0vG0KI3iepu03pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4zFsATN83l0bmAnfZnI6/rFZQ8S+SdVQvigEAMZrMU=;
 b=TZVbeTZS2EXNQ8ILNHZxCX+6AYY0PYTary8e/BjVR2b5DhTU8QfunxSsKypogbfs//X7txGbmeRiLnICXtunWqRGb9h02E2+i4/j4JQ9ZG/9O+ypepntzEfWhLgRTrfs6cZLfcXuNpnKODdJgDhhZC0sg7w4rAD7y8ej/Tht46pkMs73dXL5bPPMPX7dzTYpgSgq0eLfp0oSqLXL2FNRE6dKbmnLOMInNdp1rgVSwmOd05GSO71r2c8YB4pLySdIpsx8Ae6XjiCYqOp2LKeyRcGYQUfzvBPhbaSrGXpoX+w3uL3eNaE8TUdQF/wuC57LhHoWaD5+Vh9UzU4VBVaywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4zFsATN83l0bmAnfZnI6/rFZQ8S+SdVQvigEAMZrMU=;
 b=TGA8Cg9CGV1+iOGTT+eyeCk7urPXGoCDIbLrhS0Va48bpbYN+d8hUmgOV3149bEsD0g2DpLbhxN7TqrpYgkQ5sbCd1PJ/oJrJJvdro1xhDNVxWUoRqV1ZEpOC4xMCcuTg/R06BBBprwx6P+w1ULZ1S2HTBPtAUac6SM5lJXj7/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7982.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:466::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 10:56:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 10:56:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 11:56:58 +0100
Message-Id: <DJY8NM7TIHZK.15213B4MWETHU@garyguo.net>
Cc: <a.hindborg@kernel.org>, <ojeda@kernel.org>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>, <gary@garyguo.net>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0
References: <CANiq72kMWjfk9u_HiYsGWYGnKaF-oOn2w-kH=ap0wO9QccZYEg@mail.gmail.com> <20260714.191642.1103024240790648142.tomo@flapping.org> <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com> <20260714.194916.571807180513332641.tomo@flapping.org>
In-Reply-To: <20260714.194916.571807180513332641.tomo@flapping.org>
X-ClientProxiedBy: LO4P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 5496e8e3-163b-40be-e2ec-08dee196a0ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|10070799003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OGamOdrbcwwoNndo5M0fPVtHysyvdLws1r6CxkU7AV24sqvMbuDpG/sGsIQoyJL5jflyhmzuWux4lQcg+LftTTrEXHFfjHhzfwPvw/N5+zbGLIJvvmP1f+k708oUUv5KL/P79QN9yAMe8tLib/u/26xsQWqU9U5EpdTJza37D1C2HyPtmcYA+j6Bc73GIW2hhghsA21B5Rtt53z/GrLCw09lHNWk33JMI9uK5xtto8uDQLg9VOhxWisHv/YmxDMK2eat5SeEoJna0bZwESBBiS0/EJIXO35/HRXTUCtM9Vm1sHaYAUJ2UkTGNaBVMc+n3dyZghvCBrb+kkOa1tkwmx3tlhgjo/5jvvkHgkSaFA2mwm7wviLPnqX4f1DJl7vE/3DZc0zeUQwXowhItBL63ZROsAQDU7y8cBmh2IakmBiir/hAFvtcWPAVuEMz7lzkQfDMiZAD9ifwGOTxfTZffslIV5i3O1+swIFXHerDt1gm0S4rWWNx9xqRCWSptPADAMnw04EamPgQuiD+DL9KFwwJJLKylJ8zRGbFeswMPFjrmpHTSkzo5qYvvhCbtnBPxGiBgZZYI7LLvkEYQMzKhPozSPj3SjQup2v5eCXzp6dMld8WNk21lsNGxCHqIxW653RfVJ+TQQ78xjXCb3F9d8ntLKIxOkbOD0siPQDEKFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(10070799003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVRJcnNUWkkrOUQ2SS9mdDlhNFZBWGZIckZ6cmduSkVOUmhFNUxneUw1Yjh6?=
 =?utf-8?B?VVNqWjdnLzZJRXIzVFRXTG02OUpyeWlvekFJQTJpRFQyS05LYlljc0U2cVhN?=
 =?utf-8?B?dlpHMG9KZTBmTWFaZXpVOGltRW41ODJXUHVGUVJPVDJLT09PWnN4RGVnSC9Q?=
 =?utf-8?B?K1FSWXAwRWptSzdMbk1YQVQ5akJRTStFOHA4WmVRVU1GV3N0OHRCN3RvM3pj?=
 =?utf-8?B?RmNIUjFyL0ZuSWZ4VGxIVW9XY2VlS29NRWo4cGVCc1FibXgvcWxHN1duTXB3?=
 =?utf-8?B?ZDhhVXhWMHJsNTB5SVI5SGpRU1NxYnBFamgxZDJ6bXRBUi9BWFVDOHhJUXRY?=
 =?utf-8?B?dms1VnF1aXcxVGFSUFI1YjdrY2ViSU1zTm5KbWxEVm1EdGJqRElseGx1Zk5G?=
 =?utf-8?B?Q0w4WHlYenVUYkR4cGpOYS9DME1meG5Bc1pUUlZrVVBwZjFRUkY4NjVOdk5H?=
 =?utf-8?B?YXk2K29GMFpGNmJlSldxTU1BWEt5T2Z5a2RtTzU1Y1JKTDBidTVDRXJFcU9S?=
 =?utf-8?B?RXZnM3U5RjZ3Y2JLWi9va2ErR0YrcHZuUmJzclA1cUdVdmR3dlVDZUZaaTR0?=
 =?utf-8?B?RXB6Sm42ejIvc2toU2dvaURsTC9rVWEwWmx1TkFvdm1PUnNVVUhGbWVqRVQx?=
 =?utf-8?B?aHpmdllBQWwrZjFWNzRvbXh2VFYyMndtNTg1YkZPZUx6dE1OUThvYUFTOXB3?=
 =?utf-8?B?aE51NWhPeHNaWjY1bjZjallPQnl5ZWFCaHBNNmdib0NIVmZVR3R4VDJIV25F?=
 =?utf-8?B?em9Ba1JFYnpyMlIxTWZsVGd5Tm5GeE5ZUWxYb1FRblB2OXlDVVRvcDFHQWJV?=
 =?utf-8?B?QVdNeVRDcDRKRHduSTFpSFprbGRmdm1YR1RickRaTTgxbWtRNVh3cFAvNTZl?=
 =?utf-8?B?MVFqYmxrUjg3S0JTb0ZFcFRYZzZrdGw5Y0Q2eEVtZVBDQUo2QmF2ZWFaL0VC?=
 =?utf-8?B?S2xvdTlGazNOOWw5czlwaHg0VnI5Y1YrbXVxNkhrcU1jM2ExNUlsSit5R3pT?=
 =?utf-8?B?NDJIaVUzOFFjemVFOUdsUDZrelNKOUwzbSt2YXlkVWJucmltSmUzQnJvZ0VC?=
 =?utf-8?B?bDN5RFJjTEc3ekxURk5mdUxlUUdUZE5xSWhobjlNR2hXRXFrMjFXQlkxVlR5?=
 =?utf-8?B?OU4yaUVwZ09uNkNYRGhaTmpzdGhxV3BYbGtwaXIvUUVoRmZUZGZ2VTZqU3hz?=
 =?utf-8?B?QWcrM0QxQlYzQ3Q1dDhrWFdVNUgvdUQxNndYQ0xhZWlwL3BTWW1mamZKbVA5?=
 =?utf-8?B?NHlqbDNqczIraVQ0SDB3czZxS2wyUGlkcExIVUN1UDdVYWVRRGtyd1N5ZHRI?=
 =?utf-8?B?cXdkak9yZVoyNjdSekhUc3FjdmtWMEU3OFNNOElOUFo4bSs2Y05DUTdIaUJm?=
 =?utf-8?B?K1BnUXZOb0FIcmtISUlQYUNuU2prVFA1Q1JaMG1NQXRFbU9tMU8vUFZOYXV6?=
 =?utf-8?B?c1piblZPZU5jbnlhS3lHTzNCZUszMk52TmFyQk9KOStCZ2M0elN0UHcrSXJS?=
 =?utf-8?B?ZjJleFE5a1JpeXVoaFRsRkRXVmpydXAxZ3VLSjJZSnFHT3luekNEU1lMckYz?=
 =?utf-8?B?MUdsb2NweE9ueWl1UCs4S3R0VERScXNmeGE5MWp6bjBJNVM5MXM5RCtOVzNE?=
 =?utf-8?B?M2w2ejBmUlJMam9ZSkRDY3dpKzd0SXlMS3RlSDdGd2tPZU5ySFZPUTEzTUlk?=
 =?utf-8?B?SFp2UXoyN2JtdXZnblBCdDFVajV2UkVIT3FVMjRUeUdwVWJ2MEN4c0pOdGVm?=
 =?utf-8?B?R21VeWFxTk5xbFRCeGJKU3hWZndLd0U2N1JLRCs2bWNONWRPRmFpUVhPajdY?=
 =?utf-8?B?c0dlSGpWQnlkSExhaWd2VVM2Z0pYZFQ3RVp4eklsRXlTaDVCSzBiZEpreDIw?=
 =?utf-8?B?WHNvRUZZcnNKVHlHZWovZWRlMkVZcEFhU3FFaThrak1WcGF3Yk1XMHdxR04v?=
 =?utf-8?B?bzFPL3FVVzhseXhHN3ZNaFFiOWNGY3BCd3lKQWlKVWh1b0hLQ3FNQU9IMjVN?=
 =?utf-8?B?aC8xRUh2cmtZcUxsZ1o1RHIxcTBVM2x1Z3VWYjdYeEREdlZHYlBqZEpQSms0?=
 =?utf-8?B?SmpFVWczaE9kR2hrWXRlcE0xd09EaVllYjFJMjlOTkdqczdhclh5WVBCNzM1?=
 =?utf-8?B?VlZYa0N0MGpkbWNMSzh3MkVmaEJpeEh6Z09rTEI2Ym84dW5RTDVDeEJLTElR?=
 =?utf-8?B?TzlaeWVzc1FaRTZtOFpuRHAvbEVRTEYxQk1PUWJGN1p0bGJqUit2WUtwQVFB?=
 =?utf-8?B?cHNaTUFwanVaNitBSENDOXQycFV0RVpXdkpEVkJIOEluaWxmdjBjc2RGTGdX?=
 =?utf-8?B?cHVoRWREMmdMR3hyQ0VvT1lOOVc5WFB6RVZUTzBnZWIxQldmSUt0UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5496e8e3-163b-40be-e2ec-08dee196a0ae
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 10:56:59.1927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Hd4Lb0a/YYvycG1dgufNMdlRfE/LEToFLrDiWc+LcvegMk6yYsnzPLWG2Zfd622ouEyXjAPwn1z58kqFWXZsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7982

On Tue Jul 14, 2026 at 11:49 AM BST, FUJITA Tomonori wrote:
> On Tue, 14 Jul 2026 12:38:03 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Tue, Jul 14, 2026 at 12:16=E2=80=AFPM FUJITA Tomonori <tomo@flapping.=
org> wrote:
>>>
>>> I can send a patch but as I recall, the last time I posted a patch
>>> like that, Andreas was opposed to that kind approach?
>>>
>>> https://lore.kernel.org/rust-for-linux/20250701001809.496389-1-fujita.t=
omonori@gmail.com/
>>=20
>> Ah, that explains why I had the feeling I already mentioned this in
>> the past... Thanks for linking it! :)
>>=20
>> My reading at the end of that thread was that he would open to it as
>> long as the constants had a name or computed relative to something
>> else, which is a good idea regardless, and I replied with agreement --
>> so I don't think Andreas was completely opposed to doing so?
>>=20
>> We should anyway be consistent about this treewide. What we have been
>> doing (or at least my intention) was to document an example of each
>> possible return path / edge case. That is, we don't want every single
>> test in examples, but for instance here at the very least I would
>> expect to see 1) a normal case, 2) a saturating case, 3) the behavior
>> of that with negatives; but perhaps we don't want to have every single
>> test we may have about each of those "groups".
>
> As I recall, the last time I posted a patch to make them constants,
> Gary was opposed?
>
> https://lore.kernel.org/rust-for-linux/20260119233621.3465304-1-fujita.to=
monori@gmail.com/

I'm okay having test cases for corner cases but they shouldn't be part of t=
he
API.

Best,
Gary

