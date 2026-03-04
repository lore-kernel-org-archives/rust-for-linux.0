Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022115.outbound.protection.outlook.com [52.101.96.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA5E382376;
	Wed,  4 Mar 2026 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658845; cv=fail; b=f5BgGhSyZ84kPzy8R2ReAGDUwS6kLIoBZhl4aE61yvn0DWSQX2jqlZvCvu2XsdGOYOL6H5nHZ4eC/VD7f+GqKoVYgpRgIjOCCnf0SjZ2gzr3SggFGjhaGVuwKJ5inUPXQT1qRtWDZSJMqIqIyJmvvkb/VB0kjHzuBiQfqJkhUNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658845; c=relaxed/simple;
	bh=yCZaOGrTY49rjshZ1rY52PHdtAoi1uux9VQmyRzADEg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=RuDtJUB3nPtSkpwR3HSQ0xyOd2I12zD/gzv+EYT7Dh//zc4tfEPlbyFePxgky9tJGjNVkVXojNpcEQHLfgp+NQ6ugWKLb1MPzMtB+nBhadtbFaO0M/Pld8thJDm/pqTRuqP0hFJDvKhoEH5F1tLdfXWBm+/8j/uhj5T/DSuDJsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lpHWelai; arc=fail smtp.client-ip=52.101.96.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lpHWelai"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kag48u9YGreTT62QeoPcxQUcBIXZhNY1DmCvhDBDG3xGyhyl/GOBcTRxc+BiLA1wz5gQVOq0Ih656TQjr48CA5TuyznOk5FrVFRJUjR2U++OzZFo5xqTntAn2mGeBLi/I0+b3Vfo648dIATEmGLJdGvw4Les6ohJp/h514zvkGpR9ceQxZXsTAvQvwI/RZRf8TmgkwhJr3AQQZxv7fPpgZ+Mqy4kpxeCTRB39aJPWcNaRrInDLvwuWOebfBosHrdaqEHqU/ZkGiU4CkpzLL6eP6xQAP1M3t0NjVWJGJXJshXqiTWtl/V2K7g3KQAIGeZCYQDd1ffZT40hf7yjd51iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTPSTVOiEGXj2rTka9ApP5l2hORin+Q3SnxtChkZ5eo=;
 b=nil+y2RWnsnt+3jSN/jcRzXgS6AxXcXGg4/JOPzTd3mXhyyALhbFsKmbDkBW0p41ZKSQBXHEgTWGWerts98LjcBY8IBSxwTzewNl8CJhd6D05UvrUMb0rFJi9Ztl0b37P7ziixpuz9K5cpBY5BqfxKxAn+gKKRZTZGcAHtzoThoEn6tpS4Eu3kb97AT+f3N5+mlNvt9BSk140H/eMx8ZSDvTP0iaFJqfcEiSPFTdq8lA877nJ8N6dMd6wSoopfAZjMTRspjTT6gThQi6Z5jRWL/tIuhFzv/Wg9ROuokVvMbP9e+Xodzqo3eDsXfFP0vji7IRh4Ch1atS4SN486/NdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTPSTVOiEGXj2rTka9ApP5l2hORin+Q3SnxtChkZ5eo=;
 b=lpHWelaialPj4wqR7Cq41+A3BhxZi6G3vas75OBcDjQ/uKgmd5C9FidpERv1FuJEnB3JsIzRUrpNMo1BS6EPTd1stP0f08hgjYUINnF5vCRkH5EqYq7aixIvmu++/g/PjqjuQ3nIMfA/m+4lC13UciGVIXdFtYL2N3zX7ds0HVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7557.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 21:14:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.017; Wed, 4 Mar 2026
 21:14:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 21:13:59 +0000
Message-Id: <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
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
In-Reply-To: <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
X-ClientProxiedBy: LO4P123CA0592.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f37536-dd63-489e-7857-08de7a32f477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	nH6zHlcbVfVV4uYrbPWoaVQElJs4ZKhGN6cjmSEVlKf2nYO3DREr1jsfZkrLDO2g6S4mKXpu/MsYJ8+NCA3AVXQbCL8tPOI2wBvCpzH+iocBr4+GB8LoPxCAjRGGsc5sxJikNw6bUKfHa7R41nbD6oj2gDpapHxgNB3o0D7M4YtXp5q2DRb3nvalY0NL+7exJ2HJGHJQBdSU5V30OkcLeDKTP0S+5TSaEDgsXuq9SBjwSyY1E1x8S0VjbpYHSHiocdqoYlDK2AUSJULagAt2DupTwT9AyBF+Wk4YXvgVH7Lo6+v+q8X31d2vNWSQ+5udP09Irg8vhfE0ZxG/17XqmByFOqJ8MecXJ3ScBffwevup4z2YOGy58cddFDPctgOHswN2wFu/yGSGPEK8czC3JJvX8sj9flKJGoS6Tr8T4oenZ7HgkoDNbEqd7j85xS3oxS0vOwIZyHRFH7VN8VA4w1KM7C9tGG0IsrdjF0X48c7doxTzemE8bWHNnuZDxkU0Q1TxAShzkAL1D0pQy+uw6PiroaRx7wW39pHyIO4HcN2/F5AN51xAQd8tyjkHxai4kYln5uaMr6UC45V2KE8WXP2QwbcML2IVEdBE1NORbrN5ul1uJaOS0yUtWRrUCbzJ0dlGoG/WwSj8Ad5o3dwbn3hsTK4HGFFOX6w5B3qdNiCfsvmyGK9G1X1hWmBIZgaGteUAlSn9J86iJ4fzr/aw7n+6TlgH+w1VaXlaopPAQZg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGpPTnl2SlVpTDFZM3p5aHFwUXNrYmhoNkwvN2FHOVMzaUJmME1KY0VvbEx0?=
 =?utf-8?B?QUpZeGVRaWxKRURERVNsVzllOTBlUnI2VGVQNVFLaWhkQ1UrM0h2cCtlYnZK?=
 =?utf-8?B?QzFpZ0svY2k5aVlKZTBORC81ZHoydW1VRGVheHB3WkFGVE5scS8xdHB0eXFp?=
 =?utf-8?B?QThRbjlSVzZtQjVwcFlia0dhRXpOOVRBSzAyb21LakJ5N2djRSsvZW1GbDVT?=
 =?utf-8?B?K3UzYnVlVEpyZnlRMmZEMUkrdmRibGJORWNYT1pJVTIrTFFxVE5qd0FpdkNU?=
 =?utf-8?B?V1dxUGJUZlRVVXlBNnJxWjJTMDZiWnlVa052SnRHZzlIOTZ3M3FuM3FXVDRx?=
 =?utf-8?B?UUptYnBXbSs2ekNUUG9MbkZjZjF1ZEJkZDVia1lBWjA3Z0Z3R1daZGNZRHB6?=
 =?utf-8?B?SVUzUm5xNmZZYVJhSVFNUmN2OTl3NDhMeUJLZnVrck1mcFFEZEN4b05ZRzh2?=
 =?utf-8?B?L2pWVTJqZWQ4VUpDQVJPd0l6TVJMclVnM1F3Y0swZkJCRzNJUFVEU1FxUU04?=
 =?utf-8?B?bmR4L3ZPRHJ4bXE3OHdtL3pWSFZHSUs0YTNUd3FBNkdRUDZPMmlFa01vOUE5?=
 =?utf-8?B?QXBJN0lGV0dIUzdRenAyeXhLcWxvcHRlWHROM05RNkZybGROUnF6aFBwVi9u?=
 =?utf-8?B?Si96SDVITy8rSFhOcHBqb1VTa2lyUVBjSjFEdGJPSUNKTUQ0OFNwTG5uRjNX?=
 =?utf-8?B?empWTUhQT1loRmNXYVY1eEVteVVSZ1JyYlAzRFdVU2ZtSSs2ZDRYdXU1cXBN?=
 =?utf-8?B?QytSZTZZWklJSVh1akw1Nk5VK3VYSGkrV1JEalZKc2VOa2ZhTzhvb2w3R2tW?=
 =?utf-8?B?TG5PK0plaHJwSzJvTHNXeXU3SkJ5UDFtVUFycFZnTnZyVjNud3R2U2ZtcVlG?=
 =?utf-8?B?bVRCTkwzc1pHZWpqeFUzZEM5SEplU0hYWkZ6OHVvOVovTjZXbklDUURzWDY5?=
 =?utf-8?B?M0NWZ1ZGT3BjZ0VRY1dRNy9xVDZWQUtZNktEeDRXK2FBL3hCV0tBTy9HSjdH?=
 =?utf-8?B?UHV5Q0VDVE9ZWEM5djFGWTBXNFpsaEo0NGhnTURQa3ZISzNpZmFHUUI3TDI5?=
 =?utf-8?B?WjFueXNkTzV3YzdiemxXejIzbndUT0hCbEd3TVE3MzZnQ0krWHVqMGlwQkdp?=
 =?utf-8?B?WmRLZjVUQkIrOTNwcGN2MDd5bXNML0F2R3h2SnFhYnBHWXY4Wjl1SmpTTENH?=
 =?utf-8?B?VEhCUnR4STcvcXRkcmlXenJhalBCVlhNUFZFL2k1N2txRzB0aExBTEVOWllM?=
 =?utf-8?B?S1A1UUtNMllFeENjNXY2ajlDZnZPdXhkTzNBVWtLUmRaSWpjRmFIY290dFZr?=
 =?utf-8?B?bWliVFV0M01HMUR6a1czMHY5c3VadlM1Y3h6OVlJdnVXcU9TQUtWMDVaZ2E1?=
 =?utf-8?B?RUU5SHM2Q1pqUzZvNVUwTllBQ1A2Y21DWWtjR1dzWWhqTkIzWE0rUDBhcC9J?=
 =?utf-8?B?R3h6OXBkRTFnVkEvUitnbTd5ZWw1bjBGTmZnaE12dVZkY3hSUExSZjhzVjg4?=
 =?utf-8?B?TTQva1BxaFMrQTNMY3lrekpUcXdlcXJZSDVnNGFycWxta3RrcDNSSFlUUGNk?=
 =?utf-8?B?NmRKaE1naFdranZkZy90YTF1TmFnVTFIS0ZhUDI0c214MWtNY1pyNGc0dlI1?=
 =?utf-8?B?UGp6dG5NNTlmajBUdWxUdXdST0c0L2RScENYSVVFNUh2VllvUUw0ZkJScThj?=
 =?utf-8?B?aWdMOU1iZlZZaTBuaUYxZjdoaHFXOXFrQzBveG05Z1czcS93ZGl3aENPZjky?=
 =?utf-8?B?bTN4ZkVwaTY1MDZVMzRCdGJWSVE1S0UvWFhGOUd3TnVDK0xFNjZnUGQ3RjEx?=
 =?utf-8?B?a2wrdHVpVG14OUVrTWpIWTZ2eUpkemZNenRVM2JYNjlZbHRsdmQyL0F2dzBQ?=
 =?utf-8?B?Z0dZTFk1dlRQOTlLZkZlZmd2UDB1YU1rbFBmRkhhaG9qb04xTHFVTE51ZkZH?=
 =?utf-8?B?UjM1bEIrOGtJd0lqOFp6bEhRejRxcE40R2VQQ0YzbWVUVFZ5UHpoVkg3bTZH?=
 =?utf-8?B?QmxER3JnWXd2Z2I3eHdFVEhFY1lhTU9mRnNCYUJaRWpmL1lLencvVzQ4N2cv?=
 =?utf-8?B?Szd6Uk1Rb2dYbnVBRG5Na0lnbXBwWWMvYzBFZDVTL2hiUmFHV0I1alYyb2U4?=
 =?utf-8?B?N0dGWGJGN2JNU2pIVlVEeTMrOGRmZk5Cb0VjaXlId1J6RU1WRE1LNy92SmlU?=
 =?utf-8?B?SVVnVmR0Q0oya3BhMlRuSk84RUhPRkpsTmxQVFUwMXJKZ0NZaUFBU1pjNkp5?=
 =?utf-8?B?cDBXUDFselB5UFB1L2tTSzJIdFFnSEFVSEFGZVdiWmFhbDZDK0MzUGVoSW4z?=
 =?utf-8?B?MlJFN3ZVMzcvMkpQRjgwTzNRR0I5WitzUzVQSWZCUWlLZ1Y4R3UzUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f37536-dd63-489e-7857-08de7a32f477
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 21:14:00.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77va20jjCkGecEy0POribgMZPh71QIViCRgCkQ2rYAhww8oXDfXtJBAU/EPBvJtgAbhmxpJantETd/pcS22Ymg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7557

On Wed Mar 4, 2026 at 8:37 PM GMT, Danilo Krummrich wrote:
> On Wed Mar 4, 2026 at 8:48 PM CET, Gary Guo wrote:
>> On Wed Mar 4, 2026 at 7:38 PM GMT, Danilo Krummrich wrote:
>>> On Wed Mar 4, 2026 at 7:58 PM CET, Gary Guo wrote:
>>>> On Wed Mar 4, 2026 at 6:39 PM GMT, Gary Guo wrote:
>>>>> On Wed Mar 4, 2026 at 4:18 PM GMT, Danilo Krummrich wrote:
>>>>>> On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
>>>>>>> So, to get a better idea of these two options I have converted this
>>>>>>> patchset to use the 2-arguments `write_with` method. Here is the
>>>>>>> difference between the two - it is particularly interesting to see =
how
>>>>>>> nova-core changes:
>>>>>>>
>>>>>>> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux=
:register_2args
>>>>>>
>>>>>> This looks good to me, but the fact that this turns out nicely has n=
othing to do
>>>>>> with write() now taking two arguments. I.e. there is no reason why w=
e couldn't
>>>>>> have the exact same write_with() method together with the single arg=
ument
>>>>>> write() method.
>>>>>>
>>>>>> The contention point for me with a two arguments write() method stil=
l remains
>>>>>> that the arguments are redundant.
>>>>>>
>>>>>> I.e. you first have the location in form of an object instance of a =
ZST (which
>>>>>> in the end is just a "trick" to pass in the type itself) and then we=
 have the
>>>>>> object that actually represents the entire register, describing both=
 the
>>>>>> location *and* the value.
>>>>>>
>>>>>> So, let's say a driver creates a register object with a custom const=
ructor
>>>>>>
>>>>>> 	let reset =3D regs::MyReg::reset();
>>>>>>
>>>>>> then the two argument approach would be
>>>>>>
>>>>>> 	(1) bar.write(regs::MyReg, regs::MyReg::reset());
>>>>>>
>>>>>> whereas the single argument approach would just be
>>>>>>
>>>>>> 	(2) bar.write(regs::MyReg::reset());
>>>>>
>>>>> That's only for bit field registers that has unique types. I still be=
lieve types
>>>>> of registers should not be tightly coupled with name of registeres.
>>>>>
>>>>> Allowing a value of register to be directly used for `write` is also =
confusing
>>>>> if a value is not created immediately before written to.
>>>>>
>>>>>>
>>>>>> So, if I would have to write (1), I'd probably be tempted to impleme=
nt a reset()
>>>>>> function that takes the bar as argument to hide this, i.e.
>>>>>>
>>>>>> 	regs::MyReg::reset(bar);
>>>>>>
>>>>>> I also can't agree with the argument that the notation of write(loc,=
 val) - or
>>>>>> write(val, loc) as the C side does it - is common and we should stic=
k to it.
>>>>>>
>>>>>> This notation is only common because it is necessary when operating =
on
>>>>>> primitives or when the two representing types are discrete.
>>>>>>
>>>>>> But this isn't the case here, a register object is already distinct =
in terms of
>>>>>> its location and value.
>>>>>
>>>>> I see no reason why register values for different locations have to b=
e distinct
>>>>> in terms of value types.
>>>
>>> That's not what the register!() macro currently does, a register type a=
lways has
>>> a unique location, or is an array register, etc. In any case a register=
 type is
>>> assoiciated with a location.
>>>
>>> If the proposal is to disconnect location and register type entirely, t=
hat would
>>> be a change to the current design.
>>
>> It's not what the macro do today, but I don't want to ask Alex to change=
 it
>> further before landing the series. I do think it's a worthy follow-up to=
 add the
>> ability to decouple the location and type. It's not incompatible with cu=
rrent
>> design anyway.
>
> I'm not sure there are any relevant use-cases for this. Do you have real
> examples that would not be represented with array registers?

Even for the cases where there's a PIO register, I think it's beneficial to=
 just
get a value without a type.

I don't see why we want people to write

    self.io.read(UART_RX).value()

vs

    self.io.read(UART_RX)

or

    self.io.write(UART_TX::from(byte))

vs

    self.io.write(UART_TX, byte)

what benefit does additional type provide?

>
> Otherwise, I think this disconnect has no advantages. Actually, I think i=
t may
> even be the opposite, as it would allow for confusing the location.

The two ways of writing has the exact same possibility of location confusio=
n.
It's just one uses comma and another uses `::from()`. Arguably the comma fo=
rm is
better because you always spell out the location, *and* it's still type che=
cked.

The comma one is more C like, less typing, and is more clear visually. The =
one
operand approach is just aesthetically bad.

I also have to say that I am not a big fan of adding additional types when
things can be just done with constant values. That's more work for compiler=
 and
code monomorphization in general, without significant added value.

>
>>> If we'd have this clear separation, I would obviously not object to thi=
s change,
>>> but currently it's just unnecessary redundancy.
>>>
>>>>> Even Nova today has quite a few registers that are just bitfields of =
a single
>>>>> field that spans all bits. I think many simple driver would probably =
want to
>>>>> just operate on primitives for these.
>>>>
>>>> I shall add that I think the fact that the registers that are *not* fi=
elds still
>>>> gain their dedicated type in Nova driver is due to the limitation of t=
he initial
>>>> `register!` API design that *requires* unique types due to the `value.=
op(io)`
>>>> design as opposed to `io.op(value)`.
>>>>
>>>> I think even these ones should eventually be replaced by just primitiv=
es
>>>> eventually. I see no benefit of
>>>>
>>>>     bar.write(REG.init(|x| x.with_value(value)))
>>>>
>>>> as opposed to just
>>>>
>>>>     bar.write(REG, value)
>>>
>>> Well, you don't have to make that we have to use init() with a closure =
for such
>>> cases. We can also do something like:
>>>
>>> 	bar.write(Reg::from(value))
>>
>> This won't work for the array case, right? For array you'd have
>>
>>     bar.write(ARRAY.try_at(idx).ok_or(EINVAL)?.set(Reg::from(value)))
>>
>> and now the register name is repeating twice rather than just
>>
>>     bar.write(ARRAY.try_at(idx).ok_or(EINVAL)?, value)
>
> We should be able to just do
>
> 	bar.write(ARRAY.try_at(idx).ok_or(EINVAL)?.set(value.into()))

Sure, more typing, more parenthesis nesting, and more cluttered visually. I
don't understand why is this preferrable.

The `io.write(loc, value)` approach is very simple to understand also very
straightforward to implement. `loc` is just an offset that also restricts t=
he
type, `value` is a typed value, that can be bitfields or some other used-de=
fined
types.

Want things to be just integers? Sure, you can have it. Want everything to =
be
fully typed? Sure, you can have it with bitfields. Custom types with custom
conversion logic? Implement your own conversion with a `IoCapable` primitiv=
e and
you can have it too.

I don't see a need to have a more restrictive API, and also have something =
that
is less clear visually, and, most important to me, ugly.

Best,
Gary
