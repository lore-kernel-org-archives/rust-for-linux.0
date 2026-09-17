Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936D3AD539;
	Thu, 17 Sep 2026 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648019; cv=fail; b=CoJyGFS+JuNw4W96c5xhq51Dg4MJnnVVgRqYJDWq39AecszJrGhdSZxIcljb9AlFUXsYUGPX7WG7endbj4kFzavsrAeUKvExep7NBSNVrRxrU0kfSgegLpYBy34P5htFJFtRpmpQm/+7dyWOmIW9FZYc24leAGNI11iPNXbvgZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648019; c=relaxed/simple;
	bh=UFcj0n4AUIqhFJzWPsT95CnKmYRZzz5Sf/UyaTCSquM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YxZaVAT8wfxsAwMTgl/XazkQm4+ztpKee1C0KxsSRmIAbn7Bt6l7WkSwdFoqjGCnPwjtC2q0sVqfK7ZmOld3v6wUMdiYgfoauvbNjh9odaKbGvDvrUeQFIiga5b4ehcVUV3L6WqMOb52c5ovZ0d9zHA+/KNRMO0lY7jN1giF+1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X3kt5knl; arc=fail smtp.client-ip=52.101.57.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X3kt5knl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gen54zvfSvNeuMusMfEjgl0A/QKQtVVJL7e7ZhFrfJIcYYE9vTxZpJGMluPHp4xbnNu8wOAKQuSjRMR9wK6ktaBShIzYGuTr0/Ft/bsPNW2InvJOniUgGlzdfp0vcImWx94BVKN2lJA9XxjKQmMnV+OQjduU5CPEwZz/fHSZ+Jecy1Fx4aIRmeh4NVuc5ZML4eR0MRJTgSbfmMq/DDnG8/OFrYmLpG5ntBekZfSk6cn+obtWKoRYpNUm6L+GYZVqh9iJGSNiFnzFja6KIBERYhyFIBNTVk3/xigAp6Av+2q8DkIg+iVpAtRDMcqoyVzGOBa43sXTPtumYVJ6NmJQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9aSkKKc7WtnQVFW80/zLdDT1oTrC0xtTfmak4Yieus=;
 b=SkK5MkqaFfIK4yjfYh30qP6oK9SbDLUhAflFGWEkX3u6D7jYdUl77vvvtWovgAzekUi47m9ogR8p2XzlSoKW0CNOl5JI9sv6Jp+w81tru48Vp1wMQNKpC6FOVg8toO0KrFZqNalUk+6tG4iqvNGLepLgTRiqMVEGsxqGq+1n/mGZ8r5C2e5hzlIiCICCqD9BSU3RSnaohhrdy7VqQzRKBDNXZe9ilv0Pn5q7mGJathqeEb4y44ok6uMytQR95Fdee2cp9qdIHpHCGWo0oLMsMXa8VtjgnomH2YSAW3E9U9ctGwIAFlQPWCZCe4LpqPhkdTfWzgBjt04PstVZMFzIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9aSkKKc7WtnQVFW80/zLdDT1oTrC0xtTfmak4Yieus=;
 b=X3kt5knl63d8q0jq/vKxdF1iCEuu56/DL4kXcRhRx4j3ocLyBNbBsxtnpLO7TIgSpvundMgPYY/aD9f/i2jKvGjMw9gX3OJxqjAOGjpFWg2p4syA6aEUiDP9Dz9kGT2FgvuxTEk+15qiKlbOYL+LpS4AS/Iebu+spbtA8lu221DW+/KISReHnahTzri2xnYi8IHqajjyv0klpIDgIKpKsYLyd51067TSpsungZi05w3SLHAAchz1sIxUx5rGyJwWWPDUba2VpspfLS10skUPR7Rp1K5oxMQD+bxZVOZaA0n45kclZ1rv37VhrOKGhwW0Bu10kuZA7G9u5pziLBR5Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA3PR12MB176418.namprd12.prod.outlook.com (2603:10b6:806:513::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 12:26:33 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 12:26:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 21:26:29 +0900
Message-Id: <DLHL9KBOH0I3.FBEIRPGX0U5D@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] rust: const_eval: add a mechanism to do const
 trait calls
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
 <CANiq72mgqhjAYR-a5gSnMjK++TVc1n6RFpj=Go6QqXtQRX3=9g@mail.gmail.com>
 <DL5SQWU5QH9S.1F1V38FAA5Y4Q@garyguo.net>
 <DL8Z2OZLK8KS.1KVH6W27ZTOWG@nvidia.com>
 <DLAUXSH2302V.2OKAZYA7XOEEF@garyguo.net>
In-Reply-To: <DLAUXSH2302V.2OKAZYA7XOEEF@garyguo.net>
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SA3PR12MB176418:EE_
X-MS-Office365-Filtering-Correlation-Id: 822f72bd-c4f2-45e6-6979-08df14b6e890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10070799003|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B+r8SKpx/LaNXrL73gNL4ONxrVSnzcc/bm/WJegnRNqPhfJoWTJWYTaYbAnomZCPR97sZKC7pcjNDJIVjX9KivuoyVekDC9X/f1J9R+u6bc1X9lvrgpiObCS626z8Hnxi8uHVKeUIWh7cxK9KtjQ/9KFFC3XKabdlo0LU8zilh+s86TPWlqBKDtz2qtqpw0I8FSigBmW9+TEIoD67+/IahdCUj/Cbywt4qWp3kaIss2cO0Fpppkm3sQNP1ZkkVK0s6wwf2Hrk2KZuD30VZ4QoRttlJWG9d4aUpgTLSY81Q1jYwHUoOCnuVGd+fcdIKbbbAMxfWlZtDOONXp5v2+bzP04fQjT87LF9nVv6hfx8NsmGLxJz7dZ2m7cMXLRXv16WDpjYD/ifPO8N+bVfjojo57ZBp1rNv7y7ZUPDKUT3p2wpgXx30lx2SxRrUudMDkQ+LIjsMy/Tqu2JmxcO8A8YRVp8CkbagD+j7DOHj7/eSrHW16ZY9uAygzsOqOBzB1JJfavJwcU7AIR2rjhh7DSx/Rv2QxJmqt9cclKnIBuL1gBRYt/5RPVo6ttQo2nZFQgpvBzMQzP8ukdcNDKmfPNTKBo+EjfWAi7i7dD2laIFSn8ov/6J7cgeS9HF1zkyeK9n1GnRA2tgu1naYmmkY9F56GZ7M8e/T5VY7547DHJWnA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10070799003)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d29JNTMxUzh2QjREcWVVbTZ1ZlhPT3BwOEticFNkdHlWTVFsWThrMWxaZlFn?=
 =?utf-8?B?dUkwZll3Y1V5QUZuYW55Q1h0SkV2bGJVcWhPcVhmRm5CRW5IWUZ6VjUvZjhC?=
 =?utf-8?B?RGhRQ29LSWd3K2JPRHRDUUZTS0VUeDF6WUlCbVYwdGJ1V0hCSHlNTHBDcEUv?=
 =?utf-8?B?U3d1MkZVN3pScDlxS3hvQW1FM0d3NStFaHZtREVkOVFrYWVhVHVNc2hLR1Vn?=
 =?utf-8?B?MWtXU3J6U1c1dWRTblZzM2hFRTAwTWRNU2xtVEF0cE8xSVRjRlY1cm9NT1RM?=
 =?utf-8?B?SkdoVFRzNHVMUEdjdDlHczgrdWdleGZidHJQWFg0YjJuY0l3KzExWEtZRlJu?=
 =?utf-8?B?cC9heWhqQVJpMktFbWg4amNJWUVqTm8xNW4yMi9LbExYOU5FckRTYkFKN1BR?=
 =?utf-8?B?SndvSVZKL0d5TzR4R1loSXpTa2dqVXlMeHJyeko4Rk9lVSt2czJxdVBQR0RN?=
 =?utf-8?B?NWw5SVd0blZOTDNDRk53NHlGYURMNVhSTlFaM2Jzb0ZxbjVFY0J2ano2bmF0?=
 =?utf-8?B?bkcwNEtuTHlJWFVVWkVvQTE1N04rS3dJRWNFK2hMU2dJcFZFYUg4emM4MWJm?=
 =?utf-8?B?dHB3SGNibTdoTnJMQmYrUkw5aEdpMDdNS21NRXFvWVJ6RUtpQUord0d4U3NN?=
 =?utf-8?B?c1BMd2FFYmh1VXEzY0tVZXcrcXNQbTczNCtoM3JyWHl4RkE4cHE2Rm5mZ0Fm?=
 =?utf-8?B?eXg5Y0RiRys1dit3MUQ2b1pNR1JGNDE5SlVraDAxL29XekNRNEtEcFQyc01G?=
 =?utf-8?B?TGlneU5EZTBld0NueXZPVTZ0TDBtVnQrNEs3SFRJL3FpZXE2UFpSb0VYUmVh?=
 =?utf-8?B?V20yOWEzNFZoSVJxaGN6R1RxZHdBUjliMzR0QmlUWW51Mnp4ZXZteVVaNHVk?=
 =?utf-8?B?QnlnQTBISFVVYm56REF4WFBwN05wa3pzSnZTMk0vZVBTTmRBaVBJN1hhdWI0?=
 =?utf-8?B?bWJZdTJ2eVJ5aDZ2V3I2ZVBKVkVwN29yUVBwSUsxdnF4SUZMZlpPUnpMUklk?=
 =?utf-8?B?aTBNdWJwbnZPS2xBSlZ5LytRRytYNVdROXFHVzlEelZ5WFlKVDZ0TDIxUzI2?=
 =?utf-8?B?T2VrVXZlUWJJTE82UlpIemJ4cWJyeE8za2Rvd1Fkby8xM2Q5SXBNN090SXhL?=
 =?utf-8?B?NmV1MDdVM3hKMGNNK3R3cFlzZnVYZVY0bmJUQ3F3S29MVCtXMjVJRnd3cGJw?=
 =?utf-8?B?RnVJTEJpaHpYaC9xZ29tOUNIOU52dEhsRWpwMzFReFlIRDMvVVA5ZUFEN0RZ?=
 =?utf-8?B?VHFSamdML0lpQmtpd2kwdEQxTnh6RlpsTXNSUXJ3WEFWbXdmc0JlenpXYm00?=
 =?utf-8?B?RU5sRFZZc3Y1K1dqZFhZS3kvRVF0Ump4eEQ3RzcwUG9CWkQwR0lWbEcreHBR?=
 =?utf-8?B?ZDViRkIzendGZmVJUmZ2UGhUeGxkSmtFYzVTMEFsc1JpNkJjNWtWWGN2TGk0?=
 =?utf-8?B?eFNDVVE4eEsvWE12bUlxL2FRR2hEeVJKYU91QzBSbGRMMFE4dzJXWUxyZVA0?=
 =?utf-8?B?eEo3MElxeGZmbkVxWWlXbkF5K3JxQjV4c1g2djAxdzliNkxhZ05EY0t0Ynd1?=
 =?utf-8?B?cjFWVXRsUFBoSGExNitEMUxkeEkyQWFJWXBJc1hxMWpyOXZYSzhsZ0taOU9D?=
 =?utf-8?B?bmdxczBBK2c0Z3FGN2lObEx2T2NwTk5nRnF2dEVNcnlZbW5CbHdUQnl5WVov?=
 =?utf-8?B?eWgwSEFSVFNiUDUwMlBoaXJtMEZERWIyU2UyZDZ6U0lsQXYvYzY2ZFNzbExz?=
 =?utf-8?B?Tjkwajl5SUY5b0UxZEVBamR1S0hpSGltc2I2REJOazVkTGpuQ3pzQ2N2VmdF?=
 =?utf-8?B?eHJPSDBHazB6cEZqcUFvSng1Rlc2TzNacXRFZmRzRFNyQTIzQ2Jtci9KQml5?=
 =?utf-8?B?dHdSSit1ZVptS2JjQTdRZW4ybWluK3lqSExuWkRZWHpwUFQvZGZjUnAwU1Q5?=
 =?utf-8?B?YW5CSldYMWNlM2RCdTBpQ2E5YTFVMzVMVU01SXZHWTBVQXdjcUtDUG8xeTQ4?=
 =?utf-8?B?SWJTbHpSU3Z1Y3kvWjQzTkY2N01SbDl2UFdkMjkwU0doNzFXOU42eVNSOVY4?=
 =?utf-8?B?ODZrajNhMGtMa1FJVEtaaHd1cy9lZEIwVkJVc2VOQllJVS9ETnFDUU1QYU5i?=
 =?utf-8?B?a3BRZmV2cG9RUmxlNXUrZHBrbkowN3dzbmowNkVmSkJFTnpjVTFsam00aGtL?=
 =?utf-8?B?bnJSQ2NiQUtxZlhYbkMxamtxc1BUd2Nrbmlha2xyelZYbk9NOGRYSEFXRGh0?=
 =?utf-8?B?UG43dGxma1drRzZYYlN6ZS9pWDM4RnRHTVpGeFV2L0FuajhlenRiZ2JBd1l1?=
 =?utf-8?B?T3hWc1ZTMk1pRnQxa25odHBGZ2MrcDNWdGN4TFErcjhjZE5scEZ2cmdBMU0x?=
 =?utf-8?Q?avHj3veemDlGBtJipgbGBoEMHW13QwlntUA+4wZcqTJuh?=
X-MS-Exchange-AntiSpam-MessageData-1: kpThwvzejkp3uQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822f72bd-c4f2-45e6-6979-08df14b6e890
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 12:26:32.9946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaxK2SrRyOAel2STOUe7+cp8V9HMLErcmDkJajrdaCFeQoJ15WiM1hEErjb7rFaZrIy14lxh4nhH1+ww5MtTNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB176418

On Wed Sep 9, 2026 at 11:32 PM JST, Gary Guo wrote:
> On Mon Sep 7, 2026 at 10:21 AM BST, Eliot Courtney wrote:
>> On Fri Sep 4, 2026 at 12:46 AM JST, Gary Guo wrote:
>>> On Thu Sep 3, 2026 at 4:34 PM BST, Miguel Ojeda wrote:
>>>> On Thu, Sep 3, 2026 at 5:21=E2=80=AFPM Gary Guo <gary@garyguo.net> wro=
te:
>>>>>
>>>>> Add a mechanism to perform const trait method calls, with the same ty=
pe
>>>>> inference capabilities. This would only work for concrete types (not =
inside
>>>>> generic functions).
>>>>>
>>>>> As an example, convert `as_char_ptr_in_const_context`, so instead of
>>>>>
>>>>>     kernel::str::as_char_ptr_in_const_context(c_str)
>>>>>
>>>>> one may write
>>>>>
>>>>>     const_call!(c_str.as_char_ptr())
>>>>>
>>>>> instead.
>>>>>
>>>>> Signed-off-by: Gary Guo <gary@garyguo.net>
>>>>
>>>> Thanks for resending this!
>>>>
>>>> So I definitely like having `#[const_eval_only]`, because we do want
>>>> to limit those calls sometimes and it is nice to have C++'s equivalent
>>>> to `consteval` (perhaps this could be called just `#[consteval]` to
>>>> match?); i.e. what we talked about in the call.
>
> I'm okay with either. I put in `_only` because I think it makes it very c=
lear
> that this is not just const-evalutable (that's provided by `const`) and i=
s
> *always* const evaled.
>
>>>>
>>>> On `Const` and `const_call!`, i.e. the other two patches: I am not
>>>> sure if we care that much to introduce a macro for it, but it doesn't
>>>> look bad either. I guess perhaps it helps to have a consistent way to
>>>> do it and to easily remove it later when the actual feature lands in
>>>> Rust. I would like to hear some thoughts on it from others.
>
>>>
>>> I think it's good to have such macro compared to our current approach; =
it can be
>>> made into a identity macro once we have const trait impl.
>>>
>>> FWIW, I even considered an extra macro that allow you to write
>>>
>>>     #[const_trait_impl] // #[const_trait_impl(foreign)] for core types
>>>     impl MyTrait for MyType {}
>>>
>>> and generate the `impl Const` part too (and also add a line to the docu=
mentation
>>> that the method is const-callable with `const_call!()`).
>>>
>>> Best,
>>> Gary
>>
>> I agree with the consteval macro, that sounds very nice.
>>
>> On the const_call! I have similar thoughts to Miguel. I reckon if we
>> have a bunch of prospective users of this right now, and some thoughts
>> on what would use this in the future then it's good. If it's just one
>> use case right now, then not so sure.
>
> Some other candidates include `Alignable` (we currently have a "const_ali=
gn_up")
> and maybe `IntoSafeCast`.
>
> Best,
> Gary

I'm definitely not opposed to a const trait polyfill, it's pretty cool
actually IMO. I also do think there is a bit of survivorship bias on the
argument (which I made) that there are not many users. And it can be
removed once const traits become available in MSRV. I am keen to hear
from others on this.
